.class public Ll/nsb0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile a:Z = true

.field public static volatile b:Ljava/lang/String;

.field public static c:Lorg/json/JSONObject;

.field public static final d:Ll/byd0;

.field public static final e:Ll/vxd0;

.field public static final f:Ll/byd0;

.field public static final g:Ll/wyd0;

.field public static final h:Ll/wyd0;

.field public static final i:Ll/wyd0;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/nsb0;->c:Lorg/json/JSONObject;

    .line 7
    .line 8
    new-instance v0, Ll/byd0;

    .line 9
    .line 10
    const-wide/16 v1, 0x0

    .line 11
    .line 12
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const-string v2, "last_app_start_time"

    .line 17
    .line 18
    invoke-direct {v0, v2, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 19
    .line 20
    .line 21
    sput-object v0, Ll/nsb0;->d:Ll/byd0;

    .line 22
    .line 23
    new-instance v0, Ll/vxd0;

    .line 24
    .line 25
    const-string v2, "loginType"

    .line 26
    .line 27
    const/4 v3, -0x1

    .line 28
    invoke-direct {v0, v2, v3}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 29
    .line 30
    .line 31
    sput-object v0, Ll/nsb0;->e:Ll/vxd0;

    .line 32
    .line 33
    new-instance v0, Ll/byd0;

    .line 34
    .line 35
    const-string v2, "last_app_pv_time"

    .line 36
    .line 37
    invoke-direct {v0, v2, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 38
    .line 39
    .line 40
    sput-object v0, Ll/nsb0;->f:Ll/byd0;

    .line 41
    .line 42
    new-instance v0, Ll/wyd0;

    .line 43
    .line 44
    const-string v1, "last_app_pv_id"

    .line 45
    .line 46
    const-string v2, ""

    .line 47
    .line 48
    invoke-direct {v0, v1, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    sput-object v0, Ll/nsb0;->g:Ll/wyd0;

    .line 52
    .line 53
    new-instance v0, Ll/wyd0;

    .line 54
    .line 55
    const-string v1, "last_mc_eid"

    .line 56
    .line 57
    invoke-direct {v0, v1, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    sput-object v0, Ll/nsb0;->h:Ll/wyd0;

    .line 61
    .line 62
    new-instance v0, Ll/wyd0;

    .line 63
    .line 64
    const-string v1, "last_mc_extra"

    .line 65
    .line 66
    invoke-direct {v0, v1, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    sput-object v0, Ll/nsb0;->i:Ll/wyd0;

    .line 70
    .line 71
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ll/q4f;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/fhw;->c(Ll/q4f;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->i()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/nsb0;->s(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic c(Ljava/lang/Object;)V
    .locals 1

    .line 1
    const-string p0, "adtk"

    .line 2
    .line 3
    invoke-static {}, Ll/qzd;->a()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p0, v0}, Ll/i4g0;->H(Ljava/lang/String;Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic d(Ll/uxj0;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/ze60;->c()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/ze60;->b()V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->i()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Ll/nsb0;->s(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Ll/nsb0;->u()V

    .line 15
    .line 16
    .line 17
    new-instance p0, Ll/pf60;

    .line 18
    .line 19
    const-string v0, "ui_type"

    .line 20
    .line 21
    invoke-static {}, Ll/nsb0;->o()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-direct {p0, v0, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    filled-new-array {p0}, [Ll/pf60;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const-string v0, "e_app_ui_type_show"

    .line 33
    .line 34
    const-string v1, ""

    .line 35
    .line 36
    invoke-static {v0, v1, p0}, Ll/i4g0;->B(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public static synthetic e()V
    .locals 5

    .line 1
    new-instance v0, Ll/pf60;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/android/app/App;->i:Ll/vxd0;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, Ljava/lang/Integer;

    .line 10
    .line 11
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const/4 v2, 0x1

    .line 16
    if-ne v1, v2, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 v2, 0x0

    .line 20
    :goto_0
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    const-string v2, "is_first_open"

    .line 25
    .line 26
    invoke-direct {v0, v2, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    new-instance v1, Ll/pf60;

    .line 30
    .line 31
    const-string v2, "user_agent"

    .line 32
    .line 33
    invoke-static {}, Ll/nsb0;->k()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    new-instance v2, Ll/pf60;

    .line 41
    .line 42
    const-string v3, "device_model_raw"

    .line 43
    .line 44
    sget-object v4, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 45
    .line 46
    invoke-direct {v2, v3, v4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    filled-new-array {v0, v1, v2}, [Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    const-string v1, "e_open_app_get_ua"

    .line 54
    .line 55
    const-string v2, ""

    .line 56
    .line 57
    invoke-static {v1, v2, v0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public static synthetic f()V
    .locals 2

    .line 1
    :try_start_0
    invoke-static {}, Ll/k2n;->a()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    goto :goto_0

    .line 6
    :catchall_0
    const-string v0, ""

    .line 7
    .line 8
    :goto_0
    const-string v1, "aad"

    .line 9
    .line 10
    invoke-static {v1, v0}, Ll/i4g0;->H(Ljava/lang/String;Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic g(Ll/uxj0;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/ze60;->c()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/ze60;->b()V

    .line 5
    .line 6
    .line 7
    new-instance p0, Lorg/json/JSONObject;

    .line 8
    .line 9
    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    .line 10
    .line 11
    .line 12
    :try_start_0
    const-string v0, "device_ab"

    .line 13
    .line 14
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->j()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 19
    .line 20
    .line 21
    const-string v0, "odevs"

    .line 22
    .line 23
    invoke-static {v0, p0}, Ll/i4g0;->H(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :catch_0
    move-exception p0

    .line 28
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static bridge synthetic h()Z
    .locals 1

    .line 1
    sget-boolean v0, Ll/nsb0;->a:Z

    return v0
.end method

.method public static bridge synthetic i(Z)V
    .locals 0

    .line 1
    sput-boolean p0, Ll/nsb0;->a:Z

    return-void
.end method

.method public static j()V
    .locals 6

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->i()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/nsb0;->s(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/uqb0;->J0()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-static {}, Ll/nsb0;->u()V

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->m()Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/gsb0;

    .line 22
    .line 23
    invoke-direct {v1}, Ll/gsb0;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 31
    .line 32
    .line 33
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->q()Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-static {}, Ll/dg00;->H()Lrx/c$d;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    new-instance v1, Ll/hsb0;

    .line 46
    .line 47
    invoke-direct {v1}, Ll/hsb0;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 55
    .line 56
    .line 57
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->o()Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    new-instance v1, Ll/isb0;

    .line 62
    .line 63
    invoke-direct {v1}, Ll/isb0;-><init>()V

    .line 64
    .line 65
    .line 66
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 71
    .line 72
    .line 73
    const-string v0, "lch"

    .line 74
    .line 75
    const-string v1, "putong"

    .line 76
    .line 77
    invoke-static {v0, v1}, Ll/i4g0;->H(Ljava/lang/String;Ljava/lang/Object;)V

    .line 78
    .line 79
    .line 80
    sget-object v0, Ll/qzd;->a:Ll/zqe0;

    .line 81
    .line 82
    invoke-virtual {v0}, Lrx/c;->first()Lrx/c;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    new-instance v1, Ll/jsb0;

    .line 95
    .line 96
    invoke-direct {v1}, Ll/jsb0;-><init>()V

    .line 97
    .line 98
    .line 99
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 104
    .line 105
    .line 106
    invoke-static {}, Ll/nsb0;->t()V

    .line 107
    .line 108
    .line 109
    new-instance v0, Ll/ksb0;

    .line 110
    .line 111
    invoke-direct {v0}, Ll/ksb0;-><init>()V

    .line 112
    .line 113
    .line 114
    invoke-static {v0}, Ll/i4g0;->G(Ll/k4g0;)V

    .line 115
    .line 116
    .line 117
    new-instance v0, Ll/nsb0$a;

    .line 118
    .line 119
    invoke-direct {v0}, Ll/nsb0$a;-><init>()V

    .line 120
    .line 121
    .line 122
    invoke-static {v0}, Ll/i4g0;->F(Ll/l4g0$b;)V

    .line 123
    .line 124
    .line 125
    sget-object v0, Ll/nsb0;->g:Ll/wyd0;

    .line 126
    .line 127
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    check-cast v1, Ljava/lang/String;

    .line 132
    .line 133
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 134
    .line 135
    .line 136
    move-result v1

    .line 137
    if-nez v1, :cond_1

    .line 138
    .line 139
    invoke-static {}, Ll/pzi0;->o()J

    .line 140
    .line 141
    .line 142
    move-result-wide v1

    .line 143
    sget-object v3, Ll/nsb0;->f:Ll/byd0;

    .line 144
    .line 145
    invoke-virtual {v3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    move-result-object v3

    .line 149
    check-cast v3, Ljava/lang/Long;

    .line 150
    .line 151
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 152
    .line 153
    .line 154
    move-result-wide v3

    .line 155
    sub-long/2addr v1, v3

    .line 156
    const-wide/16 v3, 0x3e8

    .line 157
    .line 158
    div-long/2addr v1, v3

    .line 159
    new-instance v3, Ll/pf60;

    .line 160
    .line 161
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    check-cast v0, Ljava/lang/String;

    .line 166
    .line 167
    const-string v4, "page_id"

    .line 168
    .line 169
    invoke-direct {v3, v4, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 170
    .line 171
    .line 172
    new-instance v0, Ll/pf60;

    .line 173
    .line 174
    const-string v4, "duration"

    .line 175
    .line 176
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 177
    .line 178
    .line 179
    move-result-object v1

    .line 180
    invoke-direct {v0, v4, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 181
    .line 182
    .line 183
    new-instance v1, Ll/pf60;

    .line 184
    .line 185
    sget-object v2, Ll/nsb0;->h:Ll/wyd0;

    .line 186
    .line 187
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 188
    .line 189
    .line 190
    move-result-object v2

    .line 191
    check-cast v2, Ljava/lang/String;

    .line 192
    .line 193
    const-string v4, "mc_event_id"

    .line 194
    .line 195
    invoke-direct {v1, v4, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 196
    .line 197
    .line 198
    new-instance v2, Ll/pf60;

    .line 199
    .line 200
    sget-object v4, Ll/nsb0;->i:Ll/wyd0;

    .line 201
    .line 202
    invoke-virtual {v4}, Ll/azd0;->get()Ljava/lang/Object;

    .line 203
    .line 204
    .line 205
    move-result-object v4

    .line 206
    check-cast v4, Ljava/lang/String;

    .line 207
    .line 208
    const-string v5, "mc_event_extras"

    .line 209
    .line 210
    invoke-direct {v2, v5, v4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 211
    .line 212
    .line 213
    filled-new-array {v3, v0, v1, v2}, [Ll/pf60;

    .line 214
    .line 215
    .line 216
    move-result-object v0

    .line 217
    const-string v1, "e_killapp_page"

    .line 218
    .line 219
    const-string v2, ""

    .line 220
    .line 221
    invoke-static {v1, v2, v0}, Ll/i4g0;->B(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 222
    .line 223
    .line 224
    :cond_1
    new-instance v0, Ll/nsb0$b;

    .line 225
    .line 226
    invoke-direct {v0}, Ll/nsb0$b;-><init>()V

    .line 227
    .line 228
    .line 229
    invoke-static {v0}, Ll/ve60;->m(Ll/c2m;)V

    .line 230
    .line 231
    .line 232
    return-void
.end method

.method public static k()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Ll/nsb0;->b:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    :try_start_0
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 10
    .line 11
    invoke-static {v0}, Ll/gsp0;->getDefaultUserAgent(Landroid/content/Context;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Ll/nsb0;->b:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catch_0
    move-exception v0

    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    :goto_0
    sget-object v0, Ll/nsb0;->b:Ljava/lang/String;

    .line 23
    .line 24
    return-object v0
.end method

.method public static l()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Ll/ve60;->d()Ll/ue60;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/ue60;->c()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    return-object v0

    .line 12
    :cond_0
    const-string v0, ""

    .line 13
    .line 14
    return-object v0
.end method

.method public static m()Ll/vxd0;
    .locals 1

    .line 1
    sget-object v0, Ll/nsb0;->e:Ll/vxd0;

    .line 2
    .line 3
    return-object v0
.end method

.method public static n()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Ll/ve60;->g()Ll/ue60;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/ue60;->c()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    return-object v0

    .line 12
    :cond_0
    const-string v0, ""

    .line 13
    .line 14
    return-object v0
.end method

.method public static o()Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "2.0.0"

    .line 2
    .line 3
    return-object v0
.end method

.method public static p()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/App;->i:Ll/vxd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x1

    .line 14
    if-ne v0, v1, :cond_0

    .line 15
    .line 16
    invoke-static {}, Ll/nsb0;->r()V

    .line 17
    .line 18
    .line 19
    :cond_0
    invoke-static {}, Ll/sw0;->c()Ll/sw0;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/nsb0$c;

    .line 24
    .line 25
    invoke-direct {v1}, Ll/nsb0$c;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ll/sw0;->b(Ll/sw0$c;)V

    .line 29
    .line 30
    .line 31
    const-wide/16 v0, 0x1e

    .line 32
    .line 33
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 34
    .line 35
    invoke-static {v0, v1, v2}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v1, Ll/nsb0$d;

    .line 40
    .line 41
    invoke-direct {v1}, Ll/nsb0$d;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public static q(Landroid/content/Intent;)V
    .locals 6

    .line 1
    const-string v0, "\u8fde\u63a5\u5931\u8d25\uff0c\u8bf7\u91cd\u8bd5"

    .line 2
    .line 3
    if-eqz p0, :cond_6

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    goto/16 :goto_2

    .line 12
    .line 13
    :cond_0
    invoke-virtual {p0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string v1, "result_type"

    .line 18
    .line 19
    invoke-virtual {p0, v1}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    const/4 v2, 0x1

    .line 24
    if-ne v1, v2, :cond_1

    .line 25
    .line 26
    const-string v1, "result_string"

    .line 27
    .line 28
    invoke-virtual {p0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    goto :goto_0

    .line 33
    :cond_1
    const-string p0, ""

    .line 34
    .line 35
    :goto_0
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_2

    .line 40
    .line 41
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_2
    const-string v1, ":"

    .line 46
    .line 47
    invoke-virtual {p0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    array-length v1, p0

    .line 52
    const/4 v3, 0x2

    .line 53
    if-eq v1, v3, :cond_3

    .line 54
    .line 55
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_3
    :try_start_0
    const-string v1, "qr_for_txtstatics"

    .line 60
    .line 61
    const/4 v3, 0x0

    .line 62
    aget-object v4, p0, v3

    .line 63
    .line 64
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 68
    const-string v4, "&sessionId="

    .line 69
    .line 70
    const-string v5, "https://ttdp.p1staff.com/api/v1/verify-tool/sessions/register?deviceId="

    .line 71
    .line 72
    if-eqz v1, :cond_4

    .line 73
    .line 74
    :try_start_1
    new-instance v0, Ljava/net/URL;

    .line 75
    .line 76
    new-instance v1, Ljava/lang/StringBuilder;

    .line 77
    .line 78
    invoke-direct {v1, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    sget-object v3, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 82
    .line 83
    invoke-static {v3}, Ll/tvv;->a(Landroid/content/Context;)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v3

    .line 87
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    aget-object p0, p0, v2

    .line 94
    .line 95
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-direct {v0, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    goto :goto_1

    .line 106
    :cond_4
    const-string v1, "qr_for_statics_v1"

    .line 107
    .line 108
    aget-object v3, p0, v3

    .line 109
    .line 110
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    move-result v1

    .line 114
    if-eqz v1, :cond_5

    .line 115
    .line 116
    new-instance v0, Ljava/net/URL;

    .line 117
    .line 118
    new-instance v1, Ljava/lang/StringBuilder;

    .line 119
    .line 120
    invoke-direct {v1, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    invoke-static {}, Ll/qzd;->a()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v3

    .line 127
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    aget-object p0, p0, v2

    .line 134
    .line 135
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    const-string p0, "&entranceType=HISTORY_ENTRANCE"

    .line 139
    .line 140
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    invoke-direct {v0, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    :goto_1
    sget-object p0, Ll/uqb0;->D:Ll/rg50;

    .line 151
    .line 152
    sget-object v1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 153
    .line 154
    invoke-virtual {v1}, Lcom/p1/mobile/putong/api/api/Network;->basic()Ll/x1d0$a;

    .line 155
    .line 156
    .line 157
    move-result-object v1

    .line 158
    invoke-virtual {v1, v0}, Ll/x1d0$a;->r(Ljava/net/URL;)Ll/x1d0$a;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    invoke-virtual {v0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    invoke-virtual {p0, v0}, Ll/rg50;->a(Ll/x1d0;)Ll/ry3;

    .line 167
    .line 168
    .line 169
    move-result-object p0

    .line 170
    new-instance v0, Ll/nsb0$e;

    .line 171
    .line 172
    invoke-direct {v0}, Ll/nsb0$e;-><init>()V

    .line 173
    .line 174
    .line 175
    invoke-interface {p0, v0}, Ll/ry3;->h(Ll/w84;)V

    .line 176
    .line 177
    .line 178
    return-void

    .line 179
    :cond_5
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 180
    .line 181
    .line 182
    return-void

    .line 183
    :catch_0
    move-exception p0

    .line 184
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 185
    .line 186
    .line 187
    return-void

    .line 188
    :cond_6
    :goto_2
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 189
    .line 190
    .line 191
    return-void
.end method

.method public static r()V
    .locals 1

    .line 1
    new-instance v0, Ll/lsb0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/lsb0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static s(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "ab"

    .line 2
    .line 3
    invoke-static {v0, p0}, Ll/i4g0;->H(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static t()V
    .locals 1

    .line 1
    new-instance v0, Ll/msb0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/msb0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static u()V
    .locals 3

    .line 1
    invoke-static {}, Ll/nsb0;->o()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    :try_start_0
    sget-object v1, Ll/nsb0;->c:Lorg/json/JSONObject;

    .line 6
    .line 7
    const-string v2, "ui_version"

    .line 8
    .line 9
    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catch_0
    move-exception v0

    .line 14
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 15
    .line 16
    .line 17
    :goto_0
    const-string v0, "sysext"

    .line 18
    .line 19
    sget-object v1, Ll/nsb0;->c:Lorg/json/JSONObject;

    .line 20
    .line 21
    invoke-static {v0, v1}, Ll/i4g0;->H(Ljava/lang/String;Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static v(Ljava/lang/String;I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 5
    .line 6
    .line 7
    const-string v1, "uid"

    .line 8
    .line 9
    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    const-string p0, "lgtp"

    .line 13
    .line 14
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {v0, p0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    invoke-static {v0}, Ll/i4g0;->I(Ljava/util/HashMap;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static w(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    new-instance v0, Ljava/util/HashMap;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v1, "uid"

    .line 13
    .line 14
    iget-object v2, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 20
    .line 21
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    const-string v2, "lgtp"

    .line 38
    .line 39
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    sget-object v1, Ll/nsb0;->e:Ll/vxd0;

    .line 43
    .line 44
    iget-object v2, p0, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 45
    .line 46
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-virtual {v1, v2}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 58
    .line 59
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    const-string v1, "lgtp_str"

    .line 64
    .line 65
    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    :cond_0
    invoke-static {v0}, Ll/i4g0;->I(Ljava/util/HashMap;)V

    .line 69
    .line 70
    .line 71
    :cond_1
    return-void
.end method

.method public static x()V
    .locals 3

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "uid"

    .line 7
    .line 8
    const-string v2, ""

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    const/4 v1, -0x1

    .line 14
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    const-string v2, "lgtp"

    .line 19
    .line 20
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    sget-object v2, Ll/nsb0;->e:Ll/vxd0;

    .line 24
    .line 25
    invoke-virtual {v2, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    invoke-static {v0}, Ll/i4g0;->I(Ljava/util/HashMap;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method
