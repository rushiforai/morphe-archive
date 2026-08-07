.class Lcom/p1/mobile/putong/data/NetReportSetting$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/NetReportSetting;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/NetReportSetting;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/NetReportSetting;)I
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/NetReportSetting;->enableNetReport:Z

    .line 3
    .line 4
    invoke-static {p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    const/4 v0, 0x2

    .line 9
    iget v1, p1, Lcom/p1/mobile/putong/data/NetReportSetting;->successRate:I

    .line 10
    .line 11
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    add-int/2addr p0, v0

    .line 16
    const/4 v0, 0x3

    .line 17
    iget v1, p1, Lcom/p1/mobile/putong/data/NetReportSetting;->errorRate:I

    .line 18
    .line 19
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    add-int/2addr p0, v0

    .line 24
    iget-object v0, p1, Lcom/p1/mobile/putong/data/NetReportSetting;->domains:Lcom/p1/mobile/putong/data/NetReportDomains;

    .line 25
    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    const/4 v1, 0x4

    .line 29
    sget-object v2, Lcom/p1/mobile/putong/data/NetReportDomains;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 30
    .line 31
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    add-int/2addr p0, v0

    .line 36
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/NetReportSetting;->reportDomains:Ljava/util/List;

    .line 37
    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 41
    .line 42
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    const/4 v2, 0x5

    .line 47
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    add-int/2addr p0, v0

    .line 52
    :cond_1
    const/4 v0, 0x6

    .line 53
    iget v1, p1, Lcom/p1/mobile/putong/data/NetReportSetting;->androidSuccessRate:I

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
    const/4 v0, 0x7

    .line 61
    iget v1, p1, Lcom/p1/mobile/putong/data/NetReportSetting;->androidErrorRate:I

    .line 62
    .line 63
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    add-int/2addr p0, v0

    .line 68
    const/16 v0, 0x8

    .line 69
    .line 70
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/NetReportSetting;->enableAndroidHttpdnsLogReport:Z

    .line 71
    .line 72
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    add-int/2addr p0, v0

    .line 77
    const/16 v0, 0x9

    .line 78
    .line 79
    iget v1, p1, Lcom/p1/mobile/putong/data/NetReportSetting;->androidHttpdnsLogRate:I

    .line 80
    .line 81
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    add-int/2addr p0, v0

    .line 86
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 87
    .line 88
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 89
    check-cast p1, Lcom/p1/mobile/putong/data/NetReportSetting;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/NetReportSetting$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/NetReportSetting;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/NetReportSetting;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/NetReportSetting;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/NetReportSetting;-><init>()V

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
    if-eqz v0, :cond_a

    .line 11
    .line 12
    const/16 v1, 0x8

    .line 13
    .line 14
    if-eq v0, v1, :cond_9

    .line 15
    .line 16
    const/16 v1, 0x10

    .line 17
    .line 18
    if-eq v0, v1, :cond_8

    .line 19
    .line 20
    const/16 v1, 0x18

    .line 21
    .line 22
    if-eq v0, v1, :cond_7

    .line 23
    .line 24
    const/16 v1, 0x22

    .line 25
    .line 26
    if-eq v0, v1, :cond_6

    .line 27
    .line 28
    const/16 v1, 0x2a

    .line 29
    .line 30
    if-eq v0, v1, :cond_5

    .line 31
    .line 32
    const/16 v1, 0x30

    .line 33
    .line 34
    if-eq v0, v1, :cond_4

    .line 35
    .line 36
    const/16 v1, 0x38

    .line 37
    .line 38
    if-eq v0, v1, :cond_3

    .line 39
    .line 40
    const/16 v1, 0x40

    .line 41
    .line 42
    if-eq v0, v1, :cond_2

    .line 43
    .line 44
    const/16 v1, 0x48

    .line 45
    .line 46
    if-eq v0, v1, :cond_1

    .line 47
    .line 48
    iget-object p1, p0, Lcom/p1/mobile/putong/data/NetReportSetting;->domains:Lcom/p1/mobile/putong/data/NetReportDomains;

    .line 49
    .line 50
    if-nez p1, :cond_0

    .line 51
    .line 52
    invoke-static {}, Lcom/p1/mobile/putong/data/NetReportDomains;->new_()Lcom/p1/mobile/putong/data/NetReportDomains;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    iput-object p1, p0, Lcom/p1/mobile/putong/data/NetReportSetting;->domains:Lcom/p1/mobile/putong/data/NetReportDomains;

    .line 57
    .line 58
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/NetReportSetting;->reportDomains:Ljava/util/List;

    .line 59
    .line 60
    if-nez p1, :cond_c

    .line 61
    .line 62
    new-instance p1, Ljava/util/ArrayList;

    .line 63
    .line 64
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 65
    .line 66
    .line 67
    iput-object p1, p0, Lcom/p1/mobile/putong/data/NetReportSetting;->reportDomains:Ljava/util/List;

    .line 68
    .line 69
    return-object p0

    .line 70
    :cond_1
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    iput v0, p0, Lcom/p1/mobile/putong/data/NetReportSetting;->androidHttpdnsLogRate:I

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_2
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/NetReportSetting;->enableAndroidHttpdnsLogReport:Z

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_3
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    iput v0, p0, Lcom/p1/mobile/putong/data/NetReportSetting;->androidErrorRate:I

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    iput v0, p0, Lcom/p1/mobile/putong/data/NetReportSetting;->androidSuccessRate:I

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_5
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 99
    .line 100
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    check-cast v0, Ljava/util/List;

    .line 109
    .line 110
    iput-object v0, p0, Lcom/p1/mobile/putong/data/NetReportSetting;->reportDomains:Ljava/util/List;

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_6
    sget-object v0, Lcom/p1/mobile/putong/data/NetReportDomains;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 114
    .line 115
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    check-cast v0, Lcom/p1/mobile/putong/data/NetReportDomains;

    .line 120
    .line 121
    iput-object v0, p0, Lcom/p1/mobile/putong/data/NetReportSetting;->domains:Lcom/p1/mobile/putong/data/NetReportDomains;

    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    iput v0, p0, Lcom/p1/mobile/putong/data/NetReportSetting;->errorRate:I

    .line 129
    .line 130
    goto :goto_0

    .line 131
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    iput v0, p0, Lcom/p1/mobile/putong/data/NetReportSetting;->successRate:I

    .line 136
    .line 137
    goto/16 :goto_0

    .line 138
    .line 139
    :cond_9
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/NetReportSetting;->enableNetReport:Z

    .line 144
    .line 145
    goto/16 :goto_0

    .line 146
    .line 147
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/NetReportSetting;->domains:Lcom/p1/mobile/putong/data/NetReportDomains;

    .line 148
    .line 149
    if-nez p1, :cond_b

    .line 150
    .line 151
    invoke-static {}, Lcom/p1/mobile/putong/data/NetReportDomains;->new_()Lcom/p1/mobile/putong/data/NetReportDomains;

    .line 152
    .line 153
    .line 154
    move-result-object p1

    .line 155
    iput-object p1, p0, Lcom/p1/mobile/putong/data/NetReportSetting;->domains:Lcom/p1/mobile/putong/data/NetReportDomains;

    .line 156
    .line 157
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/NetReportSetting;->reportDomains:Ljava/util/List;

    .line 158
    .line 159
    if-nez p1, :cond_c

    .line 160
    .line 161
    new-instance p1, Ljava/util/ArrayList;

    .line 162
    .line 163
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 164
    .line 165
    .line 166
    iput-object p1, p0, Lcom/p1/mobile/putong/data/NetReportSetting;->reportDomains:Ljava/util/List;

    .line 167
    .line 168
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

    .line 169
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/NetReportSetting$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/NetReportSetting;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/NetReportSetting;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/NetReportSetting;->enableNetReport:Z

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 5
    .line 6
    .line 7
    const/4 p0, 0x2

    .line 8
    iget v0, p1, Lcom/p1/mobile/putong/data/NetReportSetting;->successRate:I

    .line 9
    .line 10
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x3

    .line 14
    iget v0, p1, Lcom/p1/mobile/putong/data/NetReportSetting;->errorRate:I

    .line 15
    .line 16
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p1, Lcom/p1/mobile/putong/data/NetReportSetting;->domains:Lcom/p1/mobile/putong/data/NetReportDomains;

    .line 20
    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    const/4 v0, 0x4

    .line 24
    sget-object v1, Lcom/p1/mobile/putong/data/NetReportDomains;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 25
    .line 26
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/NetReportSetting;->reportDomains:Ljava/util/List;

    .line 30
    .line 31
    if-eqz p0, :cond_1

    .line 32
    .line 33
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    const/4 v1, 0x5

    .line 40
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 41
    .line 42
    .line 43
    :cond_1
    const/4 p0, 0x6

    .line 44
    iget v0, p1, Lcom/p1/mobile/putong/data/NetReportSetting;->androidSuccessRate:I

    .line 45
    .line 46
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 47
    .line 48
    .line 49
    const/4 p0, 0x7

    .line 50
    iget v0, p1, Lcom/p1/mobile/putong/data/NetReportSetting;->androidErrorRate:I

    .line 51
    .line 52
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 53
    .line 54
    .line 55
    const/16 p0, 0x8

    .line 56
    .line 57
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/NetReportSetting;->enableAndroidHttpdnsLogReport:Z

    .line 58
    .line 59
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 60
    .line 61
    .line 62
    const/16 p0, 0x9

    .line 63
    .line 64
    iget p1, p1, Lcom/p1/mobile/putong/data/NetReportSetting;->androidHttpdnsLogRate:I

    .line 65
    .line 66
    invoke-virtual {p2, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 70
    check-cast p1, Lcom/p1/mobile/putong/data/NetReportSetting;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/NetReportSetting$1;->serialize(Lcom/p1/mobile/putong/data/NetReportSetting;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
