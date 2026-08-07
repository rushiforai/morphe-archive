.class public Ll/lt70;
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

.method public static a(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;Landroid/view/View;)V
    .locals 2

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
    move-result-object v1

    .line 8
    check-cast v1, Landroid/view/ViewGroup;

    .line 9
    .line 10
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;->a:Lcom/immomo/svgaplayer/view/MomoLayUpSVGAImageView;

    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;

    .line 24
    .line 25
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;

    .line 26
    .line 27
    return-void
.end method
