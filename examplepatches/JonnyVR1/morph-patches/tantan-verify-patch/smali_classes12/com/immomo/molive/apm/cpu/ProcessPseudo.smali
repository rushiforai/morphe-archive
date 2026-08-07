.class public final Lcom/immomo/molive/apm/cpu/ProcessPseudo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0010\u0018\u00002\u00020\u0001B\u0011\u0012\u0008\u0008\u0002\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\r\u0010\u0007\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u0007\u0010\u0008R\u001b\u0010\u000e\u001a\u00020\t8BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\n\u0010\u000b\u001a\u0004\u0008\u000c\u0010\rR\u001b\u0010\u0012\u001a\u00020\u000f8BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u000c\u0010\u000b\u001a\u0004\u0008\u0010\u0010\u0011R\u001b\u0010\u0014\u001a\u00020\u000f8BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0013\u0010\u000b\u001a\u0004\u0008\u0013\u0010\u0011R\u001b\u0010\u0017\u001a\u00020\u000f8BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0015\u0010\u000b\u001a\u0004\u0008\u0016\u0010\u0011R\u001b\u0010\u001a\u001a\u00020\u000f8BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0018\u0010\u000b\u001a\u0004\u0008\u0019\u0010\u0011R\u001b\u0010\u001b\u001a\u00020\u00068FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0007\u0010\u000b\u001a\u0004\u0008\u0015\u0010\u0008R\u0017\u0010\u0003\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u001c\u0010\u001d\u001a\u0004\u0008\u0018\u0010\u001e\u00a8\u0006\u001f"
    }
    d2 = {
        "Lcom/immomo/molive/apm/cpu/ProcessPseudo;",
        "",
        "",
        "processPid",
        "<init>",
        "(I)V",
        "Ll/hk90;",
        "f",
        "()Ll/hk90;",
        "",
        "a",
        "Lkotlin/Lazy;",
        "b",
        "()Ljava/lang/String;",
        "mBasePath",
        "Ljava/io/File;",
        "getMTimeInStateFile",
        "()Ljava/io/File;",
        "mTimeInStateFile",
        "c",
        "mStateFile",
        "d",
        "getMCpuSetFile",
        "mCpuSetFile",
        "e",
        "getMSchedFile",
        "mSchedFile",
        "procStatSummary",
        "g",
        "I",
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

.field private final e:Lkotlin/Lazy;

.field private final f:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final g:I


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 70
    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {p0, v2, v0, v1}, Lcom/immomo/molive/apm/cpu/ProcessPseudo;-><init>(IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/immomo/molive/apm/cpu/ProcessPseudo;->g:I

    .line 5
    .line 6
    new-instance p1, Lcom/immomo/molive/apm/cpu/ProcessPseudo$mBasePath$2;

    .line 7
    .line 8
    invoke-direct {p1, p0}, Lcom/immomo/molive/apm/cpu/ProcessPseudo$mBasePath$2;-><init>(Lcom/immomo/molive/apm/cpu/ProcessPseudo;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p1}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Lcom/immomo/molive/apm/cpu/ProcessPseudo;->a:Lkotlin/Lazy;

    .line 16
    .line 17
    new-instance p1, Lcom/immomo/molive/apm/cpu/ProcessPseudo$mTimeInStateFile$2;

    .line 18
    .line 19
    invoke-direct {p1, p0}, Lcom/immomo/molive/apm/cpu/ProcessPseudo$mTimeInStateFile$2;-><init>(Lcom/immomo/molive/apm/cpu/ProcessPseudo;)V

    .line 20
    .line 21
    .line 22
    invoke-static {p1}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iput-object p1, p0, Lcom/immomo/molive/apm/cpu/ProcessPseudo;->b:Lkotlin/Lazy;

    .line 27
    .line 28
    new-instance p1, Lcom/immomo/molive/apm/cpu/ProcessPseudo$mStateFile$2;

    .line 29
    .line 30
    invoke-direct {p1, p0}, Lcom/immomo/molive/apm/cpu/ProcessPseudo$mStateFile$2;-><init>(Lcom/immomo/molive/apm/cpu/ProcessPseudo;)V

    .line 31
    .line 32
    .line 33
    invoke-static {p1}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iput-object p1, p0, Lcom/immomo/molive/apm/cpu/ProcessPseudo;->c:Lkotlin/Lazy;

    .line 38
    .line 39
    new-instance p1, Lcom/immomo/molive/apm/cpu/ProcessPseudo$mCpuSetFile$2;

    .line 40
    .line 41
    invoke-direct {p1, p0}, Lcom/immomo/molive/apm/cpu/ProcessPseudo$mCpuSetFile$2;-><init>(Lcom/immomo/molive/apm/cpu/ProcessPseudo;)V

    .line 42
    .line 43
    .line 44
    invoke-static {p1}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    iput-object p1, p0, Lcom/immomo/molive/apm/cpu/ProcessPseudo;->d:Lkotlin/Lazy;

    .line 49
    .line 50
    new-instance p1, Lcom/immomo/molive/apm/cpu/ProcessPseudo$mSchedFile$2;

    .line 51
    .line 52
    invoke-direct {p1, p0}, Lcom/immomo/molive/apm/cpu/ProcessPseudo$mSchedFile$2;-><init>(Lcom/immomo/molive/apm/cpu/ProcessPseudo;)V

    .line 53
    .line 54
    .line 55
    invoke-static {p1}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    iput-object p1, p0, Lcom/immomo/molive/apm/cpu/ProcessPseudo;->e:Lkotlin/Lazy;

    .line 60
    .line 61
    sget-object p1, Lcom/immomo/molive/apm/cpu/ProcessPseudo$procStatSummary$2;->INSTANCE:Lcom/immomo/molive/apm/cpu/ProcessPseudo$procStatSummary$2;

    .line 62
    .line 63
    invoke-static {p1}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    iput-object p1, p0, Lcom/immomo/molive/apm/cpu/ProcessPseudo;->f:Lkotlin/Lazy;

    .line 68
    .line 69
    return-void
.end method

.method public synthetic constructor <init>(IILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_0

    .line 71
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result p1

    :cond_0
    invoke-direct {p0, p1}, Lcom/immomo/molive/apm/cpu/ProcessPseudo;-><init>(I)V

    return-void
.end method

.method public static final synthetic a(Lcom/immomo/molive/apm/cpu/ProcessPseudo;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/molive/apm/cpu/ProcessPseudo;->b()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private final b()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/molive/apm/cpu/ProcessPseudo;->a:Lkotlin/Lazy;

    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method private final c()Ljava/io/File;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/molive/apm/cpu/ProcessPseudo;->c:Lkotlin/Lazy;

    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/io/File;

    return-object p0
.end method


# virtual methods
.method public final d()Ll/hk90;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/molive/apm/cpu/ProcessPseudo;->f:Lkotlin/Lazy;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/hk90;

    .line 8
    .line 9
    return-object p0
.end method

.method public final e()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/molive/apm/cpu/ProcessPseudo;->g:I

    .line 2
    .line 3
    return p0
.end method

.method public final f()Ll/hk90;
    .locals 3
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object v0, Ll/itb;->INSTANCE:Ll/itb;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/immomo/molive/apm/cpu/ProcessPseudo;->c()Ljava/io/File;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {p0}, Lcom/immomo/molive/apm/cpu/ProcessPseudo;->d()Ll/hk90;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {v0, v1, v2}, Ll/itb;->c(Ljava/io/File;Ll/hk90;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/immomo/molive/apm/cpu/ProcessPseudo;->d()Ll/hk90;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method
