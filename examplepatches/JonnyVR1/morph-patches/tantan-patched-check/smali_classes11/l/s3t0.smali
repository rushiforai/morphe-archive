.class public abstract Ll/s3t0;
.super Ll/q6s0;
.source "SourceFile"

# interfaces
.implements Ll/t3t0;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    const-string v0, "com.google.android.gms.ads.internal.request.IAdRequestService"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ll/q6s0;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final n8(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    const/4 p4, 0x0

    .line 2
    const/4 v0, 0x1

    .line 3
    if-eq p1, v0, :cond_f

    .line 4
    .line 5
    const/4 v1, 0x2

    .line 6
    if-eq p1, v1, :cond_c

    .line 7
    .line 8
    const/4 v1, 0x4

    .line 9
    const-string v2, "com.google.android.gms.ads.internal.request.INonagonStreamingResponseListener"

    .line 10
    .line 11
    if-eq p1, v1, :cond_9

    .line 12
    .line 13
    const/4 v1, 0x5

    .line 14
    if-eq p1, v1, :cond_6

    .line 15
    .line 16
    const/4 v1, 0x6

    .line 17
    if-eq p1, v1, :cond_3

    .line 18
    .line 19
    const/4 v1, 0x7

    .line 20
    if-eq p1, v1, :cond_0

    .line 21
    .line 22
    const/4 p0, 0x0

    .line 23
    return p0

    .line 24
    :cond_0
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    if-nez v1, :cond_1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    invoke-interface {v1, v2}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    .line 36
    .line 37
    .line 38
    move-result-object p4

    .line 39
    instance-of v2, p4, Ll/n4t0;

    .line 40
    .line 41
    if-eqz v2, :cond_2

    .line 42
    .line 43
    check-cast p4, Ll/n4t0;

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    new-instance p4, Ll/b4t0;

    .line 47
    .line 48
    invoke-direct {p4, v1}, Ll/b4t0;-><init>(Landroid/os/IBinder;)V

    .line 49
    .line 50
    .line 51
    :goto_0
    invoke-static {p2}, Ll/r6s0;->c(Landroid/os/Parcel;)V

    .line 52
    .line 53
    .line 54
    invoke-interface {p0, p1, p4}, Ll/t3t0;->r1(Ljava/lang/String;Ll/n4t0;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 58
    .line 59
    .line 60
    goto/16 :goto_5

    .line 61
    .line 62
    :cond_3
    sget-object p1, Lcom/google/android/gms/internal/ads/zzbze;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 63
    .line 64
    invoke-static {p2, p1}, Ll/r6s0;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    check-cast p1, Lcom/google/android/gms/internal/ads/zzbze;

    .line 69
    .line 70
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    if-nez v1, :cond_4

    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_4
    invoke-interface {v1, v2}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    .line 78
    .line 79
    .line 80
    move-result-object p4

    .line 81
    instance-of v2, p4, Ll/n4t0;

    .line 82
    .line 83
    if-eqz v2, :cond_5

    .line 84
    .line 85
    check-cast p4, Ll/n4t0;

    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_5
    new-instance p4, Ll/b4t0;

    .line 89
    .line 90
    invoke-direct {p4, v1}, Ll/b4t0;-><init>(Landroid/os/IBinder;)V

    .line 91
    .line 92
    .line 93
    :goto_1
    invoke-static {p2}, Ll/r6s0;->c(Landroid/os/Parcel;)V

    .line 94
    .line 95
    .line 96
    invoke-interface {p0, p1, p4}, Ll/t3t0;->q3(Lcom/google/android/gms/internal/ads/zzbze;Ll/n4t0;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 100
    .line 101
    .line 102
    goto/16 :goto_5

    .line 103
    .line 104
    :cond_6
    sget-object p1, Lcom/google/android/gms/internal/ads/zzbze;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 105
    .line 106
    invoke-static {p2, p1}, Ll/r6s0;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    check-cast p1, Lcom/google/android/gms/internal/ads/zzbze;

    .line 111
    .line 112
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    if-nez v1, :cond_7

    .line 117
    .line 118
    goto :goto_2

    .line 119
    :cond_7
    invoke-interface {v1, v2}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    .line 120
    .line 121
    .line 122
    move-result-object p4

    .line 123
    instance-of v2, p4, Ll/n4t0;

    .line 124
    .line 125
    if-eqz v2, :cond_8

    .line 126
    .line 127
    check-cast p4, Ll/n4t0;

    .line 128
    .line 129
    goto :goto_2

    .line 130
    :cond_8
    new-instance p4, Ll/b4t0;

    .line 131
    .line 132
    invoke-direct {p4, v1}, Ll/b4t0;-><init>(Landroid/os/IBinder;)V

    .line 133
    .line 134
    .line 135
    :goto_2
    invoke-static {p2}, Ll/r6s0;->c(Landroid/os/Parcel;)V

    .line 136
    .line 137
    .line 138
    invoke-interface {p0, p1, p4}, Ll/t3t0;->c3(Lcom/google/android/gms/internal/ads/zzbze;Ll/n4t0;)V

    .line 139
    .line 140
    .line 141
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 142
    .line 143
    .line 144
    goto :goto_5

    .line 145
    :cond_9
    sget-object p1, Lcom/google/android/gms/internal/ads/zzbze;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 146
    .line 147
    invoke-static {p2, p1}, Ll/r6s0;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    check-cast p1, Lcom/google/android/gms/internal/ads/zzbze;

    .line 152
    .line 153
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    if-nez v1, :cond_a

    .line 158
    .line 159
    goto :goto_3

    .line 160
    :cond_a
    invoke-interface {v1, v2}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    .line 161
    .line 162
    .line 163
    move-result-object p4

    .line 164
    instance-of v2, p4, Ll/n4t0;

    .line 165
    .line 166
    if-eqz v2, :cond_b

    .line 167
    .line 168
    check-cast p4, Ll/n4t0;

    .line 169
    .line 170
    goto :goto_3

    .line 171
    :cond_b
    new-instance p4, Ll/b4t0;

    .line 172
    .line 173
    invoke-direct {p4, v1}, Ll/b4t0;-><init>(Landroid/os/IBinder;)V

    .line 174
    .line 175
    .line 176
    :goto_3
    invoke-static {p2}, Ll/r6s0;->c(Landroid/os/Parcel;)V

    .line 177
    .line 178
    .line 179
    invoke-interface {p0, p1, p4}, Ll/t3t0;->L3(Lcom/google/android/gms/internal/ads/zzbze;Ll/n4t0;)V

    .line 180
    .line 181
    .line 182
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 183
    .line 184
    .line 185
    goto :goto_5

    .line 186
    :cond_c
    sget-object p0, Lcom/google/android/gms/internal/ads/zzbyf;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 187
    .line 188
    invoke-static {p2, p0}, Ll/r6s0;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 189
    .line 190
    .line 191
    move-result-object p0

    .line 192
    check-cast p0, Lcom/google/android/gms/internal/ads/zzbyf;

    .line 193
    .line 194
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    .line 195
    .line 196
    .line 197
    move-result-object p0

    .line 198
    if-nez p0, :cond_d

    .line 199
    .line 200
    goto :goto_4

    .line 201
    :cond_d
    const-string p1, "com.google.android.gms.ads.internal.request.IAdResponseListener"

    .line 202
    .line 203
    invoke-interface {p0, p1}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    .line 204
    .line 205
    .line 206
    move-result-object p0

    .line 207
    instance-of p1, p0, Ll/u3t0;

    .line 208
    .line 209
    if-eqz p1, :cond_e

    .line 210
    .line 211
    check-cast p0, Ll/u3t0;

    .line 212
    .line 213
    :cond_e
    :goto_4
    invoke-static {p2}, Ll/r6s0;->c(Landroid/os/Parcel;)V

    .line 214
    .line 215
    .line 216
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 217
    .line 218
    .line 219
    goto :goto_5

    .line 220
    :cond_f
    sget-object p0, Lcom/google/android/gms/internal/ads/zzbyf;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 221
    .line 222
    invoke-static {p2, p0}, Ll/r6s0;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 223
    .line 224
    .line 225
    move-result-object p0

    .line 226
    check-cast p0, Lcom/google/android/gms/internal/ads/zzbyf;

    .line 227
    .line 228
    invoke-static {p2}, Ll/r6s0;->c(Landroid/os/Parcel;)V

    .line 229
    .line 230
    .line 231
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 232
    .line 233
    .line 234
    invoke-static {p3, p4}, Ll/r6s0;->e(Landroid/os/Parcel;Landroid/os/Parcelable;)V

    .line 235
    .line 236
    .line 237
    :goto_5
    return v0
.end method
