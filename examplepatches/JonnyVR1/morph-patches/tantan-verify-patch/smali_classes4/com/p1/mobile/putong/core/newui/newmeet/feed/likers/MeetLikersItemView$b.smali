.class public Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/a$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->m()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView$b;->a:Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public n()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView$b;->a:Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->g(Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    return p0
.end method

.method public o(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView$b;->a:Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->f(Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;)Ll/udy;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public p(Lcom/p1/mobile/putong/data/User;ZZZ)V
    .locals 8
    .param p1    # Lcom/p1/mobile/putong/data/User;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->new_()Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "localLikersUser"

    .line 6
    .line 7
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/FeedType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/FeedType;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->type:Lcom/p1/mobile/putong/core/data/FeedType;

    .line 12
    .line 13
    new-instance v3, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;

    .line 14
    .line 15
    invoke-direct {v3, p1, v0}, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;-><init>(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView$b;->a:Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;

    .line 19
    .line 20
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->h(Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;)Ll/dzl;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    const/4 v7, 0x0

    .line 25
    move v4, p2

    .line 26
    move v5, p3

    .line 27
    move v6, p4

    .line 28
    invoke-interface/range {v2 .. v7}, Ll/dzl;->d(Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;ZZZLjava/lang/String;)Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-nez p1, :cond_0

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView$b;->a:Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;

    .line 35
    .line 36
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->f(Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;)Ll/udy;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method
