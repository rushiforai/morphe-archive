.class public abstract Ll/pud;
.super Ll/ji2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<I:",
        "Ljava/lang/Object;",
        "O:",
        "Ljava/lang/Object;",
        ">",
        "Ll/ji2<",
        "TI;>;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0003\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u0007\n\u0002\u0008\u0008\u0008&\u0018\u0000*\u0004\u0008\u0000\u0010\u0001*\u0004\u0008\u0001\u0010\u00022\u0008\u0012\u0004\u0012\u00028\u00000\u0003B\u0015\u0012\u000c\u0010\u0005\u001a\u0008\u0012\u0004\u0012\u00028\u00010\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u0017\u0010\u000b\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\u0008H\u0014\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u000f\u0010\r\u001a\u00020\nH\u0014\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u0017\u0010\u0011\u001a\u00020\n2\u0006\u0010\u0010\u001a\u00020\u000fH\u0014\u00a2\u0006\u0004\u0008\u0011\u0010\u0012R\u001d\u0010\u0005\u001a\u0008\u0012\u0004\u0012\u00028\u00010\u00048\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0013\u0010\u0014\u001a\u0004\u0008\u0015\u0010\u0016\u00a8\u0006\u0017"
    }
    d2 = {
        "Ll/pud;",
        "I",
        "O",
        "Ll/ji2;",
        "Ll/z06;",
        "consumer",
        "<init>",
        "(Ll/z06;)V",
        "",
        "t",
        "",
        "g",
        "(Ljava/lang/Throwable;)V",
        "f",
        "()V",
        "",
        "progress",
        "i",
        "(F)V",
        "b",
        "Ll/z06;",
        "o",
        "()Ll/z06;",
        "imagepipeline_release"
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
.field public final b:Ll/z06;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z06<",
            "TO;>;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/z06;)V
    .locals 0
    .param p1    # Ll/z06;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z06<",
            "TO;>;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/ji2;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Ll/pud;->b:Ll/z06;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public f()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pud;->b:Ll/z06;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/z06;->a()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public g(Ljava/lang/Throwable;)V
    .locals 0
    .param p1    # Ljava/lang/Throwable;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/pud;->b:Ll/z06;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ll/z06;->onFailure(Ljava/lang/Throwable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public i(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pud;->b:Ll/z06;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/z06;->c(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final o()Ll/z06;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/z06<",
            "TO;>;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/pud;->b:Ll/z06;

    .line 2
    .line 3
    return-object p0
.end method
