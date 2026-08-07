.class public Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;
.super Lcom/p1/mobile/putong/app/PutongFrag;
.source "SourceFile"

# interfaces
.implements Ll/pcj;
.implements Ll/gwl;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/app/PutongFrag;",
        "Ll/pcj<",
        "Ljava/lang/String;",
        ">;",
        "Ll/gwl;"
    }
.end annotation


# instance fields
.field public A:Ll/fir;

.field public B:Ll/ohr;

.field public z:Ll/cir;


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
.method public G2(Z)Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_navigation,ilike_module"

    .line 2
    .line 3
    return-object p0
.end method

.method public M4()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "\u6211\u559c\u6b22"

    .line 2
    .line 3
    return-object p0
.end method

.method public N4()V
    .locals 1

    .line 1
    new-instance v0, Ll/cir;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/cir;-><init>(Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;->z:Ll/cir;

    .line 7
    .line 8
    new-instance v0, Ll/fir;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Ll/fir;-><init>(Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;->A:Ll/fir;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;->z:Ll/cir;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ll/ar2;->C(Ll/iam;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public O4()Ll/ohr;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;->B:Ll/ohr;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/ohr;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;->Q4()Ll/cir;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-direct {v0, v1}, Ll/ohr;-><init>(Ll/cir;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;->B:Ll/ohr;

    .line 15
    .line 16
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;->B:Ll/ohr;

    .line 17
    .line 18
    return-object p0
.end method

.method public final P4()Ll/fir;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;->A:Ll/fir;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;->N4()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;->A:Ll/fir;

    .line 9
    .line 10
    return-object p0
.end method

.method public Q4()Ll/cir;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;->z:Ll/cir;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;->N4()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;->z:Ll/cir;

    .line 9
    .line 10
    return-object p0
.end method

.method public Z0()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;->z:Ll/cir;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    iput-object v0, p0, Ll/cir;->b:Lcom/p1/mobile/putong/core/ui/likedusers/LikedUserItemView;

    .line 5
    .line 6
    iput-object v0, p0, Ll/cir;->c:Lcom/p1/mobile/putong/core/data/LikedUser;

    .line 7
    .line 8
    return-void
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;->M4()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d4()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->d4()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;->Q4()Ll/cir;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Ll/cir;->Z()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public f4()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;->Q4()Ll/cir;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Ll/cir;->a0()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;->P4()Ll/fir;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2}, Ll/fir;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public notifyDataSetChanged()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;->O4()Ll/ohr;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;->Q4()Ll/cir;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1, p2, p3}, Ll/cir;->H0(IILandroid/content/Intent;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/android/app/Frag;->onActivityResult(IILandroid/content/Intent;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Frag;->onDestroy()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;->Q4()Ll/cir;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/cir;->destroy()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;->P4()Ll/fir;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/fir;->destroy()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public w0(ZLjava/lang/String;Lcom/p1/mobile/putong/core/data/LikedUser;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_1

    .line 8
    .line 9
    :cond_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-nez p1, :cond_2

    .line 14
    .line 15
    :cond_1
    return-void

    .line 16
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/likedusers/mytab/LikedUsersMyTabFrag;->z:Ll/cir;

    .line 17
    .line 18
    invoke-virtual {p0, p3}, Ll/cir;->J0(Lcom/p1/mobile/putong/core/data/LikedUser;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
