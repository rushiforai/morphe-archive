.class public final Lcom/immomo/molive/apm/cpu/CpuUtils;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000N\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010%\n\u0002\u0010\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\n\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0015\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\r\u0010\t\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\t\u0010\nJ\u0019\u0010\u000c\u001a\u000e\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u00060\u000b\u00a2\u0006\u0004\u0008\u000c\u0010\rJ\r\u0010\u000e\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u000e\u0010\u000fR!\u0010\u0016\u001a\u0008\u0012\u0004\u0012\u00020\u00110\u00108FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0012\u0010\u0013\u001a\u0004\u0008\u0014\u0010\u0015R\'\u0010\u001c\u001a\u000e\u0012\u0004\u0012\u00020\u0018\u0012\u0004\u0012\u00020\u00190\u00178BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u001a\u0010\u0013\u001a\u0004\u0008\u001a\u0010\u001bR\u001b\u0010!\u001a\u00020\u001d8BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u001e\u0010\u0013\u001a\u0004\u0008\u001f\u0010 R\u001b\u0010&\u001a\u00020\"8BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008#\u0010\u0013\u001a\u0004\u0008$\u0010%R\u001b\u0010(\u001a\u00020\u00188FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u000c\u0010\u0013\u001a\u0004\u0008#\u0010\'R\u001b\u0010)\u001a\u00020\u00048FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0007\u0010\u0013\u001a\u0004\u0008\u001e\u0010\u000fR\u001b\u0010+\u001a\u00020\u00048FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0014\u0010\u0013\u001a\u0004\u0008*\u0010\u000f\u00a8\u0006,"
    }
    d2 = {
        "Lcom/immomo/molive/apm/cpu/CpuUtils;",
        "",
        "<init>",
        "()V",
        "",
        "intervalMills",
        "Ll/ntb;",
        "f",
        "(J)Ll/ntb;",
        "h",
        "()Ll/ntb;",
        "Lkotlin/Pair;",
        "e",
        "()Lkotlin/Pair;",
        "i",
        "()J",
        "",
        "Lcom/immomo/molive/apm/cpu/CpuPolicy;",
        "a",
        "Lkotlin/Lazy;",
        "g",
        "()Ljava/util/List;",
        "cpuPolicyList",
        "",
        "",
        "Lcom/immomo/molive/apm/cpu/CpuCore;",
        "b",
        "()Ljava/util/Map;",
        "allCpuCores",
        "Lcom/immomo/molive/apm/cpu/ProcessPseudo;",
        "c",
        "k",
        "()Lcom/immomo/molive/apm/cpu/ProcessPseudo;",
        "processPseudo",
        "Lcom/immomo/molive/apm/cpu/SystemPseudo;",
        "d",
        "l",
        "()Lcom/immomo/molive/apm/cpu/SystemPseudo;",
        "sysPseudo",
        "()I",
        "cpuCoreNum",
        "clockTicksPerSeconds",
        "j",
        "millSecondsPerTicks",
        "apm-tracer_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/immomo/molive/apm/cpu/CpuUtils;

.field private static final a:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static final b:Lkotlin/Lazy;

.field private static final c:Lkotlin/Lazy;

.field private static final d:Lkotlin/Lazy;

.field private static final e:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static final f:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static final g:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/immomo/molive/apm/cpu/CpuUtils;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/immomo/molive/apm/cpu/CpuUtils;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/immomo/molive/apm/cpu/CpuUtils;->INSTANCE:Lcom/immomo/molive/apm/cpu/CpuUtils;

    .line 7
    .line 8
    sget-object v0, Lcom/immomo/molive/apm/cpu/CpuUtils$cpuPolicyList$2;->INSTANCE:Lcom/immomo/molive/apm/cpu/CpuUtils$cpuPolicyList$2;

    .line 9
    .line 10
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sput-object v0, Lcom/immomo/molive/apm/cpu/CpuUtils;->a:Lkotlin/Lazy;

    .line 15
    .line 16
    sget-object v0, Lcom/immomo/molive/apm/cpu/CpuUtils$allCpuCores$2;->INSTANCE:Lcom/immomo/molive/apm/cpu/CpuUtils$allCpuCores$2;

    .line 17
    .line 18
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sput-object v0, Lcom/immomo/molive/apm/cpu/CpuUtils;->b:Lkotlin/Lazy;

    .line 23
    .line 24
    sget-object v0, Lcom/immomo/molive/apm/cpu/CpuUtils$processPseudo$2;->INSTANCE:Lcom/immomo/molive/apm/cpu/CpuUtils$processPseudo$2;

    .line 25
    .line 26
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    sput-object v0, Lcom/immomo/molive/apm/cpu/CpuUtils;->c:Lkotlin/Lazy;

    .line 31
    .line 32
    sget-object v0, Lcom/immomo/molive/apm/cpu/CpuUtils$sysPseudo$2;->INSTANCE:Lcom/immomo/molive/apm/cpu/CpuUtils$sysPseudo$2;

    .line 33
    .line 34
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    sput-object v0, Lcom/immomo/molive/apm/cpu/CpuUtils;->d:Lkotlin/Lazy;

    .line 39
    .line 40
    sget-object v0, Lcom/immomo/molive/apm/cpu/CpuUtils$cpuCoreNum$2;->INSTANCE:Lcom/immomo/molive/apm/cpu/CpuUtils$cpuCoreNum$2;

    .line 41
    .line 42
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    sput-object v0, Lcom/immomo/molive/apm/cpu/CpuUtils;->e:Lkotlin/Lazy;

    .line 47
    .line 48
    sget-object v0, Lcom/immomo/molive/apm/cpu/CpuUtils$clockTicksPerSeconds$2;->INSTANCE:Lcom/immomo/molive/apm/cpu/CpuUtils$clockTicksPerSeconds$2;

    .line 49
    .line 50
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    sput-object v0, Lcom/immomo/molive/apm/cpu/CpuUtils;->f:Lkotlin/Lazy;

    .line 55
    .line 56
    sget-object v0, Lcom/immomo/molive/apm/cpu/CpuUtils$millSecondsPerTicks$2;->INSTANCE:Lcom/immomo/molive/apm/cpu/CpuUtils$millSecondsPerTicks$2;

    .line 57
    .line 58
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    sput-object v0, Lcom/immomo/molive/apm/cpu/CpuUtils;->g:Lkotlin/Lazy;

    .line 63
    .line 64
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

.method public static final synthetic a(Lcom/immomo/molive/apm/cpu/CpuUtils;)Ljava/util/Map;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/molive/apm/cpu/CpuUtils;->b()Ljava/util/Map;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private final b()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/immomo/molive/apm/cpu/CpuCore;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/immomo/molive/apm/cpu/CpuUtils;->b:Lkotlin/Lazy;

    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Map;

    return-object p0
.end method

.method private final k()Lcom/immomo/molive/apm/cpu/ProcessPseudo;
    .locals 0

    .line 1
    sget-object p0, Lcom/immomo/molive/apm/cpu/CpuUtils;->c:Lkotlin/Lazy;

    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/immomo/molive/apm/cpu/ProcessPseudo;

    return-object p0
.end method

.method private final l()Lcom/immomo/molive/apm/cpu/SystemPseudo;
    .locals 0

    .line 1
    sget-object p0, Lcom/immomo/molive/apm/cpu/CpuUtils;->d:Lkotlin/Lazy;

    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/immomo/molive/apm/cpu/SystemPseudo;

    return-object p0
.end method


# virtual methods
.method public final c()J
    .locals 2

    .line 1
    sget-object p0, Lcom/immomo/molive/apm/cpu/CpuUtils;->f:Lkotlin/Lazy;

    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    return-wide v0
.end method

.method public final d()I
    .locals 0

    .line 1
    sget-object p0, Lcom/immomo/molive/apm/cpu/CpuUtils;->e:Lkotlin/Lazy;

    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result p0

    return p0
.end method

.method public final e()Lkotlin/Pair;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/Pair<",
            "Ll/ntb;",
            "Ll/ntb;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object v0, Ll/itb;->INSTANCE:Ll/itb;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/immomo/molive/apm/cpu/CpuUtils;->l()Lcom/immomo/molive/apm/cpu/SystemPseudo;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {v0, p0}, Ll/itb;->h(Lcom/immomo/molive/apm/cpu/SystemPseudo;)Lkotlin/Pair;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final f(J)Ll/ntb;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object v0, Ll/itb;->INSTANCE:Ll/itb;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/immomo/molive/apm/cpu/CpuUtils;->b()Ljava/util/Map;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {v0, p0, p1, p2}, Ll/itb;->i(Ljava/util/Collection;J)Ll/ntb;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final g()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/immomo/molive/apm/cpu/CpuPolicy;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object p0, Lcom/immomo/molive/apm/cpu/CpuUtils;->a:Lkotlin/Lazy;

    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    return-object p0
.end method

.method public final h()Ll/ntb;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object v0, Ll/itb;->INSTANCE:Ll/itb;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/immomo/molive/apm/cpu/CpuUtils;->g()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/util/Collection;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Ll/itb;->j(Ljava/util/Collection;)Ll/ntb;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final i()J
    .locals 2

    .line 1
    sget-object v0, Ll/itb;->INSTANCE:Ll/itb;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/immomo/molive/apm/cpu/CpuUtils;->k()Lcom/immomo/molive/apm/cpu/ProcessPseudo;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {v0, p0}, Ll/itb;->g(Lcom/immomo/molive/apm/cpu/ProcessPseudo;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method

.method public final j()J
    .locals 2

    .line 1
    sget-object p0, Lcom/immomo/molive/apm/cpu/CpuUtils;->g:Lkotlin/Lazy;

    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    return-wide v0
.end method
