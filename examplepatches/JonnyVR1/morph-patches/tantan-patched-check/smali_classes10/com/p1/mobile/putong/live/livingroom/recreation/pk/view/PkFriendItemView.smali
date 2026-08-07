.class public Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFriendItemView;
.super Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkAnchorItemView;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Landroid/widget/TextView;

.field public c:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkAnchorItemView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkAnchorItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkAnchorItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/qv70;->a(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFriendItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public e(Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;Ll/z20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;",
            "Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;",
            "Ll/z20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;",
            "Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFriendItemView;->a:Lv/VDraweeView;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFriendItemView;->b:Landroid/widget/TextView;

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkAnchorItemView;->b(Lv/VDraweeView;Landroid/widget/TextView;Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFriendItemView;->c:Landroid/widget/TextView;

    .line 9
    .line 10
    invoke-virtual {p0, v0, p1, p3, p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkAnchorItemView;->c(Landroid/widget/TextView;Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;Ll/z20;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFriendItemView;->d(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
