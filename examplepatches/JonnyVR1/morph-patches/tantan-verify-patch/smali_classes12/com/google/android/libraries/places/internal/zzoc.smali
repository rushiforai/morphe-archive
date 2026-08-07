.class final Lcom/google/android/libraries/places/internal/zzoc;
.super Lcom/google/android/libraries/places/internal/zzox;
.source "SourceFile"


# instance fields
.field private zza:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzox;-><init>()V

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzoc;->zza:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final hasNext()Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzoc;->zza:Ljava/lang/Object;

    if-eq v0, p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public final next()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzoc;->zza:Ljava/lang/Object;

    .line 2
    .line 3
    iput-object p0, p0, Lcom/google/android/libraries/places/internal/zzoc;->zza:Ljava/lang/Object;

    .line 4
    .line 5
    if-eq v0, p0, :cond_0

    .line 6
    .line 7
    return-object v0

    .line 8
    :cond_0
    invoke-static {}, Ll/mor;->a()V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method
