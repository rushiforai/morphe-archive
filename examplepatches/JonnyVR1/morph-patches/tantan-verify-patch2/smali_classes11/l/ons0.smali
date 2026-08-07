.class public final Ll/ons0;
.super Ll/mxj0;
.source "SourceFile"


# instance fields
.field public final a:Ll/nns0;

.field public final b:Ljava/util/List;

.field public final c:Ll/bls0;

.field public final d:Ll/vcl0;

.field public final e:Ll/nd20;

.field public final f:Ljava/util/List;


# direct methods
.method public constructor <init>(Ll/nns0;)V
    .locals 5

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    invoke-direct {p0}, Ll/mxj0;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object v1, p0, Ll/ons0;->b:Ljava/util/List;

    .line 12
    .line 13
    new-instance v1, Ll/vcl0;

    .line 14
    .line 15
    invoke-direct {v1}, Ll/vcl0;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Ll/ons0;->d:Ll/vcl0;

    .line 19
    .line 20
    new-instance v1, Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object v1, p0, Ll/ons0;->f:Ljava/util/List;

    .line 26
    .line 27
    iput-object p1, p0, Ll/ons0;->a:Ll/nns0;

    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    :try_start_0
    invoke-interface {p1}, Ll/nns0;->zzu()Ljava/util/List;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    if-eqz p1, :cond_3

    .line 35
    .line 36
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-eqz v2, :cond_3

    .line 45
    .line 46
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    instance-of v3, v2, Landroid/os/IBinder;

    .line 51
    .line 52
    if-eqz v3, :cond_2

    .line 53
    .line 54
    check-cast v2, Landroid/os/IBinder;

    .line 55
    .line 56
    const-string v3, "com.google.android.gms.ads.internal.formats.client.INativeAdImage"

    .line 57
    .line 58
    invoke-interface {v2, v3}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    instance-of v4, v3, Ll/als0;

    .line 63
    .line 64
    if-eqz v4, :cond_1

    .line 65
    .line 66
    check-cast v3, Ll/als0;

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :catch_0
    move-exception p1

    .line 70
    goto :goto_2

    .line 71
    :cond_1
    new-instance v3, Ll/yks0;

    .line 72
    .line 73
    invoke-direct {v3, v2}, Ll/yks0;-><init>(Landroid/os/IBinder;)V

    .line 74
    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_2
    move-object v3, v1

    .line 78
    :goto_1
    if-eqz v3, :cond_0

    .line 79
    .line 80
    iget-object v2, p0, Ll/ons0;->b:Ljava/util/List;

    .line 81
    .line 82
    new-instance v4, Ll/bls0;

    .line 83
    .line 84
    invoke-direct {v4, v3}, Ll/bls0;-><init>(Ll/als0;)V

    .line 85
    .line 86
    .line 87
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 88
    .line 89
    .line 90
    goto :goto_0

    .line 91
    :goto_2
    invoke-static {v0, p1}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 92
    .line 93
    .line 94
    :cond_3
    :try_start_1
    iget-object p1, p0, Ll/ons0;->a:Ll/nns0;

    .line 95
    .line 96
    invoke-interface {p1}, Ll/nns0;->b()Ljava/util/List;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    if-eqz p1, :cond_6

    .line 101
    .line 102
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    :cond_4
    :goto_3
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 107
    .line 108
    .line 109
    move-result v2

    .line 110
    if-eqz v2, :cond_6

    .line 111
    .line 112
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    instance-of v3, v2, Landroid/os/IBinder;

    .line 117
    .line 118
    if-eqz v3, :cond_5

    .line 119
    .line 120
    check-cast v2, Landroid/os/IBinder;

    .line 121
    .line 122
    invoke-static {v2}, Ll/pxt0;->o8(Landroid/os/IBinder;)Ll/czt0;

    .line 123
    .line 124
    .line 125
    move-result-object v2

    .line 126
    goto :goto_4

    .line 127
    :catch_1
    move-exception p1

    .line 128
    goto :goto_5

    .line 129
    :cond_5
    move-object v2, v1

    .line 130
    :goto_4
    if-eqz v2, :cond_4

    .line 131
    .line 132
    iget-object v3, p0, Ll/ons0;->f:Ljava/util/List;

    .line 133
    .line 134
    new-instance v4, Ll/j0u0;

    .line 135
    .line 136
    invoke-direct {v4, v2}, Ll/j0u0;-><init>(Ll/czt0;)V

    .line 137
    .line 138
    .line 139
    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1

    .line 140
    .line 141
    .line 142
    goto :goto_3

    .line 143
    :goto_5
    invoke-static {v0, p1}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 144
    .line 145
    .line 146
    :cond_6
    :try_start_2
    iget-object p1, p0, Ll/ons0;->a:Ll/nns0;

    .line 147
    .line 148
    invoke-interface {p1}, Ll/nns0;->zzk()Ll/als0;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    if-eqz p1, :cond_7

    .line 153
    .line 154
    new-instance v2, Ll/bls0;

    .line 155
    .line 156
    invoke-direct {v2, p1}, Ll/bls0;-><init>(Ll/als0;)V
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_2

    .line 157
    .line 158
    .line 159
    goto :goto_8

    .line 160
    :catch_2
    move-exception p1

    .line 161
    goto :goto_7

    .line 162
    :cond_7
    :goto_6
    move-object v2, v1

    .line 163
    goto :goto_8

    .line 164
    :goto_7
    invoke-static {v0, p1}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 165
    .line 166
    .line 167
    goto :goto_6

    .line 168
    :goto_8
    iput-object v2, p0, Ll/ons0;->c:Ll/bls0;

    .line 169
    .line 170
    :try_start_3
    iget-object p1, p0, Ll/ons0;->a:Ll/nns0;

    .line 171
    .line 172
    invoke-interface {p1}, Ll/nns0;->zzi()Ll/tks0;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    if-eqz p1, :cond_8

    .line 177
    .line 178
    new-instance p1, Ll/uks0;

    .line 179
    .line 180
    iget-object v2, p0, Ll/ons0;->a:Ll/nns0;

    .line 181
    .line 182
    invoke-interface {v2}, Ll/nns0;->zzi()Ll/tks0;

    .line 183
    .line 184
    .line 185
    move-result-object v2

    .line 186
    invoke-direct {p1, v2}, Ll/uks0;-><init>(Ll/tks0;)V
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_3

    .line 187
    .line 188
    .line 189
    move-object v1, p1

    .line 190
    goto :goto_9

    .line 191
    :catch_3
    move-exception p1

    .line 192
    invoke-static {v0, p1}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 193
    .line 194
    .line 195
    :cond_8
    :goto_9
    iput-object v1, p0, Ll/ons0;->e:Ll/nd20;

    .line 196
    .line 197
    return-void
