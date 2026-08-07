.class public final Lcom/google/android/libraries/places/internal/zzqy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/libraries/places/internal/zzqr;


# instance fields
.field private final zza:Ljava/lang/String;

.field private final zzb:Lcom/google/android/libraries/places/internal/zzpu;

.field private final zzc:Ljava/util/logging/Level;

.field private final zzd:Ljava/util/Set;

.field private final zze:Lcom/google/android/libraries/places/internal/zzqh;


# direct methods
.method private constructor <init>()V
    .locals 8

    .line 1
    sget-object v3, Lcom/google/android/libraries/places/internal/zzpv;->zzb:Lcom/google/android/libraries/places/internal/zzpv;

    .line 2
    .line 3
    sget-object v4, Ljava/util/logging/Level;->ALL:Ljava/util/logging/Level;

    .line 4
    .line 5
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzrb;->zzd()Ljava/util/Set;

    .line 6
    .line 7
    .line 8
    move-result-object v6

    .line 9
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzrb;->zzb()Lcom/google/android/libraries/places/internal/zzqh;

    .line 10
    .line 11
    .line 12
    move-result-object v7

    .line 13
    const/4 v2, 0x1

    .line 14
    const/4 v5, 0x0

    .line 15
    const-string v1, ""

    .line 16
    .line 17
    move-object v0, p0

    .line 18
    invoke-direct/range {v0 .. v7}, Lcom/google/android/libraries/places/internal/zzqy;-><init>(Ljava/lang/String;ZLcom/google/android/libraries/places/internal/zzpu;Ljava/util/logging/Level;ZLjava/util/Set;Lcom/google/android/libraries/places/internal/zzqh;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public synthetic constructor <init>(Lcom/google/android/libraries/places/internal/zzqx;)V
    .locals 8

    .line 23
    sget-object v3, Lcom/google/android/libraries/places/internal/zzpv;->zzb:Lcom/google/android/libraries/places/internal/zzpv;

    sget-object v4, Ljava/util/logging/Level;->ALL:Ljava/util/logging/Level;

    invoke-static {}, Lcom/google/android/libraries/places/internal/zzrb;->zzd()Ljava/util/Set;

    move-result-object v6

    invoke-static {}, Lcom/google/android/libraries/places/internal/zzrb;->zzb()Lcom/google/android/libraries/places/internal/zzqh;

    move-result-object v7

    const/4 v2, 0x1

    const/4 v5, 0x0

    const-string v1, ""

    move-object v0, p0

    invoke-direct/range {v0 .. v7}, Lcom/google/android/libraries/places/internal/zzqy;-><init>(Ljava/lang/String;ZLcom/google/android/libraries/places/internal/zzpu;Ljava/util/logging/Level;ZLjava/util/Set;Lcom/google/android/libraries/places/internal/zzqh;)V

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ZLcom/google/android/libraries/places/internal/zzpu;Ljava/util/logging/Level;ZLjava/util/Set;Lcom/google/android/libraries/places/internal/zzqh;)V
    .locals 0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string p1, ""

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzqy;->zza:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/libraries/places/internal/zzqy;->zzb:Lcom/google/android/libraries/places/internal/zzpu;

    iput-object p4, p0, Lcom/google/android/libraries/places/internal/zzqy;->zzc:Ljava/util/logging/Level;

    iput-object p6, p0, Lcom/google/android/libraries/places/internal/zzqy;->zzd:Ljava/util/Set;

    iput-object p7, p0, Lcom/google/android/libraries/places/internal/zzqy;->zze:Lcom/google/android/libraries/places/internal/zzqh;

    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzpw;
    .locals 9

    .line 1
    iget-object v4, p0, Lcom/google/android/libraries/places/internal/zzqy;->zzb:Lcom/google/android/libraries/places/internal/zzpu;

    .line 2
    .line 3
    iget-object v5, p0, Lcom/google/android/libraries/places/internal/zzqy;->zzc:Ljava/util/logging/Level;

    .line 4
    .line 5
    iget-object v6, p0, Lcom/google/android/libraries/places/internal/zzqy;->zzd:Ljava/util/Set;

    .line 6
    .line 7
    iget-object v7, p0, Lcom/google/android/libraries/places/internal/zzqy;->zze:Lcom/google/android/libraries/places/internal/zzqh;

    .line 8
    .line 9
    new-instance v0, Lcom/google/android/libraries/places/internal/zzrb;

    .line 10
    .line 11
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzqy;->zza:Ljava/lang/String;

    .line 12
    .line 13
    const/4 v3, 0x1

    .line 14
    const/4 v8, 0x0

    .line 15
    move-object v2, p1

    .line 16
    invoke-direct/range {v0 .. v8}, Lcom/google/android/libraries/places/internal/zzrb;-><init>(Ljava/lang/String;Ljava/lang/String;ZLcom/google/android/libraries/places/internal/zzpu;Ljava/util/logging/Level;Ljava/util/Set;Lcom/google/android/libraries/places/internal/zzqh;Lcom/google/android/libraries/places/internal/zzra;)V

    .line 17
    .line 18
    .line 19
    return-object v0
.end method

.method public final zzb(Z)Lcom/google/android/libraries/places/internal/zzqy;
    .locals 8

    new-instance v0, Lcom/google/android/libraries/places/internal/zzqy;

    iget-object v6, p0, Lcom/google/android/libraries/places/internal/zzqy;->zzd:Ljava/util/Set;

    iget-object v7, p0, Lcom/google/android/libraries/places/internal/zzqy;->zze:Lcom/google/android/libraries/places/internal/zzqh;

    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzqy;->zzb:Lcom/google/android/libraries/places/internal/zzpu;

    sget-object v4, Ljava/util/logging/Level;->OFF:Ljava/util/logging/Level;

    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzqy;->zza:Ljava/lang/String;

    const/4 v2, 0x1

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v7}, Lcom/google/android/libraries/places/internal/zzqy;-><init>(Ljava/lang/String;ZLcom/google/android/libraries/places/internal/zzpu;Ljava/util/logging/Level;ZLjava/util/Set;Lcom/google/android/libraries/places/internal/zzqh;)V

    return-object v0
.end method
