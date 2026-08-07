.class final Lcom/google/android/libraries/places/internal/zzbfq;
.super Lcom/google/android/libraries/places/internal/zzayo;
.source "SourceFile"


# static fields
.field private static final zza:Ljava/util/logging/Logger;

.field private static final zzb:[B

.field private static final zzc:D


# instance fields
.field private final zzd:Lcom/google/android/libraries/places/internal/zzbcl;

.field private final zze:Lcom/google/android/libraries/places/internal/zzbvs;

.field private final zzf:Ljava/util/concurrent/Executor;

.field private final zzg:Z

.field private final zzh:Lcom/google/android/libraries/places/internal/zzbfg;

.field private final zzi:Lcom/google/android/libraries/places/internal/zzazj;

.field private zzj:Lcom/google/android/libraries/places/internal/zzbfj;

.field private final zzk:Z

.field private zzl:Lcom/google/android/libraries/places/internal/zzayj;

.field private zzm:Lcom/google/android/libraries/places/internal/zzbfr;

.field private zzn:Z

.field private zzo:Z

.field private final zzp:Lcom/google/android/libraries/places/internal/zzbfp;

.field private final zzq:Ljava/util/concurrent/ScheduledExecutorService;

.field private zzr:Lcom/google/android/libraries/places/internal/zzazq;

.field private zzs:Lcom/google/android/libraries/places/internal/zzazd;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-class v0, Lcom/google/android/libraries/places/internal/zzbfq;

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
    sput-object v0, Lcom/google/android/libraries/places/internal/zzbfq;->zza:Ljava/util/logging/Logger;

    .line 12
    .line 13
    const-string v0, "gzip"

    .line 14
    .line 15
    const-string v1, "US-ASCII"

    .line 16
    .line 17
    invoke-static {v1}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sput-object v0, Lcom/google/android/libraries/places/internal/zzbfq;->zzb:[B

    .line 26
    .line 27
    const-wide v0, 0x41cdcd6500000000L    # 1.0E9

    .line 28
    .line 29
    .line 30
    .line 31
    .line 32
    sput-wide v0, Lcom/google/android/libraries/places/internal/zzbfq;->zzc:D

    .line 33
    .line 34
    return-void
.end method

.method public constructor <init>(Lcom/google/android/libraries/places/internal/zzbcl;Ljava/util/concurrent/Executor;Lcom/google/android/libraries/places/internal/zzayj;Lcom/google/android/libraries/places/internal/zzbfp;Ljava/util/concurrent/ScheduledExecutorService;Lcom/google/android/libraries/places/internal/zzbfg;Lcom/google/android/libraries/places/internal/zzbam;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzayo;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzazq;->zzb()Lcom/google/android/libraries/places/internal/zzazq;

    .line 5
    .line 6
    .line 7
    move-result-object p7

    .line 8
    iput-object p7, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzr:Lcom/google/android/libraries/places/internal/zzazq;

    .line 9
    .line 10
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzazd;->zza()Lcom/google/android/libraries/places/internal/zzazd;

    .line 11
    .line 12
    .line 13
    move-result-object p7

    .line 14
    iput-object p7, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzs:Lcom/google/android/libraries/places/internal/zzazd;

    .line 15
    .line 16
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzd:Lcom/google/android/libraries/places/internal/zzbcl;

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzbcl;->zzf()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p7

    .line 22
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    int-to-long v0, v0

    .line 27
    invoke-static {p7, v0, v1}, Lcom/google/android/libraries/places/internal/zzbvr;->zzc(Ljava/lang/String;J)Lcom/google/android/libraries/places/internal/zzbvs;

    .line 28
    .line 29
    .line 30
    move-result-object p7

    .line 31
    iput-object p7, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zze:Lcom/google/android/libraries/places/internal/zzbvs;

    .line 32
    .line 33
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzakb;->zza()Ljava/util/concurrent/Executor;

    .line 34
    .line 35
    .line 36
    move-result-object p7

    .line 37
    const/4 v0, 0x0

    .line 38
    const/4 v1, 0x1

    .line 39
    if-ne p2, p7, :cond_0

    .line 40
    .line 41
    new-instance p2, Lcom/google/android/libraries/places/internal/zzbpx;

    .line 42
    .line 43
    invoke-direct {p2}, Lcom/google/android/libraries/places/internal/zzbpx;-><init>()V

    .line 44
    .line 45
    .line 46
    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzf:Ljava/util/concurrent/Executor;

    .line 47
    .line 48
    iput-boolean v1, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzg:Z

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    new-instance p7, Lcom/google/android/libraries/places/internal/zzbqe;

    .line 52
    .line 53
    invoke-direct {p7, p2}, Lcom/google/android/libraries/places/internal/zzbqe;-><init>(Ljava/util/concurrent/Executor;)V

    .line 54
    .line 55
    .line 56
    iput-object p7, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzf:Ljava/util/concurrent/Executor;

    .line 57
    .line 58
    iput-boolean v0, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzg:Z

    .line 59
    .line 60
    :goto_0
    iput-object p6, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzh:Lcom/google/android/libraries/places/internal/zzbfg;

    .line 61
    .line 62
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzazj;->zzb()Lcom/google/android/libraries/places/internal/zzazj;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzi:Lcom/google/android/libraries/places/internal/zzazj;

    .line 67
    .line 68
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzbcl;->zzb()Lcom/google/android/libraries/places/internal/zzbcj;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    sget-object p6, Lcom/google/android/libraries/places/internal/zzbcj;->zza:Lcom/google/android/libraries/places/internal/zzbcj;

    .line 73
    .line 74
    if-eq p2, p6, :cond_1

    .line 75
    .line 76
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzbcl;->zzb()Lcom/google/android/libraries/places/internal/zzbcj;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    sget-object p2, Lcom/google/android/libraries/places/internal/zzbcj;->zzc:Lcom/google/android/libraries/places/internal/zzbcj;

    .line 81
    .line 82
    if-ne p1, p2, :cond_2

    .line 83
    .line 84
    :cond_1
    move v0, v1

    .line 85
    :cond_2
    iput-boolean v0, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzk:Z

    .line 86
    .line 87
    iput-object p3, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzl:Lcom/google/android/libraries/places/internal/zzayj;

    .line 88
    .line 89
    iput-object p4, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzp:Lcom/google/android/libraries/places/internal/zzbfp;

    .line 90
    .line 91
    iput-object p5, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzq:Ljava/util/concurrent/ScheduledExecutorService;

    .line 92
    .line 93
    return-void
.end method

.method public static bridge synthetic zzf()D
    .locals 2

    sget-wide v0, Lcom/google/android/libraries/places/internal/zzbfq;->zzc:D

    return-wide v0
.end method

.method public static bridge synthetic zzg(Lcom/google/android/libraries/places/internal/zzbfq;)Lcom/google/android/libraries/places/internal/zzayj;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzl:Lcom/google/android/libraries/places/internal/zzayj;

    return-object p0
.end method

.method public static bridge synthetic zzh(Lcom/google/android/libraries/places/internal/zzbfq;)Lcom/google/android/libraries/places/internal/zzazj;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzi:Lcom/google/android/libraries/places/internal/zzazj;

    return-object p0
.end method

.method public static bridge synthetic zzi(Lcom/google/android/libraries/places/internal/zzbfq;)Lcom/google/android/libraries/places/internal/zzazn;
    .locals 0

    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbfq;->zzr()Lcom/google/android/libraries/places/internal/zzazn;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic zzj(Lcom/google/android/libraries/places/internal/zzbfq;)Lcom/google/android/libraries/places/internal/zzbcl;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzd:Lcom/google/android/libraries/places/internal/zzbcl;

    return-object p0
.end method

.method public static bridge synthetic zzk(Lcom/google/android/libraries/places/internal/zzbfq;)Lcom/google/android/libraries/places/internal/zzbfg;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzh:Lcom/google/android/libraries/places/internal/zzbfg;

    return-object p0
.end method

.method public static bridge synthetic zzl(Lcom/google/android/libraries/places/internal/zzbfq;)Lcom/google/android/libraries/places/internal/zzbfj;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzj:Lcom/google/android/libraries/places/internal/zzbfj;

    return-object p0
.end method

.method public static bridge synthetic zzo(Lcom/google/android/libraries/places/internal/zzbfq;)Lcom/google/android/libraries/places/internal/zzbfr;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzm:Lcom/google/android/libraries/places/internal/zzbfr;

    return-object p0
.end method

.method public static bridge synthetic zzp(Lcom/google/android/libraries/places/internal/zzbfq;)Ljava/util/concurrent/Executor;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzf:Ljava/util/concurrent/Executor;

    return-object p0
.end method

.method public static bridge synthetic zzq(Lcom/google/android/libraries/places/internal/zzbfq;)Ljava/util/concurrent/ScheduledExecutorService;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzq:Ljava/util/concurrent/ScheduledExecutorService;

    return-object p0
.end method

.method private final zzr()Lcom/google/android/libraries/places/internal/zzazn;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzl:Lcom/google/android/libraries/places/internal/zzayj;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzayj;->zzi()Lcom/google/android/libraries/places/internal/zzazn;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    :cond_0
    return-object p0
.end method

.method private final zzs(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzm:Lcom/google/android/libraries/places/internal/zzbfr;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    move v0, v1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    :goto_0
    const-string v2, "Not started"

    .line 10
    .line 11
    invoke-static {v0, v2}, Lcom/google/android/libraries/places/internal/zzmt;->zzp(ZLjava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    iget-boolean v0, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzn:Z

    .line 15
    .line 16
    xor-int/2addr v0, v1

    .line 17
    const-string v2, "call was cancelled"

    .line 18
    .line 19
    invoke-static {v0, v2}, Lcom/google/android/libraries/places/internal/zzmt;->zzp(ZLjava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    iget-boolean v0, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzo:Z

    .line 23
    .line 24
    xor-int/2addr v0, v1

    .line 25
    const-string v1, "call was half-closed"

    .line 26
    .line 27
    invoke-static {v0, v1}, Lcom/google/android/libraries/places/internal/zzmt;->zzp(ZLjava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    :try_start_0
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzm:Lcom/google/android/libraries/places/internal/zzbfr;

    .line 31
    .line 32
    instance-of v1, v0, Lcom/google/android/libraries/places/internal/zzbpo;

    .line 33
    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    check-cast v0, Lcom/google/android/libraries/places/internal/zzbpo;

    .line 37
    .line 38
    invoke-virtual {v0, p1}, Lcom/google/android/libraries/places/internal/zzbpo;->zzab(Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    goto :goto_1

    .line 42
    :catch_0
    move-exception p1

    .line 43
    goto :goto_2

    .line 44
    :catch_1
    move-exception p1

    .line 45
    goto :goto_3

    .line 46
    :cond_1
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzd:Lcom/google/android/libraries/places/internal/zzbcl;

    .line 47
    .line 48
    invoke-virtual {v1, p1}, Lcom/google/android/libraries/places/internal/zzbcl;->zzc(Ljava/lang/Object;)Ljava/io/InputStream;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-interface {v0, p1}, Lcom/google/android/libraries/places/internal/zzbqp;->zzw(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 53
    .line 54
    .line 55
    :goto_1
    iget-boolean p1, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzk:Z

    .line 56
    .line 57
    if-nez p1, :cond_2

    .line 58
    .line 59
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzm:Lcom/google/android/libraries/places/internal/zzbfr;

    .line 60
    .line 61
    invoke-interface {p0}, Lcom/google/android/libraries/places/internal/zzbqp;->zzr()V

    .line 62
    .line 63
    .line 64
    :cond_2
    return-void

    .line 65
    :goto_2
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzm:Lcom/google/android/libraries/places/internal/zzbfr;

    .line 66
    .line 67
    sget-object v0, Lcom/google/android/libraries/places/internal/zzbdo;->zzb:Lcom/google/android/libraries/places/internal/zzbdo;

    .line 68
    .line 69
    const-string v1, "Client sendMessage() failed with Error"

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Lcom/google/android/libraries/places/internal/zzbdo;->zzg(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-interface {p0, v0}, Lcom/google/android/libraries/places/internal/zzbfr;->zzh(Lcom/google/android/libraries/places/internal/zzbdo;)V

    .line 76
    .line 77
    .line 78
    throw p1

    .line 79
    :goto_3
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzm:Lcom/google/android/libraries/places/internal/zzbfr;

    .line 80
    .line 81
    sget-object v0, Lcom/google/android/libraries/places/internal/zzbdo;->zzb:Lcom/google/android/libraries/places/internal/zzbdo;

    .line 82
    .line 83
    invoke-virtual {v0, p1}, Lcom/google/android/libraries/places/internal/zzbdo;->zzf(Ljava/lang/Throwable;)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    const-string v0, "Failed to stream message"

    .line 88
    .line 89
    invoke-virtual {p1, v0}, Lcom/google/android/libraries/places/internal/zzbdo;->zzg(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-interface {p0, p1}, Lcom/google/android/libraries/places/internal/zzbfr;->zzh(Lcom/google/android/libraries/places/internal/zzbdo;)V

    .line 94
    .line 95
    .line 96
    return-void
.end method


# virtual methods
.method public final toString()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzmn;->zzb(Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zzmm;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "method"

    .line 6
    .line 7
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzd:Lcom/google/android/libraries/places/internal/zzbcl;

    .line 8
    .line 9
    invoke-virtual {v0, v1, p0}, Lcom/google/android/libraries/places/internal/zzmm;->zzd(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zzmm;

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzmm;->toString()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public final zza(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 7

    .line 1
    sget v0, Lcom/google/android/libraries/places/internal/zzbvr;->zza:I

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    new-instance v6, Ljava/util/concurrent/CancellationException;

    .line 8
    .line 9
    const-string p2, "Cancelled without a message or cause"

    .line 10
    .line 11
    invoke-direct {v6, p2}, Ljava/util/concurrent/CancellationException;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    sget-object v1, Lcom/google/android/libraries/places/internal/zzbfq;->zza:Ljava/util/logging/Logger;

    .line 15
    .line 16
    sget-object v2, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    .line 17
    .line 18
    const-string v4, "cancelInternal"

    .line 19
    .line 20
    const-string v5, "Cancelling without a message or cause is suboptimal"

    .line 21
    .line 22
    const-string v3, "io.grpc.internal.ClientCallImpl"

    .line 23
    .line 24
    invoke-virtual/range {v1 .. v6}, Ljava/util/logging/Logger;->logp(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 25
    .line 26
    .line 27
    move-object p2, v6

    .line 28
    :cond_0
    iget-boolean v0, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzn:Z

    .line 29
    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_1
    const/4 v0, 0x1

    .line 34
    iput-boolean v0, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzn:Z

    .line 35
    .line 36
    :try_start_0
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzm:Lcom/google/android/libraries/places/internal/zzbfr;

    .line 37
    .line 38
    if-eqz v0, :cond_4

    .line 39
    .line 40
    sget-object v0, Lcom/google/android/libraries/places/internal/zzbdo;->zzb:Lcom/google/android/libraries/places/internal/zzbdo;

    .line 41
    .line 42
    if-eqz p1, :cond_2

    .line 43
    .line 44
    invoke-virtual {v0, p1}, Lcom/google/android/libraries/places/internal/zzbdo;->zzg(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    goto :goto_0

    .line 49
    :catchall_0
    move-exception v0

    .line 50
    move-object p1, v0

    .line 51
    goto :goto_2

    .line 52
    :cond_2
    const-string p1, "Call cancelled without message"

    .line 53
    .line 54
    invoke-virtual {v0, p1}, Lcom/google/android/libraries/places/internal/zzbdo;->zzg(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    :goto_0
    if-eqz p2, :cond_3

    .line 59
    .line 60
    invoke-virtual {p1, p2}, Lcom/google/android/libraries/places/internal/zzbdo;->zzf(Ljava/lang/Throwable;)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    :cond_3
    iget-object p2, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzm:Lcom/google/android/libraries/places/internal/zzbfr;

    .line 65
    .line 66
    invoke-interface {p2, p1}, Lcom/google/android/libraries/places/internal/zzbfr;->zzh(Lcom/google/android/libraries/places/internal/zzbdo;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 67
    .line 68
    .line 69
    :cond_4
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzj:Lcom/google/android/libraries/places/internal/zzbfj;

    .line 70
    .line 71
    if-eqz p0, :cond_5

    .line 72
    .line 73
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbfj;->zzd()V

    .line 74
    .line 75
    .line 76
    :cond_5
    :goto_1
    return-void

    .line 77
    :goto_2
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzj:Lcom/google/android/libraries/places/internal/zzbfj;

    .line 78
    .line 79
    if-nez p0, :cond_6

    .line 80
    .line 81
    goto :goto_3

    .line 82
    :cond_6
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbfj;->zzd()V

    .line 83
    .line 84
    .line 85
    :goto_3
    throw p1
.end method

.method public final zzb()V
    .locals 3

    .line 1
    sget v0, Lcom/google/android/libraries/places/internal/zzbvr;->zza:I

    .line 2
    .line 3
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzm:Lcom/google/android/libraries/places/internal/zzbfr;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    move v0, v1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    :goto_0
    const-string v2, "Not started"

    .line 12
    .line 13
    invoke-static {v0, v2}, Lcom/google/android/libraries/places/internal/zzmt;->zzp(ZLjava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    iget-boolean v0, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzn:Z

    .line 17
    .line 18
    xor-int/2addr v0, v1

    .line 19
    const-string v2, "call was cancelled"

    .line 20
    .line 21
    invoke-static {v0, v2}, Lcom/google/android/libraries/places/internal/zzmt;->zzp(ZLjava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    iget-boolean v0, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzo:Z

    .line 25
    .line 26
    xor-int/2addr v0, v1

    .line 27
    const-string v2, "call already half-closed"

    .line 28
    .line 29
    invoke-static {v0, v2}, Lcom/google/android/libraries/places/internal/zzmt;->zzp(ZLjava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    iput-boolean v1, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzo:Z

    .line 33
    .line 34
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzm:Lcom/google/android/libraries/places/internal/zzbfr;

    .line 35
    .line 36
    invoke-interface {p0}, Lcom/google/android/libraries/places/internal/zzbfr;->zzj()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final zzc(I)V
    .locals 1

    .line 1
    sget p1, Lcom/google/android/libraries/places/internal/zzbvr;->zza:I

    .line 2
    .line 3
    iget-object p1, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzm:Lcom/google/android/libraries/places/internal/zzbfr;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p1, 0x0

    .line 10
    :goto_0
    const-string v0, "Not started"

    .line 11
    .line 12
    invoke-static {p1, v0}, Lcom/google/android/libraries/places/internal/zzmt;->zzp(ZLjava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzm:Lcom/google/android/libraries/places/internal/zzbfr;

    .line 16
    .line 17
    const/4 p1, 0x2

    .line 18
    invoke-interface {p0, p1}, Lcom/google/android/libraries/places/internal/zzbqp;->zzu(I)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final zzd(Ljava/lang/Object;)V
    .locals 1

    .line 1
    sget v0, Lcom/google/android/libraries/places/internal/zzbvr;->zza:I

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/google/android/libraries/places/internal/zzbfq;->zzs(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final zze(Lcom/google/android/libraries/places/internal/zzayn;Lcom/google/android/libraries/places/internal/zzbcf;)V
    .locals 10

    .line 1
    sget v0, Lcom/google/android/libraries/places/internal/zzbvr;->zza:I

    .line 2
    .line 3
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzm:Lcom/google/android/libraries/places/internal/zzbfr;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    const/4 v2, 0x0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    move v0, v1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move v0, v2

    .line 12
    :goto_0
    const-string v3, "Already started"

    .line 13
    .line 14
    invoke-static {v0, v3}, Lcom/google/android/libraries/places/internal/zzmt;->zzp(ZLjava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    iget-boolean v0, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzn:Z

    .line 18
    .line 19
    xor-int/2addr v0, v1

    .line 20
    const-string v3, "call was cancelled"

    .line 21
    .line 22
    invoke-static {v0, v3}, Lcom/google/android/libraries/places/internal/zzmt;->zzp(ZLjava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzl:Lcom/google/android/libraries/places/internal/zzayj;

    .line 26
    .line 27
    sget-object v3, Lcom/google/android/libraries/places/internal/zzbmg;->zza:Lcom/google/android/libraries/places/internal/zzayh;

    .line 28
    .line 29
    invoke-virtual {v0, v3}, Lcom/google/android/libraries/places/internal/zzayj;->zzl(Lcom/google/android/libraries/places/internal/zzayh;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Lcom/google/android/libraries/places/internal/zzbmg;

    .line 34
    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    goto/16 :goto_3

    .line 38
    .line 39
    :cond_1
    iget-object v3, v0, Lcom/google/android/libraries/places/internal/zzbmg;->zzb:Ljava/lang/Long;

    .line 40
    .line 41
    if-eqz v3, :cond_3

    .line 42
    .line 43
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 44
    .line 45
    .line 46
    move-result-wide v3

    .line 47
    sget-object v5, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    .line 48
    .line 49
    invoke-static {v3, v4, v5}, Lcom/google/android/libraries/places/internal/zzazn;->zzd(JLjava/util/concurrent/TimeUnit;)Lcom/google/android/libraries/places/internal/zzazn;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    iget-object v4, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzl:Lcom/google/android/libraries/places/internal/zzayj;

    .line 54
    .line 55
    invoke-virtual {v4}, Lcom/google/android/libraries/places/internal/zzayj;->zzi()Lcom/google/android/libraries/places/internal/zzazn;

    .line 56
    .line 57
    .line 58
    move-result-object v4

    .line 59
    if-eqz v4, :cond_2

    .line 60
    .line 61
    invoke-virtual {v3, v4}, Lcom/google/android/libraries/places/internal/zzazn;->zza(Lcom/google/android/libraries/places/internal/zzazn;)I

    .line 62
    .line 63
    .line 64
    move-result v4

    .line 65
    if-gez v4, :cond_3

    .line 66
    .line 67
    :cond_2
    iget-object v4, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzl:Lcom/google/android/libraries/places/internal/zzayj;

    .line 68
    .line 69
    invoke-virtual {v4, v3}, Lcom/google/android/libraries/places/internal/zzayj;->zza(Lcom/google/android/libraries/places/internal/zzazn;)Lcom/google/android/libraries/places/internal/zzayj;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    iput-object v3, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzl:Lcom/google/android/libraries/places/internal/zzayj;

    .line 74
    .line 75
    :cond_3
    iget-object v3, v0, Lcom/google/android/libraries/places/internal/zzbmg;->zzc:Ljava/lang/Boolean;

    .line 76
    .line 77
    if-eqz v3, :cond_5

    .line 78
    .line 79
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 80
    .line 81
    .line 82
    move-result v3

    .line 83
    iget-object v4, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzl:Lcom/google/android/libraries/places/internal/zzayj;

    .line 84
    .line 85
    if-eqz v3, :cond_4

    .line 86
    .line 87
    invoke-virtual {v4}, Lcom/google/android/libraries/places/internal/zzayj;->zzg()Lcom/google/android/libraries/places/internal/zzayj;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    goto :goto_1

    .line 92
    :cond_4
    invoke-virtual {v4}, Lcom/google/android/libraries/places/internal/zzayj;->zzh()Lcom/google/android/libraries/places/internal/zzayj;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    :goto_1
    iput-object v3, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzl:Lcom/google/android/libraries/places/internal/zzayj;

    .line 97
    .line 98
    :cond_5
    iget-object v3, v0, Lcom/google/android/libraries/places/internal/zzbmg;->zzd:Ljava/lang/Integer;

    .line 99
    .line 100
    if-eqz v3, :cond_7

    .line 101
    .line 102
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzl:Lcom/google/android/libraries/places/internal/zzayj;

    .line 103
    .line 104
    invoke-virtual {v3}, Lcom/google/android/libraries/places/internal/zzayj;->zzj()Ljava/lang/Integer;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    iget-object v4, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzl:Lcom/google/android/libraries/places/internal/zzayj;

    .line 109
    .line 110
    if-eqz v3, :cond_6

    .line 111
    .line 112
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 113
    .line 114
    .line 115
    move-result v3

    .line 116
    iget-object v5, v0, Lcom/google/android/libraries/places/internal/zzbmg;->zzd:Ljava/lang/Integer;

    .line 117
    .line 118
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 119
    .line 120
    .line 121
    move-result v5

    .line 122
    invoke-static {v3, v5}, Ljava/lang/Math;->min(II)I

    .line 123
    .line 124
    .line 125
    move-result v3

    .line 126
    invoke-virtual {v4, v3}, Lcom/google/android/libraries/places/internal/zzayj;->zzc(I)Lcom/google/android/libraries/places/internal/zzayj;

    .line 127
    .line 128
    .line 129
    move-result-object v3

    .line 130
    iput-object v3, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzl:Lcom/google/android/libraries/places/internal/zzayj;

    .line 131
    .line 132
    goto :goto_2

    .line 133
    :cond_6
    iget-object v3, v0, Lcom/google/android/libraries/places/internal/zzbmg;->zzd:Ljava/lang/Integer;

    .line 134
    .line 135
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 136
    .line 137
    .line 138
    move-result v3

    .line 139
    invoke-virtual {v4, v3}, Lcom/google/android/libraries/places/internal/zzayj;->zzc(I)Lcom/google/android/libraries/places/internal/zzayj;

    .line 140
    .line 141
    .line 142
    move-result-object v3

    .line 143
    iput-object v3, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzl:Lcom/google/android/libraries/places/internal/zzayj;

    .line 144
    .line 145
    :cond_7
    :goto_2
    iget-object v3, v0, Lcom/google/android/libraries/places/internal/zzbmg;->zze:Ljava/lang/Integer;

    .line 146
    .line 147
    if-eqz v3, :cond_9

    .line 148
    .line 149
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzl:Lcom/google/android/libraries/places/internal/zzayj;

    .line 150
    .line 151
    invoke-virtual {v3}, Lcom/google/android/libraries/places/internal/zzayj;->zzk()Ljava/lang/Integer;

    .line 152
    .line 153
    .line 154
    move-result-object v3

    .line 155
    iget-object v4, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzl:Lcom/google/android/libraries/places/internal/zzayj;

    .line 156
    .line 157
    if-eqz v3, :cond_8

    .line 158
    .line 159
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 160
    .line 161
    .line 162
    move-result v3

    .line 163
    iget-object v0, v0, Lcom/google/android/libraries/places/internal/zzbmg;->zze:Ljava/lang/Integer;

    .line 164
    .line 165
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 166
    .line 167
    .line 168
    move-result v0

    .line 169
    invoke-static {v3, v0}, Ljava/lang/Math;->min(II)I

    .line 170
    .line 171
    .line 172
    move-result v0

    .line 173
    invoke-virtual {v4, v0}, Lcom/google/android/libraries/places/internal/zzayj;->zzd(I)Lcom/google/android/libraries/places/internal/zzayj;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzl:Lcom/google/android/libraries/places/internal/zzayj;

    .line 178
    .line 179
    goto :goto_3

    .line 180
    :cond_8
    iget-object v0, v0, Lcom/google/android/libraries/places/internal/zzbmg;->zze:Ljava/lang/Integer;

    .line 181
    .line 182
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 183
    .line 184
    .line 185
    move-result v0

    .line 186
    invoke-virtual {v4, v0}, Lcom/google/android/libraries/places/internal/zzayj;->zzd(I)Lcom/google/android/libraries/places/internal/zzayj;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzl:Lcom/google/android/libraries/places/internal/zzayj;

    .line 191
    .line 192
    :cond_9
    :goto_3
    sget-object v0, Lcom/google/android/libraries/places/internal/zzaza;->zza:Lcom/google/android/libraries/places/internal/zzazb;

    .line 193
    .line 194
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzr:Lcom/google/android/libraries/places/internal/zzazq;

    .line 195
    .line 196
    sget-object v4, Lcom/google/android/libraries/places/internal/zzbjd;->zzg:Lcom/google/android/libraries/places/internal/zzbca;

    .line 197
    .line 198
    invoke-virtual {p2, v4}, Lcom/google/android/libraries/places/internal/zzbcf;->zzd(Lcom/google/android/libraries/places/internal/zzbca;)V

    .line 199
    .line 200
    .line 201
    sget-object v4, Lcom/google/android/libraries/places/internal/zzbjd;->zzc:Lcom/google/android/libraries/places/internal/zzbca;

    .line 202
    .line 203
    invoke-virtual {p2, v4}, Lcom/google/android/libraries/places/internal/zzbcf;->zzd(Lcom/google/android/libraries/places/internal/zzbca;)V

    .line 204
    .line 205
    .line 206
    sget-object v4, Lcom/google/android/libraries/places/internal/zzbjd;->zzd:Lcom/google/android/libraries/places/internal/zzbca;

    .line 207
    .line 208
    invoke-virtual {p2, v4}, Lcom/google/android/libraries/places/internal/zzbcf;->zzd(Lcom/google/android/libraries/places/internal/zzbca;)V

    .line 209
    .line 210
    .line 211
    invoke-static {v3}, Lcom/google/android/libraries/places/internal/zzban;->zza(Lcom/google/android/libraries/places/internal/zzazq;)[B

    .line 212
    .line 213
    .line 214
    move-result-object v3

    .line 215
    array-length v5, v3

    .line 216
    if-eqz v5, :cond_a

    .line 217
    .line 218
    invoke-virtual {p2, v4, v3}, Lcom/google/android/libraries/places/internal/zzbcf;->zzf(Lcom/google/android/libraries/places/internal/zzbca;Ljava/lang/Object;)V

    .line 219
    .line 220
    .line 221
    :cond_a
    sget-object v3, Lcom/google/android/libraries/places/internal/zzbjd;->zze:Lcom/google/android/libraries/places/internal/zzbca;

    .line 222
    .line 223
    invoke-virtual {p2, v3}, Lcom/google/android/libraries/places/internal/zzbcf;->zzd(Lcom/google/android/libraries/places/internal/zzbca;)V

    .line 224
    .line 225
    .line 226
    sget-object v3, Lcom/google/android/libraries/places/internal/zzbjd;->zzf:Lcom/google/android/libraries/places/internal/zzbca;

    .line 227
    .line 228
    invoke-virtual {p2, v3}, Lcom/google/android/libraries/places/internal/zzbcf;->zzd(Lcom/google/android/libraries/places/internal/zzbca;)V

    .line 229
    .line 230
    .line 231
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbfq;->zzr()Lcom/google/android/libraries/places/internal/zzazn;

    .line 232
    .line 233
    .line 234
    move-result-object v3

    .line 235
    if-eqz v3, :cond_b

    .line 236
    .line 237
    const/4 v4, 0x0

    .line 238
    invoke-virtual {v3, v4}, Lcom/google/android/libraries/places/internal/zzazn;->equals(Ljava/lang/Object;)Z

    .line 239
    .line 240
    .line 241
    move-result v4

    .line 242
    if-eqz v4, :cond_b

    .line 243
    .line 244
    move v4, v1

    .line 245
    goto :goto_4

    .line 246
    :cond_b
    move v4, v2

    .line 247
    :goto_4
    new-instance v5, Lcom/google/android/libraries/places/internal/zzbfj;

    .line 248
    .line 249
    invoke-direct {v5, p0, v3, v4}, Lcom/google/android/libraries/places/internal/zzbfj;-><init>(Lcom/google/android/libraries/places/internal/zzbfq;Lcom/google/android/libraries/places/internal/zzazn;Z)V

    .line 250
    .line 251
    .line 252
    iput-object v5, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzj:Lcom/google/android/libraries/places/internal/zzbfj;

    .line 253
    .line 254
    if-eqz v3, :cond_e

    .line 255
    .line 256
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzbfj;->zza(Lcom/google/android/libraries/places/internal/zzbfj;)J

    .line 257
    .line 258
    .line 259
    move-result-wide v5

    .line 260
    const-wide/16 v7, 0x0

    .line 261
    .line 262
    cmp-long v5, v5, v7

    .line 263
    .line 264
    if-gtz v5, :cond_e

    .line 265
    .line 266
    iget-object v5, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzl:Lcom/google/android/libraries/places/internal/zzayj;

    .line 267
    .line 268
    invoke-static {v5, p2, v2, v2}, Lcom/google/android/libraries/places/internal/zzbjd;->zzk(Lcom/google/android/libraries/places/internal/zzayj;Lcom/google/android/libraries/places/internal/zzbcf;IZ)[Lcom/google/android/libraries/places/internal/zzayx;

    .line 269
    .line 270
    .line 271
    move-result-object p2

    .line 272
    if-eq v1, v4, :cond_c

    .line 273
    .line 274
    const-string v1, "CallOptions"

    .line 275
    .line 276
    goto :goto_5

    .line 277
    :cond_c
    const-string v1, "Context"

    .line 278
    .line 279
    :goto_5
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzl:Lcom/google/android/libraries/places/internal/zzayj;

    .line 280
    .line 281
    sget-object v4, Lcom/google/android/libraries/places/internal/zzayx;->zza:Lcom/google/android/libraries/places/internal/zzayh;

    .line 282
    .line 283
    invoke-virtual {v2, v4}, Lcom/google/android/libraries/places/internal/zzayj;->zzl(Lcom/google/android/libraries/places/internal/zzayh;)Ljava/lang/Object;

    .line 284
    .line 285
    .line 286
    move-result-object v2

    .line 287
    check-cast v2, Ljava/lang/Long;

    .line 288
    .line 289
    iget-object v4, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzj:Lcom/google/android/libraries/places/internal/zzbfj;

    .line 290
    .line 291
    invoke-static {v4}, Lcom/google/android/libraries/places/internal/zzbfj;->zza(Lcom/google/android/libraries/places/internal/zzbfj;)J

    .line 292
    .line 293
    .line 294
    move-result-wide v4

    .line 295
    long-to-double v4, v4

    .line 296
    sget-wide v6, Lcom/google/android/libraries/places/internal/zzbfq;->zzc:D

    .line 297
    .line 298
    div-double/2addr v4, v6

    .line 299
    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 300
    .line 301
    .line 302
    move-result-object v4

    .line 303
    if-nez v2, :cond_d

    .line 304
    .line 305
    const-wide/16 v5, 0x0

    .line 306
    .line 307
    goto :goto_6

    .line 308
    :cond_d
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 309
    .line 310
    .line 311
    move-result-wide v8

    .line 312
    long-to-double v8, v8

    .line 313
    div-double v5, v8, v6

    .line 314
    .line 315
    :goto_6
    invoke-static {v5, v6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 316
    .line 317
    .line 318
    move-result-object v2

    .line 319
    filled-new-array {v1, v4, v2}, [Ljava/lang/Object;

    .line 320
    .line 321
    .line 322
    move-result-object v1

    .line 323
    const-string v2, "ClientCall started after %s deadline was exceeded %.9f seconds ago. Name resolution delay %.9f seconds."

    .line 324
    .line 325
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 326
    .line 327
    .line 328
    move-result-object v1

    .line 329
    new-instance v2, Lcom/google/android/libraries/places/internal/zzbil;

    .line 330
    .line 331
    sget-object v4, Lcom/google/android/libraries/places/internal/zzbdo;->zze:Lcom/google/android/libraries/places/internal/zzbdo;

    .line 332
    .line 333
    invoke-virtual {v4, v1}, Lcom/google/android/libraries/places/internal/zzbdo;->zzg(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 334
    .line 335
    .line 336
    move-result-object v1

    .line 337
    sget-object v4, Lcom/google/android/libraries/places/internal/zzbfs;->zza:Lcom/google/android/libraries/places/internal/zzbfs;

    .line 338
    .line 339
    invoke-direct {v2, v1, v4, p2}, Lcom/google/android/libraries/places/internal/zzbil;-><init>(Lcom/google/android/libraries/places/internal/zzbdo;Lcom/google/android/libraries/places/internal/zzbfs;[Lcom/google/android/libraries/places/internal/zzayx;)V

    .line 340
    .line 341
    .line 342
    iput-object v2, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzm:Lcom/google/android/libraries/places/internal/zzbfr;

    .line 343
    .line 344
    goto :goto_7

    .line 345
    :cond_e
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzp:Lcom/google/android/libraries/places/internal/zzbfp;

    .line 346
    .line 347
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzd:Lcom/google/android/libraries/places/internal/zzbcl;

    .line 348
    .line 349
    iget-object v4, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzl:Lcom/google/android/libraries/places/internal/zzayj;

    .line 350
    .line 351
    iget-object v5, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzi:Lcom/google/android/libraries/places/internal/zzazj;

    .line 352
    .line 353
    invoke-interface {v1, v2, v4, p2, v5}, Lcom/google/android/libraries/places/internal/zzbfp;->zza(Lcom/google/android/libraries/places/internal/zzbcl;Lcom/google/android/libraries/places/internal/zzayj;Lcom/google/android/libraries/places/internal/zzbcf;Lcom/google/android/libraries/places/internal/zzazj;)Lcom/google/android/libraries/places/internal/zzbfr;

    .line 354
    .line 355
    .line 356
    move-result-object p2

    .line 357
    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzm:Lcom/google/android/libraries/places/internal/zzbfr;

    .line 358
    .line 359
    :goto_7
    iget-boolean p2, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzg:Z

    .line 360
    .line 361
    if-eqz p2, :cond_f

    .line 362
    .line 363
    iget-object p2, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzm:Lcom/google/android/libraries/places/internal/zzbfr;

    .line 364
    .line 365
    invoke-interface {p2}, Lcom/google/android/libraries/places/internal/zzbqp;->zzt()V

    .line 366
    .line 367
    .line 368
    :cond_f
    iget-object p2, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzl:Lcom/google/android/libraries/places/internal/zzayj;

    .line 369
    .line 370
    invoke-virtual {p2}, Lcom/google/android/libraries/places/internal/zzayj;->zzj()Ljava/lang/Integer;

    .line 371
    .line 372
    .line 373
    move-result-object p2

    .line 374
    if-eqz p2, :cond_10

    .line 375
    .line 376
    iget-object p2, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzm:Lcom/google/android/libraries/places/internal/zzbfr;

    .line 377
    .line 378
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzl:Lcom/google/android/libraries/places/internal/zzayj;

    .line 379
    .line 380
    invoke-virtual {v1}, Lcom/google/android/libraries/places/internal/zzayj;->zzj()Ljava/lang/Integer;

    .line 381
    .line 382
    .line 383
    move-result-object v1

    .line 384
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 385
    .line 386
    .line 387
    move-result v1

    .line 388
    invoke-interface {p2, v1}, Lcom/google/android/libraries/places/internal/zzbfr;->zzm(I)V

    .line 389
    .line 390
    .line 391
    :cond_10
    iget-object p2, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzl:Lcom/google/android/libraries/places/internal/zzayj;

    .line 392
    .line 393
    invoke-virtual {p2}, Lcom/google/android/libraries/places/internal/zzayj;->zzk()Ljava/lang/Integer;

    .line 394
    .line 395
    .line 396
    move-result-object p2

    .line 397
    if-eqz p2, :cond_11

    .line 398
    .line 399
    iget-object p2, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzm:Lcom/google/android/libraries/places/internal/zzbfr;

    .line 400
    .line 401
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzl:Lcom/google/android/libraries/places/internal/zzayj;

    .line 402
    .line 403
    invoke-virtual {v1}, Lcom/google/android/libraries/places/internal/zzayj;->zzk()Ljava/lang/Integer;

    .line 404
    .line 405
    .line 406
    move-result-object v1

    .line 407
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 408
    .line 409
    .line 410
    move-result v1

    .line 411
    invoke-interface {p2, v1}, Lcom/google/android/libraries/places/internal/zzbfr;->zzn(I)V

    .line 412
    .line 413
    .line 414
    :cond_11
    if-eqz v3, :cond_12

    .line 415
    .line 416
    iget-object p2, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzm:Lcom/google/android/libraries/places/internal/zzbfr;

    .line 417
    .line 418
    invoke-interface {p2, v3}, Lcom/google/android/libraries/places/internal/zzbfr;->zzk(Lcom/google/android/libraries/places/internal/zzazn;)V

    .line 419
    .line 420
    .line 421
    :cond_12
    iget-object p2, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzm:Lcom/google/android/libraries/places/internal/zzbfr;

    .line 422
    .line 423
    invoke-interface {p2, v0}, Lcom/google/android/libraries/places/internal/zzbqp;->zzv(Lcom/google/android/libraries/places/internal/zzazc;)V

    .line 424
    .line 425
    .line 426
    iget-object p2, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzm:Lcom/google/android/libraries/places/internal/zzbfr;

    .line 427
    .line 428
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzr:Lcom/google/android/libraries/places/internal/zzazq;

    .line 429
    .line 430
    invoke-interface {p2, v0}, Lcom/google/android/libraries/places/internal/zzbfr;->zzl(Lcom/google/android/libraries/places/internal/zzazq;)V

    .line 431
    .line 432
    .line 433
    iget-object p2, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzh:Lcom/google/android/libraries/places/internal/zzbfg;

    .line 434
    .line 435
    invoke-virtual {p2}, Lcom/google/android/libraries/places/internal/zzbfg;->zzb()V

    .line 436
    .line 437
    .line 438
    iget-object p2, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzm:Lcom/google/android/libraries/places/internal/zzbfr;

    .line 439
    .line 440
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbfo;

    .line 441
    .line 442
    invoke-direct {v0, p0, p1}, Lcom/google/android/libraries/places/internal/zzbfo;-><init>(Lcom/google/android/libraries/places/internal/zzbfq;Lcom/google/android/libraries/places/internal/zzayn;)V

    .line 443
    .line 444
    .line 445
    invoke-interface {p2, v0}, Lcom/google/android/libraries/places/internal/zzbfr;->zzo(Lcom/google/android/libraries/places/internal/zzbft;)V

    .line 446
    .line 447
    .line 448
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzj:Lcom/google/android/libraries/places/internal/zzbfj;

    .line 449
    .line 450
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbfj;->zzc()V

    .line 451
    .line 452
    .line 453
    return-void
.end method

.method public final zzm(Lcom/google/android/libraries/places/internal/zzazd;)Lcom/google/android/libraries/places/internal/zzbfq;
    .locals 0

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzs:Lcom/google/android/libraries/places/internal/zzazd;

    return-object p0
.end method

.method public final zzn(Lcom/google/android/libraries/places/internal/zzazq;)Lcom/google/android/libraries/places/internal/zzbfq;
    .locals 0

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbfq;->zzr:Lcom/google/android/libraries/places/internal/zzazq;

    return-object p0
.end method
