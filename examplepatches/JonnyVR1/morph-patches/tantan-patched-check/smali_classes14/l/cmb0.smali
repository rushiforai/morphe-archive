.class public Ll/cmb0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/cmb0$e;,
        Ll/cmb0$g;,
        Ll/cmb0$f;
    }
.end annotation


# static fields
.field public static i:Ll/cmb0$e;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/cmb0$e<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static j:Z

.field public static k:Z

.field public static l:Z


# instance fields
.field public a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/hmb0;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ll/cmb0$e;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/cmb0$e<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public c:Z

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/cmb0$f;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ll/kcg0;

.field public f:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ll/cmb0$g;",
            ">;>;"
        }
    .end annotation
.end field

.field public g:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ll/cmb0$g;",
            ">;>;"
        }
    .end annotation
.end field

.field public h:Ll/hmb0$a;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/cmb0$e;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/cmb0$e;-><init>(Ll/dmb0;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/cmb0;->i:Ll/cmb0$e;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    sput-boolean v0, Ll/cmb0;->j:Z

    .line 11
    .line 12
    sput-boolean v0, Ll/cmb0;->k:Z

    .line 13
    .line 14
    sput-boolean v0, Ll/cmb0;->l:Z

    .line 15
    .line 16
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/cmb0;->a:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ll/cmb0$e;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-direct {v0, v1}, Ll/cmb0$e;-><init>(Ll/dmb0;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/cmb0;->b:Ll/cmb0$e;

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    iput-boolean v0, p0, Ll/cmb0;->c:Z

    .line 21
    .line 22
    new-instance v0, Ljava/util/HashMap;

    .line 23
    .line 24
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Ll/cmb0;->f:Ljava/util/Map;

    .line 28
    .line 29
    new-instance v0, Ljava/util/HashMap;

    .line 30
    .line 31
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Ll/cmb0;->g:Ljava/util/Map;

    .line 35
    .line 36
    new-instance v0, Ll/cmb0$d;

    .line 37
    .line 38
    invoke-direct {v0, p0}, Ll/cmb0$d;-><init>(Ll/cmb0;)V

    .line 39
    .line 40
    .line 41
    iput-object v0, p0, Ll/cmb0;->h:Ll/hmb0$a;

    .line 42
    .line 43
    :try_start_0
    invoke-static {}, Ll/de00;->n()Ll/de00;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Ll/de00;->o(Landroid/app/Application;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ll/cmb0;->a:Ljava/util/List;

    .line 53
    .line 54
    invoke-static {}, Ll/de00;->n()Ll/de00;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    iget-object v2, p0, Ll/cmb0;->h:Ll/hmb0$a;

    .line 59
    .line 60
    invoke-virtual {v1, v2}, Ll/hmb0;->g(Ll/hmb0$a;)Ll/hmb0;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 65
    .line 66
    .line 67
    goto :goto_0

    .line 68
    :catchall_0
    move-exception v0

    .line 69
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->g(Ljava/lang/Throwable;)V

    .line 70
    .line 71
    .line 72
    :goto_0
    invoke-static {}, Ll/ugl;->v()V

    .line 73
    .line 74
    .line 75
    invoke-static {}, Ll/ugl;->r()Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-eqz v0, :cond_0

    .line 80
    .line 81
    iget-object v0, p0, Ll/cmb0;->a:Ljava/util/List;

    .line 82
    .line 83
    const/4 v1, 0x0

    .line 84
    invoke-static {}, Ll/ugl;->p()Ll/ugl;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    invoke-interface {v0, v1, v2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 89
    .line 90
    .line 91
    :cond_0
    :try_start_1
    sget-object v0, Lcom/p1/mobile/android/app/App;->d:Lcom/p1/mobile/android/app/App;

    .line 92
    .line 93
    check-cast v0, Ll/uqb0;

    .line 94
    .line 95
    invoke-static {}, Ll/uqb0;->i0()Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    invoke-static {}, Lcom/tantanapp/push/xiaomi/MiPushReceiver;->shouldUseMIUIPush()Z

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    if-eqz v1, :cond_1

    .line 104
    .line 105
    if-eqz v0, :cond_1

    .line 106
    .line 107
    iget-object v0, p0, Ll/cmb0;->a:Ljava/util/List;

    .line 108
    .line 109
    new-instance v1, Lcom/tantanapp/push/xiaomi/MiPushReceiver;

    .line 110
    .line 111
    invoke-direct {v1}, Lcom/tantanapp/push/xiaomi/MiPushReceiver;-><init>()V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v1}, Lcom/tantanapp/push/xiaomi/MiPushReceiver;->getController()Lcom/tantanapp/push/xiaomi/MiPushReceiver$a;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    iget-object v2, p0, Ll/cmb0;->h:Ll/hmb0$a;

    .line 119
    .line 120
    invoke-virtual {v1, v2}, Ll/hmb0;->g(Ll/hmb0$a;)Ll/hmb0;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 125
    .line 126
    .line 127
    goto :goto_1

    .line 128
    :catchall_1
    move-exception v0

    .line 129
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->g(Ljava/lang/Throwable;)V

    .line 130
    .line 131
    .line 132
    :cond_1
    :goto_1
    :try_start_2
    invoke-static {}, Lcom/tantanapp/push/oppo/OPushService;->isSupportPush()Z

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    if-eqz v0, :cond_2

    .line 137
    .line 138
    iget-object v0, p0, Ll/cmb0;->a:Ljava/util/List;

    .line 139
    .line 140
    new-instance v1, Lcom/tantanapp/push/oppo/OPushService$a;

    .line 141
    .line 142
    invoke-direct {v1}, Lcom/tantanapp/push/oppo/OPushService$a;-><init>()V

    .line 143
    .line 144
    .line 145
    iget-object v2, p0, Ll/cmb0;->h:Ll/hmb0$a;

    .line 146
    .line 147
    invoke-virtual {v1, v2}, Ll/hmb0;->g(Ll/hmb0$a;)Ll/hmb0;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 152
    .line 153
    .line 154
    goto :goto_2

    .line 155
    :catchall_2
    move-exception v0

    .line 156
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->g(Ljava/lang/Throwable;)V

    .line 157
    .line 158
    .line 159
    :cond_2
    :goto_2
    :try_start_3
    invoke-static {}, Lcom/tantanapp/push/vivo/ViVoPushReceiver;->shouldApplyVivoPush()Z

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    if-eqz v0, :cond_3

    .line 164
    .line 165
    iget-object v0, p0, Ll/cmb0;->a:Ljava/util/List;

    .line 166
    .line 167
    new-instance v1, Lcom/tantanapp/push/vivo/ViVoPushReceiver;

    .line 168
    .line 169
    invoke-direct {v1}, Lcom/tantanapp/push/vivo/ViVoPushReceiver;-><init>()V

    .line 170
    .line 171
    .line 172
    invoke-virtual {v1}, Lcom/tantanapp/push/vivo/ViVoPushReceiver;->getController()Lcom/tantanapp/push/vivo/ViVoPushReceiver$a;

    .line 173
    .line 174
    .line 175
    move-result-object v1

    .line 176
    iget-object v2, p0, Ll/cmb0;->h:Ll/hmb0$a;

    .line 177
    .line 178
    invoke-virtual {v1, v2}, Ll/hmb0;->g(Ll/hmb0$a;)Ll/hmb0;

    .line 179
    .line 180
    .line 181
    move-result-object v1

    .line 182
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 183
    .line 184
    .line 185
    goto :goto_3

    .line 186
    :catchall_3
    move-exception v0

    .line 187
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->g(Ljava/lang/Throwable;)V

    .line 188
    .line 189
    .line 190
    :cond_3
    :goto_3
    :try_start_4
    iget-object v0, p0, Ll/cmb0;->a:Ljava/util/List;

    .line 191
    .line 192
    invoke-static {}, Ll/qlg;->m()Ll/qlg;

    .line 193
    .line 194
    .line 195
    move-result-object v1

    .line 196
    iget-object p0, p0, Ll/cmb0;->h:Ll/hmb0$a;

    .line 197
    .line 198
    invoke-virtual {v1, p0}, Ll/hmb0;->g(Ll/hmb0$a;)Ll/hmb0;

    .line 199
    .line 200
    .line 201
    move-result-object p0

    .line 202
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    .line 203
    .line 204
    .line 205
    goto :goto_4

    .line 206
    :catchall_4
    move-exception p0

    .line 207
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->g(Ljava/lang/Throwable;)V

    .line 208
    .line 209
    .line 210
    :goto_4
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/data/PushMessage;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic b(Ll/cmb0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cmb0;->W()V

    return-void
.end method

.method public static synthetic c(Ll/cmb0;Ljava/lang/String;Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/cmb0;->Q(Ljava/lang/String;Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;)V

    return-void
.end method

.method public static synthetic d(Ljava/util/List;Ll/hmb0;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ll/hmb0;->d()Lrx/subjects/a;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Ll/plb0;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/plb0;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    const-wide/16 v0, 0xa

    .line 15
    .line 16
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 17
    .line 18
    invoke-virtual {p1, v0, v1, v2}, Lrx/c;->take(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1}, Lrx/c;->materialize()Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1}, Lrx/c;->first()Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public static synthetic e(Ll/cmb0;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cmb0;->R(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic f(Ll/cmb0;Ll/cmb0$g;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/cmb0;->U(Ll/cmb0$g;Ljava/lang/String;)V

    return-void
.end method

.method public static f0(Lcom/p1/mobile/putong/api/push/PushTrackData;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/api/push/PushTrackData;->alreadyClicked:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Ll/cmb0;->i:Ll/cmb0$e;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/api/push/PushTrackData;->gid:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/cmb0$e;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    new-instance v0, Ll/tlb0;

    .line 17
    .line 18
    invoke-direct {v0, p0}, Ll/tlb0;-><init>(Lcom/p1/mobile/putong/api/push/PushTrackData;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/data/PushMessage;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static g0(Ljava/lang/String;)V
    .locals 4

    .line 1
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/bn5;->userId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/cmb0;->q(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "userid"

    .line 12
    .line 13
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "push_token"

    .line 18
    .line 19
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {}, Ll/hb00;->b()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-static {v1}, Ll/cmb0;->q(Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    const-string v2, "oaid"

    .line 32
    .line 33
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    new-instance v2, Ljava/util/Date;

    .line 38
    .line 39
    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v2}, Ljava/util/Date;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    const-string v3, "date"

    .line 47
    .line 48
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    filled-new-array {v0, p0, v1, v2}, [Ll/pf60;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    const-string v0, "e_push_token_upload"

    .line 57
    .line 58
    const-string v1, ""

    .line 59
    .line 60
    invoke-static {v0, v1, p0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public static synthetic h(Ll/cmb0;Ll/cmb0$g;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/cmb0;->T(Ll/cmb0$g;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic i([Ljava/lang/Object;)Ljava/lang/Boolean;
    .locals 3

    .line 1
    sget-object v0, Ll/uqb0;->O:Ll/tl8;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/tl8;->I()Lrx/subjects/a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_0
    array-length v0, p0

    .line 23
    const/4 v1, 0x0

    .line 24
    :goto_0
    if-ge v1, v0, :cond_2

    .line 25
    .line 26
    aget-object v2, p0, v1

    .line 27
    .line 28
    if-eqz v2, :cond_1

    .line 29
    .line 30
    check-cast v2, Ljava/lang/Boolean;

    .line 31
    .line 32
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-eqz v2, :cond_1

    .line 37
    .line 38
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 39
    .line 40
    return-object p0

    .line 41
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 45
    .line 46
    return-object p0
.end method

.method public static synthetic j(Ll/cmb0;Ll/cmb0$g;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/cmb0;->V(Ll/cmb0$g;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic k([Ljava/lang/Object;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic l(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/api/push/PushTrackData;)V
    .locals 7

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "https://client-monitor.tantanapp.com/push?"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance v1, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    iget-object v2, p0, Lcom/p1/mobile/putong/api/push/PushTrackData;->pushName:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v2, "="

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    if-nez v2, :cond_0

    .line 28
    .line 29
    const-string v2, "background"

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const-string v2, "foreground"

    .line 33
    .line 34
    :goto_0
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    new-instance v1, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    const-string v2, "&intent="

    .line 47
    .line 48
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    iget-object v2, p0, Lcom/p1/mobile/putong/api/push/PushTrackData;->intent:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    new-instance v1, Ljava/lang/StringBuilder;

    .line 64
    .line 65
    const-string v2, "&duration="

    .line 66
    .line 67
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    iget-wide v2, p0, Lcom/p1/mobile/putong/api/push/PushTrackData;->duration:J

    .line 71
    .line 72
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    new-instance v1, Ljava/lang/StringBuilder;

    .line 83
    .line 84
    const-string v2, "&received_time="

    .line 85
    .line 86
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 90
    .line 91
    .line 92
    move-result-wide v2

    .line 93
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    new-instance v1, Ljava/lang/StringBuilder;

    .line 104
    .line 105
    const-string v2, "&create_time="

    .line 106
    .line 107
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    iget-wide v2, p0, Lcom/p1/mobile/putong/api/push/PushTrackData;->createdTime:D

    .line 111
    .line 112
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    new-instance v1, Ljava/lang/StringBuilder;

    .line 123
    .line 124
    const-string v2, "&is_clicked="

    .line 125
    .line 126
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    iget-boolean v2, p0, Lcom/p1/mobile/putong/api/push/PushTrackData;->alreadyClicked:Z

    .line 130
    .line 131
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    new-instance v1, Ljava/lang/StringBuilder;

    .line 142
    .line 143
    const-string v2, "&is_login="

    .line 144
    .line 145
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    sget-object v2, Ll/uqb0;->c0:Ll/bn5;

    .line 149
    .line 150
    invoke-interface {v2}, Ll/bn5;->signedIn_()Z

    .line 151
    .line 152
    .line 153
    move-result v2

    .line 154
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v1

    .line 161
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    iget-object v1, p0, Lcom/p1/mobile/putong/api/push/PushTrackData;->gid:Ljava/lang/String;

    .line 165
    .line 166
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 167
    .line 168
    .line 169
    move-result v1

    .line 170
    if-nez v1, :cond_1

    .line 171
    .line 172
    new-instance v1, Ljava/lang/StringBuilder;

    .line 173
    .line 174
    const-string v2, "&gid="

    .line 175
    .line 176
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 177
    .line 178
    .line 179
    iget-object v2, p0, Lcom/p1/mobile/putong/api/push/PushTrackData;->gid:Ljava/lang/String;

    .line 180
    .line 181
    invoke-static {v2}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v2

    .line 185
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object v1

    .line 192
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 193
    .line 194
    .line 195
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/api/push/PushTrackData;->reqId:Ljava/lang/String;

    .line 196
    .line 197
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 198
    .line 199
    .line 200
    move-result v1

    .line 201
    if-nez v1, :cond_2

    .line 202
    .line 203
    new-instance v1, Ljava/lang/StringBuilder;

    .line 204
    .line 205
    const-string v2, "&req_id="

    .line 206
    .line 207
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 208
    .line 209
    .line 210
    iget-object p0, p0, Lcom/p1/mobile/putong/api/push/PushTrackData;->reqId:Ljava/lang/String;

    .line 211
    .line 212
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 213
    .line 214
    .line 215
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object p0

    .line 219
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 220
    .line 221
    .line 222
    :cond_2
    sget-object p0, Ll/uqb0;->c0:Ll/bn5;

    .line 223
    .line 224
    invoke-interface {p0}, Ll/bn5;->signedIn_()Z

    .line 225
    .line 226
    .line 227
    move-result p0

    .line 228
    if-eqz p0, :cond_3

    .line 229
    .line 230
    new-instance p0, Ljava/lang/StringBuilder;

    .line 231
    .line 232
    const-string v1, "&user_id="

    .line 233
    .line 234
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 235
    .line 236
    .line 237
    sget-object v1, Ll/uqb0;->c0:Ll/bn5;

    .line 238
    .line 239
    invoke-interface {v1}, Ll/bn5;->userId()Ljava/lang/String;

    .line 240
    .line 241
    .line 242
    move-result-object v1

    .line 243
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 244
    .line 245
    .line 246
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object p0

    .line 250
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 251
    .line 252
    .line 253
    :cond_3
    const/4 p0, 0x0

    .line 254
    move v1, p0

    .line 255
    :goto_1
    const/4 v2, 0x2

    .line 256
    if-gt p0, v2, :cond_6

    .line 257
    .line 258
    if-nez v1, :cond_6

    .line 259
    .line 260
    const/4 v2, 0x1

    .line 261
    const/4 v3, 0x0

    .line 262
    :try_start_0
    sget-object v4, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 263
    .line 264
    invoke-virtual {v4}, Lcom/p1/mobile/putong/api/api/Network;->basic()Ll/x1d0$a;

    .line 265
    .line 266
    .line 267
    move-result-object v4

    .line 268
    const-string v5, "Content-Encoding"

    .line 269
    .line 270
    const-string v6, "gzip"

    .line 271
    .line 272
    invoke-virtual {v4, v5, v6}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 273
    .line 274
    .line 275
    sget-object v5, Ll/uqb0;->D:Ll/rg50;

    .line 276
    .line 277
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 278
    .line 279
    .line 280
    move-result-object v6

    .line 281
    invoke-virtual {v4, v6}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 282
    .line 283
    .line 284
    move-result-object v4

    .line 285
    invoke-virtual {v4}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 286
    .line 287
    .line 288
    move-result-object v4

    .line 289
    invoke-virtual {v4}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 290
    .line 291
    .line 292
    move-result-object v4

    .line 293
    invoke-virtual {v5, v4}, Ll/rg50;->a(Ll/x1d0;)Ll/ry3;

    .line 294
    .line 295
    .line 296
    move-result-object v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 297
    :try_start_1
    invoke-interface {v4}, Ll/ry3;->execute()Ll/i5d0;

    .line 298
    .line 299
    .line 300
    move-result-object v3
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 301
    goto :goto_2

    .line 302
    :catchall_0
    move-exception p0

    .line 303
    goto :goto_5

    .line 304
    :catch_0
    add-int/lit8 p0, p0, 0x1

    .line 305
    .line 306
    :goto_2
    if-eqz v3, :cond_5

    .line 307
    .line 308
    :try_start_2
    invoke-virtual {v3}, Ll/i5d0;->q()I

    .line 309
    .line 310
    .line 311
    move-result v4
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 312
    const/16 v5, 0xc8

    .line 313
    .line 314
    if-lt v4, v5, :cond_4

    .line 315
    .line 316
    const/16 v5, 0x12c

    .line 317
    .line 318
    if-ge v4, v5, :cond_4

    .line 319
    .line 320
    move v1, v2

    .line 321
    goto :goto_3

    .line 322
    :cond_4
    add-int/lit8 p0, p0, 0x3

    .line 323
    .line 324
    goto :goto_3

    .line 325
    :catch_1
    move-exception v4

    .line 326
    goto :goto_4

    .line 327
    :cond_5
    :goto_3
    invoke-static {v3}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 328
    .line 329
    .line 330
    goto :goto_1

    .line 331
    :goto_4
    add-int/2addr p0, v2

    .line 332
    :try_start_3
    invoke-static {v4}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 333
    .line 334
    .line 335
    goto :goto_3

    .line 336
    :goto_5
    invoke-static {v3}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 337
    .line 338
    .line 339
    throw p0

    .line 340
    :cond_6
    return-void
.end method

.method public static synthetic n(Ll/cmb0;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cmb0;->S(Ll/uxj0;)V

    return-void
.end method

.method public static bridge synthetic o(Ll/cmb0;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cmb0;->a:Ljava/util/List;

    return-object p0
.end method

.method public static q(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const-string p0, ""

    .line 4
    .line 5
    :cond_0
    return-object p0
.end method

.method public static r(Landroid/app/Activity;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static t(Lcom/p1/mobile/putong/data/PushMessage;ZLjava/lang/String;)Lcom/p1/mobile/putong/api/push/PushTrackData;
    .locals 6

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/api/push/PushTrackData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/api/push/PushTrackData;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 7
    .line 8
    invoke-virtual {v1}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 9
    .line 10
    .line 11
    move-result-wide v1

    .line 12
    iput-wide v1, v0, Lcom/p1/mobile/putong/api/push/PushTrackData;->currentTime:J

    .line 13
    .line 14
    long-to-double v1, v1

    .line 15
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/PushMessage;->createdTime:D

    .line 16
    .line 17
    sub-double/2addr v1, v3

    .line 18
    double-to-long v1, v1

    .line 19
    const-wide/16 v3, 0x0

    .line 20
    .line 21
    cmp-long v5, v1, v3

    .line 22
    .line 23
    if-ltz v5, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    move-wide v1, v3

    .line 27
    :goto_0
    iput-wide v1, v0, Lcom/p1/mobile/putong/api/push/PushTrackData;->duration:J

    .line 28
    .line 29
    iput-boolean p1, v0, Lcom/p1/mobile/putong/api/push/PushTrackData;->alreadyClicked:Z

    .line 30
    .line 31
    iput-object p2, v0, Lcom/p1/mobile/putong/api/push/PushTrackData;->pushName:Ljava/lang/String;

    .line 32
    .line 33
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 34
    .line 35
    if-nez p1, :cond_1

    .line 36
    .line 37
    const/4 p1, 0x0

    .line 38
    goto :goto_1

    .line 39
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    :goto_1
    iput-object p1, v0, Lcom/p1/mobile/putong/api/push/PushTrackData;->intent:Ljava/lang/String;

    .line 44
    .line 45
    iget-wide p1, p0, Lcom/p1/mobile/putong/data/PushMessage;->createdTime:D

    .line 46
    .line 47
    iput-wide p1, v0, Lcom/p1/mobile/putong/api/push/PushTrackData;->createdTime:D

    .line 48
    .line 49
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessage;->gid:Ljava/lang/String;

    .line 50
    .line 51
    iput-object p1, v0, Lcom/p1/mobile/putong/api/push/PushTrackData;->gid:Ljava/lang/String;

    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessage;->reqId:Ljava/lang/String;

    .line 54
    .line 55
    iput-object p0, v0, Lcom/p1/mobile/putong/api/push/PushTrackData;->reqId:Ljava/lang/String;

    .line 56
    .line 57
    return-object v0
.end method


# virtual methods
.method public final A(Ljava/lang/String;Lcom/p1/mobile/putong/data/PushMessage;Ljava/lang/String;Lcom/p1/mobile/putong/api/push/PushTrackData;)Landroid/app/PendingIntent;
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .line 1
    iget-object p3, p0, Ll/cmb0;->f:Ljava/util/Map;

    .line 2
    .line 3
    iget-object v0, p2, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 4
    .line 5
    invoke-interface {p3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    check-cast p3, Ljava/util/List;

    .line 10
    .line 11
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x0

    .line 16
    if-nez v0, :cond_2

    .line 17
    .line 18
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 23
    .line 24
    .line 25
    move-result p3

    .line 26
    if-eqz p3, :cond_5

    .line 27
    .line 28
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p3

    .line 32
    check-cast p3, Ll/cmb0$g;

    .line 33
    .line 34
    if-eqz p3, :cond_0

    .line 35
    .line 36
    iget-object v0, p2, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 37
    .line 38
    invoke-interface {p3, p1, v0, p2, p4}, Ll/cmb0$g;->b(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;)Landroid/app/PendingIntent;

    .line 39
    .line 40
    .line 41
    move-result-object p3

    .line 42
    if-eqz p3, :cond_1

    .line 43
    .line 44
    return-object p3

    .line 45
    :cond_1
    move-object v1, p3

    .line 46
    goto :goto_0

    .line 47
    :cond_2
    iget-object p3, p0, Ll/cmb0;->g:Ljava/util/Map;

    .line 48
    .line 49
    invoke-interface {p3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 50
    .line 51
    .line 52
    move-result-object p3

    .line 53
    new-instance v0, Ll/vlb0;

    .line 54
    .line 55
    invoke-direct {v0, p2}, Ll/vlb0;-><init>(Lcom/p1/mobile/putong/data/PushMessage;)V

    .line 56
    .line 57
    .line 58
    invoke-static {p3, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object p3

    .line 62
    check-cast p3, Ljava/lang/String;

    .line 63
    .line 64
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-nez v0, :cond_5

    .line 69
    .line 70
    iget-object p0, p0, Ll/cmb0;->g:Ljava/util/Map;

    .line 71
    .line 72
    invoke-interface {p0, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    check-cast p0, Ljava/util/List;

    .line 77
    .line 78
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 79
    .line 80
    .line 81
    move-result p3

    .line 82
    if-nez p3, :cond_5

    .line 83
    .line 84
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    :cond_3
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 89
    .line 90
    .line 91
    move-result p3

    .line 92
    if-eqz p3, :cond_5

    .line 93
    .line 94
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object p3

    .line 98
    check-cast p3, Ll/cmb0$g;

    .line 99
    .line 100
    if-eqz p3, :cond_3

    .line 101
    .line 102
    iget-object v0, p2, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 103
    .line 104
    invoke-interface {p3, p1, v0, p2, p4}, Ll/cmb0$g;->b(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;)Landroid/app/PendingIntent;

    .line 105
    .line 106
    .line 107
    move-result-object p3

    .line 108
    if-eqz p3, :cond_4

    .line 109
    .line 110
    return-object p3

    .line 111
    :cond_4
    move-object v1, p3

    .line 112
    goto :goto_1

    .line 113
    :cond_5
    if-nez v1, :cond_6

    .line 114
    .line 115
    new-instance p0, Landroid/content/Intent;

    .line 116
    .line 117
    sget-object p1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 118
    .line 119
    const-class p2, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;

    .line 120
    .line 121
    invoke-direct {p0, p1, p2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 122
    .line 123
    .line 124
    const/4 p1, 0x1

    .line 125
    invoke-static {p0, p1, p1}, Ll/toh0;->d(Landroid/content/Intent;ZZ)V

    .line 126
    .line 127
    .line 128
    invoke-static {p0, p4}, Ll/toh0;->e(Landroid/content/Intent;Lcom/p1/mobile/putong/api/push/PushTrackData;)V

    .line 129
    .line 130
    .line 131
    sget-object p1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 132
    .line 133
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 134
    .line 135
    .line 136
    move-result-wide p2

    .line 137
    long-to-int p2, p2

    .line 138
    const/high16 p3, 0x4000000

    .line 139
    .line 140
    invoke-static {p1, p2, p0, p3}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    return-object p0

    .line 145
    :cond_6
    return-object v1
.end method

.method public final B(Ljava/lang/String;Lcom/p1/mobile/putong/data/PushMessage;ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p2, p3, p4}, Ll/cmb0;->t(Lcom/p1/mobile/putong/data/PushMessage;ZLjava/lang/String;)Lcom/p1/mobile/putong/api/push/PushTrackData;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    new-instance p4, Ll/ylb0;

    .line 6
    .line 7
    invoke-direct {p4, p0, p1, p2, p3}, Ll/ylb0;-><init>(Ll/cmb0;Ljava/lang/String;Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p4}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public C()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/cmb0;->y()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/cmb0$c;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/cmb0$c;-><init>(Ll/cmb0;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public D()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/cmb0;->y()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/cmb0$a;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/cmb0$a;-><init>(Ll/cmb0;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public E()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/cmb0;->y()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/cmb0$b;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/cmb0$b;-><init>(Ll/cmb0;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public final F()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/cmb0;->e:Ll/kcg0;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 6
    .line 7
    invoke-interface {v0}, Ll/bn5;->signedIn_()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    sget-object v0, Ll/uqb0;->j0:Ll/dg00;

    .line 14
    .line 15
    iget-object v0, v0, Ll/dg00;->b:Lrx/subjects/a;

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    sget-object v0, Ll/uqb0;->j0:Ll/dg00;

    .line 19
    .line 20
    iget-object v0, v0, Ll/dg00;->f:Lrx/subjects/a;

    .line 21
    .line 22
    :goto_0
    const/4 v1, 0x1

    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v1, Ll/wlb0;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ll/wlb0;-><init>(Ll/cmb0;)V

    .line 38
    .line 39
    .line 40
    new-instance v2, Ll/xlb0;

    .line 41
    .line 42
    invoke-direct {v2}, Ll/xlb0;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iput-object v0, p0, Ll/cmb0;->e:Ll/kcg0;

    .line 54
    .line 55
    :cond_1
    return-void
.end method

.method public final G(Ljava/lang/String;Z)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    if-eqz p2, :cond_2

    .line 3
    .line 4
    const-string p2, "opush"

    .line 5
    .line 6
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result p2

    .line 10
    if-nez p2, :cond_1

    .line 11
    .line 12
    const-string p2, "vivopush"

    .line 13
    .line 14
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    if-nez p2, :cond_1

    .line 19
    .line 20
    const-string p2, "honor"

    .line 21
    .line 22
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    return p0

    .line 30
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 31
    :cond_2
    return p0
.end method

.method public final H(Lcom/p1/mobile/putong/data/PushMessage;Ljava/lang/String;)Z
    .locals 3

    .line 1
    iget-boolean p0, p0, Ll/cmb0;->c:Z

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    const-string p0, "getui"

    .line 8
    .line 9
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_3

    .line 14
    .line 15
    const-string p0, "conversation.single"

    .line 16
    .line 17
    iget-object p2, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    const/4 p2, 0x1

    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    return p2

    .line 27
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/api/WebSocketManager;->Q()Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/WebSocketManager;->T()Ljava/util/List;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    :cond_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v1, :cond_3

    .line 44
    .line 45
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    check-cast v1, Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-nez v2, :cond_2

    .line 56
    .line 57
    iget-object v2, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-eqz v1, :cond_2

    .line 64
    .line 65
    return p2

    .line 66
    :cond_3
    return v0
.end method

.method public I()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/qlg;->m()Ll/qlg;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/hmb0;->d()Lrx/subjects/a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    xor-int/lit8 p0, p0, 0x1

    .line 20
    .line 21
    return p0
.end method

.method public J()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/ugl;->q()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public K()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public L()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cmb0;->C()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public M()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cmb0;->D()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public N()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/cmb0;->K()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/cmb0;->M()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/cmb0;->O()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/cmb0;->I()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/cmb0;->L()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/cmb0;->J()Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_0

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    const/4 p0, 0x0

    .line 39
    return p0

    .line 40
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 41
    return p0
.end method

.method public O()Z
    .locals 1

    .line 1
    invoke-static {}, Ll/ilb0;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/cmb0;->E()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public final P(Lcom/p1/mobile/putong/data/PushMessage;Ljava/lang/String;)Z
    .locals 2

    .line 1
    const-string p0, "hwpush"

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    iget-wide p0, p1, Lcom/p1/mobile/putong/data/PushMessage;->createdTime:D

    .line 16
    .line 17
    double-to-long p0, p0

    .line 18
    sub-long/2addr v0, p0

    .line 19
    const-wide/32 p0, 0x493e0

    .line 20
    .line 21
    .line 22
    cmp-long p0, v0, p0

    .line 23
    .line 24
    if-lez p0, :cond_0

    .line 25
    .line 26
    const/4 p0, 0x1

    .line 27
    return p0

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    return p0
.end method

.method public final synthetic Q(Ljava/lang/String;Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-virtual {p0, p1, p2, p3}, Ll/cmb0;->X(Ljava/lang/String;Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2
    .line 3
    .line 4
    return-void

    .line 5
    :catchall_0
    move-exception p0

    .line 6
    new-instance p1, Ljava/lang/Throwable;

    .line 7
    .line 8
    new-instance p2, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string p3, "handlePushMessageInUI throwable:"

    .line 11
    .line 12
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p3

    .line 19
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    invoke-direct {p1, p2, p0}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 27
    .line 28
    .line 29
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final synthetic R(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cmb0;->u()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic S(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cmb0;->y()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/tl8;->F(Ljava/util/List;)Lcom/p1/mobile/putong/data/Device;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Device;->toJson()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Ll/cmb0;->g0(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic T(Ll/cmb0$g;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_2

    .line 6
    .line 7
    iget-object v0, p0, Ll/cmb0;->f:Ljava/util/Map;

    .line 8
    .line 9
    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ljava/util/List;

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    invoke-static {p1}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-nez v1, :cond_1

    .line 27
    .line 28
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/cmb0;->f:Ljava/util/Map;

    .line 32
    .line 33
    invoke-interface {p0, p2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    :cond_2
    return-void
.end method

.method public final synthetic U(Ll/cmb0$g;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_2

    .line 6
    .line 7
    iget-object v0, p0, Ll/cmb0;->f:Ljava/util/Map;

    .line 8
    .line 9
    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ljava/util/List;

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    invoke-static {p1}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-nez v1, :cond_1

    .line 27
    .line 28
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/cmb0;->f:Ljava/util/Map;

    .line 32
    .line 33
    invoke-interface {p0, p2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    :cond_2
    return-void
.end method

.method public final synthetic V(Ll/cmb0$g;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_2

    .line 6
    .line 7
    iget-object v0, p0, Ll/cmb0;->g:Ljava/util/Map;

    .line 8
    .line 9
    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ljava/util/List;

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    invoke-static {p1}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-nez v1, :cond_1

    .line 27
    .line 28
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/cmb0;->g:Ljava/util/Map;

    .line 32
    .line 33
    invoke-interface {p0, p2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    :cond_2
    return-void
.end method

.method public final synthetic W()V
    .locals 1

    .line 1
    const-class v0, Ll/cmb0;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-virtual {p0}, Ll/cmb0;->Z()V

    .line 5
    .line 6
    .line 7
    monitor-exit v0

    .line 8
    return-void

    .line 9
    :catchall_0
    move-exception p0

    .line 10
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    throw p0
.end method

.method public final X(Ljava/lang/String;Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;)Z
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .line 1
    iget-object v0, p3, Lcom/p1/mobile/putong/api/push/PushTrackData;->pushName:Ljava/lang/String;

    .line 2
    .line 3
    iput-object v0, p2, Lcom/p1/mobile/putong/data/PushMessage;->pushName:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p3}, Ll/cmb0;->f0(Lcom/p1/mobile/putong/api/push/PushTrackData;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p3, Lcom/p1/mobile/putong/api/push/PushTrackData;->pushName:Ljava/lang/String;

    .line 9
    .line 10
    iget-boolean v1, p3, Lcom/p1/mobile/putong/api/push/PushTrackData;->alreadyClicked:Z

    .line 11
    .line 12
    invoke-virtual {p0, v0, v1}, Ll/cmb0;->G(Ljava/lang/String;Z)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p3, Lcom/p1/mobile/putong/api/push/PushTrackData;->pushName:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {p0, p2, v0}, Ll/cmb0;->H(Lcom/p1/mobile/putong/data/PushMessage;Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_5

    .line 25
    .line 26
    iget-object v0, p0, Ll/cmb0;->b:Ll/cmb0$e;

    .line 27
    .line 28
    iget-object v1, p2, Lcom/p1/mobile/putong/data/PushMessage;->gid:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ll/cmb0$e;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_5

    .line 35
    .line 36
    iget-object v0, p3, Lcom/p1/mobile/putong/api/push/PushTrackData;->pushName:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {p0, p2, v0}, Ll/cmb0;->P(Lcom/p1/mobile/putong/data/PushMessage;Ljava/lang/String;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-nez v0, :cond_5

    .line 43
    .line 44
    :cond_0
    iget-boolean v0, p3, Lcom/p1/mobile/putong/api/push/PushTrackData;->alreadyClicked:Z

    .line 45
    .line 46
    if-nez v0, :cond_3

    .line 47
    .line 48
    invoke-static {}, Ll/uqb0;->J0()Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-nez v0, :cond_2

    .line 53
    .line 54
    iget-object v0, p0, Ll/cmb0;->d:Ljava/util/List;

    .line 55
    .line 56
    if-nez v0, :cond_1

    .line 57
    .line 58
    new-instance v0, Ljava/util/ArrayList;

    .line 59
    .line 60
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 61
    .line 62
    .line 63
    iput-object v0, p0, Ll/cmb0;->d:Ljava/util/List;

    .line 64
    .line 65
    :cond_1
    iget-object v0, p0, Ll/cmb0;->d:Ljava/util/List;

    .line 66
    .line 67
    new-instance v1, Ll/cmb0$f;

    .line 68
    .line 69
    iget-object v2, p3, Lcom/p1/mobile/putong/api/push/PushTrackData;->pushName:Ljava/lang/String;

    .line 70
    .line 71
    invoke-direct {v1, v2, p1, p2, p3}, Ll/cmb0$f;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;)V

    .line 72
    .line 73
    .line 74
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0}, Ll/cmb0;->F()V

    .line 78
    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_2
    iget-object v0, p3, Lcom/p1/mobile/putong/api/push/PushTrackData;->pushName:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {p0, v0, p2, p1, p3}, Ll/cmb0;->v(Ljava/lang/String;Lcom/p1/mobile/putong/data/PushMessage;Ljava/lang/String;Lcom/p1/mobile/putong/api/push/PushTrackData;)V

    .line 84
    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_3
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 88
    .line 89
    invoke-interface {v0}, Ll/bn5;->signedIn_()Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    const/4 v1, 0x1

    .line 94
    if-eqz v0, :cond_4

    .line 95
    .line 96
    :try_start_0
    iget-object v0, p3, Lcom/p1/mobile/putong/api/push/PushTrackData;->pushName:Ljava/lang/String;

    .line 97
    .line 98
    invoke-virtual {p0, v0, p2, p1, p3}, Ll/cmb0;->A(Ljava/lang/String;Lcom/p1/mobile/putong/data/PushMessage;Ljava/lang/String;Lcom/p1/mobile/putong/api/push/PushTrackData;)Landroid/app/PendingIntent;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-virtual {p0}, Landroid/app/PendingIntent;->send()V
    :try_end_0
    .catch Landroid/app/PendingIntent$CanceledException; {:try_start_0 .. :try_end_0} :catch_0

    .line 103
    .line 104
    .line 105
    return v1

    .line 106
    :catch_0
    move-exception p0

    .line 107
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 108
    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_4
    iget-object p1, p2, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 112
    .line 113
    invoke-virtual {p0, p1}, Ll/cmb0;->x(Ljava/lang/String;)Z

    .line 114
    .line 115
    .line 116
    move-result p1

    .line 117
    if-eqz p1, :cond_5

    .line 118
    .line 119
    invoke-virtual {p0, p2, v1}, Ll/cmb0;->z(Lcom/p1/mobile/putong/data/PushMessage;Z)Landroid/content/Intent;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    invoke-static {p0, v1, v1}, Ll/toh0;->d(Landroid/content/Intent;ZZ)V

    .line 124
    .line 125
    .line 126
    sget-object p1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 127
    .line 128
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 129
    .line 130
    .line 131
    move-result-wide p2

    .line 132
    long-to-int p2, p2

    .line 133
    const/high16 p3, 0x4000000

    .line 134
    .line 135
    invoke-static {p1, p2, p0, p3}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    :try_start_1
    invoke-virtual {p0}, Landroid/app/PendingIntent;->send()V
    :try_end_1
    .catch Landroid/app/PendingIntent$CanceledException; {:try_start_1 .. :try_end_1} :catch_1

    .line 140
    .line 141
    .line 142
    return v1

    .line 143
    :catch_1
    move-exception p0

    .line 144
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 145
    .line 146
    .line 147
    :cond_5
    :goto_0
    const/4 p0, 0x0

    .line 148
    return p0
.end method

.method public Y()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
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
    iget-object v1, p0, Ll/cmb0;->a:Ljava/util/List;

    .line 7
    .line 8
    new-instance v2, Ll/amb0;

    .line 9
    .line 10
    invoke-direct {v2, v0}, Ll/amb0;-><init>(Ljava/util/List;)V

    .line 11
    .line 12
    .line 13
    invoke-static {v1, v2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 14
    .line 15
    .line 16
    new-instance v1, Ll/bmb0;

    .line 17
    .line 18
    invoke-direct {v1}, Ll/bmb0;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-static {v0, v1}, Ll/psd0;->p(Ljava/util/List;Ll/zcj;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ll/olb0;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/olb0;-><init>(Ll/cmb0;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0
.end method

.method public Z()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/cmb0;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/hmb0;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/hmb0;->i()V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return-void
.end method

.method public a0(Ll/cmb0$g;Ljava/util/List;)V
    .locals 1
    .param p1    # Ll/cmb0$g;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/cmb0$g;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/zlb0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/zlb0;-><init>(Ll/cmb0;Ll/cmb0$g;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p2, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public b0(Ll/cmb0$g;Ljava/util/List;Ljava/util/List;)V
    .locals 1
    .param p1    # Ll/cmb0$g;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/cmb0$g;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/qlb0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/qlb0;-><init>(Ll/cmb0;Ll/cmb0$g;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p2, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 7
    .line 8
    .line 9
    new-instance p2, Ll/rlb0;

    .line 10
    .line 11
    invoke-direct {p2, p0, p1}, Ll/rlb0;-><init>(Ll/cmb0;Ll/cmb0$g;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p3, p2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public c0()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/cmb0;->c:Z

    .line 3
    .line 4
    return-void
.end method

.method public d0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/cmb0;->c:Z

    .line 2
    .line 3
    return-void
.end method

.method public e0()V
    .locals 1

    .line 1
    new-instance v0, Ll/nlb0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/nlb0;-><init>(Ll/cmb0;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    invoke-static {v0, p0}, Ll/l51;->z(Ljava/lang/Runnable;Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public p(Landroid/content/Intent;)Z
    .locals 4

    .line 1
    const-string v0, "custom"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :try_start_0
    const-string v2, "mopush"

    .line 8
    .line 9
    sget-object v3, Lcom/p1/mobile/putong/data/PushMessage;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v3, v0}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lcom/p1/mobile/putong/data/PushMessage;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessage;->pushChannel:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    goto :goto_0

    .line 28
    :catch_0
    move v0, v1

    .line 29
    :goto_0
    iget-object p0, p0, Ll/cmb0;->a:Ljava/util/List;

    .line 30
    .line 31
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-eqz v2, :cond_1

    .line 40
    .line 41
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    check-cast v2, Ll/hmb0;

    .line 46
    .line 47
    instance-of v3, v2, Ll/de00;

    .line 48
    .line 49
    if-ne v0, v3, :cond_0

    .line 50
    .line 51
    invoke-virtual {v2, p1}, Ll/hmb0;->a(Landroid/content/Intent;)Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-eqz v1, :cond_0

    .line 56
    .line 57
    :cond_1
    return v1
.end method

.method public s()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
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
    iget-object p0, p0, Ll/cmb0;->a:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Ll/hmb0;

    .line 23
    .line 24
    invoke-virtual {v1}, Ll/hmb0;->b()Lrx/subjects/a;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    sget-object p0, Ll/uqb0;->O:Ll/tl8;

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/tl8;->I()Lrx/subjects/a;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    new-instance p0, Ll/slb0;

    .line 42
    .line 43
    invoke-direct {p0}, Ll/slb0;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-static {v0, p0}, Ll/psd0;->p(Ljava/util/List;Ll/zcj;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0
.end method

.method public final u()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/cmb0;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    iget-object v0, p0, Ll/cmb0;->d:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Ll/cmb0$f;

    .line 27
    .line 28
    iget-object v2, v1, Ll/cmb0$f;->a:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v3, v1, Ll/cmb0$f;->c:Lcom/p1/mobile/putong/data/PushMessage;

    .line 31
    .line 32
    iget-object v4, v1, Ll/cmb0$f;->b:Ljava/lang/String;

    .line 33
    .line 34
    iget-object v1, v1, Ll/cmb0$f;->d:Lcom/p1/mobile/putong/api/push/PushTrackData;

    .line 35
    .line 36
    invoke-virtual {p0, v2, v3, v4, v1}, Ll/cmb0;->v(Ljava/lang/String;Lcom/p1/mobile/putong/data/PushMessage;Ljava/lang/String;Lcom/p1/mobile/putong/api/push/PushTrackData;)V

    .line 37
    .line 38
    .line 39
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    iget-object v0, p0, Ll/cmb0;->e:Ll/kcg0;

    .line 44
    .line 45
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_2

    .line 50
    .line 51
    iget-object v0, p0, Ll/cmb0;->e:Ll/kcg0;

    .line 52
    .line 53
    invoke-interface {v0}, Ll/kcg0;->isUnsubscribed()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_2

    .line 58
    .line 59
    iget-object p0, p0, Ll/cmb0;->e:Ll/kcg0;

    .line 60
    .line 61
    invoke-interface {p0}, Ll/kcg0;->unsubscribe()V

    .line 62
    .line 63
    .line 64
    :cond_2
    :goto_1
    return-void
.end method

.method public final v(Ljava/lang/String;Lcom/p1/mobile/putong/data/PushMessage;Ljava/lang/String;Lcom/p1/mobile/putong/api/push/PushTrackData;)V
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .line 1
    iget-object p3, p0, Ll/cmb0;->g:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    new-instance v0, Ll/ulb0;

    .line 8
    .line 9
    invoke-direct {v0, p2}, Ll/ulb0;-><init>(Lcom/p1/mobile/putong/data/PushMessage;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p3, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p3

    .line 16
    check-cast p3, Ljava/lang/String;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    if-eqz p3, :cond_0

    .line 20
    .line 21
    iget-object v1, p0, Ll/cmb0;->g:Ljava/util/Map;

    .line 22
    .line 23
    invoke-interface {v1, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p3

    .line 27
    check-cast p3, Ljava/util/List;

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    move-object p3, v0

    .line 31
    :goto_0
    if-nez p3, :cond_1

    .line 32
    .line 33
    iget-object p0, p0, Ll/cmb0;->f:Ljava/util/Map;

    .line 34
    .line 35
    iget-object p3, p2, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 36
    .line 37
    invoke-interface {p0, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    move-object p3, p0

    .line 42
    check-cast p3, Ljava/util/List;

    .line 43
    .line 44
    :cond_1
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    if-nez p0, :cond_4

    .line 49
    .line 50
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    const/4 p3, 0x0

    .line 55
    :cond_2
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    const/4 v2, 0x1

    .line 60
    if-eqz v1, :cond_3

    .line 61
    .line 62
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    check-cast v1, Ll/cmb0$g;

    .line 67
    .line 68
    if-eqz v1, :cond_2

    .line 69
    .line 70
    iget-object v3, p2, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 71
    .line 72
    invoke-interface {v1, p1, v3, p2, p4}, Ll/cmb0$g;->a(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;)Z

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    if-eqz v1, :cond_2

    .line 77
    .line 78
    move p3, v2

    .line 79
    goto :goto_1

    .line 80
    :cond_3
    if-nez p3, :cond_4

    .line 81
    .line 82
    iget-boolean p0, p2, Lcom/p1/mobile/putong/data/PushMessage;->silent:Z

    .line 83
    .line 84
    if-nez p0, :cond_4

    .line 85
    .line 86
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 87
    .line 88
    invoke-static {p0}, Ll/nae0;->f(Landroid/content/Context;)Landroid/content/Intent;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-static {p0, v2, v2}, Ll/toh0;->d(Landroid/content/Intent;ZZ)V

    .line 93
    .line 94
    .line 95
    invoke-static {p0, p4}, Ll/toh0;->e(Landroid/content/Intent;Lcom/p1/mobile/putong/api/push/PushTrackData;)V

    .line 96
    .line 97
    .line 98
    sget-object p1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 99
    .line 100
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 101
    .line 102
    .line 103
    move-result-wide p3

    .line 104
    long-to-int p3, p3

    .line 105
    const/high16 p4, 0x4000000

    .line 106
    .line 107
    invoke-static {p1, p3, p0, p4}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    invoke-static {p2, p0, v0, v0, v0}, Ll/toh0;->f(Lcom/p1/mobile/putong/data/PushMessage;Landroid/app/PendingIntent;Landroid/content/Intent;Landroidx/core/app/NotificationCompat$Action;Landroidx/core/app/NotificationCompat$Action;)V

    .line 112
    .line 113
    .line 114
    :cond_4
    return-void
.end method

.method public w(Ljava/lang/String;ZLjava/lang/String;)Z
    .locals 3

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    :try_start_0
    sget-object v0, Lcom/p1/mobile/putong/data/PushMessage;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lcom/p1/mobile/putong/data/PushMessage;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/PushMessage;->checkCustomOrigin()Lcom/p1/mobile/putong/data/PushMessage;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {}, Ll/l51;->D()Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-eqz v2, :cond_1

    .line 26
    .line 27
    invoke-static {v0, p2, p3}, Ll/cmb0;->t(Lcom/p1/mobile/putong/data/PushMessage;ZLjava/lang/String;)Lcom/p1/mobile/putong/api/push/PushTrackData;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    invoke-virtual {p0, p1, v0, p2}, Ll/cmb0;->X(Ljava/lang/String;Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    return p0

    .line 36
    :catch_0
    move-exception p0

    .line 37
    goto :goto_0

    .line 38
    :cond_1
    invoke-virtual {p0, p1, v0, p2, p3}, Ll/cmb0;->B(Ljava/lang/String;Lcom/p1/mobile/putong/data/PushMessage;ZLjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 39
    .line 40
    .line 41
    goto :goto_1

    .line 42
    :goto_0
    sget-object p2, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 43
    .line 44
    if-nez p2, :cond_2

    .line 45
    .line 46
    new-instance p0, Ljava/lang/RuntimeException;

    .line 47
    .line 48
    new-instance p2, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    const-string p3, "push network is null "

    .line 51
    .line 52
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    const/16 p1, 0x32

    .line 66
    .line 67
    invoke-static {p0, p1}, Lcom/tantanapp/common/utils/CrashHelper;->d(Ljava/lang/Throwable;I)V

    .line 68
    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_2
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 72
    .line 73
    .line 74
    :goto_1
    return v1
.end method

.method public final x(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {}, Ll/nrb0;->a()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, "devicepush.list"

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public y()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/DevicePush;",
            ">;"
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
    iget-object p0, p0, Ll/cmb0;->a:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Ll/hmb0;

    .line 23
    .line 24
    invoke-virtual {v1}, Ll/hmb0;->d()Lrx/subjects/a;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v2}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    check-cast v2, Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    if-nez v3, :cond_0

    .line 39
    .line 40
    new-instance v3, Lcom/p1/mobile/putong/data/DevicePush;

    .line 41
    .line 42
    invoke-direct {v3}, Lcom/p1/mobile/putong/data/DevicePush;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1}, Ll/hmb0;->e()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    iput-object v1, v3, Lcom/p1/mobile/putong/data/DevicePush;->service:Ljava/lang/String;

    .line 50
    .line 51
    iput-object v2, v3, Lcom/p1/mobile/putong/data/DevicePush;->token:Ljava/lang/String;

    .line 52
    .line 53
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    return-object v0
.end method

.method public final z(Lcom/p1/mobile/putong/data/PushMessage;Z)Landroid/content/Intent;
    .locals 1

    .line 1
    const-string p2, "devicepush.list"

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_1

    .line 10
    .line 11
    new-instance p1, Landroid/content/Intent;

    .line 12
    .line 13
    sget-object p2, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 14
    .line 15
    const-class v0, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;

    .line 16
    .line 17
    invoke-direct {p1, p2, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ll/cmb0;->E()Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-nez p0, :cond_0

    .line 25
    .line 26
    const-string p0, "android.intent.action.MAIN"

    .line 27
    .line 28
    invoke-virtual {p1, p0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 29
    .line 30
    .line 31
    const-string p0, "android.intent.category.LAUNCHER"

    .line 32
    .line 33
    invoke-virtual {p1, p0}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 34
    .line 35
    .line 36
    :cond_0
    return-object p1

    .line 37
    :cond_1
    const/4 p0, 0x0

    .line 38
    return-object p0
.end method
