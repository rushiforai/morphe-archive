.class Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->contents:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContentIdWrapper;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-static {v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->resonance:Ljava/lang/String;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    const/4 v1, 0x2

    .line 23
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    add-int/2addr p0, v0

    .line 28
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->greetingSummaryDetail:Lcom/p1/mobile/putong/core/data/GreetingSummary;

    .line 29
    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    const/4 v1, 0x3

    .line 33
    sget-object v2, Lcom/p1/mobile/putong/core/data/GreetingSummary;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 34
    .line 35
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    add-int/2addr p0, v0

    .line 40
    :cond_2
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 41
    .line 42
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 43
    check-cast p1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;-><init>()V

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
    if-eqz v0, :cond_5

    .line 13
    .line 14
    const/16 v2, 0xa

    .line 15
    .line 16
    if-eq v0, v2, :cond_4

    .line 17
    .line 18
    const/16 v2, 0x12

    .line 19
    .line 20
    if-eq v0, v2, :cond_3

    .line 21
    .line 22
    const/16 v2, 0x1a

    .line 23
    .line 24
    if-eq v0, v2, :cond_2

    .line 25
    .line 26
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->contents:Ljava/util/List;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 33
    .line 34
    .line 35
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->contents:Ljava/util/List;

    .line 36
    .line 37
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->resonance:Ljava/lang/String;

    .line 38
    .line 39
    if-nez p1, :cond_1

    .line 40
    .line 41
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->resonance:Ljava/lang/String;

    .line 42
    .line 43
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->greetingSummaryDetail:Lcom/p1/mobile/putong/core/data/GreetingSummary;

    .line 44
    .line 45
    if-nez p1, :cond_8

    .line 46
    .line 47
    invoke-static {}, Lcom/p1/mobile/putong/core/data/GreetingSummary;->new_()Lcom/p1/mobile/putong/core/data/GreetingSummary;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->greetingSummaryDetail:Lcom/p1/mobile/putong/core/data/GreetingSummary;

    .line 52
    .line 53
    return-object p0

    .line 54
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/data/GreetingSummary;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 55
    .line 56
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, Lcom/p1/mobile/putong/core/data/GreetingSummary;

    .line 61
    .line 62
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->greetingSummaryDetail:Lcom/p1/mobile/putong/core/data/GreetingSummary;

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->resonance:Ljava/lang/String;

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_4
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContentIdWrapper;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 73
    .line 74
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    check-cast v0, Ljava/util/List;

    .line 83
    .line 84
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->contents:Ljava/util/List;

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->contents:Ljava/util/List;

    .line 88
    .line 89
    if-nez p1, :cond_6

    .line 90
    .line 91
    new-instance p1, Ljava/util/ArrayList;

    .line 92
    .line 93
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 94
    .line 95
    .line 96
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->contents:Ljava/util/List;

    .line 97
    .line 98
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->resonance:Ljava/lang/String;

    .line 99
    .line 100
    if-nez p1, :cond_7

    .line 101
    .line 102
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->resonance:Ljava/lang/String;

    .line 103
    .line 104
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->greetingSummaryDetail:Lcom/p1/mobile/putong/core/data/GreetingSummary;

    .line 105
    .line 106
    if-nez p1, :cond_8

    .line 107
    .line 108
    invoke-static {}, Lcom/p1/mobile/putong/core/data/GreetingSummary;->new_()Lcom/p1/mobile/putong/core/data/GreetingSummary;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->greetingSummaryDetail:Lcom/p1/mobile/putong/core/data/GreetingSummary;

    .line 113
    .line 114
    :cond_8
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 115
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->contents:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContentIdWrapper;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->resonance:Ljava/lang/String;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    const/4 v0, 0x2

    .line 20
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->greetingSummaryDetail:Lcom/p1/mobile/putong/core/data/GreetingSummary;

    .line 24
    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    const/4 p1, 0x3

    .line 28
    sget-object v0, Lcom/p1/mobile/putong/core/data/GreetingSummary;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 29
    .line 30
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 31
    .line 32
    .line 33
    :cond_2
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 34
    check-cast p1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent$1;->serialize(Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
