.class public abstract Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;
.super Lcom/p1/mobile/putong/app/PutongFrag;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<PP:",
        "Ll/gzw;",
        "VV:",
        "Ll/hzw;",
        ">",
        "Lcom/p1/mobile/putong/app/PutongFrag;"
    }
.end annotation


# instance fields
.field public A:Ll/hzw;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TVV;"
        }
    .end annotation
.end field

.field public B:Z

.field public z:Ll/gzw;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TPP;"
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
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;->B:Z

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public M4()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 6
    .line 7
    return-object p0
.end method

.method public abstract N4()Ll/gzw;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TPP;"
        }
    .end annotation
.end method

.method public abstract O4()Ll/hzw;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TVV;"
        }
    .end annotation
.end method

.method public P4()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;->B:Z

    .line 2
    .line 3
    return p0
.end method

.method public Q4(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public R4()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;->B:Z

    .line 3
    .line 4
    return-void
.end method

.method public S3(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;->M4()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final d4()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->d4()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;->N4()Ll/gzw;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;->z:Ll/gzw;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;->O4()Ll/hzw;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;->A:Ll/hzw;

    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;->z:Ll/gzw;

    .line 17
    .line 18
    invoke-virtual {v1, v0}, Ll/ar2;->C(Ll/iam;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;->z:Ll/gzw;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/gzw;->Z()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public disableAutoPV()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public final f4()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;->z:Ll/gzw;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/ar2;->a0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;->A:Ll/hzw;

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

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;->M4()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;->d2()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    const-string v0, "edit_specific_profile_show_from"

    .line 13
    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->J4()Ll/l4g0;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const-string p1, "selected_users_complete_profile"

    .line 21
    .line 22
    invoke-static {v0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    filled-new-array {p1}, [Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p0, p1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;->M4()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;->c2()Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-eqz p1, :cond_1

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->J4()Ll/l4g0;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    const-string p1, "like_ideal_reach_limit"

    .line 49
    .line 50
    invoke-static {v0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    filled-new-array {p1}, [Ll/pf60;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {p0, p1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->J4()Ll/l4g0;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    const-string p1, "marriage"

    .line 67
    .line 68
    invoke-static {v0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    filled-new-array {p1}, [Ll/pf60;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-virtual {p0, p1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public onDestroyView()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Frag;->onDestroyView()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;->M4()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;->M4()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;->M4()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;->a2()Ll/y1x;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/y1x;->q0()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0

    .line 24
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->getPageId()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method
