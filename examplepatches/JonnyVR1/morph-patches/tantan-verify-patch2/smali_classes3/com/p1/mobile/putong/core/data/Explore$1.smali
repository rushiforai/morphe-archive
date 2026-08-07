.class Lcom/p1/mobile/putong/core/data/Explore$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/Explore;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/Explore;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/Explore;)I
    .locals 2

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Explore;->cards:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/data/CardInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-static {v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    :goto_0
    const/4 v0, 0x2

    .line 19
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/Explore;->can_swiped:Z

    .line 20
    .line 21
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    add-int/2addr p0, v0

    .line 26
    const/4 v0, 0x3

    .line 27
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/Explore;->matched:Z

    .line 28
    .line 29
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    add-int/2addr p0, v0

    .line 34
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Explore;->background_color:Ljava/lang/String;

    .line 35
    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    const/4 v1, 0x4

    .line 39
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    add-int/2addr p0, v0

    .line 44
    :cond_1
    const/4 v0, 0x5

    .line 45
    iget v1, p1, Lcom/p1/mobile/putong/core/data/Explore;->Remaining_swipes:I

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
    iget v1, p1, Lcom/p1/mobile/putong/core/data/Explore;->remaining_likes:I

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Explore;->pop_up_icon:Ljava/lang/String;

    .line 61
    .line 62
    if-eqz v0, :cond_2

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
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Explore;->pop_up_title:Ljava/lang/String;

    .line 71
    .line 72
    if-eqz v0, :cond_3

    .line 73
    .line 74
    const/16 v1, 0x8

    .line 75
    .line 76
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    add-int/2addr p0, v0

    .line 81
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Explore;->pop_up_sub_title:Ljava/lang/String;

    .line 82
    .line 83
    if-eqz v0, :cond_4

    .line 84
    .line 85
    const/16 v1, 0x9

    .line 86
    .line 87
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    add-int/2addr p0, v0

    .line 92
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Explore;->skip:Ljava/lang/String;

    .line 93
    .line 94
    if-eqz v0, :cond_5

    .line 95
    .line 96
    const/16 v1, 0xa

    .line 97
    .line 98
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    add-int/2addr p0, v0

    .line 103
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Explore;->tag_icon:Ljava/lang/String;

    .line 104
    .line 105
    if-eqz v0, :cond_6

    .line 106
    .line 107
    const/16 v1, 0xb

    .line 108
    .line 109
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    add-int/2addr p0, v0

    .line 114
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Explore;->tag_background_color:Ljava/lang/String;

    .line 115
    .line 116
    if-eqz v0, :cond_7

    .line 117
    .line 118
    const/16 v1, 0xc

    .line 119
    .line 120
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    add-int/2addr p0, v0

    .line 125
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Explore;->new_pop_up_title:Ljava/lang/String;

    .line 126
    .line 127
    if-eqz v0, :cond_8

    .line 128
    .line 129
    const/16 v1, 0xd

    .line 130
    .line 131
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    add-int/2addr p0, v0

    .line 136
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Explore;->new_pop_up_sub_title:Ljava/lang/String;

    .line 137
    .line 138
    if-eqz v0, :cond_9

    .line 139
    .line 140
    const/16 v1, 0xe

    .line 141
    .line 142
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 143
    .line 144
    .line 145
    move-result v0

    .line 146
    add-int/2addr p0, v0

    .line 147
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Explore;->new_pop_up_box_title:Ljava/lang/String;

    .line 148
    .line 149
    if-eqz v0, :cond_a

    .line 150
    .line 151
    const/16 v1, 0xf

    .line 152
    .line 153
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    add-int/2addr p0, v0

    .line 158
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Explore;->new_pop_up_warning:Ljava/lang/String;

    .line 159
    .line 160
    if-eqz v0, :cond_b

    .line 161
    .line 162
    const/16 v1, 0x10

    .line 163
    .line 164
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 165
    .line 166
    .line 167
    move-result v0

    .line 168
    add-int/2addr p0, v0

    .line 169
    :cond_b
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 170
    .line 171
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 172
    check-cast p1, Lcom/p1/mobile/putong/core/data/Explore;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/Explore$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/Explore;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/Explore;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/Explore;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/Explore;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Explore;->cards:Ljava/util/List;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    new-instance p1, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Explore;->cards:Ljava/util/List;

    .line 25
    .line 26
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Explore;->background_color:Ljava/lang/String;

    .line 27
    .line 28
    if-nez p1, :cond_1

    .line 29
    .line 30
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Explore;->background_color:Ljava/lang/String;

    .line 31
    .line 32
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Explore;->pop_up_icon:Ljava/lang/String;

    .line 33
    .line 34
    if-nez p1, :cond_2

    .line 35
    .line 36
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Explore;->pop_up_icon:Ljava/lang/String;

    .line 37
    .line 38
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Explore;->pop_up_title:Ljava/lang/String;

    .line 39
    .line 40
    if-nez p1, :cond_3

    .line 41
    .line 42
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Explore;->pop_up_title:Ljava/lang/String;

    .line 43
    .line 44
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Explore;->pop_up_sub_title:Ljava/lang/String;

    .line 45
    .line 46
    if-nez p1, :cond_4

    .line 47
    .line 48
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Explore;->pop_up_sub_title:Ljava/lang/String;

    .line 49
    .line 50
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Explore;->skip:Ljava/lang/String;

    .line 51
    .line 52
    if-nez p1, :cond_5

    .line 53
    .line 54
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Explore;->skip:Ljava/lang/String;

    .line 55
    .line 56
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Explore;->tag_icon:Ljava/lang/String;

    .line 57
    .line 58
    if-nez p1, :cond_6

    .line 59
    .line 60
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Explore;->tag_icon:Ljava/lang/String;

    .line 61
    .line 62
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Explore;->tag_background_color:Ljava/lang/String;

    .line 63
    .line 64
    if-nez p1, :cond_7

    .line 65
    .line 66
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Explore;->tag_background_color:Ljava/lang/String;

    .line 67
    .line 68
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Explore;->new_pop_up_title:Ljava/lang/String;

    .line 69
    .line 70
    if-nez p1, :cond_8

    .line 71
    .line 72
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Explore;->new_pop_up_title:Ljava/lang/String;

    .line 73
    .line 74
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Explore;->new_pop_up_sub_title:Ljava/lang/String;

    .line 75
    .line 76
    if-nez p1, :cond_9

    .line 77
    .line 78
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Explore;->new_pop_up_sub_title:Ljava/lang/String;

    .line 79
    .line 80
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Explore;->new_pop_up_box_title:Ljava/lang/String;

    .line 81
    .line 82
    if-nez p1, :cond_a

    .line 83
    .line 84
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Explore;->new_pop_up_box_title:Ljava/lang/String;

    .line 85
    .line 86
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Explore;->new_pop_up_warning:Ljava/lang/String;

    .line 87
    .line 88
    if-nez p1, :cond_16

    .line 89
    .line 90
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Explore;->new_pop_up_warning:Ljava/lang/String;

    .line 91
    .line 92
    return-object p0

    .line 93
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Explore;->new_pop_up_warning:Ljava/lang/String;

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Explore;->new_pop_up_box_title:Ljava/lang/String;

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Explore;->new_pop_up_sub_title:Ljava/lang/String;

    .line 112
    .line 113
    goto :goto_0

    .line 114
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Explore;->new_pop_up_title:Ljava/lang/String;

    .line 119
    .line 120
    goto :goto_0

    .line 121
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Explore;->tag_background_color:Ljava/lang/String;

    .line 126
    .line 127
    goto :goto_0

    .line 128
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Explore;->tag_icon:Ljava/lang/String;

    .line 133
    .line 134
    goto/16 :goto_0

    .line 135
    .line 136
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Explore;->skip:Ljava/lang/String;

    .line 141
    .line 142
    goto/16 :goto_0

    .line 143
    .line 144
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Explore;->pop_up_sub_title:Ljava/lang/String;

    .line 149
    .line 150
    goto/16 :goto_0

    .line 151
    .line 152
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Explore;->pop_up_title:Ljava/lang/String;

    .line 157
    .line 158
    goto/16 :goto_0

    .line 159
    .line 160
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Explore;->pop_up_icon:Ljava/lang/String;

    .line 165
    .line 166
    goto/16 :goto_0

    .line 167
    .line 168
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 169
    .line 170
    .line 171
    move-result v0

    .line 172
    iput v0, p0, Lcom/p1/mobile/putong/core/data/Explore;->remaining_likes:I

    .line 173
    .line 174
    goto/16 :goto_0

    .line 175
    .line 176
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 177
    .line 178
    .line 179
    move-result v0

    .line 180
    iput v0, p0, Lcom/p1/mobile/putong/core/data/Explore;->Remaining_swipes:I

    .line 181
    .line 182
    goto/16 :goto_0

    .line 183
    .line 184
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Explore;->background_color:Ljava/lang/String;

    .line 189
    .line 190
    goto/16 :goto_0

    .line 191
    .line 192
    :sswitch_d
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 193
    .line 194
    .line 195
    move-result v0

    .line 196
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/Explore;->matched:Z

    .line 197
    .line 198
    goto/16 :goto_0

    .line 199
    .line 200
    :sswitch_e
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 201
    .line 202
    .line 203
    move-result v0

    .line 204
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/Explore;->can_swiped:Z

    .line 205
    .line 206
    goto/16 :goto_0

    .line 207
    .line 208
    :sswitch_f
    sget-object v0, Lcom/p1/mobile/putong/core/data/CardInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 209
    .line 210
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 211
    .line 212
    .line 213
    move-result-object v0

    .line 214
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 215
    .line 216
    .line 217
    move-result-object v0

    .line 218
    check-cast v0, Ljava/util/List;

    .line 219
    .line 220
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Explore;->cards:Ljava/util/List;

    .line 221
    .line 222
    goto/16 :goto_0

    .line 223
    .line 224
    :sswitch_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Explore;->cards:Ljava/util/List;

    .line 225
    .line 226
    if-nez p1, :cond_b

    .line 227
    .line 228
    new-instance p1, Ljava/util/ArrayList;

    .line 229
    .line 230
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 231
    .line 232
    .line 233
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Explore;->cards:Ljava/util/List;

    .line 234
    .line 235
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Explore;->background_color:Ljava/lang/String;

    .line 236
    .line 237
    if-nez p1, :cond_c

    .line 238
    .line 239
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Explore;->background_color:Ljava/lang/String;

    .line 240
    .line 241
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Explore;->pop_up_icon:Ljava/lang/String;

    .line 242
    .line 243
    if-nez p1, :cond_d

    .line 244
    .line 245
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Explore;->pop_up_icon:Ljava/lang/String;

    .line 246
    .line 247
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Explore;->pop_up_title:Ljava/lang/String;

    .line 248
    .line 249
    if-nez p1, :cond_e

    .line 250
    .line 251
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Explore;->pop_up_title:Ljava/lang/String;

    .line 252
    .line 253
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Explore;->pop_up_sub_title:Ljava/lang/String;

    .line 254
    .line 255
    if-nez p1, :cond_f

    .line 256
    .line 257
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Explore;->pop_up_sub_title:Ljava/lang/String;

    .line 258
    .line 259
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Explore;->skip:Ljava/lang/String;

    .line 260
    .line 261
    if-nez p1, :cond_10

    .line 262
    .line 263
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Explore;->skip:Ljava/lang/String;

    .line 264
    .line 265
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Explore;->tag_icon:Ljava/lang/String;

    .line 266
    .line 267
    if-nez p1, :cond_11

    .line 268
    .line 269
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Explore;->tag_icon:Ljava/lang/String;

    .line 270
    .line 271
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Explore;->tag_background_color:Ljava/lang/String;

    .line 272
    .line 273
    if-nez p1, :cond_12

    .line 274
    .line 275
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Explore;->tag_background_color:Ljava/lang/String;

    .line 276
    .line 277
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Explore;->new_pop_up_title:Ljava/lang/String;

    .line 278
    .line 279
    if-nez p1, :cond_13

    .line 280
    .line 281
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Explore;->new_pop_up_title:Ljava/lang/String;

    .line 282
    .line 283
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Explore;->new_pop_up_sub_title:Ljava/lang/String;

    .line 284
    .line 285
    if-nez p1, :cond_14

    .line 286
    .line 287
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Explore;->new_pop_up_sub_title:Ljava/lang/String;

    .line 288
    .line 289
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Explore;->new_pop_up_box_title:Ljava/lang/String;

    .line 290
    .line 291
    if-nez p1, :cond_15

    .line 292
    .line 293
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Explore;->new_pop_up_box_title:Ljava/lang/String;

    .line 294
    .line 295
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Explore;->new_pop_up_warning:Ljava/lang/String;

    .line 296
    .line 297
    if-nez p1, :cond_16

    .line 298
    .line 299
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Explore;->new_pop_up_warning:Ljava/lang/String;

    .line 300
    .line 301
    :cond_16
    return-object p0

    .line 302
    nop

    .line 303
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_10
        0xa -> :sswitch_f
        0x10 -> :sswitch_e
        0x18 -> :sswitch_d
        0x22 -> :sswitch_c
        0x28 -> :sswitch_b
        0x30 -> :sswitch_a
        0x3a -> :sswitch_9
        0x42 -> :sswitch_8
        0x4a -> :sswitch_7
        0x52 -> :sswitch_6
        0x5a -> :sswitch_5
        0x62 -> :sswitch_4
        0x6a -> :sswitch_3
        0x72 -> :sswitch_2
        0x7a -> :sswitch_1
        0x82 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 303
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/Explore$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/Explore;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/Explore;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Explore;->cards:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/data/CardInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    const/4 p0, 0x2

    .line 16
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/Explore;->can_swiped:Z

    .line 17
    .line 18
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 19
    .line 20
    .line 21
    const/4 p0, 0x3

    .line 22
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/Explore;->matched:Z

    .line 23
    .line 24
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Explore;->background_color:Ljava/lang/String;

    .line 28
    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    const/4 v0, 0x4

    .line 32
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_1
    const/4 p0, 0x5

    .line 36
    iget v0, p1, Lcom/p1/mobile/putong/core/data/Explore;->Remaining_swipes:I

    .line 37
    .line 38
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 39
    .line 40
    .line 41
    const/4 p0, 0x6

    .line 42
    iget v0, p1, Lcom/p1/mobile/putong/core/data/Explore;->remaining_likes:I

    .line 43
    .line 44
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 45
    .line 46
    .line 47
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Explore;->pop_up_icon:Ljava/lang/String;

    .line 48
    .line 49
    if-eqz p0, :cond_2

    .line 50
    .line 51
    const/4 v0, 0x7

    .line 52
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 53
    .line 54
    .line 55
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Explore;->pop_up_title:Ljava/lang/String;

    .line 56
    .line 57
    if-eqz p0, :cond_3

    .line 58
    .line 59
    const/16 v0, 0x8

    .line 60
    .line 61
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 62
    .line 63
    .line 64
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Explore;->pop_up_sub_title:Ljava/lang/String;

    .line 65
    .line 66
    if-eqz p0, :cond_4

    .line 67
    .line 68
    const/16 v0, 0x9

    .line 69
    .line 70
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 71
    .line 72
    .line 73
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Explore;->skip:Ljava/lang/String;

    .line 74
    .line 75
    if-eqz p0, :cond_5

    .line 76
    .line 77
    const/16 v0, 0xa

    .line 78
    .line 79
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 80
    .line 81
    .line 82
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Explore;->tag_icon:Ljava/lang/String;

    .line 83
    .line 84
    if-eqz p0, :cond_6

    .line 85
    .line 86
    const/16 v0, 0xb

    .line 87
    .line 88
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 89
    .line 90
    .line 91
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Explore;->tag_background_color:Ljava/lang/String;

    .line 92
    .line 93
    if-eqz p0, :cond_7

    .line 94
    .line 95
    const/16 v0, 0xc

    .line 96
    .line 97
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 98
    .line 99
    .line 100
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Explore;->new_pop_up_title:Ljava/lang/String;

    .line 101
    .line 102
    if-eqz p0, :cond_8

    .line 103
    .line 104
    const/16 v0, 0xd

    .line 105
    .line 106
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 107
    .line 108
    .line 109
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Explore;->new_pop_up_sub_title:Ljava/lang/String;

    .line 110
    .line 111
    if-eqz p0, :cond_9

    .line 112
    .line 113
    const/16 v0, 0xe

    .line 114
    .line 115
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 116
    .line 117
    .line 118
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Explore;->new_pop_up_box_title:Ljava/lang/String;

    .line 119
    .line 120
    if-eqz p0, :cond_a

    .line 121
    .line 122
    const/16 v0, 0xf

    .line 123
    .line 124
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 125
    .line 126
    .line 127
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Explore;->new_pop_up_warning:Ljava/lang/String;

    .line 128
    .line 129
    if-eqz p0, :cond_b

    .line 130
    .line 131
    const/16 p1, 0x10

    .line 132
    .line 133
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 134
    .line 135
    .line 136
    :cond_b
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 137
    check-cast p1, Lcom/p1/mobile/putong/core/data/Explore;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/Explore$1;->serialize(Lcom/p1/mobile/putong/core/data/Explore;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
