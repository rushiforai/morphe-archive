.class public Ll/p2r;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;",
        ">;"
    }
.end annotation


# instance fields
.field public final c:Lcom/tantanapp/media/ttmediautils/download/Action2;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/media/ttmediautils/download/Action2<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Lcom/p1/mobile/android/app/Act;

.field public final e:Ll/t3r;

.field public final f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/t3r;Lcom/tantanapp/media/ttmediautils/download/Action2;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/t3r;",
            "Lcom/tantanapp/media/ttmediautils/download/Action2<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/p2r;->f:Ljava/util/List;

    .line 10
    .line 11
    iput-object p1, p0, Ll/p2r;->e:Ll/t3r;

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iput-object p1, p0, Ll/p2r;->d:Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    iput-object p2, p0, Ll/p2r;->c:Lcom/tantanapp/media/ttmediautils/download/Action2;

    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/p2r;->E(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p2r;->f:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/p2r;->d:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget p2, Ll/yec0;->n9:I

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public E(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;II)V
    .locals 0

    .line 1
    iput p4, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;->position:I

    .line 2
    .line 3
    iget-object p3, p0, Ll/p2r;->e:Ll/t3r;

    .line 4
    .line 5
    const/4 p4, 0x1

    .line 6
    invoke-virtual {p3, p4, p2}, Ll/t3r;->o4(ZLcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;)V

    .line 7
    .line 8
    .line 9
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongItem;

    .line 10
    .line 11
    iget-object p3, p0, Ll/p2r;->e:Ll/t3r;

    .line 12
    .line 13
    iget-object p0, p0, Ll/p2r;->c:Lcom/tantanapp/media/ttmediautils/download/Action2;

    .line 14
    .line 15
    invoke-virtual {p1, p3, p0, p2}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongItem;->m0(Ll/t3r;Lcom/tantanapp/media/ttmediautils/download/Action2;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public F(I)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p2r;->f:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;

    .line 8
    .line 9
    return-object p0
.end method

.method public G(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/p2r;->f:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/p2r;->f:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/p2r;->F(I)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
