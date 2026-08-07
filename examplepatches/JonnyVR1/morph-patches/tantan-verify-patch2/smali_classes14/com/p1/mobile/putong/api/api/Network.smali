.class public final Lcom/p1/mobile/putong/api/api/Network;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final AUTH:Ljava/lang/String; = "Authorization"

.field public static final AUTH_ACCOUNT:Ljava/lang/String; = "aa"

.field public static final AUTH_BEFORE_SIGN_UP:Ljava/lang/String; = "abs"

.field public static final AUTH_CORE:Ljava/lang/String; = "ac"

.field public static final DEBUG_BUILDINFO_CACHE:Z = false

.field public static final JSON:Ll/e7y;

.field public static final LANGUAGE_ZH_HANS:Ljava/lang/String; = "zh-Hans"

.field public static final LANGUAGE_ZH_HANT:Ljava/lang/String; = "zh-Hant"

.field public static final MAC:Ljava/lang/String; = "MAC"

.field private static final TAG:Ljava/lang/String; = "Network"

.field private static dateHeaderFormat:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Ljava/text/SimpleDateFormat;",
            ">;"
        }
    .end annotation
.end field

.field public static debug_fakeServerUnavailable:Z

.field static debug_proxyString:Ll/wyd0;

.field private static formattedLocation:Ljava/lang/String;

.field private static previousLocation:Lcom/p1/mobile/putong/location/Location;

.field private static savedBuildInfoHash:Ll/wyd0;


# instance fields
.field private cloudHttp:Ll/rg50;

.field private downloadHttp:Ll/rg50;

.field private volatile hasRequestAb:Z

.field private hash:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private volatile hashAccount:Ljava/lang/String;

.field private http:Ll/rg50;

.field private httpProxy:Ll/j650;

.field public lastElapsedRealtime:J

.field private lastPins:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public lastServerTime:J

.field private volatile updateTimeInSinceDeviceBootRealMillis:J

