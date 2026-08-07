.class public Ll/kfn0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedBanners;",
            ">;"
        }
    .end annotation
.end field

.field public c:Lcom/p1/mobile/putong/data/Pagination;

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomFeeds:Ljava/util/List;

    .line 7
    .line 8
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    new-instance v0, Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomFeeds:Ljava/util/List;

    .line 23
    .line 24
    :goto_0
    iput-object v0, p0, Ll/kfn0;->a:Ljava/util/List;

    .line 25
    .line 26
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveBanners:Ljava/util/List;

    .line 29
    .line 30
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    new-instance v0, Ljava/util/ArrayList;

    .line 37
    .line 38
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 39
    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 43
    .line 44
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveBanners:Ljava/util/List;

    .line 45
    .line 46
    :goto_1
    iput-object v0, p0, Ll/kfn0;->b:Ljava/util/List;

    .line 47
    .line 48
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 49
    .line 50
    iput-object v0, p0, Ll/kfn0;->c:Lcom/p1/mobile/putong/data/Pagination;

    .line 51
    .line 52
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 53
    .line 54
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->users:Ljava/util/List;

    .line 55
    .line 56
    iput-object p1, p0, Ll/kfn0;->d:Ljava/util/List;

    .line 57
    .line 58
    iget-object p1, p0, Ll/kfn0;->a:Ljava/util/List;

    .line 59
    .line 60
    new-instance v0, Ll/dfn0;

    .line 61
    .line 62
    invoke-direct {v0, p0}, Ll/dfn0;-><init>(Ll/kfn0;)V

    .line 63
    .line 64
    .line 65
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public constructor <init>(Ljava/util/List;Lcom/p1/mobile/putong/data/Pagination;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;",
            ">;",
            "Lcom/p1/mobile/putong/data/Pagination;",
            ")V"
        }
    .end annotation

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    iput-object p1, p0, Ll/kfn0;->a:Ljava/util/List;

    .line 71
    iput-object p2, p0, Ll/kfn0;->c:Lcom/p1/mobile/putong/data/Pagination;

    return-void
.end method

.method public static synthetic a(Ljava/util/List;Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->liveId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-interface {p0, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    iget-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->anchorId:Ljava/lang/String;

    .line 10
    .line 11
    invoke-interface {p1, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->anchorId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c(Ll/kfn0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kfn0;->l(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;)V

    return-void
.end method

.method public static synthetic d(Ll/kfn0;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/kfn0;->k(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->liveId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->anchorId:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->anchorId:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method


# virtual methods
.method public h(Ljava/lang/String;)Ll/kfn0;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/kfn0;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    iget-object v0, p0, Ll/kfn0;->a:Ljava/util/List;

    .line 11
    .line 12
    new-instance v1, Ll/ffn0;

    .line 13
    .line 14
    invoke-direct {v1, p0, p1}, Ll/ffn0;-><init>(Ll/kfn0;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-static {v0, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iget-object v0, p0, Ll/kfn0;->a:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/kfn0;->a:Ljava/util/List;

    .line 27
    .line 28
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 29
    .line 30
    .line 31
    return-object p0
.end method

.method public i()Lcom/p1/mobile/putong/data/Pagination;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kfn0;->c:Lcom/p1/mobile/putong/data/Pagination;

    .line 2
    .line 3
    return-object p0
.end method

.method public j()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kfn0;->c:Lcom/p1/mobile/putong/data/Pagination;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Pagination;->links:Lcom/p1/mobile/putong/data/Links;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public final synthetic k(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/kfn0;->d:Ljava/util/List;

    .line 2
    .line 3
    new-instance v0, Ll/gfn0;

    .line 4
    .line 5
    invoke-direct {v0, p2}, Ll/gfn0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/Gender;->equals(Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public final synthetic l(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/kfn0;->d:Ljava/util/List;

    .line 2
    .line 3
    new-instance v0, Ll/efn0;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/efn0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->user:Lcom/p1/mobile/putong/data/User;

    .line 15
    .line 16
    return-void
.end method

.method public m(Ll/kfn0;)V
    .locals 5

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Ll/kfn0;->a:Ljava/util/List;

    .line 5
    .line 6
    new-instance v1, Ll/hfn0;

    .line 7
    .line 8
    invoke-direct {v1}, Ll/hfn0;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Ll/kfn0;->a:Ljava/util/List;

    .line 16
    .line 17
    new-instance v2, Ll/ifn0;

    .line 18
    .line 19
    invoke-direct {v2}, Ll/ifn0;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-static {v1, v2}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iget-object v2, p0, Ll/kfn0;->a:Ljava/util/List;

    .line 27
    .line 28
    iget-object v3, p1, Ll/kfn0;->a:Ljava/util/List;

    .line 29
    .line 30
    new-instance v4, Ll/jfn0;

    .line 31
    .line 32
    invoke-direct {v4, v0, v1}, Ll/jfn0;-><init>(Ljava/util/List;Ljava/util/List;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v3, v4}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-interface {v2, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 40
    .line 41
    .line 42
    iget-object p1, p1, Ll/kfn0;->c:Lcom/p1/mobile/putong/data/Pagination;

    .line 43
    .line 44
    iput-object p1, p0, Ll/kfn0;->c:Lcom/p1/mobile/putong/data/Pagination;

    .line 45
    .line 46
    return-void
.end method
