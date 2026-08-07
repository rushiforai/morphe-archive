.class public abstract Ll/ar2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/k3m;
.implements Ll/ner;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V::",
        "Ll/iam;",
        ">",
        "Ljava/lang/Object;",
        "Ll/k3m<",
        "TV;>;",
        "Ll/ner;"
    }
.end annotation


# instance fields
.field protected lifecycleProviderImpl:Ll/ner;

.field protected viewModel:Ll/iam;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TV;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ar2;->lifecycleProviderImpl:Ll/ner;

    .line 5
    .line 6
    new-instance v0, Ll/wq2;

    .line 7
    .line 8
    invoke-direct {v0}, Ll/wq2;-><init>()V

    .line 9
    .line 10
    .line 11
    new-instance v1, Ll/xq2;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/xq2;-><init>(Ll/ar2;)V

    .line 14
    .line 15
    .line 16
    invoke-interface {p1, v0, v1}, Ll/ner;->creates(Ll/y20;Ll/x20;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static synthetic U(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic V(Ll/ar2;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->b0()V

    return-void
.end method

.method public static synthetic W(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic X(Ll/ar2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ar2;->c0()V

    return-void
.end method

.method private synthetic c0()V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/k3m;->destroy()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public C(Ll/iam;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    invoke-interface {p1, p0}, Ll/iam;->i1(Ll/k3m;)V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ll/yq2;

    .line 7
    .line 8
    invoke-direct {p1}, Ll/yq2;-><init>()V

    .line 9
    .line 10
    .line 11
    new-instance v0, Ll/zq2;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/zq2;-><init>(Ll/ar2;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p1, v0}, Ll/ar2;->creates(Ll/y20;Ll/x20;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public Y()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/iam;->C0()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public Z()V
    .locals 0

    .line 1
    return-void
.end method

.method public a0()V
    .locals 0

    .line 1
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic b0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/iam;->destroy()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public creates(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Landroid/os/Bundle;",
            ">;)V"
        }
    .end annotation

    .line 7
    iget-object p0, p0, Ll/ar2;->lifecycleProviderImpl:Ll/ner;

    invoke-interface {p0, p1}, Ll/ner;->creates(Ll/y20;)V

    return-void
.end method

.method public creates(Ll/y20;Ll/x20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Landroid/os/Bundle;",
            ">;",
            "Ll/x20;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ar2;->lifecycleProviderImpl:Ll/ner;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ll/ner;->creates(Ll/y20;Ll/x20;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public duringCreated(Ll/pcj;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/pcj<",
            "Lrx/c<",
            "TT;>;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 8
    iget-object p0, p0, Ll/ar2;->lifecycleProviderImpl:Ll/ner;

    invoke-interface {p0, p1}, Ll/ner;->duringCreated(Ll/pcj;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public duringCreated(Ll/pcj;Z)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/pcj<",
            "Lrx/c<",
            "TT;>;>;Z)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ar2;->lifecycleProviderImpl:Ll/ner;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ll/ner;->duringCreated(Ll/pcj;Z)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public duringCreated(Lrx/c;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 9
    iget-object p0, p0, Ll/ar2;->lifecycleProviderImpl:Ll/ner;

    invoke-interface {p0, p1}, Ll/ner;->duringCreated(Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public lifecycle()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/android/app/c;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ar2;->lifecycleProviderImpl:Ll/ner;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/ner;->lifecycle()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public lifecycle_()Lcom/p1/mobile/android/app/c;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->lifecycleProviderImpl:Ll/ner;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/ner;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
