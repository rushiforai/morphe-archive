.class Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;)I
    .locals 2

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->mainTitle:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->subtitle:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->theme:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->buttonText:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->imgUrl:Ljava/lang/String;

    .line 43
    .line 44
    if-eqz v0, :cond_4

    .line 45
    .line 46
    const/4 v1, 0x5

    .line 47
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    add-int/2addr p0, v0

    .line 52
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->seePoolHasUserSubtitle:Ljava/lang/String;

    .line 53
    .line 54
    if-eqz v0, :cond_5

    .line 55
    .line 56
    const/4 v1, 0x6

    .line 57
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    add-int/2addr p0, v0

    .line 62
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->seePoolNoUserSubtitle:Ljava/lang/String;

    .line 63
    .line 64
    if-eqz v0, :cond_6

    .line 65
    .line 66
    const/4 v1, 0x7

    .line 67
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    add-int/2addr p0, v0

    .line 72
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->countdownTopText:Ljava/lang/String;

    .line 73
    .line 74
    if-eqz v0, :cond_7

    .line 75
    .line 76
    const/16 v1, 0x8

    .line 77
    .line 78
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    add-int/2addr p0, v0

    .line 83
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->interceptToast:Ljava/lang/String;

    .line 84
    .line 85
    if-eqz v0, :cond_8

    .line 86
    .line 87
    const/16 v1, 0x9

    .line 88
    .line 89
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    add-int/2addr p0, v0

    .line 94
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->skuTitle:Ljava/lang/String;

    .line 95
    .line 96
    if-eqz v0, :cond_9

    .line 97
    .line 98
    const/16 v1, 0xa

    .line 99
    .line 100
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    add-int/2addr p0, v0

    .line 105
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->titleLine1:Ljava/lang/String;

    .line 106
    .line 107
    if-eqz v0, :cond_a

    .line 108
    .line 109
    const/16 v1, 0xb

    .line 110
    .line 111
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    add-int/2addr p0, v0

    .line 116
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->titleLine2:Ljava/lang/String;

    .line 117
    .line 118
    if-eqz v0, :cond_b

    .line 119
    .line 120
    const/16 v1, 0xc

    .line 121
    .line 122
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    add-int/2addr p0, v0

    .line 127
    :cond_b
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->seePoolHasUserMainTitle:Ljava/lang/String;

    .line 128
    .line 129
    if-eqz v0, :cond_c

    .line 130
    .line 131
    const/16 v1, 0xd

    .line 132
    .line 133
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    add-int/2addr p0, v0

    .line 138
    :cond_c
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->seePoolNoUserMainTitle:Ljava/lang/String;

    .line 139
    .line 140
    if-eqz v0, :cond_d

    .line 141
    .line 142
    const/16 v1, 0xe

    .line 143
    .line 144
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 145
    .line 146
    .line 147
    move-result v0

    .line 148
    add-int/2addr p0, v0

    .line 149
    :cond_d
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->digitBackground:Ljava/lang/String;

    .line 150
    .line 151
    if-eqz v0, :cond_e

    .line 152
    .line 153
    const/16 v1, 0xf

    .line 154
    .line 155
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 156
    .line 157
    .line 158
    move-result v0

    .line 159
    add-int/2addr p0, v0

    .line 160
    :cond_e
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 161
    .line 162
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 163
    check-cast p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;-><init>()V

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
    sparse-switch v0, :sswitch_data_0

    .line 11
    .line 12
    .line 13
    return-object p0

    .line 14
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->digitBackground:Ljava/lang/String;

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->seePoolNoUserMainTitle:Ljava/lang/String;

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->seePoolHasUserMainTitle:Ljava/lang/String;

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->titleLine2:Ljava/lang/String;

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->titleLine1:Ljava/lang/String;

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->skuTitle:Ljava/lang/String;

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->interceptToast:Ljava/lang/String;

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->countdownTopText:Ljava/lang/String;

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->seePoolNoUserSubtitle:Ljava/lang/String;

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->seePoolHasUserSubtitle:Ljava/lang/String;

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->imgUrl:Ljava/lang/String;

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->buttonText:Ljava/lang/String;

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->theme:Ljava/lang/String;

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :sswitch_d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->subtitle:Ljava/lang/String;

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :sswitch_e
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->mainTitle:Ljava/lang/String;

    .line 117
    .line 118
    goto :goto_0

    .line 119
    :sswitch_data_0
    .sparse-switch
        0xa -> :sswitch_e
        0x12 -> :sswitch_d
        0x1a -> :sswitch_c
        0x22 -> :sswitch_b
        0x2a -> :sswitch_a
        0x32 -> :sswitch_9
        0x3a -> :sswitch_8
        0x42 -> :sswitch_7
        0x4a -> :sswitch_6
        0x52 -> :sswitch_5
        0x5a -> :sswitch_4
        0x62 -> :sswitch_3
        0x6a -> :sswitch_2
        0x72 -> :sswitch_1
        0x7a -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 119
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->mainTitle:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->subtitle:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->theme:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->buttonText:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->imgUrl:Ljava/lang/String;

    .line 34
    .line 35
    if-eqz p0, :cond_4

    .line 36
    .line 37
    const/4 v0, 0x5

    .line 38
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 39
    .line 40
    .line 41
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->seePoolHasUserSubtitle:Ljava/lang/String;

    .line 42
    .line 43
    if-eqz p0, :cond_5

    .line 44
    .line 45
    const/4 v0, 0x6

    .line 46
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 47
    .line 48
    .line 49
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->seePoolNoUserSubtitle:Ljava/lang/String;

    .line 50
    .line 51
    if-eqz p0, :cond_6

    .line 52
    .line 53
    const/4 v0, 0x7

    .line 54
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 55
    .line 56
    .line 57
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->countdownTopText:Ljava/lang/String;

    .line 58
    .line 59
    if-eqz p0, :cond_7

    .line 60
    .line 61
    const/16 v0, 0x8

    .line 62
    .line 63
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 64
    .line 65
    .line 66
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->interceptToast:Ljava/lang/String;

    .line 67
    .line 68
    if-eqz p0, :cond_8

    .line 69
    .line 70
    const/16 v0, 0x9

    .line 71
    .line 72
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 73
    .line 74
    .line 75
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->skuTitle:Ljava/lang/String;

    .line 76
    .line 77
    if-eqz p0, :cond_9

    .line 78
    .line 79
    const/16 v0, 0xa

    .line 80
    .line 81
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 82
    .line 83
    .line 84
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->titleLine1:Ljava/lang/String;

    .line 85
    .line 86
    if-eqz p0, :cond_a

    .line 87
    .line 88
    const/16 v0, 0xb

    .line 89
    .line 90
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 91
    .line 92
    .line 93
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->titleLine2:Ljava/lang/String;

    .line 94
    .line 95
    if-eqz p0, :cond_b

    .line 96
    .line 97
    const/16 v0, 0xc

    .line 98
    .line 99
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 100
    .line 101
    .line 102
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->seePoolHasUserMainTitle:Ljava/lang/String;

    .line 103
    .line 104
    if-eqz p0, :cond_c

    .line 105
    .line 106
    const/16 v0, 0xd

    .line 107
    .line 108
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 109
    .line 110
    .line 111
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->seePoolNoUserMainTitle:Ljava/lang/String;

    .line 112
    .line 113
    if-eqz p0, :cond_d

    .line 114
    .line 115
    const/16 v0, 0xe

    .line 116
    .line 117
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 118
    .line 119
    .line 120
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->digitBackground:Ljava/lang/String;

    .line 121
    .line 122
    if-eqz p0, :cond_e

    .line 123
    .line 124
    const/16 p1, 0xf

    .line 125
    .line 126
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 127
    .line 128
    .line 129
    :cond_e
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 130
    check-cast p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot$1;->serialize(Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
