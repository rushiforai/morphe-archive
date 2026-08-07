.class final Lcom/google/android/libraries/places/internal/zzbnj;
.super Lcom/google/android/libraries/places/internal/zzbbm;
.source "SourceFile"


# static fields
.field private static final zzf:Ljava/util/logging/Logger;


# instance fields
.field private final zzg:Lcom/google/android/libraries/places/internal/zzbbd;

.field private final zzh:Ljava/util/Map;

.field private zzi:Lcom/google/android/libraries/places/internal/zzbnd;

.field private zzj:I

.field private zzk:Z

.field private zzl:Lcom/google/android/libraries/places/internal/zzbdv;

.field private zzm:Lcom/google/android/libraries/places/internal/zzaze;

.field private zzn:Lcom/google/android/libraries/places/internal/zzaze;

.field private final zzo:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Lcom/google/android/libraries/places/internal/zzbnj;

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
    sput-object v0, Lcom/google/android/libraries/places/internal/zzbnj;->zzf:Ljava/util/logging/Logger;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Lcom/google/android/libraries/places/internal/zzbbd;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbbm;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzh:Ljava/util/Map;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput v0, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzj:I

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    iput-boolean v0, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzk:Z

    .line 16
    .line 17
    sget-object v1, Lcom/google/android/libraries/places/internal/zzaze;->zzd:Lcom/google/android/libraries/places/internal/zzaze;

    .line 18
    .line 19
    iput-object v1, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzm:Lcom/google/android/libraries/places/internal/zzaze;

    .line 20
    .line 21
    iput-object v1, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzn:Lcom/google/android/libraries/places/internal/zzaze;

    .line 22
    .line 23
    const-string v1, "GRPC_EXPERIMENTAL_XDS_DUALSTACK_ENDPOINTS"

    .line 24
    .line 25
    invoke-static {v1, v0}, Lcom/google/android/libraries/places/internal/zzbjd;->zzj(Ljava/lang/String;Z)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iput-boolean v0, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzo:Z

    .line 30
    .line 31
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzg:Lcom/google/android/libraries/places/internal/zzbbd;

    .line 32
    .line 33
    return-void
.end method

.method public static bridge synthetic zzg(Lcom/google/android/libraries/places/internal/zzbnj;)Lcom/google/android/libraries/places/internal/zzbbd;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzg:Lcom/google/android/libraries/places/internal/zzbbd;

    return-object p0
.end method

.method public static bridge synthetic zzh(Lcom/google/android/libraries/places/internal/zzbnj;)Lcom/google/android/libraries/places/internal/zzbnd;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzi:Lcom/google/android/libraries/places/internal/zzbnd;

    return-object p0
.end method

.method public static bridge synthetic zzi(Lcom/google/android/libraries/places/internal/zzbnj;)Ljava/util/Map;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzh:Ljava/util/Map;

    return-object p0
.end method

.method public static bridge synthetic zzj()Ljava/util/logging/Logger;
    .locals 1

    sget-object v0, Lcom/google/android/libraries/places/internal/zzbnj;->zzf:Ljava/util/logging/Logger;

    return-object v0
.end method

.method public static bridge synthetic zzk(Lcom/google/android/libraries/places/internal/zzbnj;Lcom/google/android/libraries/places/internal/zzbdv;)V
    .locals 0

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzl:Lcom/google/android/libraries/places/internal/zzbdv;

    return-void
.end method

