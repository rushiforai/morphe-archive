.class public final Lcom/immomo/molive/apm/temp/TempTracer;
.super Ll/cs2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/cs2<",
        "Lcom/immomo/molive/apm/temp/TempSummary;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u000e\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u000f\u0010\u0007\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u000f\u0010\n\u001a\u00020\tH\u0016\u00a2\u0006\u0004\u0008\n\u0010\u000bR\u0017\u0010\u0011\u001a\u00020\u000c8\u0006\u00a2\u0006\u000c\n\u0004\u0008\r\u0010\u000e\u001a\u0004\u0008\u000f\u0010\u0010R\u001b\u0010\u0015\u001a\u00020\u00028FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0012\u0010\u0013\u001a\u0004\u0008\u0014\u0010\u0008R\u0017\u0010\u0004\u001a\u00020\u00038\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0016\u0010\u0017\u001a\u0004\u0008\u0018\u0010\u0019\u00a8\u0006\u001a"
    }
    d2 = {
        "Lcom/immomo/molive/apm/temp/TempTracer;",
        "Ll/cs2;",
        "Lcom/immomo/molive/apm/temp/TempSummary;",
        "Ll/ci2;",
        "tempConfig",
        "<init>",
        "(Ll/ci2;)V",
        "j",
        "()Lcom/immomo/molive/apm/temp/TempSummary;",
        "",
        "i",
        "()Z",
        "Ljava/text/DecimalFormat;",
        "e",
        "Ljava/text/DecimalFormat;",
        "getDf",
        "()Ljava/text/DecimalFormat;",
        "df",
        "f",
        "Lkotlin/Lazy;",
        "h",
        "tempSummary",
        "g",
        "Ll/ci2;",
        "getTempConfig",
        "()Ll/ci2;",
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
.field private final e:Ljava/text/DecimalFormat;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final f:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final g:Ll/ci2;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/ci2;)V
    .locals 1
    .param p1    # Ll/ci2;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Ll/cs2;-><init>(Ll/ci2;)V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lcom/immomo/molive/apm/temp/TempTracer;->g:Ll/ci2;

    .line 8
    .line 9
    new-instance p1, Ljava/text/DecimalFormat;

    .line 10
    .line 11
    const-string v0, "#.#"

    .line 12
    .line 13
    invoke-direct {p1, v0}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/immomo/molive/apm/temp/TempTracer;->e:Ljava/text/DecimalFormat;

    .line 17
    .line 18
    sget-object p1, Lcom/immomo/molive/apm/temp/TempTracer$tempSummary$2;->INSTANCE:Lcom/immomo/molive/apm/temp/TempTracer$tempSummary$2;

    .line 19
    .line 20
    invoke-static {p1}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, Lcom/immomo/molive/apm/temp/TempTracer;->f:Lkotlin/Lazy;

    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public bridge synthetic c()Ll/erl;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/immomo/molive/apm/temp/TempTracer;->j()Lcom/immomo/molive/apm/temp/TempSummary;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final h()Lcom/immomo/molive/apm/temp/TempSummary;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/molive/apm/temp/TempTracer;->f:Lkotlin/Lazy;

    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/immomo/molive/apm/temp/TempSummary;

    return-object p0
.end method

.method public i()Z
    .locals 0

    .line 1
    sget-object p0, Lcom/immomo/molive/apm/temp/TempUtils;->INSTANCE:Lcom/immomo/molive/apm/temp/TempUtils;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/immomo/molive/apm/temp/TempUtils;->h()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public j()Lcom/immomo/molive/apm/temp/TempSummary;
    .locals 4
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object v0, Lcom/immomo/molive/apm/temp/TempUtils;->INSTANCE:Lcom/immomo/molive/apm/temp/TempUtils;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/immomo/molive/apm/temp/TempUtils;->c()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {v0}, Lcom/immomo/molive/apm/temp/TempUtils;->e()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    invoke-virtual {v0}, Lcom/immomo/molive/apm/temp/TempUtils;->a()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p0}, Lcom/immomo/molive/apm/temp/TempTracer;->h()Lcom/immomo/molive/apm/temp/TempSummary;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    invoke-virtual {v3}, Lcom/immomo/molive/apm/temp/TempSummary;->c()Ll/vpi0;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    invoke-virtual {v3, v1}, Ll/vpi0;->b(I)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/immomo/molive/apm/temp/TempTracer;->h()Lcom/immomo/molive/apm/temp/TempSummary;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v1}, Lcom/immomo/molive/apm/temp/TempSummary;->d()Ll/vpi0;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v1, v2}, Ll/vpi0;->b(I)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/immomo/molive/apm/temp/TempTracer;->h()Lcom/immomo/molive/apm/temp/TempSummary;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v1}, Lcom/immomo/molive/apm/temp/TempSummary;->b()Ll/vpi0;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v1, v0}, Ll/vpi0;->b(I)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/immomo/molive/apm/temp/TempTracer;->h()Lcom/immomo/molive/apm/temp/TempSummary;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0
.end method
