.class public Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserFrag;
.super Lcom/p1/mobile/putong/app/PutongFrag;
.source "SourceFile"

# interfaces
.implements Ll/f320;


# instance fields
.field public A:Ll/etj0;

.field public B:Ll/lsj0;

.field public z:Ll/ctj0;


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

.method public static synthetic M4(Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserFrag;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserFrag;->R4(Ljava/lang/Boolean;)V

    return-void
.end method

.method private synthetic R4(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->J4()Ll/l4g0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->J4()Ll/l4g0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/l4g0;->k()V

    .line 20
    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public N4()V
    .locals 1

    .line 1
    new-instance v0, Ll/ctj0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ctj0;-><init>(Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserFrag;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserFrag;->z:Ll/ctj0;

    .line 7
    .line 8
    new-instance v0, Ll/etj0;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Ll/etj0;-><init>(Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserFrag;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserFrag;->A:Ll/etj0;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserFrag;->z:Ll/ctj0;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ll/ar2;->C(Ll/iam;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public O4()Ll/lsj0;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserFrag;->B:Ll/lsj0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/lsj0;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserFrag;->Q4()Ll/ctj0;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-direct {v0, v1}, Ll/lsj0;-><init>(Ll/ctj0;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserFrag;->B:Ll/lsj0;

    .line 15
    .line 16
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserFrag;->B:Ll/lsj0;

    .line 17
    .line 18
    return-object p0
.end method

.method public final P4()Ll/etj0;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserFrag;->A:Ll/etj0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserFrag;->N4()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserFrag;->A:Ll/etj0;

    .line 9
    .line 10
    return-object p0
.end method

.method public Q4()Ll/ctj0;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserFrag;->z:Ll/ctj0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserFrag;->N4()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserFrag;->z:Ll/ctj0;

    .line 9
    .line 10
    return-object p0
.end method

.method public d4()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->d4()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserFrag;->Q4()Ll/ctj0;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Ll/ctj0;->Z()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public f4()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserFrag;->Q4()Ll/ctj0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/ctj0;->a0()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->L4()Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/msj0;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/msj0;-><init>(Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserFrag;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 25
    .line 26
    .line 27
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

.method public i(IILandroid/content/Intent;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserFrag;->P4()Ll/etj0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2}, Ll/etj0;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->S5()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Frag;->onDestroy()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserFrag;->Q4()Ll/ctj0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/ctj0;->destroy()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserFrag;->P4()Ll/etj0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/etj0;->destroy()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public onResume()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Frag;->onResume()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserFrag;->z:Ll/ctj0;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p0, v0}, Ll/ctj0;->C0(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_who_i_disliked"

    .line 2
    .line 3
    return-object p0
.end method
