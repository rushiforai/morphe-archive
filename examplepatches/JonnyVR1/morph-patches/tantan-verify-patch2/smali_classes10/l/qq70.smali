.class public final synthetic Ll/qq70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Landroid/widget/TextView;

.field public final synthetic b:Ll/z20;

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;

.field public final synthetic d:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/TextView;Ll/z20;Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qq70;->a:Landroid/widget/TextView;

    iput-object p2, p0, Ll/qq70;->b:Ll/z20;

    iput-object p3, p0, Ll/qq70;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;

    iput-object p4, p0, Ll/qq70;->d:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/qq70;->a:Landroid/widget/TextView;

    iget-object v1, p0, Ll/qq70;->b:Ll/z20;

    iget-object v2, p0, Ll/qq70;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;

    iget-object p0, p0, Ll/qq70;->d:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkAnchorItemView;->a(Landroid/widget/TextView;Ll/z20;Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;Landroid/view/View;)V

    return-void
.end method
