.class public final Ll/t0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/x0;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0006\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u000f\u0010\u0008\u001a\u00020\u0007H\u0016\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u000f\u0010\n\u001a\u00020\u0007H\u0016\u00a2\u0006\u0004\u0008\n\u0010\tJ\u001d\u0010\u000e\u001a\u00020\u00072\u0006\u0010\u000c\u001a\u00020\u000b2\u0006\u0010\r\u001a\u00020\u000b\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ\u000f\u0010\u0010\u001a\u00020\u0007H\u0002\u00a2\u0006\u0004\u0008\u0010\u0010\t\u00a8\u0006\u0011"
    }
    d2 = {
        "Ll/t0;",
        "Ll/ar2;",
        "Ll/x0;",
        "Ll/ner;",
        "lifecycleProvider",
        "<init>",
        "(Ll/ner;)V",
        "",
        "a0",
        "()V",
        "destroy",
        "",
        "langKey",
        "langName",
        "h0",
        "(Ljava/lang/String;Ljava/lang/String;)V",
        "g0",
        "b_core_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0
    .param p1    # Ll/ner;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static e0(Ll/t0;Ljava/lang/String;Ljava/util/List;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/x0;

    .line 4
    .line 5
    invoke-virtual {p0, p2, p1}, Ll/x0;->k(Ljava/util/List;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static f0(Ll/t0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/t0;->g0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 1

    .line 1
    new-instance v0, Ll/r0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/r0;-><init>(Ll/t0;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final g0()V
    .locals 3

    .line 1
    invoke-static {}, Ll/i0;->e()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast v1, Ll/x0;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-virtual {v1, v2, v0}, Ll/x0;->k(Ljava/util/List;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->t0:Lcom/p1/mobile/putong/core/api/CoreAITranslate;

    .line 16
    .line 17
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/CoreAITranslate;->k3()Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    new-instance v2, Ll/s0;

    .line 22
    .line 23
    invoke-direct {v2, p0, v0}, Ll/s0;-><init>(Ll/t0;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final h0(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
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
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast p0, Ll/x0;

    .line 10
    .line 11
    invoke-virtual {p0, p2}, Ll/x0;->m(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
