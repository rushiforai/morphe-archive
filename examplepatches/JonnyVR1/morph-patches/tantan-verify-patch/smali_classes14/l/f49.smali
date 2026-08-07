.class public Ll/f49;
.super Ll/dy6;
.source "SourceFile"


# instance fields
.field public R:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation
.end field

.field public S:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public T:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public U:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;",
            ">;"
        }
    .end annotation
.end field

.field public V:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;",
            ">;"
        }
    .end annotation
.end field

.field public W:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public X:Ll/jxd0;

.field public Y:Z

.field public Z:Ljava/lang/String;

.field public a0:Ljava/lang/String;

.field public b0:Z

.field public c0:Ll/byd0;

.field public d0:Ll/byd0;

.field public e0:Ll/byd0;

.field public f0:Ll/vxd0;

.field public g0:Ll/jxd0;

.field public h0:J

.field public i0:I

.field public j0:Z

.field public k0:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/api/c;)V
    .locals 7

    .line 1
    invoke-direct {p0, p1}, Ll/dy6;-><init>(Lcom/p1/mobile/putong/core/api/c;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Ll/f49;->R:Lrx/subjects/b;

    .line 9
    .line 10
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Ll/f49;->S:Lrx/subjects/b;

    .line 15
    .line 16
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iput-object p1, p0, Ll/f49;->T:Lrx/subjects/a;

    .line 21
    .line 22
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iput-object p1, p0, Ll/f49;->U:Lrx/subjects/a;

    .line 27
    .line 28
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iput-object p1, p0, Ll/f49;->V:Lrx/subjects/b;

    .line 33
    .line 34
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iput-object p1, p0, Ll/f49;->W:Lrx/subjects/a;

    .line 39
    .line 40
    new-instance p1, Ll/jxd0;

    .line 41
    .line 42
    new-instance v0, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    const-string v1, "heartbeat_privilege_notify_flag_"

    .line 45
    .line 46
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 65
    .line 66
    invoke-direct {p1, v0, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 67
    .line 68
    .line 69
    iput-object p1, p0, Ll/f49;->X:Ll/jxd0;

    .line 70
    .line 71
    const/4 p1, 0x0

    .line 72
    iput-boolean p1, p0, Ll/f49;->Y:Z

    .line 73
    .line 74
    const-string v0, "27754"

    .line 75
    .line 76
    iput-object v0, p0, Ll/f49;->Z:Ljava/lang/String;

    .line 77
    .line 78
    const-string v0, "search_idle"

    .line 79
    .line 80
    iput-object v0, p0, Ll/f49;->a0:Ljava/lang/String;

    .line 81
    .line 82
    iput-boolean p1, p0, Ll/f49;->b0:Z

    .line 83
    .line 84
    new-instance v0, Ll/byd0;

    .line 85
    .line 86
    new-instance v2, Ljava/lang/StringBuilder;

    .line 87
    .line 88
    const-string v3, "last_op_heartbeat_push"

    .line 89
    .line 90
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 94
    .line 95
    .line 96
    move-result-object v3

    .line 97
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v3

    .line 101
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    const-wide/16 v3, 0x0

    .line 109
    .line 110
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 111
    .line 112
    .line 113
    move-result-object v5

    .line 114
    invoke-direct {v0, v2, v5}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 115
    .line 116
    .line 117
    iput-object v0, p0, Ll/f49;->c0:Ll/byd0;

    .line 118
    .line 119
    new-instance v0, Ll/byd0;

    .line 120
    .line 121
    new-instance v2, Ljava/lang/StringBuilder;

    .line 122
    .line 123
    const-string v6, "heart_signal_new_anim_time_"

    .line 124
    .line 125
    invoke-direct {v2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 129
    .line 130
    .line 131
    move-result-object v6

    .line 132
    invoke-interface {v6}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v6

    .line 136
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    invoke-direct {v0, v2, v5}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 144
    .line 145
    .line 146
    iput-object v0, p0, Ll/f49;->d0:Ll/byd0;

    .line 147
    .line 148
    new-instance v0, Ll/byd0;

    .line 149
    .line 150
    new-instance v2, Ljava/lang/StringBuilder;

    .line 151
    .line 152
    const-string v6, "heart_beart_last_repor_time_"

    .line 153
    .line 154
    invoke-direct {v2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 158
    .line 159
    .line 160
    move-result-object v6

    .line 161
    invoke-interface {v6}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v6

    .line 165
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v2

    .line 172
    invoke-direct {v0, v2, v5}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 173
    .line 174
    .line 175
    iput-object v0, p0, Ll/f49;->e0:Ll/byd0;

    .line 176
    .line 177
    new-instance v0, Ll/vxd0;

    .line 178
    .line 179
    new-instance v2, Ljava/lang/StringBuilder;

    .line 180
    .line 181
    const-string v5, "heart_beart_report_count_"

    .line 182
    .line 183
    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 184
    .line 185
    .line 186
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 187
    .line 188
    .line 189
    move-result-object v5

    .line 190
    invoke-interface {v5}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object v5

    .line 194
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object v2

    .line 201
    invoke-direct {v0, v2, p1}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 202
    .line 203
    .line 204
    iput-object v0, p0, Ll/f49;->f0:Ll/vxd0;

    .line 205
    .line 206
    new-instance v0, Ll/jxd0;

    .line 207
    .line 208
    const-string v2, "inore_heartbeat_limit_debug"

    .line 209
    .line 210
    invoke-direct {v0, v2, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 211
    .line 212
    .line 213
    iput-object v0, p0, Ll/f49;->g0:Ll/jxd0;

    .line 214
    .line 215
    iput-wide v3, p0, Ll/f49;->h0:J

    .line 216
    .line 217
    iput-boolean p1, p0, Ll/f49;->k0:Z

    .line 218
    .line 219
    return-void
.end method

.method public static synthetic a3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b3(Ljava/lang/Throwable;)Ll/pf60;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/Links;->new_()Lcom/p1/mobile/putong/data/Links;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {p0, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static synthetic c3(Ll/pf60;Ll/pf60;)Ll/pf60;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic d3(Lcom/p1/mobile/putong/data/PushMessageCustom;ZLl/pf60;)Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;
    .locals 6

    .line 1
    iget-object p2, p2, Ll/pf60;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p2, Ljava/util/List;

    .line 4
    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-nez v1, :cond_5

    .line 15
    .line 16
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    const/4 v1, 0x0

    .line 21
    :cond_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-eqz v2, :cond_5

    .line 26
    .line 27
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    check-cast v2, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 32
    .line 33
    iget-object v3, v2, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 34
    .line 35
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    const/4 v4, 0x3

    .line 40
    if-nez v3, :cond_4

    .line 41
    .line 42
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 43
    .line 44
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    if-eqz v3, :cond_4

    .line 53
    .line 54
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    check-cast v3, Lcom/p1/mobile/putong/data/Media;

    .line 59
    .line 60
    instance-of v5, v3, Lcom/p1/mobile/putong/data/Picture;

    .line 61
    .line 62
    if-nez v5, :cond_2

    .line 63
    .line 64
    instance-of v5, v3, Lcom/p1/mobile/putong/data/Video;

    .line 65
    .line 66
    if-eqz v5, :cond_3

    .line 67
    .line 68
    :cond_2
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    add-int/lit8 v1, v1, 0x1

    .line 72
    .line 73
    :cond_3
    if-lt v1, v4, :cond_1

    .line 74
    .line 75
    :cond_4
    if-lt v1, v4, :cond_0

    .line 76
    .line 77
    :cond_5
    new-instance p2, Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;

    .line 78
    .line 79
    invoke-static {}, Ll/pzi0;->o()J

    .line 80
    .line 81
    .line 82
    move-result-wide v1

    .line 83
    invoke-direct {p2, p0, v0, v1, v2}, Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;-><init>(Lcom/p1/mobile/putong/data/PushMessageCustom;Ljava/util/List;J)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;->setFake(Z)V

    .line 87
    .line 88
    .line 89
    return-object p2
.end method

.method public static synthetic e3()Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/t39;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/t39;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->e(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    return-object v0
.end method

.method public static synthetic f3(Ll/f49;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/f49;->T3(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic g3(Ljava/lang/String;Lorg/json/JSONObject;)Ll/x1d0;
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v2, "/heartbeat-match/me"

    .line 10
    .line 11
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-eqz v2, :cond_0

    .line 19
    .line 20
    const-string p0, ""

    .line 21
    .line 22
    :cond_0
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/a;->G(Ljava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    sget-object v0, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 38
    .line 39
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-static {v0, p1}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p0, p1}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    return-object p0
.end method

.method public static synthetic h3(Ll/f49;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/f49;->S3(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic i3(Ll/f49;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/f49;->N3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic j3(Ljava/lang/String;Lrx/subjects/a;Z)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 2
    .line 3
    iget-object v0, v0, Ll/il8;->c:Ll/t600;

    .line 4
    .line 5
    const-string v1, "heartbeat_notify"

    .line 6
    .line 7
    invoke-virtual {v0, p0, v1}, Ll/t600;->r0(Ljava/lang/String;Ljava/lang/String;)Ll/wzh0$a;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/wzh0$a;->e()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-lez v0, :cond_0

    .line 16
    .line 17
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 18
    .line 19
    invoke-virtual {p1, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    if-eqz p2, :cond_1

    .line 28
    .line 29
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 30
    .line 31
    iget-object p2, p2, Ll/il8;->c:Ll/t600;

    .line 32
    .line 33
    invoke-virtual {p2, p0}, Ll/t600;->a0(Ljava/lang/String;)Ll/wzh0$a;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    invoke-virtual {p2}, Ll/wzh0$a;->e()I

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 42
    .line 43
    iget-object v1, v1, Ll/il8;->c:Ll/t600;

    .line 44
    .line 45
    invoke-virtual {v1, p0}, Ll/t600;->f0(Ljava/lang/String;)Ll/wzh0$a;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v1}, Ll/wzh0$a;->e()I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-nez p2, :cond_2

    .line 54
    .line 55
    if-nez v1, :cond_2

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 59
    .line 60
    iget-object p2, p2, Ll/il8;->c:Ll/t600;

    .line 61
    .line 62
    invoke-virtual {p2, p0}, Ll/t600;->f0(Ljava/lang/String;)Ll/wzh0$a;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    invoke-virtual {p2}, Ll/wzh0$a;->e()I

    .line 67
    .line 68
    .line 69
    move-result p2

    .line 70
    if-nez p2, :cond_2

    .line 71
    .line 72
    :goto_0
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 73
    .line 74
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 75
    .line 76
    invoke-virtual {p2, p0, v0}, Lcom/p1/mobile/putong/core/api/g;->dh(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageType;)V

    .line 77
    .line 78
    .line 79
    :cond_2
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 80
    .line 81
    invoke-virtual {p1, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public static synthetic k3(Ll/f49;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/f49;->Q3(Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic l3(ZLjava/lang/String;)V
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 4
    .line 5
    iget-object p0, p0, Ll/il8;->c:Ll/t600;

    .line 6
    .line 7
    const-string v0, "heartbeat_success"

    .line 8
    .line 9
    invoke-virtual {p0, p1, v0}, Ll/t600;->r0(Ljava/lang/String;Ljava/lang/String;)Ll/wzh0$a;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ll/wzh0$a;->e()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 22
    .line 23
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/api/g;->dh(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageType;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public static synthetic m3(Ljava/lang/String;Lrx/subjects/a;Z)V
    .locals 2

    .line 1
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/e49;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1, p2}, Ll/e49;-><init>(Ljava/lang/String;Lrx/subjects/a;Z)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/l9c;->B(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic n3(Ll/f49;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/f49;->U3(Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic o3(Ll/f49;Lcom/p1/mobile/putong/data/PushMessageCustom;ZLl/pf60;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/f49;->O3(Lcom/p1/mobile/putong/data/PushMessageCustom;ZLl/pf60;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic p3(Ll/f49;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/f49;->R3(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic q3(Ll/f49;Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/f49;->P3(Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;)V

    return-void
.end method

.method public static synthetic r3()Ll/x1d0;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "/heartbeat-match/me/privileges"

    .line 8
    .line 9
    invoke-static {v1}, Lcom/p1/mobile/putong/core/api/a;->G(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    return-object v0
.end method

.method public static synthetic s3(Ll/f49;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/f49;->M3(Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic t3(ZLjava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/k39;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/k39;-><init>(ZLjava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/l9c;->B(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic u3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public A3(Ljava/lang/String;Z)V
    .locals 0

    .line 1
    new-instance p0, Ll/d49;

    .line 2
    .line 3
    invoke-direct {p0, p2, p1}, Ll/d49;-><init>(ZLjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public B3()Ljava/lang/String;
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/f49;->j0:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string p0, "1"

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    const-string p0, "0"

    .line 9
    .line 10
    return-object p0
.end method

.method public final C3()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string v0, "heartbeat_push_show_limit_female"

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0

    .line 32
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    const-string v0, "heartbeat_push_show_limit_male"

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0

    .line 43
    :cond_1
    const-string p0, ""

    .line 44
    .line 45
    return-object p0
.end method

.method public D3()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/f49;->R:Lrx/subjects/b;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final E3(J)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sub-long/2addr v0, p1

    .line 6
    const-wide/32 p0, 0xea60

    .line 7
    .line 8
    .line 9
    div-long/2addr v0, p0

    .line 10
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public F3()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f49;->a0:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final G3()J
    .locals 5

    .line 1
    :try_start_0
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->yt()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const-wide/16 v1, 0x3e8

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/f49;->C3()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_2

    .line 26
    .line 27
    new-instance v0, Lorg/json/JSONObject;

    .line 28
    .line 29
    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    const-string p0, "time"

    .line 33
    .line 34
    invoke-virtual {v0, p0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    :goto_0
    mul-int/lit8 p0, p0, 0x3c

    .line 39
    .line 40
    int-to-long v3, p0

    .line 41
    mul-long/2addr v3, v1

    .line 42
    return-wide v3

    .line 43
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 46
    .line 47
    invoke-virtual {p0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_2

    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    if-eqz p0, :cond_1

    .line 62
    .line 63
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    const-string v0, "heartbeat_push_limit_female"

    .line 68
    .line 69
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->y(Ljava/lang/String;)I

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    if-lez p0, :cond_2

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    const-string v0, "heartbeat_push_limit_male"

    .line 81
    .line 82
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->y(Ljava/lang/String;)I

    .line 83
    .line 84
    .line 85
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 86
    if-lez p0, :cond_2

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :catch_0
    :cond_2
    const-wide/32 v0, 0x1b7740

    .line 90
    .line 91
    .line 92
    return-wide v0
.end method

.method public H3()I
    .locals 0

    .line 1
    iget p0, p0, Ll/f49;->i0:I

    .line 2
    .line 3
    return p0
.end method

.method public final I3(Lcom/p1/mobile/putong/data/PushMessageCustom;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->triggeredUserId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const-string p0, "search"

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    iget-boolean p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->noRecommended:Z

    .line 13
    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    const-string p0, "timeout"

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_1
    iget-boolean p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->isPassive:Z

    .line 20
    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    const-string p0, "passive"

    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_2
    const-string p0, "active"

    .line 27
    .line 28
    return-object p0
.end method

.method public J3()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/f49;->b0:Z

    .line 2
    .line 3
    return p0
.end method

.method public K3(Lcom/p1/mobile/putong/data/PushMessageCustom;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->triggeredUserId:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public L3()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/f49;->a0:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/f49;->a0:Ljava/lang/String;

    .line 10
    .line 11
    const-string v1, "search_start"

    .line 12
    .line 13
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Ll/f49;->a0:Ljava/lang/String;

    .line 20
    .line 21
    const-string v1, "search_idle"

    .line 22
    .line 23
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    iget-object p0, p0, Ll/f49;->a0:Ljava/lang/String;

    .line 30
    .line 31
    const-string v0, "search_cancel"

    .line 32
    .line 33
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-eqz p0, :cond_0

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    const/4 p0, 0x1

    .line 41
    return p0

    .line 42
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 43
    return p0
.end method

.method public final synthetic M3(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Mo()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/joa;->v4()Lrx/c;

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->gb()Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-eqz p1, :cond_1

    .line 35
    .line 36
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->H1:Ll/f49;

    .line 39
    .line 40
    invoke-virtual {p0}, Ll/f49;->Z3()V

    .line 41
    .line 42
    .line 43
    :cond_1
    return-void
.end method

.method public final synthetic N3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "action"

    .line 7
    .line 8
    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 9
    .line 10
    .line 11
    const-string v1, "tracker"

    .line 12
    .line 13
    invoke-virtual {v0, v1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 14
    .line 15
    .line 16
    const-string p2, "report"

    .line 17
    .line 18
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    const-string p1, "reportType"

    .line 25
    .line 26
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    if-eqz p2, :cond_0

    .line 31
    .line 32
    const-string p3, "monetization"

    .line 33
    .line 34
    :cond_0
    invoke-virtual {v0, p1, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    .line 36
    .line 37
    :catch_0
    :cond_1
    new-instance p1, Ll/m39;

    .line 38
    .line 39
    invoke-direct {p1, p4, v0}, Ll/m39;-><init>(Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 40
    .line 41
    .line 42
    invoke-static {p1}, Ll/qi20;->a(Ll/pcj;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    new-instance p2, Ll/n39;

    .line 47
    .line 48
    invoke-direct {p2, p0}, Ll/n39;-><init>(Ll/f49;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p1, p2}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    return-object p0
.end method

.method public final synthetic O3(Lcom/p1/mobile/putong/data/PushMessageCustom;ZLl/pf60;)Lrx/c;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->userId:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/dkb;->Na(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->userId:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/g;->ap(Ljava/lang/String;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 25
    .line 26
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    :goto_0
    new-instance p1, Ll/o39;

    .line 31
    .line 32
    invoke-direct {p1}, Ll/o39;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-static {v0, p0, p1}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    new-instance p1, Ll/p39;

    .line 40
    .line 41
    invoke-direct {p1, p3}, Ll/p39;-><init>(Ll/pf60;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0
.end method

.method public final synthetic P3(Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0, p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->bh(Lcom/p1/mobile/putong/core/data/HeartbeatPushInfo;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/f49;->U:Lrx/subjects/a;

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/f49;->V:Lrx/subjects/b;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final synthetic Q3(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 4

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->extraPrivileges:Lcom/p1/mobile/putong/core/data/ExtraPrivileges;

    .line 10
    .line 11
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ExtraPrivileges;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatchData;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ExtraPrivileges;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatchData;

    .line 26
    .line 27
    iget-wide v0, v0, Lcom/p1/mobile/putong/core/data/HeartbeatMatchData;->expiredTime:D

    .line 28
    .line 29
    sget-object v2, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 30
    .line 31
    invoke-virtual {v2}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 32
    .line 33
    .line 34
    move-result-wide v2

    .line 35
    long-to-double v2, v2

    .line 36
    cmpl-double v0, v0, v2

    .line 37
    .line 38
    if-lez v0, :cond_0

    .line 39
    .line 40
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ExtraPrivileges;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatchData;

    .line 41
    .line 42
    iget p1, p1, Lcom/p1/mobile/putong/core/data/HeartbeatMatchData;->remaining:I

    .line 43
    .line 44
    iput p1, p0, Ll/f49;->i0:I

    .line 45
    .line 46
    :cond_0
    return-void
.end method

.method public final synthetic R3(Ljava/lang/String;)V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 2
    .line 3
    iget-object v0, v0, Ll/il8;->c:Ll/t600;

    .line 4
    .line 5
    const-string v1, "heartbeat_notify"

    .line 6
    .line 7
    invoke-virtual {v0, p1, v1}, Ll/t600;->r0(Ljava/lang/String;Ljava/lang/String;)Ll/wzh0$a;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/wzh0$a;->e()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-lez v0, :cond_0

    .line 16
    .line 17
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 18
    .line 19
    iget-object v0, v0, Ll/il8;->c:Ll/t600;

    .line 20
    .line 21
    sget-object v2, Lcom/p1/mobile/putong/core/data/Message;->CID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 22
    .line 23
    invoke-virtual {v2, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    sget-object v3, Lcom/p1/mobile/putong/core/data/Message;->MESSAGETYPE:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 28
    .line 29
    invoke-virtual {v3, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->EQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    filled-new-array {v2, v1}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-static {v1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v0, v1}, Ll/wzh0;->delete(Lcom/tantanapp/common/data/orm/Filter;)V

    .line 42
    .line 43
    .line 44
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 45
    .line 46
    iget-object v0, v0, Ll/il8;->c:Ll/t600;

    .line 47
    .line 48
    const-string v1, "heartbeat_waiting_response"

    .line 49
    .line 50
    invoke-virtual {v0, p1, v1}, Ll/t600;->r0(Ljava/lang/String;Ljava/lang/String;)Ll/wzh0$a;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0}, Ll/wzh0$a;->e()I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-nez v0, :cond_1

    .line 59
    .line 60
    iget-object v0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 61
    .line 62
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 63
    .line 64
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-virtual {v0, p1, v1}, Lcom/p1/mobile/putong/core/api/g;->of(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageType;)Lcom/p1/mobile/putong/core/data/Message;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 73
    .line 74
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 75
    .line 76
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/g;->eh(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 77
    .line 78
    .line 79
    :cond_1
    return-void
.end method

.method public final synthetic S3(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/l39;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/l39;-><init>(Ll/f49;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/l9c;->B(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic T3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const-string p1, "search_idle"

    .line 2
    .line 3
    iput-object p1, p0, Ll/f49;->a0:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->gs()V

    .line 14
    .line 15
    .line 16
    const-string p1, "\u7f51\u7edc\u5f02\u5e38\uff01"

    .line 17
    .line 18
    invoke-static {p1}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 24
    .line 25
    invoke-virtual {p1}, Ll/joa;->v4()Lrx/c;

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/lqb;->k5()Lrx/c;

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final synthetic U3(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 3

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 8
    .line 9
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartBeatMatched;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const-string v1, "search_idle"

    .line 16
    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartBeatMatched;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/HeartBeatMatched;->error:Lcom/p1/mobile/putong/core/data/HeartbeatActionError;

    .line 22
    .line 23
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartBeatMatched;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/HeartBeatMatched;->error:Lcom/p1/mobile/putong/core/data/HeartbeatActionError;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/HeartbeatActionError;->subcode:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_1

    .line 40
    .line 41
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartBeatMatched;

    .line 42
    .line 43
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/HeartBeatMatched;->error:Lcom/p1/mobile/putong/core/data/HeartbeatActionError;

    .line 44
    .line 45
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HeartbeatActionError;->subcode:Ljava/lang/String;

    .line 46
    .line 47
    const-string v2, "40399"

    .line 48
    .line 49
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_0

    .line 54
    .line 55
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HeartbeatActionError;->message:Ljava/lang/String;

    .line 56
    .line 57
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-nez v0, :cond_0

    .line 62
    .line 63
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/HeartbeatActionError;->message:Ljava/lang/String;

    .line 64
    .line 65
    invoke-static {p1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 69
    .line 70
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 71
    .line 72
    invoke-virtual {p1}, Ll/joa;->v4()Lrx/c;

    .line 73
    .line 74
    .line 75
    iget-object p1, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 76
    .line 77
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 78
    .line 79
    invoke-virtual {p1}, Ll/lqb;->k5()Lrx/c;

    .line 80
    .line 81
    .line 82
    :cond_0
    iput-object v1, p0, Ll/f49;->a0:Ljava/lang/String;

    .line 83
    .line 84
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->gs()V

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartBeatMatched;

    .line 97
    .line 98
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/HeartBeatMatched;->tracker:Ljava/lang/String;

    .line 99
    .line 100
    iput-object v0, p0, Ll/f49;->a0:Ljava/lang/String;

    .line 101
    .line 102
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->f7()V

    .line 111
    .line 112
    .line 113
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartBeatMatched;

    .line 122
    .line 123
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/HeartBeatMatched;->waitSeconds:J

    .line 124
    .line 125
    invoke-interface {p0, v0, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->lj(J)V

    .line 126
    .line 127
    .line 128
    return-void

    .line 129
    :cond_2
    iput-object v1, p0, Ll/f49;->a0:Ljava/lang/String;

    .line 130
    .line 131
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->gs()V

    .line 140
    .line 141
    .line 142
    return-void
.end method

.method public V3(Ljava/lang/String;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "match"

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Ll/f49;->w3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public W3(Lcom/p1/mobile/putong/data/PushMessageCustom;Z)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Ll/f49;->X3(Lcom/p1/mobile/putong/data/PushMessageCustom;ZZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public X3(Lcom/p1/mobile/putong/data/PushMessageCustom;ZZ)V
    .locals 13

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->triggeredUserId:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v1, 0x1

    .line 15
    const/4 v2, 0x0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->noRecommended:Z

    .line 19
    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    move v7, v1

    .line 23
    goto :goto_0

    .line 24
    :cond_1
    move v7, v2

    .line 25
    :goto_0
    const-wide/16 v9, 0x0

    .line 26
    .line 27
    if-eqz v7, :cond_2

    .line 28
    .line 29
    invoke-static {}, Ll/pzi0;->o()J

    .line 30
    .line 31
    .line 32
    move-result-wide v3

    .line 33
    long-to-double v3, v3

    .line 34
    iget-wide v5, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->expire:D

    .line 35
    .line 36
    cmpl-double v0, v3, v5

    .line 37
    .line 38
    if-ltz v0, :cond_2

    .line 39
    .line 40
    cmpl-double v0, v5, v9

    .line 41
    .line 42
    if-lez v0, :cond_2

    .line 43
    .line 44
    move v5, v1

    .line 45
    goto :goto_1

    .line 46
    :cond_2
    move v5, v2

    .line 47
    :goto_1
    if-eqz v7, :cond_3

    .line 48
    .line 49
    invoke-static {}, Ll/pzi0;->o()J

    .line 50
    .line 51
    .line 52
    move-result-wide v3

    .line 53
    iget-object v0, p0, Ll/f49;->c0:Ll/byd0;

    .line 54
    .line 55
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    check-cast v0, Ljava/lang/Long;

    .line 60
    .line 61
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 62
    .line 63
    .line 64
    move-result-wide v11

    .line 65
    sub-long/2addr v3, v11

    .line 66
    invoke-virtual {p0}, Ll/f49;->G3()J

    .line 67
    .line 68
    .line 69
    move-result-wide v11

    .line 70
    cmp-long v0, v3, v11

    .line 71
    .line 72
    if-gez v0, :cond_3

    .line 73
    .line 74
    move v6, v1

    .line 75
    :goto_2
    move-object v3, p0

    .line 76
    move-object v4, p1

    .line 77
    move/from16 v8, p3

    .line 78
    .line 79
    goto :goto_3

    .line 80
    :cond_3
    move v6, v2

    .line 81
    goto :goto_2

    .line 82
    :goto_3
    invoke-virtual/range {v3 .. v8}, Ll/f49;->h4(Lcom/p1/mobile/putong/data/PushMessageCustom;ZZZZ)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->triggeredUserId:Ljava/lang/String;

    .line 86
    .line 87
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-eqz v0, :cond_6

    .line 92
    .line 93
    invoke-static {}, Ll/pzi0;->o()J

    .line 94
    .line 95
    .line 96
    move-result-wide v5

    .line 97
    long-to-double v5, v5

    .line 98
    iget-wide v7, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->expire:D

    .line 99
    .line 100
    cmpl-double v0, v5, v7

    .line 101
    .line 102
    const-string v5, "otheruserID"

    .line 103
    .line 104
    const-string v6, ""

    .line 105
    .line 106
    if-ltz v0, :cond_4

    .line 107
    .line 108
    cmpl-double v0, v7, v9

    .line 109
    .line 110
    if-lez v0, :cond_4

    .line 111
    .line 112
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->userId:Ljava/lang/String;

    .line 113
    .line 114
    invoke-static {v5, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->expire:D

    .line 119
    .line 120
    double-to-long v1, v1

    .line 121
    invoke-virtual {p0, v1, v2}, Ll/f49;->E3(J)Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    const-string p1, "expired_time"

    .line 126
    .line 127
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    filled-new-array {v0, p0}, [Ll/pf60;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    const-string p1, "e_heartbeat_push_expired"

    .line 136
    .line 137
    invoke-static {p1, v6, p0}, Ll/i4g0;->B(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 138
    .line 139
    .line 140
    return-void

    .line 141
    :cond_4
    invoke-static {}, Ll/pzi0;->o()J

    .line 142
    .line 143
    .line 144
    move-result-wide v7

    .line 145
    iget-object v0, p0, Ll/f49;->c0:Ll/byd0;

    .line 146
    .line 147
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    check-cast v0, Ljava/lang/Long;

    .line 152
    .line 153
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 154
    .line 155
    .line 156
    move-result-wide v9

    .line 157
    sub-long/2addr v7, v9

    .line 158
    invoke-virtual {p0}, Ll/f49;->G3()J

    .line 159
    .line 160
    .line 161
    move-result-wide v9

    .line 162
    cmp-long v0, v7, v9

    .line 163
    .line 164
    if-gez v0, :cond_5

    .line 165
    .line 166
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->userId:Ljava/lang/String;

    .line 167
    .line 168
    invoke-static {v5, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    invoke-virtual {p0}, Ll/f49;->G3()J

    .line 173
    .line 174
    .line 175
    move-result-wide v0

    .line 176
    const-wide/32 v4, 0xea60

    .line 177
    .line 178
    .line 179
    div-long/2addr v0, v4

    .line 180
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    const-string v1, "intercal_time"

    .line 185
    .line 186
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    iget-object v1, p0, Ll/f49;->c0:Ll/byd0;

    .line 191
    .line 192
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 193
    .line 194
    .line 195
    move-result-object v1

    .line 196
    check-cast v1, Ljava/lang/Long;

    .line 197
    .line 198
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 199
    .line 200
    .line 201
    move-result-wide v1

    .line 202
    invoke-virtual {p0, v1, v2}, Ll/f49;->E3(J)Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object p0

    .line 206
    const-string v1, "timeout"

    .line 207
    .line 208
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 209
    .line 210
    .line 211
    move-result-object p0

    .line 212
    filled-new-array {p1, v0, p0}, [Ll/pf60;

    .line 213
    .line 214
    .line 215
    move-result-object p0

    .line 216
    const-string p1, "e_heartbeat_push_limit"

    .line 217
    .line 218
    invoke-static {p1, v6, p0}, Ll/i4g0;->B(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 219
    .line 220
    .line 221
    return-void

    .line 222
    :cond_5
    iget-object v0, p0, Ll/f49;->c0:Ll/byd0;

    .line 223
    .line 224
    invoke-static {}, Ll/pzi0;->o()J

    .line 225
    .line 226
    .line 227
    move-result-wide v5

    .line 228
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 229
    .line 230
    .line 231
    move-result-object v5

    .line 232
    invoke-virtual {v0, v5}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 233
    .line 234
    .line 235
    :cond_6
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 236
    .line 237
    .line 238
    move-result-object v0

    .line 239
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 240
    .line 241
    .line 242
    move-result-object v0

    .line 243
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->u()Z

    .line 244
    .line 245
    .line 246
    move-result v0

    .line 247
    if-eqz v0, :cond_7

    .line 248
    .line 249
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 250
    .line 251
    .line 252
    move-result-object v0

    .line 253
    iget-object v5, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->userId:Ljava/lang/String;

    .line 254
    .line 255
    sget-object v6, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 256
    .line 257
    invoke-interface {v0, v5, v2, v6}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->personalMediaMomentsFeedPrevious(Ljava/lang/String;ZLcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 258
    .line 259
    .line 260
    move-result-object v0

    .line 261
    new-instance v5, Ll/x39;

    .line 262
    .line 263
    invoke-direct {v5}, Ll/x39;-><init>()V

    .line 264
    .line 265
    .line 266
    invoke-virtual {v0, v5}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 267
    .line 268
    .line 269
    move-result-object v0

    .line 270
    goto :goto_4

    .line 271
    :cond_7
    invoke-static {}, Lcom/p1/mobile/putong/data/Links;->new_()Lcom/p1/mobile/putong/data/Links;

    .line 272
    .line 273
    .line 274
    move-result-object v0

    .line 275
    new-instance v5, Ljava/util/ArrayList;

    .line 276
    .line 277
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 278
    .line 279
    .line 280
    invoke-static {v0, v5}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 281
    .line 282
    .line 283
    move-result-object v0

    .line 284
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 285
    .line 286
    .line 287
    move-result-object v0

    .line 288
    :goto_4
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 289
    .line 290
    .line 291
    move-result-object v5

    .line 292
    invoke-virtual {v5}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 293
    .line 294
    .line 295
    move-result-object v5

    .line 296
    invoke-interface {v5}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Mo()Z

    .line 297
    .line 298
    .line 299
    move-result v5

    .line 300
    if-eqz v5, :cond_8

    .line 301
    .line 302
    invoke-virtual/range {p0 .. p1}, Ll/f49;->K3(Lcom/p1/mobile/putong/data/PushMessageCustom;)Z

    .line 303
    .line 304
    .line 305
    move-result v5

    .line 306
    if-eqz v5, :cond_8

    .line 307
    .line 308
    goto :goto_5

    .line 309
    :cond_8
    move v1, v2

    .line 310
    :goto_5
    new-instance v2, Ll/y39;

    .line 311
    .line 312
    invoke-direct {v2, p0, p1, v1}, Ll/y39;-><init>(Ll/f49;Lcom/p1/mobile/putong/data/PushMessageCustom;Z)V

    .line 313
    .line 314
    .line 315
    invoke-virtual {v0, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 316
    .line 317
    .line 318
    move-result-object v0

    .line 319
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 320
    .line 321
    .line 322
    move-result-object v1

    .line 323
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 324
    .line 325
    .line 326
    move-result-object v0

    .line 327
    new-instance v1, Ll/z39;

    .line 328
    .line 329
    invoke-direct {v1, p1, p2}, Ll/z39;-><init>(Lcom/p1/mobile/putong/data/PushMessageCustom;Z)V

    .line 330
    .line 331
    .line 332
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 333
    .line 334
    .line 335
    move-result-object p1

    .line 336
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 337
    .line 338
    .line 339
    move-result-object v0

    .line 340
    invoke-virtual {p1, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 341
    .line 342
    .line 343
    move-result-object p1

    .line 344
    new-instance v0, Ll/a49;

    .line 345
    .line 346
    invoke-direct {v0, p0}, Ll/a49;-><init>(Ll/f49;)V

    .line 347
    .line 348
    .line 349
    new-instance p0, Ll/b49;

    .line 350
    .line 351
    invoke-direct {p0}, Ll/b49;-><init>()V

    .line 352
    .line 353
    .line 354
    invoke-virtual {p1, v0, p0}, Lrx/c;->subscribe(Ll/y20;Ll/y20;)Ll/kcg0;

    .line 355
    .line 356
    .line 357
    return-void
.end method

.method public Y3(Ljava/lang/String;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "reject"

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Ll/f49;->w3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public Z3()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v1, Ll/q39;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/q39;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v2, "getHeartBeatPrivilegesTimes"

    .line 9
    .line 10
    const/4 v3, 0x0

    .line 11
    invoke-virtual {v0, v2, v3, v1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/r39;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/r39;-><init>(Ll/f49;)V

    .line 26
    .line 27
    .line 28
    new-instance p0, Ll/s39;

    .line 29
    .line 30
    invoke-direct {p0}, Ll/s39;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public a4()V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/f49;->c0:Ll/byd0;

    .line 2
    .line 3
    const-wide/16 v0, 0x0

    .line 4
    .line 5
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public b4(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/f49;->j0:Z

    .line 2
    .line 3
    return-void
.end method

.method public c4(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/f49;->a0:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public d4()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/f49;->b0:Z

    .line 3
    .line 4
    return-void
.end method

.method public e4()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/f49;->T:Lrx/subjects/a;

    .line 2
    .line 3
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public f4(Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ll/u39;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/u39;-><init>(Ll/f49;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public g4()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->f7()V

    .line 10
    .line 11
    .line 12
    const-string v0, "search_start"

    .line 13
    .line 14
    iput-object v0, p0, Ll/f49;->a0:Ljava/lang/String;

    .line 15
    .line 16
    const-string v0, "start"

    .line 17
    .line 18
    const-string v1, ""

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    invoke-virtual {p0, v0, v1, v2}, Ll/f49;->x3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ll/v39;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/v39;-><init>(Ll/f49;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Lrx/c;->doOnError(Ll/y20;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Ll/w39;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/w39;-><init>(Ll/f49;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0
.end method

.method public final h4(Lcom/p1/mobile/putong/data/PushMessageCustom;ZZZZ)V
    .locals 9

    .line 1
    const-string v0, "otheruserID"

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->userId:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    const-string v0, "expired"

    .line 10
    .line 11
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-static {v0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    const-string p2, "type"

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ll/f49;->I3(Lcom/p1/mobile/putong/data/PushMessageCustom;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {p2, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    const-string p0, "limit"

    .line 30
    .line 31
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    invoke-static {p0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object v5

    .line 39
    if-eqz p4, :cond_0

    .line 40
    .line 41
    iget-wide p2, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->expire:D

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    const-wide/high16 p2, -0x4010000000000000L    # -1.0

    .line 45
    .line 46
    :goto_0
    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    const-string p2, "expired_time"

    .line 51
    .line 52
    invoke-static {p2, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 53
    .line 54
    .line 55
    move-result-object v6

    .line 56
    const-string p0, "source"

    .line 57
    .line 58
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->tracker:Ljava/lang/String;

    .line 59
    .line 60
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 61
    .line 62
    .line 63
    move-result-object v7

    .line 64
    xor-int/lit8 p0, p5, 0x1

    .line 65
    .line 66
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    const-string p1, "count_limit"

    .line 71
    .line 72
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 73
    .line 74
    .line 75
    move-result-object v8

    .line 76
    filled-new-array/range {v2 .. v8}, [Ll/pf60;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    const-string p1, "e_heartbeat_push_arrived"

    .line 81
    .line 82
    const-string p2, ""

    .line 83
    .line 84
    invoke-static {p1, p2, p0}, Ll/i4g0;->B(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public v3(Ljava/lang/String;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "accept"

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Ll/f49;->w3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public w3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Ll/f49;->x3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public x3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, v0}, Ll/f49;->y3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public y3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v2, "_heartbeat-match"

    .line 12
    .line 13
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    new-instance v2, Ll/c49;

    .line 21
    .line 22
    move-object v3, p0

    .line 23
    move-object v4, p1

    .line 24
    move-object v5, p2

    .line 25
    move-object v7, p3

    .line 26
    move-object v6, p4

    .line 27
    invoke-direct/range {v2 .. v7}, Ll/c49;-><init>(Ll/f49;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    const/4 p0, -0x1

    .line 31
    invoke-virtual {v0, v1, p0, v2}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method public z3(ZLjava/lang/String;Lrx/subjects/a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/lang/String;",
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance p0, Ll/j39;

    .line 2
    .line 3
    invoke-direct {p0, p2, p3, p1}, Ll/j39;-><init>(Ljava/lang/String;Lrx/subjects/a;Z)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
