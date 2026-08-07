.class public final Ll/uft0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/dht0;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final synthetic a(Ljava/lang/String;Ll/bmt0;)Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/measurement/zzcj;->zza:Lcom/google/android/gms/internal/measurement/zzcj;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2, v0}, Ll/dht0;->d(Ljava/lang/String;Ll/bmt0;Lcom/google/android/gms/internal/measurement/zzcj;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic b(Ljava/io/File;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Ll/bmt0;->a:Ll/bmt0;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2, v0}, Ll/dht0;->c(Ljava/io/File;Ljava/lang/String;Ll/bmt0;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic c(Ljava/io/File;Ljava/lang/String;Ll/bmt0;)Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-interface {p0, p1, p3}, Ll/dht0;->a(Ljava/lang/String;Ll/bmt0;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public final d(Ljava/lang/String;Ll/bmt0;Lcom/google/android/gms/internal/measurement/zzcj;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p1
.end method

.method public final synthetic zza(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Ll/bmt0;->a:Ll/bmt0;

    .line 2
    .line 3
    invoke-interface {p0, p1, v0}, Ll/dht0;->a(Ljava/lang/String;Ll/bmt0;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
