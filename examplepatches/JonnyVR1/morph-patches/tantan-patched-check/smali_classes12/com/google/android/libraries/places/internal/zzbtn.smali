.class public final enum Lcom/google/android/libraries/places/internal/zzbtn;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum zza:Lcom/google/android/libraries/places/internal/zzbtn;

.field public static final enum zzb:Lcom/google/android/libraries/places/internal/zzbtn;

.field public static final enum zzc:Lcom/google/android/libraries/places/internal/zzbtn;

.field public static final enum zzd:Lcom/google/android/libraries/places/internal/zzbtn;

.field public static final enum zze:Lcom/google/android/libraries/places/internal/zzbtn;

.field private static final synthetic zzg:[Lcom/google/android/libraries/places/internal/zzbtn;


# instance fields
.field final zzf:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 1
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbtn;

    .line 2
    .line 3
    const-string v1, "TLS_1_3"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const-string v3, "TLSv1.3"

    .line 7
    .line 8
    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/libraries/places/internal/zzbtn;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/google/android/libraries/places/internal/zzbtn;->zza:Lcom/google/android/libraries/places/internal/zzbtn;

    .line 12
    .line 13
    new-instance v1, Lcom/google/android/libraries/places/internal/zzbtn;

    .line 14
    .line 15
    const-string v2, "TLS_1_2"

    .line 16
    .line 17
    const/4 v3, 0x1

    .line 18
    const-string v4, "TLSv1.2"

    .line 19
    .line 20
    invoke-direct {v1, v2, v3, v4}, Lcom/google/android/libraries/places/internal/zzbtn;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sput-object v1, Lcom/google/android/libraries/places/internal/zzbtn;->zzb:Lcom/google/android/libraries/places/internal/zzbtn;

    .line 24
    .line 25
    new-instance v2, Lcom/google/android/libraries/places/internal/zzbtn;

    .line 26
    .line 27
    const-string v3, "TLS_1_1"

    .line 28
    .line 29
    const/4 v4, 0x2

    .line 30
    const-string v5, "TLSv1.1"

    .line 31
    .line 32
    invoke-direct {v2, v3, v4, v5}, Lcom/google/android/libraries/places/internal/zzbtn;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sput-object v2, Lcom/google/android/libraries/places/internal/zzbtn;->zzc:Lcom/google/android/libraries/places/internal/zzbtn;

    .line 36
    .line 37
    new-instance v3, Lcom/google/android/libraries/places/internal/zzbtn;

    .line 38
    .line 39
    const-string v4, "TLS_1_0"

    .line 40
    .line 41
    const/4 v5, 0x3

    .line 42
    const-string v6, "TLSv1"

    .line 43
    .line 44
    invoke-direct {v3, v4, v5, v6}, Lcom/google/android/libraries/places/internal/zzbtn;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    sput-object v3, Lcom/google/android/libraries/places/internal/zzbtn;->zzd:Lcom/google/android/libraries/places/internal/zzbtn;

    .line 48
    .line 49
    new-instance v4, Lcom/google/android/libraries/places/internal/zzbtn;

    .line 50
    .line 51
    const-string v5, "SSL_3_0"

    .line 52
    .line 53
    const/4 v6, 0x4

    .line 54
    const-string v7, "SSLv3"

    .line 55
    .line 56
    invoke-direct {v4, v5, v6, v7}, Lcom/google/android/libraries/places/internal/zzbtn;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 57
    .line 58
    .line 59
    sput-object v4, Lcom/google/android/libraries/places/internal/zzbtn;->zze:Lcom/google/android/libraries/places/internal/zzbtn;

    .line 60
    .line 61
    filled-new-array {v0, v1, v2, v3, v4}, [Lcom/google/android/libraries/places/internal/zzbtn;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    sput-object v0, Lcom/google/android/libraries/places/internal/zzbtn;->zzg:[Lcom/google/android/libraries/places/internal/zzbtn;

    .line 66
    .line 67
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Lcom/google/android/libraries/places/internal/zzbtn;->zzf:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static values()[Lcom/google/android/libraries/places/internal/zzbtn;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/libraries/places/internal/zzbtn;->zzg:[Lcom/google/android/libraries/places/internal/zzbtn;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/google/android/libraries/places/internal/zzbtn;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/google/android/libraries/places/internal/zzbtn;

    .line 8
    .line 9
    return-object v0
.end method