.field private xmpNodes:Ll/bkj0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/bkj0<",
            "Ljava/util/TreeMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/Boolean;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    const-string v0, "application/json; charset=utf-8"

    .line 2
    .line 3
    invoke-static {v0}, Ll/e7y;->d(Ljava/lang/String;)Ll/e7y;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 8
    .line 9
    new-instance v0, Ll/wyd0;

    .line 10
    .line 11
    const-string v1, "debug_proxy_string"

    .line 12
    .line 13
    const-string v2, "proxy.p1staff.com"

    .line 14
    .line 15
    invoke-direct {v0, v1, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    sput-object v0, Lcom/p1/mobile/putong/api/api/Network;->debug_proxyString:Ll/wyd0;

    .line 19
    .line 20
    new-instance v0, Lcom/p1/mobile/putong/api/api/Network$a;

    .line 21
    .line 22
    invoke-direct {v0}, Lcom/p1/mobile/putong/api/api/Network$a;-><init>()V

    .line 23
    .line 24
    .line 25
    sput-object v0, Lcom/p1/mobile/putong/api/api/Network;->dateHeaderFormat:Ljava/lang/ThreadLocal;

    .line 26
    .line 27
    const-string v0, ""

    .line 28
    .line 29
    sput-object v0, Lcom/p1/mobile/putong/api/api/Network;->formattedLocation:Ljava/lang/String;

    .line 30
    .line 31
    const/4 v0, 0x0

    .line 32
    sput-boolean v0, Lcom/p1/mobile/putong/api/api/Network;->debug_fakeServerUnavailable:Z

    .line 33
    .line 34
    new-instance v0, Ll/wyd0;

    .line 35
    .line 36
    const-string v1, "buildinfo_hash"

    .line 37
    .line 38
    const/4 v2, 0x0

    .line 39
    invoke-direct {v0, v1, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    sput-object v0, Lcom/p1/mobile/putong/api/api/Network;->savedBuildInfoHash:Ll/wyd0;

    .line 43
    .line 44
    return-void
.end method

.method public constructor <init>(Ll/rg50$b;)V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "LogUseError"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/p1/mobile/putong/api/api/Network;->updateTimeInSinceDeviceBootRealMillis:J

    .line 7
    .line 8
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/api/api/Network;->hash:Lrx/subjects/a;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-boolean v0, p0, Lcom/p1/mobile/putong/api/api/Network;->hasRequestAb:Z

    .line 16
    .line 17
    new-instance v0, Ljava/util/HashSet;

    .line 18
    .line 19
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/api/api/Network;->lastPins:Ljava/util/Set;

    .line 23
    .line 24
    const-wide/16 v0, -0x1

    .line 25
    .line 26
    iput-wide v0, p0, Lcom/p1/mobile/putong/api/api/Network;->lastElapsedRealtime:J

    .line 27
    .line 28
    iput-wide v0, p0, Lcom/p1/mobile/putong/api/api/Network;->lastServerTime:J

    .line 29
    .line 30
    const-string v0, "Network before call init"

    .line 31
    .line 32
    const-string v1, "[common][network]"

    .line 33
    .line 34
    invoke-static {v1, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/api/api/Network;->init(Ll/rg50$b;)V

    .line 38
    .line 39
    .line 40
    const-string p0, "Network after call init"

    .line 41
    .line 42
    invoke-static {v1, p0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public static synthetic a(Ljava/lang/String;Ljava/lang/String;)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static addHMC(Ll/x1d0;)Ll/x1d0;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/x1d0;->h()Ll/x1d0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/ak20;->a(Ll/x1d0$a;)Ll/x1d0$a;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v2, "MAC "

    .line 12
    .line 13
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/x1d0;->k()Ll/rnl;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {v2}, Ll/rnl;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 25
    .line 26
    .line 27
    move-result-wide v3

    .line 28
    invoke-static {v3, v4}, Lcom/p1/mobile/putong/api/api/TimeConverter;->switchTime(J)J

    .line 29
    .line 30
    .line 31
    move-result-wide v3

    .line 32
    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    invoke-virtual {p0}, Ll/x1d0;->a()Ll/z1d0;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-static {v2, v3, p0}, Lcom/p1/mobile/putong/api/api/Network;->basicToken(Ljava/lang/String;Ljava/lang/String;Ll/z1d0;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    const-string v1, "Authorization"

    .line 52
    .line 53
    invoke-virtual {v0, v1, p0}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    return-object p0
.end method

.method public static addLocationHeader(Ll/x1d0$a;Ljava/lang/String;)Ll/x1d0$a;
    .locals 3

    .line 1
    const-string v0, "Geolocation"

    .line 2
    .line 3
    sget-object v1, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    invoke-virtual {v1}, Lcom/p1/mobile/putong/location/a;->q()Lcom/p1/mobile/putong/location/Location;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    :try_start_0
    invoke-static {v1}, Lcom/p1/mobile/putong/api/api/Network;->formatLocation(Lcom/p1/mobile/putong/location/Location;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-static {v2, p1}, Ll/f1f;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0, v0, p1}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    .line 24
    return-object p0

    .line 25
    :catch_0
    move-exception p1

    .line 26
    invoke-static {v1}, Lcom/p1/mobile/putong/api/api/Network;->formatLocation(Lcom/p1/mobile/putong/location/Location;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {p0, v0, v1}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 31
    .line 32
    .line 33
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-object p0
.end method

.method private authToken(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/z1d0;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object p0, Ll/uqb0;->c0:Ll/bn5;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/bn5;->accessToken()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/api/api/Network;->getUA()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    filled-new-array {p1, p2, p0, v0, p3}, [Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string p1, "15"

    .line 16
    .line 17
    const-string p2, "android4.9.8"

    .line 18
    .line 19
    invoke-static {p1, p2, p0, p4}, Lcom/p1/mobile/putong/api/api/Network;->getNewToken(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ll/z1d0;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/api/api/Network;->lambda$init$0(Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;)V

    return-void
.end method

.method private static basicToken(Ljava/lang/String;Ljava/lang/String;Ll/z1d0;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/qzd;->a()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/api/api/Network;->getUA()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const/4 v2, 0x0

    .line 10
    filled-new-array {p0, p1, v0, v1, v2}, [Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const-string p1, "16"

    .line 15
    .line 16
    const-string v0, "android4.9.8"

    .line 17
    .line 18
    invoke-static {p1, v0, p0, p2}, Lcom/p1/mobile/putong/api/api/Network;->getNewToken(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ll/z1d0;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public static synthetic c(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method private static cacheBuildInfoHash(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 3

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/data/CachedBuildInfoHash;->new_()Lcom/p1/mobile/putong/data/CachedBuildInfoHash;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 10
    .line 11
    .line 12
    move-result-wide v1

    .line 13
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/CachedBuildInfoHash;->update_time:J

    .line 14
    .line 15
    iput-object p1, v0, Lcom/p1/mobile/putong/data/CachedBuildInfoHash;->hash:Ljava/lang/String;

    .line 16
    .line 17
    iput-object p0, v0, Lcom/p1/mobile/putong/data/CachedBuildInfoHash;->accessToken:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/api/api/Network;->getUA()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    iput-object p0, v0, Lcom/p1/mobile/putong/data/CachedBuildInfoHash;->ua:Ljava/lang/String;

    .line 24
    .line 25
    sget-object p0, Lcom/p1/mobile/putong/api/api/Network;->savedBuildInfoHash:Ll/wyd0;

    .line 26
    .line 27
    sget-object p1, Lcom/p1/mobile/putong/data/CachedBuildInfoHash;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p0, p1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    return p0
.end method

.method private common(Ll/x1d0$a;)Ll/x1d0$a;
    .locals 0

    .line 7
    invoke-static {p1}, Ll/ak20;->a(Ll/x1d0$a;)Ll/x1d0$a;

    move-result-object p0

    return-object p0
.end method

.method private createSmAntiFraudInit()Lrx/c;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ll/bj20;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/bj20;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    new-instance v0, Ll/cj20;

    .line 11
    .line 12
    invoke-direct {v0}, Ll/cj20;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-string v0, ""

    .line 20
    .line 21
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-wide/16 v1, 0xa

    .line 26
    .line 27
    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 28
    .line 29
    invoke-virtual {p0, v1, v2, v3, v0}, Lrx/c;->timeout(JLjava/util/concurrent/TimeUnit;Lrx/c;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public static synthetic d(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/api/api/Network;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/api/api/Network;->lambda$uploadAdData$11(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic f(Ll/gcg0;)V
    .locals 1

    .line 1
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-interface {p0, v0}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p0}, Ll/bb50;->onCompleted()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static formatLocation(Lcom/p1/mobile/putong/location/Location;)Ljava/lang/String;
    .locals 6

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/api/api/Network;->previousLocation:Lcom/p1/mobile/putong/location/Location;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/location/Location;->s()F

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/location/Location;->s()F

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    cmpl-float v0, v0, v1

    .line 14
    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    sget-object v0, Lcom/p1/mobile/putong/api/api/Network;->previousLocation:Lcom/p1/mobile/putong/location/Location;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/location/Location;->t()D

    .line 20
    .line 21
    .line 22
    move-result-wide v0

    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/location/Location;->t()D

    .line 24
    .line 25
    .line 26
    move-result-wide v2

    .line 27
    cmpl-double v0, v0, v2

    .line 28
    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    sget-object v0, Lcom/p1/mobile/putong/api/api/Network;->previousLocation:Lcom/p1/mobile/putong/location/Location;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/p1/mobile/putong/location/Location;->u()D

    .line 34
    .line 35
    .line 36
    move-result-wide v0

    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/location/Location;->u()D

    .line 38
    .line 39
    .line 40
    move-result-wide v2

    .line 41
    cmpl-double v0, v0, v2

    .line 42
    .line 43
    if-eqz v0, :cond_0

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/api/api/Network;->formattedLocation:Ljava/lang/String;

    .line 47
    .line 48
    return-object p0

    .line 49
    :cond_1
    :goto_0
    sput-object p0, Lcom/p1/mobile/putong/api/api/Network;->previousLocation:Lcom/p1/mobile/putong/location/Location;

    .line 50
    .line 51
    :try_start_0
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 52
    .line 53
    const-string v1, "geo:%1$.4f,%2$.4f;u=%3$.0f"

    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/p1/mobile/putong/location/Location;->u()D

    .line 56
    .line 57
    .line 58
    move-result-wide v2

    .line 59
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/putong/location/Location;->x()D

    .line 64
    .line 65
    .line 66
    move-result-wide v3

    .line 67
    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    invoke-virtual {p0}, Lcom/p1/mobile/putong/location/Location;->s()F

    .line 72
    .line 73
    .line 74
    move-result v4

    .line 75
    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 76
    .line 77
    .line 78
    move-result-object v4

    .line 79
    filled-new-array {v2, v3, v4}, [Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 87
    sput-object p0, Lcom/p1/mobile/putong/api/api/Network;->formattedLocation:Ljava/lang/String;

    .line 88
    .line 89
    return-object p0

    .line 90
    :catch_0
    move-exception v0

    .line 91
    new-instance v1, Ljava/lang/Exception;

    .line 92
    .line 93
    new-instance v2, Ljava/lang/StringBuilder;

    .line 94
    .line 95
    const-string v3, "Network formatLocation:"

    .line 96
    .line 97
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v3

    .line 104
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    if-nez p0, :cond_2

    .line 108
    .line 109
    const-string p0, "currentLocation is null"

    .line 110
    .line 111
    goto :goto_1

    .line 112
    :cond_2
    new-instance v3, Ljava/lang/StringBuilder;

    .line 113
    .line 114
    const-string v4, "getLatitude:"

    .line 115
    .line 116
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {p0}, Lcom/p1/mobile/putong/location/Location;->u()D

    .line 120
    .line 121
    .line 122
    move-result-wide v4

    .line 123
    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    const-string v4, " getLongitude:"

    .line 127
    .line 128
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {p0}, Lcom/p1/mobile/putong/location/Location;->x()D

    .line 132
    .line 133
    .line 134
    move-result-wide v4

    .line 135
    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    const-string v4, " getAccuracy:"

    .line 139
    .line 140
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {p0}, Lcom/p1/mobile/putong/location/Location;->s()F

    .line 144
    .line 145
    .line 146
    move-result p0

    .line 147
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    :goto_1
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    invoke-direct {v1, p0, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 162
    .line 163
    .line 164
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 165
    .line 166
    .line 167
    const-string p0, ""

    .line 168
    .line 169
    return-object p0
.end method

.method public static synthetic g(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static getFormattedLocation()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/api/api/Network;->formattedLocation:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method private static getMac([Ljava/lang/String;[B)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    aget-object v1, p0, v1

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    const/4 v1, 0x2

    .line 13
    aget-object v2, p0, v1

    .line 14
    .line 15
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    const/4 v2, 0x4

    .line 19
    aget-object v2, p0, v2

    .line 20
    .line 21
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    aget-object v2, p0, v2

    .line 26
    .line 27
    invoke-static {v2}, Ll/rnl;->r(Ljava/lang/String;)Ll/rnl;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v2}, Ll/rnl;->h()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    const/4 v2, 0x3

    .line 39
    aget-object p0, p0, v2

    .line 40
    .line 41
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    new-instance p0, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    const-string v2, "P9mO9X1N5gZ4W6yFwnFdElykFu03MWhngr0eNHSYH4Am7HCYjh"

    .line 47
    .line 48
    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-static {v0}, Lcom/p1/mobile/putong/api/api/Network;->mkString2(Ljava/util/Collection;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    const-string v0, "UTF-8"

    .line 63
    .line 64
    invoke-virtual {p0, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    new-instance v0, Ll/iiw;

    .line 69
    .line 70
    invoke-direct {v0}, Ll/iiw;-><init>()V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0}, Ll/iiw;->i()Ll/iiw;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0, p0}, Ll/iiw;->n([B)V

    .line 77
    .line 78
    .line 79
    if-eqz p1, :cond_0

    .line 80
    .line 81
    invoke-virtual {v0, p1}, Ll/iiw;->n([B)V

    .line 82
    .line 83
    .line 84
    :cond_0
    invoke-virtual {v0}, Ll/iiw;->g()[B

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-static {p0, v1}, Ll/te2;->c([BI)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    return-object p0
.end method

.method private static getNewToken(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ll/z1d0;)Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 4
    .line 5
    invoke-virtual {p3}, Ll/z1d0;->contentType()Ll/e7y;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ll/e7y;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    new-instance v0, Lokio/Buffer;

    .line 16
    .line 17
    invoke-direct {v0}, Lokio/Buffer;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p3, v0}, Ll/z1d0;->writeTo(Lokio/BufferedSink;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Lokio/Buffer;->readByteArray()[B

    .line 24
    .line 25
    .line 26
    move-result-object p3

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 p3, 0x0

    .line 29
    :goto_0
    const/4 v0, 0x1

    .line 30
    aget-object v1, p2, v0

    .line 31
    .line 32
    const/4 v2, 0x2

    .line 33
    aget-object v3, p2, v2

    .line 34
    .line 35
    const/4 v4, 0x4

    .line 36
    aget-object v4, p2, v4

    .line 37
    .line 38
    filled-new-array {v1, v3, v4}, [Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    sget-object v3, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 47
    .line 48
    invoke-virtual {v3}, Lcom/tantanapp/common/data/JsonAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/JsonAdapter;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    filled-new-array {p0, p1}, [Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-static {p2, p3}, Lcom/p1/mobile/putong/api/api/Network;->getMac([Ljava/lang/String;[B)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    filled-new-array {p1}, [Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    new-array p2, v2, [Ljava/util/List;

    .line 73
    .line 74
    const/4 p3, 0x0

    .line 75
    aput-object v1, p2, p3

    .line 76
    .line 77
    aput-object p1, p2, v0

    .line 78
    .line 79
    invoke-static {p0, p2}, Ll/jyb;->e(Ljava/util/List;[Ljava/util/List;)Ljava/util/List;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-virtual {v3, p0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    return-object p0
.end method

.method public static getUA()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Ll/ak20;->d()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method private static getValidDiskHashForCurrentAccessToken()Ljava/lang/String;
    .locals 8

    .line 1
    const-string v0, "s1..."

    .line 2
    .line 3
    const-string v1, "[putong-common][upload]"

    .line 4
    .line 5
    invoke-static {v1, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 9
    .line 10
    invoke-interface {v0}, Ll/bn5;->accessToken()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/4 v2, 0x0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    const-string v0, "s2"

    .line 18
    .line 19
    invoke-static {v1, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-object v2

    .line 23
    :cond_0
    sget-object v3, Lcom/p1/mobile/putong/api/api/Network;->savedBuildInfoHash:Ll/wyd0;

    .line 24
    .line 25
    invoke-virtual {v3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    check-cast v3, Ljava/lang/String;

    .line 30
    .line 31
    if-nez v3, :cond_1

    .line 32
    .line 33
    const-string v0, "s3"

    .line 34
    .line 35
    invoke-static {v1, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-object v2

    .line 39
    :cond_1
    :try_start_0
    sget-object v4, Lcom/p1/mobile/putong/data/CachedBuildInfoHash;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 40
    .line 41
    invoke-virtual {v4, v3}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    check-cast v3, Lcom/p1/mobile/putong/data/CachedBuildInfoHash;

    .line 46
    .line 47
    iget-object v4, v3, Lcom/p1/mobile/putong/data/CachedBuildInfoHash;->ua:Ljava/lang/String;

    .line 48
    .line 49
    if-eqz v4, :cond_5

    .line 50
    .line 51
    iget-object v4, v3, Lcom/p1/mobile/putong/data/CachedBuildInfoHash;->accessToken:Ljava/lang/String;

    .line 52
    .line 53
    if-eqz v4, :cond_5

    .line 54
    .line 55
    iget-object v5, v3, Lcom/p1/mobile/putong/data/CachedBuildInfoHash;->hash:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 56
    .line 57
    if-eqz v5, :cond_5

    .line 58
    .line 59
    invoke-static {v0, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-nez v0, :cond_2

    .line 64
    .line 65
    const-string v0, "s5"

    .line 66
    .line 67
    invoke-static {v1, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    return-object v2

    .line 71
    :cond_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 72
    .line 73
    .line 74
    move-result-wide v4

    .line 75
    iget-wide v6, v3, Lcom/p1/mobile/putong/data/CachedBuildInfoHash;->update_time:J

    .line 76
    .line 77
    sub-long/2addr v4, v6

    .line 78
    const-wide/32 v6, 0x2932e00

    .line 79
    .line 80
    .line 81
    cmp-long v0, v4, v6

    .line 82
    .line 83
    if-ltz v0, :cond_3

    .line 84
    .line 85
    const-string v0, "s6"

    .line 86
    .line 87
    invoke-static {v1, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    return-object v2

    .line 91
    :cond_3
    iget-object v0, v3, Lcom/p1/mobile/putong/data/CachedBuildInfoHash;->hash:Ljava/lang/String;

    .line 92
    .line 93
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    if-eqz v0, :cond_4

    .line 98
    .line 99
    const-string v0, "s7"

    .line 100
    .line 101
    invoke-static {v1, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    return-object v2

    .line 105
    :cond_4
    const-string v0, "s8"

    .line 106
    .line 107
    invoke-static {v1, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    iget-object v0, v3, Lcom/p1/mobile/putong/data/CachedBuildInfoHash;->hash:Ljava/lang/String;

    .line 111
    .line 112
    return-object v0

    .line 113
    :catch_0
    move-exception v0

    .line 114
    goto :goto_0

    .line 115
    :cond_5
    :try_start_1
    new-instance v0, Ljava/lang/Exception;

    .line 116
    .line 117
    const-string v3, "has null value in parsed data"

    .line 118
    .line 119
    invoke-direct {v0, v3}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    throw v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 123
    :goto_0
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 124
    .line 125
    .line 126
    const-string v0, "s4"

    .line 127
    .line 128
    invoke-static {v1, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    return-object v2
.end method

.method private getXmpNodes()Ll/bkj0;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/bkj0<",
            "Ljava/util/TreeMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/Boolean;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/api/api/Network;->xmpNodes:Ll/bkj0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/putong/api/api/Network;->prepareXmpXml()Ll/bkj0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    return-object v0
.end method

.method private getXmpXmlWhenGetCore(Ljava/util/TreeMap;Z)Ljava/util/TreeMap;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/TreeMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;Z)",
            "Ljava/util/TreeMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    const-string p0, "core_v2_"

    .line 2
    .line 3
    const-string v0, "start gxx"

    .line 4
    .line 5
    const-string v1, "[putong-common][upload]"

    .line 6
    .line 7
    invoke-static {v1, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const-string v0, "gx2"

    .line 11
    .line 12
    invoke-static {v1, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    if-eqz p2, :cond_2

    .line 16
    .line 17
    :try_start_0
    invoke-static {}, Ll/qzd;->j()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    const-string v0, ".ssn"

    .line 28
    .line 29
    invoke-virtual {p1, v0, p2}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :catch_0
    move-exception p2

    .line 34
    invoke-static {p2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    :goto_0
    :try_start_1
    sget-object p2, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 38
    .line 39
    new-instance v0, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    sget-object p0, Ll/uqb0;->c0:Ll/bn5;

    .line 45
    .line 46
    invoke-interface {p0}, Ll/bn5;->userId()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p2, p0}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    .line 66
    .line 67
    .line 68
    move-result p2

    .line 69
    if-eqz p2, :cond_1

    .line 70
    .line 71
    invoke-virtual {p0}, Ljava/io/File;->list()[Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    new-instance p2, Ll/jj20;

    .line 76
    .line 77
    invoke-direct {p2}, Ll/jj20;-><init>()V

    .line 78
    .line 79
    .line 80
    invoke-static {p0, p2}, Ll/jyb;->R([Ljava/lang/Object;Ll/qcj;)Ljava/util/ArrayList;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    new-instance p2, Ll/zi20;

    .line 85
    .line 86
    invoke-direct {p2}, Ll/zi20;-><init>()V

    .line 87
    .line 88
    .line 89
    invoke-static {p0, p2}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    new-instance p2, Ll/aj20;

    .line 94
    .line 95
    invoke-direct {p2}, Ll/aj20;-><init>()V

    .line 96
    .line 97
    .line 98
    invoke-static {p0, p2}, Ll/jyb;->I(Ljava/util/List;Ljava/util/Comparator;)V

    .line 99
    .line 100
    .line 101
    const-string p2, ".fs"

    .line 102
    .line 103
    const-string v0, " "

    .line 104
    .line 105
    invoke-static {p0, v0}, Ll/jyb;->U(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-virtual {p1, p2, v0}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    const-string p2, ".fs_count"

    .line 113
    .line 114
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 115
    .line 116
    .line 117
    move-result p0

    .line 118
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    invoke-virtual {p1, p2, p0}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 123
    .line 124
    .line 125
    goto :goto_1

    .line 126
    :catch_1
    move-exception p0

    .line 127
    new-instance p2, Ljava/lang/Exception;

    .line 128
    .line 129
    new-instance v0, Ljava/lang/StringBuilder;

    .line 130
    .line 131
    const-string v2, "Network exception:"

    .line 132
    .line 133
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    invoke-direct {p2, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    invoke-static {p2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 147
    .line 148
    .line 149
    :cond_1
    :goto_1
    const-string p0, "gx3"

    .line 150
    .line 151
    invoke-static {v1, p0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    :cond_2
    return-object p1
.end method

.method public static getXttClientInfo()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "{\"deviceToken\": \""

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/qzd;->a()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, "\"}"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    return-object v0
.end method

.method public static synthetic h(Ljava/lang/Boolean;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/api/api/Network;->lambda$createSmAntiFraudInit$8(Ljava/lang/Boolean;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static hasInvalidHash()Z
    .locals 4

    .line 1
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/api/api/Network;->hash:Lrx/subjects/a;

    .line 4
    .line 5
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    sget-object v2, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 16
    .line 17
    iget-wide v2, v2, Lcom/p1/mobile/putong/api/api/Network;->updateTimeInSinceDeviceBootRealMillis:J

    .line 18
    .line 19
    sub-long/2addr v0, v2

    .line 20
    const-wide/32 v2, 0x5265c00

    .line 21
    .line 22
    .line 23
    cmp-long v0, v0, v2

    .line 24
    .line 25
    if-lez v0, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 v0, 0x0

    .line 29
    return v0

    .line 30
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 31
    return v0
.end method

.method public static hash()Lrx/subjects/a;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/a<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/api/api/Network;->hash:Lrx/subjects/a;

    .line 4
    .line 5
    return-object v0
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/android/app/Act$r;)Lrx/c;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/api/api/Network;->lambda$uploadAdData$10(Lcom/p1/mobile/android/app/Act$r;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method private init(Ll/rg50$b;)V
    .locals 8
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "LogUseError"
        }
    .end annotation

    .line 1
    const-string v0, "[common][network]"

    .line 2
    .line 3
    const-string v1, "Network during call init first"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 9
    .line 10
    .line 11
    new-instance v1, Ll/ka5;

    .line 12
    .line 13
    invoke-direct {v1}, Ll/ka5;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, v1}, Ll/rg50$b;->a(Ll/azm;)Ll/rg50$b;

    .line 17
    .line 18
    .line 19
    const-wide/16 v1, 0xa

    .line 20
    .line 21
    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 22
    .line 23
    invoke-virtual {p1, v1, v2, v3}, Ll/rg50$b;->f(JLjava/util/concurrent/TimeUnit;)Ll/rg50$b;

    .line 24
    .line 25
    .line 26
    const-wide/16 v1, 0x28

    .line 27
    .line 28
    invoke-virtual {p1, v1, v2, v3}, Ll/rg50$b;->u(JLjava/util/concurrent/TimeUnit;)Ll/rg50$b;

    .line 29
    .line 30
    .line 31
    sget-object v1, Ll/qv5;->f:Ljava/lang/String;

    .line 32
    .line 33
    const-string v2, "https://"

    .line 34
    .line 35
    const-string v4, ""

    .line 36
    .line 37
    invoke-virtual {v1, v2, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    sget-object v5, Ll/qv5;->e:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v5, v2, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    sget-object v4, Ll/lhl;->INSTANCE:Ll/lhl;

    .line 48
    .line 49
    invoke-virtual {v4, v1}, Ll/lhl;->o(Ljava/lang/String;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v5

    .line 53
    invoke-virtual {v4, v2}, Ll/lhl;->o(Ljava/lang/String;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    iget-object v6, p0, Lcom/p1/mobile/putong/api/api/Network;->lastPins:Ljava/util/Set;

    .line 58
    .line 59
    const-string v7, "sha1/1S4TwavjSdrotJWU73w4Q2BkZr0="

    .line 60
    .line 61
    invoke-interface {v6, v7}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    iget-object v6, p0, Lcom/p1/mobile/putong/api/api/Network;->lastPins:Ljava/util/Set;

    .line 65
    .line 66
    const-string v7, "sha1/IQ8siffEzV0bgl441sZZO6aTda4="

    .line 67
    .line 68
    invoke-interface {v6, v7}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    iget-object v6, p0, Lcom/p1/mobile/putong/api/api/Network;->lastPins:Ljava/util/Set;

    .line 72
    .line 73
    const-string v7, "sha1/XoxTGCJgHVZx1mqgzGSgYAdD1ag="

    .line 74
    .line 75
    invoke-interface {v6, v7}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    iget-object v6, p0, Lcom/p1/mobile/putong/api/api/Network;->lastPins:Ljava/util/Set;

    .line 79
    .line 80
    const-string v7, "sha1/tFVQFINFH+6MoKEM9a/eOkxeEVk="

    .line 81
    .line 82
    invoke-interface {v6, v7}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    new-instance v6, Ljava/util/ArrayList;

    .line 86
    .line 87
    iget-object v7, p0, Lcom/p1/mobile/putong/api/api/Network;->lastPins:Ljava/util/Set;

    .line 88
    .line 89
    invoke-direct {v6, v7}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 90
    .line 91
    .line 92
    const/4 v7, 0x0

    .line 93
    new-array v7, v7, [Ljava/lang/String;

    .line 94
    .line 95
    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v6

    .line 99
    check-cast v6, [Ljava/lang/String;

    .line 100
    .line 101
    new-instance v7, Ll/xq4$a;

    .line 102
    .line 103
    invoke-direct {v7}, Ll/xq4$a;-><init>()V

    .line 104
    .line 105
    .line 106
    invoke-virtual {v7, v1, v6}, Ll/xq4$a;->a(Ljava/lang/String;[Ljava/lang/String;)Ll/xq4$a;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    invoke-virtual {v1, v2, v6}, Ll/xq4$a;->a(Ljava/lang/String;[Ljava/lang/String;)Ll/xq4$a;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    invoke-virtual {v1, v5, v6}, Ll/xq4$a;->a(Ljava/lang/String;[Ljava/lang/String;)Ll/xq4$a;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    invoke-virtual {v1, v4, v6}, Ll/xq4$a;->a(Ljava/lang/String;[Ljava/lang/String;)Ll/xq4$a;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    invoke-virtual {v1}, Ll/xq4$a;->b()Ll/xq4;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    invoke-virtual {p1, v1}, Ll/rg50$b;->e(Ll/xq4;)Ll/rg50$b;

    .line 127
    .line 128
    .line 129
    invoke-virtual {p1}, Ll/rg50$b;->c()Ll/rg50;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    iput-object v1, p0, Lcom/p1/mobile/putong/api/api/Network;->http:Ll/rg50;

    .line 134
    .line 135
    new-instance v2, Ll/j650;

    .line 136
    .line 137
    invoke-direct {v2, v1}, Ll/j650;-><init>(Ll/rg50;)V

    .line 138
    .line 139
    .line 140
    iput-object v2, p0, Lcom/p1/mobile/putong/api/api/Network;->httpProxy:Ll/j650;

    .line 141
    .line 142
    const-wide/16 v1, 0x78

    .line 143
    .line 144
    invoke-virtual {p1, v1, v2, v3}, Ll/rg50$b;->u(JLjava/util/concurrent/TimeUnit;)Ll/rg50$b;

    .line 145
    .line 146
    .line 147
    invoke-virtual {p1}, Ll/rg50$b;->c()Ll/rg50;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    iput-object p1, p0, Lcom/p1/mobile/putong/api/api/Network;->cloudHttp:Ll/rg50;

    .line 152
    .line 153
    const-string p1, "Network during call init last"

    .line 154
    .line 155
    invoke-static {v0, p1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 159
    .line 160
    .line 161
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->Y()Lrx/c;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    new-instance v0, Ll/hj20;

    .line 166
    .line 167
    invoke-direct {v0, p0}, Ll/hj20;-><init>(Lcom/p1/mobile/putong/api/api/Network;)V

    .line 168
    .line 169
    .line 170
    new-instance p0, Ll/ij20;

    .line 171
    .line 172
    invoke-direct {p0}, Ll/ij20;-><init>()V

    .line 173
    .line 174
    .line 175
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 176
    .line 177
    .line 178
    move-result-object p0

    .line 179
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 180
    .line 181
    .line 182
    return-void
.end method

.method public static inputStreamAfterCheck(Ll/i5d0;)Ljava/io/InputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/i5d0;->q()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0xcc

    .line 6
    .line 7
    if-eq v0, v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/i5d0;->k()Ll/k5d0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ll/k5d0;->byteStream()Ljava/io/InputStream;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return-object p0
.end method

.method public static isConnected(Landroid/content/Context;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    :try_start_0
    const-string v1, "connectivity"

    .line 7
    .line 8
    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Landroid/net/ConnectivityManager;

    .line 13
    .line 14
    if-nez p0, :cond_0

    .line 15
    .line 16
    return v0

    .line 17
    :cond_0
    invoke-virtual {p0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/net/NetworkInfo;->isConnected()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    sget-object v1, Landroid/net/NetworkInfo$State;->CONNECTED:Landroid/net/NetworkInfo$State;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    .line 35
    if-ne p0, v1, :cond_1

    .line 36
    .line 37
    const/4 p0, 0x1

    .line 38
    return p0

    .line 39
    :catch_0
    move-exception p0

    .line 40
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 41
    .line 42
    .line 43
    :cond_1
    return v0
.end method

.method public static synthetic j(Ljava/util/TreeMap;Landroid/os/HandlerThread;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/api/api/Network;->lambda$smAntiFraudInit$9(Ljava/util/TreeMap;Landroid/os/HandlerThread;)V

    return-void
.end method

.method public static synthetic k(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method private static synthetic lambda$createSmAntiFraudInit$8(Ljava/lang/Boolean;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/ishumei/smantifraud/SmAntiFraud;->getBase()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    const-string p0, ""

    .line 13
    .line 14
    return-object p0
.end method

.method private synthetic lambda$debug_setProxy$2()Ll/rg50$b;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/api/api/Network;->http:Ll/rg50;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/rg50;->v()Ll/rg50$b;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Ljava/net/Proxy;

    .line 8
    .line 9
    sget-object v1, Ljava/net/Proxy$Type;->HTTP:Ljava/net/Proxy$Type;

    .line 10
    .line 11
    new-instance v2, Ljava/net/InetSocketAddress;

    .line 12
    .line 13
    const-string v3, "proxy.p1staff.com"

    .line 14
    .line 15
    invoke-static {v3}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    const/16 v4, 0x539

    .line 20
    .line 21
    invoke-direct {v2, v3, v4}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    .line 22
    .line 23
    .line 24
    invoke-direct {v0, v1, v2}, Ljava/net/Proxy;-><init>(Ljava/net/Proxy$Type;Ljava/net/SocketAddress;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, v0}, Ll/rg50$b;->s(Ljava/net/Proxy;)Ll/rg50$b;

    .line 28
    .line 29
    .line 30
    return-object p0
.end method

.method private synthetic lambda$debug_setProxy$3(Ll/rg50$b;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ll/rg50$b;->c()Ll/rg50;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/api/api/Network;->http:Ll/rg50;

    .line 6
    .line 7
    const-wide/16 v0, 0x78

    .line 8
    .line 9
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 10
    .line 11
    invoke-virtual {p1, v0, v1, v2}, Ll/rg50$b;->u(JLjava/util/concurrent/TimeUnit;)Ll/rg50$b;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1}, Ll/rg50$b;->c()Ll/rg50;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/api/api/Network;->cloudHttp:Ll/rg50;

    .line 19
    .line 20
    return-void
.end method

.method private synthetic lambda$init$0(Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;)V
    .locals 14

    .line 1
    const-string p1, ""

    .line 2
    .line 3
    const-string v0, "https://"

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "metaInfo"

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-eqz v2, :cond_0

    .line 20
    .line 21
    goto/16 :goto_5

    .line 22
    .line 23
    :cond_0
    const-string v2, "metaInfo1"

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    if-eqz v3, :cond_4

    .line 30
    .line 31
    const-string v3, "metaInfo2"

    .line 32
    .line 33
    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    if-nez v4, :cond_1

    .line 38
    .line 39
    goto/16 :goto_5

    .line 40
    .line 41
    :cond_1
    const-string v4, "Network add meteInfo ="

    .line 42
    .line 43
    invoke-virtual {v4, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    const-string v5, "[common][network]"

    .line 48
    .line 49
    invoke-static {v5, v4}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    :try_start_0
    new-instance v4, Lorg/json/JSONObject;

    .line 53
    .line 54
    invoke-direct {v4, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v4, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-virtual {v4, v3}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    new-instance v6, Ll/pmw;

    .line 70
    .line 71
    sget-object v7, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 72
    .line 73
    invoke-direct {v6, v2, v7}, Ll/pmw;-><init>(Ljava/lang/String;Landroid/app/Application;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 74
    .line 75
    .line 76
    const/4 v7, 0x1

    .line 77
    :try_start_1
    const-class v8, Ll/pmw;

    .line 78
    .line 79
    const-string v9, "a"

    .line 80
    .line 81
    invoke-virtual {v8, v9}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 82
    .line 83
    .line 84
    move-result-object v8

    .line 85
    invoke-virtual {v8, v7}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v8, v6, v2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/NoSuchFieldException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 89
    .line 90
    .line 91
    goto :goto_1

    .line 92
    :catchall_0
    move-exception p0

    .line 93
    goto/16 :goto_4

    .line 94
    .line 95
    :catch_0
    move-exception v2

    .line 96
    goto :goto_0

    .line 97
    :catch_1
    move-exception v2

    .line 98
    :goto_0
    :try_start_2
    new-instance v8, Ljava/lang/RuntimeException;

    .line 99
    .line 100
    const-string v9, "Failed to set MMCrypto.publicKey via reflection"

    .line 101
    .line 102
    invoke-direct {v8, v9, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 103
    .line 104
    .line 105
    invoke-static {v8}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 106
    .line 107
    .line 108
    :goto_1
    const/4 v2, 0x0

    .line 109
    move v8, v2

    .line 110
    move v9, v8

    .line 111
    :goto_2
    if-ge v8, v4, :cond_3

    .line 112
    .line 113
    :try_start_3
    invoke-virtual {v3, v8}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v10

    .line 117
    invoke-virtual {v6, v10}, Ll/pmw;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v10

    .line 121
    new-instance v11, Ljava/lang/StringBuilder;

    .line 122
    .line 123
    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    .line 124
    .line 125
    .line 126
    const-string v12, "Network getInitDecryptData result\uff1a"

    .line 127
    .line 128
    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v11

    .line 138
    invoke-static {v5, v11}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    iget-object v11, p0, Lcom/p1/mobile/putong/api/api/Network;->lastPins:Ljava/util/Set;

    .line 142
    .line 143
    invoke-interface {v11, v10}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    move-result v11

    .line 147
    if-nez v11, :cond_2

    .line 148
    .line 149
    iget-object v11, p0, Lcom/p1/mobile/putong/api/api/Network;->lastPins:Ljava/util/Set;

    .line 150
    .line 151
    invoke-interface {v11, v10}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 152
    .line 153
    .line 154
    move v9, v7

    .line 155
    goto :goto_3

    .line 156
    :catchall_1
    move-exception v10

    .line 157
    :try_start_4
    new-instance v11, Ljava/lang/RuntimeException;

    .line 158
    .line 159
    new-instance v12, Ljava/lang/StringBuilder;

    .line 160
    .line 161
    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    .line 162
    .line 163
    .line 164
    const-string v13, "Network getData error i="

    .line 165
    .line 166
    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    const-string v13, " , metaInfo = "

    .line 173
    .line 174
    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 175
    .line 176
    .line 177
    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object v12

    .line 184
    invoke-direct {v11, v12, v10}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 185
    .line 186
    .line 187
    invoke-static {v11}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 188
    .line 189
    .line 190
    :cond_2
    :goto_3
    add-int/lit8 v8, v8, 0x1

    .line 191
    .line 192
    goto :goto_2

    .line 193
    :cond_3
    if-eqz v9, :cond_4

    .line 194
    .line 195
    sget-object v3, Ll/qv5;->f:Ljava/lang/String;

    .line 196
    .line 197
    invoke-virtual {v3, v0, p1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object v3

    .line 201
    sget-object v4, Ll/qv5;->e:Ljava/lang/String;

    .line 202
    .line 203
    invoke-virtual {v4, v0, p1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object p1

    .line 207
    sget-object v0, Ll/lhl;->INSTANCE:Ll/lhl;

    .line 208
    .line 209
    invoke-virtual {v0, v3}, Ll/lhl;->o(Ljava/lang/String;)Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object v4

    .line 213
    invoke-virtual {v0, p1}, Ll/lhl;->o(Ljava/lang/String;)Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object v0

    .line 217
    new-instance v5, Ljava/util/ArrayList;

    .line 218
    .line 219
    iget-object v6, p0, Lcom/p1/mobile/putong/api/api/Network;->lastPins:Ljava/util/Set;

    .line 220
    .line 221
    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 222
    .line 223
    .line 224
    new-array v2, v2, [Ljava/lang/String;

    .line 225
    .line 226
    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 227
    .line 228
    .line 229
    move-result-object v2

    .line 230
    check-cast v2, [Ljava/lang/String;

    .line 231
    .line 232
    iget-object p0, p0, Lcom/p1/mobile/putong/api/api/Network;->httpProxy:Ll/j650;

    .line 233
    .line 234
    new-instance v5, Ll/xq4$a;

    .line 235
    .line 236
    invoke-direct {v5}, Ll/xq4$a;-><init>()V

    .line 237
    .line 238
    .line 239
    invoke-virtual {v5, v3, v2}, Ll/xq4$a;->a(Ljava/lang/String;[Ljava/lang/String;)Ll/xq4$a;

    .line 240
    .line 241
    .line 242
    move-result-object v3

    .line 243
    invoke-virtual {v3, p1, v2}, Ll/xq4$a;->a(Ljava/lang/String;[Ljava/lang/String;)Ll/xq4$a;

    .line 244
    .line 245
    .line 246
    move-result-object p1

    .line 247
    invoke-virtual {p1, v4, v2}, Ll/xq4$a;->a(Ljava/lang/String;[Ljava/lang/String;)Ll/xq4$a;

    .line 248
    .line 249
    .line 250
    move-result-object p1

    .line 251
    invoke-virtual {p1, v0, v2}, Ll/xq4$a;->a(Ljava/lang/String;[Ljava/lang/String;)Ll/xq4$a;

    .line 252
    .line 253
    .line 254
    move-result-object p1

    .line 255
    invoke-virtual {p1}, Ll/xq4$a;->b()Ll/xq4;

    .line 256
    .line 257
    .line 258
    move-result-object p1

    .line 259
    invoke-virtual {p0, p1}, Ll/j650;->f(Ll/xq4;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 260
    .line 261
    .line 262
    goto :goto_5

    .line 263
    :goto_4
    new-instance p1, Ljava/lang/RuntimeException;

    .line 264
    .line 265
    const-string v0, "Network handle metaInfo error metaInfo = "

    .line 266
    .line 267
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 268
    .line 269
    .line 270
    move-result-object v0

    .line 271
    invoke-direct {p1, v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 272
    .line 273
    .line 274
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 275
    .line 276
    .line 277
    :cond_4
    :goto_5
    return-void
.end method

.method private static synthetic lambda$smAntiFraudInit$9(Ljava/util/TreeMap;Landroid/os/HandlerThread;)V
    .locals 3

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    :try_start_0
    sget-object v1, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-nez v2, :cond_0

    .line 10
    .line 11
    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const-string v2, "samsung"

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catchall_0
    move-exception v1

    .line 22
    goto :goto_2

    .line 23
    :catch_0
    move-exception v1

    .line 24
    goto :goto_1

    .line 25
    :cond_0
    :goto_0
    invoke-static {}, Lcom/ishumei/smantifraud/SmAntiFraud;->getBase()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    monitor-enter p0

    .line 30
    :try_start_1
    const-string v1, "smnd"

    .line 31
    .line 32
    invoke-virtual {p0, v1, v0}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 36
    .line 37
    .line 38
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 39
    invoke-virtual {p1}, Landroid/os/HandlerThread;->quit()Z

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :catchall_1
    move-exception p1

    .line 44
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 45
    throw p1

    .line 46
    :goto_1
    :try_start_3
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 47
    .line 48
    .line 49
    monitor-enter p0

    .line 50
    :try_start_4
    const-string v1, "smnd"

    .line 51
    .line 52
    invoke-virtual {p0, v1, v0}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 56
    .line 57
    .line 58
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 59
    invoke-virtual {p1}, Landroid/os/HandlerThread;->quit()Z

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :catchall_2
    move-exception p1

    .line 64
    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 65
    throw p1

    .line 66
    :goto_2
    monitor-enter p0

    .line 67
    :try_start_6
    const-string v2, "smnd"

    .line 68
    .line 69
    invoke-virtual {p0, v2, v0}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 73
    .line 74
    .line 75
    monitor-exit p0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 76
    invoke-virtual {p1}, Landroid/os/HandlerThread;->quit()Z

    .line 77
    .line 78
    .line 79
    throw v1

    .line 80
    :catchall_3
    move-exception p1

    .line 81
    :try_start_7
    monitor-exit p0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 82
    throw p1
.end method

.method private synthetic lambda$uploadAdData$10(Lcom/p1/mobile/android/app/Act$r;)Lrx/c;
    .locals 1

    .line 1
    const-string p1, "[putong-common][upload]"

    .line 2
    .line 3
    const-string v0, "px7"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/p1/mobile/putong/api/api/Network;->createSmAntiFraudInit()Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method private synthetic lambda$uploadAdData$11(Ljava/lang/String;)V
    .locals 18

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    const-string v2, ""

    .line 4
    .line 5
    const-string v3, "smnd"

    .line 6
    .line 7
    const-string v4, "UTF-8"

    .line 8
    .line 9
    const-string v0, "px8"

    .line 10
    .line 11
    const-string v5, "[putong-common][upload]"

    .line 12
    .line 13
    invoke-static {v5, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const/4 v6, 0x0

    .line 17
    move v7, v6

    .line 18
    :goto_0
    const/4 v0, 0x5

    .line 19
    if-ge v7, v0, :cond_8

    .line 20
    .line 21
    :try_start_0
    const-string v0, "s-uad1"

    .line 22
    .line 23
    invoke-static {v5, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-direct {v1}, Lcom/p1/mobile/putong/api/api/Network;->getXmpNodes()Ll/bkj0;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v8, v0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 31
    .line 32
    check-cast v8, Ljava/util/TreeMap;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_7

    .line 33
    .line 34
    move-object/from16 v9, p1

    .line 35
    .line 36
    :try_start_1
    invoke-virtual {v8, v3, v9}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    iget-object v8, v0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 40
    .line 41
    check-cast v8, Ljava/util/TreeMap;

    .line 42
    .line 43
    iget-object v0, v0, Ll/bkj0;->b:Ljava/lang/Object;

    .line 44
    .line 45
    check-cast v0, Ljava/lang/Boolean;

    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    invoke-direct {v1, v8, v0}, Lcom/p1/mobile/putong/api/api/Network;->getXmpXmlWhenGetCore(Ljava/util/TreeMap;Z)Ljava/util/TreeMap;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    sget-object v8, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 56
    .line 57
    invoke-virtual {v8}, Lcom/tantanapp/common/data/JsonAdapter;->MAP_ADAPTER()Lcom/tantanapp/common/data/JsonAdapter;

    .line 58
    .line 59
    .line 60
    move-result-object v10

    .line 61
    invoke-virtual {v10, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v10
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 65
    :try_start_2
    new-instance v11, Ljava/util/TreeMap;

    .line 66
    .line 67
    invoke-direct {v11, v0}, Ljava/util/TreeMap;-><init>(Ljava/util/SortedMap;)V

    .line 68
    .line 69
    .line 70
    const-string v0, ".fs_count"

    .line 71
    .line 72
    invoke-virtual {v11, v0}, Ljava/util/TreeMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    const-string v0, ".ignore"

    .line 76
    .line 77
    invoke-virtual {v11, v0}, Ljava/util/TreeMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    const-string v0, ".fs"

    .line 81
    .line 82
    invoke-virtual {v11, v0}, Ljava/util/TreeMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v11, v3}, Ljava/util/TreeMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v8}, Lcom/tantanapp/common/data/JsonAdapter;->MAP_ADAPTER()Lcom/tantanapp/common/data/JsonAdapter;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-virtual {v0, v11}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v0
    :try_end_2
    .catch Ljava/util/NoSuchElementException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 96
    goto :goto_2

    .line 97
    :catch_0
    move-exception v0

    .line 98
    :goto_1
    move-object/from16 v17, v2

    .line 99
    .line 100
    goto/16 :goto_c

    .line 101
    .line 102
    :catch_1
    move-object v0, v2

    .line 103
    :goto_2
    :try_start_3
    invoke-virtual {v10, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 104
    .line 105
    .line 106
    move-result-object v8

    .line 107
    invoke-static {v8}, Ll/iiw;->b([B)[B

    .line 108
    .line 109
    .line 110
    move-result-object v8

    .line 111
    const/4 v11, 0x2

    .line 112
    invoke-static {v8, v11}, Ll/te2;->c([BI)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v8

    .line 116
    invoke-virtual {v0, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-static {v0}, Ll/iiw;->b([B)[B

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    invoke-static {v0, v11}, Ll/te2;->c([BI)Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    invoke-static {}, Lcom/p1/mobile/putong/api/api/Network;->getValidDiskHashForCurrentAccessToken()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v11

    .line 132
    const/4 v12, 0x1

    .line 133
    if-nez v11, :cond_0

    .line 134
    .line 135
    const-string v11, "not use sh1"

    .line 136
    .line 137
    invoke-static {v5, v11}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    goto :goto_3

    .line 141
    :cond_0
    new-instance v13, Ljava/lang/StringBuilder;

    .line 142
    .line 143
    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    .line 144
    .line 145
    .line 146
    const-string v14, "ad1:"

    .line 147
    .line 148
    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    const-string v14, " cache1"

    .line 155
    .line 156
    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v13

    .line 166
    invoke-static {v5, v13}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {v11, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 170
    .line 171
    .line 172
    move-result v11

    .line 173
    xor-int/2addr v12, v11

    .line 174
    :goto_3
    if-eqz v12, :cond_6

    .line 175
    .line 176
    const-string v11, "SFOrmGZS_zkM5uv7ACBbYKyNLxTYdVlC"

    .line 177
    .line 178
    invoke-virtual {v11, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 179
    .line 180
    .line 181
    move-result-object v11

    .line 182
    invoke-static {v10}, Ll/rjj;->a(Ljava/lang/String;)[B

    .line 183
    .line 184
    .line 185
    move-result-object v10

    .line 186
    new-instance v12, Ljava/util/Random;

    .line 187
    .line 188
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 189
    .line 190
    .line 191
    move-result-wide v13

    .line 192
    const-wide/16 v15, 0xd5

    .line 193
    .line 194
    add-long/2addr v13, v15

    .line 195
    invoke-direct {v12, v13, v14}, Ljava/util/Random;-><init>(J)V

    .line 196
    .line 197
    .line 198
    const/16 v13, 0x10

    .line 199
    .line 200
    new-array v13, v13, [B

    .line 201
    .line 202
    invoke-virtual {v12, v13}, Ljava/util/Random;->nextBytes([B)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 203
    .line 204
    .line 205
    :try_start_4
    invoke-static {v11, v10, v13}, Ll/xi20;->a([B[B[B)Lcom/p1/mobile/putong/api/api/NKResult;

    .line 206
    .line 207
    .line 208
    move-result-object v10
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_6

    .line 209
    :try_start_5
    iget-object v11, v10, Lcom/p1/mobile/putong/api/api/NKResult;->iv:[B

    .line 210
    .line 211
    array-length v12, v11

    .line 212
    iget-object v13, v10, Lcom/p1/mobile/putong/api/api/NKResult;->res:[B

    .line 213
    .line 214
    array-length v13, v13

    .line 215
    add-int/2addr v12, v13

    .line 216
    new-array v12, v12, [B

    .line 217
    .line 218
    array-length v13, v11

    .line 219
    invoke-static {v11, v6, v12, v6, v13}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 220
    .line 221
    .line 222
    iget-object v11, v10, Lcom/p1/mobile/putong/api/api/NKResult;->res:[B

    .line 223
    .line 224
    iget-object v10, v10, Lcom/p1/mobile/putong/api/api/NKResult;->iv:[B

    .line 225
    .line 226
    array-length v10, v10

    .line 227
    array-length v13, v11

    .line 228
    invoke-static {v11, v6, v12, v10, v13}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 229
    .line 230
    .line 231
    const-string v10, "/ad-data"

    .line 232
    .line 233
    invoke-static {v10}, Ll/xi5;->i(Ljava/lang/String;)Ljava/lang/String;

    .line 234
    .line 235
    .line 236
    move-result-object v10

    .line 237
    const-string v11, "application/octet-stream"

    .line 238
    .line 239
    invoke-static {v11}, Ll/e7y;->d(Ljava/lang/String;)Ll/e7y;

    .line 240
    .line 241
    .line 242
    move-result-object v11

    .line 243
    invoke-static {v11, v12}, Ll/z1d0;->create(Ll/e7y;[B)Ll/z1d0;

    .line 244
    .line 245
    .line 246
    move-result-object v11
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    .line 247
    :try_start_6
    invoke-virtual {v1}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 248
    .line 249
    .line 250
    move-result-wide v13

    .line 251
    invoke-static {v13, v14}, Lcom/p1/mobile/putong/api/api/TimeConverter;->switchTime(J)J

    .line 252
    .line 253
    .line 254
    move-result-wide v13

    .line 255
    invoke-static {v13, v14}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 256
    .line 257
    .line 258
    move-result-object v13

    .line 259
    invoke-virtual {v1}, Lcom/p1/mobile/putong/api/api/Network;->common()Ll/x1d0$a;

    .line 260
    .line 261
    .line 262
    move-result-object v14

    .line 263
    invoke-virtual {v14, v10}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 264
    .line 265
    .line 266
    move-result-object v14

    .line 267
    const-string v15, "Authorization"

    .line 268
    .line 269
    new-instance v6, Ljava/lang/StringBuilder;

    .line 270
    .line 271
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_6
    .catch Ljava/lang/IllegalArgumentException; {:try_start_6 .. :try_end_6} :catch_5
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0

    .line 272
    .line 273
    .line 274
    move-object/from16 v17, v2

    .line 275
    .line 276
    :try_start_7
    const-string v2, "MAC "

    .line 277
    .line 278
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 279
    .line 280
    .line 281
    invoke-direct {v1, v10, v13, v8, v11}, Lcom/p1/mobile/putong/api/api/Network;->authToken(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/z1d0;)Ljava/lang/String;

    .line 282
    .line 283
    .line 284
    move-result-object v2

    .line 285
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 286
    .line 287
    .line 288
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 289
    .line 290
    .line 291
    move-result-object v2

    .line 292
    invoke-virtual {v14, v15, v2}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 293
    .line 294
    .line 295
    move-result-object v2

    .line 296
    invoke-virtual {v2, v11}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 297
    .line 298
    .line 299
    move-result-object v2

    .line 300
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 301
    .line 302
    .line 303
    move-result-object v6

    .line 304
    if-nez v6, :cond_1

    .line 305
    .line 306
    const-string v6, "Client-State"

    .line 307
    .line 308
    const-string v11, "background"

    .line 309
    .line 310
    invoke-virtual {v2, v6, v11}, Ll/x1d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;
    :try_end_7
    .catch Ljava/lang/IllegalArgumentException; {:try_start_7 .. :try_end_7} :catch_3
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_2

    .line 311
    .line 312
    .line 313
    goto :goto_4

    .line 314
    :catch_2
    move-exception v0

    .line 315
    goto/16 :goto_c

    .line 316
    .line 317
    :catch_3
    move-exception v0

    .line 318
    goto :goto_8

    .line 319
    :cond_1
    :goto_4
    const/4 v6, 0x0

    .line 320
    const/4 v8, 0x0

    .line 321
    :goto_5
    const/16 v10, 0xa

    .line 322
    .line 323
    if-ge v8, v10, :cond_2

    .line 324
    .line 325
    :try_start_8
    iget-object v10, v1, Lcom/p1/mobile/putong/api/api/Network;->http:Ll/rg50;

    .line 326
    .line 327
    invoke-virtual {v2}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 328
    .line 329
    .line 330
    move-result-object v11

    .line 331
    invoke-virtual {v10, v11}, Ll/rg50;->a(Ll/x1d0;)Ll/ry3;

    .line 332
    .line 333
    .line 334
    move-result-object v10

    .line 335
    invoke-interface {v10}, Ll/ry3;->execute()Ll/i5d0;

    .line 336
    .line 337
    .line 338
    move-result-object v6
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_4
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 339
    add-int/lit8 v8, v8, 0xb

    .line 340
    .line 341
    goto :goto_5

    .line 342
    :catchall_0
    move-exception v0

    .line 343
    goto :goto_6

    .line 344
    :catch_4
    add-int/lit8 v8, v8, 0x1

    .line 345
    .line 346
    goto :goto_5

    .line 347
    :cond_2
    if-eqz v6, :cond_4

    .line 348
    .line 349
    :try_start_9
    const-string v2, "Date"

    .line 350
    .line 351
    invoke-virtual {v6, v2}, Ll/i5d0;->u(Ljava/lang/String;)Ljava/lang/String;

    .line 352
    .line 353
    .line 354
    move-result-object v2

    .line 355
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/api/api/Network;->updateServerTime(Ljava/lang/String;)V

    .line 356
    .line 357
    .line 358
    invoke-static {v6}, Lcom/tantanapp/common/network/ExceptionChecker;->check(Ll/i5d0;)Ljava/lang/Exception;

    .line 359
    .line 360
    .line 361
    move-result-object v2

    .line 362
    if-nez v2, :cond_3

    .line 363
    .line 364
    goto :goto_7

    .line 365
    :cond_3
    throw v2
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 366
    :goto_6
    :try_start_a
    invoke-static {v6}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 367
    .line 368
    .line 369
    throw v0

    .line 370
    :cond_4
    :goto_7
    invoke-static {v6}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 371
    .line 372
    .line 373
    const/16 v2, 0xb

    .line 374
    .line 375
    if-lt v8, v2, :cond_7

    .line 376
    .line 377
    sget-object v2, Ll/uqb0;->c0:Ll/bn5;

    .line 378
    .line 379
    invoke-interface {v2}, Ll/bn5;->accessToken()Ljava/lang/String;

    .line 380
    .line 381
    .line 382
    move-result-object v2

    .line 383
    invoke-static {v2, v0}, Lcom/p1/mobile/putong/api/api/Network;->cacheBuildInfoHash(Ljava/lang/String;Ljava/lang/String;)Z

    .line 384
    .line 385
    .line 386
    goto/16 :goto_a

    .line 387
    .line 388
    :catch_5
    move-exception v0

    .line 389
    move-object/from16 v17, v2

    .line 390
    .line 391
    :goto_8
    const/16 v2, 0x64

    .line 392
    .line 393
    invoke-static {v0, v2}, Lcom/tantanapp/common/utils/CrashHelper;->d(Ljava/lang/Throwable;I)V

    .line 394
    .line 395
    .line 396
    new-instance v2, Ljava/lang/String;

    .line 397
    .line 398
    invoke-direct {v2, v12}, Ljava/lang/String;-><init>([B)V

    .line 399
    .line 400
    .line 401
    new-instance v6, Ljava/lang/StringBuilder;

    .line 402
    .line 403
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 404
    .line 405
    .line 406
    const-string v11, "uploadAdData::generate authToken failed::urlStr="

    .line 407
    .line 408
    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 409
    .line 410
    .line 411
    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 412
    .line 413
    .line 414
    const-string v10, "::uploadTempHash="

    .line 415
    .line 416
    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 417
    .line 418
    .line 419
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 420
    .line 421
    .line 422
    const-string v8, "::c="

    .line 423
    .line 424
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 425
    .line 426
    .line 427
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 428
    .line 429
    .line 430
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 431
    .line 432
    .line 433
    move-result-object v2

    .line 434
    invoke-static {v5, v2}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 435
    .line 436
    .line 437
    new-instance v2, Lcom/tantanapp/common/network/NetIgnoredException;

    .line 438
    .line 439
    new-instance v6, Lcom/tantanapp/common/network/NetIgnoredException;

    .line 440
    .line 441
    invoke-direct {v6, v0}, Lcom/tantanapp/common/network/NetIgnoredException;-><init>(Ljava/lang/Exception;)V

    .line 442
    .line 443
    .line 444
    invoke-direct {v2, v6}, Lcom/tantanapp/common/network/NetIgnoredException;-><init>(Ljava/lang/Exception;)V

    .line 445
    .line 446
    .line 447
    throw v2

    .line 448
    :catch_6
    move-exception v0

    .line 449
    move-object/from16 v17, v2

    .line 450
    .line 451
    const/16 v2, 0x32

    .line 452
    .line 453
    invoke-static {v0, v2}, Lcom/tantanapp/common/utils/CrashHelper;->d(Ljava/lang/Throwable;I)V

    .line 454
    .line 455
    .line 456
    if-eqz v10, :cond_5

    .line 457
    .line 458
    array-length v2, v10

    .line 459
    if-lez v2, :cond_5

    .line 460
    .line 461
    new-instance v2, Ljava/lang/String;

    .line 462
    .line 463
    invoke-direct {v2, v10}, Ljava/lang/String;-><init>([B)V

    .line 464
    .line 465
    .line 466
    goto :goto_9

    .line 467
    :cond_5
    move-object/from16 v2, v17

    .line 468
    .line 469
    :goto_9
    new-instance v6, Ljava/lang/String;

    .line 470
    .line 471
    invoke-direct {v6, v13}, Ljava/lang/String;-><init>([B)V

    .line 472
    .line 473
    .line 474
    new-instance v8, Ljava/lang/StringBuilder;

    .line 475
    .line 476
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 477
    .line 478
    .line 479
    const-string v10, "uploadAdData::TantanApp.pluginApi.generateKey failed::clear="

    .line 480
    .line 481
    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 482
    .line 483
    .line 484
    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 485
    .line 486
    .line 487
    const-string v2, "::ivBytes="

    .line 488
    .line 489
    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 490
    .line 491
    .line 492
    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 493
    .line 494
    .line 495
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 496
    .line 497
    .line 498
    move-result-object v2

    .line 499
    invoke-static {v5, v2}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 500
    .line 501
    .line 502
    new-instance v2, Lcom/tantanapp/common/network/NetIgnoredException;

    .line 503
    .line 504
    new-instance v6, Lcom/tantanapp/common/network/NetIgnoredException;

    .line 505
    .line 506
    invoke-direct {v6, v0}, Lcom/tantanapp/common/network/NetIgnoredException;-><init>(Ljava/lang/Exception;)V

    .line 507
    .line 508
    .line 509
    invoke-direct {v2, v6}, Lcom/tantanapp/common/network/NetIgnoredException;-><init>(Ljava/lang/Exception;)V

    .line 510
    .line 511
    .line 512
    throw v2
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_2

    .line 513
    :cond_6
    move-object/from16 v17, v2

    .line 514
    .line 515
    :cond_7
    :goto_a
    add-int/lit8 v7, v7, 0x5

    .line 516
    .line 517
    :goto_b
    move-object/from16 v2, v17

    .line 518
    .line 519
    const/4 v6, 0x0

    .line 520
    goto/16 :goto_0

    .line 521
    .line 522
    :catch_7
    move-exception v0

    .line 523
    move-object/from16 v9, p1

    .line 524
    .line 525
    goto/16 :goto_1

    .line 526
    .line 527
    :goto_c
    const-string v2, "uploadAdData::upload ad-data failed"

    .line 528
    .line 529
    invoke-static {v5, v2}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 530
    .line 531
    .line 532
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 533
    .line 534
    .line 535
    add-int/lit8 v7, v7, 0x1

    .line 536
    .line 537
    goto :goto_b

    .line 538
    :cond_8
    return-void
.end method

.method public static language()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Ll/ak20;->f()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method private mayAddLocationHeader(Ll/rnl;Ll/x1d0$a;Ljava/lang/String;)Ll/x1d0$a;
    .locals 0

    .line 1
    invoke-static {p2, p3}, Lcom/p1/mobile/putong/api/api/Network;->addLocationHeader(Ll/x1d0$a;Ljava/lang/String;)Ll/x1d0$a;

    .line 2
    .line 3
    .line 4
    return-object p2
.end method

.method private mayEncryptBody(Ll/x1d0;Ll/x1d0$a;Ljava/lang/String;)Ll/x1d0;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/f1f;->l()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, "X-Janus-Response-flat"

    .line 8
    .line 9
    const-string p1, "1"

    .line 10
    .line 11
    invoke-virtual {p2, p0, p1}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    :cond_0
    invoke-virtual {p1}, Ll/x1d0;->k()Ll/rnl;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {p0}, Ll/f1f;->m(Ll/rnl;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_1

    .line 28
    .line 29
    invoke-virtual {p1}, Ll/x1d0;->a()Ll/z1d0;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-static {p0}, Ll/f1f;->k(Ll/z1d0;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    invoke-static {p0, p3}, Ll/f1f;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p1}, Ll/x1d0;->g()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    sget-object p3, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 52
    .line 53
    invoke-static {p3, p0}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p2, p1, p0}, Ll/x1d0$a;->j(Ljava/lang/String;Ll/z1d0;)Ll/x1d0$a;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    return-object p0

    .line 66
    :cond_1
    return-object p1
.end method

.method public static mkString2(Ljava/util/Collection;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Collection<",
            "TT;>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_2

    .line 19
    .line 20
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method

.method private prepareSimpleXml()Ll/bkj0;
    .locals 132
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/bkj0<",
            "Ljava/util/TreeMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/Boolean;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 1
    const-string v1, "Network exception:"

    .line 2
    .line 3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 4
    .line 5
    .line 6
    new-instance v2, Ljava/util/TreeMap;

    .line 7
    .line 8
    invoke-direct {v2}, Ljava/util/TreeMap;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 12
    .line 13
    .line 14
    move-result-wide v3

    .line 15
    const-string v129, "wifi.supplicant_scan_interval"

    .line 16
    .line 17
    const-string v130, "wlan.driver.status"

    .line 18
    .line 19
    const-string v5, "af.fast_track_multiplier"

    .line 20
    .line 21
    const-string v6, "debug.atrace.tags.enableflags"

    .line 22
    .line 23
    const-string v7, "dev.bootcomplete"

    .line 24
    .line 25
    const-string v8, "drm.service.enabled"

    .line 26
    .line 27
    const-string v9, "gsm.current.phone-type"

    .line 28
    .line 29
    const-string v10, "gsm.network.type"

    .line 30
    .line 31
    const-string v11, "gsm.operator.alpha"

    .line 32
    .line 33
    const-string v12, "gsm.operator.iso-country"

    .line 34
    .line 35
    const-string v13, "gsm.operator.isroaming"

    .line 36
    .line 37
    const-string v14, "gsm.operator.numeric"

    .line 38
    .line 39
    const-string v15, "gsm.sim.operator.alpha"

    .line 40
    .line 41
    const-string v16, "gsm.sim.operator.iso-country"

    .line 42
    .line 43
    const-string v17, "gsm.sim.operator.numeric"

    .line 44
    .line 45
    const-string v18, "gsm.sim.state"

    .line 46
    .line 47
    const-string v19, "gsm.version.baseband"

    .line 48
    .line 49
    const-string v20, "gsm.version.ril-impl"

    .line 50
    .line 51
    const-string v21, "keyguard.no_require_sim"

    .line 52
    .line 53
    const-string v22, "media.aac_51_output_enabled"

    .line 54
    .line 55
    const-string v23, "net.bt.name"

    .line 56
    .line 57
    const-string v24, "net.change"

    .line 58
    .line 59
    const-string v25, "net.dns1"

    .line 60
    .line 61
    const-string v26, "net.dns2"

    .line 62
    .line 63
    const-string v27, "net.dns3"

    .line 64
    .line 65
    const-string v28, "net.hostname"

    .line 66
    .line 67
    const-string v29, "net.qtaguid_enabled"

    .line 68
    .line 69
    const-string v30, "net.tcp.default_init_rwnd"

    .line 70
    .line 71
    const-string v31, "ril.ecclist"

    .line 72
    .line 73
    const-string v32, "rild.libpath"

    .line 74
    .line 75
    const-string v33, "ro.adb.secure"

    .line 76
    .line 77
    const-string v34, "ro.allow.mock.location"

    .line 78
    .line 79
    const-string v35, "ro.baseband"

    .line 80
    .line 81
    const-string v36, "ro.board.platform"

    .line 82
    .line 83
    const-string v37, "ro.boot.baseband"

    .line 84
    .line 85
    const-string v38, "ro.boot.bootloader"

    .line 86
    .line 87
    const-string v39, "ro.boot.emmc"

    .line 88
    .line 89
    const-string v40, "ro.boot.hardware"

    .line 90
    .line 91
    const-string v41, "ro.boot.hardware.ddr"

    .line 92
    .line 93
    const-string v42, "ro.boot.hardware.display"

    .line 94
    .line 95
    const-string v43, "ro.boot.hardware.sku"

    .line 96
    .line 97
    const-string v44, "ro.boot.serialno"

    .line 98
    .line 99
    const-string v45, "ro.bootimage.build.date"

    .line 100
    .line 101
    const-string v46, "ro.bootimage.build.date.utc"

    .line 102
    .line 103
    const-string v47, "ro.bootimage.build.fingerprint"

    .line 104
    .line 105
    const-string v48, "ro.bootloader"

    .line 106
    .line 107
    const-string v49, "ro.bootmode"

    .line 108
    .line 109
    const-string v50, "ro.build.characteristics"

    .line 110
    .line 111
    const-string v51, "ro.build.date"

    .line 112
    .line 113
    const-string v52, "ro.build.date.utc"

    .line 114
    .line 115
    const-string v53, "ro.build.description"

    .line 116
    .line 117
    const-string v54, "ro.build.display.id"

    .line 118
    .line 119
    const-string v55, "ro.build.expect.baseband"

    .line 120
    .line 121
    const-string v56, "ro.build.expect.bootloader"

    .line 122
    .line 123
    const-string v57, "ro.build.fingerprint"

    .line 124
    .line 125
    const-string v58, "ro.build.flavor"

    .line 126
    .line 127
    const-string v59, "ro.build.host"

    .line 128
    .line 129
    const-string v60, "ro.build.id"

    .line 130
    .line 131
    const-string v61, "ro.build.product"

    .line 132
    .line 133
    const-string v62, "ro.build.tags"

    .line 134
    .line 135
    const-string v63, "ro.build.type"

    .line 136
    .line 137
    const-string v64, "ro.build.user"

    .line 138
    .line 139
    const-string v65, "ro.build.version.all_codenames"

    .line 140
    .line 141
    const-string v66, "ro.build.version.base_os"

    .line 142
    .line 143
    const-string v67, "ro.build.version.codename"

    .line 144
    .line 145
    const-string v68, "ro.build.version.incremental"

    .line 146
    .line 147
    const-string v69, "ro.build.version.preview_sdk"

    .line 148
    .line 149
    const-string v70, "ro.build.version.release"

    .line 150
    .line 151
    const-string v71, "ro.build.version.sdk"

    .line 152
    .line 153
    const-string v72, "ro.build.version.security_patch"

    .line 154
    .line 155
    const-string v73, "ro.carrier"

    .line 156
    .line 157
    const-string v74, "ro.com.android.dataroaming"

    .line 158
    .line 159
    const-string v75, "ro.com.android.wifi-watchlist"

    .line 160
    .line 161
    const-string v76, "ro.com.google.clientidbase"

    .line 162
    .line 163
    const-string v77, "ro.config.alarm_alert"

    .line 164
    .line 165
    const-string v78, "ro.config.notification_sound"

    .line 166
    .line 167
    const-string v79, "ro.config.ringtone"

    .line 168
    .line 169
    const-string v80, "ro.config.vc_call_vol_steps"

    .line 170
    .line 171
    const-string v81, "ro.crypto.state"

    .line 172
    .line 173
    const-string v82, "ro.dalvik.vm.native.bridge"

    .line 174
    .line 175
    const-string v83, "ro.debuggable"

    .line 176
    .line 177
    const-string v84, "ro.error.receiver.system.apps"

    .line 178
    .line 179
    const-string v85, "ro.expect.recovery_id"

    .line 180
    .line 181
    const-string v86, "ro.hardware"

    .line 182
    .line 183
    const-string v87, "ro.input.noresample"

    .line 184
    .line 185
    const-string v88, "ro.kernel.qemu"

    .line 186
    .line 187
    const-string v89, "ro.opengles.version"

    .line 188
    .line 189
    const-string v90, "ro.product.board"

    .line 190
    .line 191
    const-string v91, "ro.product.brand"

    .line 192
    .line 193
    const-string v92, "ro.product.cpu.abi"

    .line 194
    .line 195
    const-string v93, "ro.product.cpu.abi2"

    .line 196
    .line 197
    const-string v94, "ro.product.cpu.abilist"

    .line 198
    .line 199
    const-string v95, "ro.product.cpu.abilist32"

    .line 200
    .line 201
    const-string v96, "ro.product.cpu.abilist64"

    .line 202
    .line 203
    const-string v97, "ro.product.device"

    .line 204
    .line 205
    const-string v98, "ro.product.locale"

    .line 206
    .line 207
    const-string v99, "ro.product.manufacturer"

    .line 208
    .line 209
    const-string v100, "ro.product.model"

    .line 210
    .line 211
    const-string v101, "ro.product.name"

    .line 212
    .line 213
    const-string v102, "ro.qti.sensors.game_rv"

    .line 214
    .line 215
    const-string v103, "ro.qti.sensors.georv"

    .line 216
    .line 217
    const-string v104, "ro.recovery_id"

    .line 218
    .line 219
    const-string v105, "ro.revision"

    .line 220
    .line 221
    const-string v106, "ro.ril.svdo"

    .line 222
    .line 223
    const-string v107, "ro.ril.svlte1x"

    .line 224
    .line 225
    const-string v108, "ro.runtime.firstboot"

    .line 226
    .line 227
    const-string v109, "ro.secure"

    .line 228
    .line 229
    const-string v110, "ro.serialno"

    .line 230
    .line 231
    const-string v111, "ro.setupwizard.enterprise_mode"

    .line 232
    .line 233
    const-string v112, "ro.sf.lcd_density"

    .line 234
    .line 235
    const-string v113, "ro.telephony.call_ring.multiple"

    .line 236
    .line 237
    const-string v114, "ro.telephony.default_network"

    .line 238
    .line 239
    const-string v115, "ro.url.legal"

    .line 240
    .line 241
    const-string v116, "ro.url.legal.android_privacy"

    .line 242
    .line 243
    const-string v117, "ro.wifi.channels"

    .line 244
    .line 245
    const-string v118, "ro.zygote"

    .line 246
    .line 247
    const-string v119, "selinux.reload_policy"

    .line 248
    .line 249
    const-string v120, "service.bootanim.exit"

    .line 250
    .line 251
    const-string v121, "sys.boot_completed"

    .line 252
    .line 253
    const-string v122, "sys.usb.config"

    .line 254
    .line 255
    const-string v123, "sys.usb.configfs"

    .line 256
    .line 257
    const-string v124, "sys.usb.state"

    .line 258
    .line 259
    const-string v125, "telephony.lteOnCdmaDevice"

    .line 260
    .line 261
    const-string v126, "vold.has_adoptable"

    .line 262
    .line 263
    const-string v127, "vold.post_fs_data_done"

    .line 264
    .line 265
    const-string v128, "wifi.interface"

    .line 266
    .line 267
    filled-new-array/range {v5 .. v130}, [Ljava/lang/String;

    .line 268
    .line 269
    .line 270
    move-result-object v0

    .line 271
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 272
    .line 273
    .line 274
    move-result-object v5

    .line 275
    const/4 v6, 0x1

    .line 276
    const/4 v7, 0x0

    .line 277
    :try_start_0
    invoke-static {}, Ll/qzd;->b()Ljava/lang/String;

    .line 278
    .line 279
    .line 280
    move-result-object v8
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 281
    :try_start_1
    sget-object v0, Ll/jyb;->a:Ljava/nio/charset/Charset;

    .line 282
    .line 283
    invoke-virtual {v8, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 284
    .line 285
    .line 286
    move-result-object v0

    .line 287
    invoke-static {v0}, Ljava/util/UUID;->nameUUIDFromBytes([B)Ljava/util/UUID;

    .line 288
    .line 289
    .line 290
    move-result-object v0

    .line 291
    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 292
    .line 293
    .line 294
    move-result-object v8

    .line 295
    invoke-static {}, Ll/qzd;->a()Ljava/lang/String;

    .line 296
    .line 297
    .line 298
    move-result-object v0

    .line 299
    invoke-static {v8, v0}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 300
    .line 301
    .line 302
    move-result v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 303
    xor-int/2addr v0, v6

    .line 304
    move-object/from16 v131, v8

    .line 305
    .line 306
    move v8, v0

    .line 307
    move-object/from16 v0, v131

    .line 308
    .line 309
    goto :goto_1

    .line 310
    :catch_0
    move-exception v0

    .line 311
    goto :goto_0

    .line 312
    :catch_1
    move-exception v0

    .line 313
    const/4 v8, 0x0

    .line 314
    :goto_0
    new-instance v9, Ljava/lang/Exception;

    .line 315
    .line 316
    new-instance v10, Ljava/lang/StringBuilder;

    .line 317
    .line 318
    invoke-direct {v10, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 319
    .line 320
    .line 321
    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 322
    .line 323
    .line 324
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 325
    .line 326
    .line 327
    move-result-object v0

    .line 328
    invoke-direct {v9, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 329
    .line 330
    .line 331
    invoke-static {v9}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 332
    .line 333
    .line 334
    move-object v0, v8

    .line 335
    move v8, v7

    .line 336
    :goto_1
    if-nez v8, :cond_0

    .line 337
    .line 338
    const-string v9, ".uuid"

    .line 339
    .line 340
    invoke-virtual {v2, v9, v0}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 341
    .line 342
    .line 343
    :cond_0
    :try_start_2
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 344
    .line 345
    .line 346
    move-result-object v9
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 347
    move v10, v7

    .line 348
    :cond_1
    :goto_2
    :try_start_3
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    .line 349
    .line 350
    .line 351
    move-result v0

    .line 352
    if-eqz v0, :cond_4

    .line 353
    .line 354
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 355
    .line 356
    .line 357
    move-result-object v0

    .line 358
    check-cast v0, Ljava/lang/String;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 359
    .line 360
    :try_start_4
    const-string v11, "ro.product.model"

    .line 361
    .line 362
    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 363
    .line 364
    .line 365
    move-result v11

    .line 366
    if-eqz v11, :cond_3

    .line 367
    .line 368
    invoke-static {v0}, Ll/m51;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 369
    .line 370
    .line 371
    move-result-object v11

    .line 372
    invoke-static {v0}, Ll/m51;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 373
    .line 374
    .line 375
    move-result-object v12

    .line 376
    invoke-static {v11, v12}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 377
    .line 378
    .line 379
    move-result v12

    .line 380
    if-nez v12, :cond_2

    .line 381
    .line 382
    move v10, v6

    .line 383
    :cond_2
    if-eqz v11, :cond_1

    .line 384
    .line 385
    invoke-virtual {v2, v0, v11}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 386
    .line 387
    .line 388
    goto :goto_2

    .line 389
    :catchall_0
    move-exception v0

    .line 390
    goto :goto_3

    .line 391
    :cond_3
    invoke-static {v0}, Ll/m51;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 392
    .line 393
    .line 394
    move-result-object v11

    .line 395
    if-eqz v11, :cond_1

    .line 396
    .line 397
    invoke-virtual {v2, v0, v11}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 398
    .line 399
    .line 400
    goto :goto_2

    .line 401
    :goto_3
    :try_start_5
    new-instance v11, Ljava/lang/Throwable;

    .line 402
    .line 403
    new-instance v12, Ljava/lang/StringBuilder;

    .line 404
    .line 405
    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    .line 406
    .line 407
    .line 408
    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 409
    .line 410
    .line 411
    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 412
    .line 413
    .line 414
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 415
    .line 416
    .line 417
    move-result-object v0

    .line 418
    invoke-direct {v11, v0}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    .line 419
    .line 420
    .line 421
    invoke-static {v11}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 422
    .line 423
    .line 424
    goto :goto_2

    .line 425
    :catchall_1
    move-exception v0

    .line 426
    goto :goto_4

    .line 427
    :catchall_2
    move-exception v0

    .line 428
    move v10, v7

    .line 429
    :goto_4
    new-instance v9, Ljava/lang/Throwable;

    .line 430
    .line 431
    new-instance v11, Ljava/lang/StringBuilder;

    .line 432
    .line 433
    invoke-direct {v11, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 434
    .line 435
    .line 436
    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 437
    .line 438
    .line 439
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 440
    .line 441
    .line 442
    move-result-object v0

    .line 443
    invoke-direct {v9, v0}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    .line 444
    .line 445
    .line 446
    invoke-static {v9}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 447
    .line 448
    .line 449
    :cond_4
    :goto_5
    const-wide/16 v0, 0xb

    .line 450
    .line 451
    const-wide/16 v11, 0x1

    .line 452
    .line 453
    if-eqz v8, :cond_5

    .line 454
    .line 455
    rem-long v13, v3, v0

    .line 456
    .line 457
    cmp-long v9, v13, v11

    .line 458
    .line 459
    if-eqz v9, :cond_6

    .line 460
    .line 461
    :cond_5
    if-nez v8, :cond_a

    .line 462
    .line 463
    rem-long v0, v3, v0

    .line 464
    .line 465
    cmp-long v0, v0, v11

    .line 466
    .line 467
    if-eqz v0, :cond_a

    .line 468
    .line 469
    :cond_6
    const-wide/16 v0, 0xd

    .line 470
    .line 471
    if-eqz v10, :cond_7

    .line 472
    .line 473
    rem-long v13, v3, v0

    .line 474
    .line 475
    cmp-long v9, v13, v11

    .line 476
    .line 477
    if-eqz v9, :cond_8

    .line 478
    .line 479
    :cond_7
    if-nez v10, :cond_a

    .line 480
    .line 481
    rem-long v0, v3, v0

    .line 482
    .line 483
    cmp-long v0, v0, v11

    .line 484
    .line 485
    if-eqz v0, :cond_a

    .line 486
    .line 487
    :cond_8
    new-instance v0, Ll/bkj0;

    .line 488
    .line 489
    if-nez v8, :cond_9

    .line 490
    .line 491
    if-nez v10, :cond_9

    .line 492
    .line 493
    goto :goto_6

    .line 494
    :cond_9
    move v6, v7

    .line 495
    :goto_6
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 496
    .line 497
    .line 498
    move-result-object v1

    .line 499
    invoke-direct {v0, v2, v1, v5}, Ll/bkj0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 500
    .line 501
    .line 502
    return-object v0

    .line 503
    :cond_a
    add-long/2addr v3, v11

    .line 504
    goto :goto_5
.end method

.method private prepareXmpXml()Ll/bkj0;
    .locals 132
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/bkj0<",
            "Ljava/util/TreeMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/Boolean;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 1
    const-string v1, ".Debuggable"

    .line 2
    .line 3
    new-instance v2, Ljava/util/TreeMap;

    .line 4
    .line 5
    invoke-direct {v2}, Ljava/util/TreeMap;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 9
    .line 10
    .line 11
    move-result-wide v3

    .line 12
    const-string v129, "wifi.supplicant_scan_interval"

    .line 13
    .line 14
    const-string v130, "wlan.driver.status"

    .line 15
    .line 16
    const-string v5, "af.fast_track_multiplier"

    .line 17
    .line 18
    const-string v6, "debug.atrace.tags.enableflags"

    .line 19
    .line 20
    const-string v7, "dev.bootcomplete"

    .line 21
    .line 22
    const-string v8, "drm.service.enabled"

    .line 23
    .line 24
    const-string v9, "gsm.current.phone-type"

    .line 25
    .line 26
    const-string v10, "gsm.network.type"

    .line 27
    .line 28
    const-string v11, "gsm.operator.alpha"

    .line 29
    .line 30
    const-string v12, "gsm.operator.iso-country"

    .line 31
    .line 32
    const-string v13, "gsm.operator.isroaming"

    .line 33
    .line 34
    const-string v14, "gsm.operator.numeric"

    .line 35
    .line 36
    const-string v15, "gsm.sim.operator.alpha"

    .line 37
    .line 38
    const-string v16, "gsm.sim.operator.iso-country"

    .line 39
    .line 40
    const-string v17, "gsm.sim.operator.numeric"

    .line 41
    .line 42
    const-string v18, "gsm.sim.state"

    .line 43
    .line 44
    const-string v19, "gsm.version.baseband"

    .line 45
    .line 46
    const-string v20, "gsm.version.ril-impl"

    .line 47
    .line 48
    const-string v21, "keyguard.no_require_sim"

    .line 49
    .line 50
    const-string v22, "media.aac_51_output_enabled"

    .line 51
    .line 52
    const-string v23, "net.bt.name"

    .line 53
    .line 54
    const-string v24, "net.change"

    .line 55
    .line 56
    const-string v25, "net.dns1"

    .line 57
    .line 58
    const-string v26, "net.dns2"

    .line 59
    .line 60
    const-string v27, "net.dns3"

    .line 61
    .line 62
    const-string v28, "net.hostname"

    .line 63
    .line 64
    const-string v29, "net.qtaguid_enabled"

    .line 65
    .line 66
    const-string v30, "net.tcp.default_init_rwnd"

    .line 67
    .line 68
    const-string v31, "ril.ecclist"

    .line 69
    .line 70
    const-string v32, "rild.libpath"

    .line 71
    .line 72
    const-string v33, "ro.adb.secure"

    .line 73
    .line 74
    const-string v34, "ro.allow.mock.location"

    .line 75
    .line 76
    const-string v35, "ro.baseband"

    .line 77
    .line 78
    const-string v36, "ro.board.platform"

    .line 79
    .line 80
    const-string v37, "ro.boot.baseband"

    .line 81
    .line 82
    const-string v38, "ro.boot.bootloader"

    .line 83
    .line 84
    const-string v39, "ro.boot.emmc"

    .line 85
    .line 86
    const-string v40, "ro.boot.hardware"

    .line 87
    .line 88
    const-string v41, "ro.boot.hardware.ddr"

    .line 89
    .line 90
    const-string v42, "ro.boot.hardware.display"

    .line 91
    .line 92
    const-string v43, "ro.boot.hardware.sku"

    .line 93
    .line 94
    const-string v44, "ro.boot.serialno"

    .line 95
    .line 96
    const-string v45, "ro.bootimage.build.date"

    .line 97
    .line 98
    const-string v46, "ro.bootimage.build.date.utc"

    .line 99
    .line 100
    const-string v47, "ro.bootimage.build.fingerprint"

    .line 101
    .line 102
    const-string v48, "ro.bootloader"

    .line 103
    .line 104
    const-string v49, "ro.bootmode"

    .line 105
    .line 106
    const-string v50, "ro.build.characteristics"

    .line 107
    .line 108
    const-string v51, "ro.build.date"

    .line 109
    .line 110
    const-string v52, "ro.build.date.utc"

    .line 111
    .line 112
    const-string v53, "ro.build.description"

    .line 113
    .line 114
    const-string v54, "ro.build.display.id"

    .line 115
    .line 116
    const-string v55, "ro.build.expect.baseband"

    .line 117
    .line 118
    const-string v56, "ro.build.expect.bootloader"

    .line 119
    .line 120
    const-string v57, "ro.build.fingerprint"

    .line 121
    .line 122
    const-string v58, "ro.build.flavor"

    .line 123
    .line 124
    const-string v59, "ro.build.host"

    .line 125
    .line 126
    const-string v60, "ro.build.id"

    .line 127
    .line 128
    const-string v61, "ro.build.product"

    .line 129
    .line 130
    const-string v62, "ro.build.tags"

    .line 131
    .line 132
    const-string v63, "ro.build.type"

    .line 133
    .line 134
    const-string v64, "ro.build.user"

    .line 135
    .line 136
    const-string v65, "ro.build.version.all_codenames"

    .line 137
    .line 138
    const-string v66, "ro.build.version.base_os"

    .line 139
    .line 140
    const-string v67, "ro.build.version.codename"

    .line 141
    .line 142
    const-string v68, "ro.build.version.incremental"

    .line 143
    .line 144
    const-string v69, "ro.build.version.preview_sdk"

    .line 145
    .line 146
    const-string v70, "ro.build.version.release"

    .line 147
    .line 148
    const-string v71, "ro.build.version.sdk"

    .line 149
    .line 150
    const-string v72, "ro.build.version.security_patch"

    .line 151
    .line 152
    const-string v73, "ro.carrier"

    .line 153
    .line 154
    const-string v74, "ro.com.android.dataroaming"

    .line 155
    .line 156
    const-string v75, "ro.com.android.wifi-watchlist"

    .line 157
    .line 158
    const-string v76, "ro.com.google.clientidbase"

    .line 159
    .line 160
    const-string v77, "ro.config.alarm_alert"

    .line 161
    .line 162
    const-string v78, "ro.config.notification_sound"

    .line 163
    .line 164
    const-string v79, "ro.config.ringtone"

    .line 165
    .line 166
    const-string v80, "ro.config.vc_call_vol_steps"

    .line 167
    .line 168
    const-string v81, "ro.crypto.state"

    .line 169
    .line 170
    const-string v82, "ro.dalvik.vm.native.bridge"

    .line 171
    .line 172
    const-string v83, "ro.debuggable"

    .line 173
    .line 174
    const-string v84, "ro.error.receiver.system.apps"

    .line 175
    .line 176
    const-string v85, "ro.expect.recovery_id"

    .line 177
    .line 178
    const-string v86, "ro.hardware"

    .line 179
    .line 180
    const-string v87, "ro.input.noresample"

    .line 181
    .line 182
    const-string v88, "ro.kernel.qemu"

    .line 183
    .line 184
    const-string v89, "ro.opengles.version"

    .line 185
    .line 186
    const-string v90, "ro.product.board"

    .line 187
    .line 188
    const-string v91, "ro.product.brand"

    .line 189
    .line 190
    const-string v92, "ro.product.cpu.abi"

    .line 191
    .line 192
    const-string v93, "ro.product.cpu.abi2"

    .line 193
    .line 194
    const-string v94, "ro.product.cpu.abilist"

    .line 195
    .line 196
    const-string v95, "ro.product.cpu.abilist32"

    .line 197
    .line 198
    const-string v96, "ro.product.cpu.abilist64"

    .line 199
    .line 200
    const-string v97, "ro.product.device"

    .line 201
    .line 202
    const-string v98, "ro.product.locale"

    .line 203
    .line 204
    const-string v99, "ro.product.manufacturer"

    .line 205
    .line 206
    const-string v100, "ro.product.model"

    .line 207
    .line 208
    const-string v101, "ro.product.name"

    .line 209
    .line 210
    const-string v102, "ro.qti.sensors.game_rv"

    .line 211
    .line 212
    const-string v103, "ro.qti.sensors.georv"

    .line 213
    .line 214
    const-string v104, "ro.recovery_id"

    .line 215
    .line 216
    const-string v105, "ro.revision"

    .line 217
    .line 218
    const-string v106, "ro.ril.svdo"

    .line 219
    .line 220
    const-string v107, "ro.ril.svlte1x"

    .line 221
    .line 222
    const-string v108, "ro.runtime.firstboot"

    .line 223
    .line 224
    const-string v109, "ro.secure"

    .line 225
    .line 226
    const-string v110, "ro.serialno"

    .line 227
    .line 228
    const-string v111, "ro.setupwizard.enterprise_mode"

    .line 229
    .line 230
    const-string v112, "ro.sf.lcd_density"

    .line 231
    .line 232
    const-string v113, "ro.telephony.call_ring.multiple"

    .line 233
    .line 234
    const-string v114, "ro.telephony.default_network"

    .line 235
    .line 236
    const-string v115, "ro.url.legal"

    .line 237
    .line 238
    const-string v116, "ro.url.legal.android_privacy"

    .line 239
    .line 240
    const-string v117, "ro.wifi.channels"

    .line 241
    .line 242
    const-string v118, "ro.zygote"

    .line 243
    .line 244
    const-string v119, "selinux.reload_policy"

    .line 245
    .line 246
    const-string v120, "service.bootanim.exit"

    .line 247
    .line 248
    const-string v121, "sys.boot_completed"

    .line 249
    .line 250
    const-string v122, "sys.usb.config"

    .line 251
    .line 252
    const-string v123, "sys.usb.configfs"

    .line 253
    .line 254
    const-string v124, "sys.usb.state"

    .line 255
    .line 256
    const-string v125, "telephony.lteOnCdmaDevice"

    .line 257
    .line 258
    const-string v126, "vold.has_adoptable"

    .line 259
    .line 260
    const-string v127, "vold.post_fs_data_done"

    .line 261
    .line 262
    const-string v128, "wifi.interface"

    .line 263
    .line 264
    filled-new-array/range {v5 .. v130}, [Ljava/lang/String;

    .line 265
    .line 266
    .line 267
    move-result-object v0

    .line 268
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 269
    .line 270
    .line 271
    move-result-object v5

    .line 272
    const-string v0, "px1"

    .line 273
    .line 274
    const-string v6, "[putong-common][upload]"

    .line 275
    .line 276
    invoke-static {v6, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 277
    .line 278
    .line 279
    invoke-static {}, Ll/ak20;->c()I

    .line 280
    .line 281
    .line 282
    move-result v0

    .line 283
    const-string v7, "px2"

    .line 284
    .line 285
    invoke-static {v6, v7}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 286
    .line 287
    .line 288
    const/high16 v7, -0x80000000

    .line 289
    .line 290
    and-int/2addr v0, v7

    .line 291
    const/4 v7, 0x0

    .line 292
    const/4 v8, 0x1

    .line 293
    if-eqz v0, :cond_0

    .line 294
    .line 295
    move v9, v8

    .line 296
    goto :goto_0

    .line 297
    :cond_0
    move v9, v7

    .line 298
    :goto_0
    const-string v10, "Network exception:"

    .line 299
    .line 300
    const/4 v11, 0x0

    .line 301
    if-nez v9, :cond_1

    .line 302
    .line 303
    :try_start_0
    invoke-static {}, Ll/qzd;->b()Ljava/lang/String;

    .line 304
    .line 305
    .line 306
    move-result-object v11

    .line 307
    sget-object v0, Ll/jyb;->a:Ljava/nio/charset/Charset;

    .line 308
    .line 309
    invoke-virtual {v11, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 310
    .line 311
    .line 312
    move-result-object v0

    .line 313
    invoke-static {v0}, Ljava/util/UUID;->nameUUIDFromBytes([B)Ljava/util/UUID;

    .line 314
    .line 315
    .line 316
    move-result-object v0

    .line 317
    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 318
    .line 319
    .line 320
    move-result-object v11

    .line 321
    invoke-static {}, Ll/qzd;->a()Ljava/lang/String;

    .line 322
    .line 323
    .line 324
    move-result-object v0

    .line 325
    invoke-static {v11, v0}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 326
    .line 327
    .line 328
    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 329
    xor-int/2addr v0, v8

    .line 330
    move-object/from16 v131, v11

    .line 331
    .line 332
    move v11, v0

    .line 333
    move-object/from16 v0, v131

    .line 334
    .line 335
    goto :goto_1

    .line 336
    :catch_0
    move-exception v0

    .line 337
    new-instance v12, Ljava/lang/Exception;

    .line 338
    .line 339
    new-instance v13, Ljava/lang/StringBuilder;

    .line 340
    .line 341
    invoke-direct {v13, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 342
    .line 343
    .line 344
    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 345
    .line 346
    .line 347
    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 348
    .line 349
    .line 350
    move-result-object v0

    .line 351
    invoke-direct {v12, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 352
    .line 353
    .line 354
    invoke-static {v12}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 355
    .line 356
    .line 357
    :cond_1
    move-object v0, v11

    .line 358
    move v11, v7

    .line 359
    :goto_1
    const-string v12, "px3"

    .line 360
    .line 361
    invoke-static {v6, v12}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 362
    .line 363
    .line 364
    if-nez v9, :cond_2

    .line 365
    .line 366
    if-nez v11, :cond_2

    .line 367
    .line 368
    const-string v12, ".uuid"

    .line 369
    .line 370
    invoke-virtual {v2, v12, v0}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 371
    .line 372
    .line 373
    :cond_2
    :try_start_1
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 374
    .line 375
    .line 376
    move-result-object v12
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 377
    move v13, v7

    .line 378
    :cond_3
    :goto_2
    :try_start_2
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    .line 379
    .line 380
    .line 381
    move-result v0

    .line 382
    if-eqz v0, :cond_6

    .line 383
    .line 384
    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 385
    .line 386
    .line 387
    move-result-object v0

    .line 388
    check-cast v0, Ljava/lang/String;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 389
    .line 390
    if-nez v9, :cond_5

    .line 391
    .line 392
    :try_start_3
    const-string v14, "ro.product.model"

    .line 393
    .line 394
    invoke-virtual {v0, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 395
    .line 396
    .line 397
    move-result v14

    .line 398
    if-eqz v14, :cond_5

    .line 399
    .line 400
    invoke-static {v0}, Ll/m51;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 401
    .line 402
    .line 403
    move-result-object v14

    .line 404
    invoke-static {v0}, Ll/m51;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 405
    .line 406
    .line 407
    move-result-object v15

    .line 408
    invoke-static {v14, v15}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 409
    .line 410
    .line 411
    move-result v15

    .line 412
    if-nez v15, :cond_4

    .line 413
    .line 414
    move v13, v8

    .line 415
    :cond_4
    if-eqz v14, :cond_3

    .line 416
    .line 417
    invoke-virtual {v2, v0, v14}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 418
    .line 419
    .line 420
    goto :goto_2

    .line 421
    :catchall_0
    move-exception v0

    .line 422
    goto :goto_3

    .line 423
    :cond_5
    invoke-static {v0}, Ll/m51;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 424
    .line 425
    .line 426
    move-result-object v14

    .line 427
    if-eqz v14, :cond_3

    .line 428
    .line 429
    invoke-virtual {v2, v0, v14}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 430
    .line 431
    .line 432
    goto :goto_2

    .line 433
    :goto_3
    :try_start_4
    new-instance v14, Ljava/lang/Throwable;

    .line 434
    .line 435
    new-instance v15, Ljava/lang/StringBuilder;

    .line 436
    .line 437
    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    .line 438
    .line 439
    .line 440
    invoke-virtual {v15, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 441
    .line 442
    .line 443
    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 444
    .line 445
    .line 446
    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 447
    .line 448
    .line 449
    move-result-object v0

    .line 450
    invoke-direct {v14, v0}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    .line 451
    .line 452
    .line 453
    invoke-static {v14}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 454
    .line 455
    .line 456
    goto :goto_2

    .line 457
    :catchall_1
    move-exception v0

    .line 458
    goto :goto_4

    .line 459
    :catchall_2
    move-exception v0

    .line 460
    move v13, v7

    .line 461
    :goto_4
    new-instance v12, Ljava/lang/Throwable;

    .line 462
    .line 463
    new-instance v14, Ljava/lang/StringBuilder;

    .line 464
    .line 465
    invoke-direct {v14, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 466
    .line 467
    .line 468
    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 469
    .line 470
    .line 471
    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 472
    .line 473
    .line 474
    move-result-object v0

    .line 475
    invoke-direct {v12, v0}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    .line 476
    .line 477
    .line 478
    invoke-static {v12}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 479
    .line 480
    .line 481
    :cond_6
    const-string v0, "px4"

    .line 482
    .line 483
    invoke-static {v6, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 484
    .line 485
    .line 486
    :try_start_5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 487
    .line 488
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 489
    .line 490
    .line 491
    invoke-static {}, Ll/ak20;->e()I

    .line 492
    .line 493
    .line 494
    move-result v10

    .line 495
    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 496
    .line 497
    .line 498
    const-string v10, ""

    .line 499
    .line 500
    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 501
    .line 502
    .line 503
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 504
    .line 505
    .line 506
    move-result-object v0

    .line 507
    invoke-virtual {v2, v1, v0}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 508
    .line 509
    .line 510
    goto :goto_5

    .line 511
    :catchall_3
    const-string v0, "0"

    .line 512
    .line 513
    invoke-virtual {v2, v1, v0}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 514
    .line 515
    .line 516
    :goto_5
    const-string v0, "px5"

    .line 517
    .line 518
    invoke-static {v6, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 519
    .line 520
    .line 521
    const-string v0, "px6"

    .line 522
    .line 523
    invoke-static {v6, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 524
    .line 525
    .line 526
    :goto_6
    const-wide/16 v0, 0x7

    .line 527
    .line 528
    const-wide/16 v14, 0x1

    .line 529
    .line 530
    if-eqz v9, :cond_7

    .line 531
    .line 532
    rem-long v16, v3, v0

    .line 533
    .line 534
    cmp-long v6, v16, v14

    .line 535
    .line 536
    if-eqz v6, :cond_8

    .line 537
    .line 538
    :cond_7
    if-nez v9, :cond_e

    .line 539
    .line 540
    rem-long v0, v3, v0

    .line 541
    .line 542
    cmp-long v0, v0, v14

    .line 543
    .line 544
    if-eqz v0, :cond_e

    .line 545
    .line 546
    :cond_8
    const-wide/16 v0, 0xb

    .line 547
    .line 548
    if-eqz v11, :cond_9

    .line 549
    .line 550
    rem-long v16, v3, v0

    .line 551
    .line 552
    cmp-long v6, v16, v14

    .line 553
    .line 554
    if-eqz v6, :cond_a

    .line 555
    .line 556
    :cond_9
    if-nez v11, :cond_e

    .line 557
    .line 558
    rem-long v0, v3, v0

    .line 559
    .line 560
    cmp-long v0, v0, v14

    .line 561
    .line 562
    if-eqz v0, :cond_e

    .line 563
    .line 564
    :cond_a
    const-wide/16 v0, 0xd

    .line 565
    .line 566
    if-eqz v13, :cond_b

    .line 567
    .line 568
    rem-long v16, v3, v0

    .line 569
    .line 570
    cmp-long v6, v16, v14

    .line 571
    .line 572
    if-eqz v6, :cond_c

    .line 573
    .line 574
    :cond_b
    if-nez v13, :cond_e

    .line 575
    .line 576
    rem-long v0, v3, v0

    .line 577
    .line 578
    cmp-long v0, v0, v14

    .line 579
    .line 580
    if-eqz v0, :cond_e

    .line 581
    .line 582
    :cond_c
    new-instance v0, Ll/bkj0;

    .line 583
    .line 584
    if-nez v9, :cond_d

    .line 585
    .line 586
    if-nez v11, :cond_d

    .line 587
    .line 588
    if-nez v13, :cond_d

    .line 589
    .line 590
    move v7, v8

    .line 591
    :cond_d
    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 592
    .line 593
    .line 594
    move-result-object v1

    .line 595
    invoke-direct {v0, v2, v1, v5}, Ll/bkj0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 596
    .line 597
    .line 598
    move-object/from16 v1, p0

    .line 599
    .line 600
    iput-object v0, v1, Lcom/p1/mobile/putong/api/api/Network;->xmpNodes:Ll/bkj0;

    .line 601
    .line 602
    return-object v0

    .line 603
    :cond_e
    move-object/from16 v1, p0

    .line 604
    .line 605
    add-long/2addr v3, v14

    .line 606
    goto :goto_6
.end method

.method private smAntiFraudInit(Ljava/util/TreeMap;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/TreeMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    :try_start_0
    new-instance v0, Lcom/ishumei/smantifraud/SmAntiFraud$SmOption;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/ishumei/smantifraud/SmAntiFraud$SmOption;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/util/HashSet;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v2, "apps"

    .line 12
    .line 13
    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    const-string v2, "riskapp"

    .line 17
    .line 18
    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    const-string v2, "bssid"

    .line 22
    .line 23
    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    const-string v2, "cell"

    .line 27
    .line 28
    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    const-string v2, "network"

    .line 32
    .line 33
    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    const-string v2, "ssid"

    .line 37
    .line 38
    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    const-string v2, "wifiip"

    .line 42
    .line 43
    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v1}, Lcom/ishumei/smantifraud/SmAntiFraud$SmOption;->setNotCollect(Ljava/util/Set;)V

    .line 47
    .line 48
    .line 49
    const/4 v1, 0x0

    .line 50
    invoke-virtual {v0, v1}, Lcom/ishumei/smantifraud/SmAntiFraud$SmOption;->setTransport(Z)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, v1}, Lcom/ishumei/smantifraud/SmAntiFraud$SmOption;->setCloudConf(Z)V

    .line 54
    .line 55
    .line 56
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 57
    .line 58
    invoke-static {v1, v0}, Lcom/ishumei/smantifraud/SmAntiFraud;->create(Landroid/content/Context;Lcom/ishumei/smantifraud/SmAntiFraud$SmOption;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 59
    .line 60
    .line 61
    new-instance v0, Landroid/os/HandlerThread;

    .line 62
    .line 63
    const-string v1, "smAnti"

    .line 64
    .line 65
    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 69
    .line 70
    .line 71
    new-instance v1, Landroid/os/Handler;

    .line 72
    .line 73
    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 78
    .line 79
    .line 80
    new-instance v2, Ljava/lang/Thread;

    .line 81
    .line 82
    new-instance v3, Ll/yi20;

    .line 83
    .line 84
    invoke-direct {v3, p1, v0}, Ll/yi20;-><init>(Ljava/util/TreeMap;Landroid/os/HandlerThread;)V

    .line 85
    .line 86
    .line 87
    const-string v0, "smAnti"

    .line 88
    .line 89
    invoke-direct {v2, v3, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    new-instance v0, Lcom/p1/mobile/putong/api/api/Network$b;

    .line 93
    .line 94
    invoke-direct {v0, p0, v2, v1}, Lcom/p1/mobile/putong/api/api/Network$b;-><init>(Lcom/p1/mobile/putong/api/api/Network;Ljava/lang/Thread;Landroid/os/Handler;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 98
    .line 99
    .line 100
    const-wide/16 v2, 0x2710

    .line 101
    .line 102
    invoke-virtual {v1, v0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 103
    .line 104
    .line 105
    :try_start_1
    monitor-enter p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 106
    :try_start_2
    const-string p0, "smnd"

    .line 107
    .line 108
    invoke-virtual {p1, p0}, Ljava/util/TreeMap;->containsKey(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    move-result p0

    .line 112
    if-nez p0, :cond_0

    .line 113
    .line 114
    invoke-virtual {p1}, Ljava/lang/Object;->wait()V

    .line 115
    .line 116
    .line 117
    goto :goto_0

    .line 118
    :catchall_0
    move-exception p0

    .line 119
    goto :goto_1

    .line 120
    :cond_0
    :goto_0
    monitor-exit p1

    .line 121
    return-void

    .line 122
    :goto_1
    monitor-exit p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 123
    :try_start_3
    throw p0
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 124
    :catch_0
    move-exception p0

    .line 125
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 126
    .line 127
    .line 128
    goto :goto_2

    .line 129
    :catch_1
    move-exception p0

    .line 130
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 131
    .line 132
    .line 133
    const-string p0, "smnd"

    .line 134
    .line 135
    const-string v0, ""

    .line 136
    .line 137
    invoke-virtual {p1, p0, v0}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    :goto_2
    return-void
.end method

.method private uploadAdData()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/dj20;

    .line 6
    .line 7
    invoke-direct {v1}, Ll/dj20;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/4 v1, 0x1

    .line 15
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/ej20;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/ej20;-><init>(Lcom/p1/mobile/putong/api/api/Network;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    new-instance v1, Ll/fj20;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Ll/fj20;-><init>(Lcom/p1/mobile/putong/api/api/Network;)V

    .line 39
    .line 40
    .line 41
    new-instance p0, Ll/gj20;

    .line 42
    .line 43
    invoke-direct {p0}, Ll/gj20;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 51
    .line 52
    .line 53
    return-void
.end method


# virtual methods
.method public auth()Ll/x1d0$a;
    .locals 1

    const/4 v0, 0x0

    .line 39
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/api/api/Network;->auth(Ll/x1d0$a;)Ll/x1d0$a;

    move-result-object p0

    return-object p0
.end method

.method public auth(Ll/x1d0$a;)Ll/x1d0$a;
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/api/api/Network;->common(Ll/x1d0$a;)Ll/x1d0$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p1, "Authorization"

    .line 6
    .line 7
    const-string v0, "ac"

    .line 8
    .line 9
    invoke-virtual {p0, p1, v0}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    const-string p1, "Client-State"

    .line 20
    .line 21
    const-string v0, "background"

    .line 22
    .line 23
    invoke-virtual {p0, p1, v0}, Ll/x1d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 24
    .line 25
    .line 26
    :cond_0
    const-string p1, "X-TT-ClientInfo"

    .line 27
    .line 28
    invoke-static {}, Lcom/p1/mobile/putong/api/api/Network;->getXttClientInfo()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p0, p1, v0}, Ll/x1d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 33
    .line 34
    .line 35
    invoke-static {p0}, Ll/ak20;->b(Ll/x1d0$a;)V

    .line 36
    .line 37
    .line 38
    return-object p0
.end method

.method public authBeforeSignUp()Ll/x1d0$a;
    .locals 1

    const/4 v0, 0x0

    .line 36
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/api/api/Network;->authBeforeSignUp(Ll/x1d0$a;)Ll/x1d0$a;

    move-result-object p0

    return-object p0
.end method

.method public authBeforeSignUp(Ll/x1d0$a;)Ll/x1d0$a;
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/api/api/Network;->common(Ll/x1d0$a;)Ll/x1d0$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p1, "Authorization"

    .line 6
    .line 7
    const-string v0, "abs"

    .line 8
    .line 9
    invoke-virtual {p0, p1, v0}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    const-string p1, "Client-State"

    .line 20
    .line 21
    const-string v0, "background"

    .line 22
    .line 23
    invoke-virtual {p0, p1, v0}, Ll/x1d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 24
    .line 25
    .line 26
    :cond_0
    const-string p1, "X-TT-ClientInfo"

    .line 27
    .line 28
    invoke-static {}, Lcom/p1/mobile/putong/api/api/Network;->getXttClientInfo()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p0, p1, v0}, Ll/x1d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 33
    .line 34
    .line 35
    return-object p0
.end method

.method public basic()Ll/x1d0$a;
    .locals 1

    const/4 v0, 0x0

    .line 24
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/api/api/Network;->basic(Ll/x1d0$a;)Ll/x1d0$a;

    move-result-object p0

    return-object p0
.end method

.method public basic(Ll/x1d0$a;)Ll/x1d0$a;
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/api/api/Network;->common(Ll/x1d0$a;)Ll/x1d0$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p1, "Authorization"

    .line 6
    .line 7
    const-string v0, "aa"

    .line 8
    .line 9
    invoke-virtual {p0, p1, v0}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string p1, "X-TT-ClientInfo"

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/api/api/Network;->getXttClientInfo()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0, p1, v0}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public boxException(Lcom/tantanapp/common/network/ApiExcep;)Ljava/lang/Exception;
    .locals 9

    .line 1
    iget-object p0, p1, Lcom/tantanapp/common/network/ApiExcep;->response:Ll/i5d0;

    .line 2
    .line 3
    instance-of v0, p1, Lcom/tantanapp/common/network/ApiExcep$Client$BadRequest;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_5

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/i5d0;->Z()Ll/x1d0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/x1d0;->k()Ll/rnl;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ll/rnl;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v2, ""

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/i5d0;->k()Ll/k5d0;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    :try_start_0
    invoke-virtual {v3}, Ll/k5d0;->source()Lokio/BufferedSource;

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    const-wide v5, 0x7fffffffffffffffL

    .line 31
    .line 32
    .line 33
    .line 34
    .line 35
    invoke-interface {v4, v5, v6}, Lokio/BufferedSource;->request(J)Z

    .line 36
    .line 37
    .line 38
    invoke-interface {v4}, Lokio/BufferedSource;->buffer()Lokio/Buffer;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    invoke-virtual {v4}, Lokio/Buffer;->clone()Lokio/Buffer;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    invoke-virtual {v3}, Ll/k5d0;->contentType()Ll/e7y;

    .line 47
    .line 48
    .line 49
    move-result-object v5

    .line 50
    invoke-virtual {v3}, Ll/k5d0;->contentLength()J

    .line 51
    .line 52
    .line 53
    move-result-wide v6

    .line 54
    invoke-static {v5, v6, v7, v4}, Ll/k5d0;->create(Ll/e7y;JLokio/BufferedSource;)Ll/k5d0;

    .line 55
    .line 56
    .line 57
    move-result-object v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    :try_start_1
    invoke-virtual {v3}, Ll/k5d0;->string()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-static {}, Ll/v3l0;->e()Ll/v3l0;

    .line 63
    .line 64
    .line 65
    move-result-object v4

    .line 66
    invoke-virtual {v4, v2}, Ll/v3l0;->c(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    invoke-static {}, Ll/esf0;->e()Ll/esf0;

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    invoke-virtual {v4, v2}, Ll/esf0;->b(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 74
    .line 75
    .line 76
    goto :goto_0

    .line 77
    :catch_0
    move-object v3, v1

    .line 78
    :catch_1
    invoke-static {v3}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 79
    .line 80
    .line 81
    :goto_0
    sget-object v3, Ll/qv5;->e:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 84
    .line 85
    .line 86
    move-result v4

    .line 87
    if-nez v4, :cond_0

    .line 88
    .line 89
    sget-object v4, Ll/qv5;->f:Ljava/lang/String;

    .line 90
    .line 91
    invoke-virtual {v0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 92
    .line 93
    .line 94
    move-result v5

    .line 95
    if-nez v5, :cond_0

    .line 96
    .line 97
    sget-object v5, Ll/qv5;->v:Ljava/lang/String;

    .line 98
    .line 99
    invoke-virtual {v0, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 100
    .line 101
    .line 102
    move-result v6

    .line 103
    if-nez v6, :cond_0

    .line 104
    .line 105
    sget-object v6, Ll/qv5;->n:Ljava/lang/String;

    .line 106
    .line 107
    invoke-virtual {v0, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 108
    .line 109
    .line 110
    move-result v7

    .line 111
    if-nez v7, :cond_0

    .line 112
    .line 113
    sget-object v7, Ll/qv5;->y:Ljava/lang/String;

    .line 114
    .line 115
    invoke-virtual {v0, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 116
    .line 117
    .line 118
    move-result v8

    .line 119
    if-nez v8, :cond_0

    .line 120
    .line 121
    sget-object v8, Ll/lhl;->INSTANCE:Ll/lhl;

    .line 122
    .line 123
    invoke-virtual {v8, v3}, Ll/lhl;->m(Ljava/lang/String;)Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v3

    .line 127
    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 128
    .line 129
    .line 130
    move-result v3

    .line 131
    if-nez v3, :cond_0

    .line 132
    .line 133
    invoke-virtual {v8, v4}, Ll/lhl;->m(Ljava/lang/String;)Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v3

    .line 137
    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 138
    .line 139
    .line 140
    move-result v3

    .line 141
    if-nez v3, :cond_0

    .line 142
    .line 143
    invoke-virtual {v8, v5}, Ll/lhl;->m(Ljava/lang/String;)Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v3

    .line 147
    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 148
    .line 149
    .line 150
    move-result v3

    .line 151
    if-nez v3, :cond_0

    .line 152
    .line 153
    invoke-virtual {v8, v6}, Ll/lhl;->m(Ljava/lang/String;)Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v3

    .line 157
    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 158
    .line 159
    .line 160
    move-result v3

    .line 161
    if-nez v3, :cond_0

    .line 162
    .line 163
    invoke-virtual {v8, v7}, Ll/lhl;->m(Ljava/lang/String;)Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v3

    .line 167
    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 168
    .line 169
    .line 170
    move-result v0

    .line 171
    if-eqz v0, :cond_d

    .line 172
    .line 173
    :cond_0
    :try_start_2
    sget-object v0, Lcom/p1/mobile/putong/data/AccountErrorResponse;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 174
    .line 175
    invoke-virtual {v0, v2}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    check-cast v0, Lcom/p1/mobile/putong/data/AccountErrorResponse;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3

    .line 180
    .line 181
    if-eqz v0, :cond_1

    .line 182
    .line 183
    :try_start_3
    iget v3, v0, Lcom/p1/mobile/putong/data/AccountErrorResponse;->code:I

    .line 184
    .line 185
    if-nez v3, :cond_3

    .line 186
    .line 187
    goto :goto_1

    .line 188
    :catch_2
    move-exception v2

    .line 189
    goto :goto_2

    .line 190
    :cond_1
    :goto_1
    sget-object v3, Lcom/p1/mobile/putong/data/Envelope;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 191
    .line 192
    invoke-virtual {v3, v2}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 193
    .line 194
    .line 195
    move-result-object v2

    .line 196
    check-cast v2, Lcom/p1/mobile/putong/data/Envelope;

    .line 197
    .line 198
    if-nez v2, :cond_2

    .line 199
    .line 200
    goto :goto_3

    .line 201
    :cond_2
    iget-object v1, v2, Lcom/p1/mobile/putong/data/Envelope;->meta:Lcom/p1/mobile/putong/data/Meta;
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    .line 202
    .line 203
    goto :goto_3

    .line 204
    :catch_3
    move-exception v2

    .line 205
    move-object v0, v1

    .line 206
    :goto_2
    invoke-static {v2}, Lcom/tantanapp/common/network/NetReporter;->reportError(Ljava/lang/Throwable;)V

    .line 207
    .line 208
    .line 209
    :cond_3
    :goto_3
    if-eqz v0, :cond_4

    .line 210
    .line 211
    if-nez v1, :cond_4

    .line 212
    .line 213
    new-instance p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 214
    .line 215
    invoke-direct {p1, p0, v0}, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;-><init>(Ll/i5d0;Lcom/p1/mobile/putong/data/AccountErrorResponse;)V

    .line 216
    .line 217
    .line 218
    return-object p1

    .line 219
    :cond_4
    if-eqz v1, :cond_d

    .line 220
    .line 221
    new-instance p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 222
    .line 223
    invoke-direct {p1, p0, v1}, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;-><init>(Ll/i5d0;Lcom/p1/mobile/putong/data/Meta;)V

    .line 224
    .line 225
    .line 226
    return-object p1

    .line 227
    :cond_5
    instance-of v0, p1, Lcom/tantanapp/common/network/ApiExcep$Client$Forbidden;

    .line 228
    .line 229
    if-eqz v0, :cond_7

    .line 230
    .line 231
    invoke-virtual {p0}, Ll/i5d0;->k()Ll/k5d0;

    .line 232
    .line 233
    .line 234
    move-result-object p1

    .line 235
    :try_start_4
    invoke-virtual {p1}, Ll/k5d0;->string()Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object v0

    .line 239
    sget-object v2, Lcom/p1/mobile/putong/data/Envelope;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 240
    .line 241
    invoke-virtual {v2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 242
    .line 243
    .line 244
    move-result-object v0

    .line 245
    check-cast v0, Lcom/p1/mobile/putong/data/Envelope;

    .line 246
    .line 247
    if-nez v0, :cond_6

    .line 248
    .line 249
    goto :goto_4

    .line 250
    :cond_6
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Envelope;->meta:Lcom/p1/mobile/putong/data/Meta;
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_4

    .line 251
    .line 252
    goto :goto_4

    .line 253
    :catch_4
    move-exception v0

    .line 254
    invoke-static {v0}, Lcom/tantanapp/common/network/NetReporter;->reportError(Ljava/lang/Throwable;)V

    .line 255
    .line 256
    .line 257
    :try_start_5
    invoke-virtual {p1}, Ll/k5d0;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_5

    .line 258
    .line 259
    .line 260
    goto :goto_4

    .line 261
    :catch_5
    move-exception p1

    .line 262
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 263
    .line 264
    .line 265
    :goto_4
    new-instance p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 266
    .line 267
    invoke-direct {p1, p0, v1}, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;-><init>(Ll/i5d0;Lcom/p1/mobile/putong/data/Meta;)V

    .line 268
    .line 269
    .line 270
    return-object p1

    .line 271
    :cond_7
    instance-of v0, p1, Lcom/tantanapp/common/network/ApiExcep$Server;

    .line 272
    .line 273
    if-eqz v0, :cond_d

    .line 274
    .line 275
    invoke-virtual {p0}, Ll/i5d0;->k()Ll/k5d0;

    .line 276
    .line 277
    .line 278
    move-result-object p1

    .line 279
    :try_start_6
    invoke-virtual {p1}, Ll/k5d0;->string()Ljava/lang/String;

    .line 280
    .line 281
    .line 282
    move-result-object p1

    .line 283
    sget-object v0, Lcom/p1/mobile/putong/data/AccountErrorResponse;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 284
    .line 285
    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 286
    .line 287
    .line 288
    move-result-object v0

    .line 289
    check-cast v0, Lcom/p1/mobile/putong/data/AccountErrorResponse;
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_8
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 290
    .line 291
    if-eqz v0, :cond_8

    .line 292
    .line 293
    :try_start_7
    iget v2, v0, Lcom/p1/mobile/putong/data/AccountErrorResponse;->code:I

    .line 294
    .line 295
    if-nez v2, :cond_a

    .line 296
    .line 297
    goto :goto_5

    .line 298
    :catchall_0
    move-exception p1

    .line 299
    goto :goto_a

    .line 300
    :catch_6
    move-exception p1

    .line 301
    goto :goto_8

    .line 302
    :cond_8
    :goto_5
    sget-object v2, Lcom/p1/mobile/putong/data/Envelope;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 303
    .line 304
    invoke-virtual {v2, p1}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 305
    .line 306
    .line 307
    move-result-object p1

    .line 308
    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    .line 309
    .line 310
    if-nez p1, :cond_9

    .line 311
    .line 312
    goto :goto_6

    .line 313
    :cond_9
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Envelope;->meta:Lcom/p1/mobile/putong/data/Meta;
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_6
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 314
    .line 315
    :cond_a
    :goto_6
    :try_start_8
    invoke-virtual {p0}, Ll/i5d0;->k()Ll/k5d0;

    .line 316
    .line 317
    .line 318
    move-result-object p1

    .line 319
    :goto_7
    invoke-virtual {p1}, Ll/k5d0;->close()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_7

    .line 320
    .line 321
    .line 322
    goto :goto_9

    .line 323
    :catch_7
    move-exception p1

    .line 324
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 325
    .line 326
    .line 327
    goto :goto_9

    .line 328
    :catch_8
    move-exception p1

    .line 329
    move-object v0, v1

    .line 330
    :goto_8
    :try_start_9
    invoke-virtual {p0}, Ll/i5d0;->q()I

    .line 331
    .line 332
    .line 333
    move-result v2

    .line 334
    const/16 v3, 0x1f7

    .line 335
    .line 336
    if-ne v2, v3, :cond_b

    .line 337
    .line 338
    invoke-static {p1}, Lcom/tantanapp/common/network/NetReporter;->reportError(Ljava/lang/Throwable;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 339
    .line 340
    .line 341
    :cond_b
    :try_start_a
    invoke-virtual {p0}, Ll/i5d0;->k()Ll/k5d0;

    .line 342
    .line 343
    .line 344
    move-result-object p1
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_7

    .line 345
    goto :goto_7

    .line 346
    :goto_9
    invoke-virtual {p0}, Ll/i5d0;->q()I

    .line 347
    .line 348
    .line 349
    move-result p1

    .line 350
    if-eqz v0, :cond_c

    .line 351
    .line 352
    iget v0, v0, Lcom/p1/mobile/putong/data/AccountErrorResponse;->code:I

    .line 353
    .line 354
    if-eqz v0, :cond_c

    .line 355
    .line 356
    move p1, v0

    .line 357
    :cond_c
    new-instance v0, Lcom/p1/mobile/putong/api/api/TantanException$ServerException;

    .line 358
    .line 359
    invoke-direct {v0, p0, p1, v1}, Lcom/p1/mobile/putong/api/api/TantanException$ServerException;-><init>(Ll/i5d0;ILcom/p1/mobile/putong/data/Meta;)V

    .line 360
    .line 361
    .line 362
    return-object v0

    .line 363
    :goto_a
    :try_start_b
    invoke-virtual {p0}, Ll/i5d0;->k()Ll/k5d0;

    .line 364
    .line 365
    .line 366
    move-result-object p0

    .line 367
    invoke-virtual {p0}, Ll/k5d0;->close()V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_9

    .line 368
    .line 369
    .line 370
    goto :goto_b

    .line 371
    :catch_9
    move-exception p0

    .line 372
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 373
    .line 374
    .line 375
    :goto_b
    throw p1

    .line 376
    :cond_d
    return-object p1
.end method

.method public common()Ll/x1d0$a;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/api/api/Network;->common(Ll/x1d0$a;)Ll/x1d0$a;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public debug_noAuth()Ll/x1d0$a;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/api/Network;->common()Ll/x1d0$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public debug_removeProxy()V
    .locals 0

    return-void
.end method

.method public debug_setProxy()V
    .locals 0

    return-void
.end method

.method public debug_timeout_for_http(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/api/api/Network;->http:Ll/rg50;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/rg50;->v()Ll/rg50$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    int-to-long v1, p1

    .line 8
    sget-object p1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2, p1}, Ll/rg50$b;->u(JLjava/util/concurrent/TimeUnit;)Ll/rg50$b;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ll/rg50$b;->c()Ll/rg50;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iput-object p1, p0, Lcom/p1/mobile/putong/api/api/Network;->http:Ll/rg50;

    .line 18
    .line 19
    new-instance v1, Ll/j650;

    .line 20
    .line 21
    invoke-direct {v1, p1}, Ll/j650;-><init>(Ll/rg50;)V

    .line 22
    .line 23
    .line 24
    iput-object v1, p0, Lcom/p1/mobile/putong/api/api/Network;->httpProxy:Ll/j650;

    .line 25
    .line 26
    invoke-virtual {v0}, Ll/rg50$b;->c()Ll/rg50;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iput-object p1, p0, Lcom/p1/mobile/putong/api/api/Network;->cloudHttp:Ll/rg50;

    .line 31
    .line 32
    return-void
.end method

.method public fakeToken(Ljava/lang/String;Ljava/lang/String;Ll/z1d0;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 26
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0, p3}, Lcom/p1/mobile/putong/api/api/Network;->authToken(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/z1d0;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public fakeToken(Ljava/lang/String;Ll/z1d0;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/api/api/TimeConverter;->switchTime(J)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-direct {p0, p1, v0, v1, p2}, Lcom/p1/mobile/putong/api/api/Network;->authToken(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/z1d0;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public getDownloadHttp()Ll/rg50;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/api/api/Network;->downloadHttp:Ll/rg50;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/api/api/Network;->http:Ll/rg50;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/rg50;->v()Ll/rg50$b;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Ll/q9c;->c(Ll/rg50$b;)V

    .line 12
    .line 13
    .line 14
    const-wide/16 v1, 0x2710

    .line 15
    .line 16
    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 17
    .line 18
    invoke-virtual {v0, v1, v2, v3}, Ll/rg50$b;->f(JLjava/util/concurrent/TimeUnit;)Ll/rg50$b;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1, v2, v3}, Ll/rg50$b;->u(JLjava/util/concurrent/TimeUnit;)Ll/rg50$b;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ll/rg50$b;->c()Ll/rg50;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iput-object v0, p0, Lcom/p1/mobile/putong/api/api/Network;->downloadHttp:Ll/rg50;

    .line 29
    .line 30
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/api/api/Network;->downloadHttp:Ll/rg50;

    .line 31
    .line 32
    return-object p0
.end method

.method public getHttp(Ll/x1d0;)Ll/rg50;
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/x1d0;->i()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Ll/d3d0;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/x1d0;->i()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Ll/d3d0;

    .line 14
    .line 15
    const-string v0, "cloud_tag"

    .line 16
    .line 17
    iget-object p1, p1, Ll/d3d0;->b:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/api/api/Network;->cloudHttp:Ll/rg50;

    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/api/Network;->getNormalHttp()Ll/rg50;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method

.method public getNormalHttp()Ll/rg50;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/api/api/Network;->httpProxy:Ll/j650;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/j650;->e()Ll/rg50;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public guessedCurrentServerTime()J
    .locals 8

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/api/api/Network;->lastServerTime:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v4, v0, v2

    .line 6
    .line 7
    if-lez v4, :cond_0

    .line 8
    .line 9
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 10
    .line 11
    .line 12
    move-result-wide v4

    .line 13
    iget-wide v6, p0, Lcom/p1/mobile/putong/api/api/Network;->lastElapsedRealtime:J

    .line 14
    .line 15
    sub-long/2addr v4, v6

    .line 16
    add-long/2addr v0, v4

    .line 17
    cmp-long p0, v0, v2

    .line 18
    .line 19
    if-lez p0, :cond_0

    .line 20
    .line 21
    return-wide v0

    .line 22
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 23
    .line 24
    .line 25
    move-result-wide v0

    .line 26
    return-wide v0
.end method

.method public invalidHashAccount()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/putong/api/api/Network;->hashAccount:Ljava/lang/String;

    .line 3
    .line 4
    return-void
.end method

.method public isChristmasEventEnabled()Z
    .locals 7

    .line 1
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v5, 0x0

    .line 6
    const/4 v6, 0x1

    .line 7
    const/16 v1, 0x7e1

    .line 8
    .line 9
    const/16 v2, 0xb

    .line 10
    .line 11
    const/16 v3, 0x19

    .line 12
    .line 13
    const/4 v4, 0x0

    .line 14
    invoke-virtual/range {v0 .. v6}, Ljava/util/Calendar;->set(IIIIII)V

    .line 15
    .line 16
    .line 17
    const/4 v1, -0x7

    .line 18
    const/4 v2, 0x6

    .line 19
    invoke-virtual {v0, v2, v1}, Ljava/util/Calendar;->add(II)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 23
    .line 24
    .line 25
    move-result-wide v3

    .line 26
    const/16 v1, 0xe

    .line 27
    .line 28
    invoke-virtual {v0, v2, v1}, Ljava/util/Calendar;->add(II)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 32
    .line 33
    .line 34
    move-result-wide v0

    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 36
    .line 37
    .line 38
    move-result-wide v5

    .line 39
    cmp-long p0, v3, v5

    .line 40
    .line 41
    if-gtz p0, :cond_0

    .line 42
    .line 43
    cmp-long p0, v0, v5

    .line 44
    .line 45
    if-ltz p0, :cond_0

    .line 46
    .line 47
    const/4 p0, 0x1

    .line 48
    return p0

    .line 49
    :cond_0
    const/4 p0, 0x0

    .line 50
    return p0
.end method

.method public maybeUpdateRequestBeforeCall(Ll/x1d0;)Ll/x1d0;
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    const-string v0, "MAC "

    .line 2
    .line 3
    const-string v1, "MAC "

    .line 4
    .line 5
    const-string v2, "maybeUpdateRequestBeforeCall waited testGroup for "

    .line 6
    .line 7
    const-string v3, "maybeUpdateRequestBeforeCall start \uff0cthread="

    .line 8
    .line 9
    const-string v4, "auth called with coreApi = null"

    .line 10
    .line 11
    invoke-static {}, Ll/u11;->f()V

    .line 12
    .line 13
    .line 14
    const-string v5, "Authorization"

    .line 15
    .line 16
    invoke-virtual {p1, v5}, Ll/x1d0;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v5

    .line 20
    invoke-virtual {p1}, Ll/x1d0;->h()Ll/x1d0$a;

    .line 21
    .line 22
    .line 23
    move-result-object v6

    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 25
    .line 26
    .line 27
    move-result-wide v7

    .line 28
    invoke-static {v7, v8}, Lcom/p1/mobile/putong/api/api/TimeConverter;->switchTime(J)J

    .line 29
    .line 30
    .line 31
    move-result-wide v7

    .line 32
    invoke-static {v7, v8}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v7

    .line 36
    invoke-virtual {p1}, Ll/x1d0;->k()Ll/rnl;

    .line 37
    .line 38
    .line 39
    move-result-object v8

    .line 40
    invoke-direct {p0, v8, v6, v7}, Lcom/p1/mobile/putong/api/api/Network;->mayAddLocationHeader(Ll/rnl;Ll/x1d0$a;Ljava/lang/String;)Ll/x1d0$a;

    .line 41
    .line 42
    .line 43
    const/16 v8, 0x64

    .line 44
    .line 45
    const/4 v9, 0x2

    .line 46
    if-eqz v5, :cond_4

    .line 47
    .line 48
    const-string v10, "ac"

    .line 49
    .line 50
    invoke-virtual {v5, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v10

    .line 54
    if-eqz v10, :cond_4

    .line 55
    .line 56
    invoke-static {}, Lcom/p1/mobile/putong/api/api/Network;->hasInvalidHash()Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_3

    .line 61
    .line 62
    monitor-enter p0

    .line 63
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/api/api/Network;->hasInvalidHash()Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-eqz v0, :cond_2

    .line 68
    .line 69
    invoke-static {}, Ll/uqb0;->J0()Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-eqz v0, :cond_0

    .line 74
    .line 75
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 76
    .line 77
    invoke-interface {v0}, Ll/bn5;->accessToken()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-eqz v0, :cond_0

    .line 86
    .line 87
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 88
    .line 89
    invoke-interface {v0}, Ll/bn5;->U4()Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-eqz v0, :cond_0

    .line 94
    .line 95
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 96
    .line 97
    new-instance v5, Ljava/lang/StringBuilder;

    .line 98
    .line 99
    invoke-direct {v5, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p1}, Ll/x1d0;->k()Ll/rnl;

    .line 103
    .line 104
    .line 105
    move-result-object v4

    .line 106
    invoke-virtual {v4}, Ll/rnl;->toString()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v4

    .line 110
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v4

    .line 117
    invoke-direct {v0, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 121
    .line 122
    .line 123
    goto :goto_0

    .line 124
    :catchall_0
    move-exception p1

    .line 125
    goto/16 :goto_2

    .line 126
    .line 127
    :cond_0
    :goto_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/api/api/Network;->uploadAdData()V

    .line 128
    .line 129
    .line 130
    const-string v0, "[putong-common][ab]"

    .line 131
    .line 132
    new-instance v4, Ljava/lang/StringBuilder;

    .line 133
    .line 134
    invoke-direct {v4, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 138
    .line 139
    .line 140
    move-result-object v3

    .line 141
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    const-string v3, ",hasRequestAb="

    .line 145
    .line 146
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    iget-boolean v3, p0, Lcom/p1/mobile/putong/api/api/Network;->hasRequestAb:Z

    .line 150
    .line 151
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v3

    .line 158
    invoke-static {v0, v3}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    invoke-direct {p0}, Lcom/p1/mobile/putong/api/api/Network;->prepareSimpleXml()Ll/bkj0;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    sget-object v3, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 166
    .line 167
    invoke-virtual {v3}, Lcom/tantanapp/common/data/JsonAdapter;->MAP_ADAPTER()Lcom/tantanapp/common/data/JsonAdapter;

    .line 168
    .line 169
    .line 170
    move-result-object v3

    .line 171
    iget-object v0, v0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 172
    .line 173
    check-cast v0, Ljava/util/Map;

    .line 174
    .line 175
    invoke-virtual {v3, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;)Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    const-string v3, "UTF-8"

    .line 180
    .line 181
    invoke-virtual {v0, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    invoke-static {v0}, Ll/iiw;->b([B)[B

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    invoke-static {v0, v9}, Ll/te2;->c([BI)Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    iget-boolean v3, p0, Lcom/p1/mobile/putong/api/api/Network;->hasRequestAb:Z

    .line 194
    .line 195
    if-nez v3, :cond_1

    .line 196
    .line 197
    const/4 v3, 0x1

    .line 198
    iput-boolean v3, p0, Lcom/p1/mobile/putong/api/api/Network;->hasRequestAb:Z

    .line 199
    .line 200
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 201
    .line 202
    .line 203
    move-result-wide v3

    .line 204
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 205
    .line 206
    .line 207
    move-result-object v5

    .line 208
    invoke-static {v5}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    sget-object v5, Ll/uqb0;->Q:Ll/l2;

    .line 212
    .line 213
    invoke-virtual {v5}, Ll/l2;->V()V

    .line 214
    .line 215
    .line 216
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 217
    .line 218
    .line 219
    move-result-object v5

    .line 220
    invoke-static {v5}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    const-string v5, "[putong-common][ab]"

    .line 224
    .line 225
    new-instance v9, Ljava/lang/StringBuilder;

    .line 226
    .line 227
    invoke-direct {v9, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 228
    .line 229
    .line 230
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 231
    .line 232
    .line 233
    move-result-wide v10

    .line 234
    sub-long/2addr v10, v3

    .line 235
    invoke-virtual {v9, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 236
    .line 237
    .line 238
    const-string v2, " ms\uff0cthread="

    .line 239
    .line 240
    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 241
    .line 242
    .line 243
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 244
    .line 245
    .line 246
    move-result-object v2

    .line 247
    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 248
    .line 249
    .line 250
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 251
    .line 252
    .line 253
    move-result-object v2

    .line 254
    invoke-static {v5, v2}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 255
    .line 256
    .line 257
    goto :goto_1

    .line 258
    :cond_1
    invoke-static {v9}, Lcom/p1/mobile/putong/api/ABManager;->v(I)Z

    .line 259
    .line 260
    .line 261
    :goto_1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 262
    .line 263
    .line 264
    move-result-wide v2

    .line 265
    iput-wide v2, p0, Lcom/p1/mobile/putong/api/api/Network;->updateTimeInSinceDeviceBootRealMillis:J

    .line 266
    .line 267
    iget-object v2, p0, Lcom/p1/mobile/putong/api/api/Network;->hash:Lrx/subjects/a;

    .line 268
    .line 269
    invoke-virtual {v2, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 270
    .line 271
    .line 272
    :cond_2
    monitor-exit p0

    .line 273
    goto :goto_3

    .line 274
    :goto_2
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 275
    throw p1

    .line 276
    :cond_3
    :goto_3
    :try_start_1
    invoke-direct {p0, p1, v6, v7}, Lcom/p1/mobile/putong/api/api/Network;->mayEncryptBody(Ll/x1d0;Ll/x1d0$a;Ljava/lang/String;)Ll/x1d0;

    .line 277
    .line 278
    .line 279
    move-result-object p1

    .line 280
    const-string v0, "Authorization"

    .line 281
    .line 282
    new-instance v2, Ljava/lang/StringBuilder;

    .line 283
    .line 284
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 285
    .line 286
    .line 287
    invoke-virtual {p1}, Ll/x1d0;->k()Ll/rnl;

    .line 288
    .line 289
    .line 290
    move-result-object v1

    .line 291
    invoke-virtual {v1}, Ll/rnl;->toString()Ljava/lang/String;

    .line 292
    .line 293
    .line 294
    move-result-object v1

    .line 295
    iget-object v3, p0, Lcom/p1/mobile/putong/api/api/Network;->hash:Lrx/subjects/a;

    .line 296
    .line 297
    invoke-virtual {v3}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 298
    .line 299
    .line 300
    move-result-object v3

    .line 301
    check-cast v3, Ljava/lang/String;

    .line 302
    .line 303
    invoke-virtual {p1}, Ll/x1d0;->a()Ll/z1d0;

    .line 304
    .line 305
    .line 306
    move-result-object p1

    .line 307
    invoke-direct {p0, v1, v7, v3, p1}, Lcom/p1/mobile/putong/api/api/Network;->authToken(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/z1d0;)Ljava/lang/String;

    .line 308
    .line 309
    .line 310
    move-result-object p0

    .line 311
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 312
    .line 313
    .line 314
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 315
    .line 316
    .line 317
    move-result-object p0

    .line 318
    invoke-virtual {v6, v0, p0}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0

    .line 319
    .line 320
    .line 321
    goto/16 :goto_7

    .line 322
    .line 323
    :catch_0
    move-exception p0

    .line 324
    invoke-static {p0, v8}, Lcom/tantanapp/common/utils/CrashHelper;->d(Ljava/lang/Throwable;I)V

    .line 325
    .line 326
    .line 327
    new-instance p1, Lcom/tantanapp/common/network/NetIgnoredException;

    .line 328
    .line 329
    invoke-direct {p1, p0}, Lcom/tantanapp/common/network/NetIgnoredException;-><init>(Ljava/lang/Exception;)V

    .line 330
    .line 331
    .line 332
    throw p1

    .line 333
    :cond_4
    if-eqz v5, :cond_7

    .line 334
    .line 335
    const-string v1, "abs"

    .line 336
    .line 337
    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 338
    .line 339
    .line 340
    move-result v1

    .line 341
    if-eqz v1, :cond_7

    .line 342
    .line 343
    iget-object v1, p0, Lcom/p1/mobile/putong/api/api/Network;->hashAccount:Ljava/lang/String;

    .line 344
    .line 345
    if-nez v1, :cond_6

    .line 346
    .line 347
    monitor-enter p0

    .line 348
    :try_start_2
    iget-object v1, p0, Lcom/p1/mobile/putong/api/api/Network;->hashAccount:Ljava/lang/String;

    .line 349
    .line 350
    if-nez v1, :cond_5

    .line 351
    .line 352
    invoke-direct {p0}, Lcom/p1/mobile/putong/api/api/Network;->prepareSimpleXml()Ll/bkj0;

    .line 353
    .line 354
    .line 355
    move-result-object v1

    .line 356
    sget-object v2, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 357
    .line 358
    invoke-virtual {v2}, Lcom/tantanapp/common/data/JsonAdapter;->MAP_ADAPTER()Lcom/tantanapp/common/data/JsonAdapter;

    .line 359
    .line 360
    .line 361
    move-result-object v2

    .line 362
    iget-object v1, v1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 363
    .line 364
    check-cast v1, Ljava/util/Map;

    .line 365
    .line 366
    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;)Ljava/lang/String;

    .line 367
    .line 368
    .line 369
    move-result-object v1

    .line 370
    const-string v2, "UTF-8"

    .line 371
    .line 372
    invoke-virtual {v1, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 373
    .line 374
    .line 375
    move-result-object v1

    .line 376
    invoke-static {v1}, Ll/iiw;->b([B)[B

    .line 377
    .line 378
    .line 379
    move-result-object v1

    .line 380
    invoke-static {v1, v9}, Ll/te2;->c([BI)Ljava/lang/String;

    .line 381
    .line 382
    .line 383
    move-result-object v1

    .line 384
    iput-object v1, p0, Lcom/p1/mobile/putong/api/api/Network;->hashAccount:Ljava/lang/String;

    .line 385
    .line 386
    sget-object v1, Ll/uqb0;->Q:Ll/l2;

    .line 387
    .line 388
    invoke-virtual {v1}, Ll/l2;->U()V

    .line 389
    .line 390
    .line 391
    goto :goto_4

    .line 392
    :catchall_1
    move-exception p1

    .line 393
    goto :goto_5

    .line 394
    :cond_5
    :goto_4
    monitor-exit p0

    .line 395
    goto :goto_6

    .line 396
    :goto_5
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 397
    throw p1

    .line 398
    :cond_6
    :goto_6
    :try_start_3
    invoke-direct {p0, p1, v6, v7}, Lcom/p1/mobile/putong/api/api/Network;->mayEncryptBody(Ll/x1d0;Ll/x1d0$a;Ljava/lang/String;)Ll/x1d0;

    .line 399
    .line 400
    .line 401
    move-result-object p1

    .line 402
    const-string v1, "Authorization"

    .line 403
    .line 404
    new-instance v2, Ljava/lang/StringBuilder;

    .line 405
    .line 406
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 407
    .line 408
    .line 409
    invoke-virtual {p1}, Ll/x1d0;->k()Ll/rnl;

    .line 410
    .line 411
    .line 412
    move-result-object v0

    .line 413
    invoke-virtual {v0}, Ll/rnl;->toString()Ljava/lang/String;

    .line 414
    .line 415
    .line 416
    move-result-object v0

    .line 417
    iget-object v3, p0, Lcom/p1/mobile/putong/api/api/Network;->hashAccount:Ljava/lang/String;

    .line 418
    .line 419
    invoke-virtual {p1}, Ll/x1d0;->a()Ll/z1d0;

    .line 420
    .line 421
    .line 422
    move-result-object p1

    .line 423
    invoke-direct {p0, v0, v7, v3, p1}, Lcom/p1/mobile/putong/api/api/Network;->authToken(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/z1d0;)Ljava/lang/String;

    .line 424
    .line 425
    .line 426
    move-result-object p0

    .line 427
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 428
    .line 429
    .line 430
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 431
    .line 432
    .line 433
    move-result-object p0

    .line 434
    invoke-virtual {v6, v1, p0}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;
    :try_end_3
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3 .. :try_end_3} :catch_1

    .line 435
    .line 436
    .line 437
    goto :goto_7

    .line 438
    :catch_1
    move-exception p0

    .line 439
    invoke-static {p0, v8}, Lcom/tantanapp/common/utils/CrashHelper;->d(Ljava/lang/Throwable;I)V

    .line 440
    .line 441
    .line 442
    new-instance p1, Lcom/tantanapp/common/network/NetIgnoredException;

    .line 443
    .line 444
    invoke-direct {p1, p0}, Lcom/tantanapp/common/network/NetIgnoredException;-><init>(Ljava/lang/Exception;)V

    .line 445
    .line 446
    .line 447
    throw p1

    .line 448
    :cond_7
    if-eqz v5, :cond_8

    .line 449
    .line 450
    const-string v0, "aa"

    .line 451
    .line 452
    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 453
    .line 454
    .line 455
    move-result v0

    .line 456
    if-eqz v0, :cond_8

    .line 457
    .line 458
    invoke-direct {p0, p1, v6, v7}, Lcom/p1/mobile/putong/api/api/Network;->mayEncryptBody(Ll/x1d0;Ll/x1d0$a;Ljava/lang/String;)Ll/x1d0;

    .line 459
    .line 460
    .line 461
    move-result-object p0

    .line 462
    const-string p1, "Authorization"

    .line 463
    .line 464
    new-instance v0, Ljava/lang/StringBuilder;

    .line 465
    .line 466
    const-string v1, "MAC "

    .line 467
    .line 468
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 469
    .line 470
    .line 471
    invoke-virtual {p0}, Ll/x1d0;->k()Ll/rnl;

    .line 472
    .line 473
    .line 474
    move-result-object v1

    .line 475
    invoke-virtual {v1}, Ll/rnl;->toString()Ljava/lang/String;

    .line 476
    .line 477
    .line 478
    move-result-object v1

    .line 479
    invoke-virtual {p0}, Ll/x1d0;->a()Ll/z1d0;

    .line 480
    .line 481
    .line 482
    move-result-object p0

    .line 483
    invoke-static {v1, v7, p0}, Lcom/p1/mobile/putong/api/api/Network;->basicToken(Ljava/lang/String;Ljava/lang/String;Ll/z1d0;)Ljava/lang/String;

    .line 484
    .line 485
    .line 486
    move-result-object p0

    .line 487
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 488
    .line 489
    .line 490
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 491
    .line 492
    .line 493
    move-result-object p0

    .line 494
    invoke-virtual {v6, p1, p0}, Ll/x1d0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 495
    .line 496
    .line 497
    :cond_8
    :goto_7
    invoke-virtual {v6}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 498
    .line 499
    .line 500
    move-result-object p0

    .line 501
    sget-boolean p1, Lcom/p1/mobile/putong/api/api/Network;->debug_fakeServerUnavailable:Z

    .line 502
    .line 503
    if-eqz p1, :cond_9

    .line 504
    .line 505
    invoke-virtual {p0}, Ll/x1d0;->h()Ll/x1d0$a;

    .line 506
    .line 507
    .line 508
    move-result-object p0

    .line 509
    const-string p1, "http://core.unstable.putong.p1staff.com/service-unavailable"

    .line 510
    .line 511
    invoke-virtual {p0, p1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 512
    .line 513
    .line 514
    move-result-object p0

    .line 515
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 516
    .line 517
    .line 518
    move-result-object p0

    .line 519
    :cond_9
    return-object p0
.end method

.method public resetNetworkControlParams()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/putong/api/api/Network;->updateTimeInSinceDeviceBootRealMillis:J

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Lcom/p1/mobile/putong/api/api/Network;->hasRequestAb:Z

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/api/api/Network;->hash:Lrx/subjects/a;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public seal(Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return-object p0

    .line 5
    :cond_0
    :try_start_0
    const-string v0, "OmwMfS0HBsSAVj64g1smBi76zurVMSBn"

    .line 6
    .line 7
    const-string v1, "UTF-8"

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {p1}, Ll/rjj;->a(Ljava/lang/String;)[B

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    new-instance v1, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;

    .line 18
    .line 19
    new-instance p1, Lorg/spongycastle/crypto/modes/CBCBlockCipher;

    .line 20
    .line 21
    new-instance v3, Lorg/spongycastle/crypto/engines/AESFastEngine;

    .line 22
    .line 23
    invoke-direct {v3}, Lorg/spongycastle/crypto/engines/AESFastEngine;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-direct {p1, v3}, Lorg/spongycastle/crypto/modes/CBCBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    .line 27
    .line 28
    .line 29
    invoke-direct {v1, p1}, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    .line 30
    .line 31
    .line 32
    new-instance p1, Ljava/util/Random;

    .line 33
    .line 34
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 35
    .line 36
    .line 37
    move-result-wide v3

    .line 38
    const-wide/16 v5, 0x467

    .line 39
    .line 40
    add-long/2addr v3, v5

    .line 41
    invoke-direct {p1, v3, v4}, Ljava/util/Random;-><init>(J)V

    .line 42
    .line 43
    .line 44
    const/16 v7, 0x10

    .line 45
    .line 46
    new-array v8, v7, [B

    .line 47
    .line 48
    invoke-virtual {p1, v8}, Ljava/util/Random;->nextBytes([B)V

    .line 49
    .line 50
    .line 51
    new-instance p1, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 52
    .line 53
    new-instance v3, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 54
    .line 55
    invoke-direct {v3, v0}, Lorg/spongycastle/crypto/params/KeyParameter;-><init>([B)V

    .line 56
    .line 57
    .line 58
    invoke-direct {p1, v3, v8}, Lorg/spongycastle/crypto/params/ParametersWithIV;-><init>(Lorg/spongycastle/crypto/CipherParameters;[B)V

    .line 59
    .line 60
    .line 61
    const/4 v0, 0x1

    .line 62
    invoke-virtual {v1, v0, p1}, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 63
    .line 64
    .line 65
    array-length p1, v2

    .line 66
    invoke-virtual {v1, p1}, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->getOutputSize(I)I

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    new-array v5, p1, [B

    .line 71
    .line 72
    array-length v4, v2

    .line 73
    const/4 v6, 0x0

    .line 74
    const/4 v3, 0x0

    .line 75
    invoke-virtual/range {v1 .. v6}, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->processBytes([BII[BI)I

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    invoke-virtual {v1, v5, v0}, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->doFinal([BI)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 80
    .line 81
    .line 82
    add-int p0, v7, p1

    .line 83
    .line 84
    new-array p0, p0, [B

    .line 85
    .line 86
    const/4 v0, 0x0

    .line 87
    invoke-static {v8, v0, p0, v0, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 88
    .line 89
    .line 90
    invoke-static {v5, v0, p0, v7, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 91
    .line 92
    .line 93
    const/4 p1, 0x2

    .line 94
    invoke-static {p0, p1}, Ll/te2;->c([BI)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    return-object p0

    .line 99
    :catch_0
    move-exception v0

    .line 100
    move-object p1, v0

    .line 101
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 102
    .line 103
    .line 104
    return-object p0
.end method

.method public updateServerTime(Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/api/api/Network;->lastServerTime:J

    .line 2
    .line 3
    const-wide/16 v2, -0x1

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    :try_start_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    iput-wide v0, p0, Lcom/p1/mobile/putong/api/api/Network;->lastElapsedRealtime:J

    .line 16
    .line 17
    sget-object v0, Lcom/p1/mobile/putong/api/api/Network;->dateHeaderFormat:Ljava/lang/ThreadLocal;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ljava/text/SimpleDateFormat;

    .line 24
    .line 25
    invoke-virtual {v0, p1}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    .line 30
    .line 31
    .line 32
    move-result-wide v0

    .line 33
    iput-wide v0, p0, Lcom/p1/mobile/putong/api/api/Network;->lastServerTime:J
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    .line 35
    return-void

    .line 36
    :catch_0
    move-exception p0

    .line 37
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method public useNewConnectionPool()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/api/api/Network;->httpProxy:Ll/j650;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, v0}, Ll/j650;->g(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
