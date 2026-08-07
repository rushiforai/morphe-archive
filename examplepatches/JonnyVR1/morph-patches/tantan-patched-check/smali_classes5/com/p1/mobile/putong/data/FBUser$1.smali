.class Lcom/p1/mobile/putong/data/FBUser$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/FBUser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/FBUser;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/FBUser;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/FBUser;->name:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/FBUser;->gender:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/FBUser;->birthday:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/FBUser;->fbPicture:Lcom/p1/mobile/putong/data/FBProfile;

    .line 33
    .line 34
    if-eqz v0, :cond_3

    .line 35
    .line 36
    const/4 v1, 0x4

    .line 37
    sget-object v2, Lcom/p1/mobile/putong/data/FBProfile;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 38
    .line 39
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    add-int/2addr p0, v0

    .line 44
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/FBUser;->about:Ljava/lang/String;

    .line 45
    .line 46
    if-eqz v0, :cond_4

    .line 47
    .line 48
    const/4 v1, 0x5

    .line 49
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    add-int/2addr p0, v0

    .line 54
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/FBUser;->hometown:Lcom/p1/mobile/putong/data/FBPage;

    .line 55
    .line 56
    if-eqz v0, :cond_5

    .line 57
    .line 58
    const/4 v1, 0x6

    .line 59
    sget-object v2, Lcom/p1/mobile/putong/data/FBPage;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 60
    .line 61
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    add-int/2addr p0, v0

    .line 66
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/FBUser;->location:Lcom/p1/mobile/putong/data/FBPage;

    .line 67
    .line 68
    if-eqz v0, :cond_6

    .line 69
    .line 70
    const/4 v1, 0x7

    .line 71
    sget-object v2, Lcom/p1/mobile/putong/data/FBPage;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 72
    .line 73
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    add-int/2addr p0, v0

    .line 78
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/data/FBUser;->work:Ljava/util/List;

    .line 79
    .line 80
    if-eqz v0, :cond_7

    .line 81
    .line 82
    sget-object v1, Lcom/p1/mobile/putong/data/FBWork;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 83
    .line 84
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    const/16 v2, 0x8

    .line 89
    .line 90
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    add-int/2addr p0, v0

    .line 95
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/FBUser;->education:Ljava/util/List;

    .line 96
    .line 97
    if-eqz v0, :cond_8

    .line 98
    .line 99
    sget-object v1, Lcom/p1/mobile/putong/data/FBEducation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 100
    .line 101
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    const/16 v2, 0x9

    .line 106
    .line 107
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    add-int/2addr p0, v0

    .line 112
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/data/FBUser;->music:Lcom/p1/mobile/putong/data/FBLikes;

    .line 113
    .line 114
    if-eqz v0, :cond_9

    .line 115
    .line 116
    const/16 v1, 0xa

    .line 117
    .line 118
    sget-object v2, Lcom/p1/mobile/putong/data/FBLikes;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 119
    .line 120
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    add-int/2addr p0, v0

    .line 125
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/data/FBUser;->movies:Lcom/p1/mobile/putong/data/FBLikes;

    .line 126
    .line 127
    if-eqz v0, :cond_a

    .line 128
    .line 129
    const/16 v1, 0xb

    .line 130
    .line 131
    sget-object v2, Lcom/p1/mobile/putong/data/FBLikes;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 132
    .line 133
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    add-int/2addr p0, v0

    .line 138
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/data/FBUser;->books:Lcom/p1/mobile/putong/data/FBLikes;

    .line 139
    .line 140
    if-eqz v0, :cond_b

    .line 141
    .line 142
    const/16 v1, 0xc

    .line 143
    .line 144
    sget-object v2, Lcom/p1/mobile/putong/data/FBLikes;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 145
    .line 146
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    add-int/2addr p0, v0

    .line 151
    :cond_b
    iget-object v0, p1, Lcom/p1/mobile/putong/data/FBUser;->television:Lcom/p1/mobile/putong/data/FBLikes;

    .line 152
    .line 153
    if-eqz v0, :cond_c

    .line 154
    .line 155
    const/16 v1, 0xd

    .line 156
    .line 157
    sget-object v2, Lcom/p1/mobile/putong/data/FBLikes;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 158
    .line 159
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    add-int/2addr p0, v0

    .line 164
    :cond_c
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 165
    .line 166
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 167
    check-cast p1, Lcom/p1/mobile/putong/data/FBUser;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/FBUser$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/FBUser;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/FBUser;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/FBUser;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/FBUser;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/FBUser;->name:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/data/FBUser;->name:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/FBUser;->gender:Ljava/lang/String;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/data/FBUser;->gender:Ljava/lang/String;

    .line 26
    .line 27
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/FBUser;->birthday:Ljava/lang/String;

    .line 28
    .line 29
    if-nez p1, :cond_2

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/data/FBUser;->birthday:Ljava/lang/String;

    .line 32
    .line 33
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/FBUser;->fbPicture:Lcom/p1/mobile/putong/data/FBProfile;

    .line 34
    .line 35
    if-nez p1, :cond_3

    .line 36
    .line 37
    invoke-static {}, Lcom/p1/mobile/putong/data/FBProfile;->new_()Lcom/p1/mobile/putong/data/FBProfile;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iput-object p1, p0, Lcom/p1/mobile/putong/data/FBUser;->fbPicture:Lcom/p1/mobile/putong/data/FBProfile;

    .line 42
    .line 43
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/FBUser;->about:Ljava/lang/String;

    .line 44
    .line 45
    if-nez p1, :cond_4

    .line 46
    .line 47
    iput-object v1, p0, Lcom/p1/mobile/putong/data/FBUser;->about:Ljava/lang/String;

    .line 48
    .line 49
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/FBUser;->hometown:Lcom/p1/mobile/putong/data/FBPage;

    .line 50
    .line 51
    if-nez p1, :cond_5

    .line 52
    .line 53
    invoke-static {}, Lcom/p1/mobile/putong/data/FBPage;->new_()Lcom/p1/mobile/putong/data/FBPage;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    iput-object p1, p0, Lcom/p1/mobile/putong/data/FBUser;->hometown:Lcom/p1/mobile/putong/data/FBPage;

    .line 58
    .line 59
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/FBUser;->location:Lcom/p1/mobile/putong/data/FBPage;

    .line 60
    .line 61
    if-nez p1, :cond_6

    .line 62
    .line 63
    invoke-static {}, Lcom/p1/mobile/putong/data/FBPage;->new_()Lcom/p1/mobile/putong/data/FBPage;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    iput-object p1, p0, Lcom/p1/mobile/putong/data/FBUser;->location:Lcom/p1/mobile/putong/data/FBPage;

    .line 68
    .line 69
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/FBUser;->work:Ljava/util/List;

    .line 70
    .line 71
    if-nez p1, :cond_7

    .line 72
    .line 73
    new-instance p1, Ljava/util/ArrayList;

    .line 74
    .line 75
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 76
    .line 77
    .line 78
    iput-object p1, p0, Lcom/p1/mobile/putong/data/FBUser;->work:Ljava/util/List;

    .line 79
    .line 80
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/FBUser;->education:Ljava/util/List;

    .line 81
    .line 82
    if-nez p1, :cond_8

    .line 83
    .line 84
    new-instance p1, Ljava/util/ArrayList;

    .line 85
    .line 86
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 87
    .line 88
    .line 89
    iput-object p1, p0, Lcom/p1/mobile/putong/data/FBUser;->education:Ljava/util/List;

    .line 90
    .line 91
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/FBUser;->music:Lcom/p1/mobile/putong/data/FBLikes;

    .line 92
    .line 93
    if-nez p1, :cond_9

    .line 94
    .line 95
    invoke-static {}, Lcom/p1/mobile/putong/data/FBLikes;->new_()Lcom/p1/mobile/putong/data/FBLikes;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    iput-object p1, p0, Lcom/p1/mobile/putong/data/FBUser;->music:Lcom/p1/mobile/putong/data/FBLikes;

    .line 100
    .line 101
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/FBUser;->movies:Lcom/p1/mobile/putong/data/FBLikes;

    .line 102
    .line 103
    if-nez p1, :cond_a

    .line 104
    .line 105
    invoke-static {}, Lcom/p1/mobile/putong/data/FBLikes;->new_()Lcom/p1/mobile/putong/data/FBLikes;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    iput-object p1, p0, Lcom/p1/mobile/putong/data/FBUser;->movies:Lcom/p1/mobile/putong/data/FBLikes;

    .line 110
    .line 111
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/FBUser;->books:Lcom/p1/mobile/putong/data/FBLikes;

    .line 112
    .line 113
    if-nez p1, :cond_b

    .line 114
    .line 115
    invoke-static {}, Lcom/p1/mobile/putong/data/FBLikes;->new_()Lcom/p1/mobile/putong/data/FBLikes;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    iput-object p1, p0, Lcom/p1/mobile/putong/data/FBUser;->books:Lcom/p1/mobile/putong/data/FBLikes;

    .line 120
    .line 121
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/FBUser;->television:Lcom/p1/mobile/putong/data/FBLikes;

    .line 122
    .line 123
    if-nez p1, :cond_18

    .line 124
    .line 125
    invoke-static {}, Lcom/p1/mobile/putong/data/FBLikes;->new_()Lcom/p1/mobile/putong/data/FBLikes;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    iput-object p1, p0, Lcom/p1/mobile/putong/data/FBUser;->television:Lcom/p1/mobile/putong/data/FBLikes;

    .line 130
    .line 131
    return-object p0

    .line 132
    :sswitch_0
    sget-object v0, Lcom/p1/mobile/putong/data/FBLikes;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 133
    .line 134
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    check-cast v0, Lcom/p1/mobile/putong/data/FBLikes;

    .line 139
    .line 140
    iput-object v0, p0, Lcom/p1/mobile/putong/data/FBUser;->television:Lcom/p1/mobile/putong/data/FBLikes;

    .line 141
    .line 142
    goto/16 :goto_0

    .line 143
    .line 144
    :sswitch_1
    sget-object v0, Lcom/p1/mobile/putong/data/FBLikes;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 145
    .line 146
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    check-cast v0, Lcom/p1/mobile/putong/data/FBLikes;

    .line 151
    .line 152
    iput-object v0, p0, Lcom/p1/mobile/putong/data/FBUser;->books:Lcom/p1/mobile/putong/data/FBLikes;

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :sswitch_2
    sget-object v0, Lcom/p1/mobile/putong/data/FBLikes;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 157
    .line 158
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    check-cast v0, Lcom/p1/mobile/putong/data/FBLikes;

    .line 163
    .line 164
    iput-object v0, p0, Lcom/p1/mobile/putong/data/FBUser;->movies:Lcom/p1/mobile/putong/data/FBLikes;

    .line 165
    .line 166
    goto/16 :goto_0

    .line 167
    .line 168
    :sswitch_3
    sget-object v0, Lcom/p1/mobile/putong/data/FBLikes;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 169
    .line 170
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    check-cast v0, Lcom/p1/mobile/putong/data/FBLikes;

    .line 175
    .line 176
    iput-object v0, p0, Lcom/p1/mobile/putong/data/FBUser;->music:Lcom/p1/mobile/putong/data/FBLikes;

    .line 177
    .line 178
    goto/16 :goto_0

    .line 179
    .line 180
    :sswitch_4
    sget-object v0, Lcom/p1/mobile/putong/data/FBEducation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 181
    .line 182
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    check-cast v0, Ljava/util/List;

    .line 191
    .line 192
    iput-object v0, p0, Lcom/p1/mobile/putong/data/FBUser;->education:Ljava/util/List;

    .line 193
    .line 194
    goto/16 :goto_0

    .line 195
    .line 196
    :sswitch_5
    sget-object v0, Lcom/p1/mobile/putong/data/FBWork;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 197
    .line 198
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    check-cast v0, Ljava/util/List;

    .line 207
    .line 208
    iput-object v0, p0, Lcom/p1/mobile/putong/data/FBUser;->work:Ljava/util/List;

    .line 209
    .line 210
    goto/16 :goto_0

    .line 211
    .line 212
    :sswitch_6
    sget-object v0, Lcom/p1/mobile/putong/data/FBPage;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 213
    .line 214
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 215
    .line 216
    .line 217
    move-result-object v0

    .line 218
    check-cast v0, Lcom/p1/mobile/putong/data/FBPage;

    .line 219
    .line 220
    iput-object v0, p0, Lcom/p1/mobile/putong/data/FBUser;->location:Lcom/p1/mobile/putong/data/FBPage;

    .line 221
    .line 222
    goto/16 :goto_0

    .line 223
    .line 224
    :sswitch_7
    sget-object v0, Lcom/p1/mobile/putong/data/FBPage;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 225
    .line 226
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 227
    .line 228
    .line 229
    move-result-object v0

    .line 230
    check-cast v0, Lcom/p1/mobile/putong/data/FBPage;

    .line 231
    .line 232
    iput-object v0, p0, Lcom/p1/mobile/putong/data/FBUser;->hometown:Lcom/p1/mobile/putong/data/FBPage;

    .line 233
    .line 234
    goto/16 :goto_0

    .line 235
    .line 236
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 237
    .line 238
    .line 239
    move-result-object v0

    .line 240
    iput-object v0, p0, Lcom/p1/mobile/putong/data/FBUser;->about:Ljava/lang/String;

    .line 241
    .line 242
    goto/16 :goto_0

    .line 243
    .line 244
    :sswitch_9
    sget-object v0, Lcom/p1/mobile/putong/data/FBProfile;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 245
    .line 246
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 247
    .line 248
    .line 249
    move-result-object v0

    .line 250
    check-cast v0, Lcom/p1/mobile/putong/data/FBProfile;

    .line 251
    .line 252
    iput-object v0, p0, Lcom/p1/mobile/putong/data/FBUser;->fbPicture:Lcom/p1/mobile/putong/data/FBProfile;

    .line 253
    .line 254
    goto/16 :goto_0

    .line 255
    .line 256
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 257
    .line 258
    .line 259
    move-result-object v0

    .line 260
    iput-object v0, p0, Lcom/p1/mobile/putong/data/FBUser;->birthday:Ljava/lang/String;

    .line 261
    .line 262
    goto/16 :goto_0

    .line 263
    .line 264
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 265
    .line 266
    .line 267
    move-result-object v0

    .line 268
    iput-object v0, p0, Lcom/p1/mobile/putong/data/FBUser;->gender:Ljava/lang/String;

    .line 269
    .line 270
    goto/16 :goto_0

    .line 271
    .line 272
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 273
    .line 274
    .line 275
    move-result-object v0

    .line 276
    iput-object v0, p0, Lcom/p1/mobile/putong/data/FBUser;->name:Ljava/lang/String;

    .line 277
    .line 278
    goto/16 :goto_0

    .line 279
    .line 280
    :sswitch_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/FBUser;->name:Ljava/lang/String;

    .line 281
    .line 282
    if-nez p1, :cond_c

    .line 283
    .line 284
    iput-object v1, p0, Lcom/p1/mobile/putong/data/FBUser;->name:Ljava/lang/String;

    .line 285
    .line 286
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/FBUser;->gender:Ljava/lang/String;

    .line 287
    .line 288
    if-nez p1, :cond_d

    .line 289
    .line 290
    iput-object v1, p0, Lcom/p1/mobile/putong/data/FBUser;->gender:Ljava/lang/String;

    .line 291
    .line 292
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/FBUser;->birthday:Ljava/lang/String;

    .line 293
    .line 294
    if-nez p1, :cond_e

    .line 295
    .line 296
    iput-object v1, p0, Lcom/p1/mobile/putong/data/FBUser;->birthday:Ljava/lang/String;

    .line 297
    .line 298
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/FBUser;->fbPicture:Lcom/p1/mobile/putong/data/FBProfile;

    .line 299
    .line 300
    if-nez p1, :cond_f

    .line 301
    .line 302
    invoke-static {}, Lcom/p1/mobile/putong/data/FBProfile;->new_()Lcom/p1/mobile/putong/data/FBProfile;

    .line 303
    .line 304
    .line 305
    move-result-object p1

    .line 306
    iput-object p1, p0, Lcom/p1/mobile/putong/data/FBUser;->fbPicture:Lcom/p1/mobile/putong/data/FBProfile;

    .line 307
    .line 308
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/FBUser;->about:Ljava/lang/String;

    .line 309
    .line 310
    if-nez p1, :cond_10

    .line 311
    .line 312
    iput-object v1, p0, Lcom/p1/mobile/putong/data/FBUser;->about:Ljava/lang/String;

    .line 313
    .line 314
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/data/FBUser;->hometown:Lcom/p1/mobile/putong/data/FBPage;

    .line 315
    .line 316
    if-nez p1, :cond_11

    .line 317
    .line 318
    invoke-static {}, Lcom/p1/mobile/putong/data/FBPage;->new_()Lcom/p1/mobile/putong/data/FBPage;

    .line 319
    .line 320
    .line 321
    move-result-object p1

    .line 322
    iput-object p1, p0, Lcom/p1/mobile/putong/data/FBUser;->hometown:Lcom/p1/mobile/putong/data/FBPage;

    .line 323
    .line 324
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/data/FBUser;->location:Lcom/p1/mobile/putong/data/FBPage;

    .line 325
    .line 326
    if-nez p1, :cond_12

    .line 327
    .line 328
    invoke-static {}, Lcom/p1/mobile/putong/data/FBPage;->new_()Lcom/p1/mobile/putong/data/FBPage;

    .line 329
    .line 330
    .line 331
    move-result-object p1

    .line 332
    iput-object p1, p0, Lcom/p1/mobile/putong/data/FBUser;->location:Lcom/p1/mobile/putong/data/FBPage;

    .line 333
    .line 334
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/data/FBUser;->work:Ljava/util/List;

    .line 335
    .line 336
    if-nez p1, :cond_13

    .line 337
    .line 338
    new-instance p1, Ljava/util/ArrayList;

    .line 339
    .line 340
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 341
    .line 342
    .line 343
    iput-object p1, p0, Lcom/p1/mobile/putong/data/FBUser;->work:Ljava/util/List;

    .line 344
    .line 345
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/data/FBUser;->education:Ljava/util/List;

    .line 346
    .line 347
    if-nez p1, :cond_14

    .line 348
    .line 349
    new-instance p1, Ljava/util/ArrayList;

    .line 350
    .line 351
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 352
    .line 353
    .line 354
    iput-object p1, p0, Lcom/p1/mobile/putong/data/FBUser;->education:Ljava/util/List;

    .line 355
    .line 356
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/data/FBUser;->music:Lcom/p1/mobile/putong/data/FBLikes;

    .line 357
    .line 358
    if-nez p1, :cond_15

    .line 359
    .line 360
    invoke-static {}, Lcom/p1/mobile/putong/data/FBLikes;->new_()Lcom/p1/mobile/putong/data/FBLikes;

    .line 361
    .line 362
    .line 363
    move-result-object p1

    .line 364
    iput-object p1, p0, Lcom/p1/mobile/putong/data/FBUser;->music:Lcom/p1/mobile/putong/data/FBLikes;

    .line 365
    .line 366
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/data/FBUser;->movies:Lcom/p1/mobile/putong/data/FBLikes;

    .line 367
    .line 368
    if-nez p1, :cond_16

    .line 369
    .line 370
    invoke-static {}, Lcom/p1/mobile/putong/data/FBLikes;->new_()Lcom/p1/mobile/putong/data/FBLikes;

    .line 371
    .line 372
    .line 373
    move-result-object p1

    .line 374
    iput-object p1, p0, Lcom/p1/mobile/putong/data/FBUser;->movies:Lcom/p1/mobile/putong/data/FBLikes;

    .line 375
    .line 376
    :cond_16
    iget-object p1, p0, Lcom/p1/mobile/putong/data/FBUser;->books:Lcom/p1/mobile/putong/data/FBLikes;

    .line 377
    .line 378
    if-nez p1, :cond_17

    .line 379
    .line 380
    invoke-static {}, Lcom/p1/mobile/putong/data/FBLikes;->new_()Lcom/p1/mobile/putong/data/FBLikes;

    .line 381
    .line 382
    .line 383
    move-result-object p1

    .line 384
    iput-object p1, p0, Lcom/p1/mobile/putong/data/FBUser;->books:Lcom/p1/mobile/putong/data/FBLikes;

    .line 385
    .line 386
    :cond_17
    iget-object p1, p0, Lcom/p1/mobile/putong/data/FBUser;->television:Lcom/p1/mobile/putong/data/FBLikes;

    .line 387
    .line 388
    if-nez p1, :cond_18

    .line 389
    .line 390
    invoke-static {}, Lcom/p1/mobile/putong/data/FBLikes;->new_()Lcom/p1/mobile/putong/data/FBLikes;

    .line 391
    .line 392
    .line 393
    move-result-object p1

    .line 394
    iput-object p1, p0, Lcom/p1/mobile/putong/data/FBUser;->television:Lcom/p1/mobile/putong/data/FBLikes;

    .line 395
    .line 396
    :cond_18
    return-object p0

    .line 397
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_d
        0xa -> :sswitch_c
        0x12 -> :sswitch_b
        0x1a -> :sswitch_a
        0x22 -> :sswitch_9
        0x2a -> :sswitch_8
        0x32 -> :sswitch_7
        0x3a -> :sswitch_6
        0x42 -> :sswitch_5
        0x4a -> :sswitch_4
        0x52 -> :sswitch_3
        0x5a -> :sswitch_2
        0x62 -> :sswitch_1
        0x6a -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 397
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/FBUser$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/FBUser;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/FBUser;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/FBUser;->name:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/FBUser;->gender:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/FBUser;->birthday:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/FBUser;->fbPicture:Lcom/p1/mobile/putong/data/FBProfile;

    .line 26
    .line 27
    if-eqz p0, :cond_3

    .line 28
    .line 29
    const/4 v0, 0x4

    .line 30
    sget-object v1, Lcom/p1/mobile/putong/data/FBProfile;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 31
    .line 32
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 33
    .line 34
    .line 35
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/FBUser;->about:Ljava/lang/String;

    .line 36
    .line 37
    if-eqz p0, :cond_4

    .line 38
    .line 39
    const/4 v0, 0x5

    .line 40
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 41
    .line 42
    .line 43
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/FBUser;->hometown:Lcom/p1/mobile/putong/data/FBPage;

    .line 44
    .line 45
    if-eqz p0, :cond_5

    .line 46
    .line 47
    const/4 v0, 0x6

    .line 48
    sget-object v1, Lcom/p1/mobile/putong/data/FBPage;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 49
    .line 50
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 51
    .line 52
    .line 53
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/FBUser;->location:Lcom/p1/mobile/putong/data/FBPage;

    .line 54
    .line 55
    if-eqz p0, :cond_6

    .line 56
    .line 57
    const/4 v0, 0x7

    .line 58
    sget-object v1, Lcom/p1/mobile/putong/data/FBPage;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 59
    .line 60
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 61
    .line 62
    .line 63
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/FBUser;->work:Ljava/util/List;

    .line 64
    .line 65
    if-eqz p0, :cond_7

    .line 66
    .line 67
    sget-object v0, Lcom/p1/mobile/putong/data/FBWork;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 68
    .line 69
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    const/16 v1, 0x8

    .line 74
    .line 75
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 76
    .line 77
    .line 78
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/FBUser;->education:Ljava/util/List;

    .line 79
    .line 80
    if-eqz p0, :cond_8

    .line 81
    .line 82
    sget-object v0, Lcom/p1/mobile/putong/data/FBEducation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 83
    .line 84
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    const/16 v1, 0x9

    .line 89
    .line 90
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 91
    .line 92
    .line 93
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/data/FBUser;->music:Lcom/p1/mobile/putong/data/FBLikes;

    .line 94
    .line 95
    if-eqz p0, :cond_9

    .line 96
    .line 97
    const/16 v0, 0xa

    .line 98
    .line 99
    sget-object v1, Lcom/p1/mobile/putong/data/FBLikes;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 100
    .line 101
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 102
    .line 103
    .line 104
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/FBUser;->movies:Lcom/p1/mobile/putong/data/FBLikes;

    .line 105
    .line 106
    if-eqz p0, :cond_a

    .line 107
    .line 108
    const/16 v0, 0xb

    .line 109
    .line 110
    sget-object v1, Lcom/p1/mobile/putong/data/FBLikes;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 111
    .line 112
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 113
    .line 114
    .line 115
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/FBUser;->books:Lcom/p1/mobile/putong/data/FBLikes;

    .line 116
    .line 117
    if-eqz p0, :cond_b

    .line 118
    .line 119
    const/16 v0, 0xc

    .line 120
    .line 121
    sget-object v1, Lcom/p1/mobile/putong/data/FBLikes;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 122
    .line 123
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 124
    .line 125
    .line 126
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/FBUser;->television:Lcom/p1/mobile/putong/data/FBLikes;

    .line 127
    .line 128
    if-eqz p0, :cond_c

    .line 129
    .line 130
    const/16 p1, 0xd

    .line 131
    .line 132
    sget-object v0, Lcom/p1/mobile/putong/data/FBLikes;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 133
    .line 134
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 135
    .line 136
    .line 137
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

    .line 138
    check-cast p1, Lcom/p1/mobile/putong/data/FBUser;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/FBUser$1;->serialize(Lcom/p1/mobile/putong/data/FBUser;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
