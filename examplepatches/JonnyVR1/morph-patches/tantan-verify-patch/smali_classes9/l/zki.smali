.class public Ll/zki;
.super Ll/a3g0;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/a3g0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Ll/p2g0;)V
    .locals 10

    .line 1
    invoke-interface {p1}, Ll/p2g0;->a()Ll/d3g0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/d3g0;->c()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ll/d3g0;->b()Landroid/content/Intent;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    new-instance v1, Landroid/content/Intent;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/d3g0;->a()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    const-class v3, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;

    .line 22
    .line 23
    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    const-string v2, "jump_to_tag"

    .line 27
    .line 28
    const/4 v3, 0x0

    .line 29
    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 30
    .line 31
    .line 32
    const-string v2, "LIVE_AUDIENCE_START_DATA"

    .line 33
    .line 34
    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 35
    .line 36
    .line 37
    const/high16 v2, 0x4000000

    .line 38
    .line 39
    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 40
    .line 41
    .line 42
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->live:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 43
    .line 44
    const-string v3, "[live][trace_problem]"

    .line 45
    .line 46
    if-nez v2, :cond_1

    .line 47
    .line 48
    new-instance v2, Ljava/lang/Exception;

    .line 49
    .line 50
    const-string v4, "startData.live is null."

    .line 51
    .line 52
    invoke-direct {v2, v4}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v2}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-static {v3, v2}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_1
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 64
    .line 65
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    if-eqz v2, :cond_2

    .line 70
    .line 71
    new-instance v2, Ljava/lang/Exception;

    .line 72
    .line 73
    const-string v4, "startData.live.id is null."

    .line 74
    .line 75
    invoke-direct {v2, v4}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    invoke-static {v2}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    invoke-static {v3, v2}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    :cond_2
    :goto_0
    const-string v2, "[live][enter]"

    .line 86
    .line 87
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    invoke-static {v2, v3}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    iget-object v6, v0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->traceId:Ljava/lang/String;

    .line 95
    .line 96
    iget-object v7, v0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->source:Ljava/lang/String;

    .line 97
    .line 98
    iget-object v8, v0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->live:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 99
    .line 100
    const/4 v9, 0x0

    .line 101
    const-string v4, "audience_start_live_click"

    .line 102
    .line 103
    const/4 v5, 0x0

    .line 104
    invoke-static/range {v4 .. v9}, Ll/fgt;->a(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ll/y20;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p0}, Ll/d3g0;->e()Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-eqz v0, :cond_3

    .line 112
    .line 113
    sget-object v0, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 114
    .line 115
    const-string v2, "voice_enter_room_rtc"

    .line 116
    .line 117
    invoke-virtual {v0, v2}, Ll/lej0;->d(Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    goto :goto_1

    .line 121
    :cond_3
    invoke-virtual {p0}, Ll/d3g0;->f()Z

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    if-eqz v0, :cond_4

    .line 126
    .line 127
    sget-object v0, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 128
    .line 129
    const-string v2, "live_enter_room_rtc"

    .line 130
    .line 131
    invoke-virtual {v0, v2}, Ll/lej0;->d(Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    goto :goto_1

    .line 135
    :cond_4
    sget-object v0, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 136
    .line 137
    const-string v2, "live_enter_room_cdn"

    .line 138
    .line 139
    invoke-virtual {v0, v2}, Ll/lej0;->d(Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    :goto_1
    invoke-virtual {p0, v1}, Ll/d3g0;->g(Landroid/content/Intent;)V

    .line 143
    .line 144
    .line 145
    invoke-interface {p1, p0}, Ll/p2g0;->b(Ll/d3g0;)Ll/p2g0;

    .line 146
    .line 147
    .line 148
    return-void
.end method
