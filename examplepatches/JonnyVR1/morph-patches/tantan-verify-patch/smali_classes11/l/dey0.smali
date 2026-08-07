.class public final Ll/dey0;
.super Landroid/webkit/WebViewClient;
.source "SourceFile"


# instance fields
.field final synthetic zza:Ll/xuy0;


# direct methods
.method public constructor <init>(Ll/xuy0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dey0;->zza:Ll/xuy0;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onReceivedError(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Landroid/webkit/WebResourceError;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/dey0;->zza:Ll/xuy0;

    .line 2
    .line 3
    invoke-static {p1}, Ll/xuy0;->t8(Ll/xuy0;)Ll/xhs0;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    const-string p3, "#007 Could not call remote method."

    .line 8
    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    :try_start_0
    invoke-static {p1}, Ll/xuy0;->t8(Ll/xuy0;)Ll/xhs0;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const/4 p2, 0x1

    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-static {p2, v0, v0}, Ll/v8w0;->d(ILjava/lang/String;Lcom/google/android/gms/ads/internal/client/zze;)Lcom/google/android/gms/ads/internal/client/zze;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-interface {p1, p2}, Ll/xhs0;->f(Lcom/google/android/gms/ads/internal/client/zze;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :catch_0
    move-exception p1

    .line 26
    invoke-static {p3, p1}, Ll/dct0;->i(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    :goto_0
    iget-object p0, p0, Ll/dey0;->zza:Ll/xuy0;

    .line 30
    .line 31
    invoke-static {p0}, Ll/xuy0;->t8(Ll/xuy0;)Ll/xhs0;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    :try_start_1
    invoke-static {p0}, Ll/xuy0;->t8(Ll/xuy0;)Ll/xhs0;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const/4 p1, 0x0

    .line 42
    invoke-interface {p0, p1}, Ll/xhs0;->zze(I)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1

    .line 43
    .line 44
    .line 45
    goto :goto_1

    .line 46
    :catch_1
    move-exception p0

    .line 47
    invoke-static {p3, p0}, Ll/dct0;->i(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 48
    .line 49
    .line 50
    :cond_1
    :goto_1
    return-void
.end method

.method public final shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 5

    .line 1
    iget-object p1, p0, Ll/dey0;->zza:Ll/xuy0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/xuy0;->a()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p2, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    const/4 v0, 0x0

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    return v0

    .line 15
    :cond_0
    const-string p1, "gmsg://noAdLoaded"

    .line 16
    .line 17
    invoke-virtual {p2, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    const/4 v1, 0x0

    .line 22
    const/4 v2, 0x1

    .line 23
    const-string v3, "#007 Could not call remote method."

    .line 24
    .line 25
    if-eqz p1, :cond_3

    .line 26
    .line 27
    iget-object p1, p0, Ll/dey0;->zza:Ll/xuy0;

    .line 28
    .line 29
    invoke-static {p1}, Ll/xuy0;->t8(Ll/xuy0;)Ll/xhs0;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    const/4 v4, 0x3

    .line 34
    if-eqz p2, :cond_1

    .line 35
    .line 36
    :try_start_0
    invoke-static {p1}, Ll/xuy0;->t8(Ll/xuy0;)Ll/xhs0;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-static {v4, v1, v1}, Ll/v8w0;->d(ILjava/lang/String;Lcom/google/android/gms/ads/internal/client/zze;)Lcom/google/android/gms/ads/internal/client/zze;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    invoke-interface {p1, p2}, Ll/xhs0;->f(Lcom/google/android/gms/ads/internal/client/zze;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :catch_0
    move-exception p1

    .line 49
    invoke-static {v3, p1}, Ll/dct0;->i(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 50
    .line 51
    .line 52
    :cond_1
    :goto_0
    iget-object p1, p0, Ll/dey0;->zza:Ll/xuy0;

    .line 53
    .line 54
    invoke-static {p1}, Ll/xuy0;->t8(Ll/xuy0;)Ll/xhs0;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    if-eqz p2, :cond_2

    .line 59
    .line 60
    :try_start_1
    invoke-static {p1}, Ll/xuy0;->t8(Ll/xuy0;)Ll/xhs0;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-interface {p1, v4}, Ll/xhs0;->zze(I)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1

    .line 65
    .line 66
    .line 67
    goto :goto_1

    .line 68
    :catch_1
    move-exception p1

    .line 69
    invoke-static {v3, p1}, Ll/dct0;->i(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 70
    .line 71
    .line 72
    :cond_2
    :goto_1
    iget-object p0, p0, Ll/dey0;->zza:Ll/xuy0;

    .line 73
    .line 74
    invoke-virtual {p0, v0}, Ll/xuy0;->p8(I)V

    .line 75
    .line 76
    .line 77
    return v2

    .line 78
    :cond_3
    const-string p1, "gmsg://scriptLoadFailed"

    .line 79
    .line 80
    invoke-virtual {p2, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    if-eqz p1, :cond_6

    .line 85
    .line 86
    iget-object p1, p0, Ll/dey0;->zza:Ll/xuy0;

    .line 87
    .line 88
    invoke-static {p1}, Ll/xuy0;->t8(Ll/xuy0;)Ll/xhs0;

    .line 89
    .line 90
    .line 91
    move-result-object p2

    .line 92
    if-eqz p2, :cond_4

    .line 93
    .line 94
    :try_start_2
    invoke-static {p1}, Ll/xuy0;->t8(Ll/xuy0;)Ll/xhs0;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    invoke-static {v2, v1, v1}, Ll/v8w0;->d(ILjava/lang/String;Lcom/google/android/gms/ads/internal/client/zze;)Lcom/google/android/gms/ads/internal/client/zze;

    .line 99
    .line 100
    .line 101
    move-result-object p2

    .line 102
    invoke-interface {p1, p2}, Ll/xhs0;->f(Lcom/google/android/gms/ads/internal/client/zze;)V
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_2

    .line 103
    .line 104
    .line 105
    goto :goto_2

    .line 106
    :catch_2
    move-exception p1

    .line 107
    invoke-static {v3, p1}, Ll/dct0;->i(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 108
    .line 109
    .line 110
    :cond_4
    :goto_2
    iget-object p1, p0, Ll/dey0;->zza:Ll/xuy0;

    .line 111
    .line 112
    invoke-static {p1}, Ll/xuy0;->t8(Ll/xuy0;)Ll/xhs0;

    .line 113
    .line 114
    .line 115
    move-result-object p2

    .line 116
    if-eqz p2, :cond_5

    .line 117
    .line 118
    :try_start_3
    invoke-static {p1}, Ll/xuy0;->t8(Ll/xuy0;)Ll/xhs0;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    invoke-interface {p1, v0}, Ll/xhs0;->zze(I)V
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_3

    .line 123
    .line 124
    .line 125
    goto :goto_3

    .line 126
    :catch_3
    move-exception p1

    .line 127
    invoke-static {v3, p1}, Ll/dct0;->i(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 128
    .line 129
    .line 130
    :cond_5
    :goto_3
    iget-object p0, p0, Ll/dey0;->zza:Ll/xuy0;

    .line 131
    .line 132
    invoke-virtual {p0, v0}, Ll/xuy0;->p8(I)V

    .line 133
    .line 134
    .line 135
    return v2

    .line 136
    :cond_6
    const-string p1, "gmsg://adResized"

    .line 137
    .line 138
    invoke-virtual {p2, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 139
    .line 140
    .line 141
    move-result p1

    .line 142
    if-eqz p1, :cond_8

    .line 143
    .line 144
    iget-object p1, p0, Ll/dey0;->zza:Ll/xuy0;

    .line 145
    .line 146
    invoke-static {p1}, Ll/xuy0;->t8(Ll/xuy0;)Ll/xhs0;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    if-eqz v0, :cond_7

    .line 151
    .line 152
    :try_start_4
    invoke-static {p1}, Ll/xuy0;->t8(Ll/xuy0;)Ll/xhs0;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    invoke-interface {p1}, Ll/xhs0;->zzi()V
    :try_end_4
    .catch Landroid/os/RemoteException; {:try_start_4 .. :try_end_4} :catch_4

    .line 157
    .line 158
    .line 159
    goto :goto_4

    .line 160
    :catch_4
    move-exception p1

    .line 161
    invoke-static {v3, p1}, Ll/dct0;->i(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 162
    .line 163
    .line 164
    :cond_7
    :goto_4
    iget-object p1, p0, Ll/dey0;->zza:Ll/xuy0;

    .line 165
    .line 166
    invoke-virtual {p1, p2}, Ll/xuy0;->zzb(Ljava/lang/String;)I

    .line 167
    .line 168
    .line 169
    move-result p1

    .line 170
    iget-object p0, p0, Ll/dey0;->zza:Ll/xuy0;

    .line 171
    .line 172
    invoke-virtual {p0, p1}, Ll/xuy0;->p8(I)V

    .line 173
    .line 174
    .line 175
    return v2

    .line 176
    :cond_8
    const-string p1, "gmsg://"

    .line 177
    .line 178
    invoke-virtual {p2, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 179
    .line 180
    .line 181
    move-result p1

    .line 182
    if-eqz p1, :cond_9

    .line 183
    .line 184
    return v2

    .line 185
    :cond_9
    iget-object p1, p0, Ll/dey0;->zza:Ll/xuy0;

    .line 186
    .line 187
    invoke-static {p1}, Ll/xuy0;->t8(Ll/xuy0;)Ll/xhs0;

    .line 188
    .line 189
    .line 190
    move-result-object v0

    .line 191
    if-eqz v0, :cond_a

    .line 192
    .line 193
    :try_start_5
    invoke-static {p1}, Ll/xuy0;->t8(Ll/xuy0;)Ll/xhs0;

    .line 194
    .line 195
    .line 196
    move-result-object p1

    .line 197
    invoke-interface {p1}, Ll/xhs0;->zzc()V

    .line 198
    .line 199
    .line 200
    iget-object p1, p0, Ll/dey0;->zza:Ll/xuy0;

    .line 201
    .line 202
    invoke-static {p1}, Ll/xuy0;->t8(Ll/xuy0;)Ll/xhs0;

    .line 203
    .line 204
    .line 205
    move-result-object p1

    .line 206
    invoke-interface {p1}, Ll/xhs0;->zzh()V
    :try_end_5
    .catch Landroid/os/RemoteException; {:try_start_5 .. :try_end_5} :catch_5

    .line 207
    .line 208
    .line 209
    goto :goto_5

    .line 210
    :catch_5
    move-exception p1

    .line 211
    invoke-static {v3, p1}, Ll/dct0;->i(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 212
    .line 213
    .line 214
    :cond_a
    :goto_5
    iget-object p1, p0, Ll/dey0;->zza:Ll/xuy0;

    .line 215
    .line 216
    invoke-static {p1, p2}, Ll/xuy0;->v8(Ll/xuy0;Ljava/lang/String;)Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object p1

    .line 220
    iget-object p0, p0, Ll/dey0;->zza:Ll/xuy0;

    .line 221
    .line 222
    invoke-static {p0, p1}, Ll/xuy0;->y8(Ll/xuy0;Ljava/lang/String;)V

    .line 223
    .line 224
    .line 225
    return v2
.end method
