.class Lcom/p1/mobile/putong/data/Banners$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/Banners;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/Banners;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/Banners;)I
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    iget v0, p1, Lcom/p1/mobile/putong/data/Banners;->id:I

    .line 3
    .line 4
    invoke-static {p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Banners;->loc:Lcom/p1/mobile/putong/data/BannerLoc;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const/4 v1, 0x2

    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    add-int/2addr p0, v0

    .line 22
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Banners;->action:Lcom/p1/mobile/putong/data/BannerAction;

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    const/4 v1, 0x3

    .line 27
    sget-object v2, Lcom/p1/mobile/putong/data/BannerAction;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 28
    .line 29
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    add-int/2addr p0, v0

    .line 34
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Banners;->content:Lcom/p1/mobile/putong/data/BannerContent;

    .line 35
    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    const/4 v1, 0x4

    .line 39
    sget-object v2, Lcom/p1/mobile/putong/data/BannerContent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 40
    .line 41
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    add-int/2addr p0, v0

    .line 46
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Banners;->loc:Lcom/p1/mobile/putong/data/BannerLoc;

    .line 47
    .line 48
    if-eqz v0, :cond_3

    .line 49
    .line 50
    const/4 v1, 0x5

    .line 51
    sget-object v2, Lcom/p1/mobile/putong/data/BannerLoc;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 52
    .line 53
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    add-int/2addr p0, v0

    .line 58
    :cond_3
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 59
    .line 60
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 61
    check-cast p1, Lcom/p1/mobile/putong/data/Banners;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/Banners$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/Banners;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/Banners;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/Banners;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/Banners;-><init>()V

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
    if-eqz v2, :cond_8

    .line 13
    .line 14
    const/16 v3, 0x8

    .line 15
    .line 16
    if-eq v2, v3, :cond_7

    .line 17
    .line 18
    const/16 v3, 0x10

    .line 19
    .line 20
    if-eq v2, v3, :cond_6

    .line 21
    .line 22
    const/16 v3, 0x1a

    .line 23
    .line 24
    if-eq v2, v3, :cond_5

    .line 25
    .line 26
    const/16 v3, 0x22

    .line 27
    .line 28
    if-eq v2, v3, :cond_4

    .line 29
    .line 30
    const/16 v3, 0x2a

    .line 31
    .line 32
    if-eq v2, v3, :cond_3

    .line 33
    .line 34
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Banners;->loc:Lcom/p1/mobile/putong/data/BannerLoc;

    .line 35
    .line 36
    if-nez p1, :cond_0

    .line 37
    .line 38
    if-eqz v1, :cond_0

    .line 39
    .line 40
    sget-object p1, Lcom/p1/mobile/putong/data/BannerLoc;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    check-cast p1, Lcom/p1/mobile/putong/data/BannerLoc;

    .line 51
    .line 52
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Banners;->loc:Lcom/p1/mobile/putong/data/BannerLoc;

    .line 53
    .line 54
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Banners;->loc:Lcom/p1/mobile/putong/data/BannerLoc;

    .line 55
    .line 56
    if-nez p1, :cond_1

    .line 57
    .line 58
    sget-object p1, Lcom/p1/mobile/putong/data/BannerLoc;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 59
    .line 60
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    check-cast p1, Lcom/p1/mobile/putong/data/BannerLoc;

    .line 65
    .line 66
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Banners;->loc:Lcom/p1/mobile/putong/data/BannerLoc;

    .line 67
    .line 68
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Banners;->action:Lcom/p1/mobile/putong/data/BannerAction;

    .line 69
    .line 70
    if-nez p1, :cond_2

    .line 71
    .line 72
    invoke-static {}, Lcom/p1/mobile/putong/data/BannerAction;->new_()Lcom/p1/mobile/putong/data/BannerAction;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Banners;->action:Lcom/p1/mobile/putong/data/BannerAction;

    .line 77
    .line 78
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Banners;->content:Lcom/p1/mobile/putong/data/BannerContent;

    .line 79
    .line 80
    if-nez p1, :cond_c

    .line 81
    .line 82
    invoke-static {}, Lcom/p1/mobile/putong/data/BannerContent;->new_()Lcom/p1/mobile/putong/data/BannerContent;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Banners;->content:Lcom/p1/mobile/putong/data/BannerContent;

    .line 87
    .line 88
    return-object p0

    .line 89
    :cond_3
    sget-object v2, Lcom/p1/mobile/putong/data/BannerLoc;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 90
    .line 91
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    check-cast v2, Lcom/p1/mobile/putong/data/BannerLoc;

    .line 96
    .line 97
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Banners;->loc:Lcom/p1/mobile/putong/data/BannerLoc;

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_4
    sget-object v2, Lcom/p1/mobile/putong/data/BannerContent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 101
    .line 102
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    check-cast v2, Lcom/p1/mobile/putong/data/BannerContent;

    .line 107
    .line 108
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Banners;->content:Lcom/p1/mobile/putong/data/BannerContent;

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_5
    sget-object v2, Lcom/p1/mobile/putong/data/BannerAction;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 112
    .line 113
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v2

    .line 117
    check-cast v2, Lcom/p1/mobile/putong/data/BannerAction;

    .line 118
    .line 119
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Banners;->action:Lcom/p1/mobile/putong/data/BannerAction;

    .line 120
    .line 121
    goto :goto_0

    .line 122
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 123
    .line 124
    .line 125
    move-result v1

    .line 126
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    goto :goto_0

    .line 131
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 132
    .line 133
    .line 134
    move-result v2

    .line 135
    iput v2, p0, Lcom/p1/mobile/putong/data/Banners;->id:I

    .line 136
    .line 137
    goto/16 :goto_0

    .line 138
    .line 139
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Banners;->loc:Lcom/p1/mobile/putong/data/BannerLoc;

    .line 140
    .line 141
    if-nez p1, :cond_9

    .line 142
    .line 143
    if-eqz v1, :cond_9

    .line 144
    .line 145
    sget-object p1, Lcom/p1/mobile/putong/data/BannerLoc;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 146
    .line 147
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 148
    .line 149
    .line 150
    move-result v1

    .line 151
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 152
    .line 153
    .line 154
    move-result-object p1

    .line 155
    check-cast p1, Lcom/p1/mobile/putong/data/BannerLoc;

    .line 156
    .line 157
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Banners;->loc:Lcom/p1/mobile/putong/data/BannerLoc;

    .line 158
    .line 159
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Banners;->loc:Lcom/p1/mobile/putong/data/BannerLoc;

    .line 160
    .line 161
    if-nez p1, :cond_a

    .line 162
    .line 163
    sget-object p1, Lcom/p1/mobile/putong/data/BannerLoc;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 164
    .line 165
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    check-cast p1, Lcom/p1/mobile/putong/data/BannerLoc;

    .line 170
    .line 171
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Banners;->loc:Lcom/p1/mobile/putong/data/BannerLoc;

    .line 172
    .line 173
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Banners;->action:Lcom/p1/mobile/putong/data/BannerAction;

    .line 174
    .line 175
    if-nez p1, :cond_b

    .line 176
    .line 177
    invoke-static {}, Lcom/p1/mobile/putong/data/BannerAction;->new_()Lcom/p1/mobile/putong/data/BannerAction;

    .line 178
    .line 179
    .line 180
    move-result-object p1

    .line 181
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Banners;->action:Lcom/p1/mobile/putong/data/BannerAction;

    .line 182
    .line 183
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Banners;->content:Lcom/p1/mobile/putong/data/BannerContent;

    .line 184
    .line 185
    if-nez p1, :cond_c

    .line 186
    .line 187
    invoke-static {}, Lcom/p1/mobile/putong/data/BannerContent;->new_()Lcom/p1/mobile/putong/data/BannerContent;

    .line 188
    .line 189
    .line 190
    move-result-object p1

    .line 191
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Banners;->content:Lcom/p1/mobile/putong/data/BannerContent;

    .line 192
    .line 193
    :cond_c
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 194
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/Banners$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/Banners;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/Banners;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget v0, p1, Lcom/p1/mobile/putong/data/Banners;->id:I

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Banners;->loc:Lcom/p1/mobile/putong/data/BannerLoc;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x2

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Banners;->action:Lcom/p1/mobile/putong/data/BannerAction;

    .line 20
    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    const/4 v0, 0x3

    .line 24
    sget-object v1, Lcom/p1/mobile/putong/data/BannerAction;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 25
    .line 26
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Banners;->content:Lcom/p1/mobile/putong/data/BannerContent;

    .line 30
    .line 31
    if-eqz p0, :cond_2

    .line 32
    .line 33
    const/4 v0, 0x4

    .line 34
    sget-object v1, Lcom/p1/mobile/putong/data/BannerContent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 35
    .line 36
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 37
    .line 38
    .line 39
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Banners;->loc:Lcom/p1/mobile/putong/data/BannerLoc;

    .line 40
    .line 41
    if-eqz p0, :cond_3

    .line 42
    .line 43
    const/4 p1, 0x5

    .line 44
    sget-object v0, Lcom/p1/mobile/putong/data/BannerLoc;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 45
    .line 46
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 47
    .line 48
    .line 49
    :cond_3
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 50
    check-cast p1, Lcom/p1/mobile/putong/data/Banners;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/Banners$1;->serialize(Lcom/p1/mobile/putong/data/Banners;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
