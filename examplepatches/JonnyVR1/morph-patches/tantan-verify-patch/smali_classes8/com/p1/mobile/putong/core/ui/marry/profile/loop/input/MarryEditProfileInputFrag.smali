.class public Lcom/p1/mobile/putong/core/ui/marry/profile/loop/input/MarryEditProfileInputFrag;
.super Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag<",
        "Ll/i0x;",
        "Ll/l0x;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic N4()Ll/gzw;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/input/MarryEditProfileInputFrag;->S4()Ll/i0x;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic O4()Ll/hzw;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/input/MarryEditProfileInputFrag;->T4()Ll/l0x;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public S4()Ll/i0x;
    .locals 1

    .line 1
    new-instance v0, Ll/i0x;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/i0x;-><init>(Ll/ner;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public T4()Ll/l0x;
    .locals 2

    .line 1
    new-instance v0, Ll/l0x;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;->M4()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1, p0}, Ll/l0x;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public onPause()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Frag;->onPause()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;->z:Ll/gzw;

    .line 5
    .line 6
    check-cast v0, Ll/i0x;

    .line 7
    .line 8
    iget-object v0, v0, Ll/i0x;->a:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;->A:Ll/hzw;

    .line 11
    .line 12
    check-cast p0, Ll/l0x;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/l0x;->q()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {v0, p0}, Ll/bzw;->f(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 1
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;->z:Ll/gzw;

    .line 5
    .line 6
    check-cast p0, Ll/i0x;

    .line 7
    .line 8
    iget-object p0, p0, Ll/i0x;->a:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 9
    .line 10
    const-string v0, "marry_series_type"

    .line 11
    .line 12
    invoke-virtual {p1, v0, p0}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