.method public static bridge synthetic zzl(Lcom/google/android/libraries/places/internal/zzbnj;Lcom/google/android/libraries/places/internal/zzbni;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/libraries/places/internal/zzbnj;->zzq(Lcom/google/android/libraries/places/internal/zzbni;)V

    return-void
.end method

.method private final zzn()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzl:Lcom/google/android/libraries/places/internal/zzbdv;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbdv;->zza()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzl:Lcom/google/android/libraries/places/internal/zzbdv;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method private final zzo()V
    .locals 7

    .line 1
    iget-boolean v0, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzo:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzl:Lcom/google/android/libraries/places/internal/zzbdv;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbdv;->zzb()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzg:Lcom/google/android/libraries/places/internal/zzbbd;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbbd;->zzb()Lcom/google/android/libraries/places/internal/zzbdw;

    .line 18
    .line 19
    .line 20
    move-result-object v1
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 21
    new-instance v2, Lcom/google/android/libraries/places/internal/zzbna;

    .line 22
    .line 23
    invoke-direct {v2, p0}, Lcom/google/android/libraries/places/internal/zzbna;-><init>(Lcom/google/android/libraries/places/internal/zzbnj;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzg:Lcom/google/android/libraries/places/internal/zzbbd;

    .line 27
    .line 28
    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbbd;->zzc()Ljava/util/concurrent/ScheduledExecutorService;

    .line 31
    .line 32
    .line 33
    move-result-object v6

    .line 34
    const-wide/16 v3, 0xfa

    .line 35
    .line 36
    invoke-virtual/range {v1 .. v6}, Lcom/google/android/libraries/places/internal/zzbdw;->zza(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/ScheduledExecutorService;)Lcom/google/android/libraries/places/internal/zzbdv;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzl:Lcom/google/android/libraries/places/internal/zzbdv;

    .line 41
    .line 42
    :catch_0
    :cond_1
    return-void
.end method

.method private final zzp(Lcom/google/android/libraries/places/internal/zzaze;Lcom/google/android/libraries/places/internal/zzbbk;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzn:Lcom/google/android/libraries/places/internal/zzaze;

    .line 2
    .line 3
    if-ne p1, v0, :cond_1

    .line 4
    .line 5
    sget-object v0, Lcom/google/android/libraries/places/internal/zzaze;->zzd:Lcom/google/android/libraries/places/internal/zzaze;

    .line 6
    .line 7
    if-eq p1, v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Lcom/google/android/libraries/places/internal/zzaze;->zza:Lcom/google/android/libraries/places/internal/zzaze;

    .line 10
    .line 11
    if-ne p1, v0, :cond_1

    .line 12
    .line 13
    :cond_0
    return-void

    .line 14
    :cond_1
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzn:Lcom/google/android/libraries/places/internal/zzaze;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzg:Lcom/google/android/libraries/places/internal/zzbbd;

    .line 17
    .line 18
    invoke-virtual {p0, p1, p2}, Lcom/google/android/libraries/places/internal/zzbbd;->zze(Lcom/google/android/libraries/places/internal/zzaze;Lcom/google/android/libraries/places/internal/zzbbk;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private final zzq(Lcom/google/android/libraries/places/internal/zzbni;)V
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/google/android/libraries/places/internal/zzbni;->zza(Lcom/google/android/libraries/places/internal/zzbni;)Lcom/google/android/libraries/places/internal/zzaze;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/google/android/libraries/places/internal/zzaze;->zzb:Lcom/google/android/libraries/places/internal/zzaze;

    .line 6
    .line 7
    if-eq v0, v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-static {p1}, Lcom/google/android/libraries/places/internal/zzbni;->zzb(Lcom/google/android/libraries/places/internal/zzbni;)Lcom/google/android/libraries/places/internal/zzaze;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-ne v0, v1, :cond_1

    .line 15
    .line 16
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbbc;

    .line 17
    .line 18
    invoke-static {p1}, Lcom/google/android/libraries/places/internal/zzbni;->zzd(Lcom/google/android/libraries/places/internal/zzbni;)Lcom/google/android/libraries/places/internal/zzbbj;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const/4 v2, 0x0

    .line 23
    invoke-static {p1, v2}, Lcom/google/android/libraries/places/internal/zzbbe;->zzd(Lcom/google/android/libraries/places/internal/zzbbj;Lcom/google/android/libraries/places/internal/zzayu;)Lcom/google/android/libraries/places/internal/zzbbe;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-direct {v0, p1}, Lcom/google/android/libraries/places/internal/zzbbc;-><init>(Lcom/google/android/libraries/places/internal/zzbbe;)V

    .line 28
    .line 29
    .line 30
    invoke-direct {p0, v1, v0}, Lcom/google/android/libraries/places/internal/zzbnj;->zzp(Lcom/google/android/libraries/places/internal/zzaze;Lcom/google/android/libraries/places/internal/zzbbk;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    invoke-static {p1}, Lcom/google/android/libraries/places/internal/zzbni;->zzb(Lcom/google/android/libraries/places/internal/zzbni;)Lcom/google/android/libraries/places/internal/zzaze;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    sget-object v1, Lcom/google/android/libraries/places/internal/zzaze;->zzc:Lcom/google/android/libraries/places/internal/zzaze;

    .line 39
    .line 40
    if-ne v0, v1, :cond_2

    .line 41
    .line 42
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbnf;

    .line 43
    .line 44
    invoke-static {p1}, Lcom/google/android/libraries/places/internal/zzbni;->zzf(Lcom/google/android/libraries/places/internal/zzbni;)Lcom/google/android/libraries/places/internal/zzbnc;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-static {p1}, Lcom/google/android/libraries/places/internal/zzbnc;->zzb(Lcom/google/android/libraries/places/internal/zzbnc;)Lcom/google/android/libraries/places/internal/zzazf;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzazf;->zzd()Lcom/google/android/libraries/places/internal/zzbdo;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-static {p1}, Lcom/google/android/libraries/places/internal/zzbbe;->zzb(Lcom/google/android/libraries/places/internal/zzbdo;)Lcom/google/android/libraries/places/internal/zzbbe;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-direct {v0, p1}, Lcom/google/android/libraries/places/internal/zzbnf;-><init>(Lcom/google/android/libraries/places/internal/zzbbe;)V

    .line 61
    .line 62
    .line 63
    invoke-direct {p0, v1, v0}, Lcom/google/android/libraries/places/internal/zzbnj;->zzp(Lcom/google/android/libraries/places/internal/zzaze;Lcom/google/android/libraries/places/internal/zzbbk;)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_2
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzn:Lcom/google/android/libraries/places/internal/zzaze;

    .line 68
    .line 69
    if-eq v0, v1, :cond_3

    .line 70
    .line 71
    invoke-static {p1}, Lcom/google/android/libraries/places/internal/zzbni;->zzb(Lcom/google/android/libraries/places/internal/zzbni;)Lcom/google/android/libraries/places/internal/zzaze;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbnf;

    .line 76
    .line 77
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzbbe;->zzc()Lcom/google/android/libraries/places/internal/zzbbe;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-direct {v0, v1}, Lcom/google/android/libraries/places/internal/zzbnf;-><init>(Lcom/google/android/libraries/places/internal/zzbbe;)V

    .line 82
    .line 83
    .line 84
    invoke-direct {p0, p1, v0}, Lcom/google/android/libraries/places/internal/zzbnj;->zzp(Lcom/google/android/libraries/places/internal/zzaze;Lcom/google/android/libraries/places/internal/zzbbk;)V

    .line 85
    .line 86
    .line 87
    :cond_3
    :goto_0
    return-void
.end method

.method private static final zzr(Lcom/google/android/libraries/places/internal/zzbbj;)Ljava/net/SocketAddress;
    .locals 3

    .line 1
    check-cast p0, Lcom/google/android/libraries/places/internal/zzblx;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzblx;->zzj:Lcom/google/android/libraries/places/internal/zzbma;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/google/android/libraries/places/internal/zzbma;->zzf:Lcom/google/android/libraries/places/internal/zzbdw;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbdw;->zzd()V

    .line 8
    .line 9
    .line 10
    iget-boolean v0, p0, Lcom/google/android/libraries/places/internal/zzblx;->zzg:Z

    .line 11
    .line 12
    const-string v1, "not started"

    .line 13
    .line 14
    invoke-static {v0, v1}, Lcom/google/android/libraries/places/internal/zzmt;->zzp(ZLjava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzblx;->zze:Ljava/util/List;

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    const/4 v2, 0x1

    .line 27
    if-ne v1, v2, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    move v2, v0

    .line 31
    :goto_0
    const-string v1, "%s does not have exactly one group"

    .line 32
    .line 33
    invoke-static {v2, v1, p0}, Lcom/google/android/libraries/places/internal/zzmt;->zzr(ZLjava/lang/String;Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    check-cast p0, Lcom/google/android/libraries/places/internal/zzazs;

    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzazs;->zzb()Ljava/util/List;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    check-cast p0, Ljava/net/SocketAddress;

    .line 51
    .line 52
    return-object p0
.end method


# virtual methods
.method public final zza(Lcom/google/android/libraries/places/internal/zzbbi;)Lcom/google/android/libraries/places/internal/zzbdo;
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzm:Lcom/google/android/libraries/places/internal/zzaze;

    .line 2
    .line 3
    sget-object v1, Lcom/google/android/libraries/places/internal/zzaze;->zze:Lcom/google/android/libraries/places/internal/zzaze;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/google/android/libraries/places/internal/zzbdo;->zzk:Lcom/google/android/libraries/places/internal/zzbdo;

    .line 8
    .line 9
    const-string p1, "Already shut down"

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/google/android/libraries/places/internal/zzbdo;->zzg(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzbbi;->zze()Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    const-string v2, ", attrs="

    .line 25
    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    sget-object v0, Lcom/google/android/libraries/places/internal/zzbdo;->zzp:Lcom/google/android/libraries/places/internal/zzbdo;

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzbbi;->zze()Ljava/util/List;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzbbi;->zza()Lcom/google/android/libraries/places/internal/zzaye;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    new-instance v3, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    const-string v4, "NameResolver returned no usable address. addrs="

    .line 49
    .line 50
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-virtual {v0, p1}, Lcom/google/android/libraries/places/internal/zzbdo;->zzg(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-virtual {p0, p1}, Lcom/google/android/libraries/places/internal/zzbnj;->zzb(Lcom/google/android/libraries/places/internal/zzbdo;)V

    .line 71
    .line 72
    .line 73
    return-object p1

    .line 74
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 79
    .line 80
    .line 81
    move-result v3

    .line 82
    if-eqz v3, :cond_3

    .line 83
    .line 84
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    check-cast v3, Lcom/google/android/libraries/places/internal/zzazs;

    .line 89
    .line 90
    if-nez v3, :cond_2

    .line 91
    .line 92
    sget-object v0, Lcom/google/android/libraries/places/internal/zzbdo;->zzp:Lcom/google/android/libraries/places/internal/zzbdo;

    .line 93
    .line 94
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzbbi;->zze()Ljava/util/List;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzbbi;->zza()Lcom/google/android/libraries/places/internal/zzaye;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    new-instance v3, Ljava/lang/StringBuilder;

    .line 111
    .line 112
    const-string v4, "NameResolver returned address list with null endpoint. addrs="

    .line 113
    .line 114
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    invoke-virtual {v0, p1}, Lcom/google/android/libraries/places/internal/zzbdo;->zzg(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    invoke-virtual {p0, p1}, Lcom/google/android/libraries/places/internal/zzbnj;->zzb(Lcom/google/android/libraries/places/internal/zzbdo;)V

    .line 135
    .line 136
    .line 137
    return-object p1

    .line 138
    :cond_3
    const/4 v1, 0x1

    .line 139
    iput-boolean v1, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzk:Z

    .line 140
    .line 141
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzbbi;->zzd()Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    instance-of v1, v1, Lcom/google/android/libraries/places/internal/zzbne;

    .line 146
    .line 147
    if-eqz v1, :cond_4

    .line 148
    .line 149
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzbbi;->zzd()Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    check-cast p1, Lcom/google/android/libraries/places/internal/zzbne;

    .line 154
    .line 155
    iget-object p1, p1, Lcom/google/android/libraries/places/internal/zzbne;->zza:Ljava/lang/Boolean;

    .line 156
    .line 157
    if-eqz p1, :cond_4

    .line 158
    .line 159
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 160
    .line 161
    .line 162
    move-result p1

    .line 163
    if-eqz p1, :cond_4

    .line 164
    .line 165
    new-instance p1, Ljava/util/ArrayList;

    .line 166
    .line 167
    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 168
    .line 169
    .line 170
    new-instance v0, Ljava/util/Random;

    .line 171
    .line 172
    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    .line 173
    .line 174
    .line 175
    invoke-static {p1, v0}, Ljava/util/Collections;->shuffle(Ljava/util/List;Ljava/util/Random;)V

    .line 176
    .line 177
    .line 178
    move-object v0, p1

    .line 179
    :cond_4
    new-instance p1, Lcom/google/android/libraries/places/internal/zznu;

    .line 180
    .line 181
    invoke-direct {p1}, Lcom/google/android/libraries/places/internal/zznu;-><init>()V

    .line 182
    .line 183
    .line 184
    invoke-virtual {p1, v0}, Lcom/google/android/libraries/places/internal/zznu;->zzf(Ljava/lang/Iterable;)Lcom/google/android/libraries/places/internal/zznu;

    .line 185
    .line 186
    .line 187
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zznu;->zzg()Lcom/google/android/libraries/places/internal/zznx;

    .line 188
    .line 189
    .line 190
    move-result-object p1

    .line 191
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzi:Lcom/google/android/libraries/places/internal/zzbnd;

    .line 192
    .line 193
    if-nez v0, :cond_5

    .line 194
    .line 195
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbnd;

    .line 196
    .line 197
    invoke-direct {v0, p1}, Lcom/google/android/libraries/places/internal/zzbnd;-><init>(Ljava/util/List;)V

    .line 198
    .line 199
    .line 200
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzi:Lcom/google/android/libraries/places/internal/zzbnd;

    .line 201
    .line 202
    goto :goto_0

    .line 203
    :cond_5
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzm:Lcom/google/android/libraries/places/internal/zzaze;

    .line 204
    .line 205
    sget-object v2, Lcom/google/android/libraries/places/internal/zzaze;->zzb:Lcom/google/android/libraries/places/internal/zzaze;

    .line 206
    .line 207
    if-ne v1, v2, :cond_7

    .line 208
    .line 209
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbnd;->zzc()Ljava/net/SocketAddress;

    .line 210
    .line 211
    .line 212
    move-result-object v0

    .line 213
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzi:Lcom/google/android/libraries/places/internal/zzbnd;

    .line 214
    .line 215
    invoke-virtual {v1, p1}, Lcom/google/android/libraries/places/internal/zzbnd;->zze(Lcom/google/android/libraries/places/internal/zznx;)V

    .line 216
    .line 217
    .line 218
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzi:Lcom/google/android/libraries/places/internal/zzbnd;

    .line 219
    .line 220
    invoke-virtual {v1, v0}, Lcom/google/android/libraries/places/internal/zzbnd;->zzh(Ljava/net/SocketAddress;)Z

    .line 221
    .line 222
    .line 223
    move-result v1

    .line 224
    if-eqz v1, :cond_6

    .line 225
    .line 226
    iget-object p1, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzh:Ljava/util/Map;

    .line 227
    .line 228
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 229
    .line 230
    .line 231
    move-result-object p1

    .line 232
    check-cast p1, Lcom/google/android/libraries/places/internal/zzbni;

    .line 233
    .line 234
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzbni;->zze()Lcom/google/android/libraries/places/internal/zzbbj;

    .line 235
    .line 236
    .line 237
    move-result-object p1

    .line 238
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzi:Lcom/google/android/libraries/places/internal/zzbnd;

    .line 239
    .line 240
    new-instance v0, Lcom/google/android/libraries/places/internal/zzazs;

    .line 241
    .line 242
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbnd;->zzc()Ljava/net/SocketAddress;

    .line 243
    .line 244
    .line 245
    move-result-object v1

    .line 246
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbnd;->zzb()Lcom/google/android/libraries/places/internal/zzaye;

    .line 247
    .line 248
    .line 249
    move-result-object p0

    .line 250
    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 251
    .line 252
    .line 253
    move-result-object v1

    .line 254
    invoke-direct {v0, v1, p0}, Lcom/google/android/libraries/places/internal/zzazs;-><init>(Ljava/util/List;Lcom/google/android/libraries/places/internal/zzaye;)V

    .line 255
    .line 256
    .line 257
    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 258
    .line 259
    .line 260
    move-result-object p0

    .line 261
    invoke-virtual {p1, p0}, Lcom/google/android/libraries/places/internal/zzbbj;->zzd(Ljava/util/List;)V

    .line 262
    .line 263
    .line 264
    sget-object p0, Lcom/google/android/libraries/places/internal/zzbdo;->zza:Lcom/google/android/libraries/places/internal/zzbdo;

    .line 265
    .line 266
    return-object p0

    .line 267
    :cond_6
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzi:Lcom/google/android/libraries/places/internal/zzbnd;

    .line 268
    .line 269
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbnd;->zzd()V

    .line 270
    .line 271
    .line 272
    goto :goto_0

    .line 273
    :cond_7
    invoke-virtual {v0, p1}, Lcom/google/android/libraries/places/internal/zzbnd;->zze(Lcom/google/android/libraries/places/internal/zznx;)V

    .line 274
    .line 275
    .line 276
    :goto_0
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzh:Ljava/util/Map;

    .line 277
    .line 278
    new-instance v1, Ljava/util/HashSet;

    .line 279
    .line 280
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 281
    .line 282
    .line 283
    move-result-object v0

    .line 284
    invoke-direct {v1, v0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 285
    .line 286
    .line 287
    new-instance v0, Ljava/util/HashSet;

    .line 288
    .line 289
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 290
    .line 291
    .line 292
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 293
    .line 294
    .line 295
    move-result v2

    .line 296
    const/4 v3, 0x0

    .line 297
    :goto_1
    if-ge v3, v2, :cond_8

    .line 298
    .line 299
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 300
    .line 301
    .line 302
    move-result-object v4

    .line 303
    check-cast v4, Lcom/google/android/libraries/places/internal/zzazs;

    .line 304
    .line 305
    invoke-virtual {v4}, Lcom/google/android/libraries/places/internal/zzazs;->zzb()Ljava/util/List;

    .line 306
    .line 307
    .line 308
    move-result-object v4

    .line 309
    invoke-interface {v0, v4}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 310
    .line 311
    .line 312
    add-int/lit8 v3, v3, 0x1

    .line 313
    .line 314
    goto :goto_1

    .line 315
    :cond_8
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 316
    .line 317
    .line 318
    move-result-object p1

    .line 319
    :cond_9
    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 320
    .line 321
    .line 322
    move-result v2

    .line 323
    if-eqz v2, :cond_a

    .line 324
    .line 325
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 326
    .line 327
    .line 328
    move-result-object v2

    .line 329
    check-cast v2, Ljava/net/SocketAddress;

    .line 330
    .line 331
    invoke-interface {v0, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 332
    .line 333
    .line 334
    move-result v3

    .line 335
    if-nez v3, :cond_9

    .line 336
    .line 337
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzh:Ljava/util/Map;

    .line 338
    .line 339
    invoke-interface {v3, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 340
    .line 341
    .line 342
    move-result-object v2

    .line 343
    check-cast v2, Lcom/google/android/libraries/places/internal/zzbni;

    .line 344
    .line 345
    invoke-virtual {v2}, Lcom/google/android/libraries/places/internal/zzbni;->zze()Lcom/google/android/libraries/places/internal/zzbbj;

    .line 346
    .line 347
    .line 348
    move-result-object v2

    .line 349
    invoke-virtual {v2}, Lcom/google/android/libraries/places/internal/zzbbj;->zzb()V

    .line 350
    .line 351
    .line 352
    goto :goto_2

    .line 353
    :cond_a
    invoke-interface {v1}, Ljava/util/Set;->size()I

    .line 354
    .line 355
    .line 356
    move-result p1

    .line 357
    if-eqz p1, :cond_d

    .line 358
    .line 359
    iget-object p1, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzm:Lcom/google/android/libraries/places/internal/zzaze;

    .line 360
    .line 361
    sget-object v0, Lcom/google/android/libraries/places/internal/zzaze;->zza:Lcom/google/android/libraries/places/internal/zzaze;

    .line 362
    .line 363
    if-eq p1, v0, :cond_d

    .line 364
    .line 365
    sget-object v0, Lcom/google/android/libraries/places/internal/zzaze;->zzb:Lcom/google/android/libraries/places/internal/zzaze;

    .line 366
    .line 367
    if-ne p1, v0, :cond_b

    .line 368
    .line 369
    goto :goto_3

    .line 370
    :cond_b
    sget-object v0, Lcom/google/android/libraries/places/internal/zzaze;->zzd:Lcom/google/android/libraries/places/internal/zzaze;

    .line 371
    .line 372
    if-ne p1, v0, :cond_c

    .line 373
    .line 374
    new-instance p1, Lcom/google/android/libraries/places/internal/zzbnh;

    .line 375
    .line 376
    invoke-direct {p1, p0, p0}, Lcom/google/android/libraries/places/internal/zzbnh;-><init>(Lcom/google/android/libraries/places/internal/zzbnj;Lcom/google/android/libraries/places/internal/zzbnj;)V

    .line 377
    .line 378
    .line 379
    invoke-direct {p0, v0, p1}, Lcom/google/android/libraries/places/internal/zzbnj;->zzp(Lcom/google/android/libraries/places/internal/zzaze;Lcom/google/android/libraries/places/internal/zzbbk;)V

    .line 380
    .line 381
    .line 382
    goto :goto_4

    .line 383
    :cond_c
    sget-object v0, Lcom/google/android/libraries/places/internal/zzaze;->zzc:Lcom/google/android/libraries/places/internal/zzaze;

    .line 384
    .line 385
    if-ne p1, v0, :cond_e

    .line 386
    .line 387
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbnj;->zzn()V

    .line 388
    .line 389
    .line 390
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbbm;->zzd()V

    .line 391
    .line 392
    .line 393
    goto :goto_4

    .line 394
    :cond_d
    :goto_3
    sget-object p1, Lcom/google/android/libraries/places/internal/zzaze;->zza:Lcom/google/android/libraries/places/internal/zzaze;

    .line 395
    .line 396
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzm:Lcom/google/android/libraries/places/internal/zzaze;

    .line 397
    .line 398
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbnf;

    .line 399
    .line 400
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzbbe;->zzc()Lcom/google/android/libraries/places/internal/zzbbe;

    .line 401
    .line 402
    .line 403
    move-result-object v1

    .line 404
    invoke-direct {v0, v1}, Lcom/google/android/libraries/places/internal/zzbnf;-><init>(Lcom/google/android/libraries/places/internal/zzbbe;)V

    .line 405
    .line 406
    .line 407
    invoke-direct {p0, p1, v0}, Lcom/google/android/libraries/places/internal/zzbnj;->zzp(Lcom/google/android/libraries/places/internal/zzaze;Lcom/google/android/libraries/places/internal/zzbbk;)V

    .line 408
    .line 409
    .line 410
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbnj;->zzn()V

    .line 411
    .line 412
    .line 413
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbbm;->zzd()V

    .line 414
    .line 415
    .line 416
    :cond_e
    :goto_4
    sget-object p0, Lcom/google/android/libraries/places/internal/zzbdo;->zza:Lcom/google/android/libraries/places/internal/zzbdo;

    .line 417
    .line 418
    return-object p0
.end method

.method public final zzb(Lcom/google/android/libraries/places/internal/zzbdo;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzh:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Lcom/google/android/libraries/places/internal/zzbni;

    .line 22
    .line 23
    invoke-virtual {v1}, Lcom/google/android/libraries/places/internal/zzbni;->zze()Lcom/google/android/libraries/places/internal/zzbbj;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v1}, Lcom/google/android/libraries/places/internal/zzbbj;->zzb()V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzh:Ljava/util/Map;

    .line 32
    .line 33
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 34
    .line 35
    .line 36
    sget-object v0, Lcom/google/android/libraries/places/internal/zzaze;->zzc:Lcom/google/android/libraries/places/internal/zzaze;

    .line 37
    .line 38
    new-instance v1, Lcom/google/android/libraries/places/internal/zzbnf;

    .line 39
    .line 40
    invoke-static {p1}, Lcom/google/android/libraries/places/internal/zzbbe;->zzb(Lcom/google/android/libraries/places/internal/zzbdo;)Lcom/google/android/libraries/places/internal/zzbbe;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-direct {v1, p1}, Lcom/google/android/libraries/places/internal/zzbnf;-><init>(Lcom/google/android/libraries/places/internal/zzbbe;)V

    .line 45
    .line 46
    .line 47
    invoke-direct {p0, v0, v1}, Lcom/google/android/libraries/places/internal/zzbnj;->zzp(Lcom/google/android/libraries/places/internal/zzaze;Lcom/google/android/libraries/places/internal/zzbbk;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final zzd()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzi:Lcom/google/android/libraries/places/internal/zzbnd;

    .line 2
    .line 3
    if-eqz v0, :cond_8

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbnd;->zzg()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_8

    .line 10
    .line 11
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzm:Lcom/google/android/libraries/places/internal/zzaze;

    .line 12
    .line 13
    sget-object v1, Lcom/google/android/libraries/places/internal/zzaze;->zze:Lcom/google/android/libraries/places/internal/zzaze;

    .line 14
    .line 15
    if-ne v0, v1, :cond_0

    .line 16
    .line 17
    goto/16 :goto_1

    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzi:Lcom/google/android/libraries/places/internal/zzbnd;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbnd;->zzc()Ljava/net/SocketAddress;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzh:Ljava/util/Map;

    .line 26
    .line 27
    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_1

    .line 32
    .line 33
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzh:Ljava/util/Map;

    .line 34
    .line 35
    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    check-cast v1, Lcom/google/android/libraries/places/internal/zzbni;

    .line 40
    .line 41
    invoke-virtual {v1}, Lcom/google/android/libraries/places/internal/zzbni;->zze()Lcom/google/android/libraries/places/internal/zzbbj;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    goto :goto_0

    .line 46
    :cond_1
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzi:Lcom/google/android/libraries/places/internal/zzbnd;

    .line 47
    .line 48
    invoke-virtual {v1}, Lcom/google/android/libraries/places/internal/zzbnd;->zzb()Lcom/google/android/libraries/places/internal/zzaye;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    new-instance v2, Lcom/google/android/libraries/places/internal/zzbnc;

    .line 53
    .line 54
    const/4 v3, 0x0

    .line 55
    invoke-direct {v2, p0, v3}, Lcom/google/android/libraries/places/internal/zzbnc;-><init>(Lcom/google/android/libraries/places/internal/zzbnj;Lcom/google/android/libraries/places/internal/zzbnb;)V

    .line 56
    .line 57
    .line 58
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzg:Lcom/google/android/libraries/places/internal/zzbbd;

    .line 59
    .line 60
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzbba;->zzb()Lcom/google/android/libraries/places/internal/zzbax;

    .line 61
    .line 62
    .line 63
    move-result-object v4

    .line 64
    new-instance v5, Lcom/google/android/libraries/places/internal/zzazs;

    .line 65
    .line 66
    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 67
    .line 68
    .line 69
    move-result-object v6

    .line 70
    invoke-direct {v5, v6, v1}, Lcom/google/android/libraries/places/internal/zzazs;-><init>(Ljava/util/List;Lcom/google/android/libraries/places/internal/zzaye;)V

    .line 71
    .line 72
    .line 73
    filled-new-array {v5}, [Lcom/google/android/libraries/places/internal/zzazs;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    new-instance v5, Ljava/util/ArrayList;

    .line 78
    .line 79
    const/4 v6, 0x6

    .line 80
    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 81
    .line 82
    .line 83
    invoke-static {v5, v1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    invoke-virtual {v4, v5}, Lcom/google/android/libraries/places/internal/zzbax;->zzb(Ljava/util/List;)Lcom/google/android/libraries/places/internal/zzbax;

    .line 87
    .line 88
    .line 89
    sget-object v1, Lcom/google/android/libraries/places/internal/zzbbm;->zzb:Lcom/google/android/libraries/places/internal/zzbay;

    .line 90
    .line 91
    invoke-virtual {v4, v1, v2}, Lcom/google/android/libraries/places/internal/zzbax;->zza(Lcom/google/android/libraries/places/internal/zzbay;Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zzbax;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v4}, Lcom/google/android/libraries/places/internal/zzbax;->zzc()Lcom/google/android/libraries/places/internal/zzbba;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    invoke-virtual {v3, v1}, Lcom/google/android/libraries/places/internal/zzbbd;->zza(Lcom/google/android/libraries/places/internal/zzbba;)Lcom/google/android/libraries/places/internal/zzbbj;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    new-instance v3, Lcom/google/android/libraries/places/internal/zzbni;

    .line 103
    .line 104
    sget-object v4, Lcom/google/android/libraries/places/internal/zzaze;->zzd:Lcom/google/android/libraries/places/internal/zzaze;

    .line 105
    .line 106
    invoke-direct {v3, v1, v4, v2}, Lcom/google/android/libraries/places/internal/zzbni;-><init>(Lcom/google/android/libraries/places/internal/zzbbj;Lcom/google/android/libraries/places/internal/zzaze;Lcom/google/android/libraries/places/internal/zzbnc;)V

    .line 107
    .line 108
    .line 109
    invoke-static {v2, v3}, Lcom/google/android/libraries/places/internal/zzbnc;->zzd(Lcom/google/android/libraries/places/internal/zzbnc;Lcom/google/android/libraries/places/internal/zzbni;)V

    .line 110
    .line 111
    .line 112
    iget-object v4, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzh:Ljava/util/Map;

    .line 113
    .line 114
    invoke-interface {v4, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-object v3, v1

    .line 118
    check-cast v3, Lcom/google/android/libraries/places/internal/zzblx;

    .line 119
    .line 120
    iget-object v3, v3, Lcom/google/android/libraries/places/internal/zzblx;->zza:Lcom/google/android/libraries/places/internal/zzbba;

    .line 121
    .line 122
    invoke-virtual {v3}, Lcom/google/android/libraries/places/internal/zzbba;->zza()Lcom/google/android/libraries/places/internal/zzaye;

    .line 123
    .line 124
    .line 125
    move-result-object v3

    .line 126
    sget-object v4, Lcom/google/android/libraries/places/internal/zzbbm;->zzc:Lcom/google/android/libraries/places/internal/zzayc;

    .line 127
    .line 128
    invoke-virtual {v3, v4}, Lcom/google/android/libraries/places/internal/zzaye;->zzc(Lcom/google/android/libraries/places/internal/zzayc;)Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object v3

    .line 132
    if-nez v3, :cond_2

    .line 133
    .line 134
    sget-object v3, Lcom/google/android/libraries/places/internal/zzaze;->zzb:Lcom/google/android/libraries/places/internal/zzaze;

    .line 135
    .line 136
    invoke-static {v3}, Lcom/google/android/libraries/places/internal/zzazf;->zzb(Lcom/google/android/libraries/places/internal/zzaze;)Lcom/google/android/libraries/places/internal/zzazf;

    .line 137
    .line 138
    .line 139
    move-result-object v3

    .line 140
    invoke-static {v2, v3}, Lcom/google/android/libraries/places/internal/zzbnc;->zzc(Lcom/google/android/libraries/places/internal/zzbnc;Lcom/google/android/libraries/places/internal/zzazf;)V

    .line 141
    .line 142
    .line 143
    :cond_2
    new-instance v2, Lcom/google/android/libraries/places/internal/zzbmz;

    .line 144
    .line 145
    invoke-direct {v2, p0, v1}, Lcom/google/android/libraries/places/internal/zzbmz;-><init>(Lcom/google/android/libraries/places/internal/zzbnj;Lcom/google/android/libraries/places/internal/zzbbj;)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {v1, v2}, Lcom/google/android/libraries/places/internal/zzbbj;->zzc(Lcom/google/android/libraries/places/internal/zzbbl;)V

    .line 149
    .line 150
    .line 151
    :goto_0
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzh:Ljava/util/Map;

    .line 152
    .line 153
    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 154
    .line 155
    .line 156
    move-result-object v2

    .line 157
    check-cast v2, Lcom/google/android/libraries/places/internal/zzbni;

    .line 158
    .line 159
    invoke-virtual {v2}, Lcom/google/android/libraries/places/internal/zzbni;->zzc()Lcom/google/android/libraries/places/internal/zzaze;

    .line 160
    .line 161
    .line 162
    move-result-object v2

    .line 163
    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    .line 164
    .line 165
    .line 166
    move-result v2

    .line 167
    if-eqz v2, :cond_6

    .line 168
    .line 169
    const/4 v3, 0x1

    .line 170
    if-eq v2, v3, :cond_5

    .line 171
    .line 172
    const/4 v3, 0x2

    .line 173
    if-eq v2, v3, :cond_4

    .line 174
    .line 175
    const/4 v3, 0x3

    .line 176
    if-eq v2, v3, :cond_3

    .line 177
    .line 178
    goto :goto_1

    .line 179
    :cond_3
    invoke-virtual {v1}, Lcom/google/android/libraries/places/internal/zzbbj;->zza()V

    .line 180
    .line 181
    .line 182
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzh:Ljava/util/Map;

    .line 183
    .line 184
    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    check-cast v0, Lcom/google/android/libraries/places/internal/zzbni;

    .line 189
    .line 190
    sget-object v1, Lcom/google/android/libraries/places/internal/zzaze;->zza:Lcom/google/android/libraries/places/internal/zzaze;

    .line 191
    .line 192
    invoke-static {v0, v1}, Lcom/google/android/libraries/places/internal/zzbni;->zzg(Lcom/google/android/libraries/places/internal/zzbni;Lcom/google/android/libraries/places/internal/zzaze;)V

    .line 193
    .line 194
    .line 195
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbnj;->zzo()V

    .line 196
    .line 197
    .line 198
    return-void

    .line 199
    :cond_4
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzi:Lcom/google/android/libraries/places/internal/zzbnd;

    .line 200
    .line 201
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbnd;->zzf()Z

    .line 202
    .line 203
    .line 204
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbbm;->zzd()V

    .line 205
    .line 206
    .line 207
    return-void

    .line 208
    :cond_5
    sget-object p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzf:Ljava/util/logging/Logger;

    .line 209
    .line 210
    sget-object v0, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    .line 211
    .line 212
    const-string v1, "requestConnection"

    .line 213
    .line 214
    const-string v2, "Requesting a connection even though we have a READY subchannel"

    .line 215
    .line 216
    const-string v3, "io.grpc.internal.PickFirstLeafLoadBalancer"

    .line 217
    .line 218
    invoke-virtual {p0, v0, v3, v1, v2}, Ljava/util/logging/Logger;->logp(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 219
    .line 220
    .line 221
    return-void

    .line 222
    :cond_6
    iget-boolean v0, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzo:Z

    .line 223
    .line 224
    if-eqz v0, :cond_7

    .line 225
    .line 226
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbnj;->zzo()V

    .line 227
    .line 228
    .line 229
    return-void

    .line 230
    :cond_7
    invoke-virtual {v1}, Lcom/google/android/libraries/places/internal/zzbbj;->zza()V

    .line 231
    .line 232
    .line 233
    :cond_8
    :goto_1
    return-void
.end method

.method public final zze()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzh:Ljava/util/Map;

    .line 2
    .line 3
    sget-object v1, Lcom/google/android/libraries/places/internal/zzbnj;->zzf:Ljava/util/logging/Logger;

    .line 4
    .line 5
    sget-object v2, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    .line 6
    .line 7
    invoke-interface {v0}, Ljava/util/Map;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object v6

    .line 15
    const-string v4, "shutdown"

    .line 16
    .line 17
    const-string v5, "Shutting down, currently have {} subchannels created"

    .line 18
    .line 19
    const-string v3, "io.grpc.internal.PickFirstLeafLoadBalancer"

    .line 20
    .line 21
    invoke-virtual/range {v1 .. v6}, Ljava/util/logging/Logger;->logp(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    sget-object v0, Lcom/google/android/libraries/places/internal/zzaze;->zze:Lcom/google/android/libraries/places/internal/zzaze;

    .line 25
    .line 26
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzm:Lcom/google/android/libraries/places/internal/zzaze;

    .line 27
    .line 28
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzn:Lcom/google/android/libraries/places/internal/zzaze;

    .line 29
    .line 30
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbnj;->zzn()V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzh:Ljava/util/Map;

    .line 34
    .line 35
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_0

    .line 48
    .line 49
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    check-cast v1, Lcom/google/android/libraries/places/internal/zzbni;

    .line 54
    .line 55
    invoke-virtual {v1}, Lcom/google/android/libraries/places/internal/zzbni;->zze()Lcom/google/android/libraries/places/internal/zzbbj;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v1}, Lcom/google/android/libraries/places/internal/zzbbj;->zzb()V

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_0
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzh:Ljava/util/Map;

    .line 64
    .line 65
    invoke-interface {p0}, Ljava/util/Map;->clear()V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public final zzm(Lcom/google/android/libraries/places/internal/zzbbj;Lcom/google/android/libraries/places/internal/zzazf;)V
    .locals 5

    .line 1
    invoke-virtual {p2}, Lcom/google/android/libraries/places/internal/zzazf;->zza()Lcom/google/android/libraries/places/internal/zzaze;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzh:Ljava/util/Map;

    .line 6
    .line 7
    invoke-static {p1}, Lcom/google/android/libraries/places/internal/zzbnj;->zzr(Lcom/google/android/libraries/places/internal/zzbbj;)Ljava/net/SocketAddress;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Lcom/google/android/libraries/places/internal/zzbni;

    .line 16
    .line 17
    if-eqz v1, :cond_f

    .line 18
    .line 19
    invoke-virtual {v1}, Lcom/google/android/libraries/places/internal/zzbni;->zze()Lcom/google/android/libraries/places/internal/zzbbj;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    if-eq v2, p1, :cond_0

    .line 24
    .line 25
    goto/16 :goto_1

    .line 26
    .line 27
    :cond_0
    sget-object v2, Lcom/google/android/libraries/places/internal/zzaze;->zze:Lcom/google/android/libraries/places/internal/zzaze;

    .line 28
    .line 29
    if-eq v0, v2, :cond_f

    .line 30
    .line 31
    sget-object v2, Lcom/google/android/libraries/places/internal/zzaze;->zzd:Lcom/google/android/libraries/places/internal/zzaze;

    .line 32
    .line 33
    if-ne v0, v2, :cond_1

    .line 34
    .line 35
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzg:Lcom/google/android/libraries/places/internal/zzbbd;

    .line 36
    .line 37
    invoke-virtual {v3}, Lcom/google/android/libraries/places/internal/zzbbd;->zzd()V

    .line 38
    .line 39
    .line 40
    :cond_1
    invoke-static {v1, v0}, Lcom/google/android/libraries/places/internal/zzbni;->zzg(Lcom/google/android/libraries/places/internal/zzbni;Lcom/google/android/libraries/places/internal/zzaze;)V

    .line 41
    .line 42
    .line 43
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzm:Lcom/google/android/libraries/places/internal/zzaze;

    .line 44
    .line 45
    sget-object v4, Lcom/google/android/libraries/places/internal/zzaze;->zzc:Lcom/google/android/libraries/places/internal/zzaze;

    .line 46
    .line 47
    if-eq v3, v4, :cond_2

    .line 48
    .line 49
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzn:Lcom/google/android/libraries/places/internal/zzaze;

    .line 50
    .line 51
    if-ne v3, v4, :cond_3

    .line 52
    .line 53
    :cond_2
    sget-object v3, Lcom/google/android/libraries/places/internal/zzaze;->zza:Lcom/google/android/libraries/places/internal/zzaze;

    .line 54
    .line 55
    if-eq v0, v3, :cond_f

    .line 56
    .line 57
    if-eq v0, v2, :cond_e

    .line 58
    .line 59
    :cond_3
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    if-eqz v3, :cond_d

    .line 64
    .line 65
    const/4 v4, 0x1

    .line 66
    if-eq v3, v4, :cond_a

    .line 67
    .line 68
    const/4 v1, 0x2

    .line 69
    if-eq v3, v1, :cond_5

    .line 70
    .line 71
    const/4 p1, 0x3

    .line 72
    if-ne v3, p1, :cond_4

    .line 73
    .line 74
    iget-object p1, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzi:Lcom/google/android/libraries/places/internal/zzbnd;

    .line 75
    .line 76
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzbnd;->zzd()V

    .line 77
    .line 78
    .line 79
    iput-object v2, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzm:Lcom/google/android/libraries/places/internal/zzaze;

    .line 80
    .line 81
    new-instance p1, Lcom/google/android/libraries/places/internal/zzbnh;

    .line 82
    .line 83
    invoke-direct {p1, p0, p0}, Lcom/google/android/libraries/places/internal/zzbnh;-><init>(Lcom/google/android/libraries/places/internal/zzbnj;Lcom/google/android/libraries/places/internal/zzbnj;)V

    .line 84
    .line 85
    .line 86
    invoke-direct {p0, v2, p1}, Lcom/google/android/libraries/places/internal/zzbnj;->zzp(Lcom/google/android/libraries/places/internal/zzaze;Lcom/google/android/libraries/places/internal/zzbbk;)V

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :cond_4
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    const-string p1, "Unsupported state:"

    .line 95
    .line 96
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    return-void

    .line 104
    :cond_5
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzi:Lcom/google/android/libraries/places/internal/zzbnd;

    .line 105
    .line 106
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbnd;->zzg()Z

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    if-eqz v0, :cond_6

    .line 111
    .line 112
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzh:Ljava/util/Map;

    .line 113
    .line 114
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzi:Lcom/google/android/libraries/places/internal/zzbnd;

    .line 115
    .line 116
    invoke-virtual {v1}, Lcom/google/android/libraries/places/internal/zzbnd;->zzc()Ljava/net/SocketAddress;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    check-cast v0, Lcom/google/android/libraries/places/internal/zzbni;

    .line 125
    .line 126
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbni;->zze()Lcom/google/android/libraries/places/internal/zzbbj;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    if-ne v0, p1, :cond_6

    .line 131
    .line 132
    iget-object p1, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzi:Lcom/google/android/libraries/places/internal/zzbnd;

    .line 133
    .line 134
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzbnd;->zzf()Z

    .line 135
    .line 136
    .line 137
    move-result p1

    .line 138
    if-eqz p1, :cond_6

    .line 139
    .line 140
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbnj;->zzn()V

    .line 141
    .line 142
    .line 143
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbbm;->zzd()V

    .line 144
    .line 145
    .line 146
    :cond_6
    iget-object p1, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzi:Lcom/google/android/libraries/places/internal/zzbnd;

    .line 147
    .line 148
    if-eqz p1, :cond_f

    .line 149
    .line 150
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzbnd;->zzg()Z

    .line 151
    .line 152
    .line 153
    move-result p1

    .line 154
    if-nez p1, :cond_f

    .line 155
    .line 156
    iget-object p1, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzh:Ljava/util/Map;

    .line 157
    .line 158
    invoke-interface {p1}, Ljava/util/Map;->size()I

    .line 159
    .line 160
    .line 161
    move-result p1

    .line 162
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzi:Lcom/google/android/libraries/places/internal/zzbnd;

    .line 163
    .line 164
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbnd;->zza()I

    .line 165
    .line 166
    .line 167
    move-result v0

    .line 168
    if-lt p1, v0, :cond_f

    .line 169
    .line 170
    iget-object p1, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzh:Ljava/util/Map;

    .line 171
    .line 172
    invoke-interface {p1}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 177
    .line 178
    .line 179
    move-result-object p1

    .line 180
    :cond_7
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 181
    .line 182
    .line 183
    move-result v0

    .line 184
    if-eqz v0, :cond_8

    .line 185
    .line 186
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    check-cast v0, Lcom/google/android/libraries/places/internal/zzbni;

    .line 191
    .line 192
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbni;->zzh()Z

    .line 193
    .line 194
    .line 195
    move-result v0

    .line 196
    if-nez v0, :cond_7

    .line 197
    .line 198
    goto/16 :goto_1

    .line 199
    .line 200
    :cond_8
    sget-object p1, Lcom/google/android/libraries/places/internal/zzaze;->zzc:Lcom/google/android/libraries/places/internal/zzaze;

    .line 201
    .line 202
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzm:Lcom/google/android/libraries/places/internal/zzaze;

    .line 203
    .line 204
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbnf;

    .line 205
    .line 206
    invoke-virtual {p2}, Lcom/google/android/libraries/places/internal/zzazf;->zzd()Lcom/google/android/libraries/places/internal/zzbdo;

    .line 207
    .line 208
    .line 209
    move-result-object p2

    .line 210
    invoke-static {p2}, Lcom/google/android/libraries/places/internal/zzbbe;->zzb(Lcom/google/android/libraries/places/internal/zzbdo;)Lcom/google/android/libraries/places/internal/zzbbe;

    .line 211
    .line 212
    .line 213
    move-result-object p2

    .line 214
    invoke-direct {v0, p2}, Lcom/google/android/libraries/places/internal/zzbnf;-><init>(Lcom/google/android/libraries/places/internal/zzbbe;)V

    .line 215
    .line 216
    .line 217
    invoke-direct {p0, p1, v0}, Lcom/google/android/libraries/places/internal/zzbnj;->zzp(Lcom/google/android/libraries/places/internal/zzaze;Lcom/google/android/libraries/places/internal/zzbbk;)V

    .line 218
    .line 219
    .line 220
    iget p1, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzj:I

    .line 221
    .line 222
    add-int/2addr p1, v4

    .line 223
    iput p1, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzj:I

    .line 224
    .line 225
    iget-object p2, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzi:Lcom/google/android/libraries/places/internal/zzbnd;

    .line 226
    .line 227
    invoke-virtual {p2}, Lcom/google/android/libraries/places/internal/zzbnd;->zza()I

    .line 228
    .line 229
    .line 230
    move-result p2

    .line 231
    if-ge p1, p2, :cond_9

    .line 232
    .line 233
    iget-boolean p1, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzk:Z

    .line 234
    .line 235
    if-eqz p1, :cond_f

    .line 236
    .line 237
    :cond_9
    const/4 p1, 0x0

    .line 238
    iput-boolean p1, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzk:Z

    .line 239
    .line 240
    iput p1, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzj:I

    .line 241
    .line 242
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzg:Lcom/google/android/libraries/places/internal/zzbbd;

    .line 243
    .line 244
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbbd;->zzd()V

    .line 245
    .line 246
    .line 247
    return-void

    .line 248
    :cond_a
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbnj;->zzn()V

    .line 249
    .line 250
    .line 251
    iget-object p2, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzh:Ljava/util/Map;

    .line 252
    .line 253
    invoke-interface {p2}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 254
    .line 255
    .line 256
    move-result-object p2

    .line 257
    invoke-interface {p2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 258
    .line 259
    .line 260
    move-result-object p2

    .line 261
    :cond_b
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 262
    .line 263
    .line 264
    move-result v0

    .line 265
    if-eqz v0, :cond_c

    .line 266
    .line 267
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 268
    .line 269
    .line 270
    move-result-object v0

    .line 271
    check-cast v0, Lcom/google/android/libraries/places/internal/zzbni;

    .line 272
    .line 273
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbni;->zze()Lcom/google/android/libraries/places/internal/zzbbj;

    .line 274
    .line 275
    .line 276
    move-result-object v2

    .line 277
    invoke-static {v1}, Lcom/google/android/libraries/places/internal/zzbni;->zzd(Lcom/google/android/libraries/places/internal/zzbni;)Lcom/google/android/libraries/places/internal/zzbbj;

    .line 278
    .line 279
    .line 280
    move-result-object v3

    .line 281
    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 282
    .line 283
    .line 284
    move-result v2

    .line 285
    if-nez v2, :cond_b

    .line 286
    .line 287
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbni;->zze()Lcom/google/android/libraries/places/internal/zzbbj;

    .line 288
    .line 289
    .line 290
    move-result-object v0

    .line 291
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbbj;->zzb()V

    .line 292
    .line 293
    .line 294
    goto :goto_0

    .line 295
    :cond_c
    iget-object p2, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzh:Ljava/util/Map;

    .line 296
    .line 297
    invoke-interface {p2}, Ljava/util/Map;->clear()V

    .line 298
    .line 299
    .line 300
    sget-object p2, Lcom/google/android/libraries/places/internal/zzaze;->zzb:Lcom/google/android/libraries/places/internal/zzaze;

    .line 301
    .line 302
    invoke-static {v1, p2}, Lcom/google/android/libraries/places/internal/zzbni;->zzg(Lcom/google/android/libraries/places/internal/zzbni;Lcom/google/android/libraries/places/internal/zzaze;)V

    .line 303
    .line 304
    .line 305
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzh:Ljava/util/Map;

    .line 306
    .line 307
    invoke-static {v1}, Lcom/google/android/libraries/places/internal/zzbni;->zzd(Lcom/google/android/libraries/places/internal/zzbni;)Lcom/google/android/libraries/places/internal/zzbbj;

    .line 308
    .line 309
    .line 310
    move-result-object v2

    .line 311
    invoke-static {v2}, Lcom/google/android/libraries/places/internal/zzbnj;->zzr(Lcom/google/android/libraries/places/internal/zzbbj;)Ljava/net/SocketAddress;

    .line 312
    .line 313
    .line 314
    move-result-object v2

    .line 315
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 316
    .line 317
    .line 318
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzi:Lcom/google/android/libraries/places/internal/zzbnd;

    .line 319
    .line 320
    invoke-static {p1}, Lcom/google/android/libraries/places/internal/zzbnj;->zzr(Lcom/google/android/libraries/places/internal/zzbbj;)Ljava/net/SocketAddress;

    .line 321
    .line 322
    .line 323
    move-result-object p1

    .line 324
    invoke-virtual {v0, p1}, Lcom/google/android/libraries/places/internal/zzbnd;->zzh(Ljava/net/SocketAddress;)Z

    .line 325
    .line 326
    .line 327
    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzm:Lcom/google/android/libraries/places/internal/zzaze;

    .line 328
    .line 329
    invoke-direct {p0, v1}, Lcom/google/android/libraries/places/internal/zzbnj;->zzq(Lcom/google/android/libraries/places/internal/zzbni;)V

    .line 330
    .line 331
    .line 332
    return-void

    .line 333
    :cond_d
    sget-object p1, Lcom/google/android/libraries/places/internal/zzaze;->zza:Lcom/google/android/libraries/places/internal/zzaze;

    .line 334
    .line 335
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbnj;->zzm:Lcom/google/android/libraries/places/internal/zzaze;

    .line 336
    .line 337
    new-instance p2, Lcom/google/android/libraries/places/internal/zzbnf;

    .line 338
    .line 339
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzbbe;->zzc()Lcom/google/android/libraries/places/internal/zzbbe;

    .line 340
    .line 341
    .line 342
    move-result-object v0

    .line 343
    invoke-direct {p2, v0}, Lcom/google/android/libraries/places/internal/zzbnf;-><init>(Lcom/google/android/libraries/places/internal/zzbbe;)V

    .line 344
    .line 345
    .line 346
    invoke-direct {p0, p1, p2}, Lcom/google/android/libraries/places/internal/zzbnj;->zzp(Lcom/google/android/libraries/places/internal/zzaze;Lcom/google/android/libraries/places/internal/zzbbk;)V

    .line 347
    .line 348
    .line 349
    return-void

    .line 350
    :cond_e
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbbm;->zzd()V

    .line 351
    .line 352
    .line 353
    :cond_f
    :goto_1
    return-void
.end method
