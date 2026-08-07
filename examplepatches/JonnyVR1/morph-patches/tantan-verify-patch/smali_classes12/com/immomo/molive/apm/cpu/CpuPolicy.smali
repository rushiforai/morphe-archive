.class public final Lcom/immomo/molive/apm/cpu/CpuPolicy;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000@\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0010\t\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u000f\n\u0002\u0010 \n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010%\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\r\u0010\u0007\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\r\u0010\n\u001a\u00020\t\u00a2\u0006\u0004\u0008\n\u0010\u000bR\"\u0010\u0013\u001a\u00020\u000c8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\r\u0010\u000e\u001a\u0004\u0008\u000f\u0010\u0010\"\u0004\u0008\u0011\u0010\u0012R\u001b\u0010\u0018\u001a\u00020\u00028BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0014\u0010\u0015\u001a\u0004\u0008\u0016\u0010\u0017R\u001b\u0010\u001b\u001a\u00020\u00028BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0019\u0010\u0015\u001a\u0004\u0008\u001a\u0010\u0017R!\u0010 \u001a\u0008\u0012\u0004\u0012\u00020\u001d0\u001c8BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0016\u0010\u0015\u001a\u0004\u0008\u001e\u0010\u001fR\'\u0010%\u001a\u000e\u0012\u0004\u0012\u00020\u001d\u0012\u0004\u0012\u00020\"0!8FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u001e\u0010\u0015\u001a\u0004\u0008#\u0010$R\u0017\u0010\u0003\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008#\u0010&\u001a\u0004\u0008\'\u0010\u0017\u00a8\u0006("
    }
    d2 = {
        "Lcom/immomo/molive/apm/cpu/CpuPolicy;",
        "",
        "Ljava/io/File;",
        "policyRoot",
        "<init>",
        "(Ljava/io/File;)V",
        "",
        "g",
        "()Ljava/lang/String;",
        "",
        "h",
        "()J",
        "",
        "a",
        "Z",
        "i",
        "()Z",
        "l",
        "(Z)V",
        "enable",
        "b",
        "Lkotlin/Lazy;",
        "d",
        "()Ljava/io/File;",
        "affectedCpusFile",
        "c",
        "k",
        "timeInStateFile",
        "",
        "",
        "e",
        "()Ljava/util/List;",
        "affectedCpusIds",
        "",
        "Lcom/immomo/molive/apm/cpu/CpuCore;",
        "f",
        "()Ljava/util/Map;",
        "controlCpuCores",
        "Ljava/io/File;",
        "j",
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
.field private a:Z

.field private final b:Lkotlin/Lazy;

.field private final c:Lkotlin/Lazy;

.field private final d:Lkotlin/Lazy;

.field private final e:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final f:Ljava/io/File;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .locals 0
    .param p1    # Ljava/io/File;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lcom/immomo/molive/apm/cpu/CpuPolicy;->f:Ljava/io/File;

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    iput-boolean p1, p0, Lcom/immomo/molive/apm/cpu/CpuPolicy;->a:Z

    .line 11
    .line 12
    new-instance p1, Lcom/immomo/molive/apm/cpu/CpuPolicy$affectedCpusFile$2;

    .line 13
    .line 14
    invoke-direct {p1, p0}, Lcom/immomo/molive/apm/cpu/CpuPolicy$affectedCpusFile$2;-><init>(Lcom/immomo/molive/apm/cpu/CpuPolicy;)V

    .line 15
    .line 16
    .line 17
    invoke-static {p1}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iput-object p1, p0, Lcom/immomo/molive/apm/cpu/CpuPolicy;->b:Lkotlin/Lazy;

    .line 22
    .line 23
    new-instance p1, Lcom/immomo/molive/apm/cpu/CpuPolicy$timeInStateFile$2;

    .line 24
    .line 25
    invoke-direct {p1, p0}, Lcom/immomo/molive/apm/cpu/CpuPolicy$timeInStateFile$2;-><init>(Lcom/immomo/molive/apm/cpu/CpuPolicy;)V

    .line 26
    .line 27
    .line 28
    invoke-static {p1}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iput-object p1, p0, Lcom/immomo/molive/apm/cpu/CpuPolicy;->c:Lkotlin/Lazy;

    .line 33
    .line 34
    new-instance p1, Lcom/immomo/molive/apm/cpu/CpuPolicy$affectedCpusIds$2;

    .line 35
    .line 36
    invoke-direct {p1, p0}, Lcom/immomo/molive/apm/cpu/CpuPolicy$affectedCpusIds$2;-><init>(Lcom/immomo/molive/apm/cpu/CpuPolicy;)V

    .line 37
    .line 38
    .line 39
    invoke-static {p1}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iput-object p1, p0, Lcom/immomo/molive/apm/cpu/CpuPolicy;->d:Lkotlin/Lazy;

    .line 44
    .line 45
    new-instance p1, Lcom/immomo/molive/apm/cpu/CpuPolicy$controlCpuCores$2;

    .line 46
    .line 47
    invoke-direct {p1, p0}, Lcom/immomo/molive/apm/cpu/CpuPolicy$controlCpuCores$2;-><init>(Lcom/immomo/molive/apm/cpu/CpuPolicy;)V

    .line 48
    .line 49
    .line 50
    invoke-static {p1}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    iput-object p1, p0, Lcom/immomo/molive/apm/cpu/CpuPolicy;->e:Lkotlin/Lazy;

    .line 55
    .line 56
    return-void
.end method

.method public static final synthetic a(Lcom/immomo/molive/apm/cpu/CpuPolicy;)Ljava/io/File;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/molive/apm/cpu/CpuPolicy;->d()Ljava/io/File;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final synthetic b(Lcom/immomo/molive/apm/cpu/CpuPolicy;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/molive/apm/cpu/CpuPolicy;->e()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final synthetic c(Lcom/immomo/molive/apm/cpu/CpuPolicy;)Ljava/io/File;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/molive/apm/cpu/CpuPolicy;->k()Ljava/io/File;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private final d()Ljava/io/File;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/molive/apm/cpu/CpuPolicy;->b:Lkotlin/Lazy;

    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/io/File;

    return-object p0
.end method

.method private final e()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/molive/apm/cpu/CpuPolicy;->d:Lkotlin/Lazy;

    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    return-object p0
.end method

.method private final k()Ljava/io/File;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/molive/apm/cpu/CpuPolicy;->c:Lkotlin/Lazy;

    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/io/File;

    return-object p0
.end method


# virtual methods
.method public final f()Ljava/util/Map;
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

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/molive/apm/cpu/CpuPolicy;->e:Lkotlin/Lazy;

    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Map;

    return-object p0
.end method

.method public final g()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/molive/apm/cpu/CpuPolicy;->f:Ljava/io/File;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    return-object p0
.end method

.method public final h()J
    .locals 4

    .line 1
    sget-object v0, Ll/itb;->INSTANCE:Ll/itb;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/immomo/molive/apm/cpu/CpuPolicy;->k()Ljava/io/File;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ll/itb;->k(Ljava/io/File;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    invoke-direct {p0}, Lcom/immomo/molive/apm/cpu/CpuPolicy;->e()Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    int-to-long v2, p0

    .line 20
    mul-long/2addr v0, v2

    .line 21
    return-wide v0
.end method

.method public final i()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/molive/apm/cpu/CpuPolicy;->a:Z

    .line 2
    .line 3
    return p0
.end method

.method public final j()Ljava/io/File;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/molive/apm/cpu/CpuPolicy;->f:Ljava/io/File;

    .line 2
    .line 3
    return-object p0
.end method

.method public final l(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/molive/apm/cpu/CpuPolicy;->a:Z

    .line 2
    .line 3
    return-void
.end method
