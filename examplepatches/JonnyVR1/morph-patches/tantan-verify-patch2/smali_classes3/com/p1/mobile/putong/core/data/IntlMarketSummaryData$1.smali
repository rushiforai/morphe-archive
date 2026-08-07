.class Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->bg_color:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->bg_url:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->main_title:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->main_title_font_color:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->sub_title:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->sub_title_font_color:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->confirm_btn_color:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->confirm_btn_desc:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->confirm_btn_font_color:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->confirm_btn_bg_url:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->logo_url:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->sub_confirm_button_desc:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->sub_confirm_button_font_color:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->selected_circle_color:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->unselected_circle_color:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->transit_summary:Lcom/p1/mobile/putong/core/data/IntlMarketTransitSummaryData;

    .line 161
    .line 162
    if-eqz v0, :cond_f

    .line 163
    .line 164
    const/16 v1, 0x10

    .line 165
    .line 166
    sget-object v2, Lcom/p1/mobile/putong/core/data/IntlMarketTransitSummaryData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 167
    .line 168
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 169
    .line 170
    .line 171
    move-result v0

    .line 172
    add-int/2addr p0, v0

    .line 173
    :cond_f
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 174
    .line 175
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 176
    check-cast p1, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->bg_color:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->bg_color:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->bg_url:Ljava/lang/String;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->bg_url:Ljava/lang/String;

    .line 26
    .line 27
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->main_title:Ljava/lang/String;

    .line 28
    .line 29
    if-nez p1, :cond_2

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->main_title:Ljava/lang/String;

    .line 32
    .line 33
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->main_title_font_color:Ljava/lang/String;

    .line 34
    .line 35
    if-nez p1, :cond_3

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->main_title_font_color:Ljava/lang/String;

    .line 38
    .line 39
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->sub_title:Ljava/lang/String;

    .line 40
    .line 41
    if-nez p1, :cond_4

    .line 42
    .line 43
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->sub_title:Ljava/lang/String;

    .line 44
    .line 45
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->sub_title_font_color:Ljava/lang/String;

    .line 46
    .line 47
    if-nez p1, :cond_5

    .line 48
    .line 49
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->sub_title_font_color:Ljava/lang/String;

    .line 50
    .line 51
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->confirm_btn_color:Ljava/lang/String;

    .line 52
    .line 53
    if-nez p1, :cond_6

    .line 54
    .line 55
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->confirm_btn_color:Ljava/lang/String;

    .line 56
    .line 57
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->confirm_btn_desc:Ljava/lang/String;

    .line 58
    .line 59
    if-nez p1, :cond_7

    .line 60
    .line 61
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->confirm_btn_desc:Ljava/lang/String;

    .line 62
    .line 63
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->confirm_btn_font_color:Ljava/lang/String;

    .line 64
    .line 65
    if-nez p1, :cond_8

    .line 66
    .line 67
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->confirm_btn_font_color:Ljava/lang/String;

    .line 68
    .line 69
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->confirm_btn_bg_url:Ljava/lang/String;

    .line 70
    .line 71
    if-nez p1, :cond_9

    .line 72
    .line 73
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->confirm_btn_bg_url:Ljava/lang/String;

    .line 74
    .line 75
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->logo_url:Ljava/lang/String;

    .line 76
    .line 77
    if-nez p1, :cond_a

    .line 78
    .line 79
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->logo_url:Ljava/lang/String;

    .line 80
    .line 81
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->sub_confirm_button_desc:Ljava/lang/String;

    .line 82
    .line 83
    if-nez p1, :cond_b

    .line 84
    .line 85
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->sub_confirm_button_desc:Ljava/lang/String;

    .line 86
    .line 87
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->sub_confirm_button_font_color:Ljava/lang/String;

    .line 88
    .line 89
    if-nez p1, :cond_c

    .line 90
    .line 91
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->sub_confirm_button_font_color:Ljava/lang/String;

    .line 92
    .line 93
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->selected_circle_color:Ljava/lang/String;

    .line 94
    .line 95
    if-nez p1, :cond_d

    .line 96
    .line 97
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->selected_circle_color:Ljava/lang/String;

    .line 98
    .line 99
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->unselected_circle_color:Ljava/lang/String;

    .line 100
    .line 101
    if-nez p1, :cond_e

    .line 102
    .line 103
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->unselected_circle_color:Ljava/lang/String;

    .line 104
    .line 105
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->transit_summary:Lcom/p1/mobile/putong/core/data/IntlMarketTransitSummaryData;

    .line 106
    .line 107
    if-nez p1, :cond_1e

    .line 108
    .line 109
    invoke-static {}, Lcom/p1/mobile/putong/core/data/IntlMarketTransitSummaryData;->new_()Lcom/p1/mobile/putong/core/data/IntlMarketTransitSummaryData;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->transit_summary:Lcom/p1/mobile/putong/core/data/IntlMarketTransitSummaryData;

    .line 114
    .line 115
    return-object p0

    .line 116
    :sswitch_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/IntlMarketTransitSummaryData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 117
    .line 118
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    check-cast v0, Lcom/p1/mobile/putong/core/data/IntlMarketTransitSummaryData;

    .line 123
    .line 124
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->transit_summary:Lcom/p1/mobile/putong/core/data/IntlMarketTransitSummaryData;

    .line 125
    .line 126
    goto :goto_0

    .line 127
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->unselected_circle_color:Ljava/lang/String;

    .line 132
    .line 133
    goto :goto_0

    .line 134
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->selected_circle_color:Ljava/lang/String;

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->sub_confirm_button_font_color:Ljava/lang/String;

    .line 147
    .line 148
    goto/16 :goto_0

    .line 149
    .line 150
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->sub_confirm_button_desc:Ljava/lang/String;

    .line 155
    .line 156
    goto/16 :goto_0

    .line 157
    .line 158
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->logo_url:Ljava/lang/String;

    .line 163
    .line 164
    goto/16 :goto_0

    .line 165
    .line 166
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->confirm_btn_bg_url:Ljava/lang/String;

    .line 171
    .line 172
    goto/16 :goto_0

    .line 173
    .line 174
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->confirm_btn_font_color:Ljava/lang/String;

    .line 179
    .line 180
    goto/16 :goto_0

    .line 181
    .line 182
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->confirm_btn_desc:Ljava/lang/String;

    .line 187
    .line 188
    goto/16 :goto_0

    .line 189
    .line 190
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->confirm_btn_color:Ljava/lang/String;

    .line 195
    .line 196
    goto/16 :goto_0

    .line 197
    .line 198
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->sub_title_font_color:Ljava/lang/String;

    .line 203
    .line 204
    goto/16 :goto_0

    .line 205
    .line 206
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->sub_title:Ljava/lang/String;

    .line 211
    .line 212
    goto/16 :goto_0

    .line 213
    .line 214
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object v0

    .line 218
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->main_title_font_color:Ljava/lang/String;

    .line 219
    .line 220
    goto/16 :goto_0

    .line 221
    .line 222
    :sswitch_d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object v0

    .line 226
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->main_title:Ljava/lang/String;

    .line 227
    .line 228
    goto/16 :goto_0

    .line 229
    .line 230
    :sswitch_e
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 231
    .line 232
    .line 233
    move-result-object v0

    .line 234
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->bg_url:Ljava/lang/String;

    .line 235
    .line 236
    goto/16 :goto_0

    .line 237
    .line 238
    :sswitch_f
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->bg_color:Ljava/lang/String;

    .line 243
    .line 244
    goto/16 :goto_0

    .line 245
    .line 246
    :sswitch_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->bg_color:Ljava/lang/String;

    .line 247
    .line 248
    if-nez p1, :cond_f

    .line 249
    .line 250
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->bg_color:Ljava/lang/String;

    .line 251
    .line 252
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->bg_url:Ljava/lang/String;

    .line 253
    .line 254
    if-nez p1, :cond_10

    .line 255
    .line 256
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->bg_url:Ljava/lang/String;

    .line 257
    .line 258
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->main_title:Ljava/lang/String;

    .line 259
    .line 260
    if-nez p1, :cond_11

    .line 261
    .line 262
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->main_title:Ljava/lang/String;

    .line 263
    .line 264
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->main_title_font_color:Ljava/lang/String;

    .line 265
    .line 266
    if-nez p1, :cond_12

    .line 267
    .line 268
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->main_title_font_color:Ljava/lang/String;

    .line 269
    .line 270
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->sub_title:Ljava/lang/String;

    .line 271
    .line 272
    if-nez p1, :cond_13

    .line 273
    .line 274
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->sub_title:Ljava/lang/String;

    .line 275
    .line 276
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->sub_title_font_color:Ljava/lang/String;

    .line 277
    .line 278
    if-nez p1, :cond_14

    .line 279
    .line 280
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->sub_title_font_color:Ljava/lang/String;

    .line 281
    .line 282
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->confirm_btn_color:Ljava/lang/String;

    .line 283
    .line 284
    if-nez p1, :cond_15

    .line 285
    .line 286
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->confirm_btn_color:Ljava/lang/String;

    .line 287
    .line 288
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->confirm_btn_desc:Ljava/lang/String;

    .line 289
    .line 290
    if-nez p1, :cond_16

    .line 291
    .line 292
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->confirm_btn_desc:Ljava/lang/String;

    .line 293
    .line 294
    :cond_16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->confirm_btn_font_color:Ljava/lang/String;

    .line 295
    .line 296
    if-nez p1, :cond_17

    .line 297
    .line 298
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->confirm_btn_font_color:Ljava/lang/String;

    .line 299
    .line 300
    :cond_17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->confirm_btn_bg_url:Ljava/lang/String;

    .line 301
    .line 302
    if-nez p1, :cond_18

    .line 303
    .line 304
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->confirm_btn_bg_url:Ljava/lang/String;

    .line 305
    .line 306
    :cond_18
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->logo_url:Ljava/lang/String;

    .line 307
    .line 308
    if-nez p1, :cond_19

    .line 309
    .line 310
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->logo_url:Ljava/lang/String;

    .line 311
    .line 312
    :cond_19
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->sub_confirm_button_desc:Ljava/lang/String;

    .line 313
    .line 314
    if-nez p1, :cond_1a

    .line 315
    .line 316
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->sub_confirm_button_desc:Ljava/lang/String;

    .line 317
    .line 318
    :cond_1a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->sub_confirm_button_font_color:Ljava/lang/String;

    .line 319
    .line 320
    if-nez p1, :cond_1b

    .line 321
    .line 322
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->sub_confirm_button_font_color:Ljava/lang/String;

    .line 323
    .line 324
    :cond_1b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->selected_circle_color:Ljava/lang/String;

    .line 325
    .line 326
    if-nez p1, :cond_1c

    .line 327
    .line 328
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->selected_circle_color:Ljava/lang/String;

    .line 329
    .line 330
    :cond_1c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->unselected_circle_color:Ljava/lang/String;

    .line 331
    .line 332
    if-nez p1, :cond_1d

    .line 333
    .line 334
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->unselected_circle_color:Ljava/lang/String;

    .line 335
    .line 336
    :cond_1d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->transit_summary:Lcom/p1/mobile/putong/core/data/IntlMarketTransitSummaryData;

    .line 337
    .line 338
    if-nez p1, :cond_1e

    .line 339
    .line 340
    invoke-static {}, Lcom/p1/mobile/putong/core/data/IntlMarketTransitSummaryData;->new_()Lcom/p1/mobile/putong/core/data/IntlMarketTransitSummaryData;

    .line 341
    .line 342
    .line 343
    move-result-object p1

    .line 344
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->transit_summary:Lcom/p1/mobile/putong/core/data/IntlMarketTransitSummaryData;

    .line 345
    .line 346
    :cond_1e
    return-object p0

    .line 347
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_10
        0xa -> :sswitch_f
        0x12 -> :sswitch_e
        0x1a -> :sswitch_d
        0x22 -> :sswitch_c
        0x2a -> :sswitch_b
        0x32 -> :sswitch_a
        0x3a -> :sswitch_9
        0x42 -> :sswitch_8
        0x4a -> :sswitch_7
        0x52 -> :sswitch_6
        0x5a -> :sswitch_5
        0x62 -> :sswitch_4
        0x6a -> :sswitch_3
        0x72 -> :sswitch_2
        0x7a -> :sswitch_1
        0x82 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 347
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->bg_color:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->bg_url:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->main_title:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->main_title_font_color:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->sub_title:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->sub_title_font_color:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->confirm_btn_color:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->confirm_btn_desc:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->confirm_btn_font_color:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->confirm_btn_bg_url:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->logo_url:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->sub_confirm_button_desc:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->sub_confirm_button_font_color:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->selected_circle_color:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->unselected_circle_color:Ljava/lang/String;

    .line 121
    .line 122
    if-eqz p0, :cond_e

    .line 123
    .line 124
    const/16 v0, 0xf

    .line 125
    .line 126
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 127
    .line 128
    .line 129
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;->transit_summary:Lcom/p1/mobile/putong/core/data/IntlMarketTransitSummaryData;

    .line 130
    .line 131
    if-eqz p0, :cond_f

    .line 132
    .line 133
    const/16 p1, 0x10

    .line 134
    .line 135
    sget-object v0, Lcom/p1/mobile/putong/core/data/IntlMarketTransitSummaryData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 136
    .line 137
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 138
    .line 139
    .line 140
    :cond_f
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 141
    check-cast p1, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData$1;->serialize(Lcom/p1/mobile/putong/core/data/IntlMarketSummaryData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
