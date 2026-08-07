.class public final Ll/m5f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/k0l0;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/k0l0<",
        "Ljava/lang/String;",
        "Ll/z6b0;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0018\u00002\u0010\u0012\u0006\u0012\u0004\u0018\u00010\u0002\u0012\u0004\u0012\u00020\u00030\u0001B\u0017\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u0008\u0010\tJ!\u0010\r\u001a\u00020\u00032\u0008\u0010\n\u001a\u0004\u0018\u00010\u00022\u0006\u0010\u000c\u001a\u00020\u000bH\u0016\u00a2\u0006\u0004\u0008\r\u0010\u000eR\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\r\u0010\u000fR\u0014\u0010\u0007\u001a\u00020\u00068\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0010\u0010\u0011R\u0014\u0010\u0015\u001a\u00020\u00128\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0013\u0010\u0014R\u0014\u0010\u0019\u001a\u00020\u00168\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0017\u0010\u0018\u00a8\u0006\u001a"
    }
    d2 = {
        "Ll/m5f;",
        "Ll/k0l0;",
        "",
        "Ll/z6b0;",
        "Ll/u0l0;",
        "errorReporter",
        "Ll/axl;",
        "logger",
        "<init>",
        "(Ll/u0l0;Ll/axl;)V",
        "input",
        "Ll/i0l0;",
        "config",
        "a",
        "(Ljava/lang/String;Ll/i0l0;)Ll/z6b0;",
        "Ll/u0l0;",
        "b",
        "Ll/axl;",
        "Ll/l5f;",
        "c",
        "Ll/l5f;",
        "normalizer",
        "Ll/n5f;",
        "d",
        "Ll/n5f;",
        "validator",
        "clevertap-core_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final a:Ll/u0l0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final b:Ll/axl;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final c:Ll/l5f;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final d:Ll/n5f;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/u0l0;Ll/axl;)V
    .locals 0
    .param p1    # Ll/u0l0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/axl;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Ll/m5f;->a:Ll/u0l0;

    .line 11
    .line 12
    iput-object p2, p0, Ll/m5f;->b:Ll/axl;

    .line 13
    .line 14
    new-instance p1, Ll/l5f;

    .line 15
    .line 16
    invoke-direct {p1}, Ll/l5f;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Ll/m5f;->c:Ll/l5f;

    .line 20
    .line 21
    new-instance p1, Ll/n5f;

    .line 22
    .line 23
    invoke-direct {p1}, Ll/n5f;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Ll/m5f;->d:Ll/n5f;

    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;Ll/i0l0;)Ll/z6b0;
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ll/i0l0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/m5f;->c:Ll/l5f;

    .line 5
    .line 6
    invoke-virtual {v0, p1, p2}, Ll/l5f;->a(Ljava/lang/String;Ll/i0l0;)Ll/y6b0;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iget-object v0, p0, Ll/m5f;->d:Ll/n5f;

    .line 11
    .line 12
    invoke-virtual {v0, p1, p2}, Ll/n5f;->a(Ll/y6b0;Ll/i0l0;)Ll/j0l0;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    iget-object v0, p0, Ll/m5f;->a:Ll/u0l0;

    .line 17
    .line 18
    invoke-interface {p2}, Ll/j0l0;->a()Ljava/util/List;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Ll/u0l0;->b(Ljava/util/List;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/m5f;->b:Ll/axl;

    .line 26
    .line 27
    const-string v1, "PropertyKeyValidation"

    .line 28
    .line 29
    invoke-virtual {p0, v0, v1, p2}, Ll/m5f;->b(Ll/axl;Ljava/lang/String;Ll/j0l0;)V

    .line 30
    .line 31
    .line 32
    new-instance p0, Ll/z6b0;

    .line 33
    .line 34
    invoke-virtual {p1}, Ll/y6b0;->a()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-direct {p0, p1, p2}, Ll/z6b0;-><init>(Ljava/lang/String;Ll/j0l0;)V

    .line 39
    .line 40
    .line 41
    return-object p0
.end method

.method public b(Ll/axl;Ljava/lang/String;Ll/j0l0;)V
    .locals 0
    .param p1    # Ll/axl;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ll/j0l0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-static {p0, p1, p2, p3}, Ll/k0l0$a;->a(Ll/k0l0;Ll/axl;Ljava/lang/String;Ll/j0l0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
