.class public abstract Lcom/google/android/gms/internal/ads/p5;
.super Lcom/google/android/gms/internal/ads/h5;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<MessageType:",
        "Lcom/google/android/gms/internal/ads/p5<",
        "TMessageType;TBuilderType;>;BuilderType:",
        "Ll/shx0<",
        "TMessageType;TBuilderType;>;>",
        "Lcom/google/android/gms/internal/ads/h5<",
        "TMessageType;TBuilderType;>;"
    }
.end annotation


# static fields
.field private static final zzb:Ljava/util/Map;


# instance fields
.field protected zzc:Ll/plx0;

.field private zzd:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/google/android/gms/internal/ads/p5;->zzb:Ljava/util/Map;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/ads/h5;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/google/android/gms/internal/ads/p5;->zzd:I

    .line 6
    .line 7
    invoke-static {}, Ll/plx0;->c()Ll/plx0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lcom/google/android/gms/internal/ads/p5;->zzc:Ll/plx0;

    .line 12
    .line 13
    return-void
.end method

.method public static C(Ljava/lang/Class;Lcom/google/android/gms/internal/ads/p5;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/google/android/gms/internal/ads/p5;->B()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/google/android/gms/internal/ads/p5;->zzb:Ljava/util/Map;

    .line 5
    .line 6
    invoke-interface {v0, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static J(Lcom/google/android/gms/internal/ads/p5;)Lcom/google/android/gms/internal/ads/p5;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzhag;
        }
    .end annotation

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/p5;->E()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    new-instance v0, Lcom/google/android/gms/internal/ads/zzhco;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/ads/zzhco;-><init>(Ll/fkx0;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/google/android/gms/internal/ads/zzhco;->zza()Lcom/google/android/gms/internal/ads/zzhag;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0, p0}, Lcom/google/android/gms/internal/ads/zzhag;->zzh(Ll/fkx0;)Lcom/google/android/gms/internal/ads/zzhag;

    .line 20
    .line 21
    .line 22
    throw v0

    .line 23
    :cond_1
    :goto_0
    return-object p0
.end method

.method public static K(Lcom/google/android/gms/internal/ads/p5;[BIILl/jhx0;)Lcom/google/android/gms/internal/ads/p5;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzhag;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/p5;->m()Lcom/google/android/gms/internal/ads/p5;

    .line 2
    .line 3
    .line 4
    move-result-object v1

    .line 5
    :try_start_0
    invoke-static {}, Ll/nkx0;->a()Ll/nkx0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-virtual {p0, p2}, Ll/nkx0;->b(Ljava/lang/Class;)Ll/ukx0;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v5, Ll/dgx0;

    .line 18
    .line 19
    invoke-direct {v5, p4}, Ll/dgx0;-><init>(Ll/jhx0;)V

    .line 20
    .line 21
    .line 22
    const/4 v3, 0x0

    .line 23
    move-object v2, p1

    .line 24
    move v4, p3

    .line 25
    invoke-interface/range {v0 .. v5}, Ll/ukx0;->d(Ljava/lang/Object;[BIILl/dgx0;)V

    .line 26
    .line 27
    .line 28
    invoke-interface {v0, v1}, Ll/ukx0;->a(Ljava/lang/Object;)V
    :try_end_0
    .catch Lcom/google/android/gms/internal/ads/zzhag; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lcom/google/android/gms/internal/ads/zzhco; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_3

    .line 29
    .line 30
    .line 31
    return-object v1

    .line 32
    :catch_0
    move-exception v0

    .line 33
    move-object p0, v0

    .line 34
    goto :goto_0

    .line 35
    :catch_1
    move-exception v0

    .line 36
    move-object p0, v0

    .line 37
    goto :goto_1

    .line 38
    :catch_2
    move-exception v0

    .line 39
    move-object p0, v0

    .line 40
    goto :goto_2

    .line 41
    :catch_3
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzhag;->zzj()Lcom/google/android/gms/internal/ads/zzhag;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0, v1}, Lcom/google/android/gms/internal/ads/zzhag;->zzh(Ll/fkx0;)Lcom/google/android/gms/internal/ads/zzhag;

    .line 46
    .line 47
    .line 48
    throw p0

    .line 49
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    instance-of p1, p1, Lcom/google/android/gms/internal/ads/zzhag;

    .line 54
    .line 55
    if-eqz p1, :cond_0

    .line 56
    .line 57
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    check-cast p0, Lcom/google/android/gms/internal/ads/zzhag;

    .line 62
    .line 63
    throw p0

    .line 64
    :cond_0
    new-instance p1, Lcom/google/android/gms/internal/ads/zzhag;

    .line 65
    .line 66
    invoke-direct {p1, p0}, Lcom/google/android/gms/internal/ads/zzhag;-><init>(Ljava/io/IOException;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p1, v1}, Lcom/google/android/gms/internal/ads/zzhag;->zzh(Ll/fkx0;)Lcom/google/android/gms/internal/ads/zzhag;

    .line 70
    .line 71
    .line 72
    throw p1

    .line 73
    :goto_1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/zzhco;->zza()Lcom/google/android/gms/internal/ads/zzhag;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {p0, v1}, Lcom/google/android/gms/internal/ads/zzhag;->zzh(Ll/fkx0;)Lcom/google/android/gms/internal/ads/zzhag;

    .line 78
    .line 79
    .line 80
    throw p0

    .line 81
    :goto_2
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/zzhag;->zzl()Z

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    if-eqz p1, :cond_1

    .line 86
    .line 87
    new-instance p1, Lcom/google/android/gms/internal/ads/zzhag;

    .line 88
    .line 89
    invoke-direct {p1, p0}, Lcom/google/android/gms/internal/ads/zzhag;-><init>(Ljava/io/IOException;)V

    .line 90
    .line 91
    .line 92
    move-object p0, p1

    .line 93
    :cond_1
    invoke-virtual {p0, v1}, Lcom/google/android/gms/internal/ads/zzhag;->zzh(Ll/fkx0;)Lcom/google/android/gms/internal/ads/zzhag;

    .line 94
    .line 95
    .line 96
    throw p0
.end method

.method public static l(Ljava/lang/Class;)Lcom/google/android/gms/internal/ads/p5;
    .locals 5

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/ads/p5;->zzb:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Lcom/google/android/gms/internal/ads/p5;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {p0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    const/4 v4, 0x1

    .line 21
    invoke-static {v1, v4, v3}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    .line 24
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    check-cast v1, Lcom/google/android/gms/internal/ads/p5;

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :catch_0
    move-exception p0

    .line 32
    const-string v0, "Class initialization cannot fail."

    .line 33
    .line 34
    invoke-static {v0, p0}, Ll/yzv;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 35
    .line 36
    .line 37
    return-object v2

    .line 38
    :cond_0
    :goto_0
    if-nez v1, :cond_2

    .line 39
    .line 40
    invoke-static {p0}, Ll/xlx0;->o(Ljava/lang/Class;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    check-cast v1, Lcom/google/android/gms/internal/ads/p5;

    .line 45
    .line 46
    const/4 v3, 0x6

    .line 47
    invoke-virtual {v1, v3, v2, v2}, Lcom/google/android/gms/internal/ads/p5;->H(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    check-cast v1, Lcom/google/android/gms/internal/ads/p5;

    .line 52
    .line 53
    if-eqz v1, :cond_1

    .line 54
    .line 55
    invoke-interface {v0, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    return-object v1

    .line 59
    :cond_1
    invoke-static {}, Ll/wpg0;->a()V

    .line 60
    .line 61
    .line 62
    return-object v2

    .line 63
    :cond_2
    return-object v1
.end method

.method public static n(Lcom/google/android/gms/internal/ads/p5;Lcom/google/android/gms/internal/ads/zzgyl;)Lcom/google/android/gms/internal/ads/p5;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzhag;
        }
    .end annotation

    .line 1
    sget-object v0, Ll/jhx0;->c:Ll/jhx0;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/google/android/gms/internal/ads/zzgyl;->zzl()Ll/wgx0;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/p5;->m()Lcom/google/android/gms/internal/ads/p5;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    :try_start_0
    invoke-static {}, Ll/nkx0;->a()Ll/nkx0;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v1, v2}, Ll/nkx0;->b(Ljava/lang/Class;)Ll/ukx0;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-static {p1}, Ll/xgx0;->l(Ll/wgx0;)Ll/xgx0;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-interface {v1, p0, v2, v0}, Ll/ukx0;->f(Ljava/lang/Object;Ll/qkx0;Ll/jhx0;)V

    .line 28
    .line 29
    .line 30
    invoke-interface {v1, p0}, Ll/ukx0;->a(Ljava/lang/Object;)V
    :try_end_0
    .catch Lcom/google/android/gms/internal/ads/zzhag; {:try_start_0 .. :try_end_0} :catch_3
    .catch Lcom/google/android/gms/internal/ads/zzhco; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_4

    .line 31
    .line 32
    .line 33
    const/4 v0, 0x0

    .line 34
    :try_start_1
    invoke-virtual {p1, v0}, Ll/wgx0;->B(I)V
    :try_end_1
    .catch Lcom/google/android/gms/internal/ads/zzhag; {:try_start_1 .. :try_end_1} :catch_0

    .line 35
    .line 36
    .line 37
    invoke-static {p0}, Lcom/google/android/gms/internal/ads/p5;->J(Lcom/google/android/gms/internal/ads/p5;)Lcom/google/android/gms/internal/ads/p5;

    .line 38
    .line 39
    .line 40
    invoke-static {p0}, Lcom/google/android/gms/internal/ads/p5;->J(Lcom/google/android/gms/internal/ads/p5;)Lcom/google/android/gms/internal/ads/p5;

    .line 41
    .line 42
    .line 43
    return-object p0

    .line 44
    :catch_0
    move-exception p1

    .line 45
    invoke-virtual {p1, p0}, Lcom/google/android/gms/internal/ads/zzhag;->zzh(Ll/fkx0;)Lcom/google/android/gms/internal/ads/zzhag;

    .line 46
    .line 47
    .line 48
    throw p1

    .line 49
    :catch_1
    move-exception p1

    .line 50
    goto :goto_0

    .line 51
    :catch_2
    move-exception p1

    .line 52
    goto :goto_1

    .line 53
    :catch_3
    move-exception p1

    .line 54
    goto :goto_2

    .line 55
    :catch_4
    move-exception p0

    .line 56
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    instance-of p1, p1, Lcom/google/android/gms/internal/ads/zzhag;

    .line 61
    .line 62
    if-eqz p1, :cond_0

    .line 63
    .line 64
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    check-cast p0, Lcom/google/android/gms/internal/ads/zzhag;

    .line 69
    .line 70
    throw p0

    .line 71
    :cond_0
    throw p0

    .line 72
    :goto_0
    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    instance-of v0, v0, Lcom/google/android/gms/internal/ads/zzhag;

    .line 77
    .line 78
    if-eqz v0, :cond_1

    .line 79
    .line 80
    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    check-cast p0, Lcom/google/android/gms/internal/ads/zzhag;

    .line 85
    .line 86
    throw p0

    .line 87
    :cond_1
    new-instance v0, Lcom/google/android/gms/internal/ads/zzhag;

    .line 88
    .line 89
    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/ads/zzhag;-><init>(Ljava/io/IOException;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v0, p0}, Lcom/google/android/gms/internal/ads/zzhag;->zzh(Ll/fkx0;)Lcom/google/android/gms/internal/ads/zzhag;

    .line 93
    .line 94
    .line 95
    throw v0

    .line 96
    :goto_1
    invoke-virtual {p1}, Lcom/google/android/gms/internal/ads/zzhco;->zza()Lcom/google/android/gms/internal/ads/zzhag;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    invoke-virtual {p1, p0}, Lcom/google/android/gms/internal/ads/zzhag;->zzh(Ll/fkx0;)Lcom/google/android/gms/internal/ads/zzhag;

    .line 101
    .line 102
    .line 103
    throw p1

    .line 104
    :goto_2
    invoke-virtual {p1}, Lcom/google/android/gms/internal/ads/zzhag;->zzl()Z

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    if-eqz v0, :cond_2

    .line 109
    .line 110
    new-instance v0, Lcom/google/android/gms/internal/ads/zzhag;

    .line 111
    .line 112
    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/ads/zzhag;-><init>(Ljava/io/IOException;)V

    .line 113
    .line 114
    .line 115
    move-object p1, v0

    .line 116
    :cond_2
    invoke-virtual {p1, p0}, Lcom/google/android/gms/internal/ads/zzhag;->zzh(Ll/fkx0;)Lcom/google/android/gms/internal/ads/zzhag;

    .line 117
    .line 118
    .line 119
    throw p1
.end method

.method public static o(Lcom/google/android/gms/internal/ads/p5;[B)Lcom/google/android/gms/internal/ads/p5;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzhag;
        }
    .end annotation

    .line 1
    array-length v0, p1

    .line 2
    sget-object v1, Ll/jhx0;->c:Ll/jhx0;

    .line 3
    .line 4
    const/4 v2, 0x0

    .line 5
    invoke-static {p0, p1, v2, v0, v1}, Lcom/google/android/gms/internal/ads/p5;->K(Lcom/google/android/gms/internal/ads/p5;[BIILl/jhx0;)Lcom/google/android/gms/internal/ads/p5;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Lcom/google/android/gms/internal/ads/p5;->J(Lcom/google/android/gms/internal/ads/p5;)Lcom/google/android/gms/internal/ads/p5;

    .line 10
    .line 11
    .line 12
    return-object p0
.end method

.method public static p(Lcom/google/android/gms/internal/ads/p5;Lcom/google/android/gms/internal/ads/zzgyl;Ll/jhx0;)Lcom/google/android/gms/internal/ads/p5;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzhag;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lcom/google/android/gms/internal/ads/zzgyl;->zzl()Ll/wgx0;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/p5;->m()Lcom/google/android/gms/internal/ads/p5;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :try_start_0
    invoke-static {}, Ll/nkx0;->a()Ll/nkx0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Ll/nkx0;->b(Ljava/lang/Class;)Ll/ukx0;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {p1}, Ll/xgx0;->l(Ll/wgx0;)Ll/xgx0;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-interface {v0, p0, v1, p2}, Ll/ukx0;->f(Ljava/lang/Object;Ll/qkx0;Ll/jhx0;)V

    .line 26
    .line 27
    .line 28
    invoke-interface {v0, p0}, Ll/ukx0;->a(Ljava/lang/Object;)V
    :try_end_0
    .catch Lcom/google/android/gms/internal/ads/zzhag; {:try_start_0 .. :try_end_0} :catch_3
    .catch Lcom/google/android/gms/internal/ads/zzhco; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_4

    .line 29
    .line 30
    .line 31
    const/4 p2, 0x0

    .line 32
    :try_start_1
    invoke-virtual {p1, p2}, Ll/wgx0;->B(I)V
    :try_end_1
    .catch Lcom/google/android/gms/internal/ads/zzhag; {:try_start_1 .. :try_end_1} :catch_0

    .line 33
    .line 34
    .line 35
    invoke-static {p0}, Lcom/google/android/gms/internal/ads/p5;->J(Lcom/google/android/gms/internal/ads/p5;)Lcom/google/android/gms/internal/ads/p5;

    .line 36
    .line 37
    .line 38
    return-object p0

    .line 39
    :catch_0
    move-exception p1

    .line 40
    invoke-virtual {p1, p0}, Lcom/google/android/gms/internal/ads/zzhag;->zzh(Ll/fkx0;)Lcom/google/android/gms/internal/ads/zzhag;

    .line 41
    .line 42
    .line 43
    throw p1

    .line 44
    :catch_1
    move-exception p1

    .line 45
    goto :goto_0

    .line 46
    :catch_2
    move-exception p1

    .line 47
    goto :goto_1

    .line 48
    :catch_3
    move-exception p1

    .line 49
    goto :goto_2

    .line 50
    :catch_4
    move-exception p0

    .line 51
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    instance-of p1, p1, Lcom/google/android/gms/internal/ads/zzhag;

    .line 56
    .line 57
    if-eqz p1, :cond_0

    .line 58
    .line 59
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    check-cast p0, Lcom/google/android/gms/internal/ads/zzhag;

    .line 64
    .line 65
    throw p0

    .line 66
    :cond_0
    throw p0

    .line 67
    :goto_0
    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    instance-of p2, p2, Lcom/google/android/gms/internal/ads/zzhag;

    .line 72
    .line 73
    if-eqz p2, :cond_1

    .line 74
    .line 75
    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    check-cast p0, Lcom/google/android/gms/internal/ads/zzhag;

    .line 80
    .line 81
    throw p0

    .line 82
    :cond_1
    new-instance p2, Lcom/google/android/gms/internal/ads/zzhag;

    .line 83
    .line 84
    invoke-direct {p2, p1}, Lcom/google/android/gms/internal/ads/zzhag;-><init>(Ljava/io/IOException;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p2, p0}, Lcom/google/android/gms/internal/ads/zzhag;->zzh(Ll/fkx0;)Lcom/google/android/gms/internal/ads/zzhag;

    .line 88
    .line 89
    .line 90
    throw p2

    .line 91
    :goto_1
    invoke-virtual {p1}, Lcom/google/android/gms/internal/ads/zzhco;->zza()Lcom/google/android/gms/internal/ads/zzhag;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-virtual {p1, p0}, Lcom/google/android/gms/internal/ads/zzhag;->zzh(Ll/fkx0;)Lcom/google/android/gms/internal/ads/zzhag;

    .line 96
    .line 97
    .line 98
    throw p1

    .line 99
    :goto_2
    invoke-virtual {p1}, Lcom/google/android/gms/internal/ads/zzhag;->zzl()Z

    .line 100
    .line 101
    .line 102
    move-result p2

    .line 103
    if-eqz p2, :cond_2

    .line 104
    .line 105
    new-instance p2, Lcom/google/android/gms/internal/ads/zzhag;

    .line 106
    .line 107
    invoke-direct {p2, p1}, Lcom/google/android/gms/internal/ads/zzhag;-><init>(Ljava/io/IOException;)V

    .line 108
    .line 109
    .line 110
    move-object p1, p2

    .line 111
    :cond_2
    invoke-virtual {p1, p0}, Lcom/google/android/gms/internal/ads/zzhag;->zzh(Ll/fkx0;)Lcom/google/android/gms/internal/ads/zzhag;

    .line 112
    .line 113
    .line 114
    throw p1
.end method

.method public static q(Lcom/google/android/gms/internal/ads/p5;Ljava/io/InputStream;Ll/jhx0;)Lcom/google/android/gms/internal/ads/p5;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzhag;
        }
    .end annotation

    .line 1
    const/16 v0, 0x1000

    .line 2
    .line 3
    invoke-static {p1, v0}, Ll/wgx0;->g(Ljava/io/InputStream;I)Ll/wgx0;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/p5;->m()Lcom/google/android/gms/internal/ads/p5;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    :try_start_0
    invoke-static {}, Ll/nkx0;->a()Ll/nkx0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Ll/nkx0;->b(Ljava/lang/Class;)Ll/ukx0;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {p1}, Ll/xgx0;->l(Ll/wgx0;)Ll/xgx0;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-interface {v0, p0, p1, p2}, Ll/ukx0;->f(Ljava/lang/Object;Ll/qkx0;Ll/jhx0;)V

    .line 28
    .line 29
    .line 30
    invoke-interface {v0, p0}, Ll/ukx0;->a(Ljava/lang/Object;)V
    :try_end_0
    .catch Lcom/google/android/gms/internal/ads/zzhag; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lcom/google/android/gms/internal/ads/zzhco; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_3

    .line 31
    .line 32
    .line 33
    invoke-static {p0}, Lcom/google/android/gms/internal/ads/p5;->J(Lcom/google/android/gms/internal/ads/p5;)Lcom/google/android/gms/internal/ads/p5;

    .line 34
    .line 35
    .line 36
    return-object p0

    .line 37
    :catch_0
    move-exception p1

    .line 38
    goto :goto_0

    .line 39
    :catch_1
    move-exception p1

    .line 40
    goto :goto_1

    .line 41
    :catch_2
    move-exception p1

    .line 42
    goto :goto_2

    .line 43
    :catch_3
    move-exception p0

    .line 44
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    instance-of p1, p1, Lcom/google/android/gms/internal/ads/zzhag;

    .line 49
    .line 50
    if-eqz p1, :cond_0

    .line 51
    .line 52
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    check-cast p0, Lcom/google/android/gms/internal/ads/zzhag;

    .line 57
    .line 58
    throw p0

    .line 59
    :cond_0
    throw p0

    .line 60
    :goto_0
    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    instance-of p2, p2, Lcom/google/android/gms/internal/ads/zzhag;

    .line 65
    .line 66
    if-eqz p2, :cond_1

    .line 67
    .line 68
    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    check-cast p0, Lcom/google/android/gms/internal/ads/zzhag;

    .line 73
    .line 74
    throw p0

    .line 75
    :cond_1
    new-instance p2, Lcom/google/android/gms/internal/ads/zzhag;

    .line 76
    .line 77
    invoke-direct {p2, p1}, Lcom/google/android/gms/internal/ads/zzhag;-><init>(Ljava/io/IOException;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p2, p0}, Lcom/google/android/gms/internal/ads/zzhag;->zzh(Ll/fkx0;)Lcom/google/android/gms/internal/ads/zzhag;

    .line 81
    .line 82
    .line 83
    throw p2

    .line 84
    :goto_1
    invoke-virtual {p1}, Lcom/google/android/gms/internal/ads/zzhco;->zza()Lcom/google/android/gms/internal/ads/zzhag;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-virtual {p1, p0}, Lcom/google/android/gms/internal/ads/zzhag;->zzh(Ll/fkx0;)Lcom/google/android/gms/internal/ads/zzhag;

    .line 89
    .line 90
    .line 91
    throw p1

    .line 92
    :goto_2
    invoke-virtual {p1}, Lcom/google/android/gms/internal/ads/zzhag;->zzl()Z

    .line 93
    .line 94
    .line 95
    move-result p2

    .line 96
    if-eqz p2, :cond_2

    .line 97
    .line 98
    new-instance p2, Lcom/google/android/gms/internal/ads/zzhag;

    .line 99
    .line 100
    invoke-direct {p2, p1}, Lcom/google/android/gms/internal/ads/zzhag;-><init>(Ljava/io/IOException;)V

    .line 101
    .line 102
    .line 103
    move-object p1, p2

    .line 104
    :cond_2
    invoke-virtual {p1, p0}, Lcom/google/android/gms/internal/ads/zzhag;->zzh(Ll/fkx0;)Lcom/google/android/gms/internal/ads/zzhag;

    .line 105
    .line 106
    .line 107
    throw p1
.end method

.method public static r(Lcom/google/android/gms/internal/ads/p5;[BLl/jhx0;)Lcom/google/android/gms/internal/ads/p5;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzhag;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    array-length v1, p1

    .line 3
    invoke-static {p0, p1, v0, v1, p2}, Lcom/google/android/gms/internal/ads/p5;->K(Lcom/google/android/gms/internal/ads/p5;[BIILl/jhx0;)Lcom/google/android/gms/internal/ads/p5;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Lcom/google/android/gms/internal/ads/p5;->J(Lcom/google/android/gms/internal/ads/p5;)Lcom/google/android/gms/internal/ads/p5;

    .line 8
    .line 9
    .line 10
    return-object p0
.end method

.method public static s()Ll/aix0;
    .locals 1

    .line 1
    invoke-static {}, Ll/whx0;->f()Ll/whx0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method public static t(Ll/aix0;)Ll/aix0;
    .locals 1

    .line 1
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/16 v0, 0xa

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    add-int/2addr v0, v0

    .line 11
    :goto_0
    invoke-interface {p0, v0}, Ll/aix0;->zzg(I)Ll/aix0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static u()Ll/ejx0;
    .locals 1

    .line 1
    invoke-static {}, Ll/qjx0;->f()Ll/qjx0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method public static v(Ll/ejx0;)Ll/ejx0;
    .locals 1

    .line 1
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/16 v0, 0xa

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    add-int/2addr v0, v0

    .line 11
    :goto_0
    invoke-interface {p0, v0}, Ll/ejx0;->zza(I)Ll/ejx0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static w()Ll/fjx0;
    .locals 1

    .line 1
    invoke-static {}, Ll/okx0;->c()Ll/okx0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method public static x(Ll/fjx0;)Ll/fjx0;
    .locals 1

    .line 1
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/16 v0, 0xa

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    add-int/2addr v0, v0

    .line 11
    :goto_0
    invoke-interface {p0, v0}, Ll/fjx0;->zzd(I)Ll/fjx0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static varargs y(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    invoke-virtual {p0, p1, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    return-object p0

    .line 7
    :catch_0
    move-exception p0

    .line 8
    invoke-virtual {p0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    instance-of p1, p0, Ljava/lang/RuntimeException;

    .line 13
    .line 14
    if-nez p1, :cond_1

    .line 15
    .line 16
    instance-of p1, p0, Ljava/lang/Error;

    .line 17
    .line 18
    if-nez p1, :cond_0

    .line 19
    .line 20
    const-string p1, "Unexpected exception thrown by generated accessor method."

    .line 21
    .line 22
    invoke-static {p1, p0}, Ll/vtq0;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 23
    .line 24
    .line 25
    return-object v0

    .line 26
    :cond_0
    check-cast p0, Ljava/lang/Error;

    .line 27
    .line 28
    throw p0

    .line 29
    :cond_1
    check-cast p0, Ljava/lang/RuntimeException;

    .line 30
    .line 31
    throw p0

    .line 32
    :catch_1
    move-exception p0

    .line 33
    const-string p1, "Couldn\'t use Java reflection to implement protocol message reflection."

    .line 34
    .line 35
    invoke-static {p1, p0}, Ll/vtq0;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 36
    .line 37
    .line 38
    return-object v0
.end method

.method public static z(Ll/fkx0;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    new-instance v0, Ll/pkx0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/pkx0;-><init>(Ll/fkx0;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public final A()V
    .locals 2

    .line 1
    invoke-static {}, Ll/nkx0;->a()Ll/nkx0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ll/nkx0;->b(Ljava/lang/Class;)Ll/ukx0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0, p0}, Ll/ukx0;->a(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/p5;->B()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final B()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/google/android/gms/internal/ads/p5;->zzd:I

    const v1, 0x7fffffff

    and-int/2addr v0, v1

    iput v0, p0, Lcom/google/android/gms/internal/ads/p5;->zzd:I

    return-void
.end method

.method public final D(I)V
    .locals 1

    .line 1
    iget p1, p0, Lcom/google/android/gms/internal/ads/p5;->zzd:I

    const/high16 v0, -0x80000000

    and-int/2addr p1, v0

    const v0, 0x7fffffff

    or-int/2addr p1, v0

    iput p1, p0, Lcom/google/android/gms/internal/ads/p5;->zzd:I

    return-void
.end method

.method public final E()Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    invoke-virtual {p0, v0, v1, v1}, Lcom/google/android/gms/internal/ads/p5;->H(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v2

    .line 7
    check-cast v2, Ljava/lang/Byte;

    .line 8
    .line 9
    invoke-virtual {v2}, Ljava/lang/Byte;->byteValue()B

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-ne v2, v0, :cond_0

    .line 14
    .line 15
    return v0

    .line 16
    :cond_0
    if-nez v2, :cond_1

    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-static {}, Ll/nkx0;->a()Ll/nkx0;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    invoke-virtual {v3, v2}, Ll/nkx0;->b(Ljava/lang/Class;)Ll/ukx0;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-interface {v2, p0}, Ll/ukx0;->c(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-eq v0, v2, :cond_2

    .line 37
    .line 38
    move-object v0, v1

    .line 39
    goto :goto_0

    .line 40
    :cond_2
    move-object v0, p0

    .line 41
    :goto_0
    const/4 v3, 0x2

    .line 42
    invoke-virtual {p0, v3, v0, v1}, Lcom/google/android/gms/internal/ads/p5;->H(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    return v2
.end method

.method public final F()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/google/android/gms/internal/ads/p5;->zzd:I

    const/high16 v0, -0x80000000

    and-int/2addr p0, v0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public final G()I
    .locals 2

    .line 1
    invoke-static {}, Ll/nkx0;->a()Ll/nkx0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ll/nkx0;->b(Ljava/lang/Class;)Ll/ukx0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0, p0}, Ll/ukx0;->zzb(Ljava/lang/Object;)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public abstract H(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
.end method

.method public final synthetic a()Ll/fkx0;
    .locals 2

    .line 1
    const/4 v0, 0x6

    .line 2
    const/4 v1, 0x0

    .line 3
    invoke-virtual {p0, v0, v1, v1}, Lcom/google/android/gms/internal/ads/p5;->H(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/google/android/gms/internal/ads/p5;

    .line 8
    .line 9
    return-object p0
.end method

.method public final b(Ll/ukx0;)I
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/p5;->F()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "serialized size must be non-negative, was "

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-interface {p1, p0}, Ll/ukx0;->zza(Ljava/lang/Object;)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-ltz p0, :cond_0

    .line 14
    .line 15
    return p0

    .line 16
    :cond_0
    invoke-static {v1, p0}, Ll/o4c;->a(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    :goto_0
    const/4 p0, 0x0

    .line 20
    return p0

    .line 21
    :cond_1
    iget v0, p0, Lcom/google/android/gms/internal/ads/p5;->zzd:I

    .line 22
    .line 23
    const v2, 0x7fffffff

    .line 24
    .line 25
    .line 26
    and-int/2addr v0, v2

    .line 27
    if-ne v0, v2, :cond_3

    .line 28
    .line 29
    invoke-interface {p1, p0}, Ll/ukx0;->zza(Ljava/lang/Object;)I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-ltz p1, :cond_2

    .line 34
    .line 35
    iget v0, p0, Lcom/google/android/gms/internal/ads/p5;->zzd:I

    .line 36
    .line 37
    const/high16 v1, -0x80000000

    .line 38
    .line 39
    and-int/2addr v0, v1

    .line 40
    or-int/2addr v0, p1

    .line 41
    iput v0, p0, Lcom/google/android/gms/internal/ads/p5;->zzd:I

    .line 42
    .line 43
    return p1

    .line 44
    :cond_2
    invoke-static {v1, p1}, Ll/o4c;->a(Ljava/lang/String;I)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_3
    return v0
.end method

.method public final d(Lcom/google/android/gms/internal/ads/o5;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/nkx0;->a()Ll/nkx0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ll/nkx0;->b(Ljava/lang/Class;)Ll/ukx0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {p1}, Ll/fhx0;->l(Lcom/google/android/gms/internal/ads/o5;)Ll/fhx0;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-interface {v0, p0, p1}, Ll/ukx0;->e(Ljava/lang/Object;Ll/fhx0;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic e()Ll/ekx0;
    .locals 2

    .line 1
    const/4 v0, 0x5

    .line 2
    const/4 v1, 0x0

    .line 3
    invoke-virtual {p0, v0, v1, v1}, Lcom/google/android/gms/internal/ads/p5;->H(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/shx0;

    .line 8
    .line 9
    return-object p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 3

    .line 1
    if-ne p0, p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    const/4 v0, 0x0

    .line 6
    if-nez p1, :cond_1

    .line 7
    .line 8
    return v0

    .line 9
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    if-eq v1, v2, :cond_2

    .line 18
    .line 19
    return v0

    .line 20
    :cond_2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {}, Ll/nkx0;->a()Ll/nkx0;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v1, v0}, Ll/nkx0;->b(Ljava/lang/Class;)Ll/ukx0;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast p1, Lcom/google/android/gms/internal/ads/p5;

    .line 33
    .line 34
    invoke-interface {v0, p0, p1}, Ll/ukx0;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    return p0
.end method

.method public final hashCode()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/p5;->F()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget v0, p0, Lcom/google/android/gms/internal/ads/h5;->zza:I

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/p5;->G()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iput v0, p0, Lcom/google/android/gms/internal/ads/h5;->zza:I

    .line 16
    .line 17
    :cond_0
    return v0

    .line 18
    :cond_1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/p5;->G()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0
.end method

.method public final i(Ll/ukx0;)I
    .locals 1

    .line 1
    invoke-static {}, Ll/nkx0;->a()Ll/nkx0;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p1, v0}, Ll/nkx0;->b(Ljava/lang/Class;)Ll/ukx0;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-interface {p1, p0}, Ll/ukx0;->zza(Ljava/lang/Object;)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public final j()Ll/shx0;
    .locals 2

    .line 1
    const/4 v0, 0x5

    .line 2
    const/4 v1, 0x0

    .line 3
    invoke-virtual {p0, v0, v1, v1}, Lcom/google/android/gms/internal/ads/p5;->H(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/shx0;

    .line 8
    .line 9
    return-object p0
.end method

.method public final k()Ll/shx0;
    .locals 2

    .line 1
    const/4 v0, 0x5

    .line 2
    const/4 v1, 0x0

    .line 3
    invoke-virtual {p0, v0, v1, v1}, Lcom/google/android/gms/internal/ads/p5;->H(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/shx0;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Ll/shx0;->k(Lcom/google/android/gms/internal/ads/p5;)Ll/shx0;

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method public final m()Lcom/google/android/gms/internal/ads/p5;
    .locals 2

    .line 1
    const/4 v0, 0x4

    .line 2
    const/4 v1, 0x0

    .line 3
    invoke-virtual {p0, v0, v1, v1}, Lcom/google/android/gms/internal/ads/p5;->H(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/google/android/gms/internal/ads/p5;

    .line 8
    .line 9
    return-object p0
.end method

.method public final toString()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p0, v0}, Lcom/google/android/gms/internal/ads/r5;->a(Ll/fkx0;Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final zzaz()I
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/p5;->F()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "serialized size must be non-negative, was "

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    invoke-virtual {p0, v2}, Lcom/google/android/gms/internal/ads/p5;->i(Ll/ukx0;)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-ltz p0, :cond_0

    .line 15
    .line 16
    return p0

    .line 17
    :cond_0
    invoke-static {v1, p0}, Ll/o4c;->a(Ljava/lang/String;I)V

    .line 18
    .line 19
    .line 20
    :goto_0
    const/4 p0, 0x0

    .line 21
    return p0

    .line 22
    :cond_1
    iget v0, p0, Lcom/google/android/gms/internal/ads/p5;->zzd:I

    .line 23
    .line 24
    const v3, 0x7fffffff

    .line 25
    .line 26
    .line 27
    and-int/2addr v0, v3

    .line 28
    if-eq v0, v3, :cond_2

    .line 29
    .line 30
    return v0

    .line 31
    :cond_2
    invoke-virtual {p0, v2}, Lcom/google/android/gms/internal/ads/p5;->i(Ll/ukx0;)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-ltz v0, :cond_3

    .line 36
    .line 37
    iget v1, p0, Lcom/google/android/gms/internal/ads/p5;->zzd:I

    .line 38
    .line 39
    const/high16 v2, -0x80000000

    .line 40
    .line 41
    and-int/2addr v1, v2

    .line 42
    or-int/2addr v1, v0

    .line 43
    iput v1, p0, Lcom/google/android/gms/internal/ads/p5;->zzd:I

    .line 44
    .line 45
    return v0

    .line 46
    :cond_3
    invoke-static {v1, v0}, Ll/o4c;->a(Ljava/lang/String;I)V

    .line 47
    .line 48
    .line 49
    goto :goto_0
.end method
