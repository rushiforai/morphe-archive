.class public final Lcom/immomo/molive/apm/cpu/SystemPseudo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\r\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0005\u0010\u0006R\u001b\u0010\u000c\u001a\u00020\u00078BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0008\u0010\t\u001a\u0004\u0008\n\u0010\u000bR\u001b\u0010\u0010\u001a\u00020\r8BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\n\u0010\t\u001a\u0004\u0008\u000e\u0010\u000fR\u001b\u0010\u0012\u001a\u00020\u00048FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u000e\u0010\t\u001a\u0004\u0008\u0011\u0010\u0006\u00a8\u0006\u0013"
    }
    d2 = {
        "Lcom/immomo/molive/apm/cpu/SystemPseudo;",
        "",
        "<init>",
        "()V",
        "Ll/soh0;",
        "e",
        "()Ll/soh0;",
        "",
        "a",
        "Lkotlin/Lazy;",
        "b",
        "()Ljava/lang/String;",
        "mBasePath",
        "Ljava/io/File;",
        "c",
        "()Ljava/io/File;",
        "mStateFile",
        "d",
        "sysStatSummary",
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
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/immomo/molive/apm/cpu/SystemPseudo$mBasePath$2;->INSTANCE:Lcom/immomo/molive/apm/cpu/SystemPseudo$mBasePath$2;

    .line 5
    .line 6
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lcom/immomo/molive/apm/cpu/SystemPseudo;->a:Lkotlin/Lazy;

    .line 11
    .line 12
    new-instance v0, Lcom/immomo/molive/apm/cpu/SystemPseudo$mStateFile$2;

    .line 13
    .line 14
    invoke-direct {v0, p0}, Lcom/immomo/molive/apm/cpu/SystemPseudo$mStateFile$2;-><init>(Lcom/immomo/molive/apm/cpu/SystemPseudo;)V

    .line 15
    .line 16
    .line 17
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p0, Lcom/immomo/molive/apm/cpu/SystemPseudo;->b:Lkotlin/Lazy;

    .line 22
    .line 23
    sget-object v0, Lcom/immomo/molive/apm/cpu/SystemPseudo$sysStatSummary$2;->INSTANCE:Lcom/immomo/molive/apm/cpu/SystemPseudo$sysStatSummary$2;

    .line 24
    .line 25
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Lcom/immomo/molive/apm/cpu/SystemPseudo;->c:Lkotlin/Lazy;

    .line 30
    .line 31
    return-void
.end method

.method public static final synthetic a(Lcom/immomo/molive/apm/cpu/SystemPseudo;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/molive/apm/cpu/SystemPseudo;->b()Ljava/lang/String;

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
    iget-object p0, p0, Lcom/immomo/molive/apm/cpu/SystemPseudo;->a:Lkotlin/Lazy;

    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method private final c()Ljava/io/File;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/molive/apm/cpu/SystemPseudo;->b:Lkotlin/Lazy;

    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/io/File;

    return-object p0
.end method


# virtual methods
.method public final d()Ll/soh0;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/molive/apm/cpu/SystemPseudo;->c:Lkotlin/Lazy;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/soh0;

    .line 8
    .line 9
    return-object p0
.end method

.method public final e()Ll/soh0;
    .locals 3
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object v0, Ll/itb;->INSTANCE:Ll/itb;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/immomo/molive/apm/cpu/SystemPseudo;->c()Ljava/io/File;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {p0}, Lcom/immomo/molive/apm/cpu/SystemPseudo;->d()Ll/soh0;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {v0, v1, v2}, Ll/itb;->d(Ljava/io/File;Ll/soh0;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/immomo/molive/apm/cpu/SystemPseudo;->d()Ll/soh0;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method
