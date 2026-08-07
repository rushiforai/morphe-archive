.class public final Lcom/google/android/libraries/places/internal/zzbik;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final zza:Ljava/util/Random;

.field private final zzb:J

.field private final zzc:J

.field private zzd:J


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/Random;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbik;->zza:Ljava/util/Random;

    .line 10
    .line 11
    const-wide/32 v0, 0x3b9aca00

    .line 12
    .line 13
    .line 14
    iput-wide v0, p0, Lcom/google/android/libraries/places/internal/zzbik;->zzb:J

    .line 15
    .line 16
    const-wide v2, 0x1bf08eb000L

    .line 17
    .line 18
    .line 19
    .line 20
    .line 21
    iput-wide v2, p0, Lcom/google/android/libraries/places/internal/zzbik;->zzc:J

    .line 22
    .line 23
    iput-wide v0, p0, Lcom/google/android/libraries/places/internal/zzbik;->zzd:J

    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public final zza()J
    .locals 8

    .line 1
    iget-wide v0, p0, Lcom/google/android/libraries/places/internal/zzbik;->zzd:J

    .line 2
    .line 3
    long-to-double v2, v0

    .line 4
    const-wide v4, 0x3ff999999999999aL    # 1.6

    .line 5
    .line 6
    .line 7
    .line 8
    .line 9
    mul-double/2addr v4, v2

    .line 10
    double-to-long v4, v4

    .line 11
    iget-wide v6, p0, Lcom/google/android/libraries/places/internal/zzbik;->zzc:J

    .line 12
    .line 13
    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->min(JJ)J

    .line 14
    .line 15
    .line 16
    move-result-wide v4

    .line 17
    iput-wide v4, p0, Lcom/google/android/libraries/places/internal/zzbik;->zzd:J

    .line 18
    .line 19
    const-wide v4, 0x3fc999999999999aL    # 0.2

    .line 20
    .line 21
    .line 22
    .line 23
    .line 24
    mul-double/2addr v4, v2

    .line 25
    const-wide v6, -0x4036666666666666L    # -0.2

    .line 26
    .line 27
    .line 28
    .line 29
    .line 30
    mul-double/2addr v2, v6

    .line 31
    cmpl-double v6, v4, v2

    .line 32
    .line 33
    if-ltz v6, :cond_0

    .line 34
    .line 35
    const/4 v6, 0x1

    .line 36
    goto :goto_0

    .line 37
    :cond_0
    const/4 v6, 0x0

    .line 38
    :goto_0
    invoke-static {v6}, Lcom/google/android/libraries/places/internal/zzmt;->zze(Z)V

    .line 39
    .line 40
    .line 41
    sub-double/2addr v4, v2

    .line 42
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbik;->zza:Ljava/util/Random;

    .line 43
    .line 44
    invoke-virtual {p0}, Ljava/util/Random;->nextDouble()D

    .line 45
    .line 46
    .line 47
    move-result-wide v6

    .line 48
    mul-double/2addr v6, v4

    .line 49
    add-double/2addr v6, v2

    .line 50
    double-to-long v2, v6

    .line 51
    add-long/2addr v0, v2

    .line 52
    return-wide v0
.end method
