.class Lcom/p1/mobile/putong/core/data/SamesCardData$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/SamesCardData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/SamesCardData;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/SamesCardData;)I
    .locals 2

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SamesCardData;->id:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/SamesCardData;->type:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/SamesCardData;->tag_url:Ljava/lang/String;

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
    const/4 v0, 0x4

    .line 33
    iget v1, p1, Lcom/p1/mobile/putong/core/data/SamesCardData;->option:I

    .line 34
    .line 35
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    add-int/2addr p0, v0

    .line 40
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/SamesCardData;->icon_url:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/SamesCardData;->bg_color:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/SamesCardData;->font_color:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/SamesCardData;->bg_border_color:Ljava/lang/String;

    .line 71
    .line 72
    if-eqz v0, :cond_6

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
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/SamesCardData;->desc:Ljava/lang/String;

    .line 82
    .line 83
    if-eqz v0, :cond_7

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
    :cond_7
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 93
    .line 94
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 95
    check-cast p1, Lcom/p1/mobile/putong/core/data/SamesCardData;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/SamesCardData$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/SamesCardData;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/SamesCardData;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/SamesCardData;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/SamesCardData;-><init>()V

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
    if-eqz v0, :cond_10

    .line 13
    .line 14
    const/16 v2, 0xa

    .line 15
    .line 16
    if-eq v0, v2, :cond_f

    .line 17
    .line 18
    const/16 v2, 0x12

    .line 19
    .line 20
    if-eq v0, v2, :cond_e

    .line 21
    .line 22
    const/16 v2, 0x1a

    .line 23
    .line 24
    if-eq v0, v2, :cond_d

    .line 25
    .line 26
    const/16 v2, 0x20

    .line 27
    .line 28
    if-eq v0, v2, :cond_c

    .line 29
    .line 30
    const/16 v2, 0x2a

    .line 31
    .line 32
    if-eq v0, v2, :cond_b

    .line 33
    .line 34
    const/16 v2, 0x32

    .line 35
    .line 36
    if-eq v0, v2, :cond_a

    .line 37
    .line 38
    const/16 v2, 0x3a

    .line 39
    .line 40
    if-eq v0, v2, :cond_9

    .line 41
    .line 42
    const/16 v2, 0x42

    .line 43
    .line 44
    if-eq v0, v2, :cond_8

    .line 45
    .line 46
    const/16 v2, 0x4a

    .line 47
    .line 48
    if-eq v0, v2, :cond_7

    .line 49
    .line 50
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SamesCardData;->id:Ljava/lang/String;

    .line 51
    .line 52
    if-nez p1, :cond_0

    .line 53
    .line 54
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/SamesCardData;->id:Ljava/lang/String;

    .line 55
    .line 56
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SamesCardData;->type:Ljava/lang/String;

    .line 57
    .line 58
    if-nez p1, :cond_1

    .line 59
    .line 60
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/SamesCardData;->type:Ljava/lang/String;

    .line 61
    .line 62
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SamesCardData;->tag_url:Ljava/lang/String;

    .line 63
    .line 64
    if-nez p1, :cond_2

    .line 65
    .line 66
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/SamesCardData;->tag_url:Ljava/lang/String;

    .line 67
    .line 68
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SamesCardData;->icon_url:Ljava/lang/String;

    .line 69
    .line 70
    if-nez p1, :cond_3

    .line 71
    .line 72
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/SamesCardData;->icon_url:Ljava/lang/String;

    .line 73
    .line 74
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SamesCardData;->bg_color:Ljava/lang/String;

    .line 75
    .line 76
    if-nez p1, :cond_4

    .line 77
    .line 78
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/SamesCardData;->bg_color:Ljava/lang/String;

    .line 79
    .line 80
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SamesCardData;->font_color:Ljava/lang/String;

    .line 81
    .line 82
    if-nez p1, :cond_5

    .line 83
    .line 84
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/SamesCardData;->font_color:Ljava/lang/String;

    .line 85
    .line 86
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SamesCardData;->bg_border_color:Ljava/lang/String;

    .line 87
    .line 88
    if-nez p1, :cond_6

    .line 89
    .line 90
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/SamesCardData;->bg_border_color:Ljava/lang/String;

    .line 91
    .line 92
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SamesCardData;->desc:Ljava/lang/String;

    .line 93
    .line 94
    if-nez p1, :cond_18

    .line 95
    .line 96
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/SamesCardData;->desc:Ljava/lang/String;

    .line 97
    .line 98
    return-object p0

    .line 99
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/SamesCardData;->desc:Ljava/lang/String;

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/SamesCardData;->bg_border_color:Ljava/lang/String;

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/SamesCardData;->font_color:Ljava/lang/String;

    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/SamesCardData;->bg_color:Ljava/lang/String;

    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/SamesCardData;->icon_url:Ljava/lang/String;

    .line 132
    .line 133
    goto :goto_0

    .line 134
    :cond_c
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 135
    .line 136
    .line 137
    move-result v0

    .line 138
    iput v0, p0, Lcom/p1/mobile/putong/core/data/SamesCardData;->option:I

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :cond_d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/SamesCardData;->tag_url:Ljava/lang/String;

    .line 147
    .line 148
    goto/16 :goto_0

    .line 149
    .line 150
    :cond_e
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/SamesCardData;->type:Ljava/lang/String;

    .line 155
    .line 156
    goto/16 :goto_0

    .line 157
    .line 158
    :cond_f
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/SamesCardData;->id:Ljava/lang/String;

    .line 163
    .line 164
    goto/16 :goto_0

    .line 165
    .line 166
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SamesCardData;->id:Ljava/lang/String;

    .line 167
    .line 168
    if-nez p1, :cond_11

    .line 169
    .line 170
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/SamesCardData;->id:Ljava/lang/String;

    .line 171
    .line 172
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SamesCardData;->type:Ljava/lang/String;

    .line 173
    .line 174
    if-nez p1, :cond_12

    .line 175
    .line 176
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/SamesCardData;->type:Ljava/lang/String;

    .line 177
    .line 178
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SamesCardData;->tag_url:Ljava/lang/String;

    .line 179
    .line 180
    if-nez p1, :cond_13

    .line 181
    .line 182
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/SamesCardData;->tag_url:Ljava/lang/String;

    .line 183
    .line 184
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SamesCardData;->icon_url:Ljava/lang/String;

    .line 185
    .line 186
    if-nez p1, :cond_14

    .line 187
    .line 188
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/SamesCardData;->icon_url:Ljava/lang/String;

    .line 189
    .line 190
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SamesCardData;->bg_color:Ljava/lang/String;

    .line 191
    .line 192
    if-nez p1, :cond_15

    .line 193
    .line 194
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/SamesCardData;->bg_color:Ljava/lang/String;

    .line 195
    .line 196
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SamesCardData;->font_color:Ljava/lang/String;

    .line 197
    .line 198
    if-nez p1, :cond_16

    .line 199
    .line 200
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/SamesCardData;->font_color:Ljava/lang/String;

    .line 201
    .line 202
    :cond_16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SamesCardData;->bg_border_color:Ljava/lang/String;

    .line 203
    .line 204
    if-nez p1, :cond_17

    .line 205
    .line 206
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/SamesCardData;->bg_border_color:Ljava/lang/String;

    .line 207
    .line 208
    :cond_17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SamesCardData;->desc:Ljava/lang/String;

    .line 209
    .line 210
    if-nez p1, :cond_18

    .line 211
    .line 212
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/SamesCardData;->desc:Ljava/lang/String;

    .line 213
    .line 214
    :cond_18
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 215
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/SamesCardData$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/SamesCardData;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/SamesCardData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SamesCardData;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SamesCardData;->type:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SamesCardData;->tag_url:Ljava/lang/String;

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
    const/4 p0, 0x4

    .line 26
    iget v0, p1, Lcom/p1/mobile/putong/core/data/SamesCardData;->option:I

    .line 27
    .line 28
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SamesCardData;->icon_url:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SamesCardData;->bg_color:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SamesCardData;->font_color:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SamesCardData;->bg_border_color:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SamesCardData;->desc:Ljava/lang/String;

    .line 65
    .line 66
    if-eqz p0, :cond_7

    .line 67
    .line 68
    const/16 p1, 0x9

    .line 69
    .line 70
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 71
    .line 72
    .line 73
    :cond_7
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 74
    check-cast p1, Lcom/p1/mobile/putong/core/data/SamesCardData;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/SamesCardData$1;->serialize(Lcom/p1/mobile/putong/core/data/SamesCardData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
