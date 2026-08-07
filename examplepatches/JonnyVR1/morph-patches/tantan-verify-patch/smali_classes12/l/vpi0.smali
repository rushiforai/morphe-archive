.class public final Ll/vpi0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u000c\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007R\u0017\u0010\u0003\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0008\u0010\t\u001a\u0004\u0008\n\u0010\u000bR\"\u0010\u0005\u001a\u00020\u00048\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u000c\u0010\r\u001a\u0004\u0008\u0008\u0010\u000e\"\u0004\u0008\u000c\u0010\u000f\u00a8\u0006\u0010"
    }
    d2 = {
        "Ll/vpi0;",
        "",
        "Lcom/immomo/molive/apm/temp/TempSummary$TempType;",
        "type",
        "",
        "tempValue",
        "<init>",
        "(Lcom/immomo/molive/apm/temp/TempSummary$TempType;I)V",
        "a",
        "Lcom/immomo/molive/apm/temp/TempSummary$TempType;",
        "getType",
        "()Lcom/immomo/molive/apm/temp/TempSummary$TempType;",
        "b",
        "I",
        "()I",
        "(I)V",
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
.field private final a:Lcom/immomo/molive/apm/temp/TempSummary$TempType;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private b:I


# direct methods
.method public constructor <init>(Lcom/immomo/molive/apm/temp/TempSummary$TempType;I)V
    .locals 0
    .param p1    # Lcom/immomo/molive/apm/temp/TempSummary$TempType;
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
    iput-object p1, p0, Ll/vpi0;->a:Lcom/immomo/molive/apm/temp/TempSummary$TempType;

    .line 8
    .line 9
    iput p2, p0, Ll/vpi0;->b:I

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final a()I
    .locals 0

    .line 1
    iget p0, p0, Ll/vpi0;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public final b(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/vpi0;->b:I

    .line 2
    .line 3
    return-void
.end method
