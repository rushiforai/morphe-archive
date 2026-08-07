.class public Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/groupfriend/FeedGroupFriendFrag$a;
.super Ll/h80;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/groupfriend/FeedGroupFriendFrag;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/h80<",
        "Lcom/p1/mobile/putong/data/User;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic i:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/groupfriend/FeedGroupFriendFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/groupfriend/FeedGroupFriendFrag;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/groupfriend/FeedGroupFriendFrag$a;->i:Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/groupfriend/FeedGroupFriendFrag;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/h80;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public bridge synthetic j(Ljava/lang/Object;I)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/groupfriend/FeedGroupFriendFrag$a;->s(Lcom/p1/mobile/putong/data/User;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic l(Ljava/lang/Object;IJ)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/groupfriend/FeedGroupFriendFrag$a;->t(Lcom/p1/mobile/putong/data/User;IJ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public s(Lcom/p1/mobile/putong/data/User;I)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/h80;->j(Ljava/lang/Object;I)V

    .line 2
    .line 3
    .line 4
    const-string p0, "user_id"

    .line 5
    .line 6
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {p0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    filled-new-array {p0}, [Ll/pf60;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string p1, "e_circle_friends"

    .line 17
    .line 18
    const-string p2, "p_circle_detail"

    .line 19
    .line 20
    invoke-static {p1, p2, p0}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public t(Lcom/p1/mobile/putong/data/User;IJ)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Ll/h80;->l(Ljava/lang/Object;IJ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
