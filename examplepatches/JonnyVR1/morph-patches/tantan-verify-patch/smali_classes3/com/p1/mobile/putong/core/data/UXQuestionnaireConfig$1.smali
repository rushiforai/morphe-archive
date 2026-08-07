.class Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;)I
    .locals 2

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_enable:Z

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
    iget v1, p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_swipe_count_1:I

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
    iget v1, p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_register_day_1:I

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
    const/4 v0, 0x4

    .line 25
    iget v1, p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_max_time_1:I

    .line 26
    .line 27
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    add-int/2addr p0, v0

    .line 32
    const/4 v0, 0x5

    .line 33
    iget v1, p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_interval_day:I

    .line 34
    .line 35
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    add-int/2addr p0, v0

    .line 40
    const/4 v0, 0x6

    .line 41
    iget v1, p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_swipe_count_2:I

    .line 42
    .line 43
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    add-int/2addr p0, v0

    .line 48
    const/4 v0, 0x7

    .line 49
    iget v1, p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_register_day_2:I

    .line 50
    .line 51
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    add-int/2addr p0, v0

    .line 56
    const/16 v0, 0x8

    .line 57
    .line 58
    iget v1, p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_list_register_day:I

    .line 59
    .line 60
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    add-int/2addr p0, v0

    .line 65
    const/16 v0, 0x9

    .line 66
    .line 67
    iget v1, p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_detail_register_day:I

    .line 68
    .line 69
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    add-int/2addr p0, v0

    .line 74
    const/16 v0, 0xa

    .line 75
    .line 76
    iget v1, p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_max_time_2:I

    .line 77
    .line 78
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    add-int/2addr p0, v0

    .line 83
    const/16 v0, 0xb

    .line 84
    .line 85
    iget v1, p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_list_interval_day:I

    .line 86
    .line 87
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    add-int/2addr p0, v0

    .line 92
    const/16 v0, 0xc

    .line 93
    .line 94
    iget v1, p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_list_max_time:I

    .line 95
    .line 96
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    add-int/2addr p0, v0

    .line 101
    const/16 v0, 0xd

    .line 102
    .line 103
    iget v1, p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_last_msg_day:I

    .line 104
    .line 105
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    add-int/2addr p0, v0

    .line 110
    const/16 v0, 0xe

    .line 111
    .line 112
    iget v1, p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_detail_interval_day:I

    .line 113
    .line 114
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    add-int/2addr p0, v0

    .line 119
    const/16 v0, 0xf

    .line 120
    .line 121
    iget v1, p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_detail_max_time:I

    .line 122
    .line 123
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    add-int/2addr p0, v0

    .line 128
    const/16 v0, 0x10

    .line 129
    .line 130
    iget v1, p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_detail_mm_min:I

    .line 131
    .line 132
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    add-int/2addr p0, v0

    .line 137
    const/16 v0, 0x11

    .line 138
    .line 139
    iget v1, p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_detail_mm_max:I

    .line 140
    .line 141
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    add-int/2addr p0, v0

    .line 146
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 147
    .line 148
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 149
    check-cast p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;-><init>()V

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
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iput v0, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_detail_mm_max:I

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    iput v0, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_detail_mm_min:I

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput v0, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_detail_max_time:I

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    iput v0, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_detail_interval_day:I

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    iput v0, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_last_msg_day:I

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    iput v0, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_list_max_time:I

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    iput v0, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_list_interval_day:I

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    iput v0, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_max_time_2:I

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    iput v0, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_detail_register_day:I

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    iput v0, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_list_register_day:I

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    iput v0, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_register_day_2:I

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    iput v0, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_swipe_count_2:I

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    iput v0, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_interval_day:I

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :sswitch_d
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    iput v0, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_max_time_1:I

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :sswitch_e
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    iput v0, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_register_day_1:I

    .line 117
    .line 118
    goto :goto_0

    .line 119
    :sswitch_f
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    iput v0, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_swipe_count_1:I

    .line 124
    .line 125
    goto :goto_0

    .line 126
    :sswitch_10
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_enable:Z

    .line 131
    .line 132
    goto :goto_0

    .line 133
    :sswitch_data_0
    .sparse-switch
        0x8 -> :sswitch_10
        0x10 -> :sswitch_f
        0x18 -> :sswitch_e
        0x20 -> :sswitch_d
        0x28 -> :sswitch_c
        0x30 -> :sswitch_b
        0x38 -> :sswitch_a
        0x40 -> :sswitch_9
        0x48 -> :sswitch_8
        0x50 -> :sswitch_7
        0x58 -> :sswitch_6
        0x60 -> :sswitch_5
        0x68 -> :sswitch_4
        0x70 -> :sswitch_3
        0x78 -> :sswitch_2
        0x80 -> :sswitch_1
        0x88 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 133
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_enable:Z

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 5
    .line 6
    .line 7
    const/4 p0, 0x2

    .line 8
    iget v0, p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_swipe_count_1:I

    .line 9
    .line 10
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x3

    .line 14
    iget v0, p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_register_day_1:I

    .line 15
    .line 16
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x4

    .line 20
    iget v0, p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_max_time_1:I

    .line 21
    .line 22
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x5

    .line 26
    iget v0, p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_interval_day:I

    .line 27
    .line 28
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 29
    .line 30
    .line 31
    const/4 p0, 0x6

    .line 32
    iget v0, p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_swipe_count_2:I

    .line 33
    .line 34
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 35
    .line 36
    .line 37
    const/4 p0, 0x7

    .line 38
    iget v0, p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_register_day_2:I

    .line 39
    .line 40
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 41
    .line 42
    .line 43
    const/16 p0, 0x8

    .line 44
    .line 45
    iget v0, p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_list_register_day:I

    .line 46
    .line 47
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 48
    .line 49
    .line 50
    const/16 p0, 0x9

    .line 51
    .line 52
    iget v0, p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_detail_register_day:I

    .line 53
    .line 54
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 55
    .line 56
    .line 57
    const/16 p0, 0xa

    .line 58
    .line 59
    iget v0, p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_max_time_2:I

    .line 60
    .line 61
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 62
    .line 63
    .line 64
    const/16 p0, 0xb

    .line 65
    .line 66
    iget v0, p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_list_interval_day:I

    .line 67
    .line 68
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 69
    .line 70
    .line 71
    const/16 p0, 0xc

    .line 72
    .line 73
    iget v0, p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_list_max_time:I

    .line 74
    .line 75
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 76
    .line 77
    .line 78
    const/16 p0, 0xd

    .line 79
    .line 80
    iget v0, p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_last_msg_day:I

    .line 81
    .line 82
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 83
    .line 84
    .line 85
    const/16 p0, 0xe

    .line 86
    .line 87
    iget v0, p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_detail_interval_day:I

    .line 88
    .line 89
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 90
    .line 91
    .line 92
    const/16 p0, 0xf

    .line 93
    .line 94
    iget v0, p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_detail_max_time:I

    .line 95
    .line 96
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 97
    .line 98
    .line 99
    const/16 p0, 0x10

    .line 100
    .line 101
    iget v0, p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_detail_mm_min:I

    .line 102
    .line 103
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 104
    .line 105
    .line 106
    const/16 p0, 0x11

    .line 107
    .line 108
    iget p1, p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_detail_mm_max:I

    .line 109
    .line 110
    invoke-virtual {p2, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 111
    .line 112
    .line 113
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 114
    check-cast p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig$1;->serialize(Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
