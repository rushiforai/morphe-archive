.class public final Lcom/google/android/libraries/places/internal/zzazy;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private zza:Ljava/net/SocketAddress;

.field private zzb:Ljava/net/InetSocketAddress;

.field private zzc:Ljava/lang/String;

.field private zzd:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 2
    const/4 p0, 0x0

    throw p0
.end method

.method public synthetic constructor <init>(Lcom/google/android/libraries/places/internal/zzazx;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzazy;
    .locals 0

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzazy;->zzd:Ljava/lang/String;

    return-object p0
.end method

.method public final zzb(Ljava/net/SocketAddress;)Lcom/google/android/libraries/places/internal/zzazy;
    .locals 1

    .line 1
    const-string v0, "proxyAddress"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lcom/google/android/libraries/places/internal/zzmt;->zzc(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzazy;->zza:Ljava/net/SocketAddress;

    .line 7
    .line 8
    return-object p0
.end method

.method public final zzc(Ljava/net/InetSocketAddress;)Lcom/google/android/libraries/places/internal/zzazy;
    .locals 1

    .line 1
    const-string v0, "targetAddress"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lcom/google/android/libraries/places/internal/zzmt;->zzc(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzazy;->zzb:Ljava/net/InetSocketAddress;

    .line 7
    .line 8
    return-object p0
.end method

.method public final zzd(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzazy;
    .locals 0

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzazy;->zzc:Ljava/lang/String;

    return-object p0
.end method

.method public final zze()Lcom/google/android/libraries/places/internal/zzbaa;
    .locals 6

    .line 1
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbaa;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzazy;->zza:Ljava/net/SocketAddress;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzazy;->zzb:Ljava/net/InetSocketAddress;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzazy;->zzc:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v4, p0, Lcom/google/android/libraries/places/internal/zzazy;->zzd:Ljava/lang/String;

    .line 10
    .line 11
    const/4 v5, 0x0

    .line 12
    invoke-direct/range {v0 .. v5}, Lcom/google/android/libraries/places/internal/zzbaa;-><init>(Ljava/net/SocketAddress;Ljava/net/InetSocketAddress;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/libraries/places/internal/zzazz;)V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method
