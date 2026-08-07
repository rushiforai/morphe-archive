.class public Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopVerificationFrag;
.super Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;
.source "SourceFile"


# instance fields
.field public I:Ll/cva0;

.field public J:Ll/bva0;

.field public K:Z


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
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopVerificationFrag;->K:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopVerificationFrag;->I:Ll/cva0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/cva0;->c()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    :cond_0
    invoke-super {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->H()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    instance-of v0, v0, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 21
    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->b2()Lcom/p1/mobile/putong/core/ui/profile/loop/a;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const/4 v0, 0x0

    .line 35
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->X0(Z)V

    .line 36
    .line 37
    .line 38
    :cond_1
    return-void
.end method

.method public P4(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    return-void
.end method

.method public d4()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->d4()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/bva0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/bva0;-><init>(Ll/ner;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopVerificationFrag;->J:Ll/bva0;

    .line 10
    .line 11
    new-instance v0, Ll/cva0;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-direct {v0, v1, p0}, Ll/cva0;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopVerificationFrag;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopVerificationFrag;->I:Ll/cva0;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopVerificationFrag;->J:Ll/bva0;

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Ll/ar2;->C(Ll/iam;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopVerificationFrag;->J:Ll/bva0;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/ar2;->Z()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public e5()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->e5()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public f4()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopVerificationFrag;->J:Ll/bva0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/bva0;->a0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public h1()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopVerificationFrag;->K:Z

    .line 3
    .line 4
    invoke-super {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->h1()V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopVerificationFrag;->K:Z

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    instance-of v1, v1, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 15
    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->b2()Lcom/p1/mobile/putong/core/ui/profile/loop/a;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->X0(Z)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopVerificationFrag;->I:Ll/cva0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/cva0;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
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
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopVerificationFrag;->J:Ll/bva0;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopVerificationFrag;->J:Ll/bva0;

    .line 22
    .line 23
    invoke-virtual {p0, p1, p2, p3}, Ll/bva0;->g0(IILandroid/content/Intent;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method
