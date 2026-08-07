.class public Lcom/p1/mobile/putong/core/ui/marry/profile/loop/mate/MarryEditProfileMateFrag;
.super Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag<",
        "Ll/y0x;",
        "Ll/a1x;",
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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/mate/MarryEditProfileMateFrag;->S4()Ll/y0x;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/mate/MarryEditProfileMateFrag;->T4()Ll/a1x;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public S4()Ll/y0x;
    .locals 1

    .line 1
    new-instance v0, Ll/y0x;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/y0x;-><init>(Ll/ner;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public T4()Ll/a1x;
    .locals 2

    .line 1
    new-instance v0, Ll/a1x;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;->M4()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1, p0}, Ll/a1x;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/android/app/Frag;->onActivityResult(IILandroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    if-ne p2, v0, :cond_0

    .line 6
    .line 7
    const/16 p2, 0x138a

    .line 8
    .line 9
    if-ne p1, p2, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;->z:Ll/gzw;

    .line 12
    .line 13
    check-cast p1, Ll/y0x;

    .line 14
    .line 15
    const-string p2, "loop_edit_user"

    .line 16
    .line 17
    invoke-virtual {p3, p2}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    check-cast p2, Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    iput-object p2, p1, Ll/y0x;->a:Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;->A:Ll/hzw;

    .line 26
    .line 27
    check-cast p1, Ll/a1x;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;->z:Ll/gzw;

    .line 30
    .line 31
    check-cast p0, Ll/y0x;

    .line 32
    .line 33
    iget-object p0, p0, Ll/y0x;->a:Lcom/p1/mobile/putong/data/User;

    .line 34
    .line 35
    const/4 p2, 0x0

    .line 36
    invoke-virtual {p1, p2, p0}, Ll/a1x;->q(ZLcom/p1/mobile/putong/data/User;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method

.method public onPause()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Frag;->onPause()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->MATE:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;->A:Ll/hzw;

    .line 7
    .line 8
    check-cast p0, Ll/a1x;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/a1x;->n()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {v0, p0}, Ll/bzw;->f(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
