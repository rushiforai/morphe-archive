.class public final Ll/bfv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wiu0;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lcom/google/android/gms/internal/ads/zzcei;

.field public final c:Ll/hpr;

.field public final d:Ll/q6w0;

.field public final e:Ll/wit0;

.field public final f:Ll/o7w0;

.field public final g:Ll/dqs0;

.field public final h:Z

.field public final i:Ll/qbv0;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/internal/ads/zzcei;Ll/hpr;Ll/q6w0;Ll/wit0;Ll/o7w0;ZLl/dqs0;Ll/qbv0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/bfv0;->a:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Ll/bfv0;->b:Lcom/google/android/gms/internal/ads/zzcei;

    .line 7
    .line 8
    iput-object p3, p0, Ll/bfv0;->c:Ll/hpr;

    .line 9
    .line 10
    iput-object p4, p0, Ll/bfv0;->d:Ll/q6w0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/bfv0;->e:Ll/wit0;

    .line 13
    .line 14
    iput-object p6, p0, Ll/bfv0;->f:Ll/o7w0;

    .line 15
    .line 16
    iput-object p8, p0, Ll/bfv0;->g:Ll/dqs0;

    .line 17
    .line 18
    iput-boolean p7, p0, Ll/bfv0;->h:Z

    .line 19
    .line 20
    iput-object p9, p0, Ll/bfv0;->i:Ll/qbv0;

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public final a(ZLandroid/content/Context;Ll/c7u0;)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Ll/bfv0;->c:Ll/hpr;

    .line 4
    .line 5
    invoke-static {v1}, Ll/pvw0;->q(Ljava/util/concurrent/Future;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, Ll/ihu0;

    .line 10
    .line 11
    iget-object v2, v0, Ll/bfv0;->e:Ll/wit0;

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
    iget-boolean v2, v0, Ll/bfv0;->h:Z

    .line 20
    .line 21
    const/4 v4, 0x0

    .line 22
    if-eqz v2, :cond_0

    .line 23
    .line 24
    iget-object v2, v0, Ll/bfv0;->g:Ll/dqs0;

    .line 25
    .line 26
    invoke-virtual {v2, v4}, Ll/dqs0;->e(Z)Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    move v5, v2

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    move v5, v4

    .line 33
    :goto_0
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 34
    .line 35
    .line 36
    iget-object v2, v0, Ll/bfv0;->a:Landroid/content/Context;

    .line 37
    .line 38
    iget-boolean v6, v0, Ll/bfv0;->h:Z

    .line 39
    .line 40
    invoke-static {v2}, Lcom/google/android/gms/ads/internal/util/b;->h(Landroid/content/Context;)Z

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-eqz v6, :cond_1

    .line 45
    .line 46
    iget-object v4, v0, Ll/bfv0;->g:Ll/dqs0;

    .line 47
    .line 48
    invoke-virtual {v4}, Ll/dqs0;->d()Z

    .line 49
    .line 50
    .line 51
    move-result v4

    .line 52
    :cond_1
    move v7, v4

    .line 53
    iget-boolean v4, v0, Ll/bfv0;->h:Z

    .line 54
    .line 55
    if-eqz v4, :cond_2

    .line 56
    .line 57
    iget-object v4, v0, Ll/bfv0;->g:Ll/dqs0;

    .line 58
    .line 59
    invoke-virtual {v4}, Ll/dqs0;->a()F

    .line 60
    .line 61
    .line 62
    move-result v4

    .line 63
    :goto_1
    move v8, v4

    .line 64
    goto :goto_2

    .line 65
    :cond_2
    const/4 v4, 0x0

    .line 66
    goto :goto_1

    .line 67
    :goto_2
    iget-object v4, v0, Ll/bfv0;->d:Ll/q6w0;

    .line 68
    .line 69
    iget-boolean v11, v4, Ll/q6w0;->P:Z

    .line 70
    .line 71
    move-object v4, v12

    .line 72
    const/4 v12, 0x0

    .line 73
    const/4 v9, -0x1

    .line 74
    move/from16 v10, p1

    .line 75
    .line 76
    move v6, v2

    .line 77
    invoke-direct/range {v4 .. v12}, Lcom/google/android/gms/ads/internal/zzj;-><init>(ZZZFIZZZ)V

    .line 78
    .line 79
    .line 80
    if-eqz p3, :cond_3

    .line 81
    .line 82
    invoke-virtual/range {p3 .. p3}, Ll/c7u0;->zzf()V

    .line 83
    .line 84
    .line 85
    :cond_3
    invoke-static {}, Ll/bxy0;->k()Ll/ghy0;

    .line 86
    .line 87
    .line 88
    move-object v12, v4

    .line 89
    new-instance v4, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 90
    .line 91
    invoke-virtual {v1}, Ll/ihu0;->j()Ll/miu0;

    .line 92
    .line 93
    .line 94
    move-result-object v6

    .line 95
    iget-object v8, v0, Ll/bfv0;->e:Ll/wit0;

    .line 96
    .line 97
    iget-object v1, v0, Ll/bfv0;->d:Ll/q6w0;

    .line 98
    .line 99
    iget-object v10, v0, Ll/bfv0;->b:Lcom/google/android/gms/internal/ads/zzcei;

    .line 100
    .line 101
    iget v9, v1, Ll/q6w0;->R:I

    .line 102
    .line 103
    iget-object v11, v1, Ll/q6w0;->C:Ljava/lang/String;

    .line 104
    .line 105
    iget-object v2, v1, Ll/q6w0;->t:Ll/u6w0;

    .line 106
    .line 107
    iget-object v13, v2, Ll/u6w0;->b:Ljava/lang/String;

    .line 108
    .line 109
    iget-object v14, v2, Ll/u6w0;->a:Ljava/lang/String;

    .line 110
    .line 111
    iget-object v2, v0, Ll/bfv0;->f:Ll/o7w0;

    .line 112
    .line 113
    iget-boolean v1, v1, Ll/q6w0;->j0:Z

    .line 114
    .line 115
    if-eqz v1, :cond_4

    .line 116
    .line 117
    iget-object v0, v0, Ll/bfv0;->i:Ll/qbv0;

    .line 118
    .line 119
    :goto_3
    move-object/from16 v17, v0

    .line 120
    .line 121
    goto :goto_4

    .line 122
    :cond_4
    const/4 v0, 0x0

    .line 123
    goto :goto_3

    .line 124
    :goto_4
    const/4 v7, 0x0

    .line 125
    iget-object v15, v2, Ll/o7w0;->f:Ljava/lang/String;

    .line 126
    .line 127
    const/4 v5, 0x0

    .line 128
    move-object/from16 v16, p3

    .line 129
    .line 130
    invoke-direct/range {v4 .. v17}, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;-><init>(Ll/har0;Ll/joy0;Ll/rar0;Ll/wit0;ILcom/google/android/gms/internal/ads/zzcei;Ljava/lang/String;Lcom/google/android/gms/ads/internal/zzj;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/c7u0;Ll/k1t0;)V

    .line 131
    .line 132
    .line 133
    move-object/from16 v0, p2

    .line 134
    .line 135
    invoke-static {v0, v4, v3}, Ll/ghy0;->a(Landroid/content/Context;Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;Z)V

    .line 136
    .line 137
    .line 138
    return-void
.end method
