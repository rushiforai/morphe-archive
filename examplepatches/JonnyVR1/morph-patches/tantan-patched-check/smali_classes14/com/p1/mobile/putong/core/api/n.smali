.class public Lcom/p1/mobile/putong/core/api/n;
.super Ll/dy6;
.source "SourceFile"


# instance fields
.field public R:Ll/byd0;

.field public S:Ll/byd0;

.field public T:Ll/byd0;

.field public U:Lcom/p1/mobile/putong/data/User;

.field public V:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

.field public W:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

.field public final X:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public Y:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/core/data/PartialListOpt<",
            "Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;",
            ">;>;"
        }
    .end annotation
.end field

.field public Z:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public a0:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public b0:I

.field public c0:Ll/xgw;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/xgw<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/api/c;)V
    .locals 3

    .line 1
    invoke-direct {p0, p1}, Ll/dy6;-><init>(Lcom/p1/mobile/putong/core/api/c;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/n;->U:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    new-instance p1, Ljava/util/HashSet;

    .line 8
    .line 9
    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/n;->X:Ljava/util/HashSet;

    .line 13
    .line 14
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/n;->Y:Lrx/subjects/a;

    .line 19
    .line 20
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/n;->Z:Lrx/subjects/b;

    .line 25
    .line 26
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/n;->a0:Lrx/subjects/a;

    .line 31
    .line 32
    const/4 p1, 0x1

    .line 33
    iput p1, p0, Lcom/p1/mobile/putong/core/api/n;->b0:I

    .line 34
    .line 35
    new-instance p1, Ll/xgw;

    .line 36
    .line 37
    const/16 v0, 0x14

    .line 38
    .line 39
    invoke-direct {p1, v0}, Ll/xgw;-><init>(I)V

    .line 40
    .line 41
    .line 42
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/n;->c0:Ll/xgw;

    .line 43
    .line 44
    new-instance p1, Ll/byd0;

    .line 45
    .line 46
    new-instance v0, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    const-string v1, "today_tribe_start_swipe_time_"

    .line 49
    .line 50
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    const-wide/16 v1, 0x0

    .line 69
    .line 70
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-direct {p1, v0, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 75
    .line 76
    .line 77
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/n;->R:Ll/byd0;

    .line 78
    .line 79
    new-instance p1, Ll/byd0;

    .line 80
    .line 81
    new-instance v0, Ljava/lang/StringBuilder;

    .line 82
    .line 83
    const-string v2, "today_tribe_swipe_count_"

    .line 84
    .line 85
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-direct {p1, v0, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 104
    .line 105
    .line 106
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/n;->S:Ll/byd0;

    .line 107
    .line 108
    new-instance p1, Ll/byd0;

    .line 109
    .line 110
    new-instance v0, Ljava/lang/StringBuilder;

    .line 111
    .line 112
    const-string v2, "today_tribe_right_swipe_count_"

    .line 113
    .line 114
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 118
    .line 119
    .line 120
    move-result-object v2

    .line 121
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v2

    .line 125
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    invoke-direct {p1, v0, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 133
    .line 134
    .line 135
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/n;->T:Ll/byd0;

    .line 136
    .line 137
    return-void
.end method

.method public static synthetic a3(Lcom/p1/mobile/putong/core/api/n;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Relationship;Ljava/util/Map;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/api/n;->Q3(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Relationship;Ljava/util/Map;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b3(Lcom/p1/mobile/putong/core/api/n;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/Relationship;Ljava/util/Map;Ljava/lang/Long;ZLcom/p1/mobile/putong/data/User;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/api/n;->F3(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/Relationship;Ljava/util/Map;Ljava/lang/Long;ZLcom/p1/mobile/putong/data/User;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c3(Lcom/p1/mobile/putong/core/api/n;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/api/n;->E3(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method

.method public static synthetic d3(Lcom/p1/mobile/putong/core/api/n;ILcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/api/n;->C3(ILcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic e3(Lcom/p1/mobile/putong/core/api/n;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/api/n;->N3(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic f3(Ljava/lang/String;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic g3(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Relationship;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Envelope;->counters:Lcom/p1/mobile/putong/data/Counter;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/c;->F3(Lcom/p1/mobile/putong/data/Counter;)V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Envelope;->counters:Lcom/p1/mobile/putong/data/Counter;

    .line 18
    .line 19
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/Counter;->mergeData(Lcom/p1/mobile/putong/data/Counter;)V

    .line 26
    .line 27
    .line 28
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Envelope;->counters:Lcom/p1/mobile/putong/data/Counter;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/c;->F3(Lcom/p1/mobile/putong/data/Counter;)V

    .line 33
    .line 34
    .line 35
    :goto_0
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 42
    .line 43
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->relationships:Ljava/util/List;

    .line 44
    .line 45
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-eqz v1, :cond_1

    .line 50
    .line 51
    new-instance p0, Lcom/p1/mobile/putong/data/Relationship;

    .line 52
    .line 53
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/Relationship;-><init>()V

    .line 54
    .line 55
    .line 56
    const-string v0, "unknown_"

    .line 57
    .line 58
    invoke-static {v0}, Lcom/p1/mobile/putong/data/RelationshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 63
    .line 64
    return-object p0

    .line 65
    :cond_1
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    check-cast p0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 70
    .line 71
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->relationships:Ljava/util/List;

    .line 72
    .line 73
    const/4 v0, 0x0

    .line 74
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    check-cast p0, Lcom/p1/mobile/putong/data/Relationship;

    .line 79
    .line 80
    return-object p0
.end method

.method public static synthetic h3(I)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic i3(Lcom/p1/mobile/putong/core/api/n;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/api/n;->M3(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic j3(Lcom/p1/mobile/putong/core/api/n;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/n;->I3(Ll/pf60;)V

    return-void
.end method

.method public static synthetic k3(Lcom/p1/mobile/putong/core/api/n;ILcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/api/n;->D3(ILcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic l3(Lcom/p1/mobile/putong/data/Envelope;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static synthetic m3(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->hasPic()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/data/User;->media(I)Lcom/p1/mobile/putong/data/Media;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Xf(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 26
    .line 27
    invoke-virtual {v0, p0}, Ll/fsb0;->z0(Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static synthetic n3(Lcom/p1/mobile/putong/core/api/n;ZLcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;Lrx/Notification;)Lrx/Notification;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/api/n;->G3(ZLcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;Lrx/Notification;)Lrx/Notification;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic o3(Lcom/p1/mobile/putong/core/api/n;Ll/pf60;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/n;->K3(Ll/pf60;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic p3(Lcom/p1/mobile/putong/core/api/n;Ljava/lang/String;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/n;->L3(Ljava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic q3(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

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

.method public static synthetic r3(Lcom/p1/mobile/putong/core/api/n;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Relationship;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/api/n;->P3(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Relationship;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic s3(Ljava/lang/String;)Ll/x1d0;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static synthetic t3(Lcom/p1/mobile/putong/core/api/n;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/n;->J3(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic u3(Lcom/p1/mobile/putong/core/api/n;Lcom/p1/mobile/putong/data/Envelope;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/api/n;->O3(Lcom/p1/mobile/putong/data/Envelope;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V

    return-void
.end method

.method public static synthetic v3(Lcom/p1/mobile/putong/core/api/n;Lrx/Notification;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/api/n;->H3(Lrx/Notification;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method


# virtual methods
.method public final A3()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/api/n;->b0:I

    .line 2
    .line 3
    return p0
.end method

.method public B3(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;I)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;",
            "I)",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v1, Ll/sb9;

    .line 4
    .line 5
    invoke-direct {v1, p0, p2, p1}, Ll/sb9;-><init>(Lcom/p1/mobile/putong/core/api/n;ILcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "users/suggested/intl_tribe/insert"

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    invoke-virtual {v0, p0, p1, v1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic C3(ILcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Ll/uxj0;)V
    .locals 1

    .line 1
    iget-object p3, p0, Lcom/p1/mobile/putong/core/api/n;->Y:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p3}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    check-cast p3, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 8
    .line 9
    if-nez p3, :cond_0

    .line 10
    .line 11
    new-instance p3, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 18
    .line 19
    :goto_0
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-lt v0, p1, :cond_1

    .line 24
    .line 25
    invoke-interface {p3, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_1
    invoke-interface {p3, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/api/n;->X:Ljava/util/HashSet;

    .line 33
    .line 34
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {p1, p2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    invoke-static {}, Lcom/p1/mobile/putong/data/DbLinks;->new_()Lcom/p1/mobile/putong/data/DbLinks;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iget-object p2, p1, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 44
    .line 45
    const-string v0, ""

    .line 46
    .line 47
    iput-object v0, p2, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/n;->Y:Lrx/subjects/a;

    .line 50
    .line 51
    new-instance p2, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 52
    .line 53
    invoke-direct {p2, p3, p1}, Lcom/p1/mobile/putong/core/data/PartialListOpt;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0, p2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public final synthetic D3(ILcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/tb9;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/tb9;-><init>(I)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/c;->fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/core/api/a;->T2()Lrx/c$d;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/ub9;

    .line 19
    .line 20
    invoke-direct {v1, p0, p1, p2}, Ll/ub9;-><init>(Lcom/p1/mobile/putong/core/api/n;ILcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public final synthetic E3(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 1

    .line 1
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 2
    .line 3
    const-string v0, "matched"

    .line 4
    .line 5
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreLikers;->C7(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public final synthetic F3(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/Relationship;Ljava/util/Map;Ljava/lang/Long;ZLcom/p1/mobile/putong/data/User;)Lrx/c;
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0, p2, p3}, Lcom/p1/mobile/putong/core/api/y;->m3(Ljava/lang/String;Lcom/p1/mobile/putong/data/Relationship;Ljava/util/Map;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-static {p4}, Ll/z7i0;->e(Ljava/lang/Long;)Lrx/c$d;

    .line 8
    .line 9
    .line 10
    move-result-object p3

    .line 11
    invoke-virtual {p2, p3}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-virtual {p2}, Lrx/c;->materialize()Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    new-instance p3, Ll/yb9;

    .line 20
    .line 21
    invoke-direct {p3, p0, p5, p1, p6}, Ll/yb9;-><init>(Lcom/p1/mobile/putong/core/api/n;ZLcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p2, p3}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-virtual {p2}, Lrx/c;->dematerialize()Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    const/4 p3, 0x1

    .line 33
    invoke-virtual {p2, p3}, Lrx/c;->take(I)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    invoke-static {}, Lcom/p1/mobile/putong/core/api/a;->T2()Lrx/c$d;

    .line 38
    .line 39
    .line 40
    move-result-object p3

    .line 41
    invoke-virtual {p2, p3}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    new-instance p3, Ll/zb9;

    .line 46
    .line 47
    invoke-direct {p3}, Ll/zb9;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p2, p3}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    new-instance p3, Ll/ac9;

    .line 55
    .line 56
    invoke-direct {p3, p0, p1}, Ll/ac9;-><init>(Lcom/p1/mobile/putong/core/api/n;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p2, p3}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    return-object p0
.end method

.method public final synthetic G3(ZLcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;Lrx/Notification;)Lrx/Notification;
    .locals 0

    .line 1
    invoke-virtual {p0, p4, p1, p2, p3}, Lcom/p1/mobile/putong/core/api/n;->T3(Lrx/Notification;ZLcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;)V

    .line 2
    .line 3
    .line 4
    return-object p4
.end method

.method public final synthetic H3(Lrx/Notification;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lrx/Notification;->f()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    .line 6
    .line 7
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->relationships:Ljava/util/List;

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Lcom/p1/mobile/putong/data/Relationship;

    .line 23
    .line 24
    iget-object v0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 27
    .line 28
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, p2}, Ll/dkb;->Q9(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    if-nez p2, :cond_1

    .line 35
    .line 36
    if-nez p3, :cond_0

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    move-object p2, p3

    .line 40
    :cond_1
    iput-object p1, p2, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 41
    .line 42
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 43
    .line 44
    const-string v0, "matched"

    .line 45
    .line 46
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-eqz p1, :cond_3

    .line 51
    .line 52
    if-eqz p3, :cond_2

    .line 53
    .line 54
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 55
    .line 56
    iput-object p1, p3, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 57
    .line 58
    :cond_2
    sget-object p1, Ll/uqb0;->k0:Ll/vj5;

    .line 59
    .line 60
    iget-object p1, p1, Ll/vj5;->d:Ll/ejk0;

    .line 61
    .line 62
    invoke-virtual {p1, p2}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    .line 63
    .line 64
    .line 65
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 66
    .line 67
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 68
    .line 69
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/api/g;->vf(Lcom/p1/mobile/putong/data/User;)V

    .line 70
    .line 71
    .line 72
    :cond_3
    :goto_0
    return-void
.end method

.method public final synthetic I3(Ll/pf60;)V
    .locals 6

    .line 1
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    move-object v1, p1

    .line 4
    check-cast v1, Lcom/p1/mobile/putong/data/Envelope;

    .line 5
    .line 6
    const-class p1, Lcom/p1/mobile/putong/data/CommonData;

    .line 7
    .line 8
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Lcom/p1/mobile/putong/data/CommonData;

    .line 13
    .line 14
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    iget-object v3, v1, Lcom/p1/mobile/putong/data/Envelope;->counters:Lcom/p1/mobile/putong/data/Counter;

    .line 21
    .line 22
    if-nez v2, :cond_0

    .line 23
    .line 24
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/api/c;->F3(Lcom/p1/mobile/putong/data/Counter;)V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 31
    .line 32
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-virtual {v3, v2}, Lcom/p1/mobile/putong/data/Counter;->mergeData(Lcom/p1/mobile/putong/data/Counter;)V

    .line 37
    .line 38
    .line 39
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 40
    .line 41
    iget-object v3, v1, Lcom/p1/mobile/putong/data/Envelope;->counters:Lcom/p1/mobile/putong/data/Counter;

    .line 42
    .line 43
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/api/c;->F3(Lcom/p1/mobile/putong/data/Counter;)V

    .line 44
    .line 45
    .line 46
    :goto_0
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->i()Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-eqz v2, :cond_2

    .line 51
    .line 52
    iget-object v0, v0, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    .line 53
    .line 54
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-nez v0, :cond_1

    .line 59
    .line 60
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    check-cast p1, Lcom/p1/mobile/putong/data/CommonData;

    .line 65
    .line 66
    iget-object p1, p1, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    .line 67
    .line 68
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/n;->V3(Ljava/util/List;)V

    .line 69
    .line 70
    .line 71
    :cond_1
    iget-object v0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 72
    .line 73
    const/4 v4, 0x0

    .line 74
    const/4 v5, 0x1

    .line 75
    const/4 v2, 0x0

    .line 76
    const/4 v3, 0x1

    .line 77
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/api/c;->y3(Lcom/p1/mobile/putong/data/Envelope;Ll/x20;ZZZ)V

    .line 78
    .line 79
    .line 80
    :cond_2
    return-void
.end method

.method public final synthetic J3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget-object p1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/api/n;->Y:Lrx/subjects/a;

    .line 7
    .line 8
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/core/api/n;->Y:Lrx/subjects/a;

    .line 19
    .line 20
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    check-cast p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 25
    .line 26
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 27
    .line 28
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-eqz p1, :cond_0

    .line 33
    .line 34
    iget-object p1, p0, Lcom/p1/mobile/putong/core/api/n;->Y:Lrx/subjects/a;

    .line 35
    .line 36
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    check-cast p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 41
    .line 42
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 43
    .line 44
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 45
    .line 46
    .line 47
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/n;->a0:Lrx/subjects/a;

    .line 48
    .line 49
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 50
    .line 51
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final synthetic K3(Ll/pf60;)Ll/uxj0;
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/n;->Y:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 18
    .line 19
    :goto_0
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    .line 22
    .line 23
    new-instance v1, Ljava/util/HashMap;

    .line 24
    .line 25
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 26
    .line 27
    .line 28
    const-class v2, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 29
    .line 30
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    check-cast v3, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 35
    .line 36
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/CoreData;->cardInfos:Ljava/util/List;

    .line 37
    .line 38
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    if-nez v3, :cond_2

    .line 43
    .line 44
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    check-cast v3, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 49
    .line 50
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/CoreData;->cardInfos:Ljava/util/List;

    .line 51
    .line 52
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    :cond_1
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 57
    .line 58
    .line 59
    move-result v4

    .line 60
    if-eqz v4, :cond_2

    .line 61
    .line 62
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v4

    .line 66
    check-cast v4, Lcom/p1/mobile/putong/core/data/CardInfos;

    .line 67
    .line 68
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result v5

    .line 72
    if-eqz v5, :cond_1

    .line 73
    .line 74
    iget-object v5, v4, Lcom/p1/mobile/putong/core/data/CardInfos;->userId:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {v1, v5, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_2
    new-instance v3, Ljava/util/HashMap;

    .line 81
    .line 82
    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 86
    .line 87
    .line 88
    move-result-object v4

    .line 89
    check-cast v4, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 90
    .line 91
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/CoreData;->compliments:Ljava/util/List;

    .line 92
    .line 93
    invoke-static {v4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 94
    .line 95
    .line 96
    move-result v5

    .line 97
    if-nez v5, :cond_4

    .line 98
    .line 99
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 100
    .line 101
    .line 102
    move-result-object v4

    .line 103
    :cond_3
    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 104
    .line 105
    .line 106
    move-result v5

    .line 107
    if-eqz v5, :cond_4

    .line 108
    .line 109
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object v5

    .line 113
    check-cast v5, Lcom/p1/mobile/putong/core/data/SuggestedComplimentItem;

    .line 114
    .line 115
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result v6

    .line 119
    if-eqz v6, :cond_3

    .line 120
    .line 121
    iget-object v6, v5, Lcom/p1/mobile/putong/core/data/SuggestedComplimentItem;->receiverId:Ljava/lang/String;

    .line 122
    .line 123
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 124
    .line 125
    .line 126
    move-result v6

    .line 127
    if-nez v6, :cond_3

    .line 128
    .line 129
    iget-object v6, v5, Lcom/p1/mobile/putong/core/data/SuggestedComplimentItem;->receiverId:Ljava/lang/String;

    .line 130
    .line 131
    invoke-virtual {v3, v6, v5}, Ljava/util/HashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    goto :goto_2

    .line 135
    :cond_4
    new-instance v4, Ljava/util/ArrayList;

    .line 136
    .line 137
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 138
    .line 139
    .line 140
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 141
    .line 142
    .line 143
    move-result-object v5

    .line 144
    check-cast v5, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 145
    .line 146
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/CoreData;->likedMes:Ljava/util/List;

    .line 147
    .line 148
    invoke-static {v5}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 149
    .line 150
    .line 151
    move-result v5

    .line 152
    if-nez v5, :cond_6

    .line 153
    .line 154
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 155
    .line 156
    .line 157
    move-result-object v5

    .line 158
    check-cast v5, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 159
    .line 160
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/CoreData;->likedMes:Ljava/util/List;

    .line 161
    .line 162
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 163
    .line 164
    .line 165
    move-result-object v5

    .line 166
    :cond_5
    :goto_3
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 167
    .line 168
    .line 169
    move-result v6

    .line 170
    if-eqz v6, :cond_6

    .line 171
    .line 172
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    move-result-object v6

    .line 176
    check-cast v6, Lcom/p1/mobile/putong/core/data/CardStyle;

    .line 177
    .line 178
    invoke-static {v6}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 179
    .line 180
    .line 181
    move-result v7

    .line 182
    if-eqz v7, :cond_5

    .line 183
    .line 184
    iget-object v7, v6, Lcom/p1/mobile/putong/core/data/CardStyle;->label:Ljava/util/List;

    .line 185
    .line 186
    const-string v8, "liked_me"

    .line 187
    .line 188
    invoke-interface {v7, v8}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 189
    .line 190
    .line 191
    move-result v7

    .line 192
    if-eqz v7, :cond_5

    .line 193
    .line 194
    iget-object v6, v6, Lcom/p1/mobile/putong/core/data/CardStyle;->userId:Ljava/lang/String;

    .line 195
    .line 196
    invoke-interface {v4, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 197
    .line 198
    .line 199
    goto :goto_3

    .line 200
    :cond_6
    const-class v5, Lcom/p1/mobile/putong/data/CommonData;

    .line 201
    .line 202
    invoke-virtual {p1, v5}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 203
    .line 204
    .line 205
    move-result-object v6

    .line 206
    invoke-static {v6}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 207
    .line 208
    .line 209
    move-result v6

    .line 210
    const/4 v7, 0x0

    .line 211
    if-eqz v6, :cond_c

    .line 212
    .line 213
    invoke-virtual {p1, v5}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 214
    .line 215
    .line 216
    move-result-object v6

    .line 217
    check-cast v6, Lcom/p1/mobile/putong/data/CommonData;

    .line 218
    .line 219
    iget-object v6, v6, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    .line 220
    .line 221
    invoke-static {v6}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 222
    .line 223
    .line 224
    move-result v6

    .line 225
    if-nez v6, :cond_c

    .line 226
    .line 227
    invoke-virtual {p1, v5}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 228
    .line 229
    .line 230
    move-result-object v5

    .line 231
    check-cast v5, Lcom/p1/mobile/putong/data/CommonData;

    .line 232
    .line 233
    iget-object v5, v5, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    .line 234
    .line 235
    new-instance v6, Ljava/util/ArrayList;

    .line 236
    .line 237
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 238
    .line 239
    .line 240
    new-instance v8, Ljava/util/HashMap;

    .line 241
    .line 242
    invoke-direct {v8}, Ljava/util/HashMap;-><init>()V

    .line 243
    .line 244
    .line 245
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 246
    .line 247
    .line 248
    move-result-object v9

    .line 249
    check-cast v9, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 250
    .line 251
    iget-object v9, v9, Lcom/p1/mobile/putong/core/data/CoreData;->moments:Ljava/util/List;

    .line 252
    .line 253
    invoke-static {v9}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 254
    .line 255
    .line 256
    move-result v9

    .line 257
    if-nez v9, :cond_8

    .line 258
    .line 259
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 260
    .line 261
    .line 262
    move-result-object p1

    .line 263
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 264
    .line 265
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->moments:Ljava/util/List;

    .line 266
    .line 267
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 268
    .line 269
    .line 270
    move-result-object p1

    .line 271
    :cond_7
    :goto_4
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 272
    .line 273
    .line 274
    move-result v2

    .line 275
    if-eqz v2, :cond_8

    .line 276
    .line 277
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 278
    .line 279
    .line 280
    move-result-object v2

    .line 281
    check-cast v2, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 282
    .line 283
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 284
    .line 285
    .line 286
    move-result v9

    .line 287
    if-eqz v9, :cond_7

    .line 288
    .line 289
    iget-object v9, v2, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 290
    .line 291
    invoke-virtual {v8, v9, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 292
    .line 293
    .line 294
    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 295
    .line 296
    .line 297
    goto :goto_4

    .line 298
    :cond_8
    invoke-static {v5}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 299
    .line 300
    .line 301
    move-result p1

    .line 302
    if-nez p1, :cond_c

    .line 303
    .line 304
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 305
    .line 306
    .line 307
    move-result-object p1

    .line 308
    :cond_9
    :goto_5
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 309
    .line 310
    .line 311
    move-result v2

    .line 312
    if-eqz v2, :cond_c

    .line 313
    .line 314
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 315
    .line 316
    .line 317
    move-result-object v2

    .line 318
    check-cast v2, Lcom/p1/mobile/putong/data/User;

    .line 319
    .line 320
    iget-object v5, p0, Lcom/p1/mobile/putong/core/api/n;->X:Ljava/util/HashSet;

    .line 321
    .line 322
    iget-object v6, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 323
    .line 324
    invoke-virtual {v5, v6}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 325
    .line 326
    .line 327
    move-result v5

    .line 328
    if-nez v5, :cond_9

    .line 329
    .line 330
    new-instance v5, Ll/nb9;

    .line 331
    .line 332
    invoke-direct {v5, v2}, Ll/nb9;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 333
    .line 334
    .line 335
    invoke-static {v0, v5}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 336
    .line 337
    .line 338
    move-result v5

    .line 339
    if-eqz v5, :cond_a

    .line 340
    .line 341
    goto :goto_5

    .line 342
    :cond_a
    new-instance v5, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 343
    .line 344
    invoke-direct {v5}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;-><init>()V

    .line 345
    .line 346
    .line 347
    iget-object v6, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 348
    .line 349
    iput-object v6, v5, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 350
    .line 351
    invoke-virtual {v1, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 352
    .line 353
    .line 354
    move-result-object v6

    .line 355
    check-cast v6, Lcom/p1/mobile/putong/core/data/CardInfos;

    .line 356
    .line 357
    iput-object v6, v5, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->cardInfos:Lcom/p1/mobile/putong/core/data/CardInfos;

    .line 358
    .line 359
    const/4 v7, 0x1

    .line 360
    iput-boolean v7, v5, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isCoreMomentThemeCard:Z

    .line 361
    .line 362
    iget-object v9, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 363
    .line 364
    invoke-interface {v4, v9}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 365
    .line 366
    .line 367
    move-result v9

    .line 368
    invoke-virtual {v5, v9}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->setUserLikeMe(Z)V

    .line 369
    .line 370
    .line 371
    invoke-static {v6}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 372
    .line 373
    .line 374
    move-result v9

    .line 375
    if-eqz v9, :cond_b

    .line 376
    .line 377
    iget-object v6, v6, Lcom/p1/mobile/putong/core/data/CardInfos;->momentId:Ljava/lang/String;

    .line 378
    .line 379
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 380
    .line 381
    .line 382
    move-result v6

    .line 383
    if-nez v6, :cond_b

    .line 384
    .line 385
    iget-object v6, v5, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->cardInfos:Lcom/p1/mobile/putong/core/data/CardInfos;

    .line 386
    .line 387
    iget-object v6, v6, Lcom/p1/mobile/putong/core/data/CardInfos;->momentId:Ljava/lang/String;

    .line 388
    .line 389
    invoke-virtual {v8, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 390
    .line 391
    .line 392
    move-result-object v6

    .line 393
    check-cast v6, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 394
    .line 395
    iput-object v6, v5, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->coreMomentInfo:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 396
    .line 397
    :cond_b
    iget-object v6, v5, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 398
    .line 399
    invoke-virtual {v3, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 400
    .line 401
    .line 402
    move-result-object v6

    .line 403
    check-cast v6, Lcom/p1/mobile/putong/core/data/SuggestedComplimentItem;

    .line 404
    .line 405
    iput-object v6, v5, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->compliment:Lcom/p1/mobile/putong/core/data/SuggestedComplimentItem;

    .line 406
    .line 407
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 408
    .line 409
    .line 410
    iget-object v5, p0, Lcom/p1/mobile/putong/core/api/n;->X:Ljava/util/HashSet;

    .line 411
    .line 412
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 413
    .line 414
    invoke-virtual {v5, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 415
    .line 416
    .line 417
    goto :goto_5

    .line 418
    :cond_c
    invoke-static {}, Lcom/p1/mobile/putong/data/DbLinks;->new_()Lcom/p1/mobile/putong/data/DbLinks;

    .line 419
    .line 420
    .line 421
    move-result-object p1

    .line 422
    iget-object v1, p1, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 423
    .line 424
    if-eqz v7, :cond_d

    .line 425
    .line 426
    const-string v2, ""

    .line 427
    .line 428
    goto :goto_6

    .line 429
    :cond_d
    const/4 v2, 0x0

    .line 430
    :goto_6
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 431
    .line 432
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/n;->Y:Lrx/subjects/a;

    .line 433
    .line 434
    new-instance v1, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 435
    .line 436
    invoke-direct {v1, v0, p1}, Lcom/p1/mobile/putong/core/data/PartialListOpt;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 437
    .line 438
    .line 439
    invoke-virtual {p0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 440
    .line 441
    .line 442
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 443
    .line 444
    return-object p0
.end method

.method public final synthetic L3(Ljava/lang/String;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/hb9;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/hb9;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->e(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    new-instance v0, Ll/ib9;

    .line 11
    .line 12
    invoke-direct {v0}, Ll/ib9;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    new-instance v0, Ll/jb9;

    .line 20
    .line 21
    invoke-direct {v0, p0}, Ll/jb9;-><init>(Lcom/p1/mobile/putong/core/api/n;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1, v0}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    new-instance v0, Ll/kb9;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Ll/kb9;-><init>(Lcom/p1/mobile/putong/core/api/n;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1, v0}, Lrx/c;->doOnError(Ll/y20;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-static {}, Lcom/p1/mobile/putong/core/api/a;->T2()Lrx/c$d;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {p1, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    new-instance v0, Ll/lb9;

    .line 46
    .line 47
    invoke-direct {v0, p0}, Ll/lb9;-><init>(Lcom/p1/mobile/putong/core/api/n;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    return-object p0
.end method

.method public final synthetic M3(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/api/n;->U3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic N3(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ll/bc9;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/bc9;-><init>(Lcom/p1/mobile/putong/core/api/n;Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic O3(Lcom/p1/mobile/putong/data/Envelope;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V
    .locals 2

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->relationships:Ljava/util/List;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Lcom/p1/mobile/putong/data/Relationship;

    .line 17
    .line 18
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 19
    .line 20
    const-string v1, "default"

    .line 21
    .line 22
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    sget-object p1, Ll/uqb0;->k0:Ll/vj5;

    .line 29
    .line 30
    iget-object p1, p1, Ll/vj5;->d:Ll/ejk0;

    .line 31
    .line 32
    invoke-virtual {p1, p2}, Ll/wzh0;->insert(Lcom/tantanapp/common/data/DbObject;)V

    .line 33
    .line 34
    .line 35
    const/4 p1, 0x1

    .line 36
    iput-boolean p1, p3, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isUndo:Z

    .line 37
    .line 38
    invoke-virtual {p0, p3, v0}, Lcom/p1/mobile/putong/core/api/n;->B3(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;I)Lrx/c;

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/n;->w3()V

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method

.method public final synthetic P3(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Relationship;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v1, Ll/mb9;

    .line 4
    .line 5
    invoke-direct {v1, p0, p3, p1, p2}, Ll/mb9;-><init>(Lcom/p1/mobile/putong/core/api/n;Lcom/p1/mobile/putong/data/Envelope;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p3, v1}, Lcom/p1/mobile/putong/core/api/c;->w3(Lcom/p1/mobile/putong/data/Envelope;Ll/x20;)V

    .line 9
    .line 10
    .line 11
    const-class p0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 12
    .line 13
    invoke-virtual {p3, p0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->relationships:Ljava/util/List;

    .line 20
    .line 21
    const/4 p1, 0x0

    .line 22
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    check-cast p0, Lcom/p1/mobile/putong/data/Relationship;

    .line 27
    .line 28
    return-object p0
.end method

.method public final synthetic Q3(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Relationship;Ljava/util/Map;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Lrx/c;
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0, p2, p3}, Lcom/p1/mobile/putong/core/api/y;->m3(Ljava/lang/String;Lcom/p1/mobile/putong/data/Relationship;Ljava/util/Map;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    new-instance p3, Ll/cc9;

    .line 8
    .line 9
    invoke-direct {p3, p0, p1, p4}, Ll/cc9;-><init>(Lcom/p1/mobile/putong/core/api/n;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p2, p3}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/core/api/a;->T2()Lrx/c$d;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public R3(ZZLjava/util/Map;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;ZLcom/p1/mobile/putong/data/LikeExtraData;ILcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Lrx/c;
    .locals 8
    .param p3    # Ljava/util/Map;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p7    # Lcom/p1/mobile/putong/data/LikeExtraData;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZ",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/lang/String;",
            "Z",
            "Lcom/p1/mobile/putong/data/LikeExtraData;",
            "I",
            "Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Relationship;",
            ">;"
        }
    .end annotation

    .line 1
    move-object/from16 v2, p9

    .line 2
    .line 3
    if-nez p3, :cond_0

    .line 4
    .line 5
    new-instance p3, Ljava/util/HashMap;

    .line 6
    .line 7
    invoke-direct {p3}, Ljava/util/HashMap;-><init>()V

    .line 8
    .line 9
    .line 10
    :cond_0
    move-object v4, p3

    .line 11
    if-eqz p7, :cond_1

    .line 12
    .line 13
    iget-object p3, p7, Lcom/p1/mobile/putong/data/LikeExtraData;->matchScData:Lcom/p1/mobile/putong/data/MatchScData;

    .line 14
    .line 15
    iget-object p3, p3, Lcom/p1/mobile/putong/data/MatchScData;->receiverUserId:Ljava/lang/String;

    .line 16
    .line 17
    const-string v0, "receiver_user_id"

    .line 18
    .line 19
    invoke-interface {v4, v0, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    :cond_1
    if-nez v2, :cond_2

    .line 23
    .line 24
    new-instance p0, Ljava/lang/Exception;

    .line 25
    .line 26
    const-string p1, "Like Api Error: Perhaps suggested users were cleared or reset when doing Swipe Card Animation at moment"

    .line 27
    .line 28
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 32
    .line 33
    .line 34
    invoke-static {}, Lcom/p1/mobile/putong/data/Relationship;->new_()Lcom/p1/mobile/putong/data/Relationship;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0

    .line 43
    :cond_2
    move/from16 p3, p8

    .line 44
    .line 45
    iput p3, p0, Lcom/p1/mobile/putong/core/api/n;->b0:I

    .line 46
    .line 47
    invoke-virtual {p0, p1, p2, v2, p5}, Lcom/p1/mobile/putong/core/api/n;->y3(ZZLcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Ljava/lang/String;)Lcom/p1/mobile/putong/data/Relationship;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/core/api/n;->z3(Lcom/p1/mobile/putong/data/Relationship;)Ljava/lang/Long;

    .line 52
    .line 53
    .line 54
    move-result-object v5

    .line 55
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 56
    .line 57
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 58
    .line 59
    iget-object p3, v2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {p1, p3}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/n;->U:Lcom/p1/mobile/putong/data/User;

    .line 66
    .line 67
    iput-object v2, p0, Lcom/p1/mobile/putong/core/api/n;->V:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 68
    .line 69
    iget-object p1, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 70
    .line 71
    new-instance v0, Ll/xb9;

    .line 72
    .line 73
    move-object v1, p0

    .line 74
    move v6, p2

    .line 75
    move-object v7, p4

    .line 76
    invoke-direct/range {v0 .. v7}, Ll/xb9;-><init>(Lcom/p1/mobile/putong/core/api/n;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/Relationship;Ljava/util/Map;Ljava/lang/Long;ZLcom/p1/mobile/putong/data/User;)V

    .line 77
    .line 78
    .line 79
    const-string p0, "intl_tribe_like_slide"

    .line 80
    .line 81
    const/4 p2, -0x1

    .line 82
    invoke-virtual {p1, p0, p2, v0, p6}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;Z)Lrx/c;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    return-object p0
.end method

.method public S3()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/n;->a0:Lrx/subjects/a;

    .line 2
    .line 3
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final T3(Lrx/Notification;ZLcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Notification<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;Z",
            "Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;",
            "Lcom/p1/mobile/putong/data/User;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lrx/Notification;->j()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/n;->X:Ljava/util/HashSet;

    iget-object p1, p3, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    return-void

    .line 3
    :cond_0
    invoke-virtual {p1}, Lrx/Notification;->k()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    iget-object v1, p3, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ll/dkb;->Q9(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    move-result-object v0

    .line 5
    invoke-virtual {p1}, Lrx/Notification;->f()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/p1/mobile/putong/data/Envelope;

    const-class v2, Lcom/p1/mobile/putong/core/data/CoreData;

    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    move-result-object v1

    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreData;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->relationships:Ljava/util/List;

    const/4 v3, 0x0

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/p1/mobile/putong/data/Relationship;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    const-string v4, "matched"

    .line 6
    invoke-static {v1, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 7
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    if-eqz p2, :cond_1

    if-eqz v0, :cond_1

    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->superLikedMe()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 9
    const-string p2, "superLikedEach"

    invoke-static {p2}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    move-result-object p2

    invoke-interface {v1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    if-nez p2, :cond_2

    if-eqz v0, :cond_3

    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->superLikedMe()Z

    move-result p2

    if-eqz p2, :cond_3

    .line 11
    :cond_2
    const-string p2, "superLiked"

    invoke-static {p2}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    move-result-object p2

    invoke-interface {v1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_3
    :goto_0
    if-eqz v0, :cond_4

    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->boosted()Z

    move-result p2

    if-eqz p2, :cond_4

    .line 13
    const-string p2, "boosted"

    invoke-static {p2}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    move-result-object p2

    invoke-interface {v1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 14
    :cond_4
    invoke-virtual {p1}, Lrx/Notification;->f()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/p1/mobile/putong/data/Envelope;

    .line 15
    invoke-virtual {p2, v2}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    move-result-object p2

    check-cast p2, Lcom/p1/mobile/putong/core/data/CoreData;

    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/CoreData;->relationships:Ljava/util/List;

    .line 16
    invoke-interface {p2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/p1/mobile/putong/data/Relationship;

    iget-object p2, p2, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 17
    const-string v0, "secretcrush"

    invoke-static {v0}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    move-result-object v4

    invoke-interface {p2, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_5

    .line 18
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    move-result-object p2

    invoke-interface {v1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 19
    :cond_5
    invoke-virtual {p1}, Lrx/Notification;->f()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/p1/mobile/putong/data/Envelope;

    .line 20
    invoke-virtual {p2, v2}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    move-result-object p2

    check-cast p2, Lcom/p1/mobile/putong/core/data/CoreData;

    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/CoreData;->relationships:Ljava/util/List;

    .line 21
    invoke-interface {p2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/p1/mobile/putong/data/Relationship;

    iget-object p2, p2, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 22
    const-string v0, "online"

    invoke-static {v0}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    move-result-object v4

    invoke-interface {p2, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_6

    .line 23
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    move-result-object p2

    invoke-interface {v1, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_6

    .line 24
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    move-result-object p2

    invoke-interface {v1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 25
    :cond_6
    invoke-virtual {p1}, Lrx/Notification;->f()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/p1/mobile/putong/data/Envelope;

    .line 26
    invoke-virtual {p2, v2}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    move-result-object p2

    check-cast p2, Lcom/p1/mobile/putong/core/data/CoreData;

    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/CoreData;->relationships:Ljava/util/List;

    .line 27
    invoke-interface {p2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/p1/mobile/putong/data/Relationship;

    iget-object p2, p2, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 28
    const-string v0, "vipseen"

    invoke-static {v0}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    move-result-object v4

    invoke-interface {p2, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_7

    .line 29
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    move-result-object p2

    invoke-interface {v1, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_7

    .line 30
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    move-result-object p2

    invoke-interface {v1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 31
    :cond_7
    invoke-virtual {p1}, Lrx/Notification;->f()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/p1/mobile/putong/data/Envelope;

    invoke-virtual {p2, v2}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    move-result-object p2

    check-cast p2, Lcom/p1/mobile/putong/core/data/CoreData;

    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/CoreData;->relationships:Ljava/util/List;

    invoke-interface {p2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/p1/mobile/putong/data/Relationship;

    iput-object v1, p2, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    if-nez p4, :cond_9

    .line 32
    iget-object p2, p0, Lcom/p1/mobile/putong/core/api/n;->U:Lcom/p1/mobile/putong/data/User;

    if-eqz p2, :cond_9

    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 33
    invoke-virtual {p1}, Lrx/Notification;->f()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/Envelope;

    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreData;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreData;->relationships:Ljava/util/List;

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/Relationship;

    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->id:Ljava/lang/String;

    .line 34
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_9

    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/n;->w3()V

    goto :goto_1

    :cond_8
    if-nez p4, :cond_9

    .line 36
    iget-object p2, p0, Lcom/p1/mobile/putong/core/api/n;->U:Lcom/p1/mobile/putong/data/User;

    if-eqz p2, :cond_9

    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 37
    invoke-virtual {p1}, Lrx/Notification;->f()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/Envelope;

    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreData;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreData;->relationships:Ljava/util/List;

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/Relationship;

    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->id:Ljava/lang/String;

    .line 38
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_9

    .line 39
    iget-object p2, p0, Lcom/p1/mobile/putong/core/api/n;->V:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    const/4 v0, 0x1

    iput-boolean v0, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->canUndo:Z

    .line 40
    :cond_9
    :goto_1
    iget-object p2, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 41
    invoke-virtual {p1}, Lrx/Notification;->f()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/Envelope;

    new-instance v1, Ll/pb9;

    invoke-direct {v1, p0, p1, p3, p4}, Ll/pb9;-><init>(Lcom/p1/mobile/putong/core/api/n;Lrx/Notification;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;)V

    .line 42
    invoke-virtual {p2, v0, v1}, Lcom/p1/mobile/putong/core/api/c;->w3(Lcom/p1/mobile/putong/data/Envelope;Ll/x20;)V

    .line 43
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    iget-object p1, p3, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreLikers;->B7(Ljava/lang/String;)V

    :cond_a
    return-void
.end method

.method public U3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget v0, Ll/uqb0;->f0:I

    .line 2
    .line 3
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/putong/core/api/a;->j2(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p2, p0, Lcom/p1/mobile/putong/core/api/n;->Z:Lrx/subjects/b;

    .line 8
    .line 9
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 10
    .line 11
    invoke-virtual {p2, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    iget-object p2, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    new-instance v0, Ll/gb9;

    .line 17
    .line 18
    invoke-direct {v0, p0, p1}, Ll/gb9;-><init>(Lcom/p1/mobile/putong/core/api/n;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const-string p0, "users/suggested/intl_tribe"

    .line 22
    .line 23
    const/4 p1, 0x0

    .line 24
    invoke-virtual {p2, p0, p1, v0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public final V3(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->E(Ljava/util/List;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance p1, Ll/ob9;

    .line 6
    .line 7
    invoke-direct {p1}, Ll/ob9;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {p0, p1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public W3(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance v0, Ll/qb9;

    .line 9
    .line 10
    invoke-direct {v0, p1}, Ll/qb9;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/n;->X3(Ll/qcj;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public X3(Ll/qcj;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qcj<",
            "Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/n;->Y:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/n;->Y:Lrx/subjects/a;

    .line 10
    .line 11
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 18
    .line 19
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/n;->Y:Lrx/subjects/a;

    .line 26
    .line 27
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 34
    .line 35
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v1, :cond_1

    .line 44
    .line 45
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    check-cast v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 50
    .line 51
    invoke-interface {p1, v1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    check-cast v2, Ljava/lang/Boolean;

    .line 56
    .line 57
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    if-eqz v2, :cond_0

    .line 62
    .line 63
    iget-object p1, p0, Lcom/p1/mobile/putong/core/api/n;->X:Ljava/util/HashSet;

    .line 64
    .line 65
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {p1, v1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 71
    .line 72
    .line 73
    iget-object p1, p0, Lcom/p1/mobile/putong/core/api/n;->Y:Lrx/subjects/a;

    .line 74
    .line 75
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    check-cast p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 80
    .line 81
    const/4 v0, 0x1

    .line 82
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/data/PartialListOpt;->setRefreshValue(Z)V

    .line 83
    .line 84
    .line 85
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/n;->Y:Lrx/subjects/a;

    .line 86
    .line 87
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    check-cast p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 92
    .line 93
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 94
    .line 95
    .line 96
    :cond_1
    return-void
.end method

.method public Y3(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/n;->Y:Lrx/subjects/a;

    .line 11
    .line 12
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/n;->Y:Lrx/subjects/a;

    .line 19
    .line 20
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 25
    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 27
    .line 28
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_2

    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/n;->Y:Lrx/subjects/a;

    .line 35
    .line 36
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 43
    .line 44
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-eqz v1, :cond_2

    .line 53
    .line 54
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    check-cast v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 59
    .line 60
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    if-eqz v2, :cond_1

    .line 65
    .line 66
    iget-object v2, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 67
    .line 68
    invoke-interface {p1, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    if-eqz v2, :cond_1

    .line 73
    .line 74
    iget-object v2, p0, Lcom/p1/mobile/putong/core/api/n;->X:Ljava/util/HashSet;

    .line 75
    .line 76
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {v2, v1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 82
    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_2
    :goto_1
    return-void
.end method

.method public Z3(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/n;->Y:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_4

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/n;->Y:Lrx/subjects/a;

    .line 11
    .line 12
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 19
    .line 20
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_4

    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/n;->Y:Lrx/subjects/a;

    .line 27
    .line 28
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 33
    .line 34
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-eqz v2, :cond_3

    .line 45
    .line 46
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    check-cast v2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 51
    .line 52
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    if-eqz v3, :cond_0

    .line 57
    .line 58
    invoke-virtual {v2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    if-nez v3, :cond_2

    .line 63
    .line 64
    iget-object v3, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 65
    .line 66
    iget-object v4, v2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 67
    .line 68
    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 69
    .line 70
    .line 71
    move-result v3

    .line 72
    if-eqz v3, :cond_1

    .line 73
    .line 74
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isVirtualCard()Z

    .line 75
    .line 76
    .line 77
    move-result v3

    .line 78
    if-eqz v3, :cond_2

    .line 79
    .line 80
    :cond_1
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isVirtualCard()Z

    .line 81
    .line 82
    .line 83
    move-result v3

    .line 84
    if-eqz v3, :cond_0

    .line 85
    .line 86
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isVirtualCard()Z

    .line 87
    .line 88
    .line 89
    move-result v3

    .line 90
    if-eqz v3, :cond_0

    .line 91
    .line 92
    iget-object v3, v2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 93
    .line 94
    iget-object v4, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 95
    .line 96
    if-ne v3, v4, :cond_0

    .line 97
    .line 98
    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 99
    .line 100
    .line 101
    iget-object p1, p0, Lcom/p1/mobile/putong/core/api/n;->Y:Lrx/subjects/a;

    .line 102
    .line 103
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    check-cast p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 108
    .line 109
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 110
    .line 111
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 112
    .line 113
    .line 114
    new-instance p1, Ljava/lang/StringBuilder;

    .line 115
    .line 116
    const-string v0, "moment \u5220\u9664List\u6570\u636e\uff1a"

    .line 117
    .line 118
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    iget-object v0, v2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 122
    .line 123
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    const-string v0, ", "

    .line 127
    .line 128
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/n;->Y:Lrx/subjects/a;

    .line 132
    .line 133
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    check-cast v0, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 138
    .line 139
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 140
    .line 141
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    const-string v0, "BifrostLayout"

    .line 153
    .line 154
    invoke-static {v0, p1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    const/4 v1, 0x1

    .line 158
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/api/n;->Y:Lrx/subjects/a;

    .line 159
    .line 160
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 161
    .line 162
    .line 163
    move-result-object p1

    .line 164
    check-cast p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 165
    .line 166
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/n;->Y:Lrx/subjects/a;

    .line 167
    .line 168
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    check-cast v0, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 173
    .line 174
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 175
    .line 176
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 177
    .line 178
    .line 179
    move-result v0

    .line 180
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/data/PartialListOpt;->setRefreshValue(Z)V

    .line 181
    .line 182
    .line 183
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/n;->Y:Lrx/subjects/a;

    .line 184
    .line 185
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 186
    .line 187
    .line 188
    move-result-object p1

    .line 189
    check-cast p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 190
    .line 191
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 192
    .line 193
    .line 194
    :cond_4
    return v1
.end method

.method public a4()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/n;->Z:Lrx/subjects/b;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public b4()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/n;->a0:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public c4(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/data/PartialListOpt<",
            "Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/n;->Y:Lrx/subjects/a;

    .line 2
    .line 3
    new-instance v1, Ll/rb9;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1, p2}, Ll/rb9;-><init>(Lcom/p1/mobile/putong/core/api/n;Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lrx/c;->doOnSubscribe(Ll/x20;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    new-instance p1, Ll/vb9;

    .line 13
    .line 14
    invoke-direct {p1}, Ll/vb9;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public d4(Ljava/util/Map;Ljava/lang/String;)Lrx/c;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Relationship;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/n;->U:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/n;->V:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->clone()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 14
    .line 15
    .line 16
    move-result-object v5

    .line 17
    new-instance v3, Lcom/p1/mobile/putong/data/Relationship;

    .line 18
    .line 19
    invoke-direct {v3}, Lcom/p1/mobile/putong/data/Relationship;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object p2, v3, Lcom/p1/mobile/putong/data/Relationship;->localLikeFrom:Ljava/lang/String;

    .line 23
    .line 24
    const-string p2, "default"

    .line 25
    .line 26
    invoke-static {p2}, Lcom/p1/mobile/putong/data/RelationshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    iput-object p2, v3, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 33
    .line 34
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 35
    .line 36
    iget-object v0, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {p2, v0}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_1

    .line 47
    .line 48
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->ussTracker:Ljava/lang/String;

    .line 49
    .line 50
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-nez v0, :cond_1

    .line 55
    .line 56
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->ussTracker:Ljava/lang/String;

    .line 57
    .line 58
    iput-object p2, v3, Lcom/p1/mobile/putong/data/Relationship;->ussTracker:Ljava/lang/String;

    .line 59
    .line 60
    :cond_1
    iget-object p2, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 61
    .line 62
    new-instance v0, Ll/wb9;

    .line 63
    .line 64
    move-object v1, p0

    .line 65
    move-object v4, p1

    .line 66
    invoke-direct/range {v0 .. v5}, Ll/wb9;-><init>(Lcom/p1/mobile/putong/core/api/n;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Relationship;Ljava/util/Map;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V

    .line 67
    .line 68
    .line 69
    const-string p0, "undo_theme_slide"

    .line 70
    .line 71
    const/4 p1, -0x1

    .line 72
    invoke-virtual {p2, p0, p1, v0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    return-object p0
.end method

.method public w3()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/putong/core/api/n;->U:Lcom/p1/mobile/putong/data/User;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/core/api/n;->V:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    iput v0, p0, Lcom/p1/mobile/putong/core/api/n;->b0:I

    .line 8
    .line 9
    return-void
.end method

.method public x3()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    const-string v1, "users/suggested/intl_tribe"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-virtual {v0, v1, v2}, Lcom/tantanapp/common/network/RunnerProxy;->clearRequests(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    const-string v1, "users/suggested/intl_tribe/insert"

    .line 12
    .line 13
    invoke-virtual {v0, v1, v2}, Lcom/tantanapp/common/network/RunnerProxy;->clearRequests(Ljava/lang/String;I)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/n;->X:Ljava/util/HashSet;

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/util/HashSet;->clear()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final y3(ZZLcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Ljava/lang/String;)Lcom/p1/mobile/putong/data/Relationship;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/Relationship;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/Relationship;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p4, p0, Lcom/p1/mobile/putong/data/Relationship;->localLikeFrom:Ljava/lang/String;

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    const-string p1, "liked"

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const-string p1, "disliked"

    .line 14
    .line 15
    :goto_0
    invoke-static {p1}, Lcom/p1/mobile/putong/data/RelationshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 20
    .line 21
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 24
    .line 25
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p1, p3}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    new-instance p3, Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    .line 34
    .line 35
    .line 36
    if-eqz p2, :cond_1

    .line 37
    .line 38
    const-string p2, "superLiked"

    .line 39
    .line 40
    invoke-static {p2}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    invoke-interface {p3, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 48
    .line 49
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 50
    .line 51
    const-string p4, "superLike"

    .line 52
    .line 53
    invoke-static {p4}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 54
    .line 55
    .line 56
    move-result-object p4

    .line 57
    invoke-virtual {p2, p4}, Ll/lqb;->s4(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    iput-object p2, p0, Lcom/p1/mobile/putong/data/Relationship;->coinSign:Ljava/lang/String;

    .line 62
    .line 63
    :cond_1
    iput-object p3, p0, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 64
    .line 65
    if-eqz p1, :cond_4

    .line 66
    .line 67
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->ussTracker:Ljava/lang/String;

    .line 68
    .line 69
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 70
    .line 71
    .line 72
    move-result p2

    .line 73
    if-nez p2, :cond_2

    .line 74
    .line 75
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->ussTracker:Ljava/lang/String;

    .line 76
    .line 77
    iput-object p2, p0, Lcom/p1/mobile/putong/data/Relationship;->ussTracker:Ljava/lang/String;

    .line 78
    .line 79
    :cond_2
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->ussTags:Lcom/p1/mobile/putong/data/UssTags;

    .line 80
    .line 81
    if-eqz p2, :cond_3

    .line 82
    .line 83
    iget-object p2, p2, Lcom/p1/mobile/putong/data/UssTags;->avatarIdentifier:Ljava/lang/String;

    .line 84
    .line 85
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 86
    .line 87
    .line 88
    move-result p2

    .line 89
    if-nez p2, :cond_3

    .line 90
    .line 91
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->ussTags:Lcom/p1/mobile/putong/data/UssTags;

    .line 92
    .line 93
    iget-object p2, p2, Lcom/p1/mobile/putong/data/UssTags;->avatarIdentifier:Ljava/lang/String;

    .line 94
    .line 95
    iput-object p2, p0, Lcom/p1/mobile/putong/data/Relationship;->avatarIdentifier:Ljava/lang/String;

    .line 96
    .line 97
    :cond_3
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->anonymousLike:Lcom/p1/mobile/putong/data/AnonymousLikeInfo;

    .line 98
    .line 99
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result p2

    .line 103
    if-eqz p2, :cond_4

    .line 104
    .line 105
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->anonymousLike:Lcom/p1/mobile/putong/data/AnonymousLikeInfo;

    .line 106
    .line 107
    iget-object p1, p1, Lcom/p1/mobile/putong/data/AnonymousLikeInfo;->itemId:Ljava/lang/String;

    .line 108
    .line 109
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Relationship;->anonymousLikeItemId:Ljava/lang/String;

    .line 110
    .line 111
    :cond_4
    return-object p0
.end method

.method public final z3(Lcom/p1/mobile/putong/data/Relationship;)Ljava/lang/Long;
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 v0, 0x0

    .line 8
    const/4 v1, 0x1

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 12
    .line 13
    const-string v2, "superLiked"

    .line 14
    .line 15
    invoke-static {v2}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-interface {p0, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    move p0, v1

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    move p0, v0

    .line 28
    :goto_0
    if-eqz p0, :cond_1

    .line 29
    .line 30
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {v2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->ig()Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    if-eqz v2, :cond_1

    .line 43
    .line 44
    move v0, v1

    .line 45
    :cond_1
    invoke-static {v0}, Ll/lqb;->i4(Z)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iput-object v0, p1, Lcom/p1/mobile/putong/data/Relationship;->consumeType:Ljava/lang/String;

    .line 50
    .line 51
    if-eqz p0, :cond_2

    .line 52
    .line 53
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 54
    .line 55
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 56
    .line 57
    const-string p1, "superLike"

    .line 58
    .line 59
    invoke-static {p1}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-virtual {p0, v0, p1}, Ll/lqb;->s5(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Ljava/lang/Long;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    return-object p0

    .line 68
    :cond_2
    const/4 p0, 0x0

    .line 69
    return-object p0
.end method
