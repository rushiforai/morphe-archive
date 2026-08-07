.class final Lcom/google/android/libraries/places/internal/zzbtx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/libraries/places/internal/zzbws;


# instance fields
.field zza:I

.field zzb:B

.field zzc:I

.field zzd:I

.field zze:S

.field private final zzf:Lcom/google/android/libraries/places/internal/zzbwd;


# direct methods
.method public constructor <init>(Lcom/google/android/libraries/places/internal/zzbwd;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbtx;->zzf:Lcom/google/android/libraries/places/internal/zzbwd;

    return-void
.end method


# virtual methods
.method public final close()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    return-void
.end method

.method public final zza(Lcom/google/android/libraries/places/internal/zzbwb;J)J
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    :goto_0
    iget p2, p0, Lcom/google/android/libraries/places/internal/zzbtx;->zzd:I

    .line 2
    .line 3
    iget-object p3, p0, Lcom/google/android/libraries/places/internal/zzbtx;->zzf:Lcom/google/android/libraries/places/internal/zzbwd;

    .line 4
    .line 5
    const-wide/16 v0, -0x1

    .line 6
    .line 7
    if-nez p2, :cond_4

    .line 8
    .line 9
    iget-short p2, p0, Lcom/google/android/libraries/places/internal/zzbtx;->zze:S

    .line 10
    .line 11
    int-to-long v2, p2

    .line 12
    invoke-interface {p3, v2, v3}, Lcom/google/android/libraries/places/internal/zzbwd;->zzF(J)V

    .line 13
    .line 14
    .line 15
    const/4 p2, 0x0

    .line 16
    iput-short p2, p0, Lcom/google/android/libraries/places/internal/zzbtx;->zze:S

    .line 17
    .line 18
    iget-byte p3, p0, Lcom/google/android/libraries/places/internal/zzbtx;->zzb:B

    .line 19
    .line 20
    and-int/lit8 p3, p3, 0x4

    .line 21
    .line 22
    if-eqz p3, :cond_0

    .line 23
    .line 24
    goto/16 :goto_1

    .line 25
    .line 26
    :cond_0
    iget p3, p0, Lcom/google/android/libraries/places/internal/zzbtx;->zzc:I

    .line 27
    .line 28
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbtx;->zzf:Lcom/google/android/libraries/places/internal/zzbwd;

    .line 29
    .line 30
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbub;->zzb(Lcom/google/android/libraries/places/internal/zzbwd;)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    iput v0, p0, Lcom/google/android/libraries/places/internal/zzbtx;->zzd:I

    .line 35
    .line 36
    iput v0, p0, Lcom/google/android/libraries/places/internal/zzbtx;->zza:I

    .line 37
    .line 38
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbtx;->zzf:Lcom/google/android/libraries/places/internal/zzbwd;

    .line 39
    .line 40
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzbwd;->zzc()B

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    and-int/lit16 v0, v0, 0xff

    .line 45
    .line 46
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbtx;->zzf:Lcom/google/android/libraries/places/internal/zzbwd;

    .line 47
    .line 48
    invoke-interface {v1}, Lcom/google/android/libraries/places/internal/zzbwd;->zzc()B

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    and-int/lit16 v1, v1, 0xff

    .line 53
    .line 54
    int-to-byte v1, v1

    .line 55
    iput-byte v1, p0, Lcom/google/android/libraries/places/internal/zzbtx;->zzb:B

    .line 56
    .line 57
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzbub;->zzg()Ljava/util/logging/Logger;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    sget-object v2, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    .line 62
    .line 63
    invoke-virtual {v1, v2}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    int-to-byte v0, v0

    .line 68
    if-eqz v1, :cond_1

    .line 69
    .line 70
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzbub;->zzg()Ljava/util/logging/Logger;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    iget v3, p0, Lcom/google/android/libraries/places/internal/zzbtx;->zzc:I

    .line 75
    .line 76
    iget v4, p0, Lcom/google/android/libraries/places/internal/zzbtx;->zza:I

    .line 77
    .line 78
    iget-byte v5, p0, Lcom/google/android/libraries/places/internal/zzbtx;->zzb:B

    .line 79
    .line 80
    const/4 v6, 0x1

    .line 81
    invoke-static {v6, v3, v4, v0, v5}, Lcom/google/android/libraries/places/internal/zzbty;->zza(ZIIBB)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    const-string v4, "io.grpc.okhttp.internal.framed.Http2$ContinuationSource"

    .line 86
    .line 87
    const-string v5, "readContinuationHeader"

    .line 88
    .line 89
    invoke-virtual {v1, v2, v4, v5, v3}, Ljava/util/logging/Logger;->logp(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    :cond_1
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbtx;->zzf:Lcom/google/android/libraries/places/internal/zzbwd;

    .line 93
    .line 94
    invoke-interface {v1}, Lcom/google/android/libraries/places/internal/zzbwd;->zze()I

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    const v2, 0x7fffffff

    .line 99
    .line 100
    .line 101
    and-int/2addr v1, v2

    .line 102
    iput v1, p0, Lcom/google/android/libraries/places/internal/zzbtx;->zzc:I

    .line 103
    .line 104
    const/16 v2, 0x9

    .line 105
    .line 106
    if-ne v0, v2, :cond_3

    .line 107
    .line 108
    if-ne v1, p3, :cond_2

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_2
    new-array p0, p2, [Ljava/lang/Object;

    .line 112
    .line 113
    const-string p1, "TYPE_CONTINUATION streamId changed"

    .line 114
    .line 115
    invoke-static {p1, p0}, Lcom/google/android/libraries/places/internal/zzbub;->zze(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    throw p0

    .line 120
    :cond_3
    invoke-static {v0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    const-string p1, "%s != TYPE_CONTINUATION"

    .line 129
    .line 130
    invoke-static {p1, p0}, Lcom/google/android/libraries/places/internal/zzbub;->zze(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    throw p0

    .line 135
    :cond_4
    const-wide/16 v2, 0x2000

    .line 136
    .line 137
    int-to-long v4, p2

    .line 138
    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->min(JJ)J

    .line 139
    .line 140
    .line 141
    move-result-wide v2

    .line 142
    invoke-interface {p3, p1, v2, v3}, Lcom/google/android/libraries/places/internal/zzbws;->zza(Lcom/google/android/libraries/places/internal/zzbwb;J)J

    .line 143
    .line 144
    .line 145
    move-result-wide p1

    .line 146
    cmp-long p3, p1, v0

    .line 147
    .line 148
    if-eqz p3, :cond_5

    .line 149
    .line 150
    iget p3, p0, Lcom/google/android/libraries/places/internal/zzbtx;->zzd:I

    .line 151
    .line 152
    long-to-int v0, p1

    .line 153
    sub-int/2addr p3, v0

    .line 154
    iput p3, p0, Lcom/google/android/libraries/places/internal/zzbtx;->zzd:I

    .line 155
    .line 156
    return-wide p1

    .line 157
    :cond_5
    :goto_1
    return-wide v0
.end method
