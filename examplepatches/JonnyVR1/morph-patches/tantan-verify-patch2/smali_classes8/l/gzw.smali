.class public abstract Ll/gzw;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Ll/hzw;",
        ">",
        "Ll/ar2<",
        "TV;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e0(Ll/gzw;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/gzw;->i0(Landroid/os/Bundle;)V

    return-void
.end method

.method private synthetic i0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/gzw;->h0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public Z()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ar2;->Z()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/gzw;->f0()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;->a2()Ll/y1x;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/y1x;->q0()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0}, Ll/gzw;->f0()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;->a2()Ll/y1x;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v1}, Ll/y1x;->t0()Lcom/p1/mobile/putong/data/User;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {p0, v0, v1}, Ll/gzw;->g0(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Lcom/p1/mobile/putong/data/User;)V

    .line 29
    .line 30
    .line 31
    new-instance v0, Ll/fzw;

    .line 32
    .line 33
    invoke-direct {v0, p0}, Ll/fzw;-><init>(Ll/gzw;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public f0()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/hzw;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/hzw;->a()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public abstract g0(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Lcom/p1/mobile/putong/data/User;)V
.end method

.method public h0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/hzw;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/gzw;->f0()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;->a2()Ll/y1x;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Ll/y1x;->q0()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {p0}, Ll/gzw;->f0()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;->a2()Ll/y1x;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Ll/y1x;->t0()Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, v1, p0}, Ll/hzw;->i(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Lcom/p1/mobile/putong/data/User;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method
