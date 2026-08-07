.class final Lcom/google/android/libraries/places/internal/zzavp;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final zza:Lcom/google/android/libraries/places/internal/zzavp;


# instance fields
.field private final zzb:Lcom/google/android/libraries/places/internal/zzavu;

.field private final zzc:Ljava/util/concurrent/ConcurrentMap;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/libraries/places/internal/zzavp;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzavp;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/google/android/libraries/places/internal/zzavp;->zza:Lcom/google/android/libraries/places/internal/zzavp;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzavp;->zzc:Ljava/util/concurrent/ConcurrentMap;

    .line 10
    .line 11
    new-instance v0, Lcom/google/android/libraries/places/internal/zzaux;

    .line 12
    .line 13
    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzaux;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzavp;->zzb:Lcom/google/android/libraries/places/internal/zzavu;

    .line 17
    .line 18
    return-void
.end method

.method public static zza()Lcom/google/android/libraries/places/internal/zzavp;
    .locals 1

    sget-object v0, Lcom/google/android/libraries/places/internal/zzavp;->zza:Lcom/google/android/libraries/places/internal/zzavp;

    return-object v0
.end method


# virtual methods
.method public final zzb(Ljava/lang/Class;)Lcom/google/android/libraries/places/internal/zzavt;
    .locals 2

    .line 1
    const-string v0, "messageType"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lcom/google/android/libraries/places/internal/zzaud;->zzc(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzavp;->zzc:Ljava/util/concurrent/ConcurrentMap;

    .line 7
    .line 8
    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, Lcom/google/android/libraries/places/internal/zzavt;

    .line 13
    .line 14
    if-nez v1, :cond_1

    .line 15
    .line 16
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzavp;->zzb:Lcom/google/android/libraries/places/internal/zzavu;

    .line 17
    .line 18
    invoke-interface {v1, p1}, Lcom/google/android/libraries/places/internal/zzavu;->zza(Ljava/lang/Class;)Lcom/google/android/libraries/places/internal/zzavt;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-static {p1, v0}, Lcom/google/android/libraries/places/internal/zzaud;->zzc(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzavp;->zzc:Ljava/util/concurrent/ConcurrentMap;

    .line 26
    .line 27
    invoke-interface {p0, p1, v1}, Ljava/util/concurrent/ConcurrentMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Lcom/google/android/libraries/places/internal/zzavt;

    .line 32
    .line 33
    if-nez p0, :cond_0

    .line 34
    .line 35
    return-object v1

    .line 36
    :cond_0
    return-object p0

    .line 37
    :cond_1
    return-object v1
.end method
