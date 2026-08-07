.class public final Ll/nu5;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/nu5$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/mu5;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000(\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u000e\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001:\u0001\u0012B\u0017\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u0015\u0010\u000c\u001a\u00020\u000b2\u0006\u0010\n\u001a\u00020\t\u00a2\u0006\u0004\u0008\u000c\u0010\rJ\r\u0010\u000e\u001a\u00020\u000b\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ\r\u0010\u0010\u001a\u00020\u000b\u00a2\u0006\u0004\u0008\u0010\u0010\u000fJ\u000f\u0010\u0011\u001a\u00020\u000bH\u0016\u00a2\u0006\u0004\u0008\u0011\u0010\u000fR\u0017\u0010\u0006\u001a\u00020\u00058\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0012\u0010\u0013\u001a\u0004\u0008\u0014\u0010\u0015R\u0016\u0010\u0018\u001a\u00020\t8\u0002@\u0002X\u0082.\u00a2\u0006\u0006\n\u0004\u0008\u0016\u0010\u0017\u00a8\u0006\u0019"
    }
    d2 = {
        "Ll/nu5;",
        "Ll/ar2;",
        "Ll/mu5;",
        "Ll/ner;",
        "lifecycleProvider",
        "Lcom/p1/mobile/android/app/Act;",
        "act",
        "<init>",
        "(Ll/ner;Lcom/p1/mobile/android/app/Act;)V",
        "Ll/nu5$a;",
        "listener",
        "",
        "f0",
        "(Ll/nu5$a;)V",
        "e0",
        "()V",
        "g0",
        "destroy",
        "a",
        "Lcom/p1/mobile/android/app/Act;",
        "getAct",
        "()Lcom/p1/mobile/android/app/Act;",
        "b",
        "Ll/nu5$a;",
        "confirmListener",
        "livingroom_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/android/app/Act;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public b:Ll/nu5$a;


# direct methods
.method public constructor <init>(Ll/ner;Lcom/p1/mobile/android/app/Act;)V
    .locals 0
    .param p1    # Ll/ner;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/android/app/Act;
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
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 8
    .line 9
    .line 10
    iput-object p2, p0, Ll/nu5;->a:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final e0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nu5;->b:Ll/nu5$a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string v0, "confirmListener"

    .line 6
    .line 7
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    :cond_0
    invoke-interface {v0}, Ll/nu5$a;->b()V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 15
    .line 16
    check-cast p0, Ll/mu5;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/mu5;->k()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final f0(Ll/nu5$a;)V
    .locals 1
    .param p1    # Ll/nu5$a;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    new-instance v0, Ll/mu5;

    .line 9
    .line 10
    invoke-direct {v0}, Ll/mu5;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ll/ar2;->C(Ll/iam;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iput-object p1, p0, Ll/nu5;->b:Ll/nu5$a;

    .line 19
    .line 20
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 21
    .line 22
    check-cast p1, Ll/mu5;

    .line 23
    .line 24
    iget-object p0, p0, Ll/nu5;->a:Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    invoke-virtual {p1, p0}, Ll/mu5;->i(Lcom/p1/mobile/android/app/Act;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final g0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nu5;->b:Ll/nu5$a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string v0, "confirmListener"

    .line 6
    .line 7
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    :cond_0
    invoke-interface {v0}, Ll/nu5$a;->a()V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 15
    .line 16
    check-cast p0, Ll/mu5;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/mu5;->k()V

    .line 19
    .line 20
    .line 21
    return-void
.end method
