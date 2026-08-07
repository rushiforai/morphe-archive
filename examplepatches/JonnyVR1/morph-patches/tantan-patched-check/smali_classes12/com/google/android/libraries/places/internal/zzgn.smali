.class public final synthetic Lcom/google/android/libraries/places/internal/zzgn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/yo50;


# instance fields
.field public final synthetic zza:Lcom/google/android/libraries/places/internal/zzaka;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/libraries/places/internal/zzaka;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzgn;->zza:Lcom/google/android/libraries/places/internal/zzaka;

    return-void
.end method


# virtual methods
.method public final onCanceled()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzgn;->zza:Lcom/google/android/libraries/places/internal/zzaka;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-interface {p0, v0}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 5
    .line 6
    .line 7
    return-void
.end method
