.class public Ll/xu2;
.super Ll/mic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/mic0<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;",
        ">;"
    }
.end annotation


# instance fields
.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;",
            ">;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p2}, Ll/mic0;-><init>(Ll/y20;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/xu2;->d:Ljava/util/List;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/xu2;->G(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xu2;->d:Ljava/util/List;

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
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget p1, Ll/yec0;->p:I

    .line 6
    .line 7
    const/4 p2, 0x0

    .line 8
    invoke-static {p0, p1, p2}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public G(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Ll/mic0;->A(Landroid/view/View;Ljava/lang/Object;II)V

    .line 2
    .line 3
    .line 4
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyItemView;

    .line 5
    .line 6
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyItemView;->b(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public H(I)Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xu2;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 8
    .line 9
    return-object p0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xu2;->H(I)Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
