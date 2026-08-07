.class public Lcom/p1/mobile/putong/core/ui/profile/loop/profession/ProfileLoopSelectProfessionFrag;
.super Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;
.source "SourceFile"


# instance fields
.field public I:Ll/tta0;

.field public J:Ll/zta0;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public H()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/profession/ProfileLoopSelectProfessionFrag;->J:Ll/zta0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/zta0;->v()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/profession/ProfileLoopSelectProfessionFrag;->J:Ll/zta0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/zta0;->s()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-super {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->H()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public P4(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/profession/ProfileLoopSelectProfessionFrag;->J:Ll/zta0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/zta0;->w(Lcom/p1/mobile/putong/data/User;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d4()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->d4()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/tta0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/tta0;-><init>(Ll/ner;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/profession/ProfileLoopSelectProfessionFrag;->I:Ll/tta0;

    .line 10
    .line 11
    new-instance v0, Ll/zta0;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-direct {v0, v1, p0}, Ll/zta0;-><init>(Landroid/content/Context;Lcom/p1/mobile/putong/core/ui/profile/loop/profession/ProfileLoopSelectProfessionFrag;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/profession/ProfileLoopSelectProfessionFrag;->J:Ll/zta0;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/profession/ProfileLoopSelectProfessionFrag;->I:Ll/tta0;

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Ll/ar2;->C(Ll/iam;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/profession/ProfileLoopSelectProfessionFrag;->I:Ll/tta0;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/tta0;->Z()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public f4()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/profession/ProfileLoopSelectProfessionFrag;->I:Ll/tta0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/tta0;->a0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/profession/ProfileLoopSelectProfessionFrag;->J:Ll/zta0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/zta0;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    const-string v0, "not_to_disclose_mode"

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/profession/ProfileLoopSelectProfessionFrag;->J:Ll/zta0;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Ll/zta0;->H(Z)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method
