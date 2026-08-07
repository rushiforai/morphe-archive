.class public final enum Lcom/google/android/gms/internal/ads/zzeih;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum zza:Lcom/google/android/gms/internal/ads/zzeih;

.field public static final enum zzb:Lcom/google/android/gms/internal/ads/zzeih;

.field public static final enum zzc:Lcom/google/android/gms/internal/ads/zzeih;

.field private static final synthetic zzd:[Lcom/google/android/gms/internal/ads/zzeih;


# instance fields
.field private final zze:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/ads/zzeih;

    .line 2
    .line 3
    const-string v1, "HTML_DISPLAY"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const-string v3, "htmlDisplay"

    .line 7
    .line 8
    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/gms/internal/ads/zzeih;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/google/android/gms/internal/ads/zzeih;->zza:Lcom/google/android/gms/internal/ads/zzeih;

    .line 12
    .line 13
    new-instance v1, Lcom/google/android/gms/internal/ads/zzeih;

    .line 14
    .line 15
    const-string v2, "NATIVE_DISPLAY"

    .line 16
    .line 17
    const/4 v3, 0x1

    .line 18
    const-string v4, "nativeDisplay"

    .line 19
    .line 20
    invoke-direct {v1, v2, v3, v4}, Lcom/google/android/gms/internal/ads/zzeih;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sput-object v1, Lcom/google/android/gms/internal/ads/zzeih;->zzb:Lcom/google/android/gms/internal/ads/zzeih;

    .line 24
    .line 25
    new-instance v2, Lcom/google/android/gms/internal/ads/zzeih;

    .line 26
    .line 27
    const-string v3, "VIDEO"

    .line 28
    .line 29
    const/4 v4, 0x2

    .line 30
    const-string v5, "video"

    .line 31
    .line 32
    invoke-direct {v2, v3, v4, v5}, Lcom/google/android/gms/internal/ads/zzeih;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sput-object v2, Lcom/google/android/gms/internal/ads/zzeih;->zzc:Lcom/google/android/gms/internal/ads/zzeih;

    .line 36
    .line 37
    filled-new-array {v0, v1, v2}, [Lcom/google/android/gms/internal/ads/zzeih;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    sput-object v0, Lcom/google/android/gms/internal/ads/zzeih;->zzd:[Lcom/google/android/gms/internal/ads/zzeih;

    .line 42
    .line 43
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Lcom/google/android/gms/internal/ads/zzeih;->zze:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static values()[Lcom/google/android/gms/internal/ads/zzeih;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/ads/zzeih;->zzd:[Lcom/google/android/gms/internal/ads/zzeih;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/google/android/gms/internal/ads/zzeih;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/google/android/gms/internal/ads/zzeih;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public final toString()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/ads/zzeih;->zze:Ljava/lang/String;

    return-object p0
.end method