.end method


# virtual methods
.method public final a()Ll/vcl0;
    .locals 2

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/ons0;->a:Ll/nns0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/nns0;->zzh()Ll/lpu0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/ons0;->d:Ll/vcl0;

    .line 10
    .line 11
    iget-object v1, p0, Ll/ons0;->a:Ll/nns0;

    .line 12
    .line 13
    invoke-interface {v1}, Ll/nns0;->zzh()Ll/lpu0;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Ll/vcl0;->c(Ll/lpu0;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catch_0
    move-exception v0

    .line 22
    const-string v1, "Exception occurred while getting video controller"

    .line 23
    .line 24
    invoke-static {v1, v0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    :goto_0
    iget-object p0, p0, Ll/ons0;->d:Ll/vcl0;

    .line 28
    .line 29
    return-object p0
.end method

.method public final b()Ll/od20;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ons0;->c:Ll/bls0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c()Ljava/lang/Double;
    .locals 5
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object p0, p0, Ll/ons0;->a:Ll/nns0;

    .line 3
    .line 4
    invoke-interface {p0}, Ll/nns0;->zze()D

    .line 5
    .line 6
    .line 7
    move-result-wide v1

    .line 8
    const-wide/high16 v3, -0x4010000000000000L    # -1.0

    .line 9
    .line 10
    cmpl-double p0, v1, v3

    .line 11
    .line 12
    if-nez p0, :cond_0

    .line 13
    .line 14
    return-object v0

    .line 15
    :cond_0
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 16
    .line 17
    .line 18
    move-result-object p0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    return-object p0

    .line 20
    :catch_0
    move-exception p0

    .line 21
    const-string v1, ""

    .line 22
    .line 23
    invoke-static {v1, p0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 24
    .line 25
    .line 26
    return-object v0
.end method

.method public final d()Ljava/lang/Object;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    :try_start_0
    iget-object p0, p0, Ll/ons0;->a:Ll/nns0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/nns0;->zzl()Ll/p1m;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-static {p0}, Ll/h950;->P2(Ll/p1m;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    return-object p0

    .line 14
    :catch_0
    move-exception p0

    .line 15
    const-string v0, ""

    .line 16
    .line 17
    invoke-static {v0, p0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return-object p0
.end method

.method public final e()Ljava/lang/String;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    :try_start_0
    iget-object p0, p0, Ll/ons0;->a:Ll/nns0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/nns0;->zzn()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    return-object p0

    .line 8
    :catch_0
    move-exception p0

    .line 9
    const-string v0, ""

    .line 10
    .line 11
    invoke-static {v0, p0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method

.method public final f()Ljava/lang/String;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    :try_start_0
    iget-object p0, p0, Ll/ons0;->a:Ll/nns0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/nns0;->zzo()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    return-object p0

    .line 8
    :catch_0
    move-exception p0

    .line 9
    const-string v0, ""

    .line 10
    .line 11
    invoke-static {v0, p0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method

.method public final g()Ljava/lang/String;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    :try_start_0
    iget-object p0, p0, Ll/ons0;->a:Ll/nns0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/nns0;->zzp()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    return-object p0

    .line 8
    :catch_0
    move-exception p0

    .line 9
    const-string v0, ""

    .line 10
    .line 11
    invoke-static {v0, p0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method

.method public final h()Ljava/lang/String;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    :try_start_0
    iget-object p0, p0, Ll/ons0;->a:Ll/nns0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/nns0;->a()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    return-object p0

    .line 8
    :catch_0
    move-exception p0

    .line 9
    const-string v0, ""

    .line 10
    .line 11
    invoke-static {v0, p0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method

.method public final i()Ljava/lang/String;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    :try_start_0
    iget-object p0, p0, Ll/ons0;->a:Ll/nns0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/nns0;->zzs()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    return-object p0

    .line 8
    :catch_0
    move-exception p0

    .line 9
    const-string v0, ""

    .line 10
    .line 11
    invoke-static {v0, p0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method

.method public final j()Ljava/lang/String;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    :try_start_0
    iget-object p0, p0, Ll/ons0;->a:Ll/nns0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/nns0;->zzt()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    return-object p0

    .line 8
    :catch_0
    move-exception p0

    .line 9
    const-string v0, ""

    .line 10
    .line 11
    invoke-static {v0, p0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method

.method public final k()Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ons0;->b:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method
