.class public Ll/b6f0;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/ou40;",
        ">;"
    }
.end annotation


# instance fields
.field public final i:Ll/z4f0;

.field public j:Lcom/p1/mobile/putong/live/base/data/BLiveShootGameInfo;

.field public k:Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;

.field public final l:Ll/ft5;

.field public m:Ljava/lang/Integer;

.field public n:I

.field public final o:Ll/fyd0;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SV_USE_DUP_ID"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/z4f0;

    .line 5
    .line 6
    invoke-direct {p1}, Ll/z4f0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/b6f0;->i:Ll/z4f0;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput-object p1, p0, Ll/b6f0;->k:Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;

    .line 13
    .line 14
    new-instance p1, Ll/ft5;

    .line 15
    .line 16
    invoke-direct {p1}, Ll/ft5;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Ll/b6f0;->l:Ll/ft5;

    .line 20
    .line 21
    const/4 p1, 0x0

    .line 22
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Ll/b6f0;->m:Ljava/lang/Integer;

    .line 27
    .line 28
    iput p1, p0, Ll/b6f0;->n:I

    .line 29
    .line 30
    new-instance p1, Ll/fyd0;

    .line 31
    .line 32
    new-instance v0, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    const-string v1, "shoot_game_task_stage_clicked_"

    .line 35
    .line 36
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 47
    .line 48
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-direct {p1, v0}, Ll/fyd0;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    iput-object p1, p0, Ll/b6f0;->o:Ll/fyd0;

    .line 63
    .line 64
    return-void
.end method

