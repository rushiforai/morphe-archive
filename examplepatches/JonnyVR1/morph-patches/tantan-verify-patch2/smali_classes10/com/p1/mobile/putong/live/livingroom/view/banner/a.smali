.class public Lcom/p1/mobile/putong/live/livingroom/view/banner/a;
.super Ll/v5w;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/view/banner/a$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/v5w<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveBannerTab;",
        "Lcom/p1/mobile/putong/live/livingroom/view/banner/LiveBannerItemView;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/view/banner/a$a;


# direct methods
.method public constructor <init>(Ljava/util/List;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveBannerTab;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ll/v5w;-><init>(Ljava/util/List;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic r(Lcom/p1/mobile/putong/live/livingroom/view/banner/a;Lcom/p1/mobile/putong/live/base/data/BLiveBannerTab;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/view/banner/a;->u(Lcom/p1/mobile/putong/live/base/data/BLiveBannerTab;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic j(Landroid/view/View;II)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/view/banner/LiveBannerItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/view/banner/a;->s(Lcom/p1/mobile/putong/live/livingroom/view/banner/LiveBannerItemView;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic p(ILandroid/view/ViewGroup;II)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/live/livingroom/view/banner/a;->t(ILandroid/view/ViewGroup;II)Lcom/p1/mobile/putong/live/livingroom/view/banner/LiveBannerItemView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public s(Lcom/p1/mobile/putong/live/livingroom/view/banner/LiveBannerItemView;II)V
    .locals 2

    .line 1
    iget-object p3, p0, Ll/v5w;->itemList:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p3, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveBannerTab;

    .line 8
    .line 9
    if-eqz p2, :cond_1

    .line 10
    .line 11
    iget-object p3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveBannerTab;->media:Lcom/p1/mobile/putong/data/Media;

    .line 12
    .line 13
    if-nez p3, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/view/banner/LiveBannerItemView;->a:Lv/VDraweeView;

    .line 17
    .line 18
    iget-object p3, p3, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 19
    .line 20
    const-string v1, "context_common"

    .line 21
    .line 22
    invoke-static {v1, v0, p3}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    new-instance p3, Ll/vwr;

    .line 26
    .line 27
    invoke-direct {p3, p0, p2}, Ll/vwr;-><init>(Lcom/p1/mobile/putong/live/livingroom/view/banner/a;Lcom/p1/mobile/putong/live/base/data/BLiveBannerTab;)V

    .line 28
    .line 29
    .line 30
    invoke-static {p1, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    :goto_0
    return-void
.end method

.method public t(ILandroid/view/ViewGroup;II)Lcom/p1/mobile/putong/live/livingroom/view/banner/LiveBannerItemView;
    .locals 0

    .line 1
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget p1, Ll/yec0;->m:I

    .line 10
    .line 11
    const/4 p3, 0x0

    .line 12
    invoke-virtual {p0, p1, p2, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/view/banner/LiveBannerItemView;

    .line 17
    .line 18
    sget p1, Ll/qa00;->j:I

    .line 19
    .line 20
    invoke-static {p0, p1}, Ll/ynp0;->m(Landroid/view/View;I)V

    .line 21
    .line 22
    .line 23
    return-object p0
.end method

.method public final synthetic u(Lcom/p1/mobile/putong/live/base/data/BLiveBannerTab;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/banner/a;->a:Lcom/p1/mobile/putong/live/livingroom/view/banner/a$a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/banner/a$a;->a(Lcom/p1/mobile/putong/live/base/data/BLiveBannerTab;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public v(Lcom/p1/mobile/putong/live/livingroom/view/banner/a$a;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/live/livingroom/view/banner/a$a;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/banner/a;->a:Lcom/p1/mobile/putong/live/livingroom/view/banner/a$a;

    .line 2
    .line 3
    return-void
.end method
