.class public final Lcom/immomo/molive/apm/cpu/CpuCore;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000:\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\t\n\u0002\u0008\u000e\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0002\u0008\t\u0018\u00002\u00020\u0001B\u001b\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\n\u0008\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\r\u0010\t\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\t\u0010\nJ\r\u0010\u000c\u001a\u00020\u000b\u00a2\u0006\u0004\u0008\u000c\u0010\rJ\r\u0010\u000e\u001a\u00020\u000b\u00a2\u0006\u0004\u0008\u000e\u0010\rR\u001b\u0010\u0013\u001a\u00020\u00048BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u000f\u0010\u0010\u001a\u0004\u0008\u0011\u0010\u0012R\u001b\u0010\u0016\u001a\u00020\u00048BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0014\u0010\u0010\u001a\u0004\u0008\u0015\u0010\u0012R\u001b\u0010\u0019\u001a\u00020\u00048BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0017\u0010\u0010\u001a\u0004\u0008\u0018\u0010\u0012R\u001b\u0010\u001c\u001a\u00020\u001a8BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0015\u0010\u0010\u001a\u0004\u0008\u0017\u0010\u001bR!\u0010!\u001a\u0008\u0012\u0004\u0012\u00020\u001e0\u001d8BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0011\u0010\u0010\u001a\u0004\u0008\u001f\u0010 R\u0017\u0010\u0003\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u001f\u0010\"\u001a\u0004\u0008#\u0010$R\u0019\u0010\u0005\u001a\u0004\u0018\u00010\u00048\u0006\u00a2\u0006\u000c\n\u0004\u0008#\u0010%\u001a\u0004\u0008&\u0010\u0012\u00a8\u0006\'"
    }
    d2 = {
        "Lcom/immomo/molive/apm/cpu/CpuCore;",
        "",
        "",
        "cpuIndex",
        "Ljava/io/File;",
        "policyTimeFile",
        "<init>",
        "(ILjava/io/File;)V",
        "Ll/ntb;",
        "i",
        "()Ll/ntb;",
        "",
        "h",
        "()J",
        "j",
        "a",
        "Lkotlin/Lazy;",
        "e",
        "()Ljava/io/File;",
        "cpuIdleFileRoot",
        "b",
        "d",
        "cpuFreqRootFile",
        "c",
        "getCpuTimeInStateFile",
        "cpuTimeInStateFile",
        "Lcom/immomo/molive/apm/cpu/CpuFreq;",
        "()Lcom/immomo/molive/apm/cpu/CpuFreq;",
        "cpuFreq",
        "",
        "Ll/gtb;",
        "f",
        "()Ljava/util/List;",
        "cpuIdleTimeFiles",
        "I",
        "g",
        "()I",
        "Ljava/io/File;",
        "getPolicyTimeFile",
        "apm-tracer_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# instance fields
.field private final a:Lkotlin/Lazy;

.field private final b:Lkotlin/Lazy;

.field private final c:Lkotlin/Lazy;

.field private final d:Lkotlin/Lazy;

.field private final e:Lkotlin/Lazy;

.field private final f:I

.field private final g:Ljava/io/File;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(ILjava/io/File;)V
    .locals 0
    .param p2    # Ljava/io/File;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/immomo/molive/apm/cpu/CpuCore;->f:I

    .line 5
    .line 6
    iput-object p2, p0, Lcom/immomo/molive/apm/cpu/CpuCore;->g:Ljava/io/File;

    .line 7
    .line 8
    new-instance p1, Lcom/immomo/molive/apm/cpu/CpuCore$cpuIdleFileRoot$2;

    .line 9
    .line 10
    invoke-direct {p1, p0}, Lcom/immomo/molive/apm/cpu/CpuCore$cpuIdleFileRoot$2;-><init>(Lcom/immomo/molive/apm/cpu/CpuCore;)V

    .line 11
    .line 12
    .line 13
    invoke-static {p1}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iput-object p1, p0, Lcom/immomo/molive/apm/cpu/CpuCore;->a:Lkotlin/Lazy;

    .line 18
    .line 19
    new-instance p1, Lcom/immomo/molive/apm/cpu/CpuCore$cpuFreqRootFile$2;

    .line 20
    .line 21
    invoke-direct {p1, p0}, Lcom/immomo/molive/apm/cpu/CpuCore$cpuFreqRootFile$2;-><init>(Lcom/immomo/molive/apm/cpu/CpuCore;)V

    .line 22
    .line 23
    .line 24
    invoke-static {p1}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iput-object p1, p0, Lcom/immomo/molive/apm/cpu/CpuCore;->b:Lkotlin/Lazy;

    .line 29
    .line 30
    new-instance p1, Lcom/immomo/molive/apm/cpu/CpuCore$cpuTimeInStateFile$2;

    .line 31
    .line 32
    invoke-direct {p1, p0}, Lcom/immomo/molive/apm/cpu/CpuCore$cpuTimeInStateFile$2;-><init>(Lcom/immomo/molive/apm/cpu/CpuCore;)V

    .line 33
    .line 34
    .line 35
    invoke-static {p1}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    iput-object p1, p0, Lcom/immomo/molive/apm/cpu/CpuCore;->c:Lkotlin/Lazy;

    .line 40
    .line 41
    new-instance p1, Lcom/immomo/molive/apm/cpu/CpuCore$cpuFreq$2;

    .line 42
    .line 43
    invoke-direct {p1, p0}, Lcom/immomo/molive/apm/cpu/CpuCore$cpuFreq$2;-><init>(Lcom/immomo/molive/apm/cpu/CpuCore;)V

    .line 44
    .line 45
    .line 46
    invoke-static {p1}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    iput-object p1, p0, Lcom/immomo/molive/apm/cpu/CpuCore;->d:Lkotlin/Lazy;

    .line 51
    .line 52
    new-instance p1, Lcom/immomo/molive/apm/cpu/CpuCore$cpuIdleTimeFiles$2;

    .line 53
    .line 54
    invoke-direct {p1, p0}, Lcom/immomo/molive/apm/cpu/CpuCore$cpuIdleTimeFiles$2;-><init>(Lcom/immomo/molive/apm/cpu/CpuCore;)V

    .line 55
    .line 56
    .line 57
    invoke-static {p1}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    iput-object p1, p0, Lcom/immomo/molive/apm/cpu/CpuCore;->e:Lkotlin/Lazy;

    .line 62
    .line 63
    return-void
.end method

.method public static final synthetic a(Lcom/immomo/molive/apm/cpu/CpuCore;)Ljava/io/File;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/molive/apm/cpu/CpuCore;->d()Ljava/io/File;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final synthetic b(Lcom/immomo/molive/apm/cpu/CpuCore;)Ljava/io/File;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/molive/apm/cpu/CpuCore;->e()Ljava/io/File;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private final c()Lcom/immomo/molive/apm/cpu/CpuFreq;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/molive/apm/cpu/CpuCore;->d:Lkotlin/Lazy;

    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/immomo/molive/apm/cpu/CpuFreq;

    return-object p0
.end method

.method private final d()Ljava/io/File;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/molive/apm/cpu/CpuCore;->b:Lkotlin/Lazy;

    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/io/File;

    return-object p0
.end method

.method private final e()Ljava/io/File;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/molive/apm/cpu/CpuCore;->a:Lkotlin/Lazy;

    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/io/File;

    return-object p0
.end method

.method private final f()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/gtb;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/molive/apm/cpu/CpuCore;->e:Lkotlin/Lazy;

    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    return-object p0
.end method


# virtual methods
.method public final g()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/molive/apm/cpu/CpuCore;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public final h()J
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/immomo/molive/apm/cpu/CpuCore;->c()Lcom/immomo/molive/apm/cpu/CpuFreq;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/immomo/molive/apm/cpu/CpuFreq;->h()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public final i()Ll/ntb;
    .locals 5
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/immomo/molive/apm/cpu/CpuCore;->f()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Iterable;

    .line 6
    .line 7
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-wide/16 v0, 0x0

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    if-eqz v3, :cond_1

    .line 19
    .line 20
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    check-cast v3, Ll/gtb;

    .line 25
    .line 26
    invoke-virtual {v3}, Ll/gtb;->a()Z

    .line 27
    .line 28
    .line 29
    move-result v4

    .line 30
    if-eqz v4, :cond_0

    .line 31
    .line 32
    sget-object v2, Ll/itb;->INSTANCE:Ll/itb;

    .line 33
    .line 34
    invoke-virtual {v2, v3}, Ll/itb;->b(Ll/gtb;)J

    .line 35
    .line 36
    .line 37
    move-result-wide v2

    .line 38
    add-long/2addr v0, v2

    .line 39
    const/4 v2, 0x1

    .line 40
    goto :goto_0

    .line 41
    :cond_1
    new-instance p0, Ll/ntb;

    .line 42
    .line 43
    invoke-direct {p0, v0, v1, v2}, Ll/ntb;-><init>(JZ)V

    .line 44
    .line 45
    .line 46
    return-object p0
.end method

.method public final j()J
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/immomo/molive/apm/cpu/CpuCore;->c()Lcom/immomo/molive/apm/cpu/CpuFreq;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/immomo/molive/apm/cpu/CpuFreq;->g()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method
