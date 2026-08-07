.class public Ll/l3n0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static d:[Ljava/lang/String;

.field public static e:[Ljava/lang/String;


# instance fields
.field public final a:Ll/u1n0;

.field public b:Ll/kcg0;

.field public c:Ll/kcg0;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    const-string v0, "android.permission.RECORD_AUDIO"

    .line 2
    .line 3
    filled-new-array {v0}, [Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    sput-object v1, Ll/l3n0;->d:[Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {}, Ll/wzx;->k()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x0

    .line 14
    const/4 v3, 0x1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    new-array v1, v3, [Ljava/lang/String;

    .line 18
    .line 19
    aput-object v0, v1, v2

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 v1, 0x2

    .line 23
    new-array v1, v1, [Ljava/lang/String;

    .line 24
    .line 25
    aput-object v0, v1, v2

    .line 26
    .line 27
    const-string v0, "android.permission.READ_EXTERNAL_STORAGE"

    .line 28
    .line 29
    aput-object v0, v1, v3

    .line 30
    .line 31
    :goto_0
    sput-object v1, Ll/l3n0;->e:[Ljava/lang/String;

    .line 32
    .line 33
    return-void
.end method

.method public constructor <init>(Ll/u1n0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/l3n0;->a:Ll/u1n0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/l3n0;->l()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b(Ll/l3n0;Landroid/content/Context;Ljava/lang/String;JLjava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Ll/l3n0;->m(Landroid/content/Context;Ljava/lang/String;JLjava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic c(Ll/l3n0;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/l3n0;->o(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic d(Ll/l3n0;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/l3n0;->k(I)V

    return-void
.end method

.method public static synthetic e(Ll/l3n0;Landroid/content/Context;Ljava/lang/String;JLjava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/l3n0;->n(Landroid/content/Context;Ljava/lang/String;JLjava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public final f(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2

    .line 1
    invoke-static {}, Ll/rum0;->c()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const v1, 0x186ab

    .line 18
    .line 19
    .line 20
    invoke-interface {p0, v1}, Ll/r97;->C(I)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-nez p0, :cond_1

    .line 25
    .line 26
    return v0

    .line 27
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-interface {p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Zo()Ll/nam;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-interface {p0}, Ll/nam;->b()Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-eqz p0, :cond_2

    .line 40
    .line 41
    const-string p0, "\u5f53\u524d\u6b63\u5728\u8bed\u804a\u4e2d\uff0c\u65e0\u6cd5\u8bed\u97f3\u7535\u8bdd"

    .line 42
    .line 43
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return v0

    .line 47
    :cond_2
    instance-of p0, p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 48
    .line 49
    if-eqz p0, :cond_3

    .line 50
    .line 51
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    if-nez p0, :cond_3

    .line 56
    .line 57
    move-object p0, p1

    .line 58
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 59
    .line 60
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->B0()Ll/u1z;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p0}, Ll/j3z;->g0()Ll/iam;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    check-cast p0, Ll/d3z;

    .line 69
    .line 70
    invoke-virtual {p0}, Ll/d3z;->u0()Ll/azy;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result p3

    .line 78
    if-eqz p3, :cond_3

    .line 79
    .line 80
    invoke-virtual {p0}, Ll/azy;->d0()Z

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    if-eqz p0, :cond_3

    .line 85
    .line 86
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->C5:I

    .line 87
    .line 88
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 89
    .line 90
    .line 91
    return v0

    .line 92
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-interface {p0, p2}, Ll/r97;->z(Ljava/lang/String;)Z

    .line 101
    .line 102
    .line 103
    move-result p0

    .line 104
    if-eqz p0, :cond_4

    .line 105
    .line 106
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->F4:I

    .line 107
    .line 108
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 109
    .line 110
    .line 111
    return v0

    .line 112
    :cond_4
    invoke-static {}, Ll/o3z;->g()Ll/o3z;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    invoke-virtual {p0, p2}, Ll/o3z;->e(Ljava/lang/String;)Z

    .line 117
    .line 118
    .line 119
    move-result p0

    .line 120
    if-eqz p0, :cond_5

    .line 121
    .line 122
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->G4:I

    .line 123
    .line 124
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 125
    .line 126
    .line 127
    return v0

    .line 128
    :cond_5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    invoke-virtual {p0}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->of()Z

    .line 137
    .line 138
    .line 139
    move-result p0

    .line 140
    if-eqz p0, :cond_6

    .line 141
    .line 142
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->C3:I

    .line 143
    .line 144
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 145
    .line 146
    .line 147
    return v0

    .line 148
    :cond_6
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 149
    .line 150
    invoke-static {p0}, Lcom/p1/mobile/putong/api/api/Network;->isConnected(Landroid/content/Context;)Z

    .line 151
    .line 152
    .line 153
    move-result p0

    .line 154
    if-nez p0, :cond_7

    .line 155
    .line 156
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->B2:I

    .line 157
    .line 158
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 159
    .line 160
    .line 161
    return v0

    .line 162
    :cond_7
    invoke-static {}, Ll/w1n0;->e()Z

    .line 163
    .line 164
    .line 165
    move-result p0

    .line 166
    if-eqz p0, :cond_8

    .line 167
    .line 168
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->Z6:I

    .line 169
    .line 170
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 171
    .line 172
    .line 173
    return v0

    .line 174
    :cond_8
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 175
    .line 176
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 177
    .line 178
    invoke-virtual {p0, p2}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 179
    .line 180
    .line 181
    move-result-object p0

    .line 182
    if-nez p0, :cond_9

    .line 183
    .line 184
    return v0

    .line 185
    :cond_9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->unilateralBlock()Z

    .line 186
    .line 187
    .line 188
    move-result p0

    .line 189
    if-eqz p0, :cond_a

    .line 190
    .line 191
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->p5:I

    .line 192
    .line 193
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 194
    .line 195
    .line 196
    return v0

    .line 197
    :cond_a
    instance-of p0, p1, Lcom/p1/mobile/android/app/Act;

    .line 198
    .line 199
    const/4 p2, 0x1

    .line 200
    if-eqz p0, :cond_b

    .line 201
    .line 202
    sget-object p0, Ll/l3n0;->e:[Ljava/lang/String;

    .line 203
    .line 204
    invoke-static {p0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->b([Ljava/lang/String;)Z

    .line 205
    .line 206
    .line 207
    move-result p3

    .line 208
    if-nez p3, :cond_b

    .line 209
    .line 210
    invoke-static {}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->c()Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 211
    .line 212
    .line 213
    move-result-object p3

    .line 214
    invoke-virtual {p3, p0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->r([Ljava/lang/String;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 215
    .line 216
    .line 217
    move-result-object p0

    .line 218
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->w(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 219
    .line 220
    .line 221
    move-result-object p0

    .line 222
    new-instance p3, Ll/k3n0;

    .line 223
    .line 224
    invoke-direct {p3}, Ll/k3n0;-><init>()V

    .line 225
    .line 226
    .line 227
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->n(Ll/y20;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 228
    .line 229
    .line 230
    move-result-object p0

    .line 231
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->u(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 232
    .line 233
    .line 234
    move-result-object p0

    .line 235
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 236
    .line 237
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->i(Landroid/app/Activity;)V

    .line 238
    .line 239
    .line 240
    return v0

    .line 241
    :cond_b
    invoke-static {}, Ll/jpd0;->c()Z

    .line 242
    .line 243
    .line 244
    move-result p0

    .line 245
    if-nez p0, :cond_c

    .line 246
    .line 247
    invoke-static {}, Ll/jpd0;->d()V

    .line 248
    .line 249
    .line 250
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->l7:I

    .line 251
    .line 252
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 253
    .line 254
    .line 255
    return v0

    .line 256
    :cond_c
    return p2
.end method

.method public g(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 8

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/l3n0;->f(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget-object p1, Ll/xzm0;->h:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/pb1;->e(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    return p0

    .line 18
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 19
    .line 20
    .line 21
    move-result-wide v4

    .line 22
    invoke-static {}, Ll/tl8;->M()Lcom/p1/mobile/putong/data/Device;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Device;->identifier:Ljava/lang/String;

    .line 27
    .line 28
    invoke-static {p2, p3, v0}, Ll/avm0;->h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v7

    .line 32
    new-instance v0, Ll/i3n0;

    .line 33
    .line 34
    move-object v1, p0

    .line 35
    move-object v2, p1

    .line 36
    move-object v3, p2

    .line 37
    move-object v6, p3

    .line 38
    invoke-direct/range {v0 .. v6}, Ll/i3n0;-><init>(Ll/l3n0;Landroid/content/Context;Ljava/lang/String;JLjava/lang/String;)V

    .line 39
    .line 40
    .line 41
    move-object p0, v0

    .line 42
    new-instance v0, Ll/j3n0;

    .line 43
    .line 44
    invoke-direct/range {v0 .. v5}, Ll/j3n0;-><init>(Ll/l3n0;Landroid/content/Context;Ljava/lang/String;J)V

    .line 45
    .line 46
    .line 47
    invoke-static {p0, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {v7, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 52
    .line 53
    .line 54
    const/4 p0, 0x1

    .line 55
    return p0
.end method

.method public final h(Landroid/content/Context;Ljava/lang/String;JLjava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 2

    .line 1
    iget-object v0, p6, Lcom/p1/mobile/putong/data/Envelope;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 2
    .line 3
    iget v0, v0, Lcom/p1/mobile/putong/data/Meta;->code:I

    .line 4
    .line 5
    const/16 v1, 0xc8

    .line 6
    .line 7
    if-eq v0, v1, :cond_0

    .line 8
    .line 9
    move-object p5, p6

    .line 10
    const/4 p6, 0x0

    .line 11
    invoke-virtual/range {p0 .. p6}, Ll/l3n0;->i(Landroid/content/Context;Ljava/lang/String;JLcom/p1/mobile/putong/data/Envelope;Ljava/lang/Throwable;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    move-object p6, p5

    .line 16
    new-instance p1, Ll/azm0;

    .line 17
    .line 18
    invoke-direct {p1}, Ll/azm0;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object p2, p1, Ll/azm0;->b:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 24
    .line 25
    .line 26
    move-result-object p3

    .line 27
    invoke-interface {p3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p3

    .line 31
    iput-object p3, p1, Ll/azm0;->a:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {}, Ll/tl8;->M()Lcom/p1/mobile/putong/data/Device;

    .line 34
    .line 35
    .line 36
    move-result-object p3

    .line 37
    iget-object p3, p3, Lcom/p1/mobile/putong/data/Device;->identifier:Ljava/lang/String;

    .line 38
    .line 39
    iput-object p3, p1, Ll/azm0;->d:Ljava/lang/String;

    .line 40
    .line 41
    iput-object p6, p1, Ll/azm0;->m:Ljava/lang/String;

    .line 42
    .line 43
    iput-object p2, p1, Ll/azm0;->n:Ljava/lang/String;

    .line 44
    .line 45
    const/4 p3, 0x1

    .line 46
    iput-boolean p3, p1, Ll/azm0;->o:Z

    .line 47
    .line 48
    iget-object p4, p0, Ll/l3n0;->a:Ll/u1n0;

    .line 49
    .line 50
    invoke-virtual {p4, p1}, Ll/u1n0;->p(Ll/azm0;)V

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Ll/l3n0;->a:Ll/u1n0;

    .line 54
    .line 55
    invoke-virtual {p0, p3}, Ll/u1n0;->u(I)V

    .line 56
    .line 57
    .line 58
    invoke-static {p2}, Ll/qzm0;->j(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public final i(Landroid/content/Context;Ljava/lang/String;JLcom/p1/mobile/putong/data/Envelope;Ljava/lang/Throwable;)V
    .locals 7

    .line 1
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Ll/xzm0;->h:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ll/pb1;->e(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    if-eqz p6, :cond_2

    .line 12
    .line 13
    instance-of p1, p6, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 18
    .line 19
    .line 20
    move-result-object p3

    .line 21
    invoke-virtual {p3}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 22
    .line 23
    .line 24
    move-result-object p3

    .line 25
    move-object p4, p6

    .line 26
    check-cast p4, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 27
    .line 28
    invoke-interface {p3, p4}, Ll/r97;->L1(Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;)Z

    .line 29
    .line 30
    .line 31
    move-result p3

    .line 32
    if-eqz p3, :cond_0

    .line 33
    .line 34
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->j7:I

    .line 35
    .line 36
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    if-eqz p1, :cond_1

    .line 41
    .line 42
    new-instance p1, Lcom/p1/mobile/putong/core/data/ChatHeatActionData;

    .line 43
    .line 44
    sget-object p3, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;->CHECK:Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 45
    .line 46
    new-array p4, p0, [Ll/pf60;

    .line 47
    .line 48
    invoke-direct {p1, p2, p3, p0, p4}, Lcom/p1/mobile/putong/core/data/ChatHeatActionData;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;Z[Ll/pf60;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p1, p6}, Lcom/p1/mobile/putong/core/data/ChatHeatActionData;->setThrowable(Ljava/lang/Throwable;)V

    .line 52
    .line 53
    .line 54
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 55
    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->M1:Ll/cn7;

    .line 57
    .line 58
    iget-object p0, p0, Ll/cn7;->S:Lrx/subjects/b;

    .line 59
    .line 60
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_1
    invoke-static {p6}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_2
    if-eqz p5, :cond_7

    .line 69
    .line 70
    iget-object p6, p5, Lcom/p1/mobile/putong/data/Envelope;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 71
    .line 72
    iget p6, p6, Lcom/p1/mobile/putong/data/Meta;->code:I

    .line 73
    .line 74
    const/16 v0, 0x4e21

    .line 75
    .line 76
    if-ne p6, v0, :cond_3

    .line 77
    .line 78
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->Y6:I

    .line 79
    .line 80
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_3
    const/16 v0, 0xc9

    .line 85
    .line 86
    if-ne p6, v0, :cond_5

    .line 87
    .line 88
    const-class p6, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 89
    .line 90
    invoke-virtual {p5, p6}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 95
    .line 96
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreData;->messages:Ljava/util/List;

    .line 97
    .line 98
    invoke-interface {v0, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    move-object v0, p0

    .line 103
    check-cast v0, Lcom/p1/mobile/putong/core/data/Message;

    .line 104
    .line 105
    instance-of p0, p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 106
    .line 107
    if-eqz p0, :cond_4

    .line 108
    .line 109
    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 110
    .line 111
    iget-object p0, p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 112
    .line 113
    invoke-virtual {p0, v0}, Ll/clz;->X6(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 114
    .line 115
    .line 116
    :cond_4
    invoke-virtual {p5, p6}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    check-cast p0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 121
    .line 122
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->messages:Ljava/util/List;

    .line 123
    .line 124
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 125
    .line 126
    .line 127
    move-result p0

    .line 128
    if-nez p0, :cond_7

    .line 129
    .line 130
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 131
    .line 132
    .line 133
    move-result-wide p0

    .line 134
    sub-long v5, p0, p3

    .line 135
    .line 136
    const-string v1, "p_chat_view"

    .line 137
    .line 138
    const-string v2, "success"

    .line 139
    .line 140
    const/4 v4, 0x1

    .line 141
    move-object v3, p2

    .line 142
    invoke-static/range {v0 .. v6}, Ll/m600;->g(Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IJ)V

    .line 143
    .line 144
    .line 145
    return-void

    .line 146
    :cond_5
    const p0, 0x9d6d

    .line 147
    .line 148
    .line 149
    if-ne p6, p0, :cond_6

    .line 150
    .line 151
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->p5:I

    .line 152
    .line 153
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 154
    .line 155
    .line 156
    return-void

    .line 157
    :cond_6
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->C2:I

    .line 158
    .line 159
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 160
    .line 161
    .line 162
    :cond_7
    return-void
.end method

.method public j(Lcom/p1/mobile/putong/core/data/VoiceCallStatus;Lcom/p1/mobile/putong/data/PushMessageCustom;)V
    .locals 5

    .line 1
    const-string v0, "calling"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ll/qzm0;->h()Ll/qzm0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string p1, "PushInitErrorStatus"

    .line 14
    .line 15
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/PushMessageCustom;->toJson()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-virtual {p0, p1, p2}, Ll/qzm0;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    iget-object v1, p2, Lcom/p1/mobile/putong/data/PushMessageCustom;->callee:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v2, p0, Ll/l3n0;->a:Ll/u1n0;

    .line 26
    .line 27
    invoke-virtual {v2}, Ll/u1n0;->f()Ll/azm0;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    iget-object v2, v2, Ll/azm0;->b:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    const-string v2, "busy"

    .line 38
    .line 39
    if-nez v1, :cond_2

    .line 40
    .line 41
    new-instance v1, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 44
    .line 45
    .line 46
    iget-object v3, p0, Ll/l3n0;->a:Ll/u1n0;

    .line 47
    .line 48
    invoke-virtual {v3}, Ll/u1n0;->f()Ll/azm0;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    invoke-virtual {v3}, Ll/azm0;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    const-string v3, "currentState:"

    .line 60
    .line 61
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    iget-object v3, p0, Ll/l3n0;->a:Ll/u1n0;

    .line 65
    .line 66
    invoke-virtual {v3}, Ll/u1n0;->i()I

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v3, "messageDetail:"

    .line 74
    .line 75
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/PushMessageCustom;->toJson()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    if-eqz p1, :cond_1

    .line 90
    .line 91
    invoke-static {}, Ll/qzm0;->h()Ll/qzm0;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    const-string v0, "RepeatCallingPush"

    .line 96
    .line 97
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    invoke-virtual {p1, v0, v1}, Ll/qzm0;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    iget-object p0, p0, Ll/l3n0;->a:Ll/u1n0;

    .line 105
    .line 106
    invoke-virtual {p0}, Ll/u1n0;->f()Ll/azm0;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    iget-object p0, p0, Ll/azm0;->m:Ljava/lang/String;

    .line 111
    .line 112
    invoke-static {p2, v2, p0}, Ll/avm0;->g(Lcom/p1/mobile/putong/data/PushMessageCustom;Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    return-void

    .line 116
    :cond_1
    invoke-static {}, Ll/qzm0;->h()Ll/qzm0;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    const-string p1, "RepeatErrorCallPush"

    .line 121
    .line 122
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p2

    .line 126
    invoke-virtual {p0, p1, p2}, Ll/qzm0;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    return-void

    .line 130
    :cond_2
    invoke-static {}, Ll/qzm0;->h()Ll/qzm0;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    const-string v1, "CallerStatusExchange"

    .line 135
    .line 136
    invoke-virtual {p2}, Lcom/google/protobuf/nano/MessageNano;->toString()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v3

    .line 140
    invoke-virtual {v0, v1, v3}, Ll/qzm0;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 148
    .line 149
    .line 150
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 151
    .line 152
    .line 153
    move-result v1

    .line 154
    const/4 v3, 0x2

    .line 155
    const/4 v4, -0x1

    .line 156
    sparse-switch v1, :sswitch_data_0

    .line 157
    .line 158
    .line 159
    goto :goto_0

    .line 160
    :sswitch_0
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 161
    .line 162
    .line 163
    move-result v0

    .line 164
    if-nez v0, :cond_3

    .line 165
    .line 166
    goto :goto_0

    .line 167
    :cond_3
    const/4 v4, 0x3

    .line 168
    goto :goto_0

    .line 169
    :sswitch_1
    const-string v1, "rejected"

    .line 170
    .line 171
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    move-result v0

    .line 175
    if-nez v0, :cond_4

    .line 176
    .line 177
    goto :goto_0

    .line 178
    :cond_4
    move v4, v3

    .line 179
    goto :goto_0

    .line 180
    :sswitch_2
    const-string v1, "finished"

    .line 181
    .line 182
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 183
    .line 184
    .line 185
    move-result v0

    .line 186
    if-nez v0, :cond_5

    .line 187
    .line 188
    goto :goto_0

    .line 189
    :cond_5
    const/4 v4, 0x1

    .line 190
    goto :goto_0

    .line 191
    :sswitch_3
    const-string v1, "accepted"

    .line 192
    .line 193
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 194
    .line 195
    .line 196
    move-result v0

    .line 197
    if-nez v0, :cond_6

    .line 198
    .line 199
    goto :goto_0

    .line 200
    :cond_6
    const/4 v4, 0x0

    .line 201
    :goto_0
    packed-switch v4, :pswitch_data_0

    .line 202
    .line 203
    .line 204
    return-void

    .line 205
    :pswitch_0
    iget-object p0, p0, Ll/l3n0;->a:Ll/u1n0;

    .line 206
    .line 207
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object p1

    .line 211
    invoke-virtual {p0, p1}, Ll/u1n0;->e(Ljava/lang/String;)V

    .line 212
    .line 213
    .line 214
    return-void

    .line 215
    :pswitch_1
    new-instance p1, Ll/azm0;

    .line 216
    .line 217
    invoke-direct {p1}, Ll/azm0;-><init>()V

    .line 218
    .line 219
    .line 220
    iget-object v0, p2, Lcom/p1/mobile/putong/data/PushMessageCustom;->id:Ljava/lang/String;

    .line 221
    .line 222
    iput-object v0, p1, Ll/azm0;->e:Ljava/lang/String;

    .line 223
    .line 224
    iget-object v0, p2, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelNameV2:Ljava/lang/String;

    .line 225
    .line 226
    iput-object v0, p1, Ll/azm0;->h:Ljava/lang/String;

    .line 227
    .line 228
    iget-object v0, p2, Lcom/p1/mobile/putong/data/PushMessageCustom;->callerTokenV2:Ljava/lang/String;

    .line 229
    .line 230
    iput-object v0, p1, Ll/azm0;->g:Ljava/lang/String;

    .line 231
    .line 232
    iget-object v0, p2, Lcom/p1/mobile/putong/data/PushMessageCustom;->calleeTokenV2:Ljava/lang/String;

    .line 233
    .line 234
    iput-object v0, p1, Ll/azm0;->f:Ljava/lang/String;

    .line 235
    .line 236
    iget-object v0, p2, Lcom/p1/mobile/putong/data/PushMessageCustom;->appId:Ljava/lang/String;

    .line 237
    .line 238
    iput-object v0, p1, Ll/azm0;->i:Ljava/lang/String;

    .line 239
    .line 240
    iget-object v0, p2, Lcom/p1/mobile/putong/data/PushMessageCustom;->rtcProvider:Ljava/lang/String;

    .line 241
    .line 242
    iput-object v0, p1, Ll/azm0;->j:Ljava/lang/String;

    .line 243
    .line 244
    iget-object v0, p2, Lcom/p1/mobile/putong/data/PushMessageCustom;->businessType:Ljava/lang/String;

    .line 245
    .line 246
    iput-object v0, p1, Ll/azm0;->k:Ljava/lang/String;

    .line 247
    .line 248
    iget-object v0, p2, Lcom/p1/mobile/putong/data/PushMessageCustom;->calleeDeviceId:Ljava/lang/String;

    .line 249
    .line 250
    iput-object v0, p1, Ll/azm0;->c:Ljava/lang/String;

    .line 251
    .line 252
    iget-boolean v0, p2, Lcom/p1/mobile/putong/data/PushMessageCustom;->mandatory:Z

    .line 253
    .line 254
    iput-boolean v0, p1, Ll/azm0;->p:Z

    .line 255
    .line 256
    iget-object p2, p2, Lcom/p1/mobile/putong/data/PushMessageCustom;->roomId:Ljava/lang/String;

    .line 257
    .line 258
    iput-object p2, p1, Ll/azm0;->l:Ljava/lang/String;

    .line 259
    .line 260
    iget-object p2, p0, Ll/l3n0;->a:Ll/u1n0;

    .line 261
    .line 262
    invoke-virtual {p2, p1}, Ll/u1n0;->p(Ll/azm0;)V

    .line 263
    .line 264
    .line 265
    iget-object p0, p0, Ll/l3n0;->a:Ll/u1n0;

    .line 266
    .line 267
    invoke-virtual {p0, v3}, Ll/u1n0;->u(I)V

    .line 268
    .line 269
    .line 270
    return-void

    .line 271
    :sswitch_data_0
    .sparse-switch
        -0x7ff16059 -> :sswitch_3
        -0x28273f8e -> :sswitch_2
        -0x2444eb82 -> :sswitch_1
        0x2e51f9 -> :sswitch_0
    .end sparse-switch

    .line 272
    .line 273
    .line 274
    .line 275
    .line 276
    .line 277
    .line 278
    .line 279
    .line 280
    .line 281
    .line 282
    .line 283
    .line 284
    .line 285
    .line 286
    .line 287
    .line 288
    .line 289
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public final k(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l3n0;->a:Ll/u1n0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/u1n0;->o()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    if-eqz p1, :cond_2

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    if-eq p1, v0, :cond_1

    .line 14
    .line 15
    :goto_0
    return-void

    .line 16
    :cond_1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/g;->Fo()Lrx/c;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ll/l3n0;->p()V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_2
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->Fo()Lrx/c;

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final l()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/l3n0;->a:Ll/u1n0;

    .line 2
    .line 3
    new-instance v1, Ll/g3n0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/g3n0;-><init>(Ll/l3n0;)V

    .line 6
    .line 7
    .line 8
    const-string v2, "callerHelper"

    .line 9
    .line 10
    invoke-virtual {v0, v2, v1}, Ll/u1n0;->t(Ljava/lang/String;Ll/y20;)Ll/kcg0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Ll/l3n0;->b:Ll/kcg0;

    .line 15
    .line 16
    return-void
.end method

.method public final synthetic m(Landroid/content/Context;Ljava/lang/String;JLjava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Ll/l3n0;->h(Landroid/content/Context;Ljava/lang/String;JLjava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic n(Landroid/content/Context;Ljava/lang/String;JLjava/lang/Throwable;)V
    .locals 7

    .line 1
    const/4 v5, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move-wide v3, p3

    .line 6
    move-object v6, p5

    .line 7
    invoke-virtual/range {v0 .. v6}, Ll/l3n0;->i(Landroid/content/Context;Ljava/lang/String;JLcom/p1/mobile/putong/data/Envelope;Ljava/lang/Throwable;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic o(Ljava/lang/Long;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/l3n0;->a:Ll/u1n0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/u1n0;->i()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-eq v0, v1, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Ll/l3n0;->c:Ll/kcg0;

    .line 11
    .line 12
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 17
    .line 18
    .line 19
    move-result-wide v0

    .line 20
    const-wide/16 v2, 0xf

    .line 21
    .line 22
    cmp-long v0, v0, v2

    .line 23
    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->T6:I

    .line 27
    .line 28
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 33
    .line 34
    .line 35
    move-result-wide v0

    .line 36
    const-wide/16 v2, 0x28

    .line 37
    .line 38
    cmp-long p1, v0, v2

    .line 39
    .line 40
    if-ltz p1, :cond_2

    .line 41
    .line 42
    sget p1, Lcom/p1/mobile/putong/core/message/R$string;->i7:I

    .line 43
    .line 44
    invoke-static {p1}, Ll/o1j0;->w(I)V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Ll/l3n0;->a:Ll/u1n0;

    .line 48
    .line 49
    const-string p1, "notAnswered"

    .line 50
    .line 51
    invoke-virtual {p0, p1}, Ll/u1n0;->d(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    :cond_2
    return-void
.end method

.method public final p()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/l3n0;->c:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 7
    .line 8
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    const-wide/16 v2, 0x1

    .line 13
    .line 14
    invoke-static {v2, v3, v0, v1}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;Ll/f2e0;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ll/h3n0;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/h3n0;-><init>(Ll/l3n0;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, p0, Ll/l3n0;->c:Ll/kcg0;

    .line 40
    .line 41
    return-void
.end method
