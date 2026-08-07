.class Lcom/p1/mobile/putong/core/data/MonetizationConfiguration$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->complaint:Lcom/p1/mobile/putong/core/data/MonetizationConfigurationHighRisk;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/data/MonetizationConfigurationHighRisk;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->userTags:Lcom/p1/mobile/putong/core/data/UserTags;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    const/4 v1, 0x2

    .line 19
    sget-object v2, Lcom/p1/mobile/putong/core/data/UserTags;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    const/4 v0, 0x3

    .line 27
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->showCompliantEntry:Z

    .line 28
    .line 29
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    add-int/2addr p0, v0

    .line 34
    const/4 v0, 0x4

    .line 35
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->buyDialogHidePrice:Z

    .line 36
    .line 37
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    add-int/2addr p0, v0

    .line 42
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->homeIconSee:Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;

    .line 43
    .line 44
    if-eqz v0, :cond_2

    .line 45
    .line 46
    const/4 v1, 0x5

    .line 47
    sget-object v2, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 48
    .line 49
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    add-int/2addr p0, v0

    .line 54
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->homeIconVisitor:Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;

    .line 55
    .line 56
    if-eqz v0, :cond_3

    .line 57
    .line 58
    const/4 v1, 0x6

    .line 59
    sget-object v2, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->extConfig:Lcom/p1/mobile/putong/core/data/MonetizationConfigurationExtConfig;

    .line 67
    .line 68
    if-eqz v0, :cond_4

    .line 69
    .line 70
    const/4 v1, 0x7

    .line 71
    sget-object v2, Lcom/p1/mobile/putong/core/data/MonetizationConfigurationExtConfig;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    :cond_4
    const/16 v0, 0x8

    .line 79
    .line 80
    iget v1, p1, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->willPayScore:I

    .line 81
    .line 82
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    add-int/2addr p0, v0

    .line 87
    const/16 v0, 0x9

    .line 88
    .line 89
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->showIndexNearbyTab:Z

    .line 90
    .line 91
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    add-int/2addr p0, v0

    .line 96
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->membershipDesc:Ljava/util/Map;

    .line 97
    .line 98
    if-eqz v0, :cond_5

    .line 99
    .line 100
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 101
    .line 102
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->MAP_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->MAP_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    const/16 v2, 0xa

    .line 111
    .line 112
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    add-int/2addr p0, v0

    .line 117
    :cond_5
    const/16 v0, 0xb

    .line 118
    .line 119
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->showPrivateCustomTab:Z

    .line 120
    .line 121
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    add-int/2addr p0, v0

    .line 126
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->nearbyBlock:Lcom/p1/mobile/putong/core/data/NearbyBlock;

    .line 127
    .line 128
    if-eqz v0, :cond_6

    .line 129
    .line 130
    const/16 v1, 0xc

    .line 131
    .line 132
    sget-object v2, Lcom/p1/mobile/putong/core/data/NearbyBlock;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 133
    .line 134
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 135
    .line 136
    .line 137
    move-result v0

    .line 138
    add-int/2addr p0, v0

    .line 139
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->seeTrial:Lcom/p1/mobile/putong/core/data/SeeTrialConfiguration;

    .line 140
    .line 141
    if-eqz v0, :cond_7

    .line 142
    .line 143
    const/16 v1, 0xd

    .line 144
    .line 145
    sget-object v2, Lcom/p1/mobile/putong/core/data/SeeTrialConfiguration;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 146
    .line 147
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 148
    .line 149
    .line 150
    move-result v0

    .line 151
    add-int/2addr p0, v0

    .line 152
    :cond_7
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 153
    .line 154
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 155
    check-cast p1, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->complaint:Lcom/p1/mobile/putong/core/data/MonetizationConfigurationHighRisk;

    .line 14
    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MonetizationConfigurationHighRisk;->new_()Lcom/p1/mobile/putong/core/data/MonetizationConfigurationHighRisk;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->complaint:Lcom/p1/mobile/putong/core/data/MonetizationConfigurationHighRisk;

    .line 22
    .line 23
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->userTags:Lcom/p1/mobile/putong/core/data/UserTags;

    .line 24
    .line 25
    if-nez p1, :cond_1

    .line 26
    .line 27
    invoke-static {}, Lcom/p1/mobile/putong/core/data/UserTags;->new_()Lcom/p1/mobile/putong/core/data/UserTags;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->userTags:Lcom/p1/mobile/putong/core/data/UserTags;

    .line 32
    .line 33
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->membershipDesc:Ljava/util/Map;

    .line 34
    .line 35
    if-nez p1, :cond_4

    .line 36
    .line 37
    sget-object p1, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 38
    .line 39
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->membershipDesc:Ljava/util/Map;

    .line 40
    .line 41
    return-object p0

    .line 42
    :sswitch_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/SeeTrialConfiguration;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 43
    .line 44
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    check-cast v0, Lcom/p1/mobile/putong/core/data/SeeTrialConfiguration;

    .line 49
    .line 50
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->seeTrial:Lcom/p1/mobile/putong/core/data/SeeTrialConfiguration;

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :sswitch_1
    sget-object v0, Lcom/p1/mobile/putong/core/data/NearbyBlock;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 54
    .line 55
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    check-cast v0, Lcom/p1/mobile/putong/core/data/NearbyBlock;

    .line 60
    .line 61
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->nearbyBlock:Lcom/p1/mobile/putong/core/data/NearbyBlock;

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->showPrivateCustomTab:Z

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :sswitch_3
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 72
    .line 73
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->MAP_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->MAP_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    check-cast v0, Ljava/util/Map;

    .line 86
    .line 87
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->membershipDesc:Ljava/util/Map;

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->showIndexNearbyTab:Z

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    iput v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->willPayScore:I

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :sswitch_6
    sget-object v0, Lcom/p1/mobile/putong/core/data/MonetizationConfigurationExtConfig;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 105
    .line 106
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    check-cast v0, Lcom/p1/mobile/putong/core/data/MonetizationConfigurationExtConfig;

    .line 111
    .line 112
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->extConfig:Lcom/p1/mobile/putong/core/data/MonetizationConfigurationExtConfig;

    .line 113
    .line 114
    goto :goto_0

    .line 115
    :sswitch_7
    sget-object v0, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 116
    .line 117
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    check-cast v0, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;

    .line 122
    .line 123
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->homeIconVisitor:Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;

    .line 124
    .line 125
    goto :goto_0

    .line 126
    :sswitch_8
    sget-object v0, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 127
    .line 128
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    check-cast v0, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;

    .line 133
    .line 134
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->homeIconSee:Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;

    .line 135
    .line 136
    goto/16 :goto_0

    .line 137
    .line 138
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 139
    .line 140
    .line 141
    move-result v0

    .line 142
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->buyDialogHidePrice:Z

    .line 143
    .line 144
    goto/16 :goto_0

    .line 145
    .line 146
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->showCompliantEntry:Z

    .line 151
    .line 152
    goto/16 :goto_0

    .line 153
    .line 154
    :sswitch_b
    sget-object v0, Lcom/p1/mobile/putong/core/data/UserTags;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 155
    .line 156
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    check-cast v0, Lcom/p1/mobile/putong/core/data/UserTags;

    .line 161
    .line 162
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->userTags:Lcom/p1/mobile/putong/core/data/UserTags;

    .line 163
    .line 164
    goto/16 :goto_0

    .line 165
    .line 166
    :sswitch_c
    sget-object v0, Lcom/p1/mobile/putong/core/data/MonetizationConfigurationHighRisk;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 167
    .line 168
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    check-cast v0, Lcom/p1/mobile/putong/core/data/MonetizationConfigurationHighRisk;

    .line 173
    .line 174
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->complaint:Lcom/p1/mobile/putong/core/data/MonetizationConfigurationHighRisk;

    .line 175
    .line 176
    goto/16 :goto_0

    .line 177
    .line 178
    :sswitch_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->complaint:Lcom/p1/mobile/putong/core/data/MonetizationConfigurationHighRisk;

    .line 179
    .line 180
    if-nez p1, :cond_2

    .line 181
    .line 182
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MonetizationConfigurationHighRisk;->new_()Lcom/p1/mobile/putong/core/data/MonetizationConfigurationHighRisk;

    .line 183
    .line 184
    .line 185
    move-result-object p1

    .line 186
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->complaint:Lcom/p1/mobile/putong/core/data/MonetizationConfigurationHighRisk;

    .line 187
    .line 188
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->userTags:Lcom/p1/mobile/putong/core/data/UserTags;

    .line 189
    .line 190
    if-nez p1, :cond_3

    .line 191
    .line 192
    invoke-static {}, Lcom/p1/mobile/putong/core/data/UserTags;->new_()Lcom/p1/mobile/putong/core/data/UserTags;

    .line 193
    .line 194
    .line 195
    move-result-object p1

    .line 196
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->userTags:Lcom/p1/mobile/putong/core/data/UserTags;

    .line 197
    .line 198
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->membershipDesc:Ljava/util/Map;

    .line 199
    .line 200
    if-nez p1, :cond_4

    .line 201
    .line 202
    sget-object p1, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 203
    .line 204
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->membershipDesc:Ljava/util/Map;

    .line 205
    .line 206
    :cond_4
    return-object p0

    .line 207
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_d
        0xa -> :sswitch_c
        0x12 -> :sswitch_b
        0x18 -> :sswitch_a
        0x20 -> :sswitch_9
        0x2a -> :sswitch_8
        0x32 -> :sswitch_7
        0x3a -> :sswitch_6
        0x40 -> :sswitch_5
        0x48 -> :sswitch_4
        0x52 -> :sswitch_3
        0x58 -> :sswitch_2
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

    .line 207
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->complaint:Lcom/p1/mobile/putong/core/data/MonetizationConfigurationHighRisk;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/data/MonetizationConfigurationHighRisk;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->userTags:Lcom/p1/mobile/putong/core/data/UserTags;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    sget-object v1, Lcom/p1/mobile/putong/core/data/UserTags;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 17
    .line 18
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    const/4 p0, 0x3

    .line 22
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->showCompliantEntry:Z

    .line 23
    .line 24
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 25
    .line 26
    .line 27
    const/4 p0, 0x4

    .line 28
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->buyDialogHidePrice:Z

    .line 29
    .line 30
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->homeIconSee:Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;

    .line 34
    .line 35
    if-eqz p0, :cond_2

    .line 36
    .line 37
    const/4 v0, 0x5

    .line 38
    sget-object v1, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 39
    .line 40
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 41
    .line 42
    .line 43
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->homeIconVisitor:Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;

    .line 44
    .line 45
    if-eqz p0, :cond_3

    .line 46
    .line 47
    const/4 v0, 0x6

    .line 48
    sget-object v1, Lcom/p1/mobile/putong/core/data/HomeSeeVisitorConfigs;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 49
    .line 50
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 51
    .line 52
    .line 53
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->extConfig:Lcom/p1/mobile/putong/core/data/MonetizationConfigurationExtConfig;

    .line 54
    .line 55
    if-eqz p0, :cond_4

    .line 56
    .line 57
    const/4 v0, 0x7

    .line 58
    sget-object v1, Lcom/p1/mobile/putong/core/data/MonetizationConfigurationExtConfig;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 59
    .line 60
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 61
    .line 62
    .line 63
    :cond_4
    const/16 p0, 0x8

    .line 64
    .line 65
    iget v0, p1, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->willPayScore:I

    .line 66
    .line 67
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 68
    .line 69
    .line 70
    const/16 p0, 0x9

    .line 71
    .line 72
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->showIndexNearbyTab:Z

    .line 73
    .line 74
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 75
    .line 76
    .line 77
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->membershipDesc:Ljava/util/Map;

    .line 78
    .line 79
    if-eqz p0, :cond_5

    .line 80
    .line 81
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 82
    .line 83
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->MAP_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->MAP_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    const/16 v1, 0xa

    .line 92
    .line 93
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 94
    .line 95
    .line 96
    :cond_5
    const/16 p0, 0xb

    .line 97
    .line 98
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->showPrivateCustomTab:Z

    .line 99
    .line 100
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 101
    .line 102
    .line 103
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->nearbyBlock:Lcom/p1/mobile/putong/core/data/NearbyBlock;

    .line 104
    .line 105
    if-eqz p0, :cond_6

    .line 106
    .line 107
    const/16 v0, 0xc

    .line 108
    .line 109
    sget-object v1, Lcom/p1/mobile/putong/core/data/NearbyBlock;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 110
    .line 111
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 112
    .line 113
    .line 114
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;->seeTrial:Lcom/p1/mobile/putong/core/data/SeeTrialConfiguration;

    .line 115
    .line 116
    if-eqz p0, :cond_7

    .line 117
    .line 118
    const/16 p1, 0xd

    .line 119
    .line 120
    sget-object v0, Lcom/p1/mobile/putong/core/data/SeeTrialConfiguration;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 121
    .line 122
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 123
    .line 124
    .line 125
    :cond_7
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 126
    check-cast p1, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/MonetizationConfiguration$1;->serialize(Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
