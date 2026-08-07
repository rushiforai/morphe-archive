.class public final Ll/fwt0;
.super Ll/kzt0;
.source "SourceFile"


# instance fields
.field public final j:Ll/wit0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final k:I

.field public final l:Landroid/content/Context;

.field public final m:Ll/uvt0;

.field public final n:Ll/wiu0;

.field public final o:Ll/dfu0;

.field public final p:Ll/c7u0;

.field public final q:Z

.field public final r:Ll/ibt0;

.field public s:Z


# direct methods
.method public constructor <init>(Ll/jzt0;Landroid/content/Context;Ll/wit0;ILl/uvt0;Ll/wiu0;Ll/dfu0;Ll/c7u0;Ll/ibt0;)V
    .locals 0
    .param p3    # Ll/wit0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Ll/kzt0;-><init>(Ll/jzt0;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/fwt0;->s:Z

    .line 6
    .line 7
    iput-object p3, p0, Ll/fwt0;->j:Ll/wit0;

    .line 8
    .line 9
    iput-object p2, p0, Ll/fwt0;->l:Landroid/content/Context;

    .line 10
    .line 11
    iput p4, p0, Ll/fwt0;->k:I

    .line 12
    .line 13
    iput-object p5, p0, Ll/fwt0;->m:Ll/uvt0;

    .line 14
    .line 15
    iput-object p6, p0, Ll/fwt0;->n:Ll/wiu0;

    .line 16
    .line 17
    iput-object p7, p0, Ll/fwt0;->o:Ll/dfu0;

    .line 18
    .line 19
    iput-object p8, p0, Ll/fwt0;->p:Ll/c7u0;

    .line 20
    .line 21
    sget-object p1, Ll/sgs0;->k5:Ll/dgs0;

    .line 22
    .line 23
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-virtual {p2, p1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    check-cast p1, Ljava/lang/Boolean;

    .line 32
    .line 33
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    iput-boolean p1, p0, Ll/fwt0;->q:Z

    .line 38
    .line 39
    iput-object p9, p0, Ll/fwt0;->r:Ll/ibt0;

    .line 40
    .line 41
    return-void
.end method


# virtual methods
.method public final b()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/kzt0;->b()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/fwt0;->j:Ll/wit0;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0}, Ll/wit0;->destroy()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public final i()I
    .locals 0

    .line 1
    iget p0, p0, Ll/fwt0;->k:I

    .line 2
    .line 3
    return p0
.end method

