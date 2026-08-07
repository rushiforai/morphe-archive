.class public final Lcom/google/android/libraries/places/internal/zzbwh;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static final zza(Lcom/google/android/libraries/places/internal/zzbwq;)Lcom/google/android/libraries/places/internal/zzbwc;
    .locals 1
    .param p0    # Lcom/google/android/libraries/places/internal/zzbwq;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbwk;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lcom/google/android/libraries/places/internal/zzbwk;-><init>(Lcom/google/android/libraries/places/internal/zzbwq;)V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method

.method public static final zzb(Lcom/google/android/libraries/places/internal/zzbws;)Lcom/google/android/libraries/places/internal/zzbwd;
    .locals 1
    .param p0    # Lcom/google/android/libraries/places/internal/zzbws;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbwl;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lcom/google/android/libraries/places/internal/zzbwl;-><init>(Lcom/google/android/libraries/places/internal/zzbws;)V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method

.method public static final zzc(Ljava/net/Socket;)Lcom/google/android/libraries/places/internal/zzbwq;
    .locals 2
    .param p0    # Ljava/net/Socket;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget v0, Lcom/google/android/libraries/places/internal/zzbwi;->zza:I

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbwr;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Lcom/google/android/libraries/places/internal/zzbwr;-><init>(Ljava/net/Socket;)V

    .line 9
    .line 10
    .line 11
    new-instance v1, Lcom/google/android/libraries/places/internal/zzbwj;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 18
    .line 19
    .line 20
    invoke-direct {v1, p0, v0}, Lcom/google/android/libraries/places/internal/zzbwj;-><init>(Ljava/io/OutputStream;Lcom/google/android/libraries/places/internal/zzbwv;)V

    .line 21
    .line 22
    .line 23
    new-instance p0, Lcom/google/android/libraries/places/internal/zzbvx;

    .line 24
    .line 25
    invoke-direct {p0, v0, v1}, Lcom/google/android/libraries/places/internal/zzbvx;-><init>(Lcom/google/android/libraries/places/internal/zzbvz;Lcom/google/android/libraries/places/internal/zzbwq;)V

    .line 26
    .line 27
    .line 28
    return-object p0
.end method

.method public static final zzd(Ljava/net/Socket;)Lcom/google/android/libraries/places/internal/zzbws;
    .locals 2
    .param p0    # Ljava/net/Socket;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget v0, Lcom/google/android/libraries/places/internal/zzbwi;->zza:I

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbwr;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Lcom/google/android/libraries/places/internal/zzbwr;-><init>(Ljava/net/Socket;)V

    .line 9
    .line 10
    .line 11
    new-instance v1, Lcom/google/android/libraries/places/internal/zzbwg;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 18
    .line 19
    .line 20
    invoke-direct {v1, p0, v0}, Lcom/google/android/libraries/places/internal/zzbwg;-><init>(Ljava/io/InputStream;Lcom/google/android/libraries/places/internal/zzbwv;)V

    .line 21
    .line 22
    .line 23
    new-instance p0, Lcom/google/android/libraries/places/internal/zzbvy;

    .line 24
    .line 25
    invoke-direct {p0, v0, v1}, Lcom/google/android/libraries/places/internal/zzbvy;-><init>(Lcom/google/android/libraries/places/internal/zzbvz;Lcom/google/android/libraries/places/internal/zzbws;)V

    .line 26
    .line 27
    .line 28
    return-object p0
.end method
