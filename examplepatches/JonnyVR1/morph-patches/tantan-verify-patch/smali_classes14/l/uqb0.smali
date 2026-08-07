.class public Ll/uqb0;
.super Lcom/p1/mobile/android/app/App;
.source "SourceFile"


# static fields
.field public static A:Z = false

.field public static A0:Lrx/subjects/a; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/pf60<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation
.end field

.field public static B:Ll/jxd0; = null

.field public static B0:Ll/bbm; = null

.field public static C:Ll/rg50$b; = null

.field public static C0:Z = false

.field public static D:Ll/rg50; = null

.field public static D0:Ljava/lang/String; = null

.field public static E:Lcom/p1/mobile/putong/location/a; = null

.field public static E0:Ll/jxd0; = null

.field public static F:Ll/uc80; = null

.field public static final F0:Ll/og3;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/og3<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static G:Ll/fsb0; = null

.field public static final G0:[Z

.field public static H:Lcom/p1/mobile/putong/api/api/Network; = null

.field public static I:Ll/xi5; = null

.field public static J:Ll/ja5; = null

.field public static K:Ll/hfj0; = null

.field public static L:Lcom/p1/mobile/putong/api/api/AccountTempApi; = null

.field public static M:Ll/yb5; = null

.field public static N:Lcom/p1/mobile/putong/api/api/OtherApi; = null

.field public static O:Ll/tl8; = null

.field public static P:Ll/xk9; = null

.field public static Q:Ll/l2; = null

.field public static R:Ll/s5m; = null

.field public static S:Ll/a70; = null

.field public static T:Lcom/p1/mobile/putong/api/api/PaymentApi; = null

.field public static U:Ll/w1w; = null

.field public static V:Ll/mk5; = null

.field public static W:Ll/dk50; = null

.field public static X:Ll/hj5; = null

.field public static Y:Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi; = null

.field public static Z:Ll/a4j; = null

.field public static a0:Lcom/p1/mobile/putong/api/api/FacebookApi; = null

.field public static b0:Ll/sre0; = null

.field public static c0:Ll/bn5; = null

.field public static volatile d0:Ljava/io/File; = null

.field public static final e0:Ljava/lang/Integer;

.field public static f0:I = 0x0

.field public static g0:J = 0x0L

.field public static h0:Lcom/p1/mobile/putong/data/LiveRegionTag; = null

.field public static i0:Ll/z1f; = null

.field public static j0:Ll/dg00; = null

.field public static k0:Ll/vj5; = null

.field public static final l0:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public static m0:Ll/jxd0; = null

.field public static n0:Z = false

.field public static o0:Z = false

.field public static p0:Ll/d07; = null

.field public static q0:Lrx/subjects/a; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field public static r0:Lrx/subjects/a; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field public static s:Ljava/lang/String; = "7.3.3"

.field public static s0:Lrx/subjects/a; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public static t:I = 0x38f608

.field public static t0:Z = false

.field public static u:Z = true

.field public static u0:Z = false

.field public static v:Z = true

.field public static v0:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public static w:Ll/byd0;

.field public static final w0:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static x:Ll/wyd0;

.field public static x0:J

.field public static y:Ll/vxd0;

.field public static y0:Ljava/lang/String;

.field public static z:Ll/wyd0;

.field public static z0:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public r:Ll/rg50;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    new-instance v0, Ll/byd0;

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "app_install_time"

    .line 10
    .line 11
    invoke-direct {v0, v2, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 12
    .line 13
    .line 14
    sput-object v0, Ll/uqb0;->w:Ll/byd0;

    .line 15
    .line 16
    new-instance v0, Ll/wyd0;

    .line 17
    .line 18
    const-string v1, "debug_version_"

    .line 19
    .line 20
    const-string v2, "7.3.3"

    .line 21
    .line 22
    const/4 v3, 0x0

    .line 23
    invoke-direct {v0, v1, v2, v3}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 24
    .line 25
    .line 26
    sput-object v0, Ll/uqb0;->x:Ll/wyd0;

    .line 27
    .line 28
    new-instance v0, Ll/vxd0;

    .line 29
    .line 30
    const-string v1, "debug_plugin_version"

    .line 31
    .line 32
    const/4 v2, -0x1

    .line 33
    invoke-direct {v0, v1, v2, v3}, Ll/vxd0;-><init>(Ljava/lang/String;IZ)V

    .line 34
    .line 35
    .line 36
    sput-object v0, Ll/uqb0;->y:Ll/vxd0;

    .line 37
    .line 38
    new-instance v0, Ll/wyd0;

    .line 39
    .line 40
    const-string v1, "debug_x_tantan_dev_env"

    .line 41
    .line 42
    const-string v2, ""

    .line 43
    .line 44
    invoke-direct {v0, v1, v2, v3}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 45
    .line 46
    .line 47
    sput-object v0, Ll/uqb0;->z:Ll/wyd0;

    .line 48
    .line 49
    new-instance v0, Ll/jxd0;

    .line 50
    .line 51
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 52
    .line 53
    const-string v4, "has_show_privacy_policy_dlg"

    .line 54
    .line 55
    invoke-direct {v0, v4, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 56
    .line 57
    .line 58
    sput-object v0, Ll/uqb0;->B:Ll/jxd0;

    .line 59
    .line 60
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    sput-object v0, Ll/uqb0;->e0:Ljava/lang/Integer;

    .line 65
    .line 66
    const-string v0, "unknown_"

    .line 67
    .line 68
    invoke-static {v0}, Lcom/p1/mobile/putong/data/LiveRegionTag;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LiveRegionTag;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    sput-object v0, Ll/uqb0;->h0:Lcom/p1/mobile/putong/data/LiveRegionTag;

    .line 73
    .line 74
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    sput-object v0, Ll/uqb0;->l0:Lrx/subjects/a;

    .line 79
    .line 80
    new-instance v0, Ll/jxd0;

    .line 81
    .line 82
    const-string v4, "has_pre_load_when_sign_in"

    .line 83
    .line 84
    invoke-direct {v0, v4, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 85
    .line 86
    .line 87
    sput-object v0, Ll/uqb0;->m0:Ll/jxd0;

    .line 88
    .line 89
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    sput-object v0, Ll/uqb0;->q0:Lrx/subjects/a;

    .line 94
    .line 95
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    sput-object v0, Ll/uqb0;->r0:Lrx/subjects/a;

    .line 100
    .line 101
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    sput-object v0, Ll/uqb0;->s0:Lrx/subjects/a;

    .line 106
    .line 107
    sput-boolean v3, Ll/uqb0;->t0:Z

    .line 108
    .line 109
    sput-boolean v3, Ll/uqb0;->u0:Z

    .line 110
    .line 111
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    sput-object v0, Ll/uqb0;->v0:Lrx/subjects/a;

    .line 116
    .line 117
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    sput-object v0, Ll/uqb0;->w0:Lrx/subjects/a;

    .line 122
    .line 123
    const-wide/16 v4, -0x1

    .line 124
    .line 125
    sput-wide v4, Ll/uqb0;->x0:J

    .line 126
    .line 127
    sput-object v2, Ll/uqb0;->y0:Ljava/lang/String;

    .line 128
    .line 129
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    sput-object v0, Ll/uqb0;->z0:Lrx/subjects/a;

    .line 134
    .line 135
    invoke-static {v1, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-static {v0}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    sput-object v0, Ll/uqb0;->A0:Lrx/subjects/a;

    .line 144
    .line 145
    const/4 v0, 0x0

    .line 146
    sput-object v0, Ll/uqb0;->B0:Ll/bbm;

    .line 147
    .line 148
    sput-boolean v3, Ll/uqb0;->C0:Z

    .line 149
    .line 150
    sput-object v2, Ll/uqb0;->D0:Ljava/lang/String;

    .line 151
    .line 152
    new-instance v0, Ll/jxd0;

    .line 153
    .line 154
    const-string v2, "android_network_metrics"

    .line 155
    .line 156
    invoke-direct {v0, v2, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 157
    .line 158
    .line 159
    sput-object v0, Ll/uqb0;->E0:Ll/jxd0;

    .line 160
    .line 161
    new-instance v0, Ll/og3$d;

    .line 162
    .line 163
    const/16 v1, 0x1f4

    .line 164
    .line 165
    invoke-direct {v0, v3, v1}, Ll/og3$d;-><init>(II)V

    .line 166
    .line 167
    .line 168
    sput-object v0, Ll/uqb0;->F0:Ll/og3;

    .line 169
    .line 170
    const/4 v0, 0x1

    .line 171
    new-array v0, v0, [Z

    .line 172
    .line 173
    aput-boolean v3, v0, v3

    .line 174
    .line 175
    sput-object v0, Ll/uqb0;->G0:[Z

    .line 176
    .line 177
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/android/app/App;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic A(Ll/uxj0;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-boolean v0, Ll/uqb0;->A:Z

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ll/pk50;->p(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic B(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic C(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static C0()V
    .locals 2

    .line 1
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/pk50;->b()V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->q()Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Lrx/c;->first()Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/xpb0;

    .line 17
    .line 18
    invoke-direct {v1}, Ll/xpb0;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static synthetic D()Ljava/lang/String;
    .locals 1

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
    return-object v0
.end method

.method public static D0()V
    .locals 1

    .line 1
    sget-boolean v0, Ll/uqb0;->o0:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Ll/ypb0;

    .line 7
    .line 8
    invoke-direct {v0}, Ll/ypb0;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-static {v0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    sput-boolean v0, Ll/uqb0;->o0:Z

    .line 16
    .line 17
    return-void
.end method

.method public static synthetic E()V
    .locals 0

    .line 1
    invoke-static {}, Ll/fu2;->j()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static E0()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->Y()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/npb0;

    .line 6
    .line 7
    invoke-direct {v1}, Ll/npb0;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/ppb0;

    .line 15
    .line 16
    invoke-direct {v1}, Ll/ppb0;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static synthetic F(Z)Ll/x1d0;
    .locals 4

    .line 1
    new-instance v0, Lcom/google/gson/JsonObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/gson/JsonObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "clientId"

    .line 7
    .line 8
    const-string v2, "100032"

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Lcom/google/gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const-string v1, "device"

    .line 14
    .line 15
    new-instance v2, Lcom/google/gson/JsonParser;

    .line 16
    .line 17
    invoke-direct {v2}, Lcom/google/gson/JsonParser;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Ll/tl8;->M()Lcom/p1/mobile/putong/data/Device;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Device;->toJson()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    invoke-virtual {v2, v3}, Lcom/google/gson/JsonParser;->parse(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-virtual {v2}, Lcom/google/gson/JsonElement;->getAsJsonObject()Lcom/google/gson/JsonObject;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-virtual {v0, v1, v2}, Lcom/google/gson/JsonObject;->add(Ljava/lang/String;Lcom/google/gson/JsonElement;)V

    .line 37
    .line 38
    .line 39
    const-string v1, "type"

    .line 40
    .line 41
    if-eqz p0, :cond_0

    .line 42
    .line 43
    const-string p0, "switch-account"

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    const-string p0, "default"

    .line 47
    .line 48
    :goto_0
    invoke-virtual {v0, v1, p0}, Lcom/google/gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 49
    .line 50
    .line 51
    :catch_0
    sget-object p0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    const-string v1, "/signout"

    .line 58
    .line 59
    invoke-static {v1}, Ll/xi5;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {p0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    sget-object v1, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 68
    .line 69
    invoke-virtual {v0}, Lcom/google/gson/JsonElement;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-static {v1, v0}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {p0, v0}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    return-object p0
.end method

.method public static synthetic G()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/app/TantanApp;->c:Ll/cmb0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/cmb0;->Y()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/dqb0;

    .line 8
    .line 9
    invoke-direct {v1}, Ll/dqb0;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {}, Ll/psd0;->N()Lrx/c$d;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Lrx/c;->subscribe()Ll/kcg0;

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static G0()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->Y()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/vpb0;

    .line 6
    .line 7
    invoke-direct {v1}, Ll/vpb0;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/wpb0;

    .line 15
    .line 16
    invoke-direct {v1}, Ll/wpb0;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static synthetic H(Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "hook_sp_wait_apply"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->s(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    :try_start_0
    new-instance p0, Lcom/tantanapp/beatles/safety/spwaitfix/a;

    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 16
    .line 17
    invoke-direct {p0, v0}, Lcom/tantanapp/beatles/safety/spwaitfix/a;-><init>(Landroid/content/Context;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/tantanapp/beatles/safety/spwaitfix/a;->a()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :catchall_0
    move-exception p0

    .line 25
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    :cond_0
    :goto_0
    new-instance p0, Ll/lqb0;

    .line 32
    .line 33
    invoke-direct {p0}, Ll/lqb0;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-static {p0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public static synthetic I(Ll/uxj0;)V
    .locals 0

    .line 1
    sget-object p0, Ll/uqb0;->j0:Ll/dg00;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/dg00;->p()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic J()V
    .locals 3

    .line 1
    sget-object v0, Ll/k9i0;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ljava/lang/String;

    .line 18
    .line 19
    sget-object v2, Ll/uqb0;->j0:Ll/dg00;

    .line 20
    .line 21
    invoke-virtual {v2, v1}, Ll/dg00;->t(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void
.end method

.method public static J0()Z
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    sget-object v0, Ll/uqb0;->j0:Ll/dg00;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Ll/dg00;->b:Lrx/subjects/a;

    .line 6
    .line 7
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    return v0

    .line 15
    :cond_0
    const/4 v0, 0x0

    .line 16
    return v0
.end method

.method public static synthetic K(Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;->USER:Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, "android_sign_out_keep_db"

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->s(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    sput-boolean p0, Ll/uqb0;->C0:Z

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static synthetic L(Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;->USER:Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic M(Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    sget-object p0, Ll/uqb0;->j0:Ll/dg00;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/dg00;->D()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static M0(Z)V
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->I:Ll/xi5;

    .line 2
    .line 3
    new-instance v1, Ll/sqb0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/sqb0;-><init>(Z)V

    .line 6
    .line 7
    .line 8
    invoke-static {v1}, Ll/qi20;->a(Ll/pcj;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {v0, p0}, Lcom/tantanapp/common/network/RunnerProxy;->now(Lrx/c;)Lrx/c;

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic N(Ll/uxj0;)Lrx/c;
    .locals 1

    .line 1
    sget-object p0, Ll/uqb0;->O:Ll/tl8;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/app/TantanApp;->c:Ll/cmb0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/cmb0;->y()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/tl8;->Q(Ljava/util/List;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Lrx/c;->materialize()Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const/4 v0, 0x1

    .line 26
    invoke-virtual {p0, v0}, Lrx/c;->take(I)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public static synthetic O()V
    .locals 5

    .line 1
    const-string v0, "https://client-tracking.tantanapp.com/?deviceToken="

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :try_start_0
    sget-object v2, Ll/uqb0;->D:Ll/rg50;

    .line 5
    .line 6
    sget-object v3, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 7
    .line 8
    invoke-virtual {v3}, Lcom/p1/mobile/putong/api/api/Network;->basic()Ll/x1d0$a;

    .line 9
    .line 10
    .line 11
    move-result-object v3

    .line 12
    new-instance v4, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Ll/qzd;->a()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string v0, "&channel="

    .line 25
    .line 26
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    sget-object v0, Ll/ls4;->a:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v3, v0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Ll/x1d0$a;->g()Ll/x1d0$a;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v2, v0}, Ll/rg50;->a(Ll/x1d0;)Ll/ry3;

    .line 51
    .line 52
    .line 53
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 54
    :try_start_1
    invoke-interface {v0}, Ll/ry3;->execute()Ll/i5d0;

    .line 55
    .line 56
    .line 57
    move-result-object v1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 58
    goto :goto_0

    .line 59
    :catchall_0
    move-exception v0

    .line 60
    goto :goto_2

    .line 61
    :catch_0
    :goto_0
    invoke-static {v1}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 62
    .line 63
    .line 64
    goto :goto_1

    .line 65
    :catch_1
    move-exception v0

    .line 66
    :try_start_2
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :goto_1
    return-void

    .line 71
    :goto_2
    invoke-static {v1}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 72
    .line 73
    .line 74
    throw v0
.end method

.method public static O0(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    invoke-static {p0}, Ll/nsb0;->w(Lcom/p1/mobile/putong/data/User;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->a0()V

    .line 5
    .line 6
    .line 7
    sget-object p0, Ll/uqb0;->m0:Ll/jxd0;

    .line 8
    .line 9
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    invoke-static {}, Ll/uqb0;->c1()V

    .line 15
    .line 16
    .line 17
    sget-object p0, Ll/qzd;->a:Ll/zqe0;

    .line 18
    .line 19
    invoke-virtual {p0}, Lrx/c;->first()Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p0, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    new-instance v0, Ll/qpb0;

    .line 32
    .line 33
    invoke-direct {v0}, Ll/qpb0;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 41
    .line 42
    .line 43
    sget-object p0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->OmsParse:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 44
    .line 45
    filled-new-array {p0}, [Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-static {v0}, Ll/uqi;->f([Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 50
    .line 51
    .line 52
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v0}, Ll/pk50;->a()V

    .line 57
    .line 58
    .line 59
    invoke-static {p0}, Ll/uqi;->d(Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public static synthetic P(Ljava/lang/Object;)V
    .locals 0

    .line 1
    sget-object p0, Ll/uqb0;->c0:Ll/bn5;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/bn5;->signedIn_()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ll/uqb0;->V0()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public static synthetic Q(Ljava/lang/Boolean;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic R(Lrx/Notification;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lrx/Notification;->i()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/uqb0;->q0()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static R0()V
    .locals 1

    .line 1
    new-instance v0, Ll/cqb0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/cqb0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic S(Ljava/lang/Class;Lcom/p1/mobile/putong/data/SignOutParams;)Ll/uxj0;
    .locals 6

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->d0()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/o560;->b()Ll/o560;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/o560;->a()V

    .line 9
    .line 10
    .line 11
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_9

    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->globalLifeCycle_()Ljava/util/HashMap;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const/4 v1, 0x0

    .line 30
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    const/4 v3, 0x1

    .line 35
    if-eqz v2, :cond_2

    .line 36
    .line 37
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    check-cast v2, Ljava/util/List;

    .line 42
    .line 43
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    :cond_1
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    if-eqz v4, :cond_0

    .line 52
    .line 53
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    check-cast v4, Lcom/p1/mobile/android/app/Act$r;

    .line 58
    .line 59
    iget-object v4, v4, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 60
    .line 61
    invoke-virtual {v4}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    check-cast v4, Landroid/app/Activity;

    .line 66
    .line 67
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v5

    .line 71
    if-eqz v5, :cond_1

    .line 72
    .line 73
    instance-of v5, v4, Lcom/p1/mobile/android/app/Act;

    .line 74
    .line 75
    if-eqz v5, :cond_1

    .line 76
    .line 77
    sget-object v5, Ll/uqb0;->c0:Ll/bn5;

    .line 78
    .line 79
    invoke-interface {v5}, Ll/bn5;->getSignOutJumpAct()Ljava/lang/Class;

    .line 80
    .line 81
    .line 82
    move-result-object v5

    .line 83
    invoke-virtual {v5, v4}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result v4

    .line 87
    if-eqz v4, :cond_1

    .line 88
    .line 89
    move v1, v3

    .line 90
    goto :goto_0

    .line 91
    :cond_2
    if-nez v1, :cond_4

    .line 92
    .line 93
    new-instance v0, Landroid/content/Intent;

    .line 94
    .line 95
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 96
    .line 97
    invoke-direct {v0, v1, p0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 98
    .line 99
    .line 100
    const p0, 0x10008000

    .line 101
    .line 102
    .line 103
    invoke-virtual {v0, p0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 104
    .line 105
    .line 106
    const-string p0, "show_update_dialog"

    .line 107
    .line 108
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/SignOutParams;->isShowUpdateDialog()Z

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 113
    .line 114
    .line 115
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/SignOutParams;->isLogOutAb()Z

    .line 116
    .line 117
    .line 118
    move-result p0

    .line 119
    if-eqz p0, :cond_3

    .line 120
    .line 121
    const-string p0, "delete_account_popup"

    .line 122
    .line 123
    invoke-virtual {v0, p0, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 124
    .line 125
    .line 126
    :cond_3
    const-string p0, "isFromSignOut"

    .line 127
    .line 128
    invoke-virtual {v0, p0, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 129
    .line 130
    .line 131
    const-string p0, "is_clear_task"

    .line 132
    .line 133
    invoke-virtual {v0, p0, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 134
    .line 135
    .line 136
    const-string p0, "inactive_type"

    .line 137
    .line 138
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/SignOutParams;->getInactiveType()Lcom/p1/mobile/putong/api/api/AccountTempApi$InactiveType;

    .line 139
    .line 140
    .line 141
    move-result-object v1

    .line 142
    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 143
    .line 144
    .line 145
    const-string p0, "hasContract"

    .line 146
    .line 147
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/SignOutParams;->isHasContract()Z

    .line 148
    .line 149
    .line 150
    move-result v1

    .line 151
    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 152
    .line 153
    .line 154
    const-string p0, "inactive_category"

    .line 155
    .line 156
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/SignOutParams;->getInactiveCategory()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 161
    .line 162
    .line 163
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 164
    .line 165
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 166
    .line 167
    .line 168
    :cond_4
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->globalLifeCycle_()Ljava/util/HashMap;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    new-instance p1, Ljava/util/ArrayList;

    .line 173
    .line 174
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 175
    .line 176
    .line 177
    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 178
    .line 179
    .line 180
    move-result-object p0

    .line 181
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 182
    .line 183
    .line 184
    move-result-object p0

    .line 185
    :cond_5
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    if-eqz v0, :cond_7

    .line 190
    .line 191
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    check-cast v0, Ljava/util/List;

    .line 196
    .line 197
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    :cond_6
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 202
    .line 203
    .line 204
    move-result v1

    .line 205
    if-eqz v1, :cond_5

    .line 206
    .line 207
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 208
    .line 209
    .line 210
    move-result-object v1

    .line 211
    check-cast v1, Lcom/p1/mobile/android/app/Act$r;

    .line 212
    .line 213
    iget-object v1, v1, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 214
    .line 215
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 216
    .line 217
    .line 218
    move-result-object v1

    .line 219
    check-cast v1, Landroid/app/Activity;

    .line 220
    .line 221
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 222
    .line 223
    .line 224
    move-result v2

    .line 225
    if-eqz v2, :cond_6

    .line 226
    .line 227
    instance-of v2, v1, Lcom/p1/mobile/android/app/Act;

    .line 228
    .line 229
    if-eqz v2, :cond_6

    .line 230
    .line 231
    sget-object v2, Ll/uqb0;->c0:Ll/bn5;

    .line 232
    .line 233
    invoke-interface {v2}, Ll/bn5;->getSignOutJumpAct()Ljava/lang/Class;

    .line 234
    .line 235
    .line 236
    move-result-object v2

    .line 237
    invoke-virtual {v2, v1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    .line 238
    .line 239
    .line 240
    move-result v2

    .line 241
    if-nez v2, :cond_6

    .line 242
    .line 243
    move-object v2, v1

    .line 244
    check-cast v2, Lcom/p1/mobile/android/app/Act;

    .line 245
    .line 246
    invoke-virtual {v2}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 247
    .line 248
    .line 249
    move-result-object v2

    .line 250
    new-instance v3, Ll/gqb0;

    .line 251
    .line 252
    invoke-direct {v3}, Ll/gqb0;-><init>()V

    .line 253
    .line 254
    .line 255
    invoke-virtual {v2, v3}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 256
    .line 257
    .line 258
    move-result-object v2

    .line 259
    const-wide/16 v3, 0xa

    .line 260
    .line 261
    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 262
    .line 263
    invoke-virtual {v2, v3, v4, v5}, Lrx/c;->timeout(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 264
    .line 265
    .line 266
    move-result-object v2

    .line 267
    invoke-virtual {v2}, Lrx/c;->materialize()Lrx/c;

    .line 268
    .line 269
    .line 270
    move-result-object v2

    .line 271
    new-instance v3, Ll/hqb0;

    .line 272
    .line 273
    invoke-direct {v3, v1}, Ll/hqb0;-><init>(Landroid/app/Activity;)V

    .line 274
    .line 275
    .line 276
    invoke-virtual {v2, v3}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 277
    .line 278
    .line 279
    move-result-object v1

    .line 280
    invoke-virtual {v1}, Lrx/c;->first()Lrx/c;

    .line 281
    .line 282
    .line 283
    move-result-object v1

    .line 284
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 285
    .line 286
    .line 287
    goto :goto_1

    .line 288
    :cond_7
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 289
    .line 290
    .line 291
    move-result p0

    .line 292
    if-lez p0, :cond_8

    .line 293
    .line 294
    new-instance p0, Ll/iqb0;

    .line 295
    .line 296
    invoke-direct {p0}, Ll/iqb0;-><init>()V

    .line 297
    .line 298
    .line 299
    invoke-static {p1, p0}, Ll/psd0;->p(Ljava/util/List;Ll/zcj;)Lrx/c;

    .line 300
    .line 301
    .line 302
    move-result-object p0

    .line 303
    invoke-virtual {p0}, Lrx/c;->materialize()Lrx/c;

    .line 304
    .line 305
    .line 306
    move-result-object p0

    .line 307
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 308
    .line 309
    .line 310
    move-result-object p1

    .line 311
    invoke-virtual {p0, p1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 312
    .line 313
    .line 314
    move-result-object p0

    .line 315
    new-instance p1, Ll/jqb0;

    .line 316
    .line 317
    invoke-direct {p1}, Ll/jqb0;-><init>()V

    .line 318
    .line 319
    .line 320
    invoke-static {p1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 321
    .line 322
    .line 323
    move-result-object p1

    .line 324
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 325
    .line 326
    .line 327
    goto :goto_2

    .line 328
    :cond_8
    invoke-static {}, Ll/uqb0;->q0()V

    .line 329
    .line 330
    .line 331
    goto :goto_2

    .line 332
    :cond_9
    invoke-static {}, Ll/uqb0;->q0()V

    .line 333
    .line 334
    .line 335
    :goto_2
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 336
    .line 337
    return-object p0
.end method

.method public static S0(Ljava/lang/String;)V
    .locals 3
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->l()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/uqb0;->p0()V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Lcom/tantanapp/media/proxy/api/a;->p()Lcom/tantanapp/media/proxy/api/a;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    sget-wide v1, Lcom/tantanapp/media/proxy/api/a;->l:J

    .line 19
    .line 20
    invoke-virtual {v0, p0, v1, v2}, Lcom/tantanapp/media/proxy/api/a;->w(Landroid/net/Uri;J)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public static synthetic T(Ll/zw0;)V
    .locals 2

    .line 1
    :try_start_0
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/zw0;->g()Landroid/net/Uri;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/zw0;->g()Landroid/net/Uri;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string v0, "liveId"

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_0

    .line 32
    .line 33
    const-string v1, "/square"

    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-eqz p0, :cond_1

    .line 44
    .line 45
    :cond_0
    sget-object p0, Ll/wtd;->a:Ll/wyd0;

    .line 46
    .line 47
    invoke-virtual {p0, v0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    sget-object p0, Ll/wtd;->b:Ll/jxd0;

    .line 51
    .line 52
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 53
    .line 54
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 55
    .line 56
    .line 57
    :cond_1
    return-void

    .line 58
    :catch_0
    move-exception p0

    .line 59
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public static T0(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->l()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/uqb0;->p0()V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Lcom/tantanapp/media/proxy/api/a;->p()Lcom/tantanapp/media/proxy/api/a;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0, p0}, Lcom/tantanapp/media/proxy/api/a;->x(Ljava/util/List;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static synthetic U(ZLl/uxj0;)Lrx/c;
    .locals 2

    .line 1
    sget-object p1, Ll/uqb0;->L:Lcom/p1/mobile/putong/api/api/AccountTempApi;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/api/api/AccountTempApi;->a:Ll/kxd0;

    .line 4
    .line 5
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Ll/kxd0;->h(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    const/4 p1, 0x1

    .line 11
    invoke-static {p1, p1}, Ll/uqb0;->e0(ZZ)V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Ll/uqb0;->V0()V

    .line 15
    .line 16
    .line 17
    sget-object p1, Ll/uqb0;->c0:Ll/bn5;

    .line 18
    .line 19
    invoke-interface {p1}, Ll/bn5;->me_()Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    sget-object v1, Ll/uqb0;->N:Lcom/p1/mobile/putong/api/api/OtherApi;

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/p1/mobile/putong/api/api/OtherApi;->tryMarkAsDAU()V

    .line 26
    .line 27
    .line 28
    invoke-static {p1}, Ll/nsb0;->w(Lcom/p1/mobile/putong/data/User;)V

    .line 29
    .line 30
    .line 31
    invoke-static {}, Ll/uqb0;->c1()V

    .line 32
    .line 33
    .line 34
    sget-object v1, Ll/uqb0;->m0:Ll/jxd0;

    .line 35
    .line 36
    invoke-virtual {v1, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Ll/pk50;->a()V

    .line 44
    .line 45
    .line 46
    if-eqz p0, :cond_0

    .line 47
    .line 48
    iget-object p0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 49
    .line 50
    invoke-static {p0}, Ll/wiw;->n(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    iget-object p0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 55
    .line 56
    invoke-static {p0}, Ll/wiw;->k(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    :goto_0
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 60
    .line 61
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    return-object p0
.end method

.method public static U0(Ljava/lang/String;)V
    .locals 3
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-static {}, Ll/uqb0;->p0()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/tantanapp/media/proxy/api/a;->p()Lcom/tantanapp/media/proxy/api/a;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    sget-wide v1, Lcom/tantanapp/media/proxy/api/a;->l:J

    .line 13
    .line 14
    invoke-virtual {v0, p0, v1, v2}, Lcom/tantanapp/media/proxy/api/a;->w(Landroid/net/Uri;J)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic V(Ll/uqb0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/uqb0;->L0()V

    return-void
.end method

.method public static V0()V
    .locals 1

    .line 1
    new-instance v0, Ll/rpb0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/rpb0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic W()V
    .locals 0

    .line 1
    invoke-static {}, Ll/uqb0;->R0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic X(ZLjava/lang/Class;ZZLl/uxj0;)Lrx/c;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    new-instance p0, Ll/gpb0;

    .line 4
    .line 5
    invoke-direct {p0, p1, p2, p3}, Ll/gpb0;-><init>(Ljava/lang/Class;ZZ)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0}, Ll/uqb0;->m0(Ll/pcj;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0

    .line 13
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/api/api/AccountTempApi$InactiveType;->None:Lcom/p1/mobile/putong/api/api/AccountTempApi$InactiveType;

    .line 14
    .line 15
    invoke-static {p1, p2, p0, p3}, Ll/uqb0;->b1(Ljava/lang/Class;ZLcom/p1/mobile/putong/api/api/AccountTempApi$InactiveType;Z)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static X0(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 2
    .line 3
    invoke-static {v0}, Ll/w3n;->c(Landroid/content/Context;)Ll/qvl;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0, p0, p1}, Ll/qvl;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic Y(Landroid/app/Activity;Lrx/Notification;)Lrx/Notification;
    .locals 3

    .line 1
    invoke-virtual {p1}, Lrx/Notification;->j()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ljava/lang/RuntimeException;

    .line 8
    .line 9
    new-instance v1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v2, "activity did not Destroy in 10:"

    .line 12
    .line 13
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-object p1
.end method

.method public static Y0(ZLjava/lang/Class;ZZZ)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/lang/Class;",
            "ZZZ)",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p3}, Ll/uqb0;->M0(Z)V

    .line 2
    .line 3
    .line 4
    sget-object p3, Ll/uqb0;->I:Ll/xi5;

    .line 5
    .line 6
    sget-object v0, Ll/uqb0;->j0:Ll/dg00;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/dg00;->E()Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ll/opb0;

    .line 13
    .line 14
    invoke-direct {v1, p0, p1, p2, p4}, Ll/opb0;-><init>(ZLjava/lang/Class;ZZ)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p3, p0}, Lcom/tantanapp/common/network/RunnerProxy;->now(Lrx/c;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public static synthetic Z(Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;)V
    .locals 6

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v2, "del_or_hidden_entrance_switch"

    .line 10
    .line 11
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->s(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    sget-object p0, Ll/uqb0;->c0:Ll/bn5;

    .line 18
    .line 19
    invoke-interface {p0}, Ll/bn5;->signedIn_()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 26
    .line 27
    .line 28
    move-result-wide v2

    .line 29
    new-instance p0, Ljava/lang/RuntimeException;

    .line 30
    .line 31
    new-instance v4, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    const-string v5, "RemoteConfig del_or_hidden_entrance_switch =false, cost="

    .line 34
    .line 35
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    sub-long/2addr v2, v0

    .line 39
    invoke-virtual {v4, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-direct {p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 50
    .line 51
    .line 52
    :cond_0
    return-void
.end method

.method public static Z0(ZZ)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZ)",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/bn5;->getSignOutJumpAct()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-static {p0, v0, v1, v1, p1}, Ll/uqb0;->Y0(ZLjava/lang/Class;ZZZ)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic a0([Ljava/lang/Object;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static a1(Ljava/lang/Class;Lcom/p1/mobile/putong/data/SignOutParams;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class;",
            "Lcom/p1/mobile/putong/data/SignOutParams;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/hpb0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/hpb0;-><init>(Ljava/lang/Class;Lcom/p1/mobile/putong/data/SignOutParams;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/c;->fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-static {}, Ll/psd0;->R()Lrx/c$d;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public static synthetic b0(Lcom/p1/mobile/putong/data/CommonAssetsSettings;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/uqb0;->p0()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/cbl0;->n()Ll/cbl0;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Ll/cbl0;->v()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static b1(Ljava/lang/Class;ZLcom/p1/mobile/putong/api/api/AccountTempApi$InactiveType;Z)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class;",
            "Z",
            "Lcom/p1/mobile/putong/api/api/AccountTempApi$InactiveType;",
            "Z)",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/SignOutParams;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p1, p2, v1, p3}, Lcom/p1/mobile/putong/data/SignOutParams;-><init>(ZLcom/p1/mobile/putong/api/api/AccountTempApi$InactiveType;ZZ)V

    .line 5
    .line 6
    .line 7
    invoke-static {p0, v0}, Ll/uqb0;->a1(Ljava/lang/Class;Lcom/p1/mobile/putong/data/SignOutParams;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic c0()V
    .locals 1

    .line 1
    sget-object v0, Ll/uqb0;->J:Ll/ja5;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ja5;->C()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static c1()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/api/WebSocketManager;->Q()Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/WebSocketManager;->o0()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static d0(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "http"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ll/uqb0;->p0()V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Lcom/tantanapp/media/proxy/api/a;->p()Lcom/tantanapp/media/proxy/api/a;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0, p0}, Lcom/tantanapp/media/proxy/api/a;->q(Ljava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    :cond_0
    return-object p0
.end method

.method public static d1()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/app/TantanApp;->c:Ll/cmb0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/cmb0;->e0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static e0(ZZ)V
    .locals 2

    .line 1
    sput-boolean p0, Ll/uqb0;->A:Z

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->InitCommonInfo:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 4
    .line 5
    filled-new-array {v0}, [Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {v1}, Ll/uqi;->f([Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p0}, Ll/uqb0;->z0(Z)V

    .line 13
    .line 14
    .line 15
    sget-object p0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->NotifySignIn:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 16
    .line 17
    invoke-static {v0, p0}, Ll/uqi;->e(Lcom/p1/mobile/putong/util/launch/LaunchStep;Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 18
    .line 19
    .line 20
    sget-object v0, Ll/uqb0;->j0:Ll/dg00;

    .line 21
    .line 22
    invoke-virtual {v0, p1}, Ll/dg00;->o(Z)V

    .line 23
    .line 24
    .line 25
    invoke-static {}, Ll/uc00;->b()V

    .line 26
    .line 27
    .line 28
    sget-object p1, Lcom/p1/mobile/putong/util/launch/LaunchStep;->NotifyAllSignIn:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 29
    .line 30
    invoke-static {p0, p1}, Ll/uqi;->e(Lcom/p1/mobile/putong/util/launch/LaunchStep;Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 31
    .line 32
    .line 33
    sget-object p0, Ll/uqb0;->j0:Ll/dg00;

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/dg00;->m()V

    .line 36
    .line 37
    .line 38
    sget-object p0, Ll/uqb0;->v0:Lrx/subjects/a;

    .line 39
    .line 40
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {p0, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    new-instance v0, Ll/tpb0;

    .line 49
    .line 50
    invoke-direct {v0}, Ll/tpb0;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 58
    .line 59
    .line 60
    sget-object p0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->WebpCall:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 61
    .line 62
    invoke-static {p1, p0}, Ll/uqi;->e(Lcom/p1/mobile/putong/util/launch/LaunchStep;Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 63
    .line 64
    .line 65
    new-instance p1, Ll/upb0;

    .line 66
    .line 67
    invoke-direct {p1}, Ll/upb0;-><init>()V

    .line 68
    .line 69
    .line 70
    invoke-static {p1}, Ll/sim;->i(Ll/pcj;)V

    .line 71
    .line 72
    .line 73
    invoke-static {p0}, Ll/uqi;->d(Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public static varargs e1(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 2
    .line 3
    invoke-static {v0}, Ll/w3n;->c(Landroid/content/Context;)Ll/qvl;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0, p0, p1}, Ll/qvl;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static f0()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ll/uqb0;->g0(Z)Lrx/c;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    return-object v0
.end method

.method public static f1()V
    .locals 3

    .line 1
    invoke-static {}, Ll/uqb0;->f0()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/uqb0$f;

    .line 19
    .line 20
    invoke-direct {v1}, Ll/uqb0$f;-><init>()V

    .line 21
    .line 22
    .line 23
    new-instance v2, Ll/uqb0$g;

    .line 24
    .line 25
    invoke-direct {v2}, Ll/uqb0$g;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public static g0(Z)Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/uqb0;->q0:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Ll/uqb0;->q0:Lrx/subjects/a;

    .line 10
    .line 11
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 12
    .line 13
    .line 14
    move-result-wide v1

    .line 15
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-static {}, Ll/uqb0;->d1()V

    .line 23
    .line 24
    .line 25
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->resetNetworkControlParams()V

    .line 28
    .line 29
    .line 30
    invoke-static {}, Ll/uqb0;->C0()V

    .line 31
    .line 32
    .line 33
    invoke-static {}, Ll/uqb0;->D0()V

    .line 34
    .line 35
    .line 36
    new-instance v0, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    const-string v1, "callPrepareNewSignIn:isSignUp "

    .line 39
    .line 40
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    const-string v1, "[putong-common][userMeState]"

    .line 51
    .line 52
    invoke-static {v1, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    sget-object v0, Ll/uqb0;->j0:Ll/dg00;

    .line 56
    .line 57
    iget-object v0, v0, Ll/dg00;->f:Lrx/subjects/a;

    .line 58
    .line 59
    const/4 v1, 0x1

    .line 60
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    sget-object v1, Lcom/p1/mobile/android/rx/rxthread/FastIoScheduler;->b:Ll/f2e0;

    .line 65
    .line 66
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    new-instance v1, Ll/tqb0;

    .line 71
    .line 72
    invoke-direct {v1}, Ll/tqb0;-><init>()V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    new-instance v1, Ll/epb0;

    .line 88
    .line 89
    invoke-direct {v1}, Ll/epb0;-><init>()V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    new-instance v1, Ll/fpb0;

    .line 97
    .line 98
    invoke-direct {v1, p0}, Ll/fpb0;-><init>(Z)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    return-object p0
.end method

.method public static h0()V
    .locals 2

    .line 1
    sget-boolean v0, Ll/uqb0;->t0:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    sput-boolean v0, Ll/uqb0;->t0:Z

    .line 8
    .line 9
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Landroid/os/Looper;->getQueue()Landroid/os/MessageQueue;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/uqb0$d;

    .line 18
    .line 19
    invoke-direct {v1}, Ll/uqb0$d;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/os/MessageQueue;->addIdleHandler(Landroid/os/MessageQueue$IdleHandler;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static i0()Z
    .locals 3

    .line 1
    invoke-static {}, Lcom/google/android/gms/common/GoogleApiAvailability;->getInstance()Lcom/google/android/gms/common/GoogleApiAvailability;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    :try_start_0
    sget-object v2, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 7
    .line 8
    invoke-virtual {v0, v2}, Lcom/google/android/gms/common/GoogleApiAvailability;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    .line 9
    .line 10
    .line 11
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    goto :goto_0

    .line 13
    :catchall_0
    move-exception v0

    .line 14
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 15
    .line 16
    .line 17
    move v0, v1

    .line 18
    :goto_0
    if-nez v0, :cond_0

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_0
    const/4 v1, 0x0

    .line 22
    :goto_1
    return v1
.end method

.method public static k0()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/api/WebSocketManager;->Q()Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/WebSocketManager;->H()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static l0(Z)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->InitOtherDb:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 2
    .line 3
    filled-new-array {v0}, [Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/uqi;->f([Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 8
    .line 9
    .line 10
    const-string v0, "DatabaseStore"

    .line 11
    .line 12
    const-string v1, "dbInit"

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 18
    .line 19
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/jpb0;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/jpb0;-><init>(Z)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    new-instance v0, Ll/kpb0;

    .line 33
    .line 34
    invoke-direct {v0}, Ll/kpb0;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    new-instance v0, Ll/lpb0;

    .line 42
    .line 43
    invoke-direct {v0}, Ll/lpb0;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0
.end method

.method public static m0(Ll/pcj;)Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pcj<",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;>;)",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/uqb0;->I:Ll/xi5;

    .line 2
    .line 3
    sget-object v1, Ll/uqb0;->O:Ll/tl8;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/tl8;->O()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Lrx/c;->materialize()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Lrx/c;->first()Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v1, v2}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Lcom/tantanapp/common/network/RunnerProxy;->now(Lrx/c;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/mpb0;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/mpb0;-><init>(Ll/pcj;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method

.method public static synthetic p()V
    .locals 2

    .line 1
    invoke-static {}, Ll/uqb0;->y0()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/uqb0;->j0:Ll/dg00;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/dg00;->q()V

    .line 7
    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->InitOtherDb:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 10
    .line 11
    invoke-static {v0}, Ll/uqi;->d(Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 12
    .line 13
    .line 14
    const-string v0, "DatabaseStore"

    .line 15
    .line 16
    const-string v1, "dbInit done"

    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static p0()V
    .locals 11

    .line 1
    invoke-static {}, Ll/uqb0;->t0()Ljava/io/File;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-boolean v1, Lcom/p1/mobile/android/app/App;->f:Z

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    goto :goto_2

    .line 10
    :cond_0
    sget-object v1, Ll/uqb0;->G0:[Z

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    aget-boolean v3, v1, v2

    .line 14
    .line 15
    if-nez v3, :cond_2

    .line 16
    .line 17
    monitor-enter v1

    .line 18
    :try_start_0
    aget-boolean v3, v1, v2

    .line 19
    .line 20
    if-nez v3, :cond_1

    .line 21
    .line 22
    const/4 v3, 0x1

    .line 23
    aput-boolean v3, v1, v2

    .line 24
    .line 25
    sget-object v2, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 26
    .line 27
    invoke-static {v2}, Lcom/tantanapp/media/proxy/api/TTMediaProxy;->setAppContext(Landroid/content/Context;)V

    .line 28
    .line 29
    .line 30
    const-wide/16 v8, -0x1

    .line 31
    .line 32
    const/4 v10, 0x1

    .line 33
    const/4 v3, -0x1

    .line 34
    const-wide/16 v4, 0xc8

    .line 35
    .line 36
    const-wide/16 v6, -0x1

    .line 37
    .line 38
    invoke-static/range {v3 .. v10}, Lcom/tantanapp/media/proxy/api/a;->n(IJJJZ)V

    .line 39
    .line 40
    .line 41
    invoke-static {}, Lcom/tantanapp/media/proxy/api/a;->p()Lcom/tantanapp/media/proxy/api/a;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const-wide/16 v3, 0x1f4

    .line 50
    .line 51
    invoke-virtual {v2, v0, v3, v4}, Lcom/tantanapp/media/proxy/api/a;->z(Ljava/lang/String;J)V

    .line 52
    .line 53
    .line 54
    invoke-static {}, Lcom/tantanapp/media/proxy/api/a;->p()Lcom/tantanapp/media/proxy/api/a;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    new-instance v2, Ll/uqb0$e;

    .line 59
    .line 60
    invoke-direct {v2}, Ll/uqb0$e;-><init>()V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, v2}, Lcom/tantanapp/media/proxy/api/a;->k(Lcom/tantanapp/media/proxy/api/a$e;)V

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :catchall_0
    move-exception v0

    .line 68
    goto :goto_1

    .line 69
    :cond_1
    :goto_0
    monitor-exit v1

    .line 70
    return-void

    .line 71
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 72
    throw v0

    .line 73
    :cond_2
    :goto_2
    return-void
.end method

.method public static synthetic q()V
    .locals 1

    .line 1
    :try_start_0
    invoke-static {}, Ll/qzd;->b()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    return-void

    .line 5
    :catch_0
    move-exception v0

    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->g(Ljava/lang/Throwable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static q0()V
    .locals 4

    .line 1
    invoke-static {}, Ll/uqb0;->k0()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/app/TantanApp;->c:Ll/cmb0;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/cmb0;->c0()V

    .line 7
    .line 8
    .line 9
    sget-object v0, Ll/uqb0;->j0:Ll/dg00;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/dg00;->B()V

    .line 12
    .line 13
    .line 14
    sget-object v0, Ll/uqb0;->T:Lcom/p1/mobile/putong/api/api/PaymentApi;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/api/api/PaymentApi;->b:Ll/jxd0;

    .line 17
    .line 18
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const/4 v2, 0x0

    .line 28
    invoke-virtual {v0, v2}, Ll/l9c;->k(Z)V

    .line 29
    .line 30
    .line 31
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->U()V

    .line 32
    .line 33
    .line 34
    invoke-static {}, Ll/tg50;->g()Ll/tg50;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const/4 v3, 0x1

    .line 39
    invoke-virtual {v0, v3}, Ll/tg50;->f(Z)V

    .line 40
    .line 41
    .line 42
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 43
    .line 44
    invoke-interface {v0}, Ll/bn5;->signOut()V

    .line 45
    .line 46
    .line 47
    sget-object v0, Ll/uqb0;->L:Lcom/p1/mobile/putong/api/api/AccountTempApi;

    .line 48
    .line 49
    iget-object v0, v0, Lcom/p1/mobile/putong/api/api/AccountTempApi;->a:Ll/kxd0;

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Ll/kxd0;->h(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    sget-object v0, Ll/uqb0;->m0:Ll/jxd0;

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->x()V

    .line 60
    .line 61
    .line 62
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->w()V

    .line 63
    .line 64
    .line 65
    sget-object v0, Ll/uqb0;->T:Lcom/p1/mobile/putong/api/api/PaymentApi;

    .line 66
    .line 67
    iget-object v0, v0, Lcom/p1/mobile/putong/api/api/PaymentApi;->b:Ll/jxd0;

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->T()V

    .line 73
    .line 74
    .line 75
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 76
    .line 77
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->resetNetworkControlParams()V

    .line 78
    .line 79
    .line 80
    invoke-static {v2}, Lcom/p1/mobile/putong/api/ABManager;->X(Z)V

    .line 81
    .line 82
    .line 83
    invoke-static {v2}, Lcom/p1/mobile/putong/api/ABManager;->Y(Z)V

    .line 84
    .line 85
    .line 86
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 87
    .line 88
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->invalidHashAccount()V

    .line 89
    .line 90
    .line 91
    invoke-static {v2}, Lcom/p1/mobile/putong/api/ABManager;->e0(I)V

    .line 92
    .line 93
    .line 94
    sget-object v0, Ll/uqb0;->Q:Ll/l2;

    .line 95
    .line 96
    invoke-virtual {v0}, Ll/l2;->T()V

    .line 97
    .line 98
    .line 99
    const-wide/16 v0, -0x1

    .line 100
    .line 101
    sput-wide v0, Ll/uqb0;->x0:J

    .line 102
    .line 103
    invoke-static {}, Ll/asx;->h()Ll/asx;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-virtual {v0}, Ll/asx;->i()V

    .line 108
    .line 109
    .line 110
    invoke-static {}, Ll/rsh0;->g()V

    .line 111
    .line 112
    .line 113
    return-void
.end method

.method public static synthetic r(ZLl/uxj0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    new-instance p1, Ll/nqb0;

    .line 2
    .line 3
    invoke-direct {p1}, Ll/nqb0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, p1}, Ll/uqb0;->v0(ZLl/x20;)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static r0(Ljava/lang/Runnable;Z)V
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->v0:Lrx/subjects/a;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    :goto_0
    invoke-virtual {v0, p1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    new-instance v0, Ll/zpb0;

    .line 24
    .line 25
    invoke-direct {v0, p0}, Ll/zpb0;-><init>(Ljava/lang/Runnable;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public static synthetic s(Ljava/lang/Runnable;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static s0()V
    .locals 2

    .line 1
    sget-boolean v0, Ll/uqb0;->u0:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    sput-boolean v0, Ll/uqb0;->u0:Z

    .line 8
    .line 9
    sget-object v0, Ll/uqb0;->v0:Lrx/subjects/a;

    .line 10
    .line 11
    sget-object v1, Ll/uxj0;->a:Ll/uxj0;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    sget-boolean v0, Ll/uqb0;->t0:Z

    .line 17
    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    new-instance v0, Ljava/lang/RuntimeException;

    .line 21
    .line 22
    const-string v1, "finishColdStart with checkFinishColdStart = false"

    .line 23
    .line 24
    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 28
    .line 29
    .line 30
    :cond_1
    :goto_0
    return-void
.end method

.method public static synthetic t(Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    invoke-static {p0}, Ll/uqb0;->l0(Z)Lrx/c;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static t0()Ljava/io/File;
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->d0:Ljava/io/File;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    sget-object v0, Ll/uqb0;->e0:Ljava/lang/Integer;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/uqb0;->d0:Ljava/io/File;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    const-string v1, "media"

    .line 13
    .line 14
    invoke-static {v1}, Ll/l51;->u(Ljava/lang/String;)Ljava/io/File;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    sput-object v1, Ll/uqb0;->d0:Ljava/io/File;

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catchall_0
    move-exception v1

    .line 22
    goto :goto_1

    .line 23
    :cond_0
    :goto_0
    monitor-exit v0

    .line 24
    goto :goto_2

    .line 25
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    throw v1

    .line 27
    :cond_1
    :goto_2
    sget-object v0, Ll/uqb0;->d0:Ljava/io/File;

    .line 28
    .line 29
    return-object v0
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;->USER:Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static u0()J
    .locals 4

    .line 1
    invoke-static {}, Ll/a2j0;->h()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sget-wide v2, Ll/uqb0;->g0:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(JJ)J

    .line 11
    .line 12
    .line 13
    move-result-wide v0

    .line 14
    return-wide v0
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;->USER:Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/asx;->h()Ll/asx;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "community_optimization_long_graphic"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0, v0}, Ll/asx;->k(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Ll/asx;->h()Ll/asx;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-string v1, "post_video_config"

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {p0, v0}, Ll/asx;->j(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method

.method public static v0(ZLl/x20;)Z
    .locals 3

    .line 1
    :try_start_0
    invoke-interface {p1}, Ll/x20;->call()V
    :try_end_0
    .catch Lcom/tantanapp/common/utils/DBCorruptException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lcom/p1/mobile/putong/app/SQLDBDamagedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x1

    .line 5
    return p0

    .line 6
    :catch_0
    move-exception p1

    .line 7
    goto :goto_0

    .line 8
    :catch_1
    move-exception p1

    .line 9
    :goto_0
    new-instance v0, Ljava/lang/RuntimeException;

    .line 10
    .line 11
    new-instance v1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v2, "DBCorruptException on onAllModuleLoadedWhenAlreadySignedIn: "

    .line 14
    .line 15
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-direct {v0, v1, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 29
    .line 30
    .line 31
    const-string v0, "[putong-common][userMeState]"

    .line 32
    .line 33
    const-string v1, "Catch DBCorruptException and callPrepareNewSignIn"

    .line 34
    .line 35
    invoke-static {v0, v1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    if-nez p0, :cond_1

    .line 39
    .line 40
    instance-of p0, p1, Lcom/p1/mobile/putong/app/SQLDBDamagedException;

    .line 41
    .line 42
    if-nez p0, :cond_1

    .line 43
    .line 44
    sget-object p0, Ll/uqb0;->c0:Ll/bn5;

    .line 45
    .line 46
    invoke-interface {p0}, Ll/bn5;->userId()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    const/4 p1, 0x0

    .line 55
    if-nez p0, :cond_0

    .line 56
    .line 57
    invoke-static {}, Ll/uqb0;->f1()V

    .line 58
    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_0
    invoke-static {p1, p1}, Ll/uqb0;->Z0(ZZ)Lrx/c;

    .line 62
    .line 63
    .line 64
    :goto_1
    return p1

    .line 65
    :cond_1
    :try_start_1
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p0}, Ll/l9c;->j()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 70
    .line 71
    .line 72
    goto :goto_2

    .line 73
    :catch_2
    move-exception p0

    .line 74
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 75
    .line 76
    .line 77
    :goto_2
    throw p1
.end method

.method public static synthetic w(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic x(Ll/pcj;Lrx/Notification;)Lrx/c;
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/pcj;->call()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lrx/c;

    .line 6
    .line 7
    return-object p0
.end method

.method public static synthetic y(Ljava/lang/Class;ZZ)Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/api/api/AccountTempApi$InactiveType;->None:Lcom/p1/mobile/putong/api/api/AccountTempApi$InactiveType;

    .line 2
    .line 3
    invoke-static {p0, p1, v0, p2}, Ll/uqb0;->b1(Ljava/lang/Class;ZLcom/p1/mobile/putong/api/api/AccountTempApi$InactiveType;Z)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static y0()V
    .locals 2

    .line 1
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/l9c;->s()V

    .line 6
    .line 7
    .line 8
    sget-object v0, Ll/uqb0;->k0:Ll/vj5;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/vj5;->i()V

    .line 13
    .line 14
    .line 15
    :cond_0
    new-instance v0, Ll/vj5;

    .line 16
    .line 17
    invoke-direct {v0}, Ll/vj5;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v1, v0}, Ll/l9c;->y(Ll/h9c;)V

    .line 25
    .line 26
    .line 27
    sput-object v0, Ll/uqb0;->k0:Ll/vj5;

    .line 28
    .line 29
    sget-object v0, Ll/uqb0;->l0:Lrx/subjects/a;

    .line 30
    .line 31
    sget-object v1, Ll/uxj0;->a:Ll/uxj0;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public static synthetic z(Ll/uqb0;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uqb0;->K0(Ll/uxj0;)V

    return-void
.end method

.method public static z0(Z)V
    .locals 8

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
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-nez v1, :cond_4

    .line 12
    .line 13
    new-instance v1, Ll/byd0;

    .line 14
    .line 15
    new-instance v2, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string v3, "use_first_login_local_time_"

    .line 18
    .line 19
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-wide/16 v2, -0x1

    .line 30
    .line 31
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    invoke-direct {v1, v0, v4}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 36
    .line 37
    .line 38
    const-wide/16 v4, -0x3e8

    .line 39
    .line 40
    if-eqz p0, :cond_2

    .line 41
    .line 42
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    check-cast p0, Ljava/lang/Long;

    .line 47
    .line 48
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 49
    .line 50
    .line 51
    move-result-wide v2

    .line 52
    const-wide/16 v6, 0x0

    .line 53
    .line 54
    cmp-long p0, v2, v6

    .line 55
    .line 56
    if-gtz p0, :cond_1

    .line 57
    .line 58
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    check-cast p0, Ljava/lang/Long;

    .line 63
    .line 64
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 65
    .line 66
    .line 67
    move-result-wide v2

    .line 68
    cmp-long p0, v2, v4

    .line 69
    .line 70
    if-nez p0, :cond_0

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_0
    invoke-static {}, Ll/pzi0;->o()J

    .line 74
    .line 75
    .line 76
    move-result-wide v2

    .line 77
    sput-wide v2, Ll/uqb0;->x0:J

    .line 78
    .line 79
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-virtual {v1, p0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    goto :goto_1

    .line 87
    :cond_1
    :goto_0
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    check-cast p0, Ljava/lang/Long;

    .line 92
    .line 93
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 94
    .line 95
    .line 96
    move-result-wide v0

    .line 97
    sput-wide v0, Ll/uqb0;->x0:J

    .line 98
    .line 99
    goto :goto_1

    .line 100
    :cond_2
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    check-cast p0, Ljava/lang/Long;

    .line 105
    .line 106
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 107
    .line 108
    .line 109
    move-result-wide v6

    .line 110
    cmp-long p0, v6, v2

    .line 111
    .line 112
    if-nez p0, :cond_3

    .line 113
    .line 114
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-virtual {v1, p0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    :cond_3
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    check-cast p0, Ljava/lang/Long;

    .line 126
    .line 127
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 128
    .line 129
    .line 130
    move-result-wide v0

    .line 131
    sput-wide v0, Ll/uqb0;->x0:J

    .line 132
    .line 133
    :cond_4
    :goto_1
    invoke-static {}, Ll/t8r;->a()Ll/t8r;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    new-instance v0, Ll/wk5;

    .line 138
    .line 139
    invoke-direct {v0}, Ll/wk5;-><init>()V

    .line 140
    .line 141
    .line 142
    invoke-virtual {p0, v0}, Ll/t8r;->d(Ll/v8r;)V

    .line 143
    .line 144
    .line 145
    return-void
.end method


# virtual methods
.method public final A0()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->Y()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/ipb0;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/ipb0;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final B0()V
    .locals 1

    .line 1
    invoke-static {}, Ll/v1c;->a()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 8
    .line 9
    invoke-static {}, Ll/v1c;->d()Ljava/util/ArrayList;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {p0, v0}, Ll/v1c;->e(Landroid/content/Context;Ljava/util/List;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-static {}, Ll/v1c;->b()Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    invoke-static {p0}, Lcom/p1/mobile/putong/app/web/WebViewClientX;->setEnableWebViewDNS(Z)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final F0()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->Y()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/spb0;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/spb0;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final H0()V
    .locals 6

    .line 1
    :try_start_0
    new-instance v0, Ll/uqb0$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/uqb0$a;-><init>(Ll/uqb0;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/i4g0;->E(Ll/gvl;)V

    .line 7
    .line 8
    .line 9
    sget-object p0, Ll/ls4;->d:Ljava/lang/String;

    .line 10
    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const-string p0, ""

    .line 14
    .line 15
    :cond_0
    move-object v4, p0

    .line 16
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 17
    .line 18
    const-string v1, "putong"

    .line 19
    .line 20
    const-string v2, "release"

    .line 21
    .line 22
    const-string v5, "7.3.3"

    .line 23
    .line 24
    const/4 v3, 0x1

    .line 25
    invoke-static/range {v0 .. v5}, Ll/i4g0;->j(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :catchall_0
    move-exception v0

    .line 30
    move-object p0, v0

    .line 31
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->g(Ljava/lang/Throwable;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public I0()V
    .locals 4

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->FbSdk:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 2
    .line 3
    filled-new-array {p0}, [Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/uqi;->f([Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 8
    .line 9
    .line 10
    const-string v0, "518254421109380"

    .line 11
    .line 12
    invoke-static {v0}, Lcom/facebook/c;->N(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {v0}, Lcom/facebook/c;->L(Landroid/content/Context;)V

    .line 22
    .line 23
    .line 24
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 25
    .line 26
    invoke-static {v0}, Lcom/facebook/appevents/AppEventsLogger;->a(Landroid/app/Application;)V

    .line 27
    .line 28
    .line 29
    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const/4 v1, 0x0

    .line 34
    sget-object v2, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 35
    .line 36
    const-string v3, "dmfeSDkpVxP8m6Ys6yJCpn"

    .line 37
    .line 38
    invoke-virtual {v0, v3, v1, v2}, Lcom/appsflyer/AppsFlyerLib;->init(Ljava/lang/String;Lcom/appsflyer/AppsFlyerConversionListener;Landroid/content/Context;)Lcom/appsflyer/AppsFlyerLib;

    .line 39
    .line 40
    .line 41
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->k()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_0

    .line 46
    .line 47
    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    const-string v1, "hms_store_source"

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Lcom/appsflyer/AppsFlyerLib;->setOutOfStore(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    :cond_0
    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 61
    .line 62
    invoke-virtual {v0, v1}, Lcom/appsflyer/AppsFlyerLib;->start(Landroid/content/Context;)V

    .line 63
    .line 64
    .line 65
    new-instance v0, Lcom/p1/mobile/putong/api/api/FacebookApi;

    .line 66
    .line 67
    invoke-direct {v0}, Lcom/p1/mobile/putong/api/api/FacebookApi;-><init>()V

    .line 68
    .line 69
    .line 70
    sput-object v0, Ll/uqb0;->a0:Lcom/p1/mobile/putong/api/api/FacebookApi;

    .line 71
    .line 72
    const/4 v0, 0x1

    .line 73
    invoke-static {v0}, Lcom/facebook/c;->O(Z)V

    .line 74
    .line 75
    .line 76
    invoke-static {}, Lcom/facebook/c;->j()V

    .line 77
    .line 78
    .line 79
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 80
    .line 81
    new-instance v1, Ll/aqb0;

    .line 82
    .line 83
    invoke-direct {v1}, Ll/aqb0;-><init>()V

    .line 84
    .line 85
    .line 86
    invoke-static {v0, v1}, Ll/zw0;->d(Landroid/content/Context;Ll/zw0$b;)V

    .line 87
    .line 88
    .line 89
    invoke-static {p0}, Ll/uqi;->d(Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public final synthetic K0(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/uqb0;->N0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic L0()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->InitAccountModule:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/util/launch/LaunchStep;->AccountModuleInject:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/uqi;->e(Lcom/p1/mobile/putong/util/launch/LaunchStep;Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Ll/uqb0;->j0:Ll/dg00;

    .line 9
    .line 10
    const-string v2, "account"

    .line 11
    .line 12
    invoke-virtual {v0, v2}, Ll/dg00;->t(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->DoAccountInit:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/uqi;->e(Lcom/p1/mobile/putong/util/launch/LaunchStep;Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ll/uqb0;->n0()V

    .line 21
    .line 22
    .line 23
    invoke-static {v0}, Ll/uqi;->d(Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final N0()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->InitSignData:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/util/launch/LaunchStep;->SignedStep:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/uqi;->e(Lcom/p1/mobile/putong/util/launch/LaunchStep;Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 9
    .line 10
    invoke-interface {v0}, Ll/bn5;->userId()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/p1/mobile/android/app/App;->a:Ljava/lang/String;

    .line 15
    .line 16
    :try_start_0
    sget-object p0, Ll/uqb0;->m0:Ll/jxd0;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Ljava/lang/Boolean;

    .line 23
    .line 24
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    const/4 v0, 0x1

    .line 29
    xor-int/2addr p0, v0

    .line 30
    const/4 v2, 0x0

    .line 31
    invoke-static {v2, p0}, Ll/uqb0;->e0(ZZ)V

    .line 32
    .line 33
    .line 34
    invoke-static {v1}, Ll/uqi;->d(Lcom/p1/mobile/putong/util/launch/LaunchStep;)V
    :try_end_0
    .catch Lcom/tantanapp/common/utils/DBCorruptException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lcom/p1/mobile/putong/app/SQLDBDamagedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    .line 36
    .line 37
    sget-object p0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->InitMe:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 38
    .line 39
    filled-new-array {p0}, [Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-static {v1}, Ll/uqi;->f([Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 44
    .line 45
    .line 46
    sget-object v1, Ll/uqb0;->c0:Ll/bn5;

    .line 47
    .line 48
    invoke-interface {v1}, Ll/bn5;->me_()Lcom/p1/mobile/putong/data/User;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    sget-object v2, Lcom/p1/mobile/putong/util/launch/LaunchStep;->InitMeSuccess:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 53
    .line 54
    invoke-static {p0, v2}, Ll/uqi;->e(Lcom/p1/mobile/putong/util/launch/LaunchStep;Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 55
    .line 56
    .line 57
    invoke-static {v1}, Ll/uqb0;->O0(Lcom/p1/mobile/putong/data/User;)V

    .line 58
    .line 59
    .line 60
    sget-object p0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->NotifyMeSuccess:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 61
    .line 62
    invoke-static {v2, p0}, Ll/uqi;->e(Lcom/p1/mobile/putong/util/launch/LaunchStep;Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 63
    .line 64
    .line 65
    sget-object v1, Ll/uqb0;->w0:Lrx/subjects/a;

    .line 66
    .line 67
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {v1, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 72
    .line 73
    .line 74
    invoke-static {p0}, Ll/uqi;->d(Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :catch_0
    move-exception p0

    .line 79
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 80
    .line 81
    .line 82
    :try_start_1
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {p0}, Ll/l9c;->j()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 87
    .line 88
    .line 89
    goto :goto_0

    .line 90
    :catch_1
    move-exception p0

    .line 91
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 92
    .line 93
    .line 94
    :goto_0
    invoke-static {}, Ll/uqb0;->f1()V

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :catch_2
    move-exception p0

    .line 99
    new-instance v0, Ljava/lang/RuntimeException;

    .line 100
    .line 101
    const-string v1, "DBCorruptException on onAllModuleLoadedWhenAlreadySignedIn"

    .line 102
    .line 103
    invoke-direct {v0, v1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 104
    .line 105
    .line 106
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 107
    .line 108
    .line 109
    const-string p0, "[putong-common][userMeState]"

    .line 110
    .line 111
    const-string v0, "Catch DBCorruptException and callPrepareNewSignIn"

    .line 112
    .line 113
    invoke-static {p0, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    invoke-static {}, Ll/uqb0;->f1()V

    .line 117
    .line 118
    .line 119
    return-void
.end method

.method public P0()V
    .locals 1

    .line 1
    const-string p0, "[putong-common]"

    .line 2
    .line 3
    const-string v0, "onLowMemory"

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 9
    .line 10
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 17
    .line 18
    const/16 v0, 0x50

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/am2;->d(I)V

    .line 21
    .line 22
    .line 23
    :cond_0
    sget-object p0, Ll/uqb0;->j0:Ll/dg00;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/dg00;->A()V

    .line 26
    .line 27
    .line 28
    sget-object p0, Lcom/hellogroup/mk/business/MKConfigSetter;->Companion:Lcom/hellogroup/mk/business/MKConfigSetter$Companion;

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/MKConfigSetter$Companion;->j()V

    .line 31
    .line 32
    .line 33
    invoke-static {}, Lcom/tantan/library/svga/SVGALoader;->clear()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public Q0(I)V
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "onTrimMemory level="

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v0, "[putong-common]"

    .line 16
    .line 17
    invoke-static {v0, p0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 21
    .line 22
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_0

    .line 27
    .line 28
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Ll/am2;->d(I)V

    .line 31
    .line 32
    .line 33
    :cond_0
    sget-object p0, Ll/uqb0;->j0:Ll/dg00;

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Ll/dg00;->C(I)V

    .line 36
    .line 37
    .line 38
    invoke-static {}, Lcom/tantan/library/svga/SVGALoader;->clear()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final W0()V
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/location/IntlLocationProvider;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/location/IntlLocationProvider;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object p0, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 7
    .line 8
    return-void
.end method

.method public d()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/App;->d()V

    .line 2
    .line 3
    .line 4
    new-instance p0, Ll/eqb0;

    .line 5
    .line 6
    invoke-direct {p0}, Ll/eqb0;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-static {p0}, Ll/xhi0;->a(Ljava/lang/Runnable;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final j0()V
    .locals 0

    .line 1
    :try_start_0
    const-string p0, ".media_cache"

    .line 2
    .line 3
    invoke-static {p0}, Ll/l51;->v(Ljava/lang/String;)Ljava/io/File;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/oki;->b(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    .line 10
    :catch_0
    :try_start_1
    const-string p0, ".media"

    .line 11
    .line 12
    invoke-static {p0}, Ll/l51;->u(Ljava/lang/String;)Ljava/io/File;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {p0}, Ll/oki;->b(Ljava/io/File;)V
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 17
    .line 18
    .line 19
    :catch_1
    return-void
.end method

.method public m()V
    .locals 11

    .line 1
    invoke-static {}, Ll/uqi;->i()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->PutongCreate:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 5
    .line 6
    sget-object v1, Lcom/p1/mobile/putong/util/launch/LaunchStep;->PuginInit:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 7
    .line 8
    sget-object v2, Lcom/p1/mobile/putong/util/launch/LaunchStep;->PutongArriveImgload:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 9
    .line 10
    sget-object v3, Lcom/p1/mobile/putong/util/launch/LaunchStep;->PutongArriveImgloadNoAd:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 11
    .line 12
    filled-new-array {v0, v1, v2, v3}, [Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v0}, Ll/uqi;->f([Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 17
    .line 18
    .line 19
    new-instance v0, Ll/cmb0;

    .line 20
    .line 21
    invoke-direct {v0}, Ll/cmb0;-><init>()V

    .line 22
    .line 23
    .line 24
    sput-object v0, Lcom/p1/mobile/putong/app/TantanApp;->c:Ll/cmb0;

    .line 25
    .line 26
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 27
    .line 28
    const/16 v1, 0x22

    .line 29
    .line 30
    if-lt v0, v1, :cond_0

    .line 31
    .line 32
    :try_start_0
    invoke-static {}, Ll/dpb0;->a()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :catchall_0
    move-exception v0

    .line 37
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 38
    .line 39
    .line 40
    :cond_0
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->PuginInit:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 41
    .line 42
    invoke-static {v0}, Ll/uqi;->d(Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 43
    .line 44
    .line 45
    sget-object v0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->BaseAppInit:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 46
    .line 47
    filled-new-array {v0}, [Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-static {v1}, Ll/uqi;->f([Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 52
    .line 53
    .line 54
    invoke-super {p0}, Lcom/p1/mobile/android/app/App;->m()V

    .line 55
    .line 56
    .line 57
    sget-object v1, Lcom/p1/mobile/putong/util/launch/LaunchStep;->OneIdInit:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 58
    .line 59
    invoke-static {v0, v1}, Ll/uqi;->e(Lcom/p1/mobile/putong/util/launch/LaunchStep;Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 60
    .line 61
    .line 62
    invoke-static {}, Ll/yp50;->c()V

    .line 63
    .line 64
    .line 65
    invoke-static {}, Ll/qu2;->u()V

    .line 66
    .line 67
    .line 68
    invoke-static {}, Ll/rrq;->b()Ll/rrq;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    sget-object v2, Lcom/p1/mobile/putong/data/CommonData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 73
    .line 74
    const/4 v3, 0x0

    .line 75
    invoke-virtual {v0, v2, v3}, Ll/rrq;->e(Lcom/tantanapp/common/data/JsonAdapter;Ll/gq2;)V

    .line 76
    .line 77
    .line 78
    sget-object v0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->NetworkInit:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 79
    .line 80
    invoke-static {v1, v0}, Ll/uqi;->e(Lcom/p1/mobile/putong/util/launch/LaunchStep;Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 81
    .line 82
    .line 83
    sget-boolean v0, Lcom/p1/mobile/android/app/App;->f:Z

    .line 84
    .line 85
    if-nez v0, :cond_1

    .line 86
    .line 87
    invoke-virtual {p0}, Ll/uqb0;->H0()V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_1
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 92
    .line 93
    invoke-static {v0}, Ll/num;->a(Landroid/content/Context;)V

    .line 94
    .line 95
    .line 96
    new-instance v0, Ll/sre0;

    .line 97
    .line 98
    invoke-direct {v0}, Ll/sre0;-><init>()V

    .line 99
    .line 100
    .line 101
    sput-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 102
    .line 103
    new-instance v0, Ll/dn5;

    .line 104
    .line 105
    invoke-direct {v0}, Ll/dn5;-><init>()V

    .line 106
    .line 107
    .line 108
    sput-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 109
    .line 110
    invoke-static {}, Ll/dg00;->r()Ll/dg00;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    sput-object v0, Ll/uqb0;->j0:Ll/dg00;

    .line 115
    .line 116
    new-instance v0, Ll/z1f;

    .line 117
    .line 118
    invoke-direct {v0}, Ll/z1f;-><init>()V

    .line 119
    .line 120
    .line 121
    sput-object v0, Ll/uqb0;->i0:Ll/z1f;

    .line 122
    .line 123
    invoke-virtual {v0}, Ll/z1f;->b()V

    .line 124
    .line 125
    .line 126
    :try_start_1
    invoke-static {}, Ll/ja5;->B()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 127
    .line 128
    .line 129
    goto :goto_1

    .line 130
    :catch_0
    move-exception v0

    .line 131
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->g(Ljava/lang/Throwable;)V

    .line 132
    .line 133
    .line 134
    :goto_1
    :try_start_2
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 135
    .line 136
    invoke-static {v0}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->n(Landroid/content/Context;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 137
    .line 138
    .line 139
    goto :goto_2

    .line 140
    :catch_1
    move-exception v0

    .line 141
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->g(Ljava/lang/Throwable;)V

    .line 142
    .line 143
    .line 144
    :goto_2
    invoke-virtual {p0}, Ll/uqb0;->x0()V

    .line 145
    .line 146
    .line 147
    sget-object v0, Ll/uqb0;->E0:Ll/jxd0;

    .line 148
    .line 149
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    check-cast v0, Ljava/lang/Boolean;

    .line 154
    .line 155
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 156
    .line 157
    .line 158
    move-result v0

    .line 159
    if-eqz v0, :cond_2

    .line 160
    .line 161
    sget-object v0, Lcom/immomo/android/network/metrics/NetworkMetricsStatistics;->INSTANCE:Lcom/immomo/android/network/metrics/NetworkMetricsStatistics;

    .line 162
    .line 163
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 164
    .line 165
    new-instance v4, Ll/vv5;

    .line 166
    .line 167
    sget-object v6, Ll/uqb0;->s:Ljava/lang/String;

    .line 168
    .line 169
    new-instance v7, Ll/kqb0;

    .line 170
    .line 171
    invoke-direct {v7}, Ll/kqb0;-><init>()V

    .line 172
    .line 173
    .line 174
    const/4 v9, 0x0

    .line 175
    const/4 v10, 0x0

    .line 176
    const-string v5, "Tantantribe"

    .line 177
    .line 178
    const/4 v8, 0x0

    .line 179
    invoke-direct/range {v4 .. v10}, Ll/vv5;-><init>(Ljava/lang/String;Ljava/lang/String;Lkotlin/jvm/functions/Function0;Ll/apl;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    .line 180
    .line 181
    .line 182
    invoke-virtual {v0, v1, v4}, Lcom/immomo/android/network/metrics/NetworkMetricsStatistics;->g(Landroid/app/Application;Ll/vv5;)V

    .line 183
    .line 184
    .line 185
    invoke-virtual {v0}, Lcom/immomo/android/network/metrics/NetworkMetricsStatistics;->b()V

    .line 186
    .line 187
    .line 188
    :cond_2
    new-instance v0, Ll/rg50$b;

    .line 189
    .line 190
    invoke-direct {v0}, Ll/rg50$b;-><init>()V

    .line 191
    .line 192
    .line 193
    sput-object v0, Ll/uqb0;->C:Ll/rg50$b;

    .line 194
    .line 195
    new-instance v1, Ll/mhl;

    .line 196
    .line 197
    invoke-direct {v1}, Ll/mhl;-><init>()V

    .line 198
    .line 199
    .line 200
    invoke-virtual {v0, v1}, Ll/rg50$b;->a(Ll/azm;)Ll/rg50$b;

    .line 201
    .line 202
    .line 203
    sget-object v0, Ll/uqb0;->C:Ll/rg50$b;

    .line 204
    .line 205
    invoke-static {}, Ll/tg50;->g()Ll/tg50;

    .line 206
    .line 207
    .line 208
    move-result-object v1

    .line 209
    invoke-virtual {v0, v1}, Ll/rg50$b;->j(Ll/o6e;)Ll/rg50$b;

    .line 210
    .line 211
    .line 212
    :try_start_3
    invoke-virtual {p0}, Ll/uqb0;->o0()V

    .line 213
    .line 214
    .line 215
    sget-object v0, Ll/uqb0;->C:Ll/rg50$b;

    .line 216
    .line 217
    invoke-static {v0}, Ll/c1j0;->a(Ll/rg50$b;)Ll/rg50$b;

    .line 218
    .line 219
    .line 220
    move-result-object v0

    .line 221
    sput-object v0, Ll/uqb0;->C:Ll/rg50$b;

    .line 222
    .line 223
    invoke-static {v0}, Lcom/p1/mobile/putong/api/ABManager;->f(Ll/rg50$b;)Ll/rg50$b;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    sput-object v0, Ll/uqb0;->C:Ll/rg50$b;

    .line 228
    .line 229
    invoke-static {v0}, Ll/hfj0;->a(Ll/rg50$b;)Ll/rg50$b;

    .line 230
    .line 231
    .line 232
    move-result-object v0

    .line 233
    sput-object v0, Ll/uqb0;->C:Ll/rg50$b;

    .line 234
    .line 235
    new-instance v0, Ll/hfj0;

    .line 236
    .line 237
    invoke-direct {v0}, Ll/hfj0;-><init>()V

    .line 238
    .line 239
    .line 240
    sput-object v0, Ll/uqb0;->K:Ll/hfj0;

    .line 241
    .line 242
    sget-object v0, Ll/uqb0;->C:Ll/rg50$b;

    .line 243
    .line 244
    invoke-static {v0}, Ll/qu2;->l(Ll/rg50$b;)Ll/rg50$b;

    .line 245
    .line 246
    .line 247
    move-result-object v0

    .line 248
    sput-object v0, Ll/uqb0;->C:Ll/rg50$b;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 249
    .line 250
    goto :goto_3

    .line 251
    :catch_2
    move-exception v0

    .line 252
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->g(Ljava/lang/Throwable;)V

    .line 253
    .line 254
    .line 255
    :goto_3
    sget-object v0, Ll/uqb0;->E0:Ll/jxd0;

    .line 256
    .line 257
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 258
    .line 259
    .line 260
    move-result-object v0

    .line 261
    check-cast v0, Ljava/lang/Boolean;

    .line 262
    .line 263
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 264
    .line 265
    .line 266
    move-result v0

    .line 267
    if-eqz v0, :cond_3

    .line 268
    .line 269
    sget-object v0, Ll/uqb0;->C:Ll/rg50$b;

    .line 270
    .line 271
    new-instance v1, Ll/nk20;

    .line 272
    .line 273
    new-instance v2, Ll/oyv$b;

    .line 274
    .line 275
    invoke-direct {v2}, Ll/oyv$b;-><init>()V

    .line 276
    .line 277
    .line 278
    invoke-direct {v1, v2, v3}, Ll/nk20;-><init>(Ll/t4f$b;Ljava/util/List;)V

    .line 279
    .line 280
    .line 281
    invoke-virtual {v0, v1}, Ll/rg50$b;->l(Ll/t4f$b;)Ll/rg50$b;

    .line 282
    .line 283
    .line 284
    goto :goto_4

    .line 285
    :cond_3
    sget-object v0, Ll/uqb0;->C:Ll/rg50$b;

    .line 286
    .line 287
    new-instance v1, Ll/oyv$b;

    .line 288
    .line 289
    invoke-direct {v1}, Ll/oyv$b;-><init>()V

    .line 290
    .line 291
    .line 292
    invoke-virtual {v0, v1}, Ll/rg50$b;->l(Ll/t4f$b;)Ll/rg50$b;

    .line 293
    .line 294
    .line 295
    :goto_4
    sget-object v0, Ll/uqb0;->C:Ll/rg50$b;

    .line 296
    .line 297
    invoke-virtual {v0}, Ll/rg50$b;->c()Ll/rg50;

    .line 298
    .line 299
    .line 300
    move-result-object v0

    .line 301
    iput-object v0, p0, Ll/uqb0;->r:Ll/rg50;

    .line 302
    .line 303
    sget-object v0, Ll/uqb0;->C:Ll/rg50$b;

    .line 304
    .line 305
    invoke-virtual {v0}, Ll/rg50$b;->c()Ll/rg50;

    .line 306
    .line 307
    .line 308
    move-result-object v0

    .line 309
    sput-object v0, Ll/uqb0;->D:Ll/rg50;

    .line 310
    .line 311
    new-instance v0, Lcom/p1/mobile/putong/api/api/Network;

    .line 312
    .line 313
    sget-object v1, Ll/uqb0;->D:Ll/rg50;

    .line 314
    .line 315
    invoke-virtual {v1}, Ll/rg50;->v()Ll/rg50$b;

    .line 316
    .line 317
    .line 318
    move-result-object v1

    .line 319
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/api/api/Network;-><init>(Ll/rg50$b;)V

    .line 320
    .line 321
    .line 322
    sput-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 323
    .line 324
    sput-object v0, Ll/xi5;->network:Lcom/p1/mobile/putong/api/api/Network;

    .line 325
    .line 326
    sget-object v0, Lcom/p1/mobile/android/app/App;->i:Ll/vxd0;

    .line 327
    .line 328
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 329
    .line 330
    .line 331
    move-result-object v0

    .line 332
    check-cast v0, Ljava/lang/Integer;

    .line 333
    .line 334
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 335
    .line 336
    .line 337
    move-result v0

    .line 338
    const/4 v1, 0x1

    .line 339
    if-ne v0, v1, :cond_4

    .line 340
    .line 341
    sget-object v0, Ll/uqb0;->w:Ll/byd0;

    .line 342
    .line 343
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 344
    .line 345
    .line 346
    move-result-object v0

    .line 347
    check-cast v0, Ljava/lang/Long;

    .line 348
    .line 349
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 350
    .line 351
    .line 352
    move-result-wide v4

    .line 353
    const-wide/16 v6, 0x0

    .line 354
    .line 355
    cmp-long v0, v4, v6

    .line 356
    .line 357
    if-nez v0, :cond_4

    .line 358
    .line 359
    sget-object v0, Ll/uqb0;->w:Ll/byd0;

    .line 360
    .line 361
    invoke-static {}, Ll/pzi0;->o()J

    .line 362
    .line 363
    .line 364
    move-result-wide v4

    .line 365
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 366
    .line 367
    .line 368
    move-result-object v2

    .line 369
    invoke-virtual {v0, v2}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 370
    .line 371
    .line 372
    :cond_4
    invoke-virtual {p0}, Ll/uqb0;->H0()V

    .line 373
    .line 374
    .line 375
    invoke-static {}, Ll/i4g0;->c()V

    .line 376
    .line 377
    .line 378
    invoke-static {}, Ll/i4g0;->J()V

    .line 379
    .line 380
    .line 381
    invoke-static {}, Ll/qu2;->y()V

    .line 382
    .line 383
    .line 384
    sget-object v0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->NetworkInit:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 385
    .line 386
    sget-object v2, Lcom/p1/mobile/putong/util/launch/LaunchStep;->BaseApi:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 387
    .line 388
    invoke-static {v0, v2}, Ll/uqi;->e(Lcom/p1/mobile/putong/util/launch/LaunchStep;Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 389
    .line 390
    .line 391
    :try_start_4
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 392
    .line 393
    invoke-static {v0}, Ll/b4f0;->e(Landroid/content/Context;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    .line 394
    .line 395
    .line 396
    goto :goto_5

    .line 397
    :catch_3
    move-exception v0

    .line 398
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->g(Ljava/lang/Throwable;)V

    .line 399
    .line 400
    .line 401
    :goto_5
    new-instance v0, Ll/xi5;

    .line 402
    .line 403
    invoke-direct {v0}, Ll/xi5;-><init>()V

    .line 404
    .line 405
    .line 406
    sput-object v0, Ll/uqb0;->I:Ll/xi5;

    .line 407
    .line 408
    new-instance v0, Lcom/p1/mobile/putong/api/api/AccountTempApi;

    .line 409
    .line 410
    invoke-direct {v0}, Lcom/p1/mobile/putong/api/api/AccountTempApi;-><init>()V

    .line 411
    .line 412
    .line 413
    sput-object v0, Ll/uqb0;->L:Lcom/p1/mobile/putong/api/api/AccountTempApi;

    .line 414
    .line 415
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 416
    .line 417
    invoke-interface {v0}, Ll/bn5;->signedIn_()Z

    .line 418
    .line 419
    .line 420
    move-result v0

    .line 421
    xor-int/2addr v0, v1

    .line 422
    sput-boolean v0, Ll/uqb0;->u:Z

    .line 423
    .line 424
    new-instance v0, Ll/ja5;

    .line 425
    .line 426
    invoke-direct {v0}, Ll/ja5;-><init>()V

    .line 427
    .line 428
    .line 429
    sput-object v0, Ll/uqb0;->J:Ll/ja5;

    .line 430
    .line 431
    new-instance v0, Ll/yb5;

    .line 432
    .line 433
    invoke-direct {v0}, Ll/yb5;-><init>()V

    .line 434
    .line 435
    .line 436
    sput-object v0, Ll/uqb0;->M:Ll/yb5;

    .line 437
    .line 438
    new-instance v0, Lcom/p1/mobile/putong/api/api/OtherApi;

    .line 439
    .line 440
    invoke-direct {v0}, Lcom/p1/mobile/putong/api/api/OtherApi;-><init>()V

    .line 441
    .line 442
    .line 443
    sput-object v0, Ll/uqb0;->N:Lcom/p1/mobile/putong/api/api/OtherApi;

    .line 444
    .line 445
    new-instance v0, Ll/l2;

    .line 446
    .line 447
    invoke-direct {v0}, Ll/l2;-><init>()V

    .line 448
    .line 449
    .line 450
    sput-object v0, Ll/uqb0;->Q:Ll/l2;

    .line 451
    .line 452
    new-instance v0, Lcom/p1/mobile/putong/api/api/PaymentApi;

    .line 453
    .line 454
    invoke-direct {v0}, Lcom/p1/mobile/putong/api/api/PaymentApi;-><init>()V

    .line 455
    .line 456
    .line 457
    sput-object v0, Ll/uqb0;->T:Lcom/p1/mobile/putong/api/api/PaymentApi;

    .line 458
    .line 459
    new-instance v0, Ll/w1w;

    .line 460
    .line 461
    sget-object v2, Ll/uqb0;->I:Ll/xi5;

    .line 462
    .line 463
    invoke-direct {v0, v2}, Ll/w1w;-><init>(Ll/xi5;)V

    .line 464
    .line 465
    .line 466
    sput-object v0, Ll/uqb0;->U:Ll/w1w;

    .line 467
    .line 468
    new-instance v0, Ll/mk5;

    .line 469
    .line 470
    sget-object v2, Ll/uqb0;->I:Ll/xi5;

    .line 471
    .line 472
    invoke-direct {v0, v2}, Ll/mk5;-><init>(Ll/xi5;)V

    .line 473
    .line 474
    .line 475
    sput-object v0, Ll/uqb0;->V:Ll/mk5;

    .line 476
    .line 477
    new-instance v0, Ll/tl8;

    .line 478
    .line 479
    sget-object v2, Ll/uqb0;->I:Ll/xi5;

    .line 480
    .line 481
    invoke-direct {v0, v2}, Ll/tl8;-><init>(Ll/xi5;)V

    .line 482
    .line 483
    .line 484
    sput-object v0, Ll/uqb0;->O:Ll/tl8;

    .line 485
    .line 486
    new-instance v0, Ll/xk9;

    .line 487
    .line 488
    sget-object v2, Ll/uqb0;->I:Ll/xi5;

    .line 489
    .line 490
    invoke-direct {v0, v2}, Ll/xk9;-><init>(Ll/xi5;)V

    .line 491
    .line 492
    .line 493
    sput-object v0, Ll/uqb0;->P:Ll/xk9;

    .line 494
    .line 495
    new-instance v0, Ll/d07;

    .line 496
    .line 497
    sget-object v2, Ll/uqb0;->I:Ll/xi5;

    .line 498
    .line 499
    invoke-direct {v0, v2}, Ll/d07;-><init>(Ll/xi5;)V

    .line 500
    .line 501
    .line 502
    sput-object v0, Ll/uqb0;->p0:Ll/d07;

    .line 503
    .line 504
    new-instance v0, Ll/dk50;

    .line 505
    .line 506
    invoke-direct {v0}, Ll/dk50;-><init>()V

    .line 507
    .line 508
    .line 509
    sput-object v0, Ll/uqb0;->W:Ll/dk50;

    .line 510
    .line 511
    new-instance v0, Ll/hj5;

    .line 512
    .line 513
    invoke-direct {v0}, Ll/hj5;-><init>()V

    .line 514
    .line 515
    .line 516
    sput-object v0, Ll/uqb0;->X:Ll/hj5;

    .line 517
    .line 518
    sget-object v0, Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;->COMMON:Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;

    .line 519
    .line 520
    const/4 v2, 0x2

    .line 521
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi;->H(Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;I)V

    .line 522
    .line 523
    .line 524
    new-instance v0, Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi;

    .line 525
    .line 526
    invoke-direct {v0}, Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi;-><init>()V

    .line 527
    .line 528
    .line 529
    sput-object v0, Ll/uqb0;->Y:Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi;

    .line 530
    .line 531
    new-instance v0, Ll/a4j;

    .line 532
    .line 533
    invoke-direct {v0}, Ll/a4j;-><init>()V

    .line 534
    .line 535
    .line 536
    sput-object v0, Ll/uqb0;->Z:Ll/a4j;

    .line 537
    .line 538
    new-instance v0, Ll/aqe0;

    .line 539
    .line 540
    invoke-direct {v0}, Ll/aqe0;-><init>()V

    .line 541
    .line 542
    .line 543
    sput-object v0, Ll/uqb0;->R:Ll/s5m;

    .line 544
    .line 545
    new-instance v0, Ll/a70;

    .line 546
    .line 547
    invoke-direct {v0}, Ll/a70;-><init>()V

    .line 548
    .line 549
    .line 550
    sput-object v0, Ll/uqb0;->S:Ll/a70;

    .line 551
    .line 552
    sget-object v0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->BaseApi:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 553
    .line 554
    sget-object v2, Lcom/p1/mobile/putong/util/launch/LaunchStep;->BaseApiV2:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 555
    .line 556
    invoke-static {v0, v2}, Ll/uqi;->e(Lcom/p1/mobile/putong/util/launch/LaunchStep;Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 557
    .line 558
    .line 559
    invoke-static {}, Ll/rsh0;->e()Ll/rsh0;

    .line 560
    .line 561
    .line 562
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 563
    .line 564
    invoke-static {v0}, Ll/rsh0;->f(Landroid/content/Context;)V

    .line 565
    .line 566
    .line 567
    new-instance v0, Ll/uc80;

    .line 568
    .line 569
    invoke-direct {v0}, Ll/uc80;-><init>()V

    .line 570
    .line 571
    .line 572
    sput-object v0, Ll/uqb0;->F:Ll/uc80;

    .line 573
    .line 574
    invoke-virtual {p0}, Ll/uqb0;->W0()V

    .line 575
    .line 576
    .line 577
    :try_start_5
    invoke-virtual {p0}, Ll/uqb0;->I0()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_4

    .line 578
    .line 579
    .line 580
    goto :goto_6

    .line 581
    :catch_4
    move-exception v0

    .line 582
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->g(Ljava/lang/Throwable;)V

    .line 583
    .line 584
    .line 585
    :goto_6
    invoke-static {}, Lcom/p1/mobile/android/app/App;->h()Z

    .line 586
    .line 587
    .line 588
    move-result v0

    .line 589
    if-eqz v0, :cond_5

    .line 590
    .line 591
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 592
    .line 593
    new-instance v2, Ll/oqb0;

    .line 594
    .line 595
    invoke-direct {v2}, Ll/oqb0;-><init>()V

    .line 596
    .line 597
    .line 598
    const-wide/16 v4, 0x64

    .line 599
    .line 600
    invoke-static {v0, v2, v4, v5}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 601
    .line 602
    .line 603
    :cond_5
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 604
    .line 605
    new-instance v2, Ll/pqb0;

    .line 606
    .line 607
    invoke-direct {v2}, Ll/pqb0;-><init>()V

    .line 608
    .line 609
    .line 610
    const-wide/16 v4, 0x3e8

    .line 611
    .line 612
    invoke-static {v0, v2, v4, v5}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 613
    .line 614
    .line 615
    sget-object v0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->BaseApiV2:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 616
    .line 617
    sget-object v2, Lcom/p1/mobile/putong/util/launch/LaunchStep;->ImageLoad:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 618
    .line 619
    invoke-static {v0, v2}, Ll/uqi;->e(Lcom/p1/mobile/putong/util/launch/LaunchStep;Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 620
    .line 621
    .line 622
    new-instance v0, Ll/fsb0;

    .line 623
    .line 624
    iget-object v4, p0, Ll/uqb0;->r:Ll/rg50;

    .line 625
    .line 626
    invoke-virtual {v4}, Ll/rg50;->v()Ll/rg50$b;

    .line 627
    .line 628
    .line 629
    move-result-object v4

    .line 630
    invoke-direct {v0, v4}, Ll/fsb0;-><init>(Ll/rg50$b;)V

    .line 631
    .line 632
    .line 633
    sput-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 634
    .line 635
    sget-object v0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->LocationMap:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 636
    .line 637
    invoke-static {v2, v0}, Ll/uqi;->e(Lcom/p1/mobile/putong/util/launch/LaunchStep;Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 638
    .line 639
    .line 640
    invoke-static {}, Ll/uqb0;->d1()V

    .line 641
    .line 642
    .line 643
    invoke-static {}, Ll/yp50;->f()V

    .line 644
    .line 645
    .line 646
    invoke-static {}, Ll/nsb0;->j()V

    .line 647
    .line 648
    .line 649
    invoke-static {}, Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon;->b()V

    .line 650
    .line 651
    .line 652
    invoke-static {}, Ll/tcn;->f()V

    .line 653
    .line 654
    .line 655
    sget-object v2, Lcom/p1/mobile/putong/util/launch/LaunchStep;->AbLocalInit:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 656
    .line 657
    invoke-static {v0, v2}, Ll/uqi;->e(Lcom/p1/mobile/putong/util/launch/LaunchStep;Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 658
    .line 659
    .line 660
    sget-object v0, Ll/uqb0;->X:Ll/hj5;

    .line 661
    .line 662
    invoke-virtual {v0}, Ll/jf00;->d()Lrx/c;

    .line 663
    .line 664
    .line 665
    move-result-object v0

    .line 666
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 667
    .line 668
    .line 669
    move-result-object v2

    .line 670
    invoke-virtual {v0, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 671
    .line 672
    .line 673
    move-result-object v0

    .line 674
    new-instance v2, Ll/qqb0;

    .line 675
    .line 676
    invoke-direct {v2}, Ll/qqb0;-><init>()V

    .line 677
    .line 678
    .line 679
    new-instance v4, Ll/rqb0;

    .line 680
    .line 681
    invoke-direct {v4}, Ll/rqb0;-><init>()V

    .line 682
    .line 683
    .line 684
    invoke-static {v2, v4}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 685
    .line 686
    .line 687
    move-result-object v2

    .line 688
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 689
    .line 690
    .line 691
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->x()V

    .line 692
    .line 693
    .line 694
    invoke-virtual {p0}, Ll/uqb0;->B0()V

    .line 695
    .line 696
    .line 697
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 698
    .line 699
    invoke-interface {v0}, Ll/bn5;->signedIn_()Z

    .line 700
    .line 701
    .line 702
    move-result v0

    .line 703
    if-eqz v0, :cond_6

    .line 704
    .line 705
    const/4 v0, 0x0

    .line 706
    sput-boolean v0, Ll/uqb0;->n0:Z

    .line 707
    .line 708
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 709
    .line 710
    invoke-interface {v0}, Ll/bn5;->userId()Ljava/lang/String;

    .line 711
    .line 712
    .line 713
    move-result-object v0

    .line 714
    invoke-static {}, Ll/nsb0;->m()Ll/vxd0;

    .line 715
    .line 716
    .line 717
    move-result-object v1

    .line 718
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 719
    .line 720
    .line 721
    move-result-object v1

    .line 722
    check-cast v1, Ljava/lang/Integer;

    .line 723
    .line 724
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 725
    .line 726
    .line 727
    move-result v1

    .line 728
    invoke-static {v0, v1}, Ll/nsb0;->v(Ljava/lang/String;I)V

    .line 729
    .line 730
    .line 731
    invoke-static {}, Ll/wiw;->i()V

    .line 732
    .line 733
    .line 734
    sget-object v0, Ll/uqb0;->Q:Ll/l2;

    .line 735
    .line 736
    invoke-virtual {v0}, Ll/l2;->a0()Lrx/c;

    .line 737
    .line 738
    .line 739
    goto :goto_7

    .line 740
    :cond_6
    sput-boolean v1, Ll/uqb0;->n0:Z

    .line 741
    .line 742
    sget-object v0, Ll/uqb0;->Q:Ll/l2;

    .line 743
    .line 744
    invoke-virtual {v0}, Ll/l2;->T()V

    .line 745
    .line 746
    .line 747
    invoke-static {}, Ll/wiw;->i()V

    .line 748
    .line 749
    .line 750
    :goto_7
    invoke-static {}, Ll/a2j0;->h()J

    .line 751
    .line 752
    .line 753
    move-result-wide v0

    .line 754
    sput-wide v0, Ll/uqb0;->g0:J

    .line 755
    .line 756
    new-instance v0, Ll/pf60;

    .line 757
    .line 758
    const-string v1, "android.permission.READ_PHONE_STATE"

    .line 759
    .line 760
    filled-new-array {v1}, [Ljava/lang/String;

    .line 761
    .line 762
    .line 763
    move-result-object v2

    .line 764
    invoke-static {v2}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->b([Ljava/lang/String;)Z

    .line 765
    .line 766
    .line 767
    move-result v2

    .line 768
    const-string v4, ""

    .line 769
    .line 770
    if-eqz v2, :cond_7

    .line 771
    .line 772
    invoke-static {}, Ll/qzd;->e()Ljava/lang/String;

    .line 773
    .line 774
    .line 775
    move-result-object v2

    .line 776
    goto :goto_8

    .line 777
    :cond_7
    move-object v2, v4

    .line 778
    :goto_8
    const-string v5, "imei"

    .line 779
    .line 780
    invoke-direct {v0, v5, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 781
    .line 782
    .line 783
    new-instance v2, Ll/pf60;

    .line 784
    .line 785
    filled-new-array {v1}, [Ljava/lang/String;

    .line 786
    .line 787
    .line 788
    move-result-object v5

    .line 789
    invoke-static {v5}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->b([Ljava/lang/String;)Z

    .line 790
    .line 791
    .line 792
    move-result v5

    .line 793
    if-eqz v5, :cond_8

    .line 794
    .line 795
    invoke-static {}, Ll/qzd;->f()Ljava/lang/String;

    .line 796
    .line 797
    .line 798
    move-result-object v5

    .line 799
    goto :goto_9

    .line 800
    :cond_8
    move-object v5, v4

    .line 801
    :goto_9
    const-string v6, "imei2"

    .line 802
    .line 803
    invoke-direct {v2, v6, v5}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 804
    .line 805
    .line 806
    new-instance v5, Ll/pf60;

    .line 807
    .line 808
    const-string v6, "oaid"

    .line 809
    .line 810
    invoke-static {}, Ll/hb00;->b()Ljava/lang/String;

    .line 811
    .line 812
    .line 813
    move-result-object v7

    .line 814
    invoke-direct {v5, v6, v7}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 815
    .line 816
    .line 817
    new-instance v6, Ll/pf60;

    .line 818
    .line 819
    filled-new-array {v1}, [Ljava/lang/String;

    .line 820
    .line 821
    .line 822
    move-result-object v1

    .line 823
    invoke-static {v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->b([Ljava/lang/String;)Z

    .line 824
    .line 825
    .line 826
    move-result v1

    .line 827
    if-eqz v1, :cond_9

    .line 828
    .line 829
    invoke-static {}, Ll/qzd;->g()Ljava/lang/String;

    .line 830
    .line 831
    .line 832
    move-result-object v1

    .line 833
    goto :goto_a

    .line 834
    :cond_9
    move-object v1, v4

    .line 835
    :goto_a
    const-string v7, "meid"

    .line 836
    .line 837
    invoke-direct {v6, v7, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 838
    .line 839
    .line 840
    new-instance v1, Ll/pf60;

    .line 841
    .line 842
    const-string v7, "androidid"

    .line 843
    .line 844
    invoke-static {}, Ll/qzd;->b()Ljava/lang/String;

    .line 845
    .line 846
    .line 847
    move-result-object v8

    .line 848
    invoke-direct {v1, v7, v8}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 849
    .line 850
    .line 851
    filled-new-array {v0, v2, v5, v6, v1}, [Ll/pf60;

    .line 852
    .line 853
    .line 854
    move-result-object v0

    .line 855
    const-string v1, "e_backend_application_create"

    .line 856
    .line 857
    invoke-static {v1, v4, v0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 858
    .line 859
    .line 860
    invoke-static {}, Ll/umq0;->b()V

    .line 861
    .line 862
    .line 863
    new-instance v0, Ll/pf60;

    .line 864
    .line 865
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 866
    .line 867
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 868
    .line 869
    .line 870
    move-result-object v1

    .line 871
    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 872
    .line 873
    .line 874
    move-result-object v1

    .line 875
    iget v1, v1, Landroid/content/res/Configuration;->uiMode:I

    .line 876
    .line 877
    and-int/lit8 v1, v1, 0x30

    .line 878
    .line 879
    const/16 v2, 0x20

    .line 880
    .line 881
    if-ne v1, v2, :cond_a

    .line 882
    .line 883
    const-string v1, "on"

    .line 884
    .line 885
    goto :goto_b

    .line 886
    :cond_a
    const-string v1, "off"

    .line 887
    .line 888
    :goto_b
    const-string v2, "dark_mode_status"

    .line 889
    .line 890
    invoke-direct {v0, v2, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 891
    .line 892
    .line 893
    filled-new-array {v0}, [Ll/pf60;

    .line 894
    .line 895
    .line 896
    move-result-object v0

    .line 897
    const-string v1, "e_dark_mode_auth_status"

    .line 898
    .line 899
    invoke-static {v1, v4, v0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 900
    .line 901
    .line 902
    const-string v0, "fonts/Roboto-Medium.ttf"

    .line 903
    .line 904
    invoke-static {v0}, Ll/na00;->b(Ljava/lang/String;)V

    .line 905
    .line 906
    .line 907
    invoke-static {}, Ll/nqp0;->h()Ll/nqp0;

    .line 908
    .line 909
    .line 910
    move-result-object v0

    .line 911
    invoke-virtual {v0}, Ll/nqp0;->f()V

    .line 912
    .line 913
    .line 914
    invoke-static {}, Ll/nsb0;->p()V

    .line 915
    .line 916
    .line 917
    :try_start_6
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 918
    .line 919
    invoke-static {v0}, Ll/qu2;->s(Landroid/content/Context;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_5

    .line 920
    .line 921
    .line 922
    goto :goto_c

    .line 923
    :catch_5
    move-exception v0

    .line 924
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->g(Ljava/lang/Throwable;)V

    .line 925
    .line 926
    .line 927
    :goto_c
    sget-object v0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->AbLocalInit:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 928
    .line 929
    sget-object v1, Lcom/p1/mobile/putong/util/launch/LaunchStep;->RemoteLocalInit:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 930
    .line 931
    invoke-static {v0, v1}, Ll/uqi;->e(Lcom/p1/mobile/putong/util/launch/LaunchStep;Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 932
    .line 933
    .line 934
    invoke-static {}, Ll/uqb0;->G0()V

    .line 935
    .line 936
    .line 937
    invoke-static {}, Ll/uqb0;->E0()V

    .line 938
    .line 939
    .line 940
    invoke-static {}, Ll/ze60;->c()V

    .line 941
    .line 942
    .line 943
    sget-object v0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->PrivacyConfig:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 944
    .line 945
    invoke-static {v1, v0}, Ll/uqi;->e(Lcom/p1/mobile/putong/util/launch/LaunchStep;Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 946
    .line 947
    .line 948
    sget-object v1, Lcom/p1/mobile/putong/util/launch/LaunchStep;->MkParse:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 949
    .line 950
    invoke-static {v0, v1}, Ll/uqi;->e(Lcom/p1/mobile/putong/util/launch/LaunchStep;Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 951
    .line 952
    .line 953
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 954
    .line 955
    invoke-static {v0}, Ll/uc00;->a(Landroid/app/Application;)V

    .line 956
    .line 957
    .line 958
    sget-object v0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->AccountPluginInit:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 959
    .line 960
    invoke-static {v1, v0}, Ll/uqi;->e(Lcom/p1/mobile/putong/util/launch/LaunchStep;Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 961
    .line 962
    .line 963
    invoke-virtual {p0}, Ll/uqb0;->w0()V

    .line 964
    .line 965
    .line 966
    sget-object v1, Lcom/p1/mobile/putong/util/launch/LaunchStep;->PutongOnNext:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 967
    .line 968
    invoke-static {v0, v1}, Ll/uqi;->e(Lcom/p1/mobile/putong/util/launch/LaunchStep;Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 969
    .line 970
    .line 971
    sget-object v0, Ll/uqb0;->s0:Lrx/subjects/a;

    .line 972
    .line 973
    sget-object v2, Ll/uxj0;->a:Ll/uxj0;

    .line 974
    .line 975
    invoke-virtual {v0, v2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 976
    .line 977
    .line 978
    sget-object v0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->DiskCheck:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 979
    .line 980
    invoke-static {v1, v0}, Ll/uqi;->e(Lcom/p1/mobile/putong/util/launch/LaunchStep;Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 981
    .line 982
    .line 983
    new-instance v1, Ll/g5e$b;

    .line 984
    .line 985
    invoke-direct {v1}, Ll/g5e$b;-><init>()V

    .line 986
    .line 987
    .line 988
    const-wide/32 v4, 0x32000

    .line 989
    .line 990
    .line 991
    const-wide/16 v6, 0x1388

    .line 992
    .line 993
    invoke-virtual {v1, v4, v5, v6, v7}, Ll/g5e$b;->c(JJ)Ll/g5e$b;

    .line 994
    .line 995
    .line 996
    move-result-object v1

    .line 997
    new-instance v2, Ll/uqb0$b;

    .line 998
    .line 999
    invoke-direct {v2, p0}, Ll/uqb0$b;-><init>(Ll/uqb0;)V

    .line 1000
    .line 1001
    .line 1002
    invoke-virtual {v1, v2}, Ll/g5e$b;->a(Ll/f5e;)Ll/g5e$b;

    .line 1003
    .line 1004
    .line 1005
    move-result-object v1

    .line 1006
    invoke-virtual {v1}, Ll/g5e$b;->b()Ll/g5e;

    .line 1007
    .line 1008
    .line 1009
    move-result-object v1

    .line 1010
    invoke-virtual {v1}, Ll/g5e;->c()V

    .line 1011
    .line 1012
    .line 1013
    invoke-static {v0}, Ll/uqi;->d(Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 1014
    .line 1015
    .line 1016
    invoke-virtual {p0}, Ll/uqb0;->A0()V

    .line 1017
    .line 1018
    .line 1019
    invoke-virtual {p0}, Ll/uqb0;->F0()V

    .line 1020
    .line 1021
    .line 1022
    new-instance v0, Ll/bbm;

    .line 1023
    .line 1024
    invoke-direct {v0, v3}, Ll/bbm;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 1025
    .line 1026
    .line 1027
    sput-object v0, Ll/uqb0;->B0:Ll/bbm;

    .line 1028
    .line 1029
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 1030
    .line 1031
    invoke-virtual {v0, v1}, Ll/bbm;->k(Landroid/app/Application;)V

    .line 1032
    .line 1033
    .line 1034
    sget-object v0, Lcom/p1/mobile/putong/app/surveysparrow/SurveySparrowHelper;->INSTANCE:Lcom/p1/mobile/putong/app/surveysparrow/SurveySparrowHelper;

    .line 1035
    .line 1036
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/surveysparrow/SurveySparrowHelper;->n()V

    .line 1037
    .line 1038
    .line 1039
    sget-object v0, Lcom/tantan/library/svga/SVGALoader;->INSTANCE:Lcom/tantan/library/svga/SVGALoader;

    .line 1040
    .line 1041
    new-instance v1, Ll/uqb0$c;

    .line 1042
    .line 1043
    invoke-direct {v1, p0}, Ll/uqb0$c;-><init>(Ll/uqb0;)V

    .line 1044
    .line 1045
    .line 1046
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader;->setSvgaGlobalCall(Lcom/tantan/library/svga/SVGALoader$SvgaGlobalCall;)V

    .line 1047
    .line 1048
    .line 1049
    invoke-static {}, Ll/uqi;->h()V

    .line 1050
    .line 1051
    .line 1052
    sget-object p0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->PutongCreate:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 1053
    .line 1054
    invoke-static {p0}, Ll/uqi;->d(Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 1055
    .line 1056
    .line 1057
    return-void
.end method

.method public n()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->PutongAsyncCreate:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 2
    .line 3
    filled-new-array {v0}, [Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/uqi;->f([Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 8
    .line 9
    .line 10
    invoke-super {p0}, Lcom/p1/mobile/android/app/App;->n()V

    .line 11
    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 14
    .line 15
    invoke-static {v0}, Ll/qxi0;->a(Landroid/content/Context;)V

    .line 16
    .line 17
    .line 18
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 19
    .line 20
    invoke-static {v0}, Ll/hb00;->c(Landroid/content/Context;)V

    .line 21
    .line 22
    .line 23
    invoke-static {}, Ll/qzd;->a()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ll/uqb0;->j0()V

    .line 27
    .line 28
    .line 29
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 30
    .line 31
    invoke-static {p0}, Ll/q9c;->b(Landroid/content/Context;)V

    .line 32
    .line 33
    .line 34
    sget p0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 35
    .line 36
    const/16 v0, 0x1c

    .line 37
    .line 38
    if-lt p0, v0, :cond_0

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    invoke-static {}, Ll/hve0;->v()Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-eqz p0, :cond_1

    .line 46
    .line 47
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 48
    .line 49
    invoke-static {p0}, Ll/stv;->a(Landroid/app/Application;)V

    .line 50
    .line 51
    .line 52
    :cond_1
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/util/a;->a()V

    .line 53
    .line 54
    .line 55
    invoke-static {}, Ll/gk60;->a()V

    .line 56
    .line 57
    .line 58
    invoke-static {}, Ll/vyc0;->m()V

    .line 59
    .line 60
    .line 61
    sget-object p0, Ll/uqb0;->c0:Ll/bn5;

    .line 62
    .line 63
    if-eqz p0, :cond_2

    .line 64
    .line 65
    invoke-interface {p0}, Ll/bn5;->signedIn_()Z

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    if-nez p0, :cond_2

    .line 70
    .line 71
    invoke-static {}, Ll/r8f0;->f()Ll/r8f0;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 76
    .line 77
    invoke-virtual {p0, v0}, Ll/r8f0;->i(Landroid/content/Context;)V

    .line 78
    .line 79
    .line 80
    :cond_2
    :try_start_0
    const-class p0, Landroid/os/UserHandle;

    .line 81
    .line 82
    invoke-static {p0}, Ll/puc0;->k(Ljava/lang/Class;)Ll/puc0;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    const-string v0, "myUserId"

    .line 87
    .line 88
    invoke-virtual {p0, v0}, Ll/puc0;->b(Ljava/lang/String;)Ll/puc0;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-virtual {p0}, Ll/puc0;->h()Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    check-cast p0, Ljava/lang/Integer;

    .line 97
    .line 98
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    if-eqz v0, :cond_3

    .line 103
    .line 104
    const-string v0, "e_double_tantan_app"

    .line 105
    .line 106
    const-string v1, ""

    .line 107
    .line 108
    const/4 v2, 0x1

    .line 109
    new-array v2, v2, [Ll/pf60;

    .line 110
    .line 111
    const-string v3, "my_user_handler"

    .line 112
    .line 113
    invoke-static {v3, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    const/4 v3, 0x0

    .line 118
    aput-object p0, v2, v3

    .line 119
    .line 120
    invoke-static {v0, v1, v2}, Ll/i4g0;->B(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 121
    .line 122
    .line 123
    :catchall_0
    :cond_3
    sget-object p0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->PutongAsyncCreate:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 124
    .line 125
    invoke-static {p0}, Ll/uqi;->d(Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 126
    .line 127
    .line 128
    return-void
.end method

.method public final n0()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->AccountAfterCreate:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/util/launch/LaunchStep;->InitSignData:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 4
    .line 5
    filled-new-array {v0, v1}, [Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {v1}, Ll/uqi;->f([Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 10
    .line 11
    .line 12
    sget-object v1, Ll/uqb0;->j0:Ll/dg00;

    .line 13
    .line 14
    const-string v2, "account"

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Ll/dg00;->n(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v0}, Ll/uqi;->d(Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 20
    .line 21
    .line 22
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 23
    .line 24
    invoke-interface {v0}, Ll/bn5;->signedIn_()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    const/4 v1, 0x0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    sget-object v0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->InitOms:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 32
    .line 33
    filled-new-array {v0}, [Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-static {v2}, Ll/uqi;->f([Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 38
    .line 39
    .line 40
    invoke-static {}, Ll/uqb0;->C0()V

    .line 41
    .line 42
    .line 43
    sget-object v2, Lcom/p1/mobile/putong/util/launch/LaunchStep;->InitOtherModule:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 44
    .line 45
    invoke-static {v0, v2}, Ll/uqi;->e(Lcom/p1/mobile/putong/util/launch/LaunchStep;Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 46
    .line 47
    .line 48
    invoke-static {}, Ll/uqb0;->D0()V

    .line 49
    .line 50
    .line 51
    invoke-static {v2}, Ll/uqi;->d(Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v1}, Ll/uqb0;->l0(Z)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {v0}, Lrx/c;->toBlocking()Ll/o43;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    new-instance v1, Ll/fqb0;

    .line 63
    .line 64
    invoke-direct {v1, p0}, Ll/fqb0;-><init>(Ll/uqb0;)V

    .line 65
    .line 66
    .line 67
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {v0, p0}, Ll/o43;->f(Ll/bb50;)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_0
    sget-object p0, Ll/uqb0;->w0:Lrx/subjects/a;

    .line 76
    .line 77
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public o()V
    .locals 1

    .line 1
    invoke-static {}, Ll/duj0;->d()Ll/duj0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-class v0, Ljava/lang/OutOfMemoryError;

    .line 6
    .line 7
    filled-new-array {v0}, [Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ll/duj0;->h([Ljava/lang/Class;)V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Ll/duj0;->d()Ll/duj0;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    new-instance v0, Ll/mqb0;

    .line 19
    .line 20
    invoke-direct {v0}, Ll/mqb0;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v0}, Ll/duj0;->g(Ll/bmq;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final o0()V
    .locals 0

    .line 1
    return-void
.end method

.method public final w0()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/util/launch/LaunchStep;->InitAccountModule:Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 2
    .line 3
    filled-new-array {v0}, [Lcom/p1/mobile/putong/util/launch/LaunchStep;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/uqi;->f([Lcom/p1/mobile/putong/util/launch/LaunchStep;)V

    .line 8
    .line 9
    .line 10
    new-instance v0, Ll/bqb0;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/bqb0;-><init>(Ll/uqb0;)V

    .line 13
    .line 14
    .line 15
    invoke-static {v0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public x0()V
    .locals 0

    .line 1
    return-void
.end method
