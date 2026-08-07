.class public Ll/p7o0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/p1/mobile/putong/live/base/bean/LivingUsers<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMember;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveData;Z)V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/bean/LivingUsers;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/p7o0;->a:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 10
    .line 11
    new-instance v0, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/p7o0;->b:Ljava/util/HashMap;

    .line 17
    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->members:Ljava/util/List;

    .line 21
    .line 22
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->users:Ljava/util/List;

    .line 30
    .line 31
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->masks:Ljava/util/List;

    .line 32
    .line 33
    invoke-static {v0, v1, p2}, Ll/w6o0;->l(Ljava/util/List;Ljava/util/List;Z)Ljava/util/HashMap;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCalls:Ljava/util/List;

    .line 38
    .line 39
    new-instance v2, Ll/k7o0;

    .line 40
    .line 41
    invoke-direct {v2}, Ll/k7o0;-><init>()V

    .line 42
    .line 43
    .line 44
    new-instance v3, Ll/l7o0;

    .line 45
    .line 46
    invoke-direct {v3}, Ll/l7o0;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-static {v1, v2, v3}, Ll/jyb;->d(Ljava/util/Collection;Ll/qcj;Ll/qcj;)Ljava/util/HashMap;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->starlightHierarchies:Ljava/util/List;

    .line 54
    .line 55
    new-instance v3, Ll/m7o0;

    .line 56
    .line 57
    invoke-direct {v3}, Ll/m7o0;-><init>()V

    .line 58
    .line 59
    .line 60
    new-instance v4, Ll/n7o0;

    .line 61
    .line 62
    invoke-direct {v4}, Ll/n7o0;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-static {v2, v3, v4}, Ll/jyb;->d(Ljava/util/Collection;Ll/qcj;Ll/qcj;)Ljava/util/HashMap;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    iput-object v2, p0, Ll/p7o0;->b:Ljava/util/HashMap;

    .line 70
    .line 71
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->members:Ljava/util/List;

    .line 72
    .line 73
    new-instance v2, Ll/o7o0;

    .line 74
    .line 75
    invoke-direct {v2, v0, v1, p2}, Ll/o7o0;-><init>(Ljava/util/HashMap;Ljava/util/HashMap;Z)V

    .line 76
    .line 77
    .line 78
    invoke-static {p1, v2}, Lcom/p1/mobile/putong/live/base/bean/LivingUsers;->convert(Ljava/util/List;Ll/qcj;)Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    iput-object p1, p0, Ll/p7o0;->a:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 83
    .line 84
    :cond_1
    :goto_0
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveStarlightHierarchy;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStarlightHierarchy;->imageUrl:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Ljava/util/HashMap;Ljava/util/HashMap;ZLl/nsv;)Ll/nsv;
    .locals 4

    .line 1
    iget-object v0, p3, Ll/nsv;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->reference:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ll/m6o0;

    .line 12
    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return-object p0

    .line 17
    :cond_0
    iget-object v0, p0, Ll/m6o0;->a:Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    invoke-virtual {p3, v0}, Ll/nsv;->a(Lcom/p1/mobile/putong/data/User;)Ll/nsv;

    .line 20
    .line 21
    .line 22
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Ll/vwt;->u7()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    invoke-static {p3}, Ll/iek0;->b(Ll/nsv;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    invoke-static {p3}, Ll/iek0;->a(Ll/nsv;)Lcom/p1/mobile/putong/data/User;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 43
    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    iget-object v0, p3, Ll/nsv;->a:Ljava/lang/Object;

    .line 47
    .line 48
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 49
    .line 50
    sget-object v1, Ll/htd0;->c:Ll/htd0;

    .line 51
    .line 52
    invoke-static {v1}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    check-cast v1, Ll/hiv;

    .line 57
    .line 58
    invoke-static {p3}, Ll/iek0;->a(Ll/nsv;)Lcom/p1/mobile/putong/data/User;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 63
    .line 64
    iget-wide v2, v2, Lcom/p1/mobile/putong/data/LiveUserLevel;->grade:J

    .line 65
    .line 66
    invoke-virtual {v1, v2, v3}, Ll/hiv;->v(J)Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->liveUserLevel:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 71
    .line 72
    :cond_1
    iget-object v0, p3, Ll/nsv;->a:Ljava/lang/Object;

    .line 73
    .line 74
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 75
    .line 76
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->reference:Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 83
    .line 84
    if-eqz p1, :cond_2

    .line 85
    .line 86
    invoke-virtual {p3, p1}, Ll/nsv;->b(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Ll/nsv;

    .line 87
    .line 88
    .line 89
    :cond_2
    iget-object p1, p3, Ll/nsv;->a:Ljava/lang/Object;

    .line 90
    .line 91
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 92
    .line 93
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->reference:Ljava/lang/String;

    .line 94
    .line 95
    iget-object p0, p0, Ll/m6o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 96
    .line 97
    invoke-virtual {p3, p1, p0, p2}, Ll/nsv;->c(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;Z)Ll/nsv;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/base/data/BLiveStarlightHierarchy;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStarlightHierarchy;->userId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
