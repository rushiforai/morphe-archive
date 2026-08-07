.class public final Lcom/immomo/molive/apm/cpu/CpuFreq;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\t\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0010\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\r\u0010\u0007\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u0007\u0010\u0008R\u001b\u0010\u000e\u001a\u00020\t8BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\n\u0010\u000b\u001a\u0004\u0008\u000c\u0010\rR\u001b\u0010\u0011\u001a\u00020\t8BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u000f\u0010\u000b\u001a\u0004\u0008\u0010\u0010\rR\u001b\u0010\u0013\u001a\u00020\t8BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0010\u0010\u000b\u001a\u0004\u0008\u0012\u0010\rR\u001b\u0010\u0015\u001a\u00020\u00068FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u000c\u0010\u000b\u001a\u0004\u0008\u0014\u0010\u0008R\u0017\u0010\u0003\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0012\u0010\u0016\u001a\u0004\u0008\u0017\u0010\u0018\u00a8\u0006\u0019"
    }
    d2 = {
        "Lcom/immomo/molive/apm/cpu/CpuFreq;",
        "",
        "",
        "cpuIndex",
        "<init>",
        "(I)V",
        "",
        "h",
        "()J",
        "Ljava/io/File;",
        "a",
        "Lkotlin/Lazy;",
        "d",
        "()Ljava/io/File;",
        "cpuFreqFileRoot",
        "b",
        "c",
        "cpuFreqCurrentFile",
        "e",
        "cpuFreqMaxFile",
        "g",
        "maxCpuFreq",
        "I",
        "f",
        "()I",
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
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final e:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/immomo/molive/apm/cpu/CpuFreq;->e:I

    .line 5
    .line 6
    new-instance p1, Lcom/immomo/molive/apm/cpu/CpuFreq$cpuFreqFileRoot$2;

    .line 7
    .line 8
    invoke-direct {p1, p0}, Lcom/immomo/molive/apm/cpu/CpuFreq$cpuFreqFileRoot$2;-><init>(Lcom/immomo/molive/apm/cpu/CpuFreq;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p1}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Lcom/immomo/molive/apm/cpu/CpuFreq;->a:Lkotlin/Lazy;

    .line 16
    .line 17
    new-instance p1, Lcom/immomo/molive/apm/cpu/CpuFreq$cpuFreqCurrentFile$2;

    .line 18
    .line 19
    invoke-direct {p1, p0}, Lcom/immomo/molive/apm/cpu/CpuFreq$cpuFreqCurrentFile$2;-><init>(Lcom/immomo/molive/apm/cpu/CpuFreq;)V

    .line 20
    .line 21
    .line 22
    invoke-static {p1}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iput-object p1, p0, Lcom/immomo/molive/apm/cpu/CpuFreq;->b:Lkotlin/Lazy;

    .line 27
    .line 28
    new-instance p1, Lcom/immomo/molive/apm/cpu/CpuFreq$cpuFreqMaxFile$2;

    .line 29
    .line 30
    invoke-direct {p1, p0}, Lcom/immomo/molive/apm/cpu/CpuFreq$cpuFreqMaxFile$2;-><init>(Lcom/immomo/molive/apm/cpu/CpuFreq;)V

    .line 31
    .line 32
    .line 33
    invoke-static {p1}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iput-object p1, p0, Lcom/immomo/molive/apm/cpu/CpuFreq;->c:Lkotlin/Lazy;

    .line 38
    .line 39
    new-instance p1, Lcom/immomo/molive/apm/cpu/CpuFreq$maxCpuFreq$2;

    .line 40
    .line 41
    invoke-direct {p1, p0}, Lcom/immomo/molive/apm/cpu/CpuFreq$maxCpuFreq$2;-><init>(Lcom/immomo/molive/apm/cpu/CpuFreq;)V

    .line 42
    .line 43
    .line 44
    invoke-static {p1}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    iput-object p1, p0, Lcom/immomo/molive/apm/cpu/CpuFreq;->d:Lkotlin/Lazy;

    .line 49
    .line 50
    return-void
.end method

.method public static final synthetic a(Lcom/immomo/molive/apm/cpu/CpuFreq;)Ljava/io/File;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/molive/apm/cpu/CpuFreq;->d()Ljava/io/File;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final synthetic b(Lcom/immomo/molive/apm/cpu/CpuFreq;)Ljava/io/File;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/molive/apm/cpu/CpuFreq;->e()Ljava/io/File;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private final c()Ljava/io/File;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/molive/apm/cpu/CpuFreq;->b:Lkotlin/Lazy;

    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/io/File;

    return-object p0
.end method

.method private final d()Ljava/io/File;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/molive/apm/cpu/CpuFreq;->a:Lkotlin/Lazy;

    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/io/File;

    return-object p0
.end method

.method private final e()Ljava/io/File;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/molive/apm/cpu/CpuFreq;->c:Lkotlin/Lazy;

    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/io/File;

    return-object p0
.end method


# virtual methods
.method public final f()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/molive/apm/cpu/CpuFreq;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public final g()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/immomo/molive/apm/cpu/CpuFreq;->d:Lkotlin/Lazy;

    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    return-wide v0
.end method

.method public final h()J
    .locals 2

    .line 1
    sget-object v0, Ll/itb;->INSTANCE:Ll/itb;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/immomo/molive/apm/cpu/CpuFreq;->c()Ljava/io/File;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {v0, p0}, Ll/itb;->a(Ljava/io/File;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0
.end method
