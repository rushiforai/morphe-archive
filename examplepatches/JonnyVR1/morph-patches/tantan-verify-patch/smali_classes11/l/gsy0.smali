.class public final Ll/gsy0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/sqr0;

.field public final b:I

.field public final c:I

.field public final d:I

.field public final e:I

.field public final f:I

.field public final g:I

.field public final h:I

.field public final i:Ll/gpu0;

.field public final j:Z

.field public final k:Z

.field public final l:Z


# direct methods
.method public constructor <init>(Ll/sqr0;IIIIIIILl/gpu0;ZZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/gsy0;->a:Ll/sqr0;

    .line 5
    .line 6
    iput p2, p0, Ll/gsy0;->b:I

    .line 7
    .line 8
    iput p3, p0, Ll/gsy0;->c:I

    .line 9
    .line 10
    iput p4, p0, Ll/gsy0;->d:I

    .line 11
    .line 12
    iput p5, p0, Ll/gsy0;->e:I

    .line 13
    .line 14
    iput p6, p0, Ll/gsy0;->f:I

    .line 15
    .line 16
    iput p7, p0, Ll/gsy0;->g:I

    .line 17
    .line 18
    iput p8, p0, Ll/gsy0;->h:I

    .line 19
    .line 20
    iput-object p9, p0, Ll/gsy0;->i:Ll/gpu0;

    .line 21
    .line 22
    const/4 p1, 0x0

    .line 23
    iput-boolean p1, p0, Ll/gsy0;->j:Z

    .line 24
    .line 25
    iput-boolean p1, p0, Ll/gsy0;->k:Z

    .line 26
    .line 27
    iput-boolean p1, p0, Ll/gsy0;->l:Z

    .line 28
    .line 29
    return-void
.end method


# virtual methods
.method public final a(Ll/w3y0;I)Landroid/media/AudioTrack;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzpx;
        }
    .end annotation

    .line 1
    :try_start_0
    sget v0, Ll/mpw0;->a:I

    .line 2
    .line 3
    const/16 v1, 0x1d

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    if-lt v0, v1, :cond_1

    .line 7
    .line 8
    iget v0, p0, Ll/gsy0;->e:I

    .line 9
    .line 10
    iget v1, p0, Ll/gsy0;->f:I

    .line 11
    .line 12
    iget v3, p0, Ll/gsy0;->g:I

    .line 13
    .line 14
    invoke-static {v0, v1, v3}, Ll/mpw0;->K(III)Landroid/media/AudioFormat;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p1}, Ll/w3y0;->a()Ll/ttx0;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iget-object p1, p1, Ll/ttx0;->a:Landroid/media/AudioAttributes;

    .line 23
    .line 24
    new-instance v1, Landroid/media/AudioTrack$Builder;

    .line 25
    .line 26
    invoke-direct {v1}, Landroid/media/AudioTrack$Builder;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1, p1}, Landroid/media/AudioTrack$Builder;->setAudioAttributes(Landroid/media/AudioAttributes;)Landroid/media/AudioTrack$Builder;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p1, v0}, Landroid/media/AudioTrack$Builder;->setAudioFormat(Landroid/media/AudioFormat;)Landroid/media/AudioTrack$Builder;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1, v2}, Landroid/media/AudioTrack$Builder;->setTransferMode(I)Landroid/media/AudioTrack$Builder;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iget v0, p0, Ll/gsy0;->h:I

    .line 42
    .line 43
    invoke-virtual {p1, v0}, Landroid/media/AudioTrack$Builder;->setBufferSizeInBytes(I)Landroid/media/AudioTrack$Builder;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p1, p2}, Landroid/media/AudioTrack$Builder;->setSessionId(I)Landroid/media/AudioTrack$Builder;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    iget p2, p0, Ll/gsy0;->c:I

    .line 52
    .line 53
    if-ne p2, v2, :cond_0

    .line 54
    .line 55
    move p2, v2

    .line 56
    goto :goto_0

    .line 57
    :cond_0
    const/4 p2, 0x0

    .line 58
    :goto_0
    invoke-static {p1, p2}, Ll/jmd;->a(Landroid/media/AudioTrack$Builder;Z)Landroid/media/AudioTrack$Builder;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p1}, Landroid/media/AudioTrack$Builder;->build()Landroid/media/AudioTrack;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    goto :goto_2

    .line 67
    :catch_0
    move-exception v0

    .line 68
    :goto_1
    move-object p1, v0

    .line 69
    move-object v7, p1

    .line 70
    goto :goto_3

    .line 71
    :catch_1
    move-exception v0

    .line 72
    goto :goto_1

    .line 73
    :cond_1
    new-instance v3, Landroid/media/AudioTrack;

    .line 74
    .line 75
    invoke-virtual {p1}, Ll/w3y0;->a()Ll/ttx0;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    iget-object v4, p1, Ll/ttx0;->a:Landroid/media/AudioAttributes;

    .line 80
    .line 81
    iget p1, p0, Ll/gsy0;->e:I

    .line 82
    .line 83
    iget v0, p0, Ll/gsy0;->f:I

    .line 84
    .line 85
    iget v1, p0, Ll/gsy0;->g:I

    .line 86
    .line 87
    invoke-static {p1, v0, v1}, Ll/mpw0;->K(III)Landroid/media/AudioFormat;

    .line 88
    .line 89
    .line 90
    move-result-object v5

    .line 91
    iget v6, p0, Ll/gsy0;->h:I

    .line 92
    .line 93
    const/4 v7, 0x1

    .line 94
    move v8, p2

    .line 95
    invoke-direct/range {v3 .. v8}, Landroid/media/AudioTrack;-><init>(Landroid/media/AudioAttributes;Landroid/media/AudioFormat;III)V
    :try_end_0
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 96
    .line 97
    .line 98
    move-object p1, v3

    .line 99
    :goto_2
    invoke-virtual {p1}, Landroid/media/AudioTrack;->getState()I

    .line 100
    .line 101
    .line 102
    move-result v4

    .line 103
    if-ne v4, v2, :cond_2

    .line 104
    .line 105
    return-object p1

    .line 106
    :cond_2
    :try_start_1
    invoke-virtual {p1}, Landroid/media/AudioTrack;->release()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 107
    .line 108
    .line 109
    :catch_2
    iget v5, p0, Ll/gsy0;->e:I

    .line 110
    .line 111
    iget v6, p0, Ll/gsy0;->f:I

    .line 112
    .line 113
    iget v7, p0, Ll/gsy0;->h:I

    .line 114
    .line 115
    iget-object v8, p0, Ll/gsy0;->a:Ll/sqr0;

    .line 116
    .line 117
    new-instance v3, Lcom/google/android/gms/internal/ads/zzpx;

    .line 118
    .line 119
    invoke-virtual {p0}, Ll/gsy0;->c()Z

    .line 120
    .line 121
    .line 122
    move-result v9

    .line 123
    const/4 v10, 0x0

    .line 124
    invoke-direct/range {v3 .. v10}, Lcom/google/android/gms/internal/ads/zzpx;-><init>(IIIILl/sqr0;ZLjava/lang/Exception;)V

    .line 125
    .line 126
    .line 127
    throw v3

    .line 128
    :goto_3
    iget v2, p0, Ll/gsy0;->e:I

    .line 129
    .line 130
    iget v3, p0, Ll/gsy0;->f:I

    .line 131
    .line 132
    iget v4, p0, Ll/gsy0;->h:I

    .line 133
    .line 134
    iget-object v5, p0, Ll/gsy0;->a:Ll/sqr0;

    .line 135
    .line 136
    new-instance v0, Lcom/google/android/gms/internal/ads/zzpx;

    .line 137
    .line 138
    const/4 v1, 0x0

    .line 139
    invoke-virtual {p0}, Ll/gsy0;->c()Z

    .line 140
    .line 141
    .line 142
    move-result v6

    .line 143
    invoke-direct/range {v0 .. v7}, Lcom/google/android/gms/internal/ads/zzpx;-><init>(IIIILl/sqr0;ZLjava/lang/Exception;)V

    .line 144
    .line 145
    .line 146
    throw v0
.end method

.method public final b()Ll/jqy0;
    .locals 8

    .line 1
    iget v0, p0, Ll/gsy0;->c:I

    .line 2
    .line 3
    new-instance v1, Ll/jqy0;

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    if-ne v0, v2, :cond_0

    .line 7
    .line 8
    :goto_0
    move v6, v2

    .line 9
    goto :goto_1

    .line 10
    :cond_0
    const/4 v2, 0x0

    .line 11
    goto :goto_0

    .line 12
    :goto_1
    iget v4, p0, Ll/gsy0;->f:I

    .line 13
    .line 14
    iget v3, p0, Ll/gsy0;->e:I

    .line 15
    .line 16
    iget v2, p0, Ll/gsy0;->g:I

    .line 17
    .line 18
    const/4 v5, 0x0

    .line 19
    iget v7, p0, Ll/gsy0;->h:I

    .line 20
    .line 21
    invoke-direct/range {v1 .. v7}, Ll/jqy0;-><init>(IIIZZI)V

    .line 22
    .line 23
    .line 24
    return-object v1
.end method

.method public final c()Z
    .locals 1

    .line 1
    iget p0, p0, Ll/gsy0;->c:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method
