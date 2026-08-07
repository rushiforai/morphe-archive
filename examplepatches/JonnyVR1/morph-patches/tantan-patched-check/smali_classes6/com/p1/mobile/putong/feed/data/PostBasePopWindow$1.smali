.class Lcom/p1/mobile/putong/feed/data/PostBasePopWindow$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->basic:Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->illustration:Lcom/p1/mobile/putong/feed/data/IllustrationComponent;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    const/4 v1, 0x2

    .line 19
    sget-object v2, Lcom/p1/mobile/putong/feed/data/IllustrationComponent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 20
    .line 21
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    add-int/2addr p0, v0

    .line 26
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->users:Ljava/util/List;

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    sget-object v1, Lcom/p1/mobile/putong/feed/data/UserSimpleInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 31
    .line 32
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    const/4 v2, 0x3

    .line 37
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    add-int/2addr p0, v0

    .line 42
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->title:Ljava/lang/String;

    .line 43
    .line 44
    if-eqz v0, :cond_3

    .line 45
    .line 46
    const/4 v1, 0x4

    .line 47
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    add-int/2addr p0, v0

    .line 52
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->mainBody:Ljava/lang/String;

    .line 53
    .line 54
    if-eqz v0, :cond_4

    .line 55
    .line 56
    const/4 v1, 0x5

    .line 57
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    add-int/2addr p0, v0

    .line 62
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->inputBox:Lcom/p1/mobile/putong/feed/data/InputBoxComponent;

    .line 63
    .line 64
    if-eqz v0, :cond_5

    .line 65
    .line 66
    const/4 v1, 0x6

    .line 67
    sget-object v2, Lcom/p1/mobile/putong/feed/data/InputBoxComponent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 68
    .line 69
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    add-int/2addr p0, v0

    .line 74
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->locations:Lcom/p1/mobile/putong/feed/data/LocationComponent;

    .line 75
    .line 76
    if-eqz v0, :cond_6

    .line 77
    .line 78
    const/4 v1, 0x7

    .line 79
    sget-object v2, Lcom/p1/mobile/putong/feed/data/LocationComponent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 80
    .line 81
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    add-int/2addr p0, v0

    .line 86
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->buttons:Ljava/util/List;

    .line 87
    .line 88
    if-eqz v0, :cond_7

    .line 89
    .line 90
    sget-object v1, Lcom/p1/mobile/putong/feed/data/ButtonInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 91
    .line 92
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    const/16 v2, 0x8

    .line 97
    .line 98
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    add-int/2addr p0, v0

    .line 103
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->close:Lcom/p1/mobile/putong/feed/data/CloseWindowComponent;

    .line 104
    .line 105
    if-eqz v0, :cond_8

    .line 106
    .line 107
    const/16 v1, 0x9

    .line 108
    .line 109
    sget-object v2, Lcom/p1/mobile/putong/feed/data/CloseWindowComponent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 110
    .line 111
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    add-int/2addr p0, v0

    .line 116
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->occasion:Lcom/p1/mobile/putong/feed/data/OccasionComponent;

    .line 117
    .line 118
    if-eqz v0, :cond_9

    .line 119
    .line 120
    const/16 v1, 0xa

    .line 121
    .line 122
    sget-object v2, Lcom/p1/mobile/putong/feed/data/OccasionComponent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 123
    .line 124
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    add-int/2addr p0, v0

    .line 129
    :cond_9
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 130
    .line 131
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 132
    check-cast p1, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow$1;->computeAndCacheSize(Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->basic:Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;->new_()Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->basic:Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;

    .line 24
    .line 25
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->illustration:Lcom/p1/mobile/putong/feed/data/IllustrationComponent;

    .line 26
    .line 27
    if-nez p1, :cond_1

    .line 28
    .line 29
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/IllustrationComponent;->new_()Lcom/p1/mobile/putong/feed/data/IllustrationComponent;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->illustration:Lcom/p1/mobile/putong/feed/data/IllustrationComponent;

    .line 34
    .line 35
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->users:Ljava/util/List;

    .line 36
    .line 37
    if-nez p1, :cond_2

    .line 38
    .line 39
    new-instance p1, Ljava/util/ArrayList;

    .line 40
    .line 41
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->users:Ljava/util/List;

    .line 45
    .line 46
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->title:Ljava/lang/String;

    .line 47
    .line 48
    if-nez p1, :cond_3

    .line 49
    .line 50
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->title:Ljava/lang/String;

    .line 51
    .line 52
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->mainBody:Ljava/lang/String;

    .line 53
    .line 54
    if-nez p1, :cond_4

    .line 55
    .line 56
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->mainBody:Ljava/lang/String;

    .line 57
    .line 58
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->inputBox:Lcom/p1/mobile/putong/feed/data/InputBoxComponent;

    .line 59
    .line 60
    if-nez p1, :cond_5

    .line 61
    .line 62
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/InputBoxComponent;->new_()Lcom/p1/mobile/putong/feed/data/InputBoxComponent;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->inputBox:Lcom/p1/mobile/putong/feed/data/InputBoxComponent;

    .line 67
    .line 68
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->locations:Lcom/p1/mobile/putong/feed/data/LocationComponent;

    .line 69
    .line 70
    if-nez p1, :cond_6

    .line 71
    .line 72
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/LocationComponent;->new_()Lcom/p1/mobile/putong/feed/data/LocationComponent;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->locations:Lcom/p1/mobile/putong/feed/data/LocationComponent;

    .line 77
    .line 78
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->buttons:Ljava/util/List;

    .line 79
    .line 80
    if-nez p1, :cond_7

    .line 81
    .line 82
    new-instance p1, Ljava/util/ArrayList;

    .line 83
    .line 84
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 85
    .line 86
    .line 87
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->buttons:Ljava/util/List;

    .line 88
    .line 89
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->close:Lcom/p1/mobile/putong/feed/data/CloseWindowComponent;

    .line 90
    .line 91
    if-nez p1, :cond_8

    .line 92
    .line 93
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/CloseWindowComponent;->new_()Lcom/p1/mobile/putong/feed/data/CloseWindowComponent;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->close:Lcom/p1/mobile/putong/feed/data/CloseWindowComponent;

    .line 98
    .line 99
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->occasion:Lcom/p1/mobile/putong/feed/data/OccasionComponent;

    .line 100
    .line 101
    if-nez p1, :cond_12

    .line 102
    .line 103
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/OccasionComponent;->new_()Lcom/p1/mobile/putong/feed/data/OccasionComponent;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->occasion:Lcom/p1/mobile/putong/feed/data/OccasionComponent;

    .line 108
    .line 109
    return-object p0

    .line 110
    :sswitch_0
    sget-object v0, Lcom/p1/mobile/putong/feed/data/OccasionComponent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 111
    .line 112
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    check-cast v0, Lcom/p1/mobile/putong/feed/data/OccasionComponent;

    .line 117
    .line 118
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->occasion:Lcom/p1/mobile/putong/feed/data/OccasionComponent;

    .line 119
    .line 120
    goto :goto_0

    .line 121
    :sswitch_1
    sget-object v0, Lcom/p1/mobile/putong/feed/data/CloseWindowComponent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 122
    .line 123
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    check-cast v0, Lcom/p1/mobile/putong/feed/data/CloseWindowComponent;

    .line 128
    .line 129
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->close:Lcom/p1/mobile/putong/feed/data/CloseWindowComponent;

    .line 130
    .line 131
    goto :goto_0

    .line 132
    :sswitch_2
    sget-object v0, Lcom/p1/mobile/putong/feed/data/ButtonInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 133
    .line 134
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    check-cast v0, Ljava/util/List;

    .line 143
    .line 144
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->buttons:Ljava/util/List;

    .line 145
    .line 146
    goto/16 :goto_0

    .line 147
    .line 148
    :sswitch_3
    sget-object v0, Lcom/p1/mobile/putong/feed/data/LocationComponent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 149
    .line 150
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    check-cast v0, Lcom/p1/mobile/putong/feed/data/LocationComponent;

    .line 155
    .line 156
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->locations:Lcom/p1/mobile/putong/feed/data/LocationComponent;

    .line 157
    .line 158
    goto/16 :goto_0

    .line 159
    .line 160
    :sswitch_4
    sget-object v0, Lcom/p1/mobile/putong/feed/data/InputBoxComponent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 161
    .line 162
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    check-cast v0, Lcom/p1/mobile/putong/feed/data/InputBoxComponent;

    .line 167
    .line 168
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->inputBox:Lcom/p1/mobile/putong/feed/data/InputBoxComponent;

    .line 169
    .line 170
    goto/16 :goto_0

    .line 171
    .line 172
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->mainBody:Ljava/lang/String;

    .line 177
    .line 178
    goto/16 :goto_0

    .line 179
    .line 180
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->title:Ljava/lang/String;

    .line 185
    .line 186
    goto/16 :goto_0

    .line 187
    .line 188
    :sswitch_7
    sget-object v0, Lcom/p1/mobile/putong/feed/data/UserSimpleInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 189
    .line 190
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    check-cast v0, Ljava/util/List;

    .line 199
    .line 200
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->users:Ljava/util/List;

    .line 201
    .line 202
    goto/16 :goto_0

    .line 203
    .line 204
    :sswitch_8
    sget-object v0, Lcom/p1/mobile/putong/feed/data/IllustrationComponent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 205
    .line 206
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    check-cast v0, Lcom/p1/mobile/putong/feed/data/IllustrationComponent;

    .line 211
    .line 212
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->illustration:Lcom/p1/mobile/putong/feed/data/IllustrationComponent;

    .line 213
    .line 214
    goto/16 :goto_0

    .line 215
    .line 216
    :sswitch_9
    sget-object v0, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 217
    .line 218
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 219
    .line 220
    .line 221
    move-result-object v0

    .line 222
    check-cast v0, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;

    .line 223
    .line 224
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->basic:Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;

    .line 225
    .line 226
    goto/16 :goto_0

    .line 227
    .line 228
    :sswitch_a
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->basic:Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;

    .line 229
    .line 230
    if-nez p1, :cond_9

    .line 231
    .line 232
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;->new_()Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;

    .line 233
    .line 234
    .line 235
    move-result-object p1

    .line 236
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->basic:Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;

    .line 237
    .line 238
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->illustration:Lcom/p1/mobile/putong/feed/data/IllustrationComponent;

    .line 239
    .line 240
    if-nez p1, :cond_a

    .line 241
    .line 242
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/IllustrationComponent;->new_()Lcom/p1/mobile/putong/feed/data/IllustrationComponent;

    .line 243
    .line 244
    .line 245
    move-result-object p1

    .line 246
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->illustration:Lcom/p1/mobile/putong/feed/data/IllustrationComponent;

    .line 247
    .line 248
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->users:Ljava/util/List;

    .line 249
    .line 250
    if-nez p1, :cond_b

    .line 251
    .line 252
    new-instance p1, Ljava/util/ArrayList;

    .line 253
    .line 254
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 255
    .line 256
    .line 257
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->users:Ljava/util/List;

    .line 258
    .line 259
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->title:Ljava/lang/String;

    .line 260
    .line 261
    if-nez p1, :cond_c

    .line 262
    .line 263
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->title:Ljava/lang/String;

    .line 264
    .line 265
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->mainBody:Ljava/lang/String;

    .line 266
    .line 267
    if-nez p1, :cond_d

    .line 268
    .line 269
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->mainBody:Ljava/lang/String;

    .line 270
    .line 271
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->inputBox:Lcom/p1/mobile/putong/feed/data/InputBoxComponent;

    .line 272
    .line 273
    if-nez p1, :cond_e

    .line 274
    .line 275
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/InputBoxComponent;->new_()Lcom/p1/mobile/putong/feed/data/InputBoxComponent;

    .line 276
    .line 277
    .line 278
    move-result-object p1

    .line 279
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->inputBox:Lcom/p1/mobile/putong/feed/data/InputBoxComponent;

    .line 280
    .line 281
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->locations:Lcom/p1/mobile/putong/feed/data/LocationComponent;

    .line 282
    .line 283
    if-nez p1, :cond_f

    .line 284
    .line 285
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/LocationComponent;->new_()Lcom/p1/mobile/putong/feed/data/LocationComponent;

    .line 286
    .line 287
    .line 288
    move-result-object p1

    .line 289
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->locations:Lcom/p1/mobile/putong/feed/data/LocationComponent;

    .line 290
    .line 291
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->buttons:Ljava/util/List;

    .line 292
    .line 293
    if-nez p1, :cond_10

    .line 294
    .line 295
    new-instance p1, Ljava/util/ArrayList;

    .line 296
    .line 297
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 298
    .line 299
    .line 300
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->buttons:Ljava/util/List;

    .line 301
    .line 302
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->close:Lcom/p1/mobile/putong/feed/data/CloseWindowComponent;

    .line 303
    .line 304
    if-nez p1, :cond_11

    .line 305
    .line 306
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/CloseWindowComponent;->new_()Lcom/p1/mobile/putong/feed/data/CloseWindowComponent;

    .line 307
    .line 308
    .line 309
    move-result-object p1

    .line 310
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->close:Lcom/p1/mobile/putong/feed/data/CloseWindowComponent;

    .line 311
    .line 312
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->occasion:Lcom/p1/mobile/putong/feed/data/OccasionComponent;

    .line 313
    .line 314
    if-nez p1, :cond_12

    .line 315
    .line 316
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/OccasionComponent;->new_()Lcom/p1/mobile/putong/feed/data/OccasionComponent;

    .line 317
    .line 318
    .line 319
    move-result-object p1

    .line 320
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->occasion:Lcom/p1/mobile/putong/feed/data/OccasionComponent;

    .line 321
    .line 322
    :cond_12
    return-object p0

    .line 323
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_a
        0xa -> :sswitch_9
        0x12 -> :sswitch_8
        0x1a -> :sswitch_7
        0x22 -> :sswitch_6
        0x2a -> :sswitch_5
        0x32 -> :sswitch_4
        0x3a -> :sswitch_3
        0x42 -> :sswitch_2
        0x4a -> :sswitch_1
        0x52 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 323
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->basic:Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->illustration:Lcom/p1/mobile/putong/feed/data/IllustrationComponent;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    sget-object v1, Lcom/p1/mobile/putong/feed/data/IllustrationComponent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 17
    .line 18
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->users:Ljava/util/List;

    .line 22
    .line 23
    if-eqz p0, :cond_2

    .line 24
    .line 25
    sget-object v0, Lcom/p1/mobile/putong/feed/data/UserSimpleInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const/4 v1, 0x3

    .line 32
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 33
    .line 34
    .line 35
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->title:Ljava/lang/String;

    .line 36
    .line 37
    if-eqz p0, :cond_3

    .line 38
    .line 39
    const/4 v0, 0x4

    .line 40
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 41
    .line 42
    .line 43
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->mainBody:Ljava/lang/String;

    .line 44
    .line 45
    if-eqz p0, :cond_4

    .line 46
    .line 47
    const/4 v0, 0x5

    .line 48
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 49
    .line 50
    .line 51
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->inputBox:Lcom/p1/mobile/putong/feed/data/InputBoxComponent;

    .line 52
    .line 53
    if-eqz p0, :cond_5

    .line 54
    .line 55
    const/4 v0, 0x6

    .line 56
    sget-object v1, Lcom/p1/mobile/putong/feed/data/InputBoxComponent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 57
    .line 58
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 59
    .line 60
    .line 61
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->locations:Lcom/p1/mobile/putong/feed/data/LocationComponent;

    .line 62
    .line 63
    if-eqz p0, :cond_6

    .line 64
    .line 65
    const/4 v0, 0x7

    .line 66
    sget-object v1, Lcom/p1/mobile/putong/feed/data/LocationComponent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 67
    .line 68
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 69
    .line 70
    .line 71
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->buttons:Ljava/util/List;

    .line 72
    .line 73
    if-eqz p0, :cond_7

    .line 74
    .line 75
    sget-object v0, Lcom/p1/mobile/putong/feed/data/ButtonInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 76
    .line 77
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    const/16 v1, 0x8

    .line 82
    .line 83
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 84
    .line 85
    .line 86
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->close:Lcom/p1/mobile/putong/feed/data/CloseWindowComponent;

    .line 87
    .line 88
    if-eqz p0, :cond_8

    .line 89
    .line 90
    const/16 v0, 0x9

    .line 91
    .line 92
    sget-object v1, Lcom/p1/mobile/putong/feed/data/CloseWindowComponent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 93
    .line 94
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 95
    .line 96
    .line 97
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->occasion:Lcom/p1/mobile/putong/feed/data/OccasionComponent;

    .line 98
    .line 99
    if-eqz p0, :cond_9

    .line 100
    .line 101
    const/16 p1, 0xa

    .line 102
    .line 103
    sget-object v0, Lcom/p1/mobile/putong/feed/data/OccasionComponent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 104
    .line 105
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 106
    .line 107
    .line 108
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

    .line 109
    check-cast p1, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow$1;->serialize(Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
