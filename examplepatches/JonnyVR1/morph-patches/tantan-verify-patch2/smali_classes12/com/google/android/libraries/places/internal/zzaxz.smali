.class public final Lcom/google/android/libraries/places/internal/zzaxz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/libraries/places/internal/zzaxy;


# static fields
.field private static final zza:Ljava/lang/Object;


# instance fields
.field private volatile zzb:Lcom/google/android/libraries/places/internal/zzaxy;

.field private volatile zzc:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/google/android/libraries/places/internal/zzaxz;->zza:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>(Lcom/google/android/libraries/places/internal/zzaxy;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lcom/google/android/libraries/places/internal/zzaxz;->zza:Ljava/lang/Object;

    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzaxz;->zzc:Ljava/lang/Object;

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzaxz;->zzb:Lcom/google/android/libraries/places/internal/zzaxy;

    return-void
.end method

.method public static zza(Lcom/google/android/libraries/places/internal/zzaxy;)Lcom/google/android/libraries/places/internal/zzaxy;
    .locals 1

    new-instance v0, Lcom/google/android/libraries/places/internal/zzaxz;

    invoke-direct {v0, p0}, Lcom/google/android/libraries/places/internal/zzaxz;-><init>(Lcom/google/android/libraries/places/internal/zzaxy;)V

    return-object v0
.end method


# virtual methods
.method public final zzb()Ljava/lang/Object;
    .locals 2

    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzaxz;->zzc:Ljava/lang/Object;

    sget-object v1, Lcom/google/android/libraries/places/internal/zzaxz;->zza:Ljava/lang/Object;

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzaxz;->zzb:Lcom/google/android/libraries/places/internal/zzaxy;

    if-nez v0, :cond_0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzaxz;->zzc:Ljava/lang/Object;

    return-object p0

    :cond_0
    new-instance v0, Lcom/google/android/libraries/places/internal/zzdy;

    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzdy;-><init>()V

    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzaxz;->zzc:Ljava/lang/Object;

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/google/android/libraries/places/internal/zzaxz;->zzb:Lcom/google/android/libraries/places/internal/zzaxy;

    :cond_1
    return-object v0
.end method
