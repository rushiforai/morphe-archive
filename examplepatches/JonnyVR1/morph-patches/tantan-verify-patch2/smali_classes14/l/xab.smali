.class public Ll/xab;
.super Ll/dy6;
.source "SourceFile"


# instance fields
.field public R:Ll/jxd0;

.field public S:Ll/jxd0;

.field public T:Ll/jxd0;

.field public U:Ll/wyd0;

.field public V:Ll/wyd0;

.field public W:Lcom/p1/mobile/putong/core/data/TickleEnterInfo;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/api/c;)V
    .locals 3

    .line 1
    invoke-direct {p0, p1}, Ll/dy6;-><init>(Lcom/p1/mobile/putong/core/api/c;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/jxd0;

    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v1, "tickle_set_history_"

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 29
    .line 30
    invoke-direct {p1, v0, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 31
    .line 32
    .line 33
    iput-object p1, p0, Ll/xab;->R:Ll/jxd0;

    .line 34
    .line 35
    new-instance p1, Ll/jxd0;

    .line 36
    .line 37
    new-instance v0, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    const-string v2, "tickle_guide_shown_"

    .line 40
    .line 41
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-direct {p1, v0, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 60
    .line 61
    .line 62
    iput-object p1, p0, Ll/xab;->S:Ll/jxd0;

    .line 63
    .line 64
    new-instance p1, Ll/jxd0;

    .line 65
    .line 66
    new-instance v0, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    const-string v2, "tickle_notify_insert_"

    .line 69
    .line 70
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-direct {p1, v0, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 89
    .line 90
    .line 91
    iput-object p1, p0, Ll/xab;->T:Ll/jxd0;

    .line 92
    .line 93
    new-instance p1, Ll/wyd0;

    .line 94
    .line 95
    new-instance v0, Ljava/lang/StringBuilder;

    .line 96
    .line 97
    const-string v1, "tickle_notify_insert_user_id_"

    .line 98
    .line 99
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    const-string v1, ""

    .line 118
    .line 119
    invoke-direct {p1, v0, v1}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    iput-object p1, p0, Ll/xab;->U:Ll/wyd0;

    .line 123
    .line 124
    new-instance p1, Ll/wyd0;

    .line 125
    .line 126
    new-instance v0, Ljava/lang/StringBuilder;

    .line 127
    .line 128
    const-string v2, "tickle_enter_user_info_"

    .line 129
    .line 130
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 134
    .line 135
    .line 136
    move-result-object v2

    .line 137
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v2

    .line 141
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    invoke-direct {p1, v0, v1}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    iput-object p1, p0, Ll/xab;->V:Ll/wyd0;

    .line 152
    .line 153
    return-void
.end method

.method public static synthetic a3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b3(Ll/xab;Lcom/p1/mobile/putong/data/OMSConfigEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xab;->h3(Lcom/p1/mobile/putong/data/OMSConfigEnvelope;)V

    return-void
.end method


# virtual methods
.method public final c3()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/xab;->W:Lcom/p1/mobile/putong/core/data/TickleEnterInfo;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/data/TickleEnterInfo;->new_()Lcom/p1/mobile/putong/core/data/TickleEnterInfo;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Ll/xab;->W:Lcom/p1/mobile/putong/core/data/TickleEnterInfo;

    .line 10
    .line 11
    iget-object v0, p0, Ll/xab;->V:Ll/wyd0;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-nez v1, :cond_0

    .line 24
    .line 25
    :try_start_0
    sget-object v1, Lcom/p1/mobile/putong/core/data/TickleEnterInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 26
    .line 27
    const-string v2, ""

    .line 28
    .line 29
    invoke-virtual {v1, v0, v2}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Lcom/p1/mobile/putong/core/data/TickleEnterInfo;

    .line 34
    .line 35
    iput-object v0, p0, Ll/xab;->W:Lcom/p1/mobile/putong/core/data/TickleEnterInfo;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 36
    .line 37
    return-void

    .line 38
    :catch_0
    move-exception p0

    .line 39
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method

.method public final d3(Lcom/p1/mobile/putong/data/OMSConfigEnvelope;)V
    .locals 4

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSConfigEnvelope;->data:Lcom/p1/mobile/putong/data/OMSData;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OMSData;->counters:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_2

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/data/OMSConfigEnvelope;->data:Lcom/p1/mobile/putong/data/OMSData;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/data/OMSData;->counters:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Lcom/p1/mobile/putong/data/OMSCounterInfo;

    .line 30
    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    iget-object v1, v0, Lcom/p1/mobile/putong/data/OMSCounterInfo;->id:Ljava/lang/String;

    .line 35
    .line 36
    const-string v2, "p_chat_view_tickle_animation_tip"

    .line 37
    .line 38
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_0

    .line 43
    .line 44
    iget-object v1, v0, Lcom/p1/mobile/putong/data/OMSCounterInfo;->constraint:Lcom/p1/mobile/putong/data/OMSConstraint;

    .line 45
    .line 46
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-eqz v1, :cond_0

    .line 51
    .line 52
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OMSCounterInfo;->constraint:Lcom/p1/mobile/putong/data/OMSConstraint;

    .line 53
    .line 54
    iget-wide v0, v0, Lcom/p1/mobile/putong/data/OMSConstraint;->count:J

    .line 55
    .line 56
    const-wide/16 v2, 0x0

    .line 57
    .line 58
    cmp-long v0, v0, v2

    .line 59
    .line 60
    if-lez v0, :cond_0

    .line 61
    .line 62
    iget-object v0, p0, Ll/xab;->S:Ll/jxd0;

    .line 63
    .line 64
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 65
    .line 66
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_2
    return-void
.end method

.method public e3(Ljava/lang/String;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xab;->S:Ll/jxd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    return v1

    .line 17
    :cond_0
    iget-object v0, p0, Ll/xab;->R:Ll/jxd0;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ljava/lang/Boolean;

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    return v1

    .line 32
    :cond_1
    invoke-virtual {p0}, Ll/xab;->c3()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, p1}, Ll/xab;->g3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/TickleEnterUser;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    iget p0, p0, Lcom/p1/mobile/putong/core/data/TickleEnterUser;->times:I

    .line 40
    .line 41
    const/4 p1, 0x2

    .line 42
    if-lt p0, p1, :cond_2

    .line 43
    .line 44
    const/4 p0, 0x1

    .line 45
    return p0

    .line 46
    :cond_2
    return v1
.end method

.method public f3(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xab;->S:Ll/jxd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-virtual {p0}, Ll/xab;->c3()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ll/xab;->g3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/TickleEnterUser;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iget v0, p1, Lcom/p1/mobile/putong/core/data/TickleEnterUser;->times:I

    .line 24
    .line 25
    add-int/lit8 v0, v0, 0x1

    .line 26
    .line 27
    const/4 v1, 0x2

    .line 28
    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput v0, p1, Lcom/p1/mobile/putong/core/data/TickleEnterUser;->times:I

    .line 33
    .line 34
    iget-object p1, p0, Ll/xab;->V:Ll/wyd0;

    .line 35
    .line 36
    iget-object p0, p0, Ll/xab;->W:Lcom/p1/mobile/putong/core/data/TickleEnterInfo;

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/TickleEnterInfo;->toJson()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p1, p0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final g3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/TickleEnterUser;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/xab;->W:Lcom/p1/mobile/putong/core/data/TickleEnterInfo;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/TickleEnterInfo;->enterList:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Lcom/p1/mobile/putong/core/data/TickleEnterUser;

    .line 20
    .line 21
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/TickleEnterUser;->userId:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v2, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_0

    .line 28
    .line 29
    return-object v1

    .line 30
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/TickleEnterUser;->new_()Lcom/p1/mobile/putong/core/data/TickleEnterUser;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iput-object p1, v0, Lcom/p1/mobile/putong/core/data/TickleEnterUser;->userId:Ljava/lang/String;

    .line 35
    .line 36
    const/4 p1, 0x0

    .line 37
    iput p1, v0, Lcom/p1/mobile/putong/core/data/TickleEnterUser;->times:I

    .line 38
    .line 39
    iget-object p0, p0, Ll/xab;->W:Lcom/p1/mobile/putong/core/data/TickleEnterInfo;

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/TickleEnterInfo;->enterList:Ljava/util/List;

    .line 42
    .line 43
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    return-object v0
.end method

.method public final synthetic h3(Lcom/p1/mobile/putong/data/OMSConfigEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xab;->d3(Lcom/p1/mobile/putong/data/OMSConfigEnvelope;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public i3()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/xab;->S:Ll/jxd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    new-instance v0, Lcom/p1/mobile/putong/data/OMSData;

    .line 17
    .line 18
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/OMSData;-><init>()V

    .line 19
    .line 20
    .line 21
    new-instance v1, Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 24
    .line 25
    .line 26
    new-instance v2, Lcom/p1/mobile/putong/data/OMSCounterInfo;

    .line 27
    .line 28
    invoke-direct {v2}, Lcom/p1/mobile/putong/data/OMSCounterInfo;-><init>()V

    .line 29
    .line 30
    .line 31
    const-string v3, "p_chat_view_tickle_animation_tip"

    .line 32
    .line 33
    iput-object v3, v2, Lcom/p1/mobile/putong/data/OMSCounterInfo;->id:Ljava/lang/String;

    .line 34
    .line 35
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSData;->counters:Ljava/util/List;

    .line 36
    .line 37
    new-instance v3, Lcom/p1/mobile/putong/data/OMSConstraint;

    .line 38
    .line 39
    invoke-direct {v3}, Lcom/p1/mobile/putong/data/OMSConstraint;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-static {}, Ll/pzi0;->o()J

    .line 43
    .line 44
    .line 45
    move-result-wide v4

    .line 46
    iput-wide v4, v3, Lcom/p1/mobile/putong/data/OMSConstraint;->latestMs:J

    .line 47
    .line 48
    const-wide/16 v4, 0x1

    .line 49
    .line 50
    iput-wide v4, v3, Lcom/p1/mobile/putong/data/OMSConstraint;->count:J

    .line 51
    .line 52
    iput-object v3, v2, Lcom/p1/mobile/putong/data/OMSCounterInfo;->constraint:Lcom/p1/mobile/putong/data/OMSConstraint;

    .line 53
    .line 54
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v1}, Ll/pk50;->c()Ll/dj50;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v1, v0}, Ll/dj50;->P(Lcom/p1/mobile/putong/data/OMSData;)Lrx/c;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    new-instance v1, Ll/vab;

    .line 70
    .line 71
    invoke-direct {v1, p0}, Ll/vab;-><init>(Ll/xab;)V

    .line 72
    .line 73
    .line 74
    new-instance p0, Ll/wab;

    .line 75
    .line 76
    invoke-direct {p0}, Ll/wab;-><init>()V

    .line 77
    .line 78
    .line 79
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public j3()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xab;->i3()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/xab;->S:Ll/jxd0;

    .line 5
    .line 6
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method
