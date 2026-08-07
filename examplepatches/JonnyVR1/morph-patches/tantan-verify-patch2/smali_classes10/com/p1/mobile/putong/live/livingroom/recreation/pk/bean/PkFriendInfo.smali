.class public Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field public anchors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;",
            ">;"
        }
    .end annotation
.end field

.field private hasNextPage:Z

.field private liveHashMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/live/base/data/BLive;",
            ">;"
        }
    .end annotation
.end field

.field public lives:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLive;",
            ">;"
        }
    .end annotation
.end field

.field private userHashMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public users:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLive;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;->userHashMap:Ljava/util/HashMap;

    .line 10
    .line 11
    new-instance v0, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;->liveHashMap:Ljava/util/HashMap;

    .line 17
    .line 18
    if-nez p1, :cond_0

    .line 19
    .line 20
    new-instance p1, Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 23
    .line 24
    .line 25
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;->users:Ljava/util/List;

    .line 26
    .line 27
    if-nez p2, :cond_1

    .line 28
    .line 29
    new-instance p2, Ljava/util/ArrayList;

    .line 30
    .line 31
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 32
    .line 33
    .line 34
    :cond_1
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;->lives:Ljava/util/List;

    .line 35
    .line 36
    if-nez p3, :cond_2

    .line 37
    .line 38
    new-instance p3, Ljava/util/ArrayList;

    .line 39
    .line 40
    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    .line 41
    .line 42
    .line 43
    :cond_2
    iput-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;->anchors:Ljava/util/List;

    .line 44
    .line 45
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;->users:Ljava/util/List;

    .line 46
    .line 47
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;->changeUserMap(Ljava/util/List;)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;->lives:Ljava/util/List;

    .line 51
    .line 52
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;->changeLiveMap(Ljava/util/List;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method private changeLiveMap(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLive;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;->liveHashMap:Ljava/util/HashMap;

    .line 24
    .line 25
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 26
    .line 27
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    return-void
.end method

.method private changeUserMap(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;->userHashMap:Ljava/util/HashMap;

    .line 24
    .line 25
    iget-object v2, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    return-void
.end method


# virtual methods
.method public contact(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;->anchors:Ljava/util/List;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;->anchors:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;->lives:Ljava/util/List;

    .line 9
    .line 10
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;->lives:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;->users:Ljava/util/List;

    .line 16
    .line 17
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;->users:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;->users:Ljava/util/List;

    .line 23
    .line 24
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;->changeUserMap(Ljava/util/List;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;->lives:Ljava/util/List;

    .line 28
    .line 29
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;->changeLiveMap(Ljava/util/List;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;->isHasNextPage()Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;->setHasNextPage(Z)Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public isHasNextPage()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;->hasNextPage:Z

    .line 2
    .line 3
    return p0
.end method

.method public queryLiveById(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLive;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;->liveHashMap:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;->liveHashMap:Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return-object p0
.end method

.method public queryUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;->userHashMap:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;->userHashMap:Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return-object p0
.end method

.method public setHasNextPage(Z)Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;->hasNextPage:Z

    .line 2
    .line 3
    return-object p0
.end method
