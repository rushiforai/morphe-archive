.class final Lcom/google/android/libraries/places/internal/zzbtg;
.super Lcom/google/android/libraries/places/internal/zzbtl;
.source "SourceFile"


# instance fields
.field private final zzb:Lcom/google/android/libraries/places/internal/zzbtf;

.field private final zzc:Lcom/google/android/libraries/places/internal/zzbtf;

.field private final zzd:Ljava/lang/reflect/Method;

.field private final zze:Ljava/lang/reflect/Method;

.field private final zzf:Lcom/google/android/libraries/places/internal/zzbtf;

.field private final zzg:Lcom/google/android/libraries/places/internal/zzbtf;

.field private final zzh:I


# direct methods
.method public constructor <init>(Lcom/google/android/libraries/places/internal/zzbtf;Lcom/google/android/libraries/places/internal/zzbtf;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Lcom/google/android/libraries/places/internal/zzbtf;Lcom/google/android/libraries/places/internal/zzbtf;Ljava/security/Provider;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p7}, Lcom/google/android/libraries/places/internal/zzbtl;-><init>(Ljava/security/Provider;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbtg;->zzb:Lcom/google/android/libraries/places/internal/zzbtf;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzbtg;->zzc:Lcom/google/android/libraries/places/internal/zzbtf;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/google/android/libraries/places/internal/zzbtg;->zzd:Ljava/lang/reflect/Method;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/google/android/libraries/places/internal/zzbtg;->zze:Ljava/lang/reflect/Method;

    .line 11
    .line 12
    iput-object p5, p0, Lcom/google/android/libraries/places/internal/zzbtg;->zzf:Lcom/google/android/libraries/places/internal/zzbtf;

    .line 13
    .line 14
    iput-object p6, p0, Lcom/google/android/libraries/places/internal/zzbtg;->zzg:Lcom/google/android/libraries/places/internal/zzbtf;

    .line 15
    .line 16
    iput p8, p0, Lcom/google/android/libraries/places/internal/zzbtg;->zzh:I

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final zza(Ljavax/net/ssl/SSLSocket;)Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbtg;->zzf:Lcom/google/android/libraries/places/internal/zzbtf;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/google/android/libraries/places/internal/zzbtf;->zzc(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbtg;->zzf:Lcom/google/android/libraries/places/internal/zzbtf;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    new-array v0, v0, [Ljava/lang/Object;

    .line 14
    .line 15
    invoke-virtual {p0, p1, v0}, Lcom/google/android/libraries/places/internal/zzbtf;->zzb(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, [B

    .line 20
    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    new-instance p1, Ljava/lang/String;

    .line 24
    .line 25
    sget-object v0, Lcom/google/android/libraries/places/internal/zzbto;->zzb:Ljava/nio/charset/Charset;

    .line 26
    .line 27
    invoke-direct {p1, p0, v0}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .line 28
    .line 29
    .line 30
    return-object p1

    .line 31
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 32
    return-object p0
.end method

.method public final zzb(Ljavax/net/ssl/SSLSocket;Ljava/lang/String;Ljava/util/List;)V
    .locals 2

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbtg;->zzb:Lcom/google/android/libraries/places/internal/zzbtf;

    .line 4
    .line 5
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 6
    .line 7
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, p1, v1}, Lcom/google/android/libraries/places/internal/zzbtf;->zza(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbtg;->zzc:Lcom/google/android/libraries/places/internal/zzbtf;

    .line 15
    .line 16
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    invoke-virtual {v0, p1, p2}, Lcom/google/android/libraries/places/internal/zzbtf;->zza(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object p2, p0, Lcom/google/android/libraries/places/internal/zzbtg;->zzg:Lcom/google/android/libraries/places/internal/zzbtf;

    .line 24
    .line 25
    invoke-virtual {p2, p1}, Lcom/google/android/libraries/places/internal/zzbtf;->zzc(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    if-eqz p2, :cond_1

    .line 30
    .line 31
    invoke-static {p3}, Lcom/google/android/libraries/places/internal/zzbtl;->zzg(Ljava/util/List;)[B

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbtg;->zzg:Lcom/google/android/libraries/places/internal/zzbtf;

    .line 40
    .line 41
    invoke-virtual {p0, p1, p2}, Lcom/google/android/libraries/places/internal/zzbtf;->zzb(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    :cond_1
    return-void
.end method

.method public final zzc()I
    .locals 0

    iget p0, p0, Lcom/google/android/libraries/places/internal/zzbtg;->zzh:I

    return p0
.end method
