.class public final Ll/bts0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ll/mwr0;

.field public static final b:Ljava/lang/Object;

.field public static final c:Ll/wms0;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/bts0;->b:Ljava/lang/Object;

    .line 7
    .line 8
    new-instance v0, Ll/yis0;

    .line 9
    .line 10
    invoke-direct {v0}, Ll/yis0;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Ll/bts0;->c:Ll/wms0;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    :cond_0
    sget-object p0, Ll/bts0;->b:Ljava/lang/Object;

    .line 15
    .line 16
    monitor-enter p0

    .line 17
    :try_start_0
    sget-object v0, Ll/bts0;->a:Ll/mwr0;

    .line 18
    .line 19
    if-nez v0, :cond_2

    .line 20
    .line 21
    invoke-static {p1}, Ll/sgs0;->a(Landroid/content/Context;)V

    .line 22
    .line 23
    .line 24
    invoke-static {}, Lcom/google/android/gms/common/util/ClientLibraryUtils;->isPackageSide()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_1

    .line 29
    .line 30
    sget-object v0, Ll/sgs0;->r4:Ll/dgs0;

    .line 31
    .line 32
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Ljava/lang/Boolean;

    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_1

    .line 47
    .line 48
    invoke-static {p1}, Ll/h7s0;->b(Landroid/content/Context;)Ll/mwr0;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    goto :goto_0

    .line 53
    :catchall_0
    move-exception p1

    .line 54
    goto :goto_1

    .line 55
    :cond_1
    const/4 v0, 0x0

    .line 56
    invoke-static {p1, v0}, Ll/zxr0;->a(Landroid/content/Context;Ll/uwr0;)Ll/mwr0;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    :goto_0
    sput-object p1, Ll/bts0;->a:Ll/mwr0;

    .line 61
    .line 62
    :cond_2
    monitor-exit p0

    .line 63
    return-void

    .line 64
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 65
    throw p1
.end method


# virtual methods
.method public final a(Ljava/lang/String;)Ll/hpr;
    .locals 3

    .line 1
    new-instance p0, Ll/tct0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/tct0;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v0, Ll/bts0;->a:Ll/mwr0;

    .line 7
    .line 8
    new-instance v1, Ll/srs0;

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-direct {v1, p1, v2, p0}, Ll/srs0;-><init>(Ljava/lang/String;Ljava/util/Map;Ll/tct0;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ll/mwr0;->a(Ll/jwr0;)Ll/jwr0;

    .line 15
    .line 16
    .line 17
    return-object p0
.end method

.method public final b(ILjava/lang/String;Ljava/util/Map;[B)Ll/hpr;
    .locals 10
    .param p3    # Ljava/util/Map;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # [B
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    new-instance v5, Ll/mps0;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-direct {v5, v0}, Ll/mps0;-><init>(Ll/cos0;)V

    .line 5
    .line 6
    .line 7
    new-instance v6, Ll/gks0;

    .line 8
    .line 9
    invoke-direct {v6, p0, p2, v5}, Ll/gks0;-><init>(Ll/bts0;Ljava/lang/String;Ll/mps0;)V

    .line 10
    .line 11
    .line 12
    new-instance v9, Ll/cct0;

    .line 13
    .line 14
    invoke-direct {v9, v0}, Ll/cct0;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    new-instance v1, Ll/mls0;

    .line 18
    .line 19
    move-object v2, p0

    .line 20
    move v3, p1

    .line 21
    move-object v4, p2

    .line 22
    move-object v8, p3

    .line 23
    move-object v7, p4

    .line 24
    invoke-direct/range {v1 .. v9}, Ll/mls0;-><init>(Ll/bts0;ILjava/lang/String;Ll/owr0;Ll/nwr0;[BLjava/util/Map;Ll/cct0;)V

    .line 25
    .line 26
    .line 27
    invoke-static {}, Ll/cct0;->k()Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_0

    .line 32
    .line 33
    :try_start_0
    const-string p0, "GET"

    .line 34
    .line 35
    invoke-virtual {v1}, Ll/jwr0;->p()Ljava/util/Map;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {v1}, Ll/jwr0;->B()[B

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    invoke-virtual {v9, v4, p0, p1, p2}, Ll/cct0;->d(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;[B)V
    :try_end_0
    .catch Lcom/google/android/gms/internal/ads/zzapi; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :catch_0
    move-exception v0

    .line 48
    move-object p0, v0

    .line 49
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-static {p0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    :cond_0
    :goto_0
    sget-object p0, Ll/bts0;->a:Ll/mwr0;

    .line 57
    .line 58
    invoke-virtual {p0, v1}, Ll/mwr0;->a(Ll/jwr0;)Ll/jwr0;

    .line 59
    .line 60
    .line 61
    return-object v5
.end method
