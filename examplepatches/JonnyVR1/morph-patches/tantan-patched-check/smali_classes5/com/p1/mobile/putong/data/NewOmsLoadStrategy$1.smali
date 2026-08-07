.class Lcom/p1/mobile/putong/data/NewOmsLoadStrategy$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->strategy:Lcom/p1/mobile/putong/data/LoadStrategy;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    invoke-static {v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    const/4 v0, 0x2

    .line 17
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->pullSec:J

    .line 18
    .line 19
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    add-int/2addr p0, v0

    .line 24
    const/4 v0, 0x3

    .line 25
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->hotIntervalSec:J

    .line 26
    .line 27
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    add-int/2addr p0, v0

    .line 32
    iget-object v0, p1, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->strategy:Lcom/p1/mobile/putong/data/LoadStrategy;

    .line 33
    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    const/4 v1, 0x4

    .line 37
    sget-object v2, Lcom/p1/mobile/putong/data/LoadStrategy;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

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
    :cond_1
    const/4 v0, 0x5

    .line 45
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->waitMilSecAfterRequest:J

    .line 46
    .line 47
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    add-int/2addr p0, v0

    .line 52
    iget-object v0, p1, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->pushBoost:Ljava/lang/Boolean;

    .line 53
    .line 54
    if-eqz v0, :cond_2

    .line 55
    .line 56
    const/4 v1, 0x6

    .line 57
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    add-int/2addr p0, v0

    .line 66
    :cond_2
    const/4 v0, 0x7

    .line 67
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->timerIntervalSec:J

    .line 68
    .line 69
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    add-int/2addr p0, v0

    .line 74
    const/16 v0, 0x8

    .line 75
    .line 76
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->adUpdateMode:J

    .line 77
    .line 78
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    add-int/2addr p0, v0

    .line 83
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 84
    .line 85
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 86
    check-cast p1, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;-><init>()V

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
    if-eqz v2, :cond_9

    .line 13
    .line 14
    const/16 v3, 0x8

    .line 15
    .line 16
    if-eq v2, v3, :cond_8

    .line 17
    .line 18
    const/16 v3, 0x10

    .line 19
    .line 20
    if-eq v2, v3, :cond_7

    .line 21
    .line 22
    const/16 v3, 0x18

    .line 23
    .line 24
    if-eq v2, v3, :cond_6

    .line 25
    .line 26
    const/16 v3, 0x22

    .line 27
    .line 28
    if-eq v2, v3, :cond_5

    .line 29
    .line 30
    const/16 v3, 0x28

    .line 31
    .line 32
    if-eq v2, v3, :cond_4

    .line 33
    .line 34
    const/16 v3, 0x30

    .line 35
    .line 36
    if-eq v2, v3, :cond_3

    .line 37
    .line 38
    const/16 v3, 0x38

    .line 39
    .line 40
    if-eq v2, v3, :cond_2

    .line 41
    .line 42
    const/16 v3, 0x40

    .line 43
    .line 44
    if-eq v2, v3, :cond_1

    .line 45
    .line 46
    iget-object p1, p0, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->strategy:Lcom/p1/mobile/putong/data/LoadStrategy;

    .line 47
    .line 48
    if-nez p1, :cond_0

    .line 49
    .line 50
    if-eqz v1, :cond_0

    .line 51
    .line 52
    sget-object p1, Lcom/p1/mobile/putong/data/LoadStrategy;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 53
    .line 54
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    check-cast p1, Lcom/p1/mobile/putong/data/LoadStrategy;

    .line 63
    .line 64
    iput-object p1, p0, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->strategy:Lcom/p1/mobile/putong/data/LoadStrategy;

    .line 65
    .line 66
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->strategy:Lcom/p1/mobile/putong/data/LoadStrategy;

    .line 67
    .line 68
    if-nez p1, :cond_b

    .line 69
    .line 70
    sget-object p1, Lcom/p1/mobile/putong/data/LoadStrategy;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 71
    .line 72
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    check-cast p1, Lcom/p1/mobile/putong/data/LoadStrategy;

    .line 77
    .line 78
    iput-object p1, p0, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->strategy:Lcom/p1/mobile/putong/data/LoadStrategy;

    .line 79
    .line 80
    return-object p0

    .line 81
    :cond_1
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 82
    .line 83
    .line 84
    move-result-wide v2

    .line 85
    iput-wide v2, p0, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->adUpdateMode:J

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_2
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 89
    .line 90
    .line 91
    move-result-wide v2

    .line 92
    iput-wide v2, p0, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->timerIntervalSec:J

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_3
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 96
    .line 97
    .line 98
    move-result v2

    .line 99
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    iput-object v2, p0, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->pushBoost:Ljava/lang/Boolean;

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 107
    .line 108
    .line 109
    move-result-wide v2

    .line 110
    iput-wide v2, p0, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->waitMilSecAfterRequest:J

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_5
    sget-object v2, Lcom/p1/mobile/putong/data/LoadStrategy;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 114
    .line 115
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    check-cast v2, Lcom/p1/mobile/putong/data/LoadStrategy;

    .line 120
    .line 121
    iput-object v2, p0, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->strategy:Lcom/p1/mobile/putong/data/LoadStrategy;

    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 125
    .line 126
    .line 127
    move-result-wide v2

    .line 128
    iput-wide v2, p0, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->hotIntervalSec:J

    .line 129
    .line 130
    goto :goto_0

    .line 131
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 132
    .line 133
    .line 134
    move-result-wide v2

    .line 135
    iput-wide v2, p0, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->pullSec:J

    .line 136
    .line 137
    goto/16 :goto_0

    .line 138
    .line 139
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 144
    .line 145
    .line 146
    move-result-object v1

    .line 147
    goto/16 :goto_0

    .line 148
    .line 149
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->strategy:Lcom/p1/mobile/putong/data/LoadStrategy;

    .line 150
    .line 151
    if-nez p1, :cond_a

    .line 152
    .line 153
    if-eqz v1, :cond_a

    .line 154
    .line 155
    sget-object p1, Lcom/p1/mobile/putong/data/LoadStrategy;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 156
    .line 157
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 158
    .line 159
    .line 160
    move-result v1

    .line 161
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    check-cast p1, Lcom/p1/mobile/putong/data/LoadStrategy;

    .line 166
    .line 167
    iput-object p1, p0, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->strategy:Lcom/p1/mobile/putong/data/LoadStrategy;

    .line 168
    .line 169
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->strategy:Lcom/p1/mobile/putong/data/LoadStrategy;

    .line 170
    .line 171
    if-nez p1, :cond_b

    .line 172
    .line 173
    sget-object p1, Lcom/p1/mobile/putong/data/LoadStrategy;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 174
    .line 175
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 176
    .line 177
    .line 178
    move-result-object p1

    .line 179
    check-cast p1, Lcom/p1/mobile/putong/data/LoadStrategy;

    .line 180
    .line 181
    iput-object p1, p0, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->strategy:Lcom/p1/mobile/putong/data/LoadStrategy;

    .line 182
    .line 183
    :cond_b
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 184
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->strategy:Lcom/p1/mobile/putong/data/LoadStrategy;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 11
    .line 12
    .line 13
    :cond_0
    const/4 p0, 0x2

    .line 14
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->pullSec:J

    .line 15
    .line 16
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x3

    .line 20
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->hotIntervalSec:J

    .line 21
    .line 22
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p1, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->strategy:Lcom/p1/mobile/putong/data/LoadStrategy;

    .line 26
    .line 27
    if-eqz p0, :cond_1

    .line 28
    .line 29
    const/4 v0, 0x4

    .line 30
    sget-object v1, Lcom/p1/mobile/putong/data/LoadStrategy;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 31
    .line 32
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 33
    .line 34
    .line 35
    :cond_1
    const/4 p0, 0x5

    .line 36
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->waitMilSecAfterRequest:J

    .line 37
    .line 38
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p1, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->pushBoost:Ljava/lang/Boolean;

    .line 42
    .line 43
    if-eqz p0, :cond_2

    .line 44
    .line 45
    const/4 v0, 0x6

    .line 46
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 51
    .line 52
    .line 53
    :cond_2
    const/4 p0, 0x7

    .line 54
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->timerIntervalSec:J

    .line 55
    .line 56
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 57
    .line 58
    .line 59
    const/16 p0, 0x8

    .line 60
    .line 61
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;->adUpdateMode:J

    .line 62
    .line 63
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 67
    check-cast p1, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/NewOmsLoadStrategy$1;->serialize(Lcom/p1/mobile/putong/data/NewOmsLoadStrategy;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
