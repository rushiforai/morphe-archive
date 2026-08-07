.class public final Lcom/google/android/libraries/places/internal/zzbrv;
.super Lcom/google/android/libraries/places/internal/zzazt;
.source "SourceFile"


# static fields
.field static final zza:Lcom/google/android/libraries/places/internal/zzbsz;

.field static final zzb:Lcom/google/android/libraries/places/internal/zzbqn;

.field private static final zzc:Ljava/util/logging/Logger;

.field private static final zzd:Lcom/google/android/libraries/places/internal/zzbql;

.field private static final zze:Ljava/util/EnumSet;


# instance fields
.field private final zzf:Lcom/google/android/libraries/places/internal/zzbmd;

.field private final zzg:Lcom/google/android/libraries/places/internal/zzbqw;

.field private zzh:Ljavax/net/ssl/SSLSocketFactory;

.field private final zzi:Lcom/google/android/libraries/places/internal/zzbsz;

.field private final zzj:J

.field private zzk:I

.field private final zzl:Lcom/google/android/libraries/places/internal/zzbqn;

.field private final zzm:Lcom/google/android/libraries/places/internal/zzbqn;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 1
    const-class v0, Lcom/google/android/libraries/places/internal/zzbrv;

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
    sput-object v0, Lcom/google/android/libraries/places/internal/zzbrv;->zzc:Ljava/util/logging/Logger;

    .line 12
    .line 13
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbsx;

    .line 14
    .line 15
    sget-object v1, Lcom/google/android/libraries/places/internal/zzbsz;->zza:Lcom/google/android/libraries/places/internal/zzbsz;

    .line 16
    .line 17
    invoke-direct {v0, v1}, Lcom/google/android/libraries/places/internal/zzbsx;-><init>(Lcom/google/android/libraries/places/internal/zzbsz;)V

    .line 18
    .line 19
    .line 20
    sget-object v2, Lcom/google/android/libraries/places/internal/zzbsw;->zzaK:Lcom/google/android/libraries/places/internal/zzbsw;

    .line 21
    .line 22
    sget-object v3, Lcom/google/android/libraries/places/internal/zzbsw;->zzaO:Lcom/google/android/libraries/places/internal/zzbsw;

    .line 23
    .line 24
    sget-object v4, Lcom/google/android/libraries/places/internal/zzbsw;->zzaL:Lcom/google/android/libraries/places/internal/zzbsw;

    .line 25
    .line 26
    sget-object v5, Lcom/google/android/libraries/places/internal/zzbsw;->zzaP:Lcom/google/android/libraries/places/internal/zzbsw;

    .line 27
    .line 28
    sget-object v6, Lcom/google/android/libraries/places/internal/zzbsw;->zzaT:Lcom/google/android/libraries/places/internal/zzbsw;

    .line 29
    .line 30
    sget-object v7, Lcom/google/android/libraries/places/internal/zzbsw;->zzaS:Lcom/google/android/libraries/places/internal/zzbsw;

    .line 31
    .line 32
    filled-new-array/range {v2 .. v7}, [Lcom/google/android/libraries/places/internal/zzbsw;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v0, v1}, Lcom/google/android/libraries/places/internal/zzbsx;->zza([Lcom/google/android/libraries/places/internal/zzbsw;)Lcom/google/android/libraries/places/internal/zzbsx;

    .line 37
    .line 38
    .line 39
    sget-object v1, Lcom/google/android/libraries/places/internal/zzbtn;->zzb:Lcom/google/android/libraries/places/internal/zzbtn;

    .line 40
    .line 41
    filled-new-array {v1}, [Lcom/google/android/libraries/places/internal/zzbtn;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v0, v1}, Lcom/google/android/libraries/places/internal/zzbsx;->zzd([Lcom/google/android/libraries/places/internal/zzbtn;)Lcom/google/android/libraries/places/internal/zzbsx;

    .line 46
    .line 47
    .line 48
    const/4 v1, 0x1

    .line 49
    invoke-virtual {v0, v1}, Lcom/google/android/libraries/places/internal/zzbsx;->zzc(Z)Lcom/google/android/libraries/places/internal/zzbsx;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbsx;->zzf()Lcom/google/android/libraries/places/internal/zzbsz;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    sput-object v0, Lcom/google/android/libraries/places/internal/zzbrv;->zza:Lcom/google/android/libraries/places/internal/zzbsz;

    .line 57
    .line 58
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbrn;

    .line 59
    .line 60
    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzbrn;-><init>()V

    .line 61
    .line 62
    .line 63
    sput-object v0, Lcom/google/android/libraries/places/internal/zzbrv;->zzd:Lcom/google/android/libraries/places/internal/zzbql;

    .line 64
    .line 65
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbqn;->zza(Lcom/google/android/libraries/places/internal/zzbql;)Lcom/google/android/libraries/places/internal/zzbqn;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    sput-object v0, Lcom/google/android/libraries/places/internal/zzbrv;->zzb:Lcom/google/android/libraries/places/internal/zzbqn;

    .line 70
    .line 71
    sget-object v0, Lcom/google/android/libraries/places/internal/zzbdy;->zzb:Lcom/google/android/libraries/places/internal/zzbdy;

    .line 72
    .line 73
    sget-object v1, Lcom/google/android/libraries/places/internal/zzbdy;->zzc:Lcom/google/android/libraries/places/internal/zzbdy;

    .line 74
    .line 75
    invoke-static {v0, v1}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;Ljava/lang/Enum;)Ljava/util/EnumSet;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    sput-object v0, Lcom/google/android/libraries/places/internal/zzbrv;->zze:Ljava/util/EnumSet;

    .line 80
    .line 81
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;)V
    .locals 8

    .line 1
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzazt;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzbqz;->zza()Lcom/google/android/libraries/places/internal/zzbqw;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbrv;->zzg:Lcom/google/android/libraries/places/internal/zzbqw;

    .line 9
    .line 10
    sget-object v0, Lcom/google/android/libraries/places/internal/zzbrv;->zzb:Lcom/google/android/libraries/places/internal/zzbqn;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbrv;->zzl:Lcom/google/android/libraries/places/internal/zzbqn;

    .line 13
    .line 14
    sget-object v0, Lcom/google/android/libraries/places/internal/zzbjd;->zzq:Lcom/google/android/libraries/places/internal/zzbql;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbqn;->zza(Lcom/google/android/libraries/places/internal/zzbql;)Lcom/google/android/libraries/places/internal/zzbqn;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbrv;->zzm:Lcom/google/android/libraries/places/internal/zzbqn;

    .line 21
    .line 22
    sget-object v0, Lcom/google/android/libraries/places/internal/zzbrv;->zza:Lcom/google/android/libraries/places/internal/zzbsz;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbrv;->zzi:Lcom/google/android/libraries/places/internal/zzbsz;

    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    iput v0, p0, Lcom/google/android/libraries/places/internal/zzbrv;->zzk:I

    .line 28
    .line 29
    sget-wide v0, Lcom/google/android/libraries/places/internal/zzbjd;->zzl:J

    .line 30
    .line 31
    iput-wide v0, p0, Lcom/google/android/libraries/places/internal/zzbrv;->zzj:J

    .line 32
    .line 33
    new-instance v2, Lcom/google/android/libraries/places/internal/zzbmd;

    .line 34
    .line 35
    new-instance v6, Lcom/google/android/libraries/places/internal/zzbrr;

    .line 36
    .line 37
    const/4 v0, 0x0

    .line 38
    invoke-direct {v6, p0, v0}, Lcom/google/android/libraries/places/internal/zzbrr;-><init>(Lcom/google/android/libraries/places/internal/zzbrv;Lcom/google/android/libraries/places/internal/zzbrq;)V

    .line 39
    .line 40
    .line 41
    new-instance v7, Lcom/google/android/libraries/places/internal/zzbrp;

    .line 42
    .line 43
    invoke-direct {v7, p0, v0}, Lcom/google/android/libraries/places/internal/zzbrp;-><init>(Lcom/google/android/libraries/places/internal/zzbrv;Lcom/google/android/libraries/places/internal/zzbro;)V

    .line 44
    .line 45
    .line 46
    const/4 v4, 0x0

    .line 47
    const/4 v5, 0x0

    .line 48
    move-object v3, p1

    .line 49
    invoke-direct/range {v2 .. v7}, Lcom/google/android/libraries/places/internal/zzbmd;-><init>(Ljava/lang/String;Lcom/google/android/libraries/places/internal/zzayl;Lcom/google/android/libraries/places/internal/zzayf;Lcom/google/android/libraries/places/internal/zzbmc;Lcom/google/android/libraries/places/internal/zzbmb;)V

    .line 50
    .line 51
    .line 52
    iput-object v2, p0, Lcom/google/android/libraries/places/internal/zzbrv;->zzf:Lcom/google/android/libraries/places/internal/zzbmd;

    .line 53
    .line 54
    return-void
