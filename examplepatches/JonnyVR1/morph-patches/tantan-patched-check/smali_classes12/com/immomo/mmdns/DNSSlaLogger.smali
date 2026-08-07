.class public final Lcom/immomo/mmdns/DNSSlaLogger;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/mmdns/DNSSlaLogger$LogEvent;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0084\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010%\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\t\n\u0000\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0010\"\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\n\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010#\n\u0002\u0008\u0005\u0008\u00c6\u0002\u0018\u00002\u00020\u0001:\u0001AB\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u000f\u0010\u0005\u001a\u00020\u0004H\u0002\u00a2\u0006\u0004\u0008\u0005\u0010\u0003J\u000f\u0010\u0006\u001a\u00020\u0004H\u0002\u00a2\u0006\u0004\u0008\u0006\u0010\u0003J#\u0010\u000b\u001a\u00020\u00042\u0012\u0010\n\u001a\u000e\u0012\u0004\u0012\u00020\u0008\u0012\u0004\u0012\u00020\t0\u0007H\u0002\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJG\u0010\u0018\u001a\u00020\u00042\u0006\u0010\u000e\u001a\u00020\r2\u000c\u0010\u0011\u001a\u0008\u0012\u0004\u0012\u00020\u00100\u000f2\u000c\u0010\u0012\u001a\u0008\u0012\u0004\u0012\u00020\u00100\u000f2\u000c\u0010\u0015\u001a\u0008\u0012\u0004\u0012\u00020\u00140\u00132\u0006\u0010\u0017\u001a\u00020\u0016\u00a2\u0006\u0004\u0008\u0018\u0010\u0019J/\u0010\u001c\u001a\u00020\u00042 \u0010\u001b\u001a\u001c\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00020\u0008\u0012\u0004\u0012\u00020\t0\u0007\u0012\u0004\u0012\u00020\u0004\u0018\u00010\u001a\u00a2\u0006\u0004\u0008\u001c\u0010\u001dJ\u0015\u0010 \u001a\u00020\u00042\u0006\u0010\u001f\u001a\u00020\u001e\u00a2\u0006\u0004\u0008 \u0010!J3\u0010&\u001a\u00020\u00042\u0008\u0010\"\u001a\u0004\u0018\u00010\u00102\u0008\u0010#\u001a\u0004\u0018\u00010\u00102\u0008\u0010$\u001a\u0004\u0018\u00010\u00102\u0006\u0010%\u001a\u00020\u001e\u00a2\u0006\u0004\u0008&\u0010\'J\r\u0010(\u001a\u00020\u0004\u00a2\u0006\u0004\u0008(\u0010\u0003R\u0018\u0010*\u001a\u0004\u0018\u00010)8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008*\u0010+R\u0014\u0010,\u001a\u00020\u00108\u0006X\u0086T\u00a2\u0006\u0006\n\u0004\u0008,\u0010-R\u0014\u0010.\u001a\u00020\u00108\u0006X\u0086T\u00a2\u0006\u0006\n\u0004\u0008.\u0010-R\u0014\u0010/\u001a\u00020\u00108\u0006X\u0086T\u00a2\u0006\u0006\n\u0004\u0008/\u0010-R\u001c\u00102\u001a\u0008\u0012\u0004\u0012\u000201008\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u00082\u00103R\u0018\u00105\u001a\u0004\u0018\u0001048\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u00085\u00106R\u0016\u00107\u001a\u00020\u001e8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u00087\u00108R\u0016\u0010\u000e\u001a\u00020\r8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u000e\u00109R\u0018\u0010;\u001a\u0004\u0018\u00010:8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008;\u0010<R\u001c\u0010\u0015\u001a\u0008\u0012\u0004\u0012\u00020\u00140=8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0015\u0010>R0\u0010?\u001a\u001c\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00020\u0008\u0012\u0004\u0012\u00020\t0\u0007\u0012\u0004\u0012\u00020\u0004\u0018\u00010\u001a8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008?\u0010@\u00a8\u0006B"
    }
    d2 = {
        "Lcom/immomo/mmdns/DNSSlaLogger;",
        "",
        "<init>",
        "()V",
        "",
        "startLogging",
        "stopLogging",
        "",
        "Lcom/immomo/mmdns/DnsSlaHeader;",
        "Lcom/immomo/mmdns/DnsSlaData;",
        "logs",
        "flushAsync",
        "(Ljava/util/Map;)V",
        "",
        "flushInterval",
        "",
        "",
        "includes",
        "excludes",
        "",
        "",
        "excludeCodes",
        "Lkotlinx/coroutines/CoroutineDispatcher;",
        "dispatcher",
        "init",
        "(JLjava/util/List;Ljava/util/List;Ljava/util/Set;Lkotlinx/coroutines/CoroutineDispatcher;)V",
        "Lkotlin/Function1;",
        "listener",
        "setOnFlushListener",
        "(Lkotlin/jvm/functions/Function1;)V",
        "",
        "enable",
        "setEnable",
        "(Z)V",
        "host",
        "ip",
        "code",
        "isHttpDns",
        "log",
        "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V",
        "flush",
        "Ll/drb;",
        "scope",
        "Ll/drb;",
        "KEY_TOPIC",
        "Ljava/lang/String;",
        "KEY_HTTPDNS",
        "KEY_LOCALDNS",
        "Ll/fs4;",
        "Lcom/immomo/mmdns/DNSSlaLogger$LogEvent;",
        "dnsLogChannel",
        "Ll/fs4;",
        "Lkotlinx/coroutines/o;",
        "flushJob",
        "Lkotlinx/coroutines/o;",
        "isEnable",
        "Z",
        "J",
        "Lcom/immomo/mmdns/DomainMatcher;",
        "domainMatcher",
        "Lcom/immomo/mmdns/DomainMatcher;",
        "",
        "Ljava/util/Set;",
        "onFlushListener",
        "Lkotlin/jvm/functions/Function1;",
        "LogEvent",
        "mmdns_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/immomo/mmdns/DNSSlaLogger;

.field public static final KEY_HTTPDNS:Ljava/lang/String; = "HttpDns"
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final KEY_LOCALDNS:Ljava/lang/String; = "LocalDns"
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final KEY_TOPIC:Ljava/lang/String; = "DNS_SLA"
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static dnsLogChannel:Ll/fs4;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/fs4<",
            "Lcom/immomo/mmdns/DNSSlaLogger$LogEvent;",
            ">;"
        }
    .end annotation
