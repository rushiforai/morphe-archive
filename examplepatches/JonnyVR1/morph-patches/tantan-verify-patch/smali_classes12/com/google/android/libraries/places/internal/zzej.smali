.class public final Lcom/google/android/libraries/places/internal/zzej;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final zza:Lcom/google/android/libraries/places/internal/zzdv;

.field private static final zzb:Lcom/google/android/libraries/places/internal/zzej;


# instance fields
.field private final zzc:Lcom/google/android/libraries/places/internal/zzeh;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/libraries/places/internal/zzdy;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzdy;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/google/android/libraries/places/internal/zzej;->zza:Lcom/google/android/libraries/places/internal/zzdv;

    .line 7
    .line 8
    new-instance v0, Lcom/google/android/libraries/places/internal/zzej;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzej;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/google/android/libraries/places/internal/zzej;->zzb:Lcom/google/android/libraries/places/internal/zzej;

    .line 14
    .line 15
    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/google/android/libraries/places/internal/zzeh;

    .line 5
    .line 6
    sget-object v1, Lcom/google/android/libraries/places/internal/zzej;->zza:Lcom/google/android/libraries/places/internal/zzdv;

    .line 7
    .line 8
    invoke-direct {v0, v1}, Lcom/google/android/libraries/places/internal/zzeh;-><init>(Lcom/google/android/libraries/places/internal/zzdv;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzej;->zzc:Lcom/google/android/libraries/places/internal/zzeh;

    .line 12
    .line 13
    return-void
.end method

.method public static zza()Lcom/google/android/libraries/places/internal/zzej;
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/libraries/places/internal/zzej;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzej;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method
