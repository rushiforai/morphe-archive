.class public Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/relatedtopic/FeedGroupTopicFrag;
.super Lcom/p1/mobile/putong/app/PutongFrag;
.source "SourceFile"


# instance fields
.field public A:Ll/h8h;

.field public B:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;"
        }
    .end annotation
.end field

.field public z:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public M4(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/i8h;->b(Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/relatedtopic/FeedGroupTopicFrag;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public N4(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/relatedtopic/FeedGroupTopicFrag;->B:Ljava/util/List;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/relatedtopic/FeedGroupTopicFrag;->A:Ll/h8h;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/h8h;->J(Ljava/util/List;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/relatedtopic/FeedGroupTopicFrag;->M4(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance p2, Ll/h8h;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/relatedtopic/FeedGroupTopicFrag$a;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/relatedtopic/FeedGroupTopicFrag$a;-><init>(Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/relatedtopic/FeedGroupTopicFrag;)V

    .line 14
    .line 15
    .line 16
    invoke-direct {p2, v0, v1}, Ll/h8h;-><init>(Lcom/p1/mobile/android/app/Act;Ll/h80;)V

    .line 17
    .line 18
    .line 19
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/relatedtopic/FeedGroupTopicFrag;->A:Ll/h8h;

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/relatedtopic/FeedGroupTopicFrag;->z:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 22
    .line 23
    invoke-virtual {v0, p2}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 24
    .line 25
    .line 26
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/relatedtopic/FeedGroupTopicFrag;->z:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 27
    .line 28
    const/high16 v0, 0x431c0000    # 156.0f

    .line 29
    .line 30
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    invoke-static {p2, v0}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 35
    .line 36
    .line 37
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/relatedtopic/FeedGroupTopicFrag;->z:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 38
    .line 39
    const/4 v0, 0x0

    .line 40
    invoke-virtual {p2, v0}, Landroidx/recyclerview/widget/RecyclerView;->setClipToPadding(Z)V

    .line 41
    .line 42
    .line 43
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/relatedtopic/FeedGroupTopicFrag;->z:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 44
    .line 45
    invoke-static {}, Ll/bnl0;->w0()I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    invoke-static {p2, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 50
    .line 51
    .line 52
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/relatedtopic/FeedGroupTopicFrag;->B:Ljava/util/List;

    .line 53
    .line 54
    if-eqz p2, :cond_0

    .line 55
    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/relatedtopic/FeedGroupTopicFrag;->A:Ll/h8h;

    .line 57
    .line 58
    invoke-virtual {p0, p2}, Ll/h8h;->J(Ljava/util/List;)V

    .line 59
    .line 60
    .line 61
    :cond_0
    return-object p1
.end method
