.class public Ll/eqn0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInvite;",
            ">;"
        }
    .end annotation
.end field

.field public final b:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;Ljava/util/List;Ljava/util/List;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInvite;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;",
            ">;Z)V"
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
    iput-object v0, p0, Ll/eqn0;->b:Ljava/util/HashMap;

    .line 10
    .line 11
    iput-object p1, p0, Ll/eqn0;->a:Ljava/util/List;

    .line 12
    .line 13
    new-instance p1, Ll/bqn0;

    .line 14
    .line 15
    invoke-direct {p1}, Ll/bqn0;-><init>()V

    .line 16
    .line 17
    .line 18
    new-instance v0, Ll/cqn0;

    .line 19
    .line 20
    invoke-direct {v0}, Ll/cqn0;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-static {p3, p1, v0}, Ll/jyb;->d(Ljava/util/Collection;Ll/qcj;Ll/qcj;)Ljava/util/HashMap;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    new-instance p3, Ll/dqn0;

    .line 28
    .line 29
    invoke-direct {p3, p0, p1, p4}, Ll/dqn0;-><init>(Ll/eqn0;Ljava/util/HashMap;Z)V

    .line 30
    .line 31
    .line 32
    invoke-static {p2, p3}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->userId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c(Ll/eqn0;Ljava/util/HashMap;ZLcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/eqn0;->d(Ljava/util/HashMap;ZLcom/p1/mobile/putong/data/User;)V

    return-void
.end method


# virtual methods
.method public final synthetic d(Ljava/util/HashMap;ZLcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/eqn0;->b:Ljava/util/HashMap;

    .line 2
    .line 3
    iget-object v0, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p3}, Ll/nsv;->f(Ljava/lang/Object;)Ll/nsv;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object p3, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p1, p3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 16
    .line 17
    invoke-virtual {v1, p3, p1, p2}, Ll/nsv;->c(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;Z)Ll/nsv;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    return-void
.end method
