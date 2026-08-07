.class final Lcom/google/android/libraries/places/internal/zzec;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/libraries/places/internal/zzajv;


# instance fields
.field final synthetic zza:Ll/sni0;

.field final synthetic zzb:Lcom/google/android/libraries/places/internal/zzaka;

.field final synthetic zzc:Ll/ig4;


# direct methods
.method public constructor <init>(Ll/sni0;Lcom/google/android/libraries/places/internal/zzaka;Ll/ig4;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzec;->zza:Ll/sni0;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzec;->zzb:Lcom/google/android/libraries/places/internal/zzaka;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/google/android/libraries/places/internal/zzec;->zzc:Ll/ig4;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzec;->zzb:Lcom/google/android/libraries/places/internal/zzaka;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/concurrent/Future;->isCancelled()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzec;->zzc:Ll/ig4;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/ig4;->a()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    instance-of v0, p1, Ljava/lang/Exception;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzec;->zza:Ll/sni0;

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    check-cast p1, Ljava/lang/Exception;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ll/sni0;->b(Ljava/lang/Exception;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    new-instance v0, Ljava/util/concurrent/ExecutionException;

    .line 28
    .line 29
    invoke-direct {v0, p1}, Ljava/util/concurrent/ExecutionException;-><init>(Ljava/lang/Throwable;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, v0}, Ll/sni0;->b(Ljava/lang/Exception;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final zzb(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzec;->zza:Ll/sni0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/sni0;->c(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
