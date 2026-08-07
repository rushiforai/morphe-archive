.class public Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinCheckstandFrag;
.super Lcom/p1/mobile/putong/app/PutongFrag;
.source "SourceFile"


# instance fields
.field public A:Ljava/lang/String;

.field public B:Ll/z3i0;

.field public C:Ll/a4i0;

.field public z:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static M4(ZLjava/lang/String;)Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinCheckstandFrag;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinCheckstandFrag;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinCheckstandFrag;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Landroid/os/Bundle;

    .line 7
    .line 8
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v2, "change_top_bg"

    .line 12
    .line 13
    invoke-virtual {v1, v2, p0}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 14
    .line 15
    .line 16
    const-string p0, "url"

    .line 17
    .line 18
    invoke-virtual {v1, p0, p1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 22
    .line 23
    .line 24
    return-object v0
.end method


# virtual methods
.method public d4()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->d4()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const-string v1, "change_top_bg"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinCheckstandFrag;->z:Z

    .line 15
    .line 16
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "url"

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinCheckstandFrag;->A:Ljava/lang/String;

    .line 27
    .line 28
    new-instance v0, Ll/z3i0;

    .line 29
    .line 30
    invoke-direct {v0, p0, p0}, Ll/z3i0;-><init>(Ll/ner;Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinCheckstandFrag;)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinCheckstandFrag;->B:Ll/z3i0;

    .line 34
    .line 35
    new-instance v0, Ll/a4i0;

    .line 36
    .line 37
    invoke-direct {v0, p0}, Ll/a4i0;-><init>(Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinCheckstandFrag;)V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinCheckstandFrag;->C:Ll/a4i0;

    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinCheckstandFrag;->B:Ll/z3i0;

    .line 43
    .line 44
    invoke-virtual {v1, v0}, Ll/ar2;->C(Ll/iam;)V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinCheckstandFrag;->B:Ll/z3i0;

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/z3i0;->Z()V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public f4()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinCheckstandFrag;->B:Ll/z3i0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/z3i0;->a0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinCheckstandFrag;->B:Ll/z3i0;

    .line 5
    .line 6
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinCheckstandFrag;->z:Z

    .line 7
    .line 8
    invoke-virtual {p1, p0}, Ll/z3i0;->k0(Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinCheckstandFrag;->C:Ll/a4i0;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Ll/a4i0;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinCheckstandFrag;->A:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p2}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinCheckstandH5Frag;->d5(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinCheckstandH5Frag;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    sget v0, Ll/fdc0;->p1:I

    .line 22
    .line 23
    invoke-virtual {p0, v0, p2}, Landroidx/fragment/app/k;->s(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/k;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Landroidx/fragment/app/k;->j()I

    .line 28
    .line 29
    .line 30
    return-object p1
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