.end field

.field private static domainMatcher:Lcom/immomo/mmdns/DomainMatcher;

.field private static excludeCodes:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static flushInterval:J

.field private static flushJob:Lkotlinx/coroutines/o;

.field private static volatile isEnable:Z

.field private static onFlushListener:Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/util/Map<",
            "Lcom/immomo/mmdns/DnsSlaHeader;",
            "Lcom/immomo/mmdns/DnsSlaData;",
            ">;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation
.end field

.field private static scope:Ll/drb;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/immomo/mmdns/DNSSlaLogger;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/immomo/mmdns/DNSSlaLogger;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/immomo/mmdns/DNSSlaLogger;->INSTANCE:Lcom/immomo/mmdns/DNSSlaLogger;

    .line 7
    .line 8
    const/4 v0, -0x2

    .line 9
    invoke-static {v0}, Ll/ns4;->a(I)Ll/fs4;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sput-object v0, Lcom/immomo/mmdns/DNSSlaLogger;->dnsLogChannel:Ll/fs4;

    .line 14
    .line 15
    const-wide/32 v0, 0x1d4c0

    .line 16
    .line 17
    .line 18
    sput-wide v0, Lcom/immomo/mmdns/DNSSlaLogger;->flushInterval:J

    .line 19
    .line 20
    new-instance v0, Ljava/util/LinkedHashSet;

    .line 21
    .line 22
    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    .line 23
    .line 24
    .line 25
    sput-object v0, Lcom/immomo/mmdns/DNSSlaLogger;->excludeCodes:Ljava/util/Set;

    .line 26
    .line 27
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic access$flushAsync(Lcom/immomo/mmdns/DNSSlaLogger;Ljava/util/Map;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/mmdns/DNSSlaLogger;->flushAsync(Ljava/util/Map;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic access$getDnsLogChannel$p(Lcom/immomo/mmdns/DNSSlaLogger;)Ll/fs4;
    .locals 0

    .line 1
    sget-object p0, Lcom/immomo/mmdns/DNSSlaLogger;->dnsLogChannel:Ll/fs4;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic access$getDomainMatcher$p(Lcom/immomo/mmdns/DNSSlaLogger;)Lcom/immomo/mmdns/DomainMatcher;
    .locals 0

    .line 1
    sget-object p0, Lcom/immomo/mmdns/DNSSlaLogger;->domainMatcher:Lcom/immomo/mmdns/DomainMatcher;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic access$getExcludeCodes$p(Lcom/immomo/mmdns/DNSSlaLogger;)Ljava/util/Set;
    .locals 0

    .line 1
    sget-object p0, Lcom/immomo/mmdns/DNSSlaLogger;->excludeCodes:Ljava/util/Set;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic access$getFlushInterval$p(Lcom/immomo/mmdns/DNSSlaLogger;)J
    .locals 2

    .line 1
    sget-wide v0, Lcom/immomo/mmdns/DNSSlaLogger;->flushInterval:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static final synthetic access$getFlushJob$p(Lcom/immomo/mmdns/DNSSlaLogger;)Lkotlinx/coroutines/o;
    .locals 0

    .line 1
    sget-object p0, Lcom/immomo/mmdns/DNSSlaLogger;->flushJob:Lkotlinx/coroutines/o;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic access$getOnFlushListener$p(Lcom/immomo/mmdns/DNSSlaLogger;)Lkotlin/jvm/functions/Function1;
    .locals 0

    .line 1
    sget-object p0, Lcom/immomo/mmdns/DNSSlaLogger;->onFlushListener:Lkotlin/jvm/functions/Function1;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic access$setDnsLogChannel$p(Lcom/immomo/mmdns/DNSSlaLogger;Ll/fs4;)V
    .locals 0

    .line 1
    sput-object p1, Lcom/immomo/mmdns/DNSSlaLogger;->dnsLogChannel:Ll/fs4;

    .line 2
    .line 3
    return-void
.end method

.method public static final synthetic access$setDomainMatcher$p(Lcom/immomo/mmdns/DNSSlaLogger;Lcom/immomo/mmdns/DomainMatcher;)V
    .locals 0

    .line 1
    sput-object p1, Lcom/immomo/mmdns/DNSSlaLogger;->domainMatcher:Lcom/immomo/mmdns/DomainMatcher;

    .line 2
    .line 3
    return-void
.end method

.method public static final synthetic access$setExcludeCodes$p(Lcom/immomo/mmdns/DNSSlaLogger;Ljava/util/Set;)V
    .locals 0

    .line 1
    sput-object p1, Lcom/immomo/mmdns/DNSSlaLogger;->excludeCodes:Ljava/util/Set;

    .line 2
    .line 3
    return-void
.end method

.method public static final synthetic access$setFlushInterval$p(Lcom/immomo/mmdns/DNSSlaLogger;J)V
    .locals 0

    .line 1
    sput-wide p1, Lcom/immomo/mmdns/DNSSlaLogger;->flushInterval:J

    .line 2
    .line 3
    return-void
.end method

.method public static final synthetic access$setFlushJob$p(Lcom/immomo/mmdns/DNSSlaLogger;Lkotlinx/coroutines/o;)V
    .locals 0

    .line 1
    sput-object p1, Lcom/immomo/mmdns/DNSSlaLogger;->flushJob:Lkotlinx/coroutines/o;

    .line 2
    .line 3
    return-void
.end method

.method public static final synthetic access$setOnFlushListener$p(Lcom/immomo/mmdns/DNSSlaLogger;Lkotlin/jvm/functions/Function1;)V
    .locals 0

    .line 1
    sput-object p1, Lcom/immomo/mmdns/DNSSlaLogger;->onFlushListener:Lkotlin/jvm/functions/Function1;

    .line 2
    .line 3
    return-void
.end method

.method private final flushAsync(Ljava/util/Map;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Lcom/immomo/mmdns/DnsSlaHeader;",
            "Lcom/immomo/mmdns/DnsSlaData;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/immomo/mmdns/DNSSlaLogger;->scope:Ll/drb;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v3, Lcom/immomo/mmdns/DNSSlaLogger$flushAsync$1;

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    invoke-direct {v3, p1, p0}, Lcom/immomo/mmdns/DNSSlaLogger$flushAsync$1;-><init>(Ljava/util/Map;Lkotlin/coroutines/Continuation;)V

    .line 9
    .line 10
    .line 11
    const/4 v4, 0x3

    .line 12
    const/4 v5, 0x0

    .line 13
    const/4 v1, 0x0

    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-static/range {v0 .. v5}, Ll/vh3;->b(Ll/drb;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Ll/utd;

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method private final startLogging()V
    .locals 6

    .line 1
    sget-object v0, Lcom/immomo/mmdns/DNSSlaLogger;->scope:Ll/drb;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v3, Lcom/immomo/mmdns/DNSSlaLogger$startLogging$1;

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    invoke-direct {v3, p0}, Lcom/immomo/mmdns/DNSSlaLogger$startLogging$1;-><init>(Lkotlin/coroutines/Continuation;)V

    .line 9
    .line 10
    .line 11
    const/4 v4, 0x3

    .line 12
    const/4 v5, 0x0

    .line 13
    const/4 v1, 0x0

    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-static/range {v0 .. v5}, Ll/vh3;->b(Ll/drb;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Ll/utd;

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method private final stopLogging()V
    .locals 2

    .line 1
    sget-object p0, Lcom/immomo/mmdns/DNSSlaLogger;->dnsLogChannel:Ll/fs4;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const/4 v1, 0x1

    .line 5
    invoke-static {p0, v0, v1, v0}, Ll/sme0$a;->a(Ll/sme0;Ljava/lang/Throwable;ILjava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    sget-object p0, Lcom/immomo/mmdns/DNSSlaLogger;->flushJob:Lkotlinx/coroutines/o;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-static {p0, v0, v1, v0}, Lkotlinx/coroutines/o$a;->a(Lkotlinx/coroutines/o;Ljava/util/concurrent/CancellationException;ILjava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    const/4 p0, -0x2

    .line 16
    invoke-static {p0}, Ll/ns4;->a(I)Ll/fs4;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    sput-object p0, Lcom/immomo/mmdns/DNSSlaLogger;->dnsLogChannel:Ll/fs4;

    .line 21
    .line 22
    sput-object v0, Lcom/immomo/mmdns/DNSSlaLogger;->flushJob:Lkotlinx/coroutines/o;

    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public final flush()V
    .locals 6

    .line 1
    sget-boolean p0, Lcom/immomo/mmdns/DNSSlaLogger;->isEnable:Z

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    sget-object v0, Lcom/immomo/mmdns/DNSSlaLogger;->scope:Ll/drb;

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    new-instance v3, Lcom/immomo/mmdns/DNSSlaLogger$flush$1;

    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    invoke-direct {v3, p0}, Lcom/immomo/mmdns/DNSSlaLogger$flush$1;-><init>(Lkotlin/coroutines/Continuation;)V

    .line 14
    .line 15
    .line 16
    const/4 v4, 0x3

    .line 17
    const/4 v5, 0x0

    .line 18
    const/4 v1, 0x0

    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-static/range {v0 .. v5}, Ll/vh3;->b(Ll/drb;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Ll/utd;

    .line 21
    .line 22
    .line 23
    :cond_1
    :goto_0
    return-void
.end method

.method public final init(JLjava/util/List;Ljava/util/List;Ljava/util/Set;Lkotlinx/coroutines/CoroutineDispatcher;)V
    .locals 2
    .param p3    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p5    # Ljava/util/Set;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p6    # Lkotlinx/coroutines/CoroutineDispatcher;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;",
            "Lkotlinx/coroutines/CoroutineDispatcher;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    const-wide/32 v0, 0xea60

    .line 14
    .line 15
    .line 16
    invoke-static {p1, p2, v0, v1}, Lkotlin/ranges/a;->c(JJ)J

    .line 17
    .line 18
    .line 19
    move-result-wide p0

    .line 20
    sput-wide p0, Lcom/immomo/mmdns/DNSSlaLogger;->flushInterval:J

    .line 21
    .line 22
    new-instance p0, Lcom/immomo/mmdns/DomainMatcher;

    .line 23
    .line 24
    invoke-direct {p0, p3, p4}, Lcom/immomo/mmdns/DomainMatcher;-><init>(Ljava/util/List;Ljava/util/List;)V

    .line 25
    .line 26
    .line 27
    sput-object p0, Lcom/immomo/mmdns/DNSSlaLogger;->domainMatcher:Lcom/immomo/mmdns/DomainMatcher;

    .line 28
    .line 29
    sget-object p0, Lcom/immomo/mmdns/DNSSlaLogger;->excludeCodes:Ljava/util/Set;

    .line 30
    .line 31
    check-cast p5, Ljava/util/Collection;

    .line 32
    .line 33
    invoke-interface {p0, p5}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 34
    .line 35
    .line 36
    invoke-static {p6}, Lkotlinx/coroutines/f;->a(Lkotlin/coroutines/CoroutineContext;)Ll/drb;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    sput-object p0, Lcom/immomo/mmdns/DNSSlaLogger;->scope:Ll/drb;

    .line 41
    .line 42
    new-instance p0, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    const-string p1, "DNS_SLA init: flushInterval="

    .line 45
    .line 46
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    sget-wide p1, Lcom/immomo/mmdns/DNSSlaLogger;->flushInterval:J

    .line 50
    .line 51
    invoke-virtual {p0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string p1, ", domainMatcher="

    .line 55
    .line 56
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    sget-object p1, Lcom/immomo/mmdns/DNSSlaLogger;->domainMatcher:Lcom/immomo/mmdns/DomainMatcher;

    .line 60
    .line 61
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    const-string p1, ", excludeCodes="

    .line 65
    .line 66
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    sget-object p1, Lcom/immomo/mmdns/DNSSlaLogger;->excludeCodes:Ljava/util/Set;

    .line 70
    .line 71
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    const-string p1, "MMDNS"

    .line 79
    .line 80
    invoke-static {p1, p0}, Lcom/cosmos/mdlog/MDLog;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public final log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 7
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    sget-boolean p0, Lcom/immomo/mmdns/DNSSlaLogger;->isEnable:Z

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    if-eqz p1, :cond_4

    .line 7
    .line 8
    invoke-static {p1}, Lkotlin/text/StringsKt;->e0(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    if-eqz p2, :cond_4

    .line 16
    .line 17
    invoke-static {p2}, Lkotlin/text/StringsKt;->e0(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_2
    if-eqz p3, :cond_4

    .line 25
    .line 26
    invoke-static {p3}, Lkotlin/text/StringsKt;->e0(Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    if-eqz p0, :cond_3

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_3
    sget-object v0, Lcom/immomo/mmdns/DNSSlaLogger;->scope:Ll/drb;

    .line 34
    .line 35
    if-eqz v0, :cond_4

    .line 36
    .line 37
    new-instance v1, Lcom/immomo/mmdns/DNSSlaLogger$log$1;

    .line 38
    .line 39
    const/4 v6, 0x0

    .line 40
    move-object v2, p1

    .line 41
    move-object v3, p2

    .line 42
    move-object v4, p3

    .line 43
    move v5, p4

    .line 44
    invoke-direct/range {v1 .. v6}, Lcom/immomo/mmdns/DNSSlaLogger$log$1;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLkotlin/coroutines/Continuation;)V

    .line 45
    .line 46
    .line 47
    const/4 v4, 0x3

    .line 48
    const/4 v5, 0x0

    .line 49
    move-object v3, v1

    .line 50
    const/4 v1, 0x0

    .line 51
    const/4 v2, 0x0

    .line 52
    invoke-static/range {v0 .. v5}, Ll/vh3;->b(Ll/drb;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Ll/utd;

    .line 53
    .line 54
    .line 55
    :cond_4
    :goto_0
    return-void
.end method

.method public final setEnable(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "DNS_SLA setEnable: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "MMDNS"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    sput-boolean p1, Lcom/immomo/mmdns/DNSSlaLogger;->isEnable:Z

    .line 21
    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    invoke-direct {p0}, Lcom/immomo/mmdns/DNSSlaLogger;->startLogging()V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    invoke-direct {p0}, Lcom/immomo/mmdns/DNSSlaLogger;->stopLogging()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final setOnFlushListener(Lkotlin/jvm/functions/Function1;)V
    .locals 0
    .param p1    # Lkotlin/jvm/functions/Function1;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/util/Map<",
            "Lcom/immomo/mmdns/DnsSlaHeader;",
            "Lcom/immomo/mmdns/DnsSlaData;",
            ">;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    .line 1
    sput-object p1, Lcom/immomo/mmdns/DNSSlaLogger;->onFlushListener:Lkotlin/jvm/functions/Function1;

    .line 2
    .line 3
    return-void
.end method
