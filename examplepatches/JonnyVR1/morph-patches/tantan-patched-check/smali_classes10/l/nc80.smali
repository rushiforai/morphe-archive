.class public Ll/nc80;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/dw40;",
        "Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesContainerView;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Ll/s680;

.field public j:Z


# direct methods
.method public constructor <init>(Ll/dum;Ll/s680;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesContainerView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/dw40;",
            ">;",
            "Ll/s680;",
            "Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesContainerView;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/nc80;->j:Z

    .line 6
    .line 7
    iput-object p2, p0, Ll/nc80;->i:Ll/s680;

    .line 8
    .line 9
    invoke-virtual {p0, p3}, Ll/l6t;->C(Ll/iam;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public J3(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/nc80;->j:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Ll/nc80;->j:Z

    .line 7
    .line 8
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->showWinTimesTag:Z

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->getAnchorWinTimes()J

    .line 13
    .line 14
    .line 15
    move-result-wide v0

    .line 16
    const-wide/16 v2, 0x2

    .line 17
    .line 18
    cmp-long v0, v0, v2

    .line 19
    .line 20
    if-ltz v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Ll/nc80;->i:Ll/s680;

    .line 23
    .line 24
    iget-object v0, v0, Ll/s680;->l:Ll/gv70;

    .line 25
    .line 26
    invoke-virtual {v0}, Ll/gv70;->X3()V

    .line 27
    .line 28
    .line 29
    :cond_0
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 30
    .line 31
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesContainerView;

    .line 32
    .line 33
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->getAnchorWinTimes()J

    .line 34
    .line 35
    .line 36
    move-result-wide v0

    .line 37
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->getOtherWinTimes()J

    .line 38
    .line 39
    .line 40
    move-result-wide v2

    .line 41
    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesContainerView;->c(JJ)V

    .line 42
    .line 43
    .line 44
    :cond_1
    return-void
.end method

.method public K3()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/nc80;->j:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesContainerView;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesContainerView;->e()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public reset()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/nc80;->j:Z

    .line 3
    .line 4
    return-void
.end method

.method public t()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
