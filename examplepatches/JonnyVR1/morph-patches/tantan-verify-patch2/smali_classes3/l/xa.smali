.class public Ll/xa;
.super Ll/lup0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/lup0<",
        "Ll/db;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/lup0;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k0(Ll/xa;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xa;->o0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic l0(Ll/xa;Lcom/p1/mobile/putong/data/AuthData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xa;->n0(Lcom/p1/mobile/putong/data/AuthData;)V

    return-void
.end method


# virtual methods
.method public m0()V
    .locals 3

    .line 1
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/bn5;->accessOutterToken()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/va;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/va;-><init>(Ll/xa;)V

    .line 14
    .line 15
    .line 16
    new-instance v2, Ll/wa;

    .line 17
    .line 18
    invoke-direct {v2, p0}, Ll/wa;-><init>(Ll/xa;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final synthetic n0(Lcom/p1/mobile/putong/data/AuthData;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/db;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/db;->c0(Lcom/p1/mobile/putong/data/AuthData;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic o0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/db;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/db;->b0(Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
