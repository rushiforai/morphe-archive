.class Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->background:Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseDataBG;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseDataBG;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->bottomButtonBg:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->bottomButtonTextColor:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->descColor:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->bottomMonolayer:Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseDataBottomMonolayer;

    .line 45
    .line 46
    if-eqz v0, :cond_4

    .line 47
    .line 48
    const/4 v1, 0x5

    .line 49
    sget-object v2, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseDataBottomMonolayer;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 50
    .line 51
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    add-int/2addr p0, v0

    .line 56
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->swipeCard:Lcom/p1/mobile/putong/core/data/SimilarInterestsSwipeCard;

    .line 57
    .line 58
    if-eqz v0, :cond_5

    .line 59
    .line 60
    const/4 v1, 0x6

    .line 61
    sget-object v2, Lcom/p1/mobile/putong/core/data/SimilarInterestsSwipeCard;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->itemCard:Lcom/p1/mobile/putong/core/data/SimilarInterestsItemCard;

    .line 69
    .line 70
    if-eqz v0, :cond_6

    .line 71
    .line 72
    const/4 v1, 0x7

    .line 73
    sget-object v2, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemCard;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->bottomButtonSelectedBg:Ljava/lang/String;

    .line 81
    .line 82
    if-eqz v0, :cond_7

    .line 83
    .line 84
    const/16 v1, 0x8

    .line 85
    .line 86
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    add-int/2addr p0, v0

    .line 91
    :cond_7
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 92
    .line 93
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 94
    check-cast p1, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;-><init>()V

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
    const/16 v2, 0xa

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->background:Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseDataBG;

    .line 47
    .line 48
    if-nez p1, :cond_0

    .line 49
    .line 50
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseDataBG;->new_()Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseDataBG;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->background:Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseDataBG;

    .line 55
    .line 56
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->bottomButtonBg:Ljava/lang/String;

    .line 57
    .line 58
    if-nez p1, :cond_1

    .line 59
    .line 60
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->bottomButtonBg:Ljava/lang/String;

    .line 61
    .line 62
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->bottomButtonTextColor:Ljava/lang/String;

    .line 63
    .line 64
    if-nez p1, :cond_2

    .line 65
    .line 66
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->bottomButtonTextColor:Ljava/lang/String;

    .line 67
    .line 68
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->bottomButtonSelectedBg:Ljava/lang/String;

    .line 69
    .line 70
    if-nez p1, :cond_3

    .line 71
    .line 72
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->bottomButtonSelectedBg:Ljava/lang/String;

    .line 73
    .line 74
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->descColor:Ljava/lang/String;

    .line 75
    .line 76
    if-nez p1, :cond_4

    .line 77
    .line 78
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->descColor:Ljava/lang/String;

    .line 79
    .line 80
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->bottomMonolayer:Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseDataBottomMonolayer;

    .line 81
    .line 82
    if-nez p1, :cond_5

    .line 83
    .line 84
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseDataBottomMonolayer;->new_()Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseDataBottomMonolayer;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->bottomMonolayer:Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseDataBottomMonolayer;

    .line 89
    .line 90
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->swipeCard:Lcom/p1/mobile/putong/core/data/SimilarInterestsSwipeCard;

    .line 91
    .line 92
    if-nez p1, :cond_6

    .line 93
    .line 94
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SimilarInterestsSwipeCard;->new_()Lcom/p1/mobile/putong/core/data/SimilarInterestsSwipeCard;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->swipeCard:Lcom/p1/mobile/putong/core/data/SimilarInterestsSwipeCard;

    .line 99
    .line 100
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->itemCard:Lcom/p1/mobile/putong/core/data/SimilarInterestsItemCard;

    .line 101
    .line 102
    if-nez p1, :cond_17

    .line 103
    .line 104
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemCard;->new_()Lcom/p1/mobile/putong/core/data/SimilarInterestsItemCard;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->itemCard:Lcom/p1/mobile/putong/core/data/SimilarInterestsItemCard;

    .line 109
    .line 110
    return-object p0

    .line 111
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->bottomButtonSelectedBg:Ljava/lang/String;

    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_8
    sget-object v0, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemCard;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 119
    .line 120
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    check-cast v0, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemCard;

    .line 125
    .line 126
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->itemCard:Lcom/p1/mobile/putong/core/data/SimilarInterestsItemCard;

    .line 127
    .line 128
    goto :goto_0

    .line 129
    :cond_9
    sget-object v0, Lcom/p1/mobile/putong/core/data/SimilarInterestsSwipeCard;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 130
    .line 131
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    check-cast v0, Lcom/p1/mobile/putong/core/data/SimilarInterestsSwipeCard;

    .line 136
    .line 137
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->swipeCard:Lcom/p1/mobile/putong/core/data/SimilarInterestsSwipeCard;

    .line 138
    .line 139
    goto/16 :goto_0

    .line 140
    .line 141
    :cond_a
    sget-object v0, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseDataBottomMonolayer;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 142
    .line 143
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    check-cast v0, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseDataBottomMonolayer;

    .line 148
    .line 149
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->bottomMonolayer:Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseDataBottomMonolayer;

    .line 150
    .line 151
    goto/16 :goto_0

    .line 152
    .line 153
    :cond_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->descColor:Ljava/lang/String;

    .line 158
    .line 159
    goto/16 :goto_0

    .line 160
    .line 161
    :cond_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->bottomButtonTextColor:Ljava/lang/String;

    .line 166
    .line 167
    goto/16 :goto_0

    .line 168
    .line 169
    :cond_d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->bottomButtonBg:Ljava/lang/String;

    .line 174
    .line 175
    goto/16 :goto_0

    .line 176
    .line 177
    :cond_e
    sget-object v0, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseDataBG;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 178
    .line 179
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 180
    .line 181
    .line 182
    move-result-object v0

    .line 183
    check-cast v0, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseDataBG;

    .line 184
    .line 185
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->background:Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseDataBG;

    .line 186
    .line 187
    goto/16 :goto_0

    .line 188
    .line 189
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->background:Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseDataBG;

    .line 190
    .line 191
    if-nez p1, :cond_10

    .line 192
    .line 193
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseDataBG;->new_()Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseDataBG;

    .line 194
    .line 195
    .line 196
    move-result-object p1

    .line 197
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->background:Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseDataBG;

    .line 198
    .line 199
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->bottomButtonBg:Ljava/lang/String;

    .line 200
    .line 201
    if-nez p1, :cond_11

    .line 202
    .line 203
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->bottomButtonBg:Ljava/lang/String;

    .line 204
    .line 205
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->bottomButtonTextColor:Ljava/lang/String;

    .line 206
    .line 207
    if-nez p1, :cond_12

    .line 208
    .line 209
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->bottomButtonTextColor:Ljava/lang/String;

    .line 210
    .line 211
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->bottomButtonSelectedBg:Ljava/lang/String;

    .line 212
    .line 213
    if-nez p1, :cond_13

    .line 214
    .line 215
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->bottomButtonSelectedBg:Ljava/lang/String;

    .line 216
    .line 217
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->descColor:Ljava/lang/String;

    .line 218
    .line 219
    if-nez p1, :cond_14

    .line 220
    .line 221
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->descColor:Ljava/lang/String;

    .line 222
    .line 223
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->bottomMonolayer:Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseDataBottomMonolayer;

    .line 224
    .line 225
    if-nez p1, :cond_15

    .line 226
    .line 227
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseDataBottomMonolayer;->new_()Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseDataBottomMonolayer;

    .line 228
    .line 229
    .line 230
    move-result-object p1

    .line 231
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->bottomMonolayer:Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseDataBottomMonolayer;

    .line 232
    .line 233
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->swipeCard:Lcom/p1/mobile/putong/core/data/SimilarInterestsSwipeCard;

    .line 234
    .line 235
    if-nez p1, :cond_16

    .line 236
    .line 237
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SimilarInterestsSwipeCard;->new_()Lcom/p1/mobile/putong/core/data/SimilarInterestsSwipeCard;

    .line 238
    .line 239
    .line 240
    move-result-object p1

    .line 241
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->swipeCard:Lcom/p1/mobile/putong/core/data/SimilarInterestsSwipeCard;

    .line 242
    .line 243
    :cond_16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->itemCard:Lcom/p1/mobile/putong/core/data/SimilarInterestsItemCard;

    .line 244
    .line 245
    if-nez p1, :cond_17

    .line 246
    .line 247
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemCard;->new_()Lcom/p1/mobile/putong/core/data/SimilarInterestsItemCard;

    .line 248
    .line 249
    .line 250
    move-result-object p1

    .line 251
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->itemCard:Lcom/p1/mobile/putong/core/data/SimilarInterestsItemCard;

    .line 252
    .line 253
    :cond_17
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 254
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->background:Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseDataBG;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseDataBG;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->bottomButtonBg:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->bottomButtonTextColor:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->descColor:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->bottomMonolayer:Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseDataBottomMonolayer;

    .line 36
    .line 37
    if-eqz p0, :cond_4

    .line 38
    .line 39
    const/4 v0, 0x5

    .line 40
    sget-object v1, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseDataBottomMonolayer;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 41
    .line 42
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 43
    .line 44
    .line 45
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->swipeCard:Lcom/p1/mobile/putong/core/data/SimilarInterestsSwipeCard;

    .line 46
    .line 47
    if-eqz p0, :cond_5

    .line 48
    .line 49
    const/4 v0, 0x6

    .line 50
    sget-object v1, Lcom/p1/mobile/putong/core/data/SimilarInterestsSwipeCard;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 51
    .line 52
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 53
    .line 54
    .line 55
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->itemCard:Lcom/p1/mobile/putong/core/data/SimilarInterestsItemCard;

    .line 56
    .line 57
    if-eqz p0, :cond_6

    .line 58
    .line 59
    const/4 v0, 0x7

    .line 60
    sget-object v1, Lcom/p1/mobile/putong/core/data/SimilarInterestsItemCard;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 61
    .line 62
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 63
    .line 64
    .line 65
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;->bottomButtonSelectedBg:Ljava/lang/String;

    .line 66
    .line 67
    if-eqz p0, :cond_7

    .line 68
    .line 69
    const/16 p1, 0x8

    .line 70
    .line 71
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 72
    .line 73
    .line 74
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

    .line 75
    check-cast p1, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData$1;->serialize(Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
