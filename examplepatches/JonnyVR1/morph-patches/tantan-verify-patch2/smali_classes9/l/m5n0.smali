.class public Ll/m5n0;
.super Ll/gt4;
.source "SourceFile"


# instance fields
.field public m:Z

.field public n:Ll/yh2;


# direct methods
.method public constructor <init>(Ll/yql;Ll/yh2;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, p1, v0}, Ll/gt4;-><init>(Ll/yql;Lcom/p1/mobile/android/app/Act;)V

    .line 6
    .line 7
    .line 8
    iput-object p2, p0, Ll/m5n0;->n:Ll/yh2;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public f0(Ljava/util/List;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    move v2, v1

    .line 8
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v3

    .line 12
    const/4 v4, 0x1

    .line 13
    if-ge v2, v3, :cond_9

    .line 14
    .line 15
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 20
    .line 21
    if-nez v3, :cond_0

    .line 22
    .line 23
    new-instance v3, Ljava/lang/Exception;

    .line 24
    .line 25
    const-string v4, "liveMessage is null"

    .line 26
    .line 27
    invoke-direct {v3, v4}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v3}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    const-string v4, "[live][trace_problem]"

    .line 35
    .line 36
    invoke-static {v4, v3}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    goto/16 :goto_3

    .line 40
    .line 41
    :cond_0
    invoke-virtual {v3}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->isNotifyMessage()Z

    .line 42
    .line 43
    .line 44
    move-result v5

    .line 45
    if-eqz v5, :cond_1

    .line 46
    .line 47
    new-instance v5, Ll/m05;

    .line 48
    .line 49
    iget-object v6, p0, Ll/gt4;->j:Ll/yql;

    .line 50
    .line 51
    invoke-direct {v5, v3, v6}, Ll/m05;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ll/yql;)V

    .line 52
    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_1
    iget v5, v3, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->category:I

    .line 56
    .line 57
    sget v6, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->NORMAL_CHAT_CATEGORY:I

    .line 58
    .line 59
    if-ne v5, v6, :cond_2

    .line 60
    .line 61
    new-instance v5, Ll/i3p0;

    .line 62
    .line 63
    iget-object v6, p0, Ll/gt4;->j:Ll/yql;

    .line 64
    .line 65
    invoke-direct {v5, v3, v6}, Ll/i3p0;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ll/yql;)V

    .line 66
    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_2
    sget v6, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->VOICE_CHAT_CATEGORY:I

    .line 70
    .line 71
    if-ne v5, v6, :cond_4

    .line 72
    .line 73
    iget-boolean v5, p0, Ll/m5n0;->m:Z

    .line 74
    .line 75
    if-eqz v5, :cond_3

    .line 76
    .line 77
    new-instance v5, Ll/e9n0;

    .line 78
    .line 79
    iget-object v6, p0, Ll/gt4;->j:Ll/yql;

    .line 80
    .line 81
    invoke-direct {v5, v3, v6}, Ll/e9n0;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ll/yql;)V

    .line 82
    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_3
    new-instance v5, Ll/ban0;

    .line 86
    .line 87
    iget-object v6, p0, Ll/gt4;->j:Ll/yql;

    .line 88
    .line 89
    invoke-direct {v5, v3, v6}, Ll/ban0;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ll/yql;)V

    .line 90
    .line 91
    .line 92
    goto :goto_1

    .line 93
    :cond_4
    sget v6, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->VOICE_CHAT_MIC_EMOJI_CATEGORY:I

    .line 94
    .line 95
    if-ne v5, v6, :cond_5

    .line 96
    .line 97
    new-instance v5, Ll/gao0;

    .line 98
    .line 99
    iget-object v6, p0, Ll/m5n0;->n:Ll/yh2;

    .line 100
    .line 101
    iget-object v7, p0, Ll/gt4;->j:Ll/yql;

    .line 102
    .line 103
    invoke-direct {v5, v6, v3, v7}, Ll/gao0;-><init>(Ll/yh2;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ll/yql;)V

    .line 104
    .line 105
    .line 106
    goto :goto_1

    .line 107
    :cond_5
    sget v6, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->VOICE_CHAT_VIRTUAL_NOTICE_CATEGORY:I

    .line 108
    .line 109
    if-ne v5, v6, :cond_6

    .line 110
    .line 111
    new-instance v5, Ll/can0;

    .line 112
    .line 113
    iget-object v6, p0, Ll/gt4;->j:Ll/yql;

    .line 114
    .line 115
    invoke-direct {v5, v3, v6}, Ll/can0;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ll/yql;)V

    .line 116
    .line 117
    .line 118
    goto :goto_1

    .line 119
    :cond_6
    sget v6, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->MYSTERY_BOX_RECORD:I

    .line 120
    .line 121
    if-ne v5, v6, :cond_7

    .line 122
    .line 123
    new-instance v5, Ll/cb20;

    .line 124
    .line 125
    iget-object v6, p0, Ll/gt4;->j:Ll/yql;

    .line 126
    .line 127
    invoke-direct {v5, v3, v6}, Ll/cb20;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ll/yql;)V

    .line 128
    .line 129
    .line 130
    goto :goto_1

    .line 131
    :cond_7
    new-instance v5, Ll/i3p0;

    .line 132
    .line 133
    iget-object v6, p0, Ll/gt4;->j:Ll/yql;

    .line 134
    .line 135
    invoke-direct {v5, v3, v6}, Ll/i3p0;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ll/yql;)V

    .line 136
    .line 137
    .line 138
    :goto_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 139
    .line 140
    .line 141
    move-result v3

    .line 142
    sub-int/2addr v3, v4

    .line 143
    if-ne v2, v3, :cond_8

    .line 144
    .line 145
    goto :goto_2

    .line 146
    :cond_8
    move v4, v1

    .line 147
    :goto_2
    invoke-virtual {v5, v4}, Ll/dh2;->I(Z)V

    .line 148
    .line 149
    .line 150
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 151
    .line 152
    .line 153
    :goto_3
    add-int/lit8 v2, v2, 0x1

    .line 154
    .line 155
    goto/16 :goto_0

    .line 156
    .line 157
    :cond_9
    invoke-virtual {p0, v0, v4}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->a0(Ljava/util/List;Z)V

    .line 158
    .line 159
    .line 160
    return-void
.end method

.method public h0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/m5n0;->m:Z

    .line 2
    .line 3
    return-void
.end method
