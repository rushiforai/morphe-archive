.class public abstract Lcom/google/android/libraries/places/internal/zzbef;
.super Lcom/google/android/libraries/places/internal/zzbej;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/libraries/places/internal/zzbfr;
.implements Lcom/google/android/libraries/places/internal/zzbmv;


# static fields
.field private static final zza:Ljava/util/logging/Logger;


# instance fields
.field private final zzb:Lcom/google/android/libraries/places/internal/zzbqz;

.field private final zzc:Lcom/google/android/libraries/places/internal/zzbis;

.field private final zzd:Z

.field private zze:Lcom/google/android/libraries/places/internal/zzbcf;

.field private volatile zzf:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Lcom/google/android/libraries/places/internal/zzbef;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, Lcom/google/android/libraries/places/internal/zzbef;->zza:Ljava/util/logging/Logger;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Lcom/google/android/libraries/places/internal/zzbrb;Lcom/google/android/libraries/places/internal/zzbqo;Lcom/google/android/libraries/places/internal/zzbqz;Lcom/google/android/libraries/places/internal/zzbcf;Lcom/google/android/libraries/places/internal/zzayj;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbej;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string p6, "transportTracer"

    .line 5
    .line 6
    invoke-static {p3, p6}, Lcom/google/android/libraries/places/internal/zzmt;->zzc(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    iput-object p3, p0, Lcom/google/android/libraries/places/internal/zzbef;->zzb:Lcom/google/android/libraries/places/internal/zzbqz;

    .line 10
    .line 11
    sget-object p3, Lcom/google/android/libraries/places/internal/zzbjd;->zzo:Lcom/google/android/libraries/places/internal/zzayh;

    .line 12
    .line 13
    invoke-virtual {p5, p3}, Lcom/google/android/libraries/places/internal/zzayj;->zzl(Lcom/google/android/libraries/places/internal/zzayh;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p3

    .line 17
    sget-object p5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-virtual {p5, p3}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p3

    .line 23
    xor-int/lit8 p3, p3, 0x1

    .line 24
    .line 25
    iput-boolean p3, p0, Lcom/google/android/libraries/places/internal/zzbef;->zzd:Z

    .line 26
    .line 27
    new-instance p3, Lcom/google/android/libraries/places/internal/zzbmw;

    .line 28
    .line 29
    invoke-direct {p3, p0, p1, p2}, Lcom/google/android/libraries/places/internal/zzbmw;-><init>(Lcom/google/android/libraries/places/internal/zzbmv;Lcom/google/android/libraries/places/internal/zzbrb;Lcom/google/android/libraries/places/internal/zzbqo;)V

    .line 30
    .line 31
    .line 32
    iput-object p3, p0, Lcom/google/android/libraries/places/internal/zzbef;->zzc:Lcom/google/android/libraries/places/internal/zzbis;

    .line 33
    .line 34
    iput-object p4, p0, Lcom/google/android/libraries/places/internal/zzbef;->zze:Lcom/google/android/libraries/places/internal/zzbcf;

    .line 35
    .line 36
    return-void
.end method

.method public static bridge synthetic zzf()Ljava/util/logging/Logger;
    .locals 1

    sget-object v0, Lcom/google/android/libraries/places/internal/zzbef;->zza:Ljava/util/logging/Logger;

    return-object v0
.end method


# virtual methods
.method public abstract zza()Lcom/google/android/libraries/places/internal/zzbec;
.end method

.method public abstract zzb()Lcom/google/android/libraries/places/internal/zzbee;
.end method

.method public bridge synthetic zzc()Lcom/google/android/libraries/places/internal/zzbei;
    .locals 0

    const/4 p0, 0x0

    throw p0
.end method

.method public final zzd()Lcom/google/android/libraries/places/internal/zzbis;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbef;->zzc:Lcom/google/android/libraries/places/internal/zzbis;

    return-object p0
.end method

.method public final zze()Lcom/google/android/libraries/places/internal/zzbqz;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbef;->zzb:Lcom/google/android/libraries/places/internal/zzbqz;

    return-object p0
.end method

.method public final zzg(Lcom/google/android/libraries/places/internal/zzbjj;)V
    .locals 1

    .line 1
    invoke-interface {p0}, Lcom/google/android/libraries/places/internal/zzbfr;->zzam()Lcom/google/android/libraries/places/internal/zzaye;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcom/google/android/libraries/places/internal/zzazw;->zza:Lcom/google/android/libraries/places/internal/zzayc;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lcom/google/android/libraries/places/internal/zzaye;->zzc(Lcom/google/android/libraries/places/internal/zzayc;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string v0, "remote_addr"

    .line 12
    .line 13
    invoke-virtual {p1, v0, p0}, Lcom/google/android/libraries/places/internal/zzbjj;->zzb(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zzbjj;

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final zzh(Lcom/google/android/libraries/places/internal/zzbdo;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzbdo;->zzl()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    xor-int/2addr v0, v1

    .line 7
    const-string v2, "Should not cancel with OK status"

    .line 8
    .line 9
    invoke-static {v0, v2}, Lcom/google/android/libraries/places/internal/zzmt;->zzf(ZLjava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    iput-boolean v1, p0, Lcom/google/android/libraries/places/internal/zzbef;->zzf:Z

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbef;->zza()Lcom/google/android/libraries/places/internal/zzbec;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-interface {p0, p1}, Lcom/google/android/libraries/places/internal/zzbec;->zza(Lcom/google/android/libraries/places/internal/zzbdo;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final zzi(Lcom/google/android/libraries/places/internal/zzbra;ZZI)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    if-nez p1, :cond_1

    .line 3
    .line 4
    if-eqz p2, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 v0, 0x0

    .line 8
    :cond_1
    :goto_0
    const-string v1, "null frame before EOS"

    .line 9
    .line 10
    invoke-static {v0, v1}, Lcom/google/android/libraries/places/internal/zzmt;->zzf(ZLjava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbef;->zza()Lcom/google/android/libraries/places/internal/zzbec;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {p0, p1, p2, p3, p4}, Lcom/google/android/libraries/places/internal/zzbec;->zzb(Lcom/google/android/libraries/places/internal/zzbra;ZZI)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final zzj()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbef;->zzb()Lcom/google/android/libraries/places/internal/zzbee;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbee;->zzk()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbef;->zzb()Lcom/google/android/libraries/places/internal/zzbee;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbee;->zzd(Lcom/google/android/libraries/places/internal/zzbee;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbej;->zzd()Lcom/google/android/libraries/places/internal/zzbis;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-interface {p0}, Lcom/google/android/libraries/places/internal/zzbis;->zzb()V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public final zzk(Lcom/google/android/libraries/places/internal/zzazn;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbef;->zze:Lcom/google/android/libraries/places/internal/zzbcf;

    .line 2
    .line 3
    sget-object v1, Lcom/google/android/libraries/places/internal/zzbjd;->zzb:Lcom/google/android/libraries/places/internal/zzbca;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/google/android/libraries/places/internal/zzbcf;->zzd(Lcom/google/android/libraries/places/internal/zzbca;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Lcom/google/android/libraries/places/internal/zzazn;->zzb(Ljava/util/concurrent/TimeUnit;)J

    .line 11
    .line 12
    .line 13
    move-result-wide v2

    .line 14
    const-wide/16 v4, 0x0

    .line 15
    .line 16
    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->max(JJ)J

    .line 17
    .line 18
    .line 19
    move-result-wide v2

    .line 20
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbef;->zze:Lcom/google/android/libraries/places/internal/zzbcf;

    .line 21
    .line 22
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p0, v1, p1}, Lcom/google/android/libraries/places/internal/zzbcf;->zzf(Lcom/google/android/libraries/places/internal/zzbca;Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final zzl(Lcom/google/android/libraries/places/internal/zzazq;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbef;->zzb()Lcom/google/android/libraries/places/internal/zzbee;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0, p1}, Lcom/google/android/libraries/places/internal/zzbee;->zzc(Lcom/google/android/libraries/places/internal/zzbee;Lcom/google/android/libraries/places/internal/zzazq;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final zzm(I)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbef;->zzb()Lcom/google/android/libraries/places/internal/zzbee;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lcom/google/android/libraries/places/internal/zzbei;->zzx(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final zzn(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbef;->zzc:Lcom/google/android/libraries/places/internal/zzbis;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lcom/google/android/libraries/places/internal/zzbis;->zzd(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final zzo(Lcom/google/android/libraries/places/internal/zzbft;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbef;->zzb()Lcom/google/android/libraries/places/internal/zzbee;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Lcom/google/android/libraries/places/internal/zzbee;->zzi(Lcom/google/android/libraries/places/internal/zzbft;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbef;->zza()Lcom/google/android/libraries/places/internal/zzbec;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbef;->zze:Lcom/google/android/libraries/places/internal/zzbcf;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-interface {p1, v0, v1}, Lcom/google/android/libraries/places/internal/zzbec;->zzc(Lcom/google/android/libraries/places/internal/zzbcf;[B)V

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Lcom/google/android/libraries/places/internal/zzbef;->zze:Lcom/google/android/libraries/places/internal/zzbcf;

    .line 19
    .line 20
    return-void
.end method

.method public final zzp()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbej;->zzc()Lcom/google/android/libraries/places/internal/zzbei;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbei;->zzy(Lcom/google/android/libraries/places/internal/zzbei;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/google/android/libraries/places/internal/zzbef;->zzf:Z

    .line 12
    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public final zzq()Z
    .locals 0

    iget-boolean p0, p0, Lcom/google/android/libraries/places/internal/zzbef;->zzd:Z

    return p0
.end method
