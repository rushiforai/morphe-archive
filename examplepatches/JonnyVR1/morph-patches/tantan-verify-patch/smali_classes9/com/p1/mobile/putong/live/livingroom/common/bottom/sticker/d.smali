.class public Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/d;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/d$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;",
        ">;"
    }
.end annotation


# instance fields
.field public final c:Lcom/p1/mobile/android/app/Act;

.field public d:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/d$a;

.field public final e:Z

.field public f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Z)V
    .locals 1

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/d;->f:Ljava/util/List;

    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/d;->c:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    iput-boolean p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/d;->e:Z

    .line 14
    .line 15
    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/d;Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerMenuItem;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/d;->H(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerMenuItem;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/d;->F(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/d;->f:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 2

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/d;->c:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    sget v0, Ll/yec0;->W5:I

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerMenuItem;

    .line 15
    .line 16
    iget-boolean p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/d;->e:Z

    .line 17
    .line 18
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerMenuItem;->d(Z)V

    .line 19
    .line 20
    .line 21
    new-instance p2, Ll/x4g0;

    .line 22
    .line 23
    invoke-direct {p2, p0, p1}, Ll/x4g0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/d;Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerMenuItem;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 27
    .line 28
    .line 29
    return-object p1
.end method

.method public F(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;II)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerMenuItem;

    .line 2
    .line 3
    invoke-virtual {p1, p2, p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerMenuItem;->f(Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/d;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public G(I)Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/d;->f:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method

.method public final synthetic H(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerMenuItem;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/d;->d:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/d$a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/d$a;->a(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerMenuItem;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public I(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/d$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/d;->d:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/d$a;

    .line 2
    .line 3
    return-void
.end method

.method public J(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/d;->f:Ljava/util/List;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public duringCreated(Lrx/c;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "TV;>;)",
            "Lrx/c<",
            "TV;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/d;->c:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Ll/jic0;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/d;->G(I)Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
