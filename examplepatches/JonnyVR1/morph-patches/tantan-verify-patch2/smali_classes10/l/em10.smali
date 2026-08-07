.class public Ll/em10;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkBoardUser;",
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

.field public final d:Lcom/p1/mobile/android/app/Act;

.field public e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkBoardUser;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ll/cm0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
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
    iput-object v0, p0, Ll/em10;->e:Ljava/util/List;

    .line 10
    .line 11
    iput-object p1, p0, Ll/em10;->d:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    iput-object p2, p0, Ll/em10;->c:Ll/y20;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkBoardUser;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/em10;->E(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkBoardUser;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/em10;->e:Ljava/util/List;

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
    const/4 v0, 0x1

    .line 2
    if-ne p2, v0, :cond_0

    .line 3
    .line 4
    sget p2, Ll/yec0;->c4:I

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    sget p2, Ll/yec0;->d4:I

    .line 8
    .line 9
    :goto_0
    iget-object p0, p0, Ll/em10;->d:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public E(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkBoardUser;II)V
    .locals 0

    .line 1
    const/4 p4, 0x1

    .line 2
    if-ne p3, p4, :cond_0

    .line 3
    .line 4
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/view/MultiCallPkBoardFootView;

    .line 5
    .line 6
    iget-object p0, p0, Ll/em10;->e:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/view/MultiCallPkBoardFootView;->b(I)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/view/MultiCallPkBoardItemView;

    .line 17
    .line 18
    iget-object p3, p0, Ll/em10;->c:Ll/y20;

    .line 19
    .line 20
    iget-object p0, p0, Ll/em10;->f:Ll/cm0;

    .line 21
    .line 22
    invoke-virtual {p1, p3, p2, p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/view/MultiCallPkBoardItemView;->l0(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkBoardUser;Ll/cm0;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public F()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/em10;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final G()Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkBoardUser;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkBoardUser;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkBoardUser;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "-1"

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkBoardUser;->userId:Ljava/lang/String;

    .line 8
    .line 9
    return-object p0
.end method

.method public H(I)Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkBoardUser;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/em10;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkBoardUser;

    .line 8
    .line 9
    return-object p0
.end method

.method public I(Ljava/util/List;Ll/cm0;Z)V
    .locals 0
    .param p1    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkBoardUser;",
            ">;",
            "Ll/cm0;",
            "Z)V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Ll/em10;->f:Ll/cm0;

    .line 2
    .line 3
    iget-object p2, p0, Ll/em10;->e:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p2}, Ljava/util/List;->clear()V

    .line 6
    .line 7
    .line 8
    iget-object p2, p0, Ll/em10;->e:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {p2, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Ll/em10;->e:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    const/4 p2, 0x1

    .line 20
    if-lt p1, p2, :cond_0

    .line 21
    .line 22
    if-eqz p3, :cond_0

    .line 23
    .line 24
    iget-object p1, p0, Ll/em10;->e:Ljava/util/List;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/em10;->G()Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkBoardUser;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    :cond_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/em10;->H(I)Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkBoardUser;

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
    iget-object p0, p0, Ll/em10;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkBoardUser;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkBoardUser;->userId:Ljava/lang/String;

    .line 10
    .line 11
    const-string p1, "-1"

    .line 12
    .line 13
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method
