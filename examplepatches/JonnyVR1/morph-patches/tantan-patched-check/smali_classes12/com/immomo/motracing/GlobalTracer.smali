.class public final Lcom/immomo/motracing/GlobalTracer;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/motracing/GlobalTracer$a;,
        Lcom/immomo/motracing/GlobalTracer$LogLevel;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000h\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\t\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u000b\n\u0002\u0010\u000b\n\u0002\u0008\u0004\n\u0002\u0010\u0008\n\u0002\u0008\u000c\n\u0002\u0018\u0002\n\u0002\u0008\n\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010%\n\u0002\u0008\u0004\u0008\u00c6\u0002\u0018\u00002\u00020\u0001:\u00021IB\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0017\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0007\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u001a\u0010\u000c\u001a\u00020\u000b2\u0006\u0010\n\u001a\u00020\tH\u0007\u00f8\u0001\u0000\u00a2\u0006\u0004\u0008\u000c\u0010\rJ(\u0010\u0012\u001a\u00020\u00112\u0006\u0010\n\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0010\u001a\u00020\u000eH\u0082 \u00a2\u0006\u0004\u0008\u0012\u0010\u0013J0\u0010\u0015\u001a\u00020\u00112\u0006\u0010\u0014\u001a\u00020\u000e2\u0006\u0010\n\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0010\u001a\u00020\u000eH\u0082 \u00a2\u0006\u0004\u0008\u0015\u0010\u0016J\u001a\u0010\u0017\u001a\u0004\u0018\u00010\u000b2\u0006\u0010\n\u001a\u00020\u000eH\u0082 \u00a2\u0006\u0004\u0008\u0017\u0010\rJ \u0010\u001a\u001a\u00020\u000e2\u0006\u0010\u0018\u001a\u00020\u00042\u0006\u0010\u0019\u001a\u00020\u0004H\u0082 \u00a2\u0006\u0004\u0008\u001a\u0010\u001bJ \u0010\u001e\u001a\u00020\u001d2\u0006\u0010\u001c\u001a\u00020\u00042\u0006\u0010\u0018\u001a\u00020\u0004H\u0082 \u00a2\u0006\u0004\u0008\u001e\u0010\u001fJ\u0010\u0010 \u001a\u00020\u000eH\u0082 \u00a2\u0006\u0004\u0008 \u0010!J\u0018\u0010$\u001a\u00020\u00112\u0006\u0010#\u001a\u00020\"H\u0082 \u00a2\u0006\u0004\u0008$\u0010%J\u0018\u0010\'\u001a\u00020\u00112\u0006\u0010&\u001a\u00020\u001dH\u0082 \u00a2\u0006\u0004\u0008\'\u0010(J\u0017\u0010*\u001a\u00020\u00112\u0006\u0010)\u001a\u00020\u000bH\u0000\u00a2\u0006\u0004\u0008*\u0010+J$\u0010,\u001a\u00020\u00112\u0006\u0010\n\u001a\u00020\t2\u0008\u0010)\u001a\u0004\u0018\u00010\u000bH\u0000\u00f8\u0001\u0000\u00a2\u0006\u0004\u0008,\u0010-J\r\u0010.\u001a\u00020\u000e\u00a2\u0006\u0004\u0008.\u0010!J\u0015\u00101\u001a\u00020\u001d2\u0006\u00100\u001a\u00020/\u00a2\u0006\u0004\u00081\u00102J\u0018\u00103\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0086 \u00a2\u0006\u0004\u00083\u0010\u0008J\u001a\u00105\u001a\u0004\u0018\u00010\u00062\u0006\u00104\u001a\u00020\u000eH\u0086 \u00a2\u0006\u0004\u00085\u00106J\u0010\u00107\u001a\u00020\u0011H\u0086 \u00a2\u0006\u0004\u00087\u0010\u0003R\u0017\u00108\u001a\u00020\t8\u0006X\u0086T\u00f8\u0001\u0000\u00a2\u0006\u0006\n\u0004\u00088\u00109R\u0016\u0010;\u001a\u00020:8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008;\u0010<R\u0016\u0010=\u001a\u00020\u000e8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008=\u00109R\u0016\u0010>\u001a\u00020\u001d8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008>\u0010?R\u0016\u0010@\u001a\u00020\u001d8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008@\u0010?R\u0018\u0010B\u001a\u0004\u0018\u00010A8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008B\u0010CR\u0018\u0010D\u001a\u0004\u0018\u00010\u00048\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008D\u0010ER\u0016\u0010\u0019\u001a\u00020\u00048\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0019\u0010ER#\u0010G\u001a\u000e\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\u00060F8\u0002X\u0082\u0004\u00f8\u0001\u0000\u00a2\u0006\u0006\n\u0004\u0008G\u0010H\u0082\u0002\u0004\n\u0002\u0008\u0019\u00a8\u0006J"
    }
    d2 = {
        "Lcom/immomo/motracing/GlobalTracer;",
        "",
        "<init>",
        "()V",
        "",
        "key",
        "Lcom/immomo/motracing/Tracer;",
        "b",
        "(Ljava/lang/String;)Lcom/immomo/motracing/Tracer;",
        "Lkotlin/ULong;",
        "tracerId",
        "Lcom/immomo/motracing/Span;",
        "c",
        "(J)Lcom/immomo/motracing/Span;",
        "",
        "traceId",
        "spanId",
        "",
        "_setCurrentSpan",
        "(JJJ)V",
        "target",
        "_setCurrentSpan2",
        "(JJJJ)V",
        "_getCurrentSpan",
        "path",
        "storePrefix",
        "_getGlobalTracer",
        "(Ljava/lang/String;Ljava/lang/String;)J",
        "name",
        "",
        "_compressRecordFile",
        "(Ljava/lang/String;Ljava/lang/String;)Z",
        "_getStoreTimeId",
        "()J",
        "",
        "level",
        "_setLogLevel",
        "(I)V",
        "enable",
        "_setEnable",
        "(Z)V",
        "span",
        "e",
        "(Lcom/immomo/motracing/Span;)V",
        "f",
        "(JLcom/immomo/motracing/Span;)V",
        "d",
        "Ljava/io/File;",
        "file",
        "a",
        "(Ljava/io/File;)Z",
        "_getOrCreate",
        "id",
        "_getByTracerId",
        "(J)Lcom/immomo/motracing/Tracer;",
        "_debugLog",
        "INVALID_ID",
        "J",
        "Lcom/immomo/motracing/GlobalTracer$a;",
        "libraryLoader",
        "Lcom/immomo/motracing/GlobalTracer$a;",
        "_np",
        "inited",
        "Z",
        "isEnable",
        "Ll/uej0;",
        "config",
        "Ll/uej0;",
        "logPath",
        "Ljava/lang/String;",
        "",
        "tracers",
        "Ljava/util/Map;",
        "LogLevel",
        "MoTracing_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/immomo/motracing/GlobalTracer;

.field public static final INVALID_ID:J = -0x1L

.field private static _np:J

.field private static config:Ll/uej0;

.field private static inited:Z

.field private static isEnable:Z

.field private static libraryLoader:Lcom/immomo/motracing/GlobalTracer$a;

.field private static logPath:Ljava/lang/String;

.field private static storePrefix:Ljava/lang/String;

.field private static final tracers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lkotlin/ULong;",
            "Lcom/immomo/motracing/Tracer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/immomo/motracing/GlobalTracer;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/immomo/motracing/GlobalTracer;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/immomo/motracing/GlobalTracer;->INSTANCE:Lcom/immomo/motracing/GlobalTracer;

    .line 7
    .line 8
    new-instance v0, Lcom/immomo/motracing/GlobalTracer$b;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/immomo/motracing/GlobalTracer$b;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/immomo/motracing/GlobalTracer;->libraryLoader:Lcom/immomo/motracing/GlobalTracer$a;

    .line 14
    .line 15
    const-string v0, ""

    .line 16
    .line 17
    sput-object v0, Lcom/immomo/motracing/GlobalTracer;->storePrefix:Ljava/lang/String;

    .line 18
    .line 19
    new-instance v0, Ljava/util/LinkedHashMap;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 22
    .line 23
    .line 24
    sput-object v0, Lcom/immomo/motracing/GlobalTracer;->tracers:Ljava/util/Map;

    .line 25
    .line 26
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

.method private final native _compressRecordFile(Ljava/lang/String;Ljava/lang/String;)Z
.end method

.method private final native _getCurrentSpan(J)Lcom/immomo/motracing/Span;
.end method

.method private final native _getGlobalTracer(Ljava/lang/String;Ljava/lang/String;)J
.end method

.method private final native _getStoreTimeId()J
.end method

.method private final native _setCurrentSpan(JJJ)V
.end method

.method private final native _setCurrentSpan2(JJJJ)V
.end method

.method private final native _setEnable(Z)V
.end method

.method private final native _setLogLevel(I)V
.end method

.method public static final b(Ljava/lang/String;)Lcom/immomo/motracing/Tracer;
    .locals 4
    .param p0    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-boolean v0, Lcom/immomo/motracing/GlobalTracer;->inited:Z

    .line 5
    .line 6
    if-eqz v0, :cond_3

    .line 7
    .line 8
    sget-boolean v0, Lcom/immomo/motracing/GlobalTracer;->isEnable:Z

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    sget-object v0, Lcom/immomo/motracing/Tracer;->Companion:Lcom/immomo/motracing/Tracer$a;

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Lcom/immomo/motracing/Tracer$a;->a(Ljava/lang/String;)J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    sget-object v2, Lcom/immomo/motracing/GlobalTracer;->tracers:Ljava/util/Map;

    .line 20
    .line 21
    invoke-static {v0, v1}, Lkotlin/ULong;->a(J)Lkotlin/ULong;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    invoke-interface {v2, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    if-eqz v3, :cond_2

    .line 30
    .line 31
    invoke-static {v0, v1}, Lkotlin/ULong;->a(J)Lkotlin/ULong;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-interface {v2, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    if-nez p0, :cond_1

    .line 40
    .line 41
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 42
    .line 43
    .line 44
    :cond_1
    check-cast p0, Lcom/immomo/motracing/Tracer;

    .line 45
    .line 46
    return-object p0

    .line 47
    :cond_2
    sget-object v3, Lcom/immomo/motracing/GlobalTracer;->INSTANCE:Lcom/immomo/motracing/GlobalTracer;

    .line 48
    .line 49
    invoke-virtual {v3, p0}, Lcom/immomo/motracing/GlobalTracer;->_getOrCreate(Ljava/lang/String;)Lcom/immomo/motracing/Tracer;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-static {v0, v1}, Lkotlin/ULong;->a(J)Lkotlin/ULong;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-interface {v2, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    return-object p0

    .line 61
    :cond_3
    :goto_0
    sget-object p0, Lcom/immomo/motracing/b;->INSTANCE:Lcom/immomo/motracing/b;

    .line 62
    .line 63
    return-object p0
.end method

.method public static final c(J)Lcom/immomo/motracing/Span;
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-boolean v0, Lcom/immomo/motracing/GlobalTracer;->inited:Z

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    sget-boolean v0, Lcom/immomo/motracing/GlobalTracer;->isEnable:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    sget-object v0, Lcom/immomo/motracing/GlobalTracer;->INSTANCE:Lcom/immomo/motracing/GlobalTracer;

    .line 11
    .line 12
    invoke-direct {v0, p0, p1}, Lcom/immomo/motracing/GlobalTracer;->_getCurrentSpan(J)Lcom/immomo/motracing/Span;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_1
    sget-object p0, Lcom/immomo/motracing/a;->INSTANCE:Lcom/immomo/motracing/a;

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_2
    :goto_0
    sget-object p0, Lcom/immomo/motracing/a;->INSTANCE:Lcom/immomo/motracing/a;

    .line 23
    .line 24
    return-object p0
.end method


# virtual methods
.method public final native _debugLog()V
.end method

.method public final native _getByTracerId(J)Lcom/immomo/motracing/Tracer;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end method

.method public final native _getOrCreate(Ljava/lang/String;)Lcom/immomo/motracing/Tracer;
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end method

.method public final a(Ljava/io/File;)Z
    .locals 1
    .param p1    # Ljava/io/File;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-boolean v0, Lcom/immomo/motracing/GlobalTracer;->inited:Z

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    sget-boolean v0, Lcom/immomo/motracing/GlobalTracer;->isEnable:Z

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-static {p1}, Ll/yki;->t(Ljava/io/File;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p1}, Ljava/io/File;->getParent()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 22
    .line 23
    .line 24
    invoke-direct {p0, v0, p1}, Lcom/immomo/motracing/GlobalTracer;->_compressRecordFile(Ljava/lang/String;Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    return p0

    .line 29
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 30
    return p0
.end method

.method public final d()J
    .locals 7

    .line 1
    sget-boolean v0, Lcom/immomo/motracing/GlobalTracer;->inited:Z

    .line 2
    .line 3
    const-wide v1, 0x7fffffffffffffffL

    .line 4
    .line 5
    .line 6
    .line 7
    .line 8
    if-eqz v0, :cond_2

    .line 9
    .line 10
    sget-boolean v0, Lcom/immomo/motracing/GlobalTracer;->isEnable:Z

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-direct {p0}, Lcom/immomo/motracing/GlobalTracer;->_getStoreTimeId()J

    .line 16
    .line 17
    .line 18
    move-result-wide v3

    .line 19
    const-wide/16 v5, 0x0

    .line 20
    .line 21
    cmp-long p0, v3, v5

    .line 22
    .line 23
    if-gtz p0, :cond_1

    .line 24
    .line 25
    return-wide v1

    .line 26
    :cond_1
    return-wide v3

    .line 27
    :cond_2
    :goto_0
    return-wide v1
.end method

.method public final e(Lcom/immomo/motracing/Span;)V
    .locals 8
    .param p1    # Lcom/immomo/motracing/Span;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-boolean v0, Lcom/immomo/motracing/GlobalTracer;->inited:Z

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    sget-boolean v0, Lcom/immomo/motracing/GlobalTracer;->isEnable:Z

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-virtual {p1}, Lcom/immomo/motracing/Span;->c()J

    .line 14
    .line 15
    .line 16
    move-result-wide v2

    .line 17
    invoke-virtual {p1}, Lcom/immomo/motracing/Span;->b()J

    .line 18
    .line 19
    .line 20
    move-result-wide v4

    .line 21
    invoke-virtual {p1}, Lcom/immomo/motracing/Span;->a()J

    .line 22
    .line 23
    .line 24
    move-result-wide v6

    .line 25
    move-object v1, p0

    .line 26
    invoke-direct/range {v1 .. v7}, Lcom/immomo/motracing/GlobalTracer;->_setCurrentSpan(JJJ)V

    .line 27
    .line 28
    .line 29
    :cond_1
    :goto_0
    return-void
.end method

.method public final f(JLcom/immomo/motracing/Span;)V
    .locals 9
    .param p3    # Lcom/immomo/motracing/Span;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    sget-boolean p0, Lcom/immomo/motracing/GlobalTracer;->inited:Z

    .line 2
    .line 3
    if-eqz p0, :cond_2

    .line 4
    .line 5
    sget-boolean p0, Lcom/immomo/motracing/GlobalTracer;->isEnable:Z

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    if-eqz p3, :cond_1

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_1
    sget-object p3, Lcom/immomo/motracing/a;->INSTANCE:Lcom/immomo/motracing/a;

    .line 14
    .line 15
    :goto_0
    sget-object v0, Lcom/immomo/motracing/GlobalTracer;->INSTANCE:Lcom/immomo/motracing/GlobalTracer;

    .line 16
    .line 17
    invoke-virtual {p3}, Lcom/immomo/motracing/Span;->c()J

    .line 18
    .line 19
    .line 20
    move-result-wide v3

    .line 21
    invoke-virtual {p3}, Lcom/immomo/motracing/Span;->b()J

    .line 22
    .line 23
    .line 24
    move-result-wide v5

    .line 25
    invoke-virtual {p3}, Lcom/immomo/motracing/Span;->a()J

    .line 26
    .line 27
    .line 28
    move-result-wide v7

    .line 29
    move-wide v1, p1

    .line 30
    invoke-direct/range {v0 .. v8}, Lcom/immomo/motracing/GlobalTracer;->_setCurrentSpan2(JJJJ)V

    .line 31
    .line 32
    .line 33
    :cond_2
    :goto_1
    return-void
.end method
