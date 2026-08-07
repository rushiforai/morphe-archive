.class public Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterFrag;
.super Lcom/p1/mobile/putong/app/PutongFrag;
.source "SourceFile"


# instance fields
.field public A:Lcom/p1/mobile/putong/core/ui/verification/a;

.field public z:Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterPresenter;


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


# virtual methods
.method public M4(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterFrag;->z:Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterPresenter;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterPresenter;->s0(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d4()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->d4()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterPresenter;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterPresenter;-><init>(Ll/ner;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterFrag;->z:Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterPresenter;

    .line 10
    .line 11
    new-instance v0, Lcom/p1/mobile/putong/core/ui/verification/a;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/verification/a;-><init>(Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterFrag;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterFrag;->A:Lcom/p1/mobile/putong/core/ui/verification/a;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterFrag;->z:Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterPresenter;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/ar2;->C(Ll/iam;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public disableAutoPV()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public f4()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterFrag;->z:Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterPresenter;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterPresenter;->a0()V

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterFrag;->A:Lcom/p1/mobile/putong/core/ui/verification/a;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/verification/a;->r()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterFrag;->A:Lcom/p1/mobile/putong/core/ui/verification/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/verification/a;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_verification_center_view"

    .line 2
    .line 3
    return-object p0
.end method
