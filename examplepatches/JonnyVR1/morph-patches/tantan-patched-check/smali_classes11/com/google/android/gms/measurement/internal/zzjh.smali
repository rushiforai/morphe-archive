.class public final enum Lcom/google/android/gms/measurement/internal/zzjh;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/android/gms/measurement/internal/zzjh;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum zza:Lcom/google/android/gms/measurement/internal/zzjh;

.field public static final enum zzb:Lcom/google/android/gms/measurement/internal/zzjh;

.field public static final enum zzc:Lcom/google/android/gms/measurement/internal/zzjh;

.field public static final enum zzd:Lcom/google/android/gms/measurement/internal/zzjh;

.field private static final synthetic zze:[Lcom/google/android/gms/measurement/internal/zzjh;


# instance fields
.field private final zzf:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 1
    new-instance v0, Lcom/google/android/gms/measurement/internal/zzjh;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "uninitialized"

    .line 5
    .line 6
    const-string v3, "UNINITIALIZED"

    .line 7
    .line 8
    invoke-direct {v0, v3, v1, v2}, Lcom/google/android/gms/measurement/internal/zzjh;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/google/android/gms/measurement/internal/zzjh;->zza:Lcom/google/android/gms/measurement/internal/zzjh;

    .line 12
    .line 13
    new-instance v1, Lcom/google/android/gms/measurement/internal/zzjh;

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    const-string v3, "eu_consent_policy"

    .line 17
    .line 18
    const-string v4, "POLICY"

    .line 19
    .line 20
    invoke-direct {v1, v4, v2, v3}, Lcom/google/android/gms/measurement/internal/zzjh;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sput-object v1, Lcom/google/android/gms/measurement/internal/zzjh;->zzb:Lcom/google/android/gms/measurement/internal/zzjh;

    .line 24
    .line 25
    new-instance v2, Lcom/google/android/gms/measurement/internal/zzjh;

    .line 26
    .line 27
    const/4 v3, 0x2

    .line 28
    const-string v4, "denied"

    .line 29
    .line 30
    const-string v5, "DENIED"

    .line 31
    .line 32
    invoke-direct {v2, v5, v3, v4}, Lcom/google/android/gms/measurement/internal/zzjh;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sput-object v2, Lcom/google/android/gms/measurement/internal/zzjh;->zzc:Lcom/google/android/gms/measurement/internal/zzjh;

    .line 36
    .line 37
    new-instance v3, Lcom/google/android/gms/measurement/internal/zzjh;

    .line 38
    .line 39
    const/4 v4, 0x3

    .line 40
    const-string v5, "granted"

    .line 41
    .line 42
    const-string v6, "GRANTED"

    .line 43
    .line 44
    invoke-direct {v3, v6, v4, v5}, Lcom/google/android/gms/measurement/internal/zzjh;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    sput-object v3, Lcom/google/android/gms/measurement/internal/zzjh;->zzd:Lcom/google/android/gms/measurement/internal/zzjh;

    .line 48
    .line 49
    filled-new-array {v0, v1, v2, v3}, [Lcom/google/android/gms/measurement/internal/zzjh;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    sput-object v0, Lcom/google/android/gms/measurement/internal/zzjh;->zze:[Lcom/google/android/gms/measurement/internal/zzjh;

    .line 54
    .line 55
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Lcom/google/android/gms/measurement/internal/zzjh;->zzf:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static values()[Lcom/google/android/gms/measurement/internal/zzjh;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/measurement/internal/zzjh;->zze:[Lcom/google/android/gms/measurement/internal/zzjh;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/google/android/gms/measurement/internal/zzjh;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/google/android/gms/measurement/internal/zzjh;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public final toString()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/zzjh;->zzf:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