.method public static synthetic J3(Ll/b6f0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/b6f0;->a4()V

    return-void
.end method

.method public static synthetic K3(Ll/b6f0;Ll/c5f0;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/b6f0;->c4(Ll/c5f0;)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic L3(Ljava/lang/Long;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic M3(Ll/b6f0;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/b6f0;->Z3(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic N3(Ll/b6f0;Ll/a5f0;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/b6f0;->d4(Ll/a5f0;)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic O3(Ll/b6f0;ZLcom/p1/mobile/putong/live/base/data/BLiveShootGameInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/b6f0;->X3(ZLcom/p1/mobile/putong/live/base/data/BLiveShootGameInfo;)V

    return-void
.end method

.method public static synthetic P3(Ll/b6f0;Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/b6f0;->b4(Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;)V

    return-void
.end method

.method public static synthetic R3(Ll/b6f0;Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/b6f0;->W3(Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;)V

    return-void
.end method

.method public static synthetic S3(Ll/b6f0;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/b6f0;->Y3(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic T3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic U3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private V3(Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;)V
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "completeTask:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "shootGame"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/b6f0;->i:Ll/z4f0;

    .line 21
    .line 22
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 23
    .line 24
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iget v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;->stage:I

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    check-cast v3, Ll/ou40;

    .line 35
    .line 36
    invoke-virtual {v3}, Ll/vp20;->o()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    const/4 v4, 0x0

    .line 41
    invoke-virtual {v0, v1, v4, v2, v3}, Ll/z4f0;->c(Ljava/lang/String;ZILjava/lang/String;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    new-instance v1, Ll/r5f0;

    .line 50
    .line 51
    invoke-direct {v1, p0, p1}, Ll/r5f0;-><init>(Ll/b6f0;Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method private synthetic Z3(Ljava/lang/Long;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/b6f0;->m:Ljava/lang/Integer;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    add-int/lit8 p1, p1, -0x1

    .line 8
    .line 9
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Ll/b6f0;->m:Ljava/lang/Integer;

    .line 14
    .line 15
    return-void
.end method

.method private g4(Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;)Z
    .locals 5

    .line 1
    iget-object v0, p0, Ll/b6f0;->o:Ll/fyd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/fyd0;->d()D

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    double-to-int v0, v0

    .line 8
    iget-object p0, p0, Ll/b6f0;->o:Ll/fyd0;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/fyd0;->e()D

    .line 11
    .line 12
    .line 13
    move-result-wide v1

    .line 14
    double-to-long v1, v1

    .line 15
    iget p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;->stage:I

    .line 16
    .line 17
    const/4 p1, 0x1

    .line 18
    if-eq v0, p0, :cond_0

    .line 19
    .line 20
    return p1

    .line 21
    :cond_0
    invoke-static {}, Ll/pzi0;->n()J

    .line 22
    .line 23
    .line 24
    move-result-wide v3

    .line 25
    cmp-long p0, v1, v3

    .line 26
    .line 27
    if-eqz p0, :cond_1

    .line 28
    .line 29
    return p1

    .line 30
    :cond_1
    const/4 p0, 0x0

    .line 31
    return p0
.end method

.method private h4(Lcom/p1/mobile/putong/live/base/data/BLiveShootGameInfo;)V
    .locals 8

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto/16 :goto_1

    .line 4
    .line 5
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v1, "shootGameInfo:"

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameInfo;->toJson()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "shootGame"

    .line 24
    .line 25
    invoke-static {v1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameInfo;->shootGameTasks:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    const/4 v0, 0x0

    .line 35
    move v2, v0

    .line 36
    :cond_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    const/4 v4, 0x0

    .line 41
    if-eqz v3, :cond_4

    .line 42
    .line 43
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;

    .line 48
    .line 49
    iget-object v5, v3, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;->status:Lcom/p1/mobile/putong/live/base/data/BLiveShootGameStatus;

    .line 50
    .line 51
    const-string v6, "received"

    .line 52
    .line 53
    invoke-static {v5, v6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result v5

    .line 57
    const/4 v6, 0x1

    .line 58
    if-nez v5, :cond_2

    .line 59
    .line 60
    move v2, v6

    .line 61
    :cond_2
    iget-object v5, v3, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;->status:Lcom/p1/mobile/putong/live/base/data/BLiveShootGameStatus;

    .line 62
    .line 63
    const-string v7, "completed"

    .line 64
    .line 65
    invoke-static {v5, v7}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 66
    .line 67
    .line 68
    move-result v5

    .line 69
    if-eqz v5, :cond_3

    .line 70
    .line 71
    iput v0, v3, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;->duration:I

    .line 72
    .line 73
    iput v6, p0, Ll/b6f0;->n:I

    .line 74
    .line 75
    move-object v4, v3

    .line 76
    goto :goto_0

    .line 77
    :cond_3
    iget-object v5, v3, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;->status:Lcom/p1/mobile/putong/live/base/data/BLiveShootGameStatus;

    .line 78
    .line 79
    const-string v6, "default"

    .line 80
    .line 81
    invoke-static {v5, v6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 82
    .line 83
    .line 84
    move-result v5

    .line 85
    if-nez v5, :cond_5

    .line 86
    .line 87
    iget-object v5, v3, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;->status:Lcom/p1/mobile/putong/live/base/data/BLiveShootGameStatus;

    .line 88
    .line 89
    const-string v6, "ongoing"

    .line 90
    .line 91
    invoke-static {v5, v6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 92
    .line 93
    .line 94
    move-result v5

    .line 95
    if-eqz v5, :cond_1

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_4
    move-object v3, v4

    .line 99
    :cond_5
    :goto_0
    if-eqz v4, :cond_6

    .line 100
    .line 101
    invoke-direct {p0, v4}, Ll/b6f0;->g4(Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;)Z

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    if-eqz p1, :cond_6

    .line 106
    .line 107
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 112
    .line 113
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->showShootGameRedPot()Ll/v3f$d;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 118
    .line 119
    invoke-static {v4, v5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 120
    .line 121
    .line 122
    move-result-object v4

    .line 123
    invoke-virtual {p1, v4}, Ll/v3f$d;->m(Ljava/lang/Object;)V

    .line 124
    .line 125
    .line 126
    :cond_6
    if-nez v3, :cond_7

    .line 127
    .line 128
    if-nez v2, :cond_9

    .line 129
    .line 130
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->OperationsEvent:Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;

    .line 135
    .line 136
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;->hideItem()Ll/v3f$d;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    invoke-virtual {p0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 141
    .line 142
    .line 143
    return-void

    .line 144
    :cond_7
    iput-object v3, p0, Ll/b6f0;->k:Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;

    .line 145
    .line 146
    iget p1, v3, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;->duration:I

    .line 147
    .line 148
    if-gez p1, :cond_8

    .line 149
    .line 150
    iput v0, v3, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;->duration:I

    .line 151
    .line 152
    :cond_8
    iget p1, v3, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;->duration:I

    .line 153
    .line 154
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    iput-object p1, p0, Ll/b6f0;->m:Ljava/lang/Integer;

    .line 159
    .line 160
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 161
    .line 162
    .line 163
    move-result-object p1

    .line 164
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->OperationsEvent:Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;

    .line 165
    .line 166
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;->aloneCountDown()Ll/v3f$d;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    iget-object v0, p0, Ll/b6f0;->m:Ljava/lang/Integer;

    .line 171
    .line 172
    invoke-virtual {p1, v0}, Ll/v3f$d;->m(Ljava/lang/Object;)V

    .line 173
    .line 174
    .line 175
    iget-object p1, p0, Ll/b6f0;->l:Ll/ft5;

    .line 176
    .line 177
    invoke-virtual {p1}, Ll/ft5;->c()V

    .line 178
    .line 179
    .line 180
    invoke-static {}, Ll/kdu;->Y()J

    .line 181
    .line 182
    .line 183
    move-result-wide v2

    .line 184
    new-instance p1, Ljava/lang/StringBuilder;

    .line 185
    .line 186
    const-string v0, "task:"

    .line 187
    .line 188
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 189
    .line 190
    .line 191
    iget-object v0, p0, Ll/b6f0;->k:Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;

    .line 192
    .line 193
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;->toJson()Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    const-string v0, ":nextDayDiff:"

    .line 201
    .line 202
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    invoke-virtual {p1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object p1

    .line 212
    invoke-static {v1, p1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 213
    .line 214
    .line 215
    iget-object p1, p0, Ll/b6f0;->l:Ll/ft5;

    .line 216
    .line 217
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 218
    .line 219
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 220
    .line 221
    .line 222
    move-result-object v0

    .line 223
    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 224
    .line 225
    invoke-virtual {v0, v2, v3, v1}, Lrx/c;->delay(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 226
    .line 227
    .line 228
    move-result-object v0

    .line 229
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 230
    .line 231
    .line 232
    move-result-object v0

    .line 233
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 234
    .line 235
    .line 236
    move-result-object v1

    .line 237
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 238
    .line 239
    .line 240
    move-result-object v0

    .line 241
    new-instance v1, Ll/w5f0;

    .line 242
    .line 243
    invoke-direct {v1, p0}, Ll/w5f0;-><init>(Ll/b6f0;)V

    .line 244
    .line 245
    .line 246
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 247
    .line 248
    .line 249
    move-result-object v1

    .line 250
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 251
    .line 252
    .line 253
    move-result-object v0

    .line 254
    invoke-virtual {p1, v0}, Ll/ft5;->a(Ll/kcg0;)V

    .line 255
    .line 256
    .line 257
    iget-object p1, p0, Ll/b6f0;->m:Ljava/lang/Integer;

    .line 258
    .line 259
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 260
    .line 261
    .line 262
    move-result p1

    .line 263
    if-gtz p1, :cond_a

    .line 264
    .line 265
    :cond_9
    :goto_1
    return-void

    .line 266
    :cond_a
    iget-object p1, p0, Ll/b6f0;->l:Ll/ft5;

    .line 267
    .line 268
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 269
    .line 270
    .line 271
    move-result-object v0

    .line 272
    check-cast v0, Ll/ou40;

    .line 273
    .line 274
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 275
    .line 276
    invoke-virtual {v0, v1}, Ll/oo2;->i2(Ljava/util/concurrent/TimeUnit;)Lrx/c;

    .line 277
    .line 278
    .line 279
    move-result-object v0

    .line 280
    iget-object v1, p0, Ll/b6f0;->m:Ljava/lang/Integer;

    .line 281
    .line 282
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 283
    .line 284
    .line 285
    move-result v1

    .line 286
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 287
    .line 288
    .line 289
    move-result-object v0

    .line 290
    new-instance v1, Ll/x5f0;

    .line 291
    .line 292
    invoke-direct {v1, p0}, Ll/x5f0;-><init>(Ll/b6f0;)V

    .line 293
    .line 294
    .line 295
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 296
    .line 297
    .line 298
    move-result-object v0

    .line 299
    invoke-virtual {p0, v0}, Ll/i6t;->H3(Lrx/c;)Lrx/c;

    .line 300
    .line 301
    .line 302
    move-result-object v0

    .line 303
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 304
    .line 305
    .line 306
    move-result-object v1

    .line 307
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 308
    .line 309
    .line 310
    move-result-object v0

    .line 311
    new-instance v1, Ll/y5f0;

    .line 312
    .line 313
    invoke-direct {v1}, Ll/y5f0;-><init>()V

    .line 314
    .line 315
    .line 316
    new-instance v2, Ll/z5f0;

    .line 317
    .line 318
    invoke-direct {v2}, Ll/z5f0;-><init>()V

    .line 319
    .line 320
    .line 321
    new-instance v3, Ll/a6f0;

    .line 322
    .line 323
    invoke-direct {v3, p0}, Ll/a6f0;-><init>(Ll/b6f0;)V

    .line 324
    .line 325
    .line 326
    invoke-static {v1, v2, v3}, Ll/dhw;->f(Ll/y20;Ll/y20;Ll/x20;)Ll/t9t;

    .line 327
    .line 328
    .line 329
    move-result-object p0

    .line 330
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 331
    .line 332
    .line 333
    move-result-object p0

    .line 334
    invoke-virtual {p1, p0}, Ll/ft5;->a(Ll/kcg0;)V

    .line 335
    .line 336
    .line 337
    return-void
.end method


# virtual methods
.method public final synthetic W3(Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "serverTask:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "shootGame"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    iput v0, p0, Ll/b6f0;->n:I

    .line 22
    .line 23
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;->status:Lcom/p1/mobile/putong/live/base/data/BLiveShootGameStatus;

    .line 24
    .line 25
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;->status:Lcom/p1/mobile/putong/live/base/data/BLiveShootGameStatus;

    .line 26
    .line 27
    iget v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;->stage:I

    .line 28
    .line 29
    iput v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;->stage:I

    .line 30
    .line 31
    iget v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;->ballCount:I

    .line 32
    .line 33
    iput v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;->ballCount:I

    .line 34
    .line 35
    iget v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;->duration:I

    .line 36
    .line 37
    iput v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;->duration:I

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->showShootGameRedPot()Ll/v3f$d;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 50
    .line 51
    invoke-static {p2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p0, p1}, Ll/v3f$d;->m(Ljava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public final synthetic X3(ZLcom/p1/mobile/putong/live/base/data/BLiveShootGameInfo;)V
    .locals 1

    .line 1
    iput-object p2, p0, Ll/b6f0;->j:Lcom/p1/mobile/putong/live/base/data/BLiveShootGameInfo;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->LiveBridgeImplEvent:Lcom/tantan/live/eventbus/LiveEventBus$LiveBridgeImplEvent;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$LiveBridgeImplEvent;->executeJs()Ll/v3f$d;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const-string v0, "javascript:resetShootGameTasks()"

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    invoke-direct {p0, p2}, Ll/b6f0;->h4(Lcom/p1/mobile/putong/live/base/data/BLiveShootGameInfo;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic Y3(Ll/uxj0;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->showShootGameRedPot()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const/4 v0, 0x0

    .line 12
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p1, v0}, Ll/v3f$d;->m(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    const/4 p1, 0x1

    .line 22
    invoke-virtual {p0, p1}, Ll/b6f0;->f4(Z)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final synthetic a4()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/b6f0;->k:Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ll/b6f0;->V3(Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic b4(Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/b6f0;->n:I

    .line 3
    .line 4
    iget-object v0, p0, Ll/b6f0;->k:Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;

    .line 5
    .line 6
    if-eqz v0, :cond_2

    .line 7
    .line 8
    iget-object v0, p0, Ll/b6f0;->j:Lcom/p1/mobile/putong/live/base/data/BLiveShootGameInfo;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    goto :goto_1

    .line 13
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;->status:Lcom/p1/mobile/putong/live/base/data/BLiveShootGameStatus;

    .line 14
    .line 15
    const-string v1, "autoReceived"

    .line 16
    .line 17
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    iget-object p1, p0, Ll/b6f0;->j:Lcom/p1/mobile/putong/live/base/data/BLiveShootGameInfo;

    .line 24
    .line 25
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameInfo;->shootGameTasks:Ljava/util/List;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ll/b6f0;->e4(Ljava/util/List;)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    iget-object v0, p0, Ll/b6f0;->k:Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;

    .line 32
    .line 33
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;->status:Lcom/p1/mobile/putong/live/base/data/BLiveShootGameStatus;

    .line 34
    .line 35
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;->status:Lcom/p1/mobile/putong/live/base/data/BLiveShootGameStatus;

    .line 36
    .line 37
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;->stage:I

    .line 38
    .line 39
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;->stage:I

    .line 40
    .line 41
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;->duration:I

    .line 42
    .line 43
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;->duration:I

    .line 44
    .line 45
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;->ballCount:I

    .line 46
    .line 47
    iput p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;->ballCount:I

    .line 48
    .line 49
    :goto_0
    iget-object p1, p0, Ll/b6f0;->j:Lcom/p1/mobile/putong/live/base/data/BLiveShootGameInfo;

    .line 50
    .line 51
    invoke-direct {p0, p1}, Ll/b6f0;->h4(Lcom/p1/mobile/putong/live/base/data/BLiveShootGameInfo;)V

    .line 52
    .line 53
    .line 54
    :cond_2
    :goto_1
    return-void
.end method

.method public final synthetic c4(Ll/c5f0;)Ljava/lang/Integer;
    .locals 1

    .line 1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "currentTaskCountDown:"

    .line 4
    .line 5
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/b6f0;->m:Ljava/lang/Integer;

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    const-string v0, "shootGame"

    .line 18
    .line 19
    invoke-static {v0, p1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/b6f0;->m:Ljava/lang/Integer;

    .line 23
    .line 24
    return-object p0
.end method

.method public final synthetic d4(Ll/a5f0;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget p0, p0, Ll/b6f0;->n:I

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final e4(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_1

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;

    .line 16
    .line 17
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;->status:Lcom/p1/mobile/putong/live/base/data/BLiveShootGameStatus;

    .line 18
    .line 19
    const-string v1, "completed"

    .line 20
    .line 21
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    const-string v0, "received"

    .line 28
    .line 29
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveShootGameStatus;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;->status:Lcom/p1/mobile/putong/live/base/data/BLiveShootGameStatus;

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    return-void
.end method

.method public final f4(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/b6f0;->i:Ll/z4f0;

    .line 2
    .line 3
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    invoke-virtual {v0, v1, v2}, Ll/z4f0;->e(Ljava/lang/String;Z)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/u5f0;

    .line 22
    .line 23
    invoke-direct {v1, p0, p1}, Ll/u5f0;-><init>(Ll/b6f0;Z)V

    .line 24
    .line 25
    .line 26
    new-instance p0, Ll/v5f0;

    .line 27
    .line 28
    invoke-direct {p0}, Ll/v5f0;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p0, v0}, Ll/b6f0;->f4(Z)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    iget-object v1, v1, Lcom/tantan/live/eventbus/LiveEventBus;->ShootEvent:Lcom/tantan/live/eventbus/LiveEventBus$ShootEvent;

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/tantan/live/eventbus/LiveEventBus$ShootEvent;->taskReceived()Ll/v3f$d;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v1}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Lrx/c;

    .line 23
    .line 24
    invoke-virtual {p0, v1, v0}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/q5f0;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/q5f0;-><init>(Ll/b6f0;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    new-instance v0, Ll/s5f0;

    .line 41
    .line 42
    invoke-direct {v0, p0}, Ll/s5f0;-><init>(Ll/b6f0;)V

    .line 43
    .line 44
    .line 45
    const-class v1, Ll/c5f0;

    .line 46
    .line 47
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 48
    .line 49
    .line 50
    new-instance v0, Ll/t5f0;

    .line 51
    .line 52
    invoke-direct {v0, p0}, Ll/t5f0;-><init>(Ll/b6f0;)V

    .line 53
    .line 54
    .line 55
    const-class v1, Ll/a5f0;

    .line 56
    .line 57
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method
