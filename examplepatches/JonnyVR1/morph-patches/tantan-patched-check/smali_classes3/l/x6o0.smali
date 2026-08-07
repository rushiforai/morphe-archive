.class public Ll/x6o0;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/rwn0;",
        "Ll/b7o0;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Ll/x20;


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
    new-instance p1, Ll/b7o0;

    .line 5
    .line 6
    invoke-direct {p1}, Ll/b7o0;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast p1, Ll/b7o0;

    .line 15
    .line 16
    invoke-virtual {p1, p0}, Ll/b7o0;->e(Ll/x6o0;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public J3(Ljava/lang/String;)V
    .locals 1

    .line 1
    const/16 v0, 0x1b69

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Ll/i6t;->p3(ILjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 7
    .line 8
    check-cast p1, Ll/b7o0;

    .line 9
    .line 10
    invoke-virtual {p1}, Ll/b7o0;->f()V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/x6o0;->i:Ll/x20;

    .line 14
    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    invoke-interface {p0}, Ll/x20;->call()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public K3(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/x6o0;->i:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public L3(Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/b7o0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/b7o0;->m(Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
