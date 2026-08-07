.class public abstract Lcom/p1/mobile/putong/core/ui/marry/profile/edit/base/MarryEditProfileBaseFrag;
.super Lcom/p1/mobile/putong/app/PutongFrag;
.source "SourceFile"

# interfaces
.implements Ll/myl;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<P:",
        "Ll/czw<",
        "TV;>;V:",
        "Ll/dzw<",
        "TP;>;>",
        "Lcom/p1/mobile/putong/app/PutongFrag;",
        "Ll/myl;"
    }
.end annotation


# instance fields
.field public A:Ll/dzw;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TV;"
        }
    .end annotation
.end field

.field public B:Lcom/p1/mobile/putong/data/User;

.field public z:Ll/czw;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TP;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/base/MarryEditProfileBaseFrag;->B:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public I0(Lcom/p1/mobile/putong/data/User;Z)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/base/MarryEditProfileBaseFrag;->A:Ll/dzw;

    .line 2
    .line 3
    instance-of v1, v0, Ll/myl;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    check-cast v0, Ll/myl;

    .line 8
    .line 9
    invoke-interface {v0, p1, p2}, Ll/myl;->I0(Lcom/p1/mobile/putong/data/User;Z)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    invoke-super {p0, p1, p2}, Ll/myl;->I0(Lcom/p1/mobile/putong/data/User;Z)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public abstract M4()Ll/czw;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TP;"
        }
    .end annotation
.end method

.method public abstract N4()Ll/dzw;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TV;"
        }
    .end annotation
.end method

.method public final O4(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/base/MarryEditProfileBaseFrag;->A:Ll/dzw;

    .line 2
    .line 3
    instance-of v0, p0, Ll/myl;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Ll/myl;

    .line 8
    .line 9
    invoke-interface {p0, p1}, Ll/myl;->d(Lcom/p1/mobile/putong/data/User;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public d(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/base/MarryEditProfileBaseFrag;->A:Ll/dzw;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, v0, Ll/dzw;->a:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/base/MarryEditProfileBaseFrag;->O4(Lcom/p1/mobile/putong/data/User;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_1
    :goto_0
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/base/MarryEditProfileBaseFrag;->B:Lcom/p1/mobile/putong/data/User;

    .line 15
    .line 16
    return-void
.end method

.method public d4()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->d4()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/base/MarryEditProfileBaseFrag;->M4()Ll/czw;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/base/MarryEditProfileBaseFrag;->z:Ll/czw;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/base/MarryEditProfileBaseFrag;->N4()Ll/dzw;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/base/MarryEditProfileBaseFrag;->A:Ll/dzw;

    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/base/MarryEditProfileBaseFrag;->z:Ll/czw;

    .line 17
    .line 18
    invoke-virtual {v1, v0}, Ll/ar2;->C(Ll/iam;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/base/MarryEditProfileBaseFrag;->z:Ll/czw;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/ar2;->Z()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final g4(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/base/MarryEditProfileBaseFrag;->B:Lcom/p1/mobile/putong/data/User;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/base/MarryEditProfileBaseFrag;->B:Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/base/MarryEditProfileBaseFrag;->O4(Lcom/p1/mobile/putong/data/User;)V

    .line 15
    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/base/MarryEditProfileBaseFrag;->B:Lcom/p1/mobile/putong/data/User;

    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/base/MarryEditProfileBaseFrag;->A:Ll/dzw;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ll/iam;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public r0(Z)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/base/MarryEditProfileBaseFrag;->A:Ll/dzw;

    .line 2
    .line 3
    instance-of v1, v0, Ll/myl;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    check-cast v0, Ll/myl;

    .line 8
    .line 9
    invoke-interface {v0, p1}, Ll/myl;->r0(Z)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    invoke-super {p0, p1}, Ll/myl;->r0(Z)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method
