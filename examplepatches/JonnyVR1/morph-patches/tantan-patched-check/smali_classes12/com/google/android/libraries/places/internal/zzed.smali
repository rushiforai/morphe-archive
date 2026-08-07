.class public final Lcom/google/android/libraries/places/internal/zzed;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static zza(Lcom/google/android/libraries/places/internal/zzaka;)Lcom/google/android/gms/tasks/Task;
    .locals 3

    .line 1
    new-instance v0, Ll/ig4;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/ig4;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/sni0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/ig4;->b()Ll/gg4;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-direct {v1, v2}, Ll/sni0;-><init>(Ll/gg4;)V

    .line 13
    .line 14
    .line 15
    new-instance v2, Lcom/google/android/libraries/places/internal/zzec;

    .line 16
    .line 17
    invoke-direct {v2, v1, p0, v0}, Lcom/google/android/libraries/places/internal/zzec;-><init>(Ll/sni0;Lcom/google/android/libraries/places/internal/zzaka;Ll/ig4;)V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzakb;->zza()Ljava/util/concurrent/Executor;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {p0, v2, v0}, Lcom/google/android/libraries/places/internal/zzajx;->zza(Lcom/google/android/libraries/places/internal/zzaka;Lcom/google/android/libraries/places/internal/zzajv;Ljava/util/concurrent/Executor;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1}, Ll/sni0;->a()Lcom/google/android/gms/tasks/Task;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method
