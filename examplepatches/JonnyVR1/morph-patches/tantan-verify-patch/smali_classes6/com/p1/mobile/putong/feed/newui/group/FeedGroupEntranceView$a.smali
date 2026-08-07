.class public Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView$a;
.super Ll/h80;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/h80<",
        "Lcom/p1/mobile/putong/feed/data/Group;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic i:Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView$a;->i:Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/h80;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public f(Landroid/view/ViewGroup;Landroid/view/ViewGroup;)V
    .locals 1

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView$a;->i:Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;

    .line 2
    .line 3
    const-class v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

    .line 4
    .line 5
    invoke-virtual {p2, v0, p1}, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;->W(Ljava/lang/Class;Landroid/view/View;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

    .line 10
    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    new-instance p2, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView$a$a;

    .line 15
    .line 16
    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView$a$a;-><init>(Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView$a;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, p2}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public bridge synthetic j(Ljava/lang/Object;I)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/feed/data/Group;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView$a;->s(Lcom/p1/mobile/putong/feed/data/Group;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic l(Ljava/lang/Object;IJ)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/feed/data/Group;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView$a;->t(Lcom/p1/mobile/putong/feed/data/Group;IJ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public s(Lcom/p1/mobile/putong/feed/data/Group;I)V
    .locals 2

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView$a;->i:Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;

    .line 2
    .line 3
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;->T(Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    new-instance v0, Ll/pf60;

    .line 8
    .line 9
    const-string v1, "circle_id"

    .line 10
    .line 11
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    invoke-direct {v0, v1, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    new-instance p1, Ll/pf60;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView$a;->i:Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;

    .line 19
    .line 20
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;->S(Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const-string v1, "circle_source"

    .line 25
    .line 26
    invoke-direct {p1, v1, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    filled-new-array {v0, p1}, [Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const-string p1, "e_circle"

    .line 34
    .line 35
    invoke-static {p1, p2, p0}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public t(Lcom/p1/mobile/putong/feed/data/Group;IJ)V
    .locals 0

    .line 1
    return-void
.end method
