.class public final Ll/b1n;
.super Ll/szm;
.source "SourceFile"

# interfaces
.implements Ll/k2d0;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0003\n\u0002\u0008\u0008\u0018\u00002\u00020\u00012\u00020\u0002B\u001b\u0012\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u0002\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u0017\u0010\u000b\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u0017\u0010\r\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\r\u0010\u000cJ!\u0010\u0010\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\u00082\u0008\u0010\u000f\u001a\u0004\u0018\u00010\u000eH\u0016\u00a2\u0006\u0004\u0008\u0010\u0010\u0011J\u0017\u0010\u0012\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\u0012\u0010\u000cR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\r\u0010\u0013R\u0016\u0010\u0005\u001a\u0004\u0018\u00010\u00028\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0014\u0010\u0015\u00a8\u0006\u0016"
    }
    d2 = {
        "Ll/b1n;",
        "Ll/szm;",
        "Ll/k2d0;",
        "Ll/j2d0;",
        "requestListener",
        "requestListener2",
        "<init>",
        "(Ll/j2d0;Ll/k2d0;)V",
        "Ll/yk90;",
        "producerContext",
        "",
        "b",
        "(Ll/yk90;)V",
        "c",
        "",
        "throwable",
        "g",
        "(Ll/yk90;Ljava/lang/Throwable;)V",
        "h",
        "Ll/j2d0;",
        "d",
        "Ll/k2d0;",
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
.field public final c:Ll/j2d0;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public final d:Ll/k2d0;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/j2d0;Ll/k2d0;)V
    .locals 0
    .param p1    # Ll/j2d0;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ll/k2d0;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Ll/szm;-><init>(Ll/dl90;Ll/cl90;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/b1n;->c:Ll/j2d0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/b1n;->d:Ll/k2d0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public b(Ll/yk90;)V
    .locals 5
    .param p1    # Ll/yk90;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/b1n;->c:Ll/j2d0;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-interface {p1}, Ll/yk90;->t()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-interface {p1}, Ll/yk90;->k()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-interface {p1}, Ll/yk90;->getId()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    invoke-interface {p1}, Ll/yk90;->H()Z

    .line 21
    .line 22
    .line 23
    move-result v4

    .line 24
    invoke-interface {v0, v1, v2, v3, v4}, Ll/j2d0;->e(Lcom/facebook/imagepipeline/request/ImageRequest;Ljava/lang/Object;Ljava/lang/String;Z)V

    .line 25
    .line 26
    .line 27
    :cond_0
    iget-object p0, p0, Ll/b1n;->d:Ll/k2d0;

    .line 28
    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    invoke-interface {p0, p1}, Ll/k2d0;->b(Ll/yk90;)V

    .line 32
    .line 33
    .line 34
    :cond_1
    return-void
.end method

.method public c(Ll/yk90;)V
    .locals 4
    .param p1    # Ll/yk90;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/b1n;->c:Ll/j2d0;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-interface {p1}, Ll/yk90;->t()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-interface {p1}, Ll/yk90;->getId()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-interface {p1}, Ll/yk90;->H()Z

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    invoke-interface {v0, v1, v2, v3}, Ll/j2d0;->b(Lcom/facebook/imagepipeline/request/ImageRequest;Ljava/lang/String;Z)V

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object p0, p0, Ll/b1n;->d:Ll/k2d0;

    .line 24
    .line 25
    if-eqz p0, :cond_1

    .line 26
    .line 27
    invoke-interface {p0, p1}, Ll/k2d0;->c(Ll/yk90;)V

    .line 28
    .line 29
    .line 30
    :cond_1
    return-void
.end method

.method public g(Ll/yk90;Ljava/lang/Throwable;)V
    .locals 4
    .param p1    # Ll/yk90;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Throwable;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/b1n;->c:Ll/j2d0;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-interface {p1}, Ll/yk90;->t()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-interface {p1}, Ll/yk90;->getId()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-interface {p1}, Ll/yk90;->H()Z

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    invoke-interface {v0, v1, v2, p2, v3}, Ll/j2d0;->j(Lcom/facebook/imagepipeline/request/ImageRequest;Ljava/lang/String;Ljava/lang/Throwable;Z)V

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object p0, p0, Ll/b1n;->d:Ll/k2d0;

    .line 24
    .line 25
    if-eqz p0, :cond_1

    .line 26
    .line 27
    invoke-interface {p0, p1, p2}, Ll/k2d0;->g(Ll/yk90;Ljava/lang/Throwable;)V

    .line 28
    .line 29
    .line 30
    :cond_1
    return-void
.end method

.method public h(Ll/yk90;)V
    .locals 2
    .param p1    # Ll/yk90;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/b1n;->c:Ll/j2d0;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-interface {p1}, Ll/yk90;->getId()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-interface {v0, v1}, Ll/j2d0;->k(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object p0, p0, Ll/b1n;->d:Ll/k2d0;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    invoke-interface {p0, p1}, Ll/k2d0;->h(Ll/yk90;)V

    .line 20
    .line 21
    .line 22
    :cond_1
    return-void
.end method
