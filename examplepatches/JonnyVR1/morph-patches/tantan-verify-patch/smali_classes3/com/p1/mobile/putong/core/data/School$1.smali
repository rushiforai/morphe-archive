.class Lcom/p1/mobile/putong/core/data/School$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/School;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/School;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/School;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/School;->id:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/School;->name:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/School;->pinyin:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/School;->firstLetter:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/School;->level:Lcom/p1/mobile/putong/core/data/SchoolLevel;

    .line 43
    .line 44
    if-eqz v0, :cond_4

    .line 45
    .line 46
    const/4 v1, 0x5

    .line 47
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    add-int/2addr p0, v0

    .line 56
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/School;->region:Lcom/p1/mobile/putong/data/Region;

    .line 57
    .line 58
    if-eqz v0, :cond_5

    .line 59
    .line 60
    const/4 v1, 0x6

    .line 61
    sget-object v2, Lcom/p1/mobile/putong/data/Region;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 62
    .line 63
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    add-int/2addr p0, v0

    .line 68
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/School;->level:Lcom/p1/mobile/putong/core/data/SchoolLevel;

    .line 69
    .line 70
    if-eqz v0, :cond_6

    .line 71
    .line 72
    const/4 v1, 0x7

    .line 73
    sget-object v2, Lcom/p1/mobile/putong/core/data/SchoolLevel;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 74
    .line 75
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    add-int/2addr p0, v0

    .line 80
    :cond_6
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 81
    .line 82
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 83
    check-cast p1, Lcom/p1/mobile/putong/core/data/School;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/School$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/School;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/School;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/School;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/School;-><init>()V

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
    if-eqz v2, :cond_b

    .line 15
    .line 16
    const/16 v4, 0xa

    .line 17
    .line 18
    if-eq v2, v4, :cond_a

    .line 19
    .line 20
    const/16 v4, 0x12

    .line 21
    .line 22
    if-eq v2, v4, :cond_9

    .line 23
    .line 24
    const/16 v4, 0x1a

    .line 25
    .line 26
    if-eq v2, v4, :cond_8

    .line 27
    .line 28
    const/16 v4, 0x22

    .line 29
    .line 30
    if-eq v2, v4, :cond_7

    .line 31
    .line 32
    const/16 v4, 0x28

    .line 33
    .line 34
    if-eq v2, v4, :cond_6

    .line 35
    .line 36
    const/16 v4, 0x32

    .line 37
    .line 38
    if-eq v2, v4, :cond_5

    .line 39
    .line 40
    const/16 v4, 0x3a

    .line 41
    .line 42
    if-eq v2, v4, :cond_4

    .line 43
    .line 44
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/School;->level:Lcom/p1/mobile/putong/core/data/SchoolLevel;

    .line 45
    .line 46
    if-nez p1, :cond_0

    .line 47
    .line 48
    if-eqz v1, :cond_0

    .line 49
    .line 50
    sget-object p1, Lcom/p1/mobile/putong/core/data/SchoolLevel;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 51
    .line 52
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    check-cast p1, Lcom/p1/mobile/putong/core/data/SchoolLevel;

    .line 61
    .line 62
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/School;->level:Lcom/p1/mobile/putong/core/data/SchoolLevel;

    .line 63
    .line 64
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/School;->id:Ljava/lang/String;

    .line 65
    .line 66
    if-nez p1, :cond_1

    .line 67
    .line 68
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/School;->id:Ljava/lang/String;

    .line 69
    .line 70
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/School;->name:Ljava/lang/String;

    .line 71
    .line 72
    if-nez p1, :cond_2

    .line 73
    .line 74
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/School;->name:Ljava/lang/String;

    .line 75
    .line 76
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/School;->pinyin:Ljava/lang/String;

    .line 77
    .line 78
    if-nez p1, :cond_3

    .line 79
    .line 80
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/School;->pinyin:Ljava/lang/String;

    .line 81
    .line 82
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/School;->firstLetter:Ljava/lang/String;

    .line 83
    .line 84
    if-nez p1, :cond_10

    .line 85
    .line 86
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/School;->firstLetter:Ljava/lang/String;

    .line 87
    .line 88
    return-object p0

    .line 89
    :cond_4
    sget-object v2, Lcom/p1/mobile/putong/core/data/SchoolLevel;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 90
    .line 91
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    check-cast v2, Lcom/p1/mobile/putong/core/data/SchoolLevel;

    .line 96
    .line 97
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/School;->level:Lcom/p1/mobile/putong/core/data/SchoolLevel;

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_5
    sget-object v2, Lcom/p1/mobile/putong/data/Region;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 101
    .line 102
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    check-cast v2, Lcom/p1/mobile/putong/data/Region;

    .line 107
    .line 108
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/School;->region:Lcom/p1/mobile/putong/data/Region;

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    goto :goto_0

    .line 120
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v2

    .line 124
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/School;->firstLetter:Ljava/lang/String;

    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v2

    .line 131
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/School;->pinyin:Ljava/lang/String;

    .line 132
    .line 133
    goto :goto_0

    .line 134
    :cond_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v2

    .line 138
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/School;->name:Ljava/lang/String;

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :cond_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v2

    .line 146
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/School;->id:Ljava/lang/String;

    .line 147
    .line 148
    goto/16 :goto_0

    .line 149
    .line 150
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/School;->level:Lcom/p1/mobile/putong/core/data/SchoolLevel;

    .line 151
    .line 152
    if-nez p1, :cond_c

    .line 153
    .line 154
    if-eqz v1, :cond_c

    .line 155
    .line 156
    sget-object p1, Lcom/p1/mobile/putong/core/data/SchoolLevel;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 157
    .line 158
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 159
    .line 160
    .line 161
    move-result v1

    .line 162
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    check-cast p1, Lcom/p1/mobile/putong/core/data/SchoolLevel;

    .line 167
    .line 168
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/School;->level:Lcom/p1/mobile/putong/core/data/SchoolLevel;

    .line 169
    .line 170
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/School;->id:Ljava/lang/String;

    .line 171
    .line 172
    if-nez p1, :cond_d

    .line 173
    .line 174
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/School;->id:Ljava/lang/String;

    .line 175
    .line 176
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/School;->name:Ljava/lang/String;

    .line 177
    .line 178
    if-nez p1, :cond_e

    .line 179
    .line 180
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/School;->name:Ljava/lang/String;

    .line 181
    .line 182
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/School;->pinyin:Ljava/lang/String;

    .line 183
    .line 184
    if-nez p1, :cond_f

    .line 185
    .line 186
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/School;->pinyin:Ljava/lang/String;

    .line 187
    .line 188
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/School;->firstLetter:Ljava/lang/String;

    .line 189
    .line 190
    if-nez p1, :cond_10

    .line 191
    .line 192
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/School;->firstLetter:Ljava/lang/String;

    .line 193
    .line 194
    :cond_10
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 195
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/School$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/School;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/School;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/School;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/School;->name:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/School;->pinyin:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/School;->firstLetter:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/School;->level:Lcom/p1/mobile/putong/core/data/SchoolLevel;

    .line 34
    .line 35
    if-eqz p0, :cond_4

    .line 36
    .line 37
    const/4 v0, 0x5

    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 43
    .line 44
    .line 45
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/School;->region:Lcom/p1/mobile/putong/data/Region;

    .line 46
    .line 47
    if-eqz p0, :cond_5

    .line 48
    .line 49
    const/4 v0, 0x6

    .line 50
    sget-object v1, Lcom/p1/mobile/putong/data/Region;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 51
    .line 52
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 53
    .line 54
    .line 55
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/School;->level:Lcom/p1/mobile/putong/core/data/SchoolLevel;

    .line 56
    .line 57
    if-eqz p0, :cond_6

    .line 58
    .line 59
    const/4 p1, 0x7

    .line 60
    sget-object v0, Lcom/p1/mobile/putong/core/data/SchoolLevel;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 61
    .line 62
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 63
    .line 64
    .line 65
    :cond_6
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 66
    check-cast p1, Lcom/p1/mobile/putong/core/data/School;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/School$1;->serialize(Lcom/p1/mobile/putong/core/data/School;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
