.class Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;)I
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    iget v0, p1, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->type:I

    .line 3
    .line 4
    invoke-static {p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    const/4 v0, 0x2

    .line 9
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->active:Z

    .line 10
    .line 11
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    add-int/2addr p0, v0

    .line 16
    const/4 v0, 0x3

    .line 17
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->remain:J

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
    const/4 v0, 0x4

    .line 25
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->duration:J

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->dialog_ui:Lcom/p1/mobile/putong/core/data/IntlFlashStickerDialogSummaryData;

    .line 33
    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    const/4 v1, 0x5

    .line 37
    sget-object v2, Lcom/p1/mobile/putong/core/data/IntlFlashStickerDialogSummaryData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->option_data:Lcom/p1/mobile/putong/core/data/IntlMarketStickerOptionsData;

    .line 45
    .line 46
    if-eqz v0, :cond_1

    .line 47
    .line 48
    const/4 v1, 0x6

    .line 49
    sget-object v2, Lcom/p1/mobile/putong/core/data/IntlMarketStickerOptionsData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    :cond_1
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 57
    .line 58
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 59
    check-cast p1, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;-><init>()V

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
    if-eqz v0, :cond_7

    .line 11
    .line 12
    const/16 v1, 0x8

    .line 13
    .line 14
    if-eq v0, v1, :cond_6

    .line 15
    .line 16
    const/16 v1, 0x10

    .line 17
    .line 18
    if-eq v0, v1, :cond_5

    .line 19
    .line 20
    const/16 v1, 0x18

    .line 21
    .line 22
    if-eq v0, v1, :cond_4

    .line 23
    .line 24
    const/16 v1, 0x20

    .line 25
    .line 26
    if-eq v0, v1, :cond_3

    .line 27
    .line 28
    const/16 v1, 0x2a

    .line 29
    .line 30
    if-eq v0, v1, :cond_2

    .line 31
    .line 32
    const/16 v1, 0x32

    .line 33
    .line 34
    if-eq v0, v1, :cond_1

    .line 35
    .line 36
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->dialog_ui:Lcom/p1/mobile/putong/core/data/IntlFlashStickerDialogSummaryData;

    .line 37
    .line 38
    if-nez p1, :cond_0

    .line 39
    .line 40
    invoke-static {}, Lcom/p1/mobile/putong/core/data/IntlFlashStickerDialogSummaryData;->new_()Lcom/p1/mobile/putong/core/data/IntlFlashStickerDialogSummaryData;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->dialog_ui:Lcom/p1/mobile/putong/core/data/IntlFlashStickerDialogSummaryData;

    .line 45
    .line 46
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->option_data:Lcom/p1/mobile/putong/core/data/IntlMarketStickerOptionsData;

    .line 47
    .line 48
    if-nez p1, :cond_9

    .line 49
    .line 50
    invoke-static {}, Lcom/p1/mobile/putong/core/data/IntlMarketStickerOptionsData;->new_()Lcom/p1/mobile/putong/core/data/IntlMarketStickerOptionsData;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->option_data:Lcom/p1/mobile/putong/core/data/IntlMarketStickerOptionsData;

    .line 55
    .line 56
    return-object p0

    .line 57
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/data/IntlMarketStickerOptionsData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 58
    .line 59
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    check-cast v0, Lcom/p1/mobile/putong/core/data/IntlMarketStickerOptionsData;

    .line 64
    .line 65
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->option_data:Lcom/p1/mobile/putong/core/data/IntlMarketStickerOptionsData;

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/data/IntlFlashStickerDialogSummaryData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 69
    .line 70
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    check-cast v0, Lcom/p1/mobile/putong/core/data/IntlFlashStickerDialogSummaryData;

    .line 75
    .line 76
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->dialog_ui:Lcom/p1/mobile/putong/core/data/IntlFlashStickerDialogSummaryData;

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_3
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 80
    .line 81
    .line 82
    move-result-wide v0

    .line 83
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->duration:J

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_4
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 87
    .line 88
    .line 89
    move-result-wide v0

    .line 90
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->remain:J

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->active:Z

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    iput v0, p0, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->type:I

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->dialog_ui:Lcom/p1/mobile/putong/core/data/IntlFlashStickerDialogSummaryData;

    .line 108
    .line 109
    if-nez p1, :cond_8

    .line 110
    .line 111
    invoke-static {}, Lcom/p1/mobile/putong/core/data/IntlFlashStickerDialogSummaryData;->new_()Lcom/p1/mobile/putong/core/data/IntlFlashStickerDialogSummaryData;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->dialog_ui:Lcom/p1/mobile/putong/core/data/IntlFlashStickerDialogSummaryData;

    .line 116
    .line 117
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->option_data:Lcom/p1/mobile/putong/core/data/IntlMarketStickerOptionsData;

    .line 118
    .line 119
    if-nez p1, :cond_9

    .line 120
    .line 121
    invoke-static {}, Lcom/p1/mobile/putong/core/data/IntlMarketStickerOptionsData;->new_()Lcom/p1/mobile/putong/core/data/IntlMarketStickerOptionsData;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->option_data:Lcom/p1/mobile/putong/core/data/IntlMarketStickerOptionsData;

    .line 126
    .line 127
    :cond_9
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 128
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget v0, p1, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->type:I

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 5
    .line 6
    .line 7
    const/4 p0, 0x2

    .line 8
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->active:Z

    .line 9
    .line 10
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x3

    .line 14
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->remain:J

    .line 15
    .line 16
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x4

    .line 20
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->duration:J

    .line 21
    .line 22
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->dialog_ui:Lcom/p1/mobile/putong/core/data/IntlFlashStickerDialogSummaryData;

    .line 26
    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    const/4 v0, 0x5

    .line 30
    sget-object v1, Lcom/p1/mobile/putong/core/data/IntlFlashStickerDialogSummaryData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 31
    .line 32
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;->option_data:Lcom/p1/mobile/putong/core/data/IntlMarketStickerOptionsData;

    .line 36
    .line 37
    if-eqz p0, :cond_1

    .line 38
    .line 39
    const/4 p1, 0x6

    .line 40
    sget-object v0, Lcom/p1/mobile/putong/core/data/IntlMarketStickerOptionsData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 41
    .line 42
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 46
    check-cast p1, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData$1;->serialize(Lcom/p1/mobile/putong/core/data/IntlFlashStickerOptionData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
