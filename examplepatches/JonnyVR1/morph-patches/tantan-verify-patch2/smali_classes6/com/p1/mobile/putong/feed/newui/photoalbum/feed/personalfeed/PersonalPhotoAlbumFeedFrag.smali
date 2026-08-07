.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personalfeed/PersonalPhotoAlbumFeedFrag;
.super Lcom/p1/mobile/putong/app/PutongFrag;
.source "SourceFile"

# interfaces
.implements Ll/n2m;


# instance fields
.field public A:Ll/vw60;

.field public z:Ll/wv60;


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

.method public static M4(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;IZ)Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personalfeed/PersonalPhotoAlbumFeedFrag;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personalfeed/PersonalPhotoAlbumFeedFrag;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personalfeed/PersonalPhotoAlbumFeedFrag;-><init>()V

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
    const-string v2, "user_id"

    .line 12
    .line 13
    invoke-virtual {v1, v2, p0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string p0, "from"

    .line 17
    .line 18
    invoke-virtual {v1, p0, p1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const-string p0, "selected_item_position"

    .line 22
    .line 23
    invoke-virtual {v1, p0, p2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 24
    .line 25
    .line 26
    const-string p0, "target_moment_id"

    .line 27
    .line 28
    invoke-virtual {v1, p0, p3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    const-string p0, "page_type"

    .line 32
    .line 33
    invoke-virtual {v1, p0, p4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 34
    .line 35
    .line 36
    const-string p0, "start_home_card"

    .line 37
    .line 38
    invoke-virtual {v1, p0, p5}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 42
    .line 43
    .line 44
    return-object v0
.end method


# virtual methods
.method public B3(Ll/pf60;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/lang/Boolean;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personalfeed/PersonalPhotoAlbumFeedFrag;->z:Ll/wv60;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/wv60;->t0(Ll/pf60;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public N0()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personalfeed/PersonalPhotoAlbumFeedFrag;->z:Ll/wv60;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/wv60;->X0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public N4()V
    .locals 1

    .line 1
    new-instance v0, Ll/vw60;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/vw60;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personalfeed/PersonalPhotoAlbumFeedFrag;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personalfeed/PersonalPhotoAlbumFeedFrag;->A:Ll/vw60;

    .line 7
    .line 8
    new-instance v0, Ll/wv60;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Ll/wv60;-><init>(Ll/ner;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personalfeed/PersonalPhotoAlbumFeedFrag;->z:Ll/wv60;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personalfeed/PersonalPhotoAlbumFeedFrag;->A:Ll/vw60;

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Ll/ar2;->C(Ll/iam;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public Q0()Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personalfeed/PersonalPhotoAlbumFeedFrag;->A:Ll/vw60;

    .line 2
    .line 3
    iget-object p0, p0, Ll/vw60;->D:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 4
    .line 5
    return-object p0
.end method

.method public f4()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personalfeed/PersonalPhotoAlbumFeedFrag;->N4()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personalfeed/PersonalPhotoAlbumFeedFrag;->z:Ll/wv60;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/wv60;->a0()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personalfeed/PersonalPhotoAlbumFeedFrag;->A:Ll/vw60;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/vw60;->X(Landroid/os/Bundle;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personalfeed/PersonalPhotoAlbumFeedFrag;->A:Ll/vw60;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/vw60;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public n4(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personalfeed/PersonalPhotoAlbumFeedFrag;->z:Ll/wv60;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wv60;->D0()V

    .line 4
    .line 5
    .line 6
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->n4(Landroid/os/Bundle;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public o()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onResume()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Frag;->onResume()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public y4()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personalfeed/PersonalPhotoAlbumFeedFrag;->A:Ll/vw60;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/vw60;->H()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
