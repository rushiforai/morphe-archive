.class public final Lcom/immomo/molive/apm/temp/TempSummary;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/erl;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/molive/apm/temp/TempSummary$TempType;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/erl<",
        "Lcom/immomo/molive/apm/temp/TempSummary;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0010\u000e\n\u0002\u0008\u000f\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\u0018B%\u0012\u0008\u0008\u0002\u0010\u0003\u001a\u00020\u0002\u0012\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u0002\u0012\u0008\u0008\u0002\u0010\u0005\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u000f\u0010\u0008\u001a\u00020\u0000H\u0016\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u000f\u0010\u000b\u001a\u00020\nH\u0016\u00a2\u0006\u0004\u0008\u000b\u0010\u000cR\u0018\u0010\u000e\u001a\u0004\u0018\u00010\u00008\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0008\u0010\rR\"\u0010\u0003\u001a\u00020\u00028\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u000f\u0010\u0010\u001a\u0004\u0008\u0011\u0010\u0012\"\u0004\u0008\u0013\u0010\u0014R\"\u0010\u0004\u001a\u00020\u00028\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u0011\u0010\u0010\u001a\u0004\u0008\u000f\u0010\u0012\"\u0004\u0008\u0015\u0010\u0014R\"\u0010\u0005\u001a\u00020\u00028\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u0016\u0010\u0010\u001a\u0004\u0008\u0016\u0010\u0012\"\u0004\u0008\u0017\u0010\u0014\u00a8\u0006\u0019"
    }
    d2 = {
        "Lcom/immomo/molive/apm/temp/TempSummary;",
        "Ll/erl;",
        "Ll/vpi0;",
        "cupTemp",
        "batteryTemp",
        "skinTemp",
        "<init>",
        "(Ll/vpi0;Ll/vpi0;Ll/vpi0;)V",
        "a",
        "()Lcom/immomo/molive/apm/temp/TempSummary;",
        "",
        "toString",
        "()Ljava/lang/String;",
        "Lcom/immomo/molive/apm/temp/TempSummary;",
        "cloneTempSummary",
        "b",
        "Ll/vpi0;",
        "c",
        "()Ll/vpi0;",
        "setCupTemp",
        "(Ll/vpi0;)V",
        "setBatteryTemp",
        "d",
        "setSkinTemp",
        "TempType",
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
.field private a:Lcom/immomo/molive/apm/temp/TempSummary;

.field private b:Ll/vpi0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private c:Ll/vpi0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private d:Ll/vpi0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 6

    .line 40
    const/4 v4, 0x7

    const/4 v5, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/immomo/molive/apm/temp/TempSummary;-><init>(Ll/vpi0;Ll/vpi0;Ll/vpi0;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Ll/vpi0;Ll/vpi0;Ll/vpi0;)V
    .locals 0
    .param p1    # Ll/vpi0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/vpi0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ll/vpi0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/immomo/molive/apm/temp/TempSummary;->b:Ll/vpi0;

    iput-object p2, p0, Lcom/immomo/molive/apm/temp/TempSummary;->c:Ll/vpi0;

    iput-object p3, p0, Lcom/immomo/molive/apm/temp/TempSummary;->d:Ll/vpi0;

    return-void
.end method

.method public synthetic constructor <init>(Ll/vpi0;Ll/vpi0;Ll/vpi0;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 1

    .line 1
    and-int/lit8 p5, p4, 0x1

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p5, :cond_0

    .line 5
    .line 6
    new-instance p1, Ll/vpi0;

    .line 7
    .line 8
    sget-object p5, Lcom/immomo/molive/apm/temp/TempSummary$TempType;->CPU:Lcom/immomo/molive/apm/temp/TempSummary$TempType;

    .line 9
    .line 10
    invoke-direct {p1, p5, v0}, Ll/vpi0;-><init>(Lcom/immomo/molive/apm/temp/TempSummary$TempType;I)V

    .line 11
    .line 12
    .line 13
    :cond_0
    and-int/lit8 p5, p4, 0x2

    .line 14
    .line 15
    if-eqz p5, :cond_1

    .line 16
    .line 17
    new-instance p2, Ll/vpi0;

    .line 18
    .line 19
    sget-object p5, Lcom/immomo/molive/apm/temp/TempSummary$TempType;->BATTERY:Lcom/immomo/molive/apm/temp/TempSummary$TempType;

    .line 20
    .line 21
    invoke-direct {p2, p5, v0}, Ll/vpi0;-><init>(Lcom/immomo/molive/apm/temp/TempSummary$TempType;I)V

    .line 22
    .line 23
    .line 24
    :cond_1
    and-int/lit8 p4, p4, 0x4

    .line 25
    .line 26
    if-eqz p4, :cond_2

    .line 27
    .line 28
    new-instance p3, Ll/vpi0;

    .line 29
    .line 30
    sget-object p4, Lcom/immomo/molive/apm/temp/TempSummary$TempType;->SKIN:Lcom/immomo/molive/apm/temp/TempSummary$TempType;

    .line 31
    .line 32
    invoke-direct {p3, p4, v0}, Ll/vpi0;-><init>(Lcom/immomo/molive/apm/temp/TempSummary$TempType;I)V

    .line 33
    .line 34
    .line 35
    :cond_2
    invoke-direct {p0, p1, p2, p3}, Lcom/immomo/molive/apm/temp/TempSummary;-><init>(Ll/vpi0;Ll/vpi0;Ll/vpi0;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method


# virtual methods
.method public a()Lcom/immomo/molive/apm/temp/TempSummary;
    .locals 7
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/immomo/molive/apm/temp/TempSummary;->a:Lcom/immomo/molive/apm/temp/TempSummary;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v1, Lcom/immomo/molive/apm/temp/TempSummary;

    .line 6
    .line 7
    const/4 v5, 0x7

    .line 8
    const/4 v6, 0x0

    .line 9
    const/4 v2, 0x0

    .line 10
    const/4 v3, 0x0

    .line 11
    const/4 v4, 0x0

    .line 12
    invoke-direct/range {v1 .. v6}, Lcom/immomo/molive/apm/temp/TempSummary;-><init>(Ll/vpi0;Ll/vpi0;Ll/vpi0;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 13
    .line 14
    .line 15
    iput-object v1, p0, Lcom/immomo/molive/apm/temp/TempSummary;->a:Lcom/immomo/molive/apm/temp/TempSummary;

    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Lcom/immomo/molive/apm/temp/TempSummary;->a:Lcom/immomo/molive/apm/temp/TempSummary;

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iget-object v0, v0, Lcom/immomo/molive/apm/temp/TempSummary;->b:Ll/vpi0;

    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    iget-object v1, p0, Lcom/immomo/molive/apm/temp/TempSummary;->b:Ll/vpi0;

    .line 26
    .line 27
    invoke-virtual {v1}, Ll/vpi0;->a()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    invoke-virtual {v0, v1}, Ll/vpi0;->b(I)V

    .line 32
    .line 33
    .line 34
    :cond_1
    iget-object v0, p0, Lcom/immomo/molive/apm/temp/TempSummary;->a:Lcom/immomo/molive/apm/temp/TempSummary;

    .line 35
    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    iget-object v0, v0, Lcom/immomo/molive/apm/temp/TempSummary;->c:Ll/vpi0;

    .line 39
    .line 40
    if-eqz v0, :cond_2

    .line 41
    .line 42
    iget-object v1, p0, Lcom/immomo/molive/apm/temp/TempSummary;->c:Ll/vpi0;

    .line 43
    .line 44
    invoke-virtual {v1}, Ll/vpi0;->a()I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    invoke-virtual {v0, v1}, Ll/vpi0;->b(I)V

    .line 49
    .line 50
    .line 51
    :cond_2
    iget-object v0, p0, Lcom/immomo/molive/apm/temp/TempSummary;->a:Lcom/immomo/molive/apm/temp/TempSummary;

    .line 52
    .line 53
    if-eqz v0, :cond_3

    .line 54
    .line 55
    iget-object v0, v0, Lcom/immomo/molive/apm/temp/TempSummary;->d:Ll/vpi0;

    .line 56
    .line 57
    if-eqz v0, :cond_3

    .line 58
    .line 59
    iget-object v1, p0, Lcom/immomo/molive/apm/temp/TempSummary;->d:Ll/vpi0;

    .line 60
    .line 61
    invoke-virtual {v1}, Ll/vpi0;->a()I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    invoke-virtual {v0, v1}, Ll/vpi0;->b(I)V

    .line 66
    .line 67
    .line 68
    :cond_3
    iget-object p0, p0, Lcom/immomo/molive/apm/temp/TempSummary;->a:Lcom/immomo/molive/apm/temp/TempSummary;

    .line 69
    .line 70
    if-nez p0, :cond_4

    .line 71
    .line 72
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 73
    .line 74
    .line 75
    :cond_4
    return-object p0
.end method

.method public final b()Ll/vpi0;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/molive/apm/temp/TempSummary;->c:Ll/vpi0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c()Ll/vpi0;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/molive/apm/temp/TempSummary;->b:Ll/vpi0;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/immomo/molive/apm/temp/TempSummary;->a()Lcom/immomo/molive/apm/temp/TempSummary;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final d()Ll/vpi0;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/molive/apm/temp/TempSummary;->d:Ll/vpi0;

    .line 2
    .line 3
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "TempSummary(cupTemp="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/immomo/molive/apm/temp/TempSummary;->b:Ll/vpi0;

    .line 9
    .line 10
    invoke-virtual {v1}, Ll/vpi0;->a()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v1, "\u00b0C, batteryTemp="

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Lcom/immomo/molive/apm/temp/TempSummary;->c:Ll/vpi0;

    .line 23
    .line 24
    invoke-virtual {v1}, Ll/vpi0;->a()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v1, "\u00b0C, skinTemp="

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lcom/immomo/molive/apm/temp/TempSummary;->d:Ll/vpi0;

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/vpi0;->a()I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string p0, "\u00b0C)"

    .line 46
    .line 47
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    return-object p0
.end method
