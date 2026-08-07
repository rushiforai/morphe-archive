.class public final Lcom/google/android/libraries/places/internal/zzbqz;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final zza:Lcom/google/android/libraries/places/internal/zzbqw;


# instance fields
.field private final zzb:Lcom/google/android/libraries/places/internal/zzbqt;

.field private zzc:J

.field private zzd:J

.field private zze:J

.field private zzf:Lcom/google/android/libraries/places/internal/zzbqx;

.field private zzg:J

.field private final zzh:Lcom/google/android/libraries/places/internal/zzbkj;

.field private volatile zzi:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/google/android/libraries/places/internal/zzbqw;

    sget-object v1, Lcom/google/android/libraries/places/internal/zzbqt;->zza:Lcom/google/android/libraries/places/internal/zzbqt;

    invoke-direct {v0, v1}, Lcom/google/android/libraries/places/internal/zzbqw;-><init>(Lcom/google/android/libraries/places/internal/zzbqt;)V

    sput-object v0, Lcom/google/android/libraries/places/internal/zzbqz;->zza:Lcom/google/android/libraries/places/internal/zzbqw;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzbkk;->zza()Lcom/google/android/libraries/places/internal/zzbkj;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbqz;->zzh:Lcom/google/android/libraries/places/internal/zzbkj;

    .line 9
    .line 10
    sget-object v0, Lcom/google/android/libraries/places/internal/zzbqt;->zza:Lcom/google/android/libraries/places/internal/zzbqt;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbqz;->zzb:Lcom/google/android/libraries/places/internal/zzbqt;

    .line 13
    .line 14
    return-void
.end method

.method public synthetic constructor <init>(Lcom/google/android/libraries/places/internal/zzbqt;Lcom/google/android/libraries/places/internal/zzbqy;)V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Lcom/google/android/libraries/places/internal/zzbkk;->zza()Lcom/google/android/libraries/places/internal/zzbkj;

    move-result-object p2

    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzbqz;->zzh:Lcom/google/android/libraries/places/internal/zzbkj;

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbqz;->zzb:Lcom/google/android/libraries/places/internal/zzbqt;

    return-void
.end method

.method public static zza()Lcom/google/android/libraries/places/internal/zzbqw;
    .locals 1

    sget-object v0, Lcom/google/android/libraries/places/internal/zzbqz;->zza:Lcom/google/android/libraries/places/internal/zzbqw;

    return-object v0
.end method


# virtual methods
.method public final zzb()V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/google/android/libraries/places/internal/zzbqz;->zzc:J

    .line 2
    .line 3
    const-wide/16 v2, 0x1

    .line 4
    .line 5
    add-long/2addr v0, v2

    .line 6
    iput-wide v0, p0, Lcom/google/android/libraries/places/internal/zzbqz;->zzc:J

    .line 7
    .line 8
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbqz;->zzb:Lcom/google/android/libraries/places/internal/zzbqt;

    .line 9
    .line 10
    invoke-interface {p0}, Lcom/google/android/libraries/places/internal/zzbqt;->zza()J

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final zzc()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbqz;->zzh:Lcom/google/android/libraries/places/internal/zzbkj;

    .line 2
    .line 3
    const-wide/16 v1, 0x1

    .line 4
    .line 5
    invoke-interface {v0, v1, v2}, Lcom/google/android/libraries/places/internal/zzbkj;->zza(J)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbqz;->zzb:Lcom/google/android/libraries/places/internal/zzbqt;

    .line 9
    .line 10
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzbqt;->zza()J

    .line 11
    .line 12
    .line 13
    move-result-wide v0

    .line 14
    iput-wide v0, p0, Lcom/google/android/libraries/places/internal/zzbqz;->zzi:J

    .line 15
    .line 16
    return-void
.end method

.method public final zzd(I)V
    .locals 4

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-wide v0, p0, Lcom/google/android/libraries/places/internal/zzbqz;->zzg:J

    .line 5
    .line 6
    int-to-long v2, p1

    .line 7
    add-long/2addr v0, v2

    .line 8
    iput-wide v0, p0, Lcom/google/android/libraries/places/internal/zzbqz;->zzg:J

    .line 9
    .line 10
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbqz;->zzb:Lcom/google/android/libraries/places/internal/zzbqt;

    .line 11
    .line 12
    invoke-interface {p0}, Lcom/google/android/libraries/places/internal/zzbqt;->zza()J

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final zze(Z)V
    .locals 4

    const-wide/16 v0, 0x1

    if-eqz p1, :cond_0

    iget-wide v2, p0, Lcom/google/android/libraries/places/internal/zzbqz;->zzd:J

    add-long/2addr v2, v0

    iput-wide v2, p0, Lcom/google/android/libraries/places/internal/zzbqz;->zzd:J

    return-void

    :cond_0
    iget-wide v2, p0, Lcom/google/android/libraries/places/internal/zzbqz;->zze:J

    add-long/2addr v2, v0

    iput-wide v2, p0, Lcom/google/android/libraries/places/internal/zzbqz;->zze:J

    return-void
.end method

.method public final zzf(Lcom/google/android/libraries/places/internal/zzbqx;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbqz;->zzf:Lcom/google/android/libraries/places/internal/zzbqx;

    return-void
.end method