.end method

.method public static zze(Ljava/lang/String;I)Lcom/google/android/libraries/places/internal/zzbrv;
    .locals 1

    .line 1
    new-instance p0, Lcom/google/android/libraries/places/internal/zzbrv;

    .line 2
    .line 3
    const/16 p1, 0x1bb

    .line 4
    .line 5
    const-string v0, "places.googleapis.com"

    .line 6
    .line 7
    invoke-static {v0, p1}, Lcom/google/android/libraries/places/internal/zzbjd;->zzd(Ljava/lang/String;I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-direct {p0, p1}, Lcom/google/android/libraries/places/internal/zzbrv;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-object p0
.end method


# virtual methods
.method public final zzb()Lcom/google/android/libraries/places/internal/zzbbs;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbrv;->zzf:Lcom/google/android/libraries/places/internal/zzbmd;

    return-object p0
.end method

.method public final zzc()I
    .locals 1

    .line 1
    iget p0, p0, Lcom/google/android/libraries/places/internal/zzbrv;->zzk:I

    .line 2
    .line 3
    add-int/lit8 v0, p0, -0x1

    .line 4
    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/16 p0, 0x1bb

    .line 10
    .line 11
    return p0

    .line 12
    :cond_0
    const-string p0, "TLS not handled"

    .line 13
    .line 14
    invoke-static {p0}, Ll/gig0;->a(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    return p0

    .line 19
    :cond_1
    const/4 p0, 0x0

    .line 20
    throw p0
.end method

.method public final zzd()Lcom/google/android/libraries/places/internal/zzbru;
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-wide v11, v0, Lcom/google/android/libraries/places/internal/zzbrv;->zzj:J

    .line 4
    .line 5
    iget-object v6, v0, Lcom/google/android/libraries/places/internal/zzbrv;->zzi:Lcom/google/android/libraries/places/internal/zzbsz;

    .line 6
    .line 7
    new-instance v1, Lcom/google/android/libraries/places/internal/zzbru;

    .line 8
    .line 9
    iget-object v2, v0, Lcom/google/android/libraries/places/internal/zzbrv;->zzg:Lcom/google/android/libraries/places/internal/zzbqw;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbrv;->zzg()Ljavax/net/ssl/SSLSocketFactory;

    .line 12
    .line 13
    .line 14
    move-result-object v4

    .line 15
    move-object v3, v1

    .line 16
    iget-object v1, v0, Lcom/google/android/libraries/places/internal/zzbrv;->zzl:Lcom/google/android/libraries/places/internal/zzbqn;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/google/android/libraries/places/internal/zzbrv;->zzm:Lcom/google/android/libraries/places/internal/zzbqn;

    .line 19
    .line 20
    const/16 v17, 0x0

    .line 21
    .line 22
    const/16 v18, 0x0

    .line 23
    .line 24
    move-object/from16 v16, v2

    .line 25
    .line 26
    move-object v2, v0

    .line 27
    move-object v0, v3

    .line 28
    const/4 v3, 0x0

    .line 29
    const/4 v5, 0x0

    .line 30
    const/high16 v7, 0x400000

    .line 31
    .line 32
    const/4 v8, 0x0

    .line 33
    const-wide v9, 0x7fffffffffffffffL

    .line 34
    .line 35
    .line 36
    .line 37
    .line 38
    const v13, 0xffff

    .line 39
    .line 40
    .line 41
    const/4 v14, 0x0

    .line 42
    const v15, 0x7fffffff

    .line 43
    .line 44
    .line 45
    invoke-direct/range {v0 .. v18}, Lcom/google/android/libraries/places/internal/zzbru;-><init>(Lcom/google/android/libraries/places/internal/zzbqn;Lcom/google/android/libraries/places/internal/zzbqn;Ljavax/net/SocketFactory;Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/HostnameVerifier;Lcom/google/android/libraries/places/internal/zzbsz;IZJJIZILcom/google/android/libraries/places/internal/zzbqw;ZLcom/google/android/libraries/places/internal/zzbrt;)V

    .line 46
    .line 47
    .line 48
    return-object v0
.end method

.method public final zzf()Lcom/google/android/libraries/places/internal/zzbrv;
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Lcom/google/android/libraries/places/internal/zzbrv;->zzk:I

    return-object p0
.end method

.method public final zzg()Ljavax/net/ssl/SSLSocketFactory;
    .locals 2

    .line 1
    iget v0, p0, Lcom/google/android/libraries/places/internal/zzbrv;->zzk:I

    .line 2
    .line 3
    add-int/lit8 v1, v0, -0x1

    .line 4
    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    if-nez v1, :cond_1

    .line 8
    .line 9
    :try_start_0
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbrv;->zzh:Ljavax/net/ssl/SSLSocketFactory;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const-string v0, "Default"

    .line 14
    .line 15
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzbtl;->zze()Lcom/google/android/libraries/places/internal/zzbtl;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Lcom/google/android/libraries/places/internal/zzbtl;->zzf()Ljava/security/Provider;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-static {v0, v1}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;Ljava/security/Provider;)Ljavax/net/ssl/SSLContext;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbrv;->zzh:Ljavax/net/ssl/SSLSocketFactory;

    .line 32
    .line 33
    :cond_0
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbrv;->zzh:Ljavax/net/ssl/SSLSocketFactory;
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    .line 35
    return-object p0

    .line 36
    :catch_0
    move-exception p0

    .line 37
    const-string v0, "TLS Provider failure"

    .line 38
    .line 39
    invoke-static {v0, p0}, Ll/vtq0;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 40
    .line 41
    .line 42
    :goto_0
    const/4 p0, 0x0

    .line 43
    return-object p0

    .line 44
    :cond_1
    const-string p0, "Unknown negotiation type: TLS"

    .line 45
    .line 46
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    const/4 p0, 0x0

    .line 51
    throw p0
.end method
