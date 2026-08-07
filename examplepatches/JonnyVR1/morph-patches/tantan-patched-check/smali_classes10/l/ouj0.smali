.class public Ll/ouj0;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ll/puj0;",
        ">",
        "Ll/i6t<",
        "Ll/rwn0;",
        "TT;>;"
    }
.end annotation


# instance fields
.field public i:Ll/jvj0;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/rwn0;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public J3()Ll/jvj0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ouj0;->i:Ll/jvj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public K3()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/puj0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/puj0;->f()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public L3()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/puj0;

    .line 4
    .line 5
    invoke-interface {v0}, Ll/iam;->destroy()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast p0, Ll/puj0;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/puj0;->i()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public M3(Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;ILjava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;",
            "I",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/puj0;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Ll/puj0;->j(Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;ILjava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
