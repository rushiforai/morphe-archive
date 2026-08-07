.class public Ll/hm70;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Lcom/p1/mobile/putong/core/ui/vip/picks/view/PicksGuideCarouselItemView;Landroid/view/View;)V
    .locals 1

    .line 1
    check-cast p1, Landroid/view/ViewGroup;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Lv/VDraweeView;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/picks/view/PicksGuideCarouselItemView;->a:Lv/VDraweeView;

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Lv/VImage;

    .line 18
    .line 19
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/picks/view/PicksGuideCarouselItemView;->b:Lv/VImage;

    .line 20
    .line 21
    return-void
.end method
