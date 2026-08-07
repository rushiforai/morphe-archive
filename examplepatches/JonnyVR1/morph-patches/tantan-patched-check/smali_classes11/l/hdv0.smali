.class public final Ll/hdv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wiu0;


# instance fields
.field public final a:Lcom/google/android/gms/internal/ads/zzcei;

.field public final b:Ll/hpr;

.field public final c:Ll/q6w0;

.field public final d:Ll/wit0;

.field public final e:Ll/o7w0;

.field public final f:Ll/dqs0;

.field public final g:Z

.field public final h:Ll/qbv0;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/ads/zzcei;Ll/hpr;Ll/q6w0;Ll/wit0;Ll/o7w0;ZLl/dqs0;Ll/qbv0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/hdv0;->a:Lcom/google/android/gms/internal/ads/zzcei;

    .line 5
    .line 6
    iput-object p2, p0, Ll/hdv0;->b:Ll/hpr;

    .line 7
    .line 8
    iput-object p3, p0, Ll/hdv0;->c:Ll/q6w0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/hdv0;->d:Ll/wit0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/hdv0;->e:Ll/o7w0;

    .line 13
    .line 14
    iput-boolean p6, p0, Ll/hdv0;->g:Z

    .line 15
    .line 16
    iput-object p7, p0, Ll/hdv0;->f:Ll/dqs0;

    .line 17
    .line 18
    iput-object p8, p0, Ll/hdv0;->h:Ll/qbv0;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public final a(ZLandroid/content/Context;Ll/c7u0;)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Ll/hdv0;->b:Ll/hpr;

    .line 4
    .line 5
    invoke-static {v1}, Ll/pvw0;->q(Ljava/util/concurrent/Future;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, Ll/wvt0;

    .line 10
    .line 11
    iget-object v2, v0, Ll/hdv0;->d:Ll/wit0;

    .line 12
    .line 13
    const/4 v3, 0x1

    .line 14
    invoke-interface {v2, v3}, Ll/wit0;->y0(Z)V

    .line 15
    .line 16
    .line 17
    new-instance v12, Lcom/google/android/gms/ads/internal/zzj;

    .line 18
    .line 19
    iget-boolean v2, v0, Ll/hdv0;->g:Z

    .line 20
    .line 21
    if-eqz v2, :cond_0

    .line 22
    .line 23
    iget-object v2, v0, Ll/hdv0;->f:Ll/dqs0;

    .line 24
    .line 25
    invoke-virtual {v2, v3}, Ll/dqs0;->e(Z)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    move v5, v2

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    move v5, v3

    .line 32
    :goto_0
    iget-boolean v2, v0, Ll/hdv0;->g:Z

    .line 33
    .line 34
    if-eqz v2, :cond_1

    .line 35
    .line 36
    iget-object v4, v0, Ll/hdv0;->f:Ll/dqs0;

    .line 37
    .line 38
    invoke-virtual {v4}, Ll/dqs0;->d()Z

    .line 39
    .line 40
    .line 41
    move-result v4

    .line 42
    :goto_1
    move v7, v4

    .line 43
    goto :goto_2

    .line 44
    :cond_1
    const/4 v4, 0x0

    .line 45
    goto :goto_1

    .line 46
    :goto_2
    if-eqz v2, :cond_2

    .line 47
    .line 48
    iget-object v2, v0, Ll/hdv0;->f:Ll/dqs0;

    .line 49
    .line 50
    invoke-virtual {v2}, Ll/dqs0;->a()F

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    :goto_3
    move v8, v2

    .line 55
    goto :goto_4

    .line 56
    :cond_2
    const/4 v2, 0x0

    .line 57
    goto :goto_3

    .line 58
    :goto_4
    iget-object v2, v0, Ll/hdv0;->c:Ll/q6w0;

    .line 59
    .line 60
    iget-boolean v11, v2, Ll/q6w0;->P:Z

    .line 61
    .line 62
    move-object v4, v12

    .line 63
    const/4 v12, 0x0

    .line 64
    const/4 v6, 0x1

    .line 65
    const/4 v9, -0x1

    .line 66
    move/from16 v10, p1

    .line 67
    .line 68
    invoke-direct/range {v4 .. v12}, Lcom/google/android/gms/ads/internal/zzj;-><init>(ZZZFIZZZ)V

    .line 69
    .line 70
    .line 71
    if-eqz p3, :cond_3

    .line 72
    .line 73
    invoke-virtual/range {p3 .. p3}, Ll/c7u0;->zzf()V

    .line 74
    .line 75
    .line 76
    :cond_3
    invoke-static {}, Ll/bxy0;->k()Ll/ghy0;

    .line 77
    .line 78
    .line 79
    move-object v12, v4

    .line 80
    new-instance v4, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 81
    .line 82
    invoke-virtual {v1}, Ll/wvt0;->i()Ll/miu0;

    .line 83
    .line 84
    .line 85
    move-result-object v6

    .line 86
    iget-object v8, v0, Ll/hdv0;->d:Ll/wit0;

    .line 87
    .line 88
    iget-object v1, v0, Ll/hdv0;->c:Ll/q6w0;

    .line 89
    .line 90
    iget v1, v1, Ll/q6w0;->R:I

    .line 91
    .line 92
    const/4 v2, -0x1

    .line 93
    if-eq v1, v2, :cond_4

    .line 94
    .line 95
    :goto_5
    move v9, v1

    .line 96
    goto :goto_6

    .line 97
    :cond_4
    iget-object v1, v0, Ll/hdv0;->e:Ll/o7w0;

    .line 98
    .line 99
    iget-object v1, v1, Ll/o7w0;->j:Lcom/google/android/gms/ads/internal/client/zzw;

    .line 100
    .line 101
    if-eqz v1, :cond_6

    .line 102
    .line 103
    iget v1, v1, Lcom/google/android/gms/ads/internal/client/zzw;->zza:I

    .line 104
    .line 105
    if-ne v1, v3, :cond_5

    .line 106
    .line 107
    const/4 v1, 0x7

    .line 108
    goto :goto_5

    .line 109
    :cond_5
    const/4 v2, 0x2

    .line 110
    if-ne v1, v2, :cond_6

    .line 111
    .line 112
    const/4 v1, 0x6

    .line 113
    goto :goto_5

    .line 114
    :cond_6
    const-string v1, "Error setting app open orientation; no targeting orientation available."

    .line 115
    .line 116
    invoke-static {v1}, Ll/dct0;->b(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    iget-object v1, v0, Ll/hdv0;->c:Ll/q6w0;

    .line 120
    .line 121
    iget v1, v1, Ll/q6w0;->R:I

    .line 122
    .line 123
    goto :goto_5

    .line 124
    :goto_6
    iget-object v10, v0, Ll/hdv0;->a:Lcom/google/android/gms/internal/ads/zzcei;

    .line 125
    .line 126
    iget-object v1, v0, Ll/hdv0;->c:Ll/q6w0;

    .line 127
    .line 128
    iget-object v11, v1, Ll/q6w0;->C:Ljava/lang/String;

    .line 129
    .line 130
    iget-object v2, v1, Ll/q6w0;->t:Ll/u6w0;

    .line 131
    .line 132
    iget-object v13, v2, Ll/u6w0;->b:Ljava/lang/String;

    .line 133
    .line 134
    iget-object v14, v2, Ll/u6w0;->a:Ljava/lang/String;

    .line 135
    .line 136
    iget-object v2, v0, Ll/hdv0;->e:Ll/o7w0;

    .line 137
    .line 138
    iget-boolean v1, v1, Ll/q6w0;->j0:Z

    .line 139
    .line 140
    if-eqz v1, :cond_7

    .line 141
    .line 142
    iget-object v0, v0, Ll/hdv0;->h:Ll/qbv0;

    .line 143
    .line 144
    :goto_7
    move-object/from16 v17, v0

    .line 145
    .line 146
    goto :goto_8

    .line 147
    :cond_7
    const/4 v0, 0x0

    .line 148
    goto :goto_7

    .line 149
    :goto_8
    const/4 v7, 0x0

    .line 150
    iget-object v15, v2, Ll/o7w0;->f:Ljava/lang/String;

    .line 151
    .line 152
    const/4 v5, 0x0

    .line 153
    move-object/from16 v16, p3

    .line 154
    .line 155
    invoke-direct/range {v4 .. v17}, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;-><init>(Ll/har0;Ll/joy0;Ll/rar0;Ll/wit0;ILcom/google/android/gms/internal/ads/zzcei;Ljava/lang/String;Lcom/google/android/gms/ads/internal/zzj;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/c7u0;Ll/k1t0;)V

    .line 156
    .line 157
    .line 158
    move-object/from16 v0, p2

    .line 159
    .line 160
    invoke-static {v0, v4, v3}, Ll/ghy0;->a(Landroid/content/Context;Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;Z)V

    .line 161
    .line 162
    .line 163
    return-void
.end method
