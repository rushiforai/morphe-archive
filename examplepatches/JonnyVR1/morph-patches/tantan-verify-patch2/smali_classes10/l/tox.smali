.class public Ll/tox;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;",
        ">;"
    }
.end annotation


# instance fields
.field public final c:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;",
            ">;"
        }
    .end annotation
.end field

.field public final e:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final f:Lcom/p1/mobile/android/app/Act;

.field public final g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/jpx;Ll/y20;Ll/y20;Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/jpx;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/String;",
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
    iput-object v0, p0, Ll/tox;->g:Ljava/util/List;

    .line 10
    .line 11
    invoke-virtual {p1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Ll/tox;->f:Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    iput-object p2, p0, Ll/tox;->c:Ll/y20;

    .line 18
    .line 19
    iput-object p3, p0, Ll/tox;->d:Ll/y20;

    .line 20
    .line 21
    iput-object p4, p0, Ll/tox;->e:Ll/y20;

    .line 22
    .line 23
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/tox;->E(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tox;->g:Ljava/util/List;

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
    iget-object p0, p0, Ll/tox;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget p2, Ll/yec0;->B9:I

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

.method public E(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;II)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;

    .line 2
    .line 3
    iget-object p3, p0, Ll/tox;->c:Ll/y20;

    .line 4
    .line 5
    iget-object p4, p0, Ll/tox;->d:Ll/y20;

    .line 6
    .line 7
    iget-object p0, p0, Ll/tox;->e:Ll/y20;

    .line 8
    .line 9
    invoke-virtual {p1, p2, p3, p4, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/medallabel/MedalLabelItemView;->r0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;Ll/y20;Ll/y20;Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public F(I)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tox;->g:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;

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
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/tox;->g:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/tox;->g:Ljava/util/List;

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
    invoke-virtual {p0, p1}, Ll/tox;->F(I)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemViewType(I)I
    .locals 0

    .line 1
    return p1
.end method
