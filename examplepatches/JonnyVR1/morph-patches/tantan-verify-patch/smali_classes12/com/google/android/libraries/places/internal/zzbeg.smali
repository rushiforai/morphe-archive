.class public abstract Lcom/google/android/libraries/places/internal/zzbeg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/libraries/places/internal/zzbnv;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public close()V
    .locals 0

    return-void
.end method

.method public final zza(I)V
    .locals 0

    .line 1
    invoke-interface {p0}, Lcom/google/android/libraries/places/internal/zzbnv;->zzf()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-lt p0, p1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {}, Ll/onl;->a()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public zzb()V
    .locals 0

    return-void
.end method

.method public zzc()V
    .locals 0

    .line 1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    .line 4
    .line 5
    .line 6
    throw p0
.end method

.method public zzd()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method