.method public final j(Ll/nas0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fwt0;->j:Ll/wit0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/wit0;->l0(Ll/nas0;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final k(Landroid/app/Activity;Ll/abs0;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Ll/fwt0;->l:Landroid/content/Context;

    .line 4
    .line 5
    :cond_0
    iget-boolean p2, p0, Ll/fwt0;->q:Z

    .line 6
    .line 7
    if-eqz p2, :cond_1

    .line 8
    .line 9
    iget-object p2, p0, Ll/fwt0;->o:Ll/dfu0;

    .line 10
    .line 11
    invoke-virtual {p2}, Ll/dfu0;->zzb()V

    .line 12
    .line 13
    .line 14
    :cond_1
    sget-object p2, Ll/sgs0;->B0:Ll/dgs0;

    .line 15
    .line 16
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0, p2}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    check-cast p2, Ljava/lang/Boolean;

    .line 25
    .line 26
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    if-eqz p2, :cond_2

    .line 31
    .line 32
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 33
    .line 34
    .line 35
    invoke-static {p1}, Lcom/google/android/gms/ads/internal/util/b;->f(Landroid/content/Context;)Z

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    if-eqz p2, :cond_2

    .line 40
    .line 41
    const-string p2, "Interstitials that show when your app is in the background are a violation of AdMob policies and may lead to blocked ad serving. To learn more, visit  https://googlemobileadssdk.page.link/admob-interstitial-policies"

    .line 42
    .line 43
    invoke-static {p2}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iget-object p2, p0, Ll/fwt0;->p:Ll/c7u0;

    .line 47
    .line 48
    invoke-virtual {p2}, Ll/c7u0;->zzb()V

    .line 49
    .line 50
    .line 51
    sget-object p2, Ll/sgs0;->C0:Ll/dgs0;

    .line 52
    .line 53
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 54
    .line 55
    .line 56
    move-result-object p3

    .line 57
    invoke-virtual {p3, p2}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    check-cast p2, Ljava/lang/Boolean;

    .line 62
    .line 63
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 64
    .line 65
    .line 66
    move-result p2

    .line 67
    if-eqz p2, :cond_7

    .line 68
    .line 69
    new-instance p2, Ll/kiw0;

    .line 70
    .line 71
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-static {}, Ll/bxy0;->v()Ll/y1t0;

    .line 76
    .line 77
    .line 78
    move-result-object p3

    .line 79
    invoke-virtual {p3}, Ll/y1t0;->b()Landroid/os/Looper;

    .line 80
    .line 81
    .line 82
    move-result-object p3

    .line 83
    invoke-direct {p2, p1, p3}, Ll/kiw0;-><init>(Landroid/content/Context;Landroid/os/Looper;)V

    .line 84
    .line 85
    .line 86
    iget-object p0, p0, Ll/kzt0;->a:Ll/b7w0;

    .line 87
    .line 88
    iget-object p0, p0, Ll/b7w0;->b:Ll/a7w0;

    .line 89
    .line 90
    iget-object p0, p0, Ll/a7w0;->b:Ll/t6w0;

    .line 91
    .line 92
    iget-object p0, p0, Ll/t6w0;->b:Ljava/lang/String;

    .line 93
    .line 94
    invoke-virtual {p2, p0}, Ll/kiw0;->a(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :cond_2
    sget-object p2, Ll/sgs0;->lb:Ll/dgs0;

    .line 99
    .line 100
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-virtual {v0, p2}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object p2

    .line 108
    check-cast p2, Ljava/lang/Boolean;

    .line 109
    .line 110
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 111
    .line 112
    .line 113
    move-result p2

    .line 114
    const/4 v0, 0x0

    .line 115
    if-eqz p2, :cond_4

    .line 116
    .line 117
    iget-object p2, p0, Ll/fwt0;->j:Ll/wit0;

    .line 118
    .line 119
    if-eqz p2, :cond_4

    .line 120
    .line 121
    invoke-interface {p2}, Ll/wit0;->c()Ll/q6w0;

    .line 122
    .line 123
    .line 124
    move-result-object p2

    .line 125
    if-eqz p2, :cond_4

    .line 126
    .line 127
    iget-boolean v1, p2, Ll/q6w0;->r0:Z

    .line 128
    .line 129
    if-eqz v1, :cond_4

    .line 130
    .line 131
    iget p2, p2, Ll/q6w0;->s0:I

    .line 132
    .line 133
    iget-object v1, p0, Ll/fwt0;->r:Ll/ibt0;

    .line 134
    .line 135
    invoke-virtual {v1}, Ll/ibt0;->b()I

    .line 136
    .line 137
    .line 138
    move-result v1

    .line 139
    if-ne p2, v1, :cond_3

    .line 140
    .line 141
    goto :goto_0

    .line 142
    :cond_3
    const-string p1, "The app open consent form has been shown."

    .line 143
    .line 144
    invoke-static {p1}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    iget-object p0, p0, Ll/fwt0;->p:Ll/c7u0;

    .line 148
    .line 149
    const/16 p1, 0xc

    .line 150
    .line 151
    const-string p2, "The consent form has already been shown."

    .line 152
    .line 153
    invoke-static {p1, p2, v0}, Ll/v8w0;->d(ILjava/lang/String;Lcom/google/android/gms/ads/internal/client/zze;)Lcom/google/android/gms/ads/internal/client/zze;

    .line 154
    .line 155
    .line 156
    move-result-object p1

    .line 157
    invoke-virtual {p0, p1}, Ll/c7u0;->i(Lcom/google/android/gms/ads/internal/client/zze;)V

    .line 158
    .line 159
    .line 160
    return-void

    .line 161
    :cond_4
    :goto_0
    iget-boolean p2, p0, Ll/fwt0;->s:Z

    .line 162
    .line 163
    if-eqz p2, :cond_5

    .line 164
    .line 165
    const-string p2, "App open interstitial ad is already visible."

    .line 166
    .line 167
    invoke-static {p2}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    iget-object p2, p0, Ll/fwt0;->p:Ll/c7u0;

    .line 171
    .line 172
    const/16 v1, 0xa

    .line 173
    .line 174
    invoke-static {v1, v0, v0}, Ll/v8w0;->d(ILjava/lang/String;Lcom/google/android/gms/ads/internal/client/zze;)Lcom/google/android/gms/ads/internal/client/zze;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    invoke-virtual {p2, v0}, Ll/c7u0;->i(Lcom/google/android/gms/ads/internal/client/zze;)V

    .line 179
    .line 180
    .line 181
    :cond_5
    iget-boolean p2, p0, Ll/fwt0;->s:Z

    .line 182
    .line 183
    if-nez p2, :cond_7

    .line 184
    .line 185
    :try_start_0
    iget-object p2, p0, Ll/fwt0;->n:Ll/wiu0;

    .line 186
    .line 187
    iget-object v0, p0, Ll/fwt0;->p:Ll/c7u0;

    .line 188
    .line 189
    invoke-interface {p2, p3, p1, v0}, Ll/wiu0;->a(ZLandroid/content/Context;Ll/c7u0;)V

    .line 190
    .line 191
    .line 192
    iget-boolean p1, p0, Ll/fwt0;->q:Z

    .line 193
    .line 194
    if-eqz p1, :cond_6

    .line 195
    .line 196
    iget-object p1, p0, Ll/fwt0;->o:Ll/dfu0;

    .line 197
    .line 198
    invoke-virtual {p1}, Ll/dfu0;->zza()V
    :try_end_0
    .catch Lcom/google/android/gms/internal/ads/zzdkv; {:try_start_0 .. :try_end_0} :catch_0

    .line 199
    .line 200
    .line 201
    goto :goto_1

    .line 202
    :catch_0
    move-exception p1

    .line 203
    goto :goto_2

    .line 204
    :cond_6
    :goto_1
    const/4 p1, 0x1

    .line 205
    iput-boolean p1, p0, Ll/fwt0;->s:Z

    .line 206
    .line 207
    return-void

    .line 208
    :goto_2
    iget-object p0, p0, Ll/fwt0;->p:Ll/c7u0;

    .line 209
    .line 210
    invoke-virtual {p0, p1}, Ll/c7u0;->Z(Lcom/google/android/gms/internal/ads/zzdkv;)V

    .line 211
    .line 212
    .line 213
    :cond_7
    return-void
.end method

.method public final l(JI)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fwt0;->m:Ll/uvt0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/uvt0;->a(JI)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
