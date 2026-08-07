.class public final Ll/d1v0;
.super Ll/lfu0;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/Map;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public final b:Landroid/content/Context;

.field public final c:Ljava/lang/ref/WeakReference;

.field public final d:Ll/r0v0;

.field public final e:Ll/xvw0;

.field public final f:Ll/e1v0;

.field public g:Ll/j0v0;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/ref/WeakReference;Ll/r0v0;Ll/e1v0;Ll/xvw0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/lfu0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/d1v0;->a:Ljava/util/Map;

    .line 10
    .line 11
    iput-object p1, p0, Ll/d1v0;->b:Landroid/content/Context;

    .line 12
    .line 13
    iput-object p2, p0, Ll/d1v0;->c:Ljava/lang/ref/WeakReference;

    .line 14
    .line 15
    iput-object p3, p0, Ll/d1v0;->d:Ll/r0v0;

    .line 16
    .line 17
    iput-object p5, p0, Ll/d1v0;->e:Ll/xvw0;

    .line 18
    .line 19
    iput-object p4, p0, Ll/d1v0;->f:Ll/e1v0;

    .line 20
    .line 21
    return-void
.end method

.method public static bridge synthetic o8(Ll/d1v0;)Ll/r0v0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d1v0;->d:Ll/r0v0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic p8(Ljava/lang/Object;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/d1v0;->x8(Ljava/lang/Object;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static bridge synthetic q8(Ll/d1v0;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/d1v0;->y8(Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static w8()Ll/s70;
    .locals 3

    .line 1
    new-instance v0, Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "request_origin"

    .line 7
    .line 8
    const-string v2, "inspector_ooct"

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    new-instance v1, Ll/s70$a;

    .line 14
    .line 15
    invoke-direct {v1}, Ll/s70$a;-><init>()V

    .line 16
    .line 17
    .line 18
    const-class v2, Lcom/google/ads/mediation/admob/AdMobAdapter;

    .line 19
    .line 20
    invoke-virtual {v1, v2, v0}, Ll/r6;->b(Ljava/lang/Class;Landroid/os/Bundle;)Ll/r6;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Ll/s70$a;

    .line 25
    .line 26
    invoke-virtual {v0}, Ll/s70$a;->i()Ll/s70;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    return-object v0
.end method

.method public static x8(Ljava/lang/Object;)Ljava/lang/String;
    .locals 1

    .line 1
    instance-of v0, p0, Ll/jtv;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Ll/jtv;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/jtv;->f()Ll/n5d0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    instance-of v0, p0, Ll/bx0;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    check-cast p0, Ll/bx0;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/bx0;->a()Ll/n5d0;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    goto :goto_0

    .line 23
    :cond_1
    instance-of v0, p0, Ll/a2n;

    .line 24
    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    check-cast p0, Ll/a2n;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/a2n;->a()Ll/n5d0;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    goto :goto_0

    .line 34
    :cond_2
    instance-of v0, p0, Ll/v8d0;

    .line 35
    .line 36
    if-eqz v0, :cond_3

    .line 37
    .line 38
    check-cast p0, Ll/v8d0;

    .line 39
    .line 40
    invoke-virtual {p0}, Ll/v8d0;->a()Ll/n5d0;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    goto :goto_0

    .line 45
    :cond_3
    instance-of v0, p0, Ll/x8d0;

    .line 46
    .line 47
    if-eqz v0, :cond_4

    .line 48
    .line 49
    check-cast p0, Ll/x8d0;

    .line 50
    .line 51
    invoke-virtual {p0}, Ll/x8d0;->a()Ll/n5d0;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    goto :goto_0

    .line 56
    :cond_4
    instance-of v0, p0, Lcom/google/android/gms/ads/AdView;

    .line 57
    .line 58
    if-eqz v0, :cond_5

    .line 59
    .line 60
    check-cast p0, Lcom/google/android/gms/ads/AdView;

    .line 61
    .line 62
    invoke-virtual {p0}, Lcom/google/android/gms/ads/BaseAdView;->getResponseInfo()Ll/n5d0;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    goto :goto_0

    .line 67
    :cond_5
    instance-of v0, p0, Ll/md20;

    .line 68
    .line 69
    if-eqz v0, :cond_7

    .line 70
    .line 71
    check-cast p0, Ll/md20;

    .line 72
    .line 73
    invoke-virtual {p0}, Ll/md20;->g()Ll/n5d0;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    :goto_0
    if-nez p0, :cond_6

    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_6
    invoke-virtual {p0}, Ll/n5d0;->f()Ll/tlu0;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    if-eqz p0, :cond_7

    .line 85
    .line 86
    :try_start_0
    invoke-interface {p0}, Ll/tlu0;->zzh()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 90
    return-object p0

    .line 91
    :catch_0
    :cond_7
    :goto_1
    const-string p0, ""

    .line 92
    .line 93
    return-object p0
.end method


# virtual methods
.method public final X1(Ljava/lang/String;Ll/p1m;Ll/p1m;)V
    .locals 1

    .line 1
    invoke-static {p2}, Ll/h950;->P2(Ll/p1m;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    check-cast p2, Landroid/content/Context;

    .line 6
    .line 7
    invoke-static {p3}, Ll/h950;->P2(Ll/p1m;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p3

    .line 11
    check-cast p3, Landroid/view/ViewGroup;

    .line 12
    .line 13
    if-eqz p2, :cond_3

    .line 14
    .line 15
    if-nez p3, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object v0, p0, Ll/d1v0;->a:Ljava/util/Map;

    .line 19
    .line 20
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget-object p0, p0, Ll/d1v0;->a:Ljava/util/Map;

    .line 27
    .line 28
    invoke-interface {p0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    :cond_1
    instance-of p0, v0, Lcom/google/android/gms/ads/AdView;

    .line 32
    .line 33
    if-eqz p0, :cond_2

    .line 34
    .line 35
    check-cast v0, Lcom/google/android/gms/ads/AdView;

    .line 36
    .line 37
    invoke-static {p2, p3, v0}, Ll/e1v0;->a(Landroid/content/Context;Landroid/view/ViewGroup;Lcom/google/android/gms/ads/AdView;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_2
    instance-of p0, v0, Ll/md20;

    .line 42
    .line 43
    if-eqz p0, :cond_3

    .line 44
    .line 45
    check-cast v0, Ll/md20;

    .line 46
    .line 47
    invoke-static {p2, p3, v0}, Ll/e1v0;->b(Landroid/content/Context;Landroid/view/ViewGroup;Ll/md20;)V

    .line 48
    .line 49
    .line 50
    :cond_3
    :goto_0
    return-void
.end method

.method public final r8(Ll/j0v0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/d1v0;->g:Ll/j0v0;

    .line 2
    .line 3
    return-void
.end method

.method public final declared-synchronized s8(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/d1v0;->a:Ljava/util/Map;

    .line 3
    .line 4
    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    invoke-static {p2}, Ll/d1v0;->x8(Ljava/lang/Object;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0, p1, p3}, Ll/d1v0;->y8(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    .line 13
    .line 14
    monitor-exit p0

    .line 15
    return-void

    .line 16
    :catchall_0
    move-exception p1

    .line 17
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 18
    throw p1
.end method

.method public final declared-synchronized t8(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    sparse-switch v0, :sswitch_data_0

    .line 7
    .line 8
    .line 9
    goto/16 :goto_0

    .line 10
    .line 11
    :sswitch_0
    const-string v0, "BANNER"

    .line 12
    .line 13
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    if-eqz p2, :cond_0

    .line 18
    .line 19
    new-instance p2, Lcom/google/android/gms/ads/AdView;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/d1v0;->v8()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-direct {p2, v0}, Lcom/google/android/gms/ads/AdView;-><init>(Landroid/content/Context;)V

    .line 26
    .line 27
    .line 28
    sget-object v0, Ll/w70;->i:Ll/w70;

    .line 29
    .line 30
    invoke-virtual {p2, v0}, Lcom/google/android/gms/ads/BaseAdView;->setAdSize(Ll/w70;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p2, p1}, Lcom/google/android/gms/ads/BaseAdView;->setAdUnitId(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    new-instance v0, Ll/w0v0;

    .line 37
    .line 38
    invoke-direct {v0, p0, p1, p2, p3}, Ll/w0v0;-><init>(Ll/d1v0;Ljava/lang/String;Lcom/google/android/gms/ads/AdView;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p2, v0}, Lcom/google/android/gms/ads/BaseAdView;->setAdListener(Ll/d70;)V

    .line 42
    .line 43
    .line 44
    invoke-static {}, Ll/d1v0;->w8()Ll/s70;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p2, p1}, Lcom/google/android/gms/ads/BaseAdView;->b(Ll/s70;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    .line 50
    .line 51
    monitor-exit p0

    .line 52
    return-void

    .line 53
    :catchall_0
    move-exception p1

    .line 54
    goto/16 :goto_1

    .line 55
    .line 56
    :sswitch_1
    :try_start_1
    const-string v0, "REWARDED_INTERSTITIAL"

    .line 57
    .line 58
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result p2

    .line 62
    if-eqz p2, :cond_0

    .line 63
    .line 64
    invoke-virtual {p0}, Ll/d1v0;->v8()Landroid/content/Context;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    invoke-static {}, Ll/d1v0;->w8()Ll/s70;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    new-instance v1, Ll/z0v0;

    .line 73
    .line 74
    invoke-direct {v1, p0, p1, p3}, Ll/z0v0;-><init>(Ll/d1v0;Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    invoke-static {p2, p1, v0, v1}, Ll/x8d0;->b(Landroid/content/Context;Ljava/lang/String;Ll/s70;Ll/y8d0;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 78
    .line 79
    .line 80
    monitor-exit p0

    .line 81
    return-void

    .line 82
    :sswitch_2
    :try_start_2
    const-string v0, "REWARDED"

    .line 83
    .line 84
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result p2

    .line 88
    if-eqz p2, :cond_0

    .line 89
    .line 90
    invoke-virtual {p0}, Ll/d1v0;->v8()Landroid/content/Context;

    .line 91
    .line 92
    .line 93
    move-result-object p2

    .line 94
    invoke-static {}, Ll/d1v0;->w8()Ll/s70;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    new-instance v1, Ll/y0v0;

    .line 99
    .line 100
    invoke-direct {v1, p0, p1, p3}, Ll/y0v0;-><init>(Ll/d1v0;Ljava/lang/String;Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    invoke-static {p2, p1, v0, v1}, Ll/v8d0;->b(Landroid/content/Context;Ljava/lang/String;Ll/s70;Ll/w8d0;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 104
    .line 105
    .line 106
    monitor-exit p0

    .line 107
    return-void

    .line 108
    :sswitch_3
    :try_start_3
    const-string v0, "APP_OPEN_AD"

    .line 109
    .line 110
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    move-result p2

    .line 114
    if-eqz p2, :cond_0

    .line 115
    .line 116
    invoke-virtual {p0}, Ll/d1v0;->v8()Landroid/content/Context;

    .line 117
    .line 118
    .line 119
    move-result-object p2

    .line 120
    invoke-static {}, Ll/d1v0;->w8()Ll/s70;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    new-instance v1, Ll/v0v0;

    .line 125
    .line 126
    invoke-direct {v1, p0, p1, p3}, Ll/v0v0;-><init>(Ll/d1v0;Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    const/4 p3, 0x1

    .line 130
    invoke-static {p2, p1, v0, p3, v1}, Ll/bx0;->b(Landroid/content/Context;Ljava/lang/String;Ll/s70;ILl/bx0$a;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 131
    .line 132
    .line 133
    monitor-exit p0

    .line 134
    return-void

    .line 135
    :sswitch_4
    :try_start_4
    const-string v0, "INTERSTITIAL"

    .line 136
    .line 137
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    move-result p2

    .line 141
    if-eqz p2, :cond_0

    .line 142
    .line 143
    invoke-virtual {p0}, Ll/d1v0;->v8()Landroid/content/Context;

    .line 144
    .line 145
    .line 146
    move-result-object p2

    .line 147
    invoke-static {}, Ll/d1v0;->w8()Ll/s70;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    new-instance v1, Ll/x0v0;

    .line 152
    .line 153
    invoke-direct {v1, p0, p1, p3}, Ll/x0v0;-><init>(Ll/d1v0;Ljava/lang/String;Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    invoke-static {p2, p1, v0, v1}, Ll/a2n;->b(Landroid/content/Context;Ljava/lang/String;Ll/s70;Ll/b2n;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 157
    .line 158
    .line 159
    monitor-exit p0

    .line 160
    return-void

    .line 161
    :sswitch_5
    :try_start_5
    const-string v0, "NATIVE"

    .line 162
    .line 163
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 164
    .line 165
    .line 166
    move-result p2

    .line 167
    if-eqz p2, :cond_0

    .line 168
    .line 169
    new-instance p2, Ll/f70$a;

    .line 170
    .line 171
    invoke-virtual {p0}, Ll/d1v0;->v8()Landroid/content/Context;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    invoke-direct {p2, v0, p1}, Ll/f70$a;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 176
    .line 177
    .line 178
    new-instance v0, Ll/s0v0;

    .line 179
    .line 180
    invoke-direct {v0, p0, p1, p3}, Ll/s0v0;-><init>(Ll/d1v0;Ljava/lang/String;Ljava/lang/String;)V

    .line 181
    .line 182
    .line 183
    invoke-virtual {p2, v0}, Ll/f70$a;->b(Ll/md20$c;)Ll/f70$a;

    .line 184
    .line 185
    .line 186
    new-instance p1, Ll/a1v0;

    .line 187
    .line 188
    invoke-direct {p1, p0, p3}, Ll/a1v0;-><init>(Ll/d1v0;Ljava/lang/String;)V

    .line 189
    .line 190
    .line 191
    invoke-virtual {p2, p1}, Ll/f70$a;->c(Ll/d70;)Ll/f70$a;

    .line 192
    .line 193
    .line 194
    invoke-virtual {p2}, Ll/f70$a;->a()Ll/f70;

    .line 195
    .line 196
    .line 197
    move-result-object p1

    .line 198
    invoke-static {}, Ll/d1v0;->w8()Ll/s70;

    .line 199
    .line 200
    .line 201
    move-result-object p2

    .line 202
    invoke-virtual {p1, p2}, Ll/f70;->a(Ll/s70;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 203
    .line 204
    .line 205
    monitor-exit p0

    .line 206
    return-void

    .line 207
    :cond_0
    :goto_0
    monitor-exit p0

    .line 208
    return-void

    .line 209
    :goto_1
    :try_start_6
    monitor-exit p0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 210
    throw p1

    .line 211
    :sswitch_data_0
    .sparse-switch
        -0x772abbe9 -> :sswitch_5
        -0x51d5b0d4 -> :sswitch_4
        -0x1987ba06 -> :sswitch_3
        0x205e3c0e -> :sswitch_2
        0x6e8e03bd -> :sswitch_1
        0x7458732c -> :sswitch_0
    .end sparse-switch
.end method

.method public final declared-synchronized u8(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/d1v0;->d:Ll/r0v0;

    .line 3
    .line 4
    invoke-virtual {v0}, Ll/r0v0;->b()Landroid/app/Activity;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    goto/16 :goto_1

    .line 11
    .line 12
    :cond_0
    iget-object v1, p0, Ll/d1v0;->a:Ljava/util/Map;

    .line 13
    .line 14
    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    if-eqz v1, :cond_8

    .line 19
    .line 20
    sget-object v2, Ll/sgs0;->m9:Ll/dgs0;

    .line 21
    .line 22
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    invoke-virtual {v3, v2}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    check-cast v3, Ljava/lang/Boolean;

    .line 31
    .line 32
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    if-eqz v3, :cond_1

    .line 37
    .line 38
    instance-of v3, v1, Ll/bx0;

    .line 39
    .line 40
    if-nez v3, :cond_1

    .line 41
    .line 42
    instance-of v3, v1, Ll/a2n;

    .line 43
    .line 44
    if-nez v3, :cond_1

    .line 45
    .line 46
    instance-of v3, v1, Ll/v8d0;

    .line 47
    .line 48
    if-nez v3, :cond_1

    .line 49
    .line 50
    instance-of v3, v1, Ll/x8d0;

    .line 51
    .line 52
    if-eqz v3, :cond_2

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :catchall_0
    move-exception p1

    .line 56
    goto :goto_2

    .line 57
    :cond_1
    :goto_0
    iget-object v3, p0, Ll/d1v0;->a:Ljava/util/Map;

    .line 58
    .line 59
    invoke-interface {v3, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    :cond_2
    invoke-static {v1}, Ll/d1v0;->x8(Ljava/lang/Object;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    invoke-virtual {p0, v3, p2}, Ll/d1v0;->z8(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    instance-of p2, v1, Ll/bx0;

    .line 70
    .line 71
    if-eqz p2, :cond_3

    .line 72
    .line 73
    check-cast v1, Ll/bx0;

    .line 74
    .line 75
    invoke-virtual {v1, v0}, Ll/bx0;->c(Landroid/app/Activity;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 76
    .line 77
    .line 78
    monitor-exit p0

    .line 79
    return-void

    .line 80
    :cond_3
    :try_start_1
    instance-of p2, v1, Ll/a2n;

    .line 81
    .line 82
    if-eqz p2, :cond_4

    .line 83
    .line 84
    check-cast v1, Ll/a2n;

    .line 85
    .line 86
    invoke-virtual {v1, v0}, Ll/a2n;->e(Landroid/app/Activity;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 87
    .line 88
    .line 89
    monitor-exit p0

    .line 90
    return-void

    .line 91
    :cond_4
    :try_start_2
    instance-of p2, v1, Ll/v8d0;

    .line 92
    .line 93
    if-eqz p2, :cond_5

    .line 94
    .line 95
    check-cast v1, Ll/v8d0;

    .line 96
    .line 97
    sget-object p1, Ll/t0v0;->a:Ll/t0v0;

    .line 98
    .line 99
    invoke-virtual {v1, v0, p1}, Ll/v8d0;->d(Landroid/app/Activity;Ll/bp50;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 100
    .line 101
    .line 102
    monitor-exit p0

    .line 103
    return-void

    .line 104
    :cond_5
    :try_start_3
    instance-of p2, v1, Ll/x8d0;

    .line 105
    .line 106
    if-eqz p2, :cond_6

    .line 107
    .line 108
    check-cast v1, Ll/x8d0;

    .line 109
    .line 110
    sget-object p1, Ll/u0v0;->a:Ll/u0v0;

    .line 111
    .line 112
    invoke-virtual {v1, v0, p1}, Ll/x8d0;->c(Landroid/app/Activity;Ll/bp50;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 113
    .line 114
    .line 115
    monitor-exit p0

    .line 116
    return-void

    .line 117
    :cond_6
    :try_start_4
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 118
    .line 119
    .line 120
    move-result-object p2

    .line 121
    invoke-virtual {p2, v2}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object p2

    .line 125
    check-cast p2, Ljava/lang/Boolean;

    .line 126
    .line 127
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 128
    .line 129
    .line 130
    move-result p2

    .line 131
    if-eqz p2, :cond_8

    .line 132
    .line 133
    instance-of p2, v1, Lcom/google/android/gms/ads/AdView;

    .line 134
    .line 135
    if-nez p2, :cond_7

    .line 136
    .line 137
    instance-of p2, v1, Ll/md20;

    .line 138
    .line 139
    if-eqz p2, :cond_8

    .line 140
    .line 141
    :cond_7
    new-instance p2, Landroid/content/Intent;

    .line 142
    .line 143
    invoke-direct {p2}, Landroid/content/Intent;-><init>()V

    .line 144
    .line 145
    .line 146
    invoke-virtual {p0}, Ll/d1v0;->v8()Landroid/content/Context;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    const-string v1, "com.google.android.gms.ads.OutOfContextTestingActivity"

    .line 151
    .line 152
    invoke-virtual {p2, v0, v1}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 153
    .line 154
    .line 155
    const-string v1, "adUnit"

    .line 156
    .line 157
    invoke-virtual {p2, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 158
    .line 159
    .line 160
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 161
    .line 162
    .line 163
    invoke-static {v0, p2}, Lcom/google/android/gms/ads/internal/util/b;->s(Landroid/content/Context;Landroid/content/Intent;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 164
    .line 165
    .line 166
    monitor-exit p0

    .line 167
    return-void

    .line 168
    :cond_8
    :goto_1
    monitor-exit p0

    .line 169
    return-void

    .line 170
    :goto_2
    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 171
    throw p1
.end method

.method public final v8()Landroid/content/Context;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/d1v0;->c:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/content/Context;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/d1v0;->b:Landroid/content/Context;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    return-object v0
.end method

.method public final declared-synchronized y8(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/d1v0;->g:Ll/j0v0;

    .line 3
    .line 4
    invoke-virtual {v0, p1}, Ll/j0v0;->b(Ljava/lang/String;)Ll/hpr;

    .line 5
    .line 6
    .line 7
    move-result-object p1
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    :try_start_1
    new-instance v0, Ll/b1v0;

    .line 9
    .line 10
    invoke-direct {v0, p0, p2}, Ll/b1v0;-><init>(Ll/d1v0;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object p2, p0, Ll/d1v0;->e:Ll/xvw0;

    .line 14
    .line 15
    invoke-static {p1, v0, p2}, Ll/pvw0;->r(Ll/hpr;Ll/lvw0;Ljava/util/concurrent/Executor;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 16
    .line 17
    .line 18
    monitor-exit p0

    .line 19
    return-void

    .line 20
    :catchall_0
    move-exception p1

    .line 21
    goto :goto_0

    .line 22
    :catch_0
    move-exception p1

    .line 23
    :try_start_2
    const-string v0, "OutOfContextTester.setAdAsOutOfContext"

    .line 24
    .line 25
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v1, p1, v0}, Ll/ebt0;->w(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Ll/d1v0;->d:Ll/r0v0;

    .line 33
    .line 34
    invoke-virtual {p1, p2}, Ll/r0v0;->f(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 35
    .line 36
    .line 37
    monitor-exit p0

    .line 38
    return-void

    .line 39
    :goto_0
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 40
    throw p1
.end method

.method public final declared-synchronized z8(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/d1v0;->g:Ll/j0v0;

    .line 3
    .line 4
    invoke-virtual {v0, p1}, Ll/j0v0;->b(Ljava/lang/String;)Ll/hpr;

    .line 5
    .line 6
    .line 7
    move-result-object p1
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    :try_start_1
    new-instance v0, Ll/c1v0;

    .line 9
    .line 10
    invoke-direct {v0, p0, p2}, Ll/c1v0;-><init>(Ll/d1v0;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object p2, p0, Ll/d1v0;->e:Ll/xvw0;

    .line 14
    .line 15
    invoke-static {p1, v0, p2}, Ll/pvw0;->r(Ll/hpr;Ll/lvw0;Ljava/util/concurrent/Executor;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 16
    .line 17
    .line 18
    monitor-exit p0

    .line 19
    return-void

    .line 20
    :catchall_0
    move-exception p1

    .line 21
    goto :goto_0

    .line 22
    :catch_0
    move-exception p1

    .line 23
    :try_start_2
    const-string v0, "OutOfContextTester.setAdAsShown"

    .line 24
    .line 25
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v1, p1, v0}, Ll/ebt0;->w(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Ll/d1v0;->d:Ll/r0v0;

    .line 33
    .line 34
    invoke-virtual {p1, p2}, Ll/r0v0;->f(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 35
    .line 36
    .line 37
    monitor-exit p0

    .line 38
    return-void

    .line 39
    :goto_0
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 40
    throw p1
.end method
