.class Lcom/p1/mobile/putong/core/data/ActionPageFormat$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/ActionPageFormat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/ActionPageFormat;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/ActionPageFormat;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->pageTitle:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->pageSubTitle:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->pageContext:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->cardOptions:Ljava/util/List;

    .line 33
    .line 34
    if-eqz v0, :cond_3

    .line 35
    .line 36
    sget-object v1, Lcom/p1/mobile/putong/core/data/UserAction;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    const/4 v2, 0x4

    .line 43
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    add-int/2addr p0, v0

    .line 48
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->cardPatterns:Ljava/util/List;

    .line 49
    .line 50
    if-eqz v0, :cond_4

    .line 51
    .line 52
    sget-object v1, Lcom/p1/mobile/putong/core/data/CardPattern;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 53
    .line 54
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    const/4 v2, 0x5

    .line 59
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    add-int/2addr p0, v0

    .line 64
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->showRules:Ljava/lang/String;

    .line 65
    .line 66
    if-eqz v0, :cond_5

    .line 67
    .line 68
    const/4 v1, 0x6

    .line 69
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    add-int/2addr p0, v0

    .line 74
    :cond_5
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 75
    .line 76
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 77
    check-cast p1, Lcom/p1/mobile/putong/core/data/ActionPageFormat;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/ActionPageFormat$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/ActionPageFormat;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/ActionPageFormat;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/ActionPageFormat;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/ActionPageFormat;-><init>()V

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
    if-eqz v0, :cond_b

    .line 13
    .line 14
    const/16 v2, 0xa

    .line 15
    .line 16
    if-eq v0, v2, :cond_a

    .line 17
    .line 18
    const/16 v2, 0x12

    .line 19
    .line 20
    if-eq v0, v2, :cond_9

    .line 21
    .line 22
    const/16 v2, 0x1a

    .line 23
    .line 24
    if-eq v0, v2, :cond_8

    .line 25
    .line 26
    const/16 v2, 0x22

    .line 27
    .line 28
    if-eq v0, v2, :cond_7

    .line 29
    .line 30
    const/16 v2, 0x2a

    .line 31
    .line 32
    if-eq v0, v2, :cond_6

    .line 33
    .line 34
    const/16 v2, 0x32

    .line 35
    .line 36
    if-eq v0, v2, :cond_5

    .line 37
    .line 38
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->pageTitle:Ljava/lang/String;

    .line 39
    .line 40
    if-nez p1, :cond_0

    .line 41
    .line 42
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->pageTitle:Ljava/lang/String;

    .line 43
    .line 44
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->pageSubTitle:Ljava/lang/String;

    .line 45
    .line 46
    if-nez p1, :cond_1

    .line 47
    .line 48
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->pageSubTitle:Ljava/lang/String;

    .line 49
    .line 50
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->pageContext:Ljava/lang/String;

    .line 51
    .line 52
    if-nez p1, :cond_2

    .line 53
    .line 54
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->pageContext:Ljava/lang/String;

    .line 55
    .line 56
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->cardOptions:Ljava/util/List;

    .line 57
    .line 58
    if-nez p1, :cond_3

    .line 59
    .line 60
    new-instance p1, Ljava/util/ArrayList;

    .line 61
    .line 62
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 63
    .line 64
    .line 65
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->cardOptions:Ljava/util/List;

    .line 66
    .line 67
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->cardPatterns:Ljava/util/List;

    .line 68
    .line 69
    if-nez p1, :cond_4

    .line 70
    .line 71
    new-instance p1, Ljava/util/ArrayList;

    .line 72
    .line 73
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 74
    .line 75
    .line 76
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->cardPatterns:Ljava/util/List;

    .line 77
    .line 78
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->showRules:Ljava/lang/String;

    .line 79
    .line 80
    if-nez p1, :cond_11

    .line 81
    .line 82
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->showRules:Ljava/lang/String;

    .line 83
    .line 84
    return-object p0

    .line 85
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->showRules:Ljava/lang/String;

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_6
    sget-object v0, Lcom/p1/mobile/putong/core/data/CardPattern;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 93
    .line 94
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    check-cast v0, Ljava/util/List;

    .line 103
    .line 104
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->cardPatterns:Ljava/util/List;

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_7
    sget-object v0, Lcom/p1/mobile/putong/core/data/UserAction;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 108
    .line 109
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    check-cast v0, Ljava/util/List;

    .line 118
    .line 119
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->cardOptions:Ljava/util/List;

    .line 120
    .line 121
    goto :goto_0

    .line 122
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->pageContext:Ljava/lang/String;

    .line 127
    .line 128
    goto :goto_0

    .line 129
    :cond_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->pageSubTitle:Ljava/lang/String;

    .line 134
    .line 135
    goto/16 :goto_0

    .line 136
    .line 137
    :cond_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->pageTitle:Ljava/lang/String;

    .line 142
    .line 143
    goto/16 :goto_0

    .line 144
    .line 145
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->pageTitle:Ljava/lang/String;

    .line 146
    .line 147
    if-nez p1, :cond_c

    .line 148
    .line 149
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->pageTitle:Ljava/lang/String;

    .line 150
    .line 151
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->pageSubTitle:Ljava/lang/String;

    .line 152
    .line 153
    if-nez p1, :cond_d

    .line 154
    .line 155
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->pageSubTitle:Ljava/lang/String;

    .line 156
    .line 157
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->pageContext:Ljava/lang/String;

    .line 158
    .line 159
    if-nez p1, :cond_e

    .line 160
    .line 161
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->pageContext:Ljava/lang/String;

    .line 162
    .line 163
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->cardOptions:Ljava/util/List;

    .line 164
    .line 165
    if-nez p1, :cond_f

    .line 166
    .line 167
    new-instance p1, Ljava/util/ArrayList;

    .line 168
    .line 169
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 170
    .line 171
    .line 172
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->cardOptions:Ljava/util/List;

    .line 173
    .line 174
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->cardPatterns:Ljava/util/List;

    .line 175
    .line 176
    if-nez p1, :cond_10

    .line 177
    .line 178
    new-instance p1, Ljava/util/ArrayList;

    .line 179
    .line 180
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 181
    .line 182
    .line 183
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->cardPatterns:Ljava/util/List;

    .line 184
    .line 185
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->showRules:Ljava/lang/String;

    .line 186
    .line 187
    if-nez p1, :cond_11

    .line 188
    .line 189
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->showRules:Ljava/lang/String;

    .line 190
    .line 191
    :cond_11
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 192
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/ActionPageFormat$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/ActionPageFormat;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/ActionPageFormat;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->pageTitle:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->pageSubTitle:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->pageContext:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->cardOptions:Ljava/util/List;

    .line 26
    .line 27
    if-eqz p0, :cond_3

    .line 28
    .line 29
    sget-object v0, Lcom/p1/mobile/putong/core/data/UserAction;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const/4 v1, 0x4

    .line 36
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 37
    .line 38
    .line 39
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->cardPatterns:Ljava/util/List;

    .line 40
    .line 41
    if-eqz p0, :cond_4

    .line 42
    .line 43
    sget-object v0, Lcom/p1/mobile/putong/core/data/CardPattern;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 44
    .line 45
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const/4 v1, 0x5

    .line 50
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 51
    .line 52
    .line 53
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->showRules:Ljava/lang/String;

    .line 54
    .line 55
    if-eqz p0, :cond_5

    .line 56
    .line 57
    const/4 p1, 0x6

    .line 58
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 59
    .line 60
    .line 61
    :cond_5
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 62
    check-cast p1, Lcom/p1/mobile/putong/core/data/ActionPageFormat;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/ActionPageFormat$1;->serialize(Lcom/p1/mobile/putong/core/data/ActionPageFormat;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
