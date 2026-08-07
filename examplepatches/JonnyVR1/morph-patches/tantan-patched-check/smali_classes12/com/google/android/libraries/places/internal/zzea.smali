.class public final Lcom/google/android/libraries/places/internal/zzea;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field static zza:Lcom/google/android/libraries/places/internal/zzea;


# instance fields
.field private final zzb:Lcom/google/android/libraries/places/internal/zzeb;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>(Lcom/google/android/libraries/places/internal/zzeb;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzea;->zzb:Lcom/google/android/libraries/places/internal/zzeb;

    return-void
.end method

.method public static zza()Lcom/google/android/libraries/places/internal/zzea;
    .locals 2

    new-instance v0, Lcom/google/android/libraries/places/internal/zzea;

    new-instance v1, Lcom/google/android/libraries/places/internal/zzdz;

    invoke-direct {v1}, Lcom/google/android/libraries/places/internal/zzdz;-><init>()V

    invoke-direct {v0, v1}, Lcom/google/android/libraries/places/internal/zzea;-><init>(Lcom/google/android/libraries/places/internal/zzeb;)V

    sput-object v0, Lcom/google/android/libraries/places/internal/zzea;->zza:Lcom/google/android/libraries/places/internal/zzea;

    return-object v0
.end method
