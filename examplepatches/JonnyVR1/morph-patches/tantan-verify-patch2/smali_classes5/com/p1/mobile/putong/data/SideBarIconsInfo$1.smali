.class Lcom/p1/mobile/putong/data/SideBarIconsInfo$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/SideBarIconsInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/SideBarIconsInfo;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/SideBarIconsInfo;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->picture:Lcom/p1/mobile/putong/data/NavigationViewPicture;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/data/NavigationViewPicture;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    invoke-static {v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->title:Ljava/lang/String;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    const/4 v1, 0x2

    .line 19
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    add-int/2addr p0, v0

    .line 24
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->subtitle:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->deeplink:Ljava/lang/String;

    .line 35
    .line 36
    if-eqz v0, :cond_3

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
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->timeRange:Ljava/util/List;

    .line 45
    .line 46
    if-eqz v0, :cond_4

    .line 47
    .line 48
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->LONG_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 49
    .line 50
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    const/4 v2, 0x5

    .line 55
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    add-int/2addr p0, v0

    .line 60
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->slideshowSec:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->id:Ljava/lang/String;

    .line 71
    .line 72
    if-eqz v0, :cond_6

    .line 73
    .line 74
    const/4 v1, 0x7

    .line 75
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    add-int/2addr p0, v0

    .line 80
    :cond_6
    const/16 v0, 0x8

    .line 81
    .line 82
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->redDotSwitch:Z

    .line 83
    .line 84
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    add-int/2addr p0, v0

    .line 89
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 90
    .line 91
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 92
    check-cast p1, Lcom/p1/mobile/putong/data/SideBarIconsInfo;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/SideBarIconsInfo$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/SideBarIconsInfo;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/SideBarIconsInfo;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/SideBarIconsInfo;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/SideBarIconsInfo;-><init>()V

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
    if-eqz v0, :cond_e

    .line 13
    .line 14
    const/16 v2, 0xa

    .line 15
    .line 16
    if-eq v0, v2, :cond_d

    .line 17
    .line 18
    const/16 v2, 0x12

    .line 19
    .line 20
    if-eq v0, v2, :cond_c

    .line 21
    .line 22
    const/16 v2, 0x1a

    .line 23
    .line 24
    if-eq v0, v2, :cond_b

    .line 25
    .line 26
    const/16 v2, 0x22

    .line 27
    .line 28
    if-eq v0, v2, :cond_a

    .line 29
    .line 30
    const/16 v2, 0x2a

    .line 31
    .line 32
    if-eq v0, v2, :cond_9

    .line 33
    .line 34
    const/16 v2, 0x32

    .line 35
    .line 36
    if-eq v0, v2, :cond_8

    .line 37
    .line 38
    const/16 v2, 0x3a

    .line 39
    .line 40
    if-eq v0, v2, :cond_7

    .line 41
    .line 42
    const/16 v2, 0x40

    .line 43
    .line 44
    if-eq v0, v2, :cond_6

    .line 45
    .line 46
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->id:Ljava/lang/String;

    .line 47
    .line 48
    if-nez p1, :cond_0

    .line 49
    .line 50
    iput-object v1, p0, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->id:Ljava/lang/String;

    .line 51
    .line 52
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->picture:Lcom/p1/mobile/putong/data/NavigationViewPicture;

    .line 53
    .line 54
    if-nez p1, :cond_1

    .line 55
    .line 56
    invoke-static {}, Lcom/p1/mobile/putong/data/NavigationViewPicture;->new_()Lcom/p1/mobile/putong/data/NavigationViewPicture;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    iput-object p1, p0, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->picture:Lcom/p1/mobile/putong/data/NavigationViewPicture;

    .line 61
    .line 62
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->title:Ljava/lang/String;

    .line 63
    .line 64
    if-nez p1, :cond_2

    .line 65
    .line 66
    iput-object v1, p0, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->title:Ljava/lang/String;

    .line 67
    .line 68
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->subtitle:Ljava/lang/String;

    .line 69
    .line 70
    if-nez p1, :cond_3

    .line 71
    .line 72
    iput-object v1, p0, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->subtitle:Ljava/lang/String;

    .line 73
    .line 74
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->deeplink:Ljava/lang/String;

    .line 75
    .line 76
    if-nez p1, :cond_4

    .line 77
    .line 78
    iput-object v1, p0, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->deeplink:Ljava/lang/String;

    .line 79
    .line 80
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->timeRange:Ljava/util/List;

    .line 81
    .line 82
    if-nez p1, :cond_5

    .line 83
    .line 84
    new-instance p1, Ljava/util/ArrayList;

    .line 85
    .line 86
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 87
    .line 88
    .line 89
    iput-object p1, p0, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->timeRange:Ljava/util/List;

    .line 90
    .line 91
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->slideshowSec:Ljava/lang/String;

    .line 92
    .line 93
    if-nez p1, :cond_15

    .line 94
    .line 95
    iput-object v1, p0, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->slideshowSec:Ljava/lang/String;

    .line 96
    .line 97
    return-object p0

    .line 98
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->redDotSwitch:Z

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->id:Ljava/lang/String;

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->slideshowSec:Ljava/lang/String;

    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_9
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->LONG_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 120
    .line 121
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    check-cast v0, Ljava/util/List;

    .line 130
    .line 131
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->timeRange:Ljava/util/List;

    .line 132
    .line 133
    goto :goto_0

    .line 134
    :cond_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->deeplink:Ljava/lang/String;

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :cond_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->subtitle:Ljava/lang/String;

    .line 147
    .line 148
    goto/16 :goto_0

    .line 149
    .line 150
    :cond_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->title:Ljava/lang/String;

    .line 155
    .line 156
    goto/16 :goto_0

    .line 157
    .line 158
    :cond_d
    sget-object v0, Lcom/p1/mobile/putong/data/NavigationViewPicture;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 159
    .line 160
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    check-cast v0, Lcom/p1/mobile/putong/data/NavigationViewPicture;

    .line 165
    .line 166
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->picture:Lcom/p1/mobile/putong/data/NavigationViewPicture;

    .line 167
    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->id:Ljava/lang/String;

    .line 171
    .line 172
    if-nez p1, :cond_f

    .line 173
    .line 174
    iput-object v1, p0, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->id:Ljava/lang/String;

    .line 175
    .line 176
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->picture:Lcom/p1/mobile/putong/data/NavigationViewPicture;

    .line 177
    .line 178
    if-nez p1, :cond_10

    .line 179
    .line 180
    invoke-static {}, Lcom/p1/mobile/putong/data/NavigationViewPicture;->new_()Lcom/p1/mobile/putong/data/NavigationViewPicture;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    iput-object p1, p0, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->picture:Lcom/p1/mobile/putong/data/NavigationViewPicture;

    .line 185
    .line 186
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->title:Ljava/lang/String;

    .line 187
    .line 188
    if-nez p1, :cond_11

    .line 189
    .line 190
    iput-object v1, p0, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->title:Ljava/lang/String;

    .line 191
    .line 192
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->subtitle:Ljava/lang/String;

    .line 193
    .line 194
    if-nez p1, :cond_12

    .line 195
    .line 196
    iput-object v1, p0, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->subtitle:Ljava/lang/String;

    .line 197
    .line 198
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->deeplink:Ljava/lang/String;

    .line 199
    .line 200
    if-nez p1, :cond_13

    .line 201
    .line 202
    iput-object v1, p0, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->deeplink:Ljava/lang/String;

    .line 203
    .line 204
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->timeRange:Ljava/util/List;

    .line 205
    .line 206
    if-nez p1, :cond_14

    .line 207
    .line 208
    new-instance p1, Ljava/util/ArrayList;

    .line 209
    .line 210
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 211
    .line 212
    .line 213
    iput-object p1, p0, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->timeRange:Ljava/util/List;

    .line 214
    .line 215
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->slideshowSec:Ljava/lang/String;

    .line 216
    .line 217
    if-nez p1, :cond_15

    .line 218
    .line 219
    iput-object v1, p0, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->slideshowSec:Ljava/lang/String;

    .line 220
    .line 221
    :cond_15
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 222
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/SideBarIconsInfo$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/SideBarIconsInfo;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/SideBarIconsInfo;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->picture:Lcom/p1/mobile/putong/data/NavigationViewPicture;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/data/NavigationViewPicture;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->title:Ljava/lang/String;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->subtitle:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->deeplink:Ljava/lang/String;

    .line 28
    .line 29
    if-eqz p0, :cond_3

    .line 30
    .line 31
    const/4 v0, 0x4

    .line 32
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->timeRange:Ljava/util/List;

    .line 36
    .line 37
    if-eqz p0, :cond_4

    .line 38
    .line 39
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->LONG_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    const/4 v1, 0x5

    .line 46
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 47
    .line 48
    .line 49
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->slideshowSec:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->id:Ljava/lang/String;

    .line 58
    .line 59
    if-eqz p0, :cond_6

    .line 60
    .line 61
    const/4 v0, 0x7

    .line 62
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 63
    .line 64
    .line 65
    :cond_6
    const/16 p0, 0x8

    .line 66
    .line 67
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/SideBarIconsInfo;->redDotSwitch:Z

    .line 68
    .line 69
    invoke-virtual {p2, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 73
    check-cast p1, Lcom/p1/mobile/putong/data/SideBarIconsInfo;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/SideBarIconsInfo$1;->serialize(Lcom/p1/mobile/putong/data/SideBarIconsInfo;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
