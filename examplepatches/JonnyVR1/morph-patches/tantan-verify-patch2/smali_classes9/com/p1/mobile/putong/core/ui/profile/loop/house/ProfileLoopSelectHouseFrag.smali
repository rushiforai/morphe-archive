.class public Lcom/p1/mobile/putong/core/ui/profile/loop/house/ProfileLoopSelectHouseFrag;
.super Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;
.source "SourceFile"


# instance fields
.field public I:Ll/ssa0;

.field public J:Ll/vsa0;


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
.method public P4(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/house/ProfileLoopSelectHouseFrag;->J:Ll/vsa0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/vsa0;->q(Lcom/p1/mobile/putong/data/User;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public Y4(Ljava/util/List;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;I)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/house/ProfileLoopSelectHouseFrag;->J:Ll/vsa0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/vsa0;->A(Ljava/util/List;I)V

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
    new-instance v0, Ll/ssa0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/ssa0;-><init>(Ll/ner;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/house/ProfileLoopSelectHouseFrag;->I:Ll/ssa0;

    .line 10
    .line 11
    new-instance v0, Ll/vsa0;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-direct {v0, v1, p0}, Ll/vsa0;-><init>(Landroid/content/Context;Lcom/p1/mobile/putong/core/ui/profile/loop/house/ProfileLoopSelectHouseFrag;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/house/ProfileLoopSelectHouseFrag;->J:Ll/vsa0;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/house/ProfileLoopSelectHouseFrag;->I:Ll/ssa0;

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Ll/ar2;->C(Ll/iam;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/house/ProfileLoopSelectHouseFrag;->I:Ll/ssa0;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/ar2;->Z()V

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/house/ProfileLoopSelectHouseFrag;->I:Ll/ssa0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/ssa0;->a0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/house/ProfileLoopSelectHouseFrag;->J:Ll/vsa0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/vsa0;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
