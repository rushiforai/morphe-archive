.class final Lcom/google/android/libraries/places/internal/zzrf;
.super Lcom/google/android/libraries/places/internal/zzrc;
.source "SourceFile"


# static fields
.field private static final zza:Lcom/google/android/libraries/places/internal/zzrc;


# instance fields
.field private final zzb:Lcom/google/android/libraries/places/internal/zzrg;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/libraries/places/internal/zzrf;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzrf;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/google/android/libraries/places/internal/zzrf;->zza:Lcom/google/android/libraries/places/internal/zzrc;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzrc;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/google/android/libraries/places/internal/zzre;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-direct {v0, v1}, Lcom/google/android/libraries/places/internal/zzre;-><init>(Lcom/google/android/libraries/places/internal/zzrd;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzrf;->zzb:Lcom/google/android/libraries/places/internal/zzrg;

    .line 11
    .line 12
    return-void
.end method

.method public static final zzb()Lcom/google/android/libraries/places/internal/zzrc;
    .locals 1

    sget-object v0, Lcom/google/android/libraries/places/internal/zzrf;->zza:Lcom/google/android/libraries/places/internal/zzrc;

    return-object v0
.end method


# virtual methods
.method public final toString()Ljava/lang/String;
    .locals 0

    const-string p0, "No-op Provider"

    return-object p0
.end method
