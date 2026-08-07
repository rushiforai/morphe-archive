.class public Ll/cla0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/ima0;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public final b:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ll/pf60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pf60<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Literatures;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LiteraturesComments;",
            ">;>;"
        }
    .end annotation
.end field

.field public final d:Ll/zq90;

.field public final e:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalImpl;

.field public f:Lcom/p1/mobile/putong/data/User;

.field public g:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;

.field public h:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public constructor <init>(Ll/ner;Ll/zq90;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/cla0;->a:Lrx/subjects/a;

    .line 9
    .line 10
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Ll/cla0;->b:Lrx/subjects/a;

    .line 15
    .line 16
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalImpl;

    .line 17
    .line 18
    iput-object p1, p0, Ll/cla0;->e:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalImpl;

    .line 19
    .line 20
    iput-object p2, p0, Ll/cla0;->d:Ll/zq90;

    .line 21
    .line 22
    return-void
.end method

.method public static synthetic A0(Ll/cla0;Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cla0;->s2(Ljava/lang/Long;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic B1(Ll/cla0;ILandroid/content/Intent;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/cla0;->Y1(ILandroid/content/Intent;Lcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method

.method public static synthetic C0(Ll/cla0;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cla0;->L2(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic C1()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic D0(Ll/cla0;ZZLcom/p1/mobile/putong/data/Relationship;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/cla0;->i2(ZZLcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method

.method public static synthetic E0(Ll/cla0;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cla0;->w2(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic F0(Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->s1:Lcom/p1/mobile/putong/core/api/p;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/p;->s3()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method private F1()V
    .locals 3
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/cla0;->e:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalImpl;

    .line 2
    .line 3
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalImpl;->E:Z

    .line 4
    .line 5
    const-string v1, "[core][profile]"

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string v0, "afterGetUserInfo return by Page Animation"

    .line 10
    .line 11
    invoke-static {v1, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/cla0;->e:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalImpl;

    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalImpl;->F:Z

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    const-string v0, "afterGetUserInfo refresh list"

    .line 21
    .line 22
    invoke-static {v1, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    new-instance v0, Ljava/lang/Object;

    .line 26
    .line 27
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;->AFTER_GET_USER_INFO:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;

    .line 35
    .line 36
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->logBegin(ILcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;)V

    .line 37
    .line 38
    .line 39
    const/4 v2, 0x0

    .line 40
    invoke-direct {p0, v2}, Ll/cla0;->T2(I)V

    .line 41
    .line 42
    .line 43
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 44
    .line 45
    check-cast v2, Ll/ima0;

    .line 46
    .line 47
    invoke-virtual {v2}, Ll/ima0;->T0()V

    .line 48
    .line 49
    .line 50
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 51
    .line 52
    check-cast v2, Ll/ima0;

    .line 53
    .line 54
    invoke-virtual {v2}, Ll/ima0;->Q0()V

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 58
    .line 59
    check-cast p0, Ll/ima0;

    .line 60
    .line 61
    invoke-virtual {p0}, Ll/ima0;->P0()V

    .line 62
    .line 63
    .line 64
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->logEnd(ILcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public static synthetic G0(Ll/cla0;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cla0;->D2()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic H0(Ll/cla0;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cla0;->x2()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic I0(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    return-object p0
.end method

.method private I1(I)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eq p1, v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object p1, p0, Ll/cla0;->d:Ll/zq90;

    .line 11
    .line 12
    invoke-virtual {p1}, Ll/zq90;->b()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iget-object v0, p0, Ll/cla0;->d:Ll/zq90;

    .line 17
    .line 18
    iget-object v0, v0, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 19
    .line 20
    invoke-static {p1, v0}, Ll/br5;->o(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-nez p1, :cond_1

    .line 25
    .line 26
    :goto_0
    return-void

    .line 27
    :cond_1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 30
    .line 31
    iget-object p0, p0, Ll/cla0;->d:Ll/zq90;

    .line 32
    .line 33
    iget-object p0, p0, Ll/zq90;->d:Ljava/lang/String;

    .line 34
    .line 35
    const/4 v0, 0x0

    .line 36
    invoke-virtual {p1, p0, v0}, Lcom/p1/mobile/putong/core/api/g;->wo(Ljava/lang/String;Z)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    new-instance p1, Ll/ska0;

    .line 41
    .line 42
    invoke-direct {p1}, Ll/ska0;-><init>()V

    .line 43
    .line 44
    .line 45
    new-instance v0, Ll/tka0;

    .line 46
    .line 47
    invoke-direct {v0}, Ll/tka0;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-static {p1, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public static synthetic J0(Ll/cla0;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cla0;->p2(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic L0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic N0(Ljava/lang/Boolean;)Lrx/c;
    .locals 2

    .line 1
    const-wide/16 v0, 0x1c2

    .line 2
    .line 3
    sget-object p0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 4
    .line 5
    invoke-static {v0, v1, p0}, Lrx/c;->timer(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic O0(Ll/cla0;Ljava/util/List;)Ll/pf60;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cla0;->I2(Ljava/util/List;)Ll/pf60;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic P0(Ll/cla0;ILandroid/content/Intent;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/cla0;->W1(ILandroid/content/Intent;Lcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method

.method private P1()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/yka0;

    .line 6
    .line 7
    invoke-direct {v1}, Ll/yka0;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/cla0;->a:Lrx/subjects/a;

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Lrx/c;->first()Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v1, Ll/tia0;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ll/tia0;-><init>(Ll/cla0;)V

    .line 38
    .line 39
    .line 40
    new-instance v2, Ll/zh0;

    .line 41
    .line 42
    invoke-direct {v2}, Ll/zh0;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ll/cla0;->a:Lrx/subjects/a;

    .line 53
    .line 54
    const-wide/16 v1, 0x1

    .line 55
    .line 56
    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 57
    .line 58
    invoke-virtual {v0, v1, v2, v3}, Lrx/c;->throttleLast(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    new-instance v1, Ll/uia0;

    .line 75
    .line 76
    invoke-direct {v1, p0}, Ll/uia0;-><init>(Ll/cla0;)V

    .line 77
    .line 78
    .line 79
    new-instance v2, Ll/zh0;

    .line 80
    .line 81
    invoke-direct {v2}, Ll/zh0;-><init>()V

    .line 82
    .line 83
    .line 84
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 89
    .line 90
    .line 91
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->getMomentLikeChangedSub()Lrx/subjects/b;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    new-instance v1, Ll/via0;

    .line 104
    .line 105
    invoke-direct {v1, p0}, Ll/via0;-><init>(Ll/cla0;)V

    .line 106
    .line 107
    .line 108
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 113
    .line 114
    .line 115
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 116
    .line 117
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 118
    .line 119
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/j;->s0:Lrx/subjects/a;

    .line 120
    .line 121
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    new-instance v1, Ll/wia0;

    .line 126
    .line 127
    invoke-direct {v1, p0}, Ll/wia0;-><init>(Ll/cla0;)V

    .line 128
    .line 129
    .line 130
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    new-instance v1, Ll/xia0;

    .line 135
    .line 136
    invoke-direct {v1, p0}, Ll/xia0;-><init>(Ll/cla0;)V

    .line 137
    .line 138
    .line 139
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 144
    .line 145
    .line 146
    sget-object v0, Lcom/p1/mobile/putong/core/api/p;->f0:Lrx/subjects/a;

    .line 147
    .line 148
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    new-instance v1, Ll/zia0;

    .line 153
    .line 154
    invoke-direct {v1}, Ll/zia0;-><init>()V

    .line 155
    .line 156
    .line 157
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 158
    .line 159
    .line 160
    move-result-object v1

    .line 161
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 162
    .line 163
    .line 164
    sget-object v0, Lcom/p1/mobile/putong/core/api/p;->g0:Lrx/subjects/a;

    .line 165
    .line 166
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    new-instance v1, Ll/aja0;

    .line 171
    .line 172
    invoke-direct {v1}, Ll/aja0;-><init>()V

    .line 173
    .line 174
    .line 175
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 176
    .line 177
    .line 178
    move-result-object v1

    .line 179
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 180
    .line 181
    .line 182
    iget-object v0, p0, Ll/cla0;->d:Ll/zq90;

    .line 183
    .line 184
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 185
    .line 186
    invoke-static {v0}, Ll/zbj;->a(Ljava/lang/String;)Z

    .line 187
    .line 188
    .line 189
    move-result v0

    .line 190
    if-nez v0, :cond_0

    .line 191
    .line 192
    invoke-direct {p0}, Ll/cla0;->U1()Z

    .line 193
    .line 194
    .line 195
    move-result v0

    .line 196
    if-nez v0, :cond_0

    .line 197
    .line 198
    iget-object v0, p0, Ll/cla0;->d:Ll/zq90;

    .line 199
    .line 200
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 201
    .line 202
    const-string v1, "liked_users_anchor"

    .line 203
    .line 204
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 205
    .line 206
    .line 207
    move-result v0

    .line 208
    if-nez v0, :cond_0

    .line 209
    .line 210
    iget-object v0, p0, Ll/cla0;->d:Ll/zq90;

    .line 211
    .line 212
    invoke-virtual {v0}, Ll/zq90;->H()Z

    .line 213
    .line 214
    .line 215
    move-result v0

    .line 216
    if-nez v0, :cond_0

    .line 217
    .line 218
    iget-object v0, p0, Ll/cla0;->d:Ll/zq90;

    .line 219
    .line 220
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 221
    .line 222
    const-string v1, "from_greet_act"

    .line 223
    .line 224
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 225
    .line 226
    .line 227
    move-result v0

    .line 228
    if-eqz v0, :cond_1

    .line 229
    .line 230
    :cond_0
    iget-object v0, p0, Ll/cla0;->d:Ll/zq90;

    .line 231
    .line 232
    invoke-virtual {v0}, Ll/zq90;->K()Z

    .line 233
    .line 234
    .line 235
    move-result v0

    .line 236
    if-nez v0, :cond_1

    .line 237
    .line 238
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 239
    .line 240
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 241
    .line 242
    iget-object v1, p0, Ll/cla0;->d:Ll/zq90;

    .line 243
    .line 244
    iget-object v1, v1, Ll/zq90;->d:Ljava/lang/String;

    .line 245
    .line 246
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->Ue(Ljava/lang/String;)Lrx/c;

    .line 247
    .line 248
    .line 249
    move-result-object v0

    .line 250
    new-instance v1, Ll/zka0;

    .line 251
    .line 252
    invoke-direct {v1}, Ll/zka0;-><init>()V

    .line 253
    .line 254
    .line 255
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 256
    .line 257
    .line 258
    move-result-object v0

    .line 259
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 260
    .line 261
    .line 262
    move-result-object v0

    .line 263
    new-instance v1, Ll/ala0;

    .line 264
    .line 265
    invoke-direct {v1, p0}, Ll/ala0;-><init>(Ll/cla0;)V

    .line 266
    .line 267
    .line 268
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 269
    .line 270
    .line 271
    move-result-object v1

    .line 272
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 273
    .line 274
    .line 275
    :cond_1
    new-instance v0, Ll/bla0;

    .line 276
    .line 277
    invoke-direct {v0, p0}, Ll/bla0;-><init>(Ll/cla0;)V

    .line 278
    .line 279
    .line 280
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Ll/pcj;)Lrx/c;

    .line 281
    .line 282
    .line 283
    move-result-object v0

    .line 284
    new-instance v1, Ll/oia0;

    .line 285
    .line 286
    invoke-direct {v1}, Ll/oia0;-><init>()V

    .line 287
    .line 288
    .line 289
    new-instance v2, Ll/pia0;

    .line 290
    .line 291
    invoke-direct {v2, p0}, Ll/pia0;-><init>(Ll/cla0;)V

    .line 292
    .line 293
    .line 294
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 295
    .line 296
    .line 297
    move-result-object v1

    .line 298
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 299
    .line 300
    .line 301
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 302
    .line 303
    .line 304
    move-result-object v0

    .line 305
    new-instance v1, Ll/qia0;

    .line 306
    .line 307
    invoke-direct {v1, p0}, Ll/qia0;-><init>(Ll/cla0;)V

    .line 308
    .line 309
    .line 310
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 311
    .line 312
    .line 313
    move-result-object v1

    .line 314
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 315
    .line 316
    .line 317
    new-instance v0, Ll/ria0;

    .line 318
    .line 319
    invoke-direct {v0, p0}, Ll/ria0;-><init>(Ll/cla0;)V

    .line 320
    .line 321
    .line 322
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Ll/pcj;)Lrx/c;

    .line 323
    .line 324
    .line 325
    move-result-object v0

    .line 326
    new-instance v1, Ll/sia0;

    .line 327
    .line 328
    invoke-direct {v1}, Ll/sia0;-><init>()V

    .line 329
    .line 330
    .line 331
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 332
    .line 333
    .line 334
    move-result-object v1

    .line 335
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 336
    .line 337
    .line 338
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 339
    .line 340
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->d0:Ll/kua;

    .line 341
    .line 342
    invoke-virtual {v0}, Ll/kua;->j3()Lrx/c;

    .line 343
    .line 344
    .line 345
    move-result-object v0

    .line 346
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 347
    .line 348
    .line 349
    move-result-object v0

    .line 350
    invoke-static {}, Ll/psd0;->B()Ll/gcg0;

    .line 351
    .line 352
    .line 353
    move-result-object v1

    .line 354
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/gcg0;)Ll/kcg0;

    .line 355
    .line 356
    .line 357
    invoke-virtual {p0}, Ll/cla0;->O1()V

    .line 358
    .line 359
    .line 360
    return-void
.end method

.method public static synthetic Q0(Ll/cla0;Lcom/p1/mobile/putong/data/RelationshipStatus;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cla0;->H2(Lcom/p1/mobile/putong/data/RelationshipStatus;)V

    return-void
.end method

.method private Q1()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cla0;->d:Ll/zq90;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/zq90;->K()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    new-instance v0, Ll/fka0;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/fka0;-><init>(Ll/cla0;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Ll/pcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/qka0;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/qka0;-><init>(Ll/cla0;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static synthetic R0(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method private R1()V
    .locals 2

    .line 1
    new-instance v0, Ll/nia0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/nia0;-><init>(Ll/cla0;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 12
    .line 13
    iget-object v1, p0, Ll/cla0;->d:Ll/zq90;

    .line 14
    .line 15
    iget-object v1, v1, Ll/zq90;->d:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ll/yia0;

    .line 26
    .line 27
    invoke-direct {v1}, Ll/yia0;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    new-instance v1, Ll/jja0;

    .line 39
    .line 40
    invoke-direct {v1, p0}, Ll/jja0;-><init>(Ll/cla0;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    new-instance v1, Ll/uja0;

    .line 48
    .line 49
    invoke-direct {v1, p0}, Ll/uja0;-><init>(Ll/cla0;)V

    .line 50
    .line 51
    .line 52
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public static synthetic S0(Ll/cla0;Lcom/p1/mobile/putong/data/PicVerification;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cla0;->B2(Lcom/p1/mobile/putong/data/PicVerification;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method private S1()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/cla0;->d:Ll/zq90;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/zq90;->Q()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 12
    .line 13
    iget-object v1, p0, Ll/cla0;->d:Ll/zq90;

    .line 14
    .line 15
    iget-object v1, v1, Ll/zq90;->d:Ljava/lang/String;

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    const/4 v3, 0x1

    .line 19
    invoke-virtual {v0, v1, v2, v3}, Ll/dkb;->Y9(Ljava/lang/String;ZZ)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/fja0;

    .line 24
    .line 25
    invoke-direct {v1}, Ll/fja0;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ll/hja0;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Ll/hja0;-><init>(Ll/cla0;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    new-instance v1, Ll/ija0;

    .line 46
    .line 47
    invoke-direct {v1, p0}, Ll/ija0;-><init>(Ll/cla0;)V

    .line 48
    .line 49
    .line 50
    new-instance v2, Ll/kja0;

    .line 51
    .line 52
    invoke-direct {v2}, Ll/kja0;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 60
    .line 61
    .line 62
    :cond_0
    iget-object v0, p0, Ll/cla0;->d:Ll/zq90;

    .line 63
    .line 64
    invoke-virtual {v0}, Ll/zq90;->K()Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-eqz v0, :cond_1

    .line 69
    .line 70
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 71
    .line 72
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 73
    .line 74
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    new-instance v1, Ll/lja0;

    .line 87
    .line 88
    invoke-direct {v1, p0}, Ll/lja0;-><init>(Ll/cla0;)V

    .line 89
    .line 90
    .line 91
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :cond_1
    iget-object v0, p0, Ll/cla0;->d:Ll/zq90;

    .line 100
    .line 101
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 102
    .line 103
    invoke-static {v0}, Ll/zbj;->a(Ljava/lang/String;)Z

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    if-eqz v0, :cond_2

    .line 108
    .line 109
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 110
    .line 111
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    new-instance v1, Ll/mja0;

    .line 120
    .line 121
    invoke-direct {v1, p0}, Ll/mja0;-><init>(Ll/cla0;)V

    .line 122
    .line 123
    .line 124
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 129
    .line 130
    .line 131
    :cond_2
    new-instance v0, Ll/nja0;

    .line 132
    .line 133
    invoke-direct {v0, p0}, Ll/nja0;-><init>(Ll/cla0;)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Ll/pcj;)Lrx/c;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    new-instance v1, Ll/oja0;

    .line 145
    .line 146
    invoke-direct {v1, p0}, Ll/oja0;-><init>(Ll/cla0;)V

    .line 147
    .line 148
    .line 149
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 154
    .line 155
    .line 156
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 157
    .line 158
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 159
    .line 160
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/j;->v5()Lrx/c;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    new-instance v1, Ll/pja0;

    .line 169
    .line 170
    invoke-direct {v1, p0}, Ll/pja0;-><init>(Ll/cla0;)V

    .line 171
    .line 172
    .line 173
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    new-instance v1, Ll/qja0;

    .line 178
    .line 179
    invoke-direct {v1}, Ll/qja0;-><init>()V

    .line 180
    .line 181
    .line 182
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    new-instance v1, Ll/gja0;

    .line 187
    .line 188
    invoke-direct {v1, p0}, Ll/gja0;-><init>(Ll/cla0;)V

    .line 189
    .line 190
    .line 191
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 192
    .line 193
    .line 194
    move-result-object p0

    .line 195
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 196
    .line 197
    .line 198
    return-void
.end method

.method private S2(I)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-ne p1, v0, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/cla0;->d:Ll/zq90;

    .line 10
    .line 11
    invoke-virtual {p1}, Ll/zq90;->x()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/cla0;->d:Ll/zq90;

    .line 18
    .line 19
    iget-object p0, p0, Ll/zq90;->d:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {p0}, Ll/gr90;->b(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method private T2(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cla0;->d:Ll/zq90;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/zq90;->K()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/cla0;->d:Ll/zq90;

    .line 10
    .line 11
    iget-object v0, v0, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 20
    .line 21
    check-cast v0, Ll/ima0;

    .line 22
    .line 23
    invoke-virtual {v0, p1}, Ll/ima0;->X0(I)V

    .line 24
    .line 25
    .line 26
    :cond_0
    const/4 v0, 0x3

    .line 27
    if-eq p1, v0, :cond_2

    .line 28
    .line 29
    const/4 v0, 0x2

    .line 30
    if-ne p1, v0, :cond_1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    return-void

    .line 34
    :cond_2
    :goto_0
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 35
    .line 36
    check-cast p1, Ll/ima0;

    .line 37
    .line 38
    iget-object p1, p1, Ll/ima0;->o:Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;

    .line 39
    .line 40
    new-instance v0, Ll/oka0;

    .line 41
    .line 42
    invoke-direct {v0, p0}, Ll/oka0;-><init>(Ll/cla0;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1, v0}, Ll/on2;->b(Ll/x20;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public static synthetic U0(Ll/cla0;ILandroid/content/Intent;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/cla0;->e2(ILandroid/content/Intent;Ljava/lang/Throwable;)V

    return-void
.end method

.method private U1()Z
    .locals 4

    .line 1
    iget-object v0, p0, Ll/cla0;->d:Ll/zq90;

    .line 2
    .line 3
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 4
    .line 5
    const-string v1, "from_portrait_like_list"

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x1

    .line 12
    if-nez v0, :cond_4

    .line 13
    .line 14
    iget-object v0, p0, Ll/cla0;->d:Ll/zq90;

    .line 15
    .line 16
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 17
    .line 18
    const-string v2, "from_mew_tags"

    .line 19
    .line 20
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_4

    .line 25
    .line 26
    iget-object v0, p0, Ll/cla0;->d:Ll/zq90;

    .line 27
    .line 28
    invoke-virtual {v0}, Ll/zq90;->k()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_4

    .line 33
    .line 34
    iget-object v0, p0, Ll/cla0;->d:Ll/zq90;

    .line 35
    .line 36
    invoke-virtual {v0}, Ll/zq90;->m()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-nez v0, :cond_4

    .line 41
    .line 42
    iget-object v0, p0, Ll/cla0;->d:Ll/zq90;

    .line 43
    .line 44
    invoke-virtual {v0}, Ll/zq90;->i()Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-nez v0, :cond_4

    .line 49
    .line 50
    iget-object v0, p0, Ll/cla0;->d:Ll/zq90;

    .line 51
    .line 52
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 53
    .line 54
    const-string v2, "from_literature_third"

    .line 55
    .line 56
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_0

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_0
    invoke-static {}, Ll/gra;->V1()Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    const/4 v2, 0x0

    .line 68
    if-eqz v0, :cond_3

    .line 69
    .line 70
    iget-object v0, p0, Ll/cla0;->d:Ll/zq90;

    .line 71
    .line 72
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 73
    .line 74
    const-string v3, "chat_group"

    .line 75
    .line 76
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-nez v0, :cond_2

    .line 81
    .line 82
    iget-object v0, p0, Ll/cla0;->d:Ll/zq90;

    .line 83
    .line 84
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 85
    .line 86
    const-string v3, "chat_group_anonymity"

    .line 87
    .line 88
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-nez v0, :cond_2

    .line 93
    .line 94
    iget-object v0, p0, Ll/cla0;->d:Ll/zq90;

    .line 95
    .line 96
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 97
    .line 98
    const-string v3, "group_notification"

    .line 99
    .line 100
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    if-nez v0, :cond_2

    .line 105
    .line 106
    iget-object p0, p0, Ll/cla0;->d:Ll/zq90;

    .line 107
    .line 108
    iget-object p0, p0, Ll/zq90;->b:Ljava/lang/String;

    .line 109
    .line 110
    const-string v0, "group_notification_anonymity"

    .line 111
    .line 112
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    move-result p0

    .line 116
    if-eqz p0, :cond_1

    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_1
    return v2

    .line 120
    :cond_2
    :goto_0
    return v1

    .line 121
    :cond_3
    return v2

    .line 122
    :cond_4
    :goto_1
    return v1
.end method

.method public static synthetic V0(Ll/cla0;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cla0;->E2(Ll/pf60;)V

    return-void
.end method

.method public static synthetic W0(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic X0(Ll/cla0;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cla0;->l2(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic Y0(Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->s1:Lcom/p1/mobile/putong/core/api/p;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/p;->s3()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method private Y2(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cla0;->f:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    return-void
.end method

.method public static synthetic a1()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b1(Ll/cla0;ILandroid/content/Intent;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/cla0;->X1(ILandroid/content/Intent;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic c1(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    sget-object v0, Ll/uqb0;->k0:Ll/vj5;

    .line 2
    .line 3
    iget-object v0, v0, Ll/vj5;->d:Ll/ejk0;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic d1(Ll/cla0;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/cla0;->g2(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic e0(Ll/cla0;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/cla0;->h2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e1(Ll/cla0;Ljava/util/List;)Ll/pf60;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cla0;->P2(Ljava/util/List;)Ll/pf60;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic f0(Ll/cla0;ILandroid/content/Intent;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/cla0;->d2(ILandroid/content/Intent;Lcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method

.method public static synthetic f1(Ll/cla0;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cla0;->u2()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic g0(Ll/cla0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cla0;->q2(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic g1(Ll/pf60;)Lcom/p1/mobile/putong/data/RelationshipStatus;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 4
    .line 5
    return-object p0
.end method

.method public static synthetic h0(Ll/cla0;Ljava/lang/Long;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cla0;->t2(Ljava/lang/Long;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic h1(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/PicVerification;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic i0(Ll/cla0;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cla0;->z2(Ll/bkj0;)V

    return-void
.end method

.method public static synthetic i1(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic j0(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic j1(Ll/cla0;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/cla0;->r2(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic k0(Ll/cla0;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cla0;->n2(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic k1(Ll/cla0;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/cla0;->c2(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method

.method public static synthetic l0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic l1(Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Conversation;->needCheckValidStatus()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public static synthetic m0(Ll/cla0;ILandroid/content/Intent;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/cla0;->f2(ILandroid/content/Intent;Lcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method

.method public static synthetic m1(Ll/cla0;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cla0;->Q2(Ll/pf60;)V

    return-void
.end method

.method private synthetic m2(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/cla0;->F1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic n0(Ll/cla0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cla0;->N2()V

    return-void
.end method

.method public static synthetic n1(Ll/cla0;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cla0;->o2(Ll/pf60;)V

    return-void
.end method

.method public static synthetic o0(Ll/cla0;ILandroid/content/Intent;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/cla0;->Z1(ILandroid/content/Intent;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic o1(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic p0(Ljava/lang/Boolean;)Lrx/c;
    .locals 2

    .line 1
    const-wide/16 v0, 0x1c2

    .line 2
    .line 3
    sget-object p0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 4
    .line 5
    invoke-static {v0, v1, p0}, Lrx/c;->timer(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic p1(Ll/cla0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cla0;->a2()V

    return-void
.end method

.method public static synthetic q0(Ll/cla0;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cla0;->k2(Z)V

    return-void
.end method

.method public static synthetic q1(Ll/cla0;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/cla0;->b2(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method

.method public static synthetic r0(Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/app/c;->c:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->logSingle(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic r1(Ll/cla0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cla0;->A2(Landroid/os/Bundle;)V

    return-void
.end method

.method private synthetic r2(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    const/4 p1, 0x2

    .line 2
    invoke-direct {p0, p1}, Ll/cla0;->T2(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic s0(Ljava/lang/Long;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/d0;->p4(Ljava/lang/String;)Lrx/c;

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic s1(Ll/cla0;ZLjava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/cla0;->j2(ZLjava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic t0(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic t1(Ll/cla0;Lcom/p1/mobile/putong/data/PicVerification;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cla0;->C2(Lcom/p1/mobile/putong/data/PicVerification;)V

    return-void
.end method

.method public static synthetic u0(Ll/cla0;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cla0;->J2(Ll/pf60;)V

    return-void
.end method

.method public static synthetic u1(Ll/cla0;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cla0;->M2(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic v1(Ll/cla0;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cla0;->K2(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic x0(Ll/cla0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cla0;->v2(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic x1(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic y0(Ll/cla0;Ll/pf60;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cla0;->F2(Ll/pf60;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic z0(Ll/cla0;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cla0;->y2()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic z1(Ll/cla0;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/cla0;->m2(Ll/uxj0;)V

    return-void
.end method


# virtual methods
.method public final synthetic A2(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/cla0;->d:Ll/zq90;

    .line 2
    .line 3
    iget-object p1, p1, Ll/zq90;->e:Ll/zq90$a;

    .line 4
    .line 5
    iget-object p1, p1, Ll/zq90$a;->k:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    invoke-direct {p0, p1}, Ll/cla0;->Y2(Lcom/p1/mobile/putong/data/User;)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Ll/cla0;->d:Ll/zq90;

    .line 11
    .line 12
    iget-object v0, p1, Ll/zq90;->e:Ll/zq90$a;

    .line 13
    .line 14
    iget-object v0, v0, Ll/zq90$a;->k:Lcom/p1/mobile/putong/data/User;

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Ll/zq90;->X(Lcom/p1/mobile/putong/data/User;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/cla0;->a:Lrx/subjects/a;

    .line 20
    .line 21
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final synthetic B2(Lcom/p1/mobile/putong/data/PicVerification;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cla0;->d:Ll/zq90;

    .line 2
    .line 3
    iget-object p0, p0, Ll/zq90;->e:Ll/zq90$a;

    .line 4
    .line 5
    iget-object p0, p0, Ll/zq90$a;->k:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/PicVerification;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    xor-int/lit8 p0, p0, 0x1

    .line 14
    .line 15
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public final synthetic C2(Lcom/p1/mobile/putong/data/PicVerification;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cla0;->d:Ll/zq90;

    .line 2
    .line 3
    iget-object v0, v0, Ll/zq90;->e:Ll/zq90$a;

    .line 4
    .line 5
    iget-object v0, v0, Ll/zq90$a;->k:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    iput-object p1, v0, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    .line 8
    .line 9
    iget-object p0, p0, Ll/cla0;->a:Lrx/subjects/a;

    .line 10
    .line 11
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public D1()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/ima0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/ima0;->Y()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/cla0;->d:Ll/zq90;

    .line 16
    .line 17
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v0}, Ll/tnt;->c(Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Ll/cla0;->e:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalImpl;

    .line 26
    .line 27
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalImpl;->D:Z

    .line 28
    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 32
    .line 33
    iget-object v0, v0, Ll/sre0;->c:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 34
    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    iget-object p0, p0, Ll/cla0;->d:Ll/zq90;

    .line 42
    .line 43
    iget-object p0, p0, Ll/zq90;->d:Ljava/lang/String;

    .line 44
    .line 45
    const/4 v2, 0x1

    .line 46
    invoke-interface {v0, v1, p0, v2}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Tc(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V

    .line 47
    .line 48
    .line 49
    :cond_0
    return-void
.end method

.method public final synthetic D2()Lrx/c;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object p0, p0, Ll/cla0;->d:Ll/zq90;

    .line 6
    .line 7
    iget-object p0, p0, Ll/zq90;->d:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/kda0;

    .line 22
    .line 23
    invoke-direct {v1}, Ll/kda0;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-static {p0, v0, v1}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public E1(I)V
    .locals 21

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p1

    .line 4
    .line 5
    invoke-direct/range {p0 .. p1}, Ll/cla0;->S2(I)V

    .line 6
    .line 7
    .line 8
    invoke-direct/range {p0 .. p1}, Ll/cla0;->I1(I)V

    .line 9
    .line 10
    .line 11
    iget-object v2, v0, Ll/cla0;->d:Ll/zq90;

    .line 12
    .line 13
    iget-object v3, v2, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    if-nez v3, :cond_0

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-virtual {v2}, Ll/zq90;->D()Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    sget-object v3, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 30
    .line 31
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    if-ne v1, v4, :cond_1

    .line 36
    .line 37
    invoke-static {}, Ll/h7d0;->m0()Z

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    if-eqz v4, :cond_1

    .line 42
    .line 43
    invoke-static {}, Ll/h7d0;->i0()Ll/h7d0;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    invoke-virtual {v4}, Ll/h7d0;->g0()Z

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    if-nez v4, :cond_1

    .line 52
    .line 53
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 54
    .line 55
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    .line 56
    .line 57
    .line 58
    move-result-object v4

    .line 59
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Counter;->superLikeLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 60
    .line 61
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;->remainToday()I

    .line 62
    .line 63
    .line 64
    move-result v4

    .line 65
    invoke-static {v4}, Ll/a5i0;->w0(I)I

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    if-nez v4, :cond_1

    .line 70
    .line 71
    sget-object v4, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_SUPERLIKE_PKG:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 72
    .line 73
    invoke-static {v4}, Ll/qj90;->b(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 74
    .line 75
    .line 76
    move-result v4

    .line 77
    if-nez v4, :cond_1

    .line 78
    .line 79
    if-nez v2, :cond_1

    .line 80
    .line 81
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 82
    .line 83
    .line 84
    move-result-object v5

    .line 85
    sget-object v7, Lcom/p1/mobile/putong/core/data/Privilege;->vip_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 86
    .line 87
    iget-object v0, v0, Ll/cla0;->d:Ll/zq90;

    .line 88
    .line 89
    iget-object v11, v0, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 90
    .line 91
    const-string v6, "p_profile,superlike"

    .line 92
    .line 93
    const/4 v8, 0x0

    .line 94
    const/4 v9, 0x0

    .line 95
    const/4 v10, 0x0

    .line 96
    invoke-static/range {v5 .. v11}, Lcom/p1/mobile/putong/core/ui/purchase/c;->M1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/x20;Ll/x20;ZLcom/p1/mobile/putong/data/User;)V

    .line 97
    .line 98
    .line 99
    return-void

    .line 100
    :cond_1
    iget-object v2, v0, Ll/ar2;->viewModel:Ll/iam;

    .line 101
    .line 102
    check-cast v2, Ll/ima0;

    .line 103
    .line 104
    invoke-virtual {v2}, Ll/ima0;->Y()V

    .line 105
    .line 106
    .line 107
    new-instance v2, Landroid/content/Intent;

    .line 108
    .line 109
    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    .line 110
    .line 111
    .line 112
    iget-object v4, v0, Ll/ar2;->viewModel:Ll/iam;

    .line 113
    .line 114
    check-cast v4, Ll/ima0;

    .line 115
    .line 116
    invoke-virtual {v4}, Ll/ima0;->S()I

    .line 117
    .line 118
    .line 119
    move-result v4

    .line 120
    const-string v5, "currentImageIndex"

    .line 121
    .line 122
    invoke-virtual {v2, v5, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 123
    .line 124
    .line 125
    iget-object v4, v0, Ll/ar2;->viewModel:Ll/iam;

    .line 126
    .line 127
    check-cast v4, Ll/ima0;

    .line 128
    .line 129
    invoke-virtual {v4}, Ll/ima0;->S()I

    .line 130
    .line 131
    .line 132
    move-result v4

    .line 133
    iget-object v5, v0, Ll/cla0;->d:Ll/zq90;

    .line 134
    .line 135
    iget-object v5, v5, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 136
    .line 137
    iget-object v5, v5, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 138
    .line 139
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 140
    .line 141
    .line 142
    move-result v5

    .line 143
    iget-object v6, v0, Ll/cla0;->d:Ll/zq90;

    .line 144
    .line 145
    const-string v7, "currentImageUrl"

    .line 146
    .line 147
    if-ge v4, v5, :cond_2

    .line 148
    .line 149
    iget-object v4, v6, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 150
    .line 151
    iget-object v4, v4, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 152
    .line 153
    iget-object v5, v0, Ll/ar2;->viewModel:Ll/iam;

    .line 154
    .line 155
    check-cast v5, Ll/ima0;

    .line 156
    .line 157
    invoke-virtual {v5}, Ll/ima0;->S()I

    .line 158
    .line 159
    .line 160
    move-result v5

    .line 161
    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    move-result-object v4

    .line 165
    check-cast v4, Lcom/p1/mobile/putong/data/Media;

    .line 166
    .line 167
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 168
    .line 169
    invoke-virtual {v2, v7, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 170
    .line 171
    .line 172
    goto :goto_1

    .line 173
    :cond_2
    iget-object v4, v6, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 174
    .line 175
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/User;->hasPic()Z

    .line 176
    .line 177
    .line 178
    move-result v4

    .line 179
    if-eqz v4, :cond_3

    .line 180
    .line 181
    iget-object v4, v0, Ll/cla0;->d:Ll/zq90;

    .line 182
    .line 183
    iget-object v4, v4, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 184
    .line 185
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 186
    .line 187
    .line 188
    move-result-object v4

    .line 189
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 190
    .line 191
    goto :goto_0

    .line 192
    :cond_3
    const-string v4, ""

    .line 193
    .line 194
    :goto_0
    invoke-virtual {v2, v7, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 195
    .line 196
    .line 197
    new-instance v4, Ljava/lang/Exception;

    .line 198
    .line 199
    const-string v5, "ProfileListFrag user pictures get index crash"

    .line 200
    .line 201
    invoke-direct {v4, v5}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 202
    .line 203
    .line 204
    invoke-static {v4}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 205
    .line 206
    .line 207
    :goto_1
    iget-object v4, v0, Ll/cla0;->d:Ll/zq90;

    .line 208
    .line 209
    invoke-virtual {v4}, Ll/zq90;->v()Z

    .line 210
    .line 211
    .line 212
    move-result v4

    .line 213
    if-nez v4, :cond_4

    .line 214
    .line 215
    iget-object v4, v0, Ll/cla0;->d:Ll/zq90;

    .line 216
    .line 217
    invoke-virtual {v4}, Ll/zq90;->w()Z

    .line 218
    .line 219
    .line 220
    move-result v4

    .line 221
    if-nez v4, :cond_4

    .line 222
    .line 223
    iget-object v4, v0, Ll/cla0;->d:Ll/zq90;

    .line 224
    .line 225
    invoke-virtual {v4}, Ll/zq90;->z()Z

    .line 226
    .line 227
    .line 228
    move-result v4

    .line 229
    if-nez v4, :cond_4

    .line 230
    .line 231
    iget-object v4, v0, Ll/cla0;->d:Ll/zq90;

    .line 232
    .line 233
    invoke-virtual {v4}, Ll/zq90;->A()Z

    .line 234
    .line 235
    .line 236
    move-result v4

    .line 237
    if-nez v4, :cond_4

    .line 238
    .line 239
    iget-object v4, v0, Ll/cla0;->d:Ll/zq90;

    .line 240
    .line 241
    invoke-virtual {v4}, Ll/zq90;->D()Z

    .line 242
    .line 243
    .line 244
    move-result v4

    .line 245
    if-nez v4, :cond_4

    .line 246
    .line 247
    iget-object v4, v0, Ll/cla0;->d:Ll/zq90;

    .line 248
    .line 249
    invoke-virtual {v4}, Ll/zq90;->y()Z

    .line 250
    .line 251
    .line 252
    move-result v4

    .line 253
    if-nez v4, :cond_4

    .line 254
    .line 255
    iget-object v4, v0, Ll/cla0;->d:Ll/zq90;

    .line 256
    .line 257
    invoke-virtual {v4}, Ll/zq90;->p()Z

    .line 258
    .line 259
    .line 260
    move-result v4

    .line 261
    if-eqz v4, :cond_5

    .line 262
    .line 263
    :cond_4
    iget-object v4, v0, Ll/cla0;->d:Ll/zq90;

    .line 264
    .line 265
    iget-object v4, v4, Ll/zq90;->d:Ljava/lang/String;

    .line 266
    .line 267
    const-string v5, "currentUserId"

    .line 268
    .line 269
    invoke-virtual {v2, v5, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 270
    .line 271
    .line 272
    :cond_5
    iget-object v4, v0, Ll/cla0;->d:Ll/zq90;

    .line 273
    .line 274
    invoke-virtual {v4}, Ll/zq90;->E()Z

    .line 275
    .line 276
    .line 277
    move-result v4

    .line 278
    iget-object v5, v0, Ll/cla0;->d:Ll/zq90;

    .line 279
    .line 280
    const/4 v6, 0x1

    .line 281
    const/4 v7, 0x0

    .line 282
    if-eqz v4, :cond_9

    .line 283
    .line 284
    iget-object v4, v5, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 285
    .line 286
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 287
    .line 288
    .line 289
    move-result v4

    .line 290
    if-eqz v4, :cond_15

    .line 291
    .line 292
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 293
    .line 294
    .line 295
    move-result-object v8

    .line 296
    iget-object v4, v0, Ll/cla0;->d:Ll/zq90;

    .line 297
    .line 298
    iget-object v9, v4, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 299
    .line 300
    sget-object v4, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 301
    .line 302
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 303
    .line 304
    .line 305
    move-result v4

    .line 306
    if-eq v1, v4, :cond_7

    .line 307
    .line 308
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 309
    .line 310
    .line 311
    move-result v4

    .line 312
    if-ne v1, v4, :cond_6

    .line 313
    .line 314
    goto :goto_2

    .line 315
    :cond_6
    move v10, v7

    .line 316
    goto :goto_3

    .line 317
    :cond_7
    :goto_2
    move v10, v6

    .line 318
    :goto_3
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 319
    .line 320
    .line 321
    move-result v3

    .line 322
    if-ne v1, v3, :cond_8

    .line 323
    .line 324
    move v11, v6

    .line 325
    goto :goto_4

    .line 326
    :cond_8
    move v11, v7

    .line 327
    :goto_4
    new-instance v15, Ll/zja0;

    .line 328
    .line 329
    invoke-direct {v15, v0, v1, v2}, Ll/zja0;-><init>(Ll/cla0;ILandroid/content/Intent;)V

    .line 330
    .line 331
    .line 332
    new-instance v3, Ll/aka0;

    .line 333
    .line 334
    invoke-direct {v3, v0, v1, v2}, Ll/aka0;-><init>(Ll/cla0;ILandroid/content/Intent;)V

    .line 335
    .line 336
    .line 337
    invoke-virtual {v0}, Ll/cla0;->pageId()Ljava/lang/String;

    .line 338
    .line 339
    .line 340
    move-result-object v17

    .line 341
    const/16 v19, 0x0

    .line 342
    .line 343
    const/16 v20, 0x0

    .line 344
    .line 345
    const/4 v12, 0x0

    .line 346
    const-string v13, "home"

    .line 347
    .line 348
    const/4 v14, 0x0

    .line 349
    const/16 v18, 0x0

    .line 350
    .line 351
    move-object/from16 v16, v3

    .line 352
    .line 353
    invoke-static/range {v8 .. v20}, Ll/rgr;->n(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZZLjava/lang/String;Ll/rcj;Ll/y20;Ll/y20;Ljava/lang/String;Lcom/p1/mobile/putong/data/LikeExtraData;Ljava/lang/String;Ljava/lang/String;)Z

    .line 354
    .line 355
    .line 356
    return-void

    .line 357
    :cond_9
    invoke-virtual {v5}, Ll/zq90;->t()Z

    .line 358
    .line 359
    .line 360
    move-result v4

    .line 361
    iget-object v5, v0, Ll/cla0;->d:Ll/zq90;

    .line 362
    .line 363
    if-eqz v4, :cond_d

    .line 364
    .line 365
    iget-object v4, v5, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 366
    .line 367
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 368
    .line 369
    .line 370
    move-result v4

    .line 371
    if-eqz v4, :cond_15

    .line 372
    .line 373
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 374
    .line 375
    .line 376
    move-result-object v8

    .line 377
    iget-object v4, v0, Ll/cla0;->d:Ll/zq90;

    .line 378
    .line 379
    iget-object v9, v4, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 380
    .line 381
    sget-object v4, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 382
    .line 383
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 384
    .line 385
    .line 386
    move-result v4

    .line 387
    if-eq v1, v4, :cond_b

    .line 388
    .line 389
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 390
    .line 391
    .line 392
    move-result v4

    .line 393
    if-ne v1, v4, :cond_a

    .line 394
    .line 395
    goto :goto_5

    .line 396
    :cond_a
    move v10, v7

    .line 397
    goto :goto_6

    .line 398
    :cond_b
    :goto_5
    move v10, v6

    .line 399
    :goto_6
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 400
    .line 401
    .line 402
    move-result v3

    .line 403
    if-ne v1, v3, :cond_c

    .line 404
    .line 405
    move v11, v6

    .line 406
    goto :goto_7

    .line 407
    :cond_c
    move v11, v7

    .line 408
    :goto_7
    iget-object v3, v0, Ll/cla0;->d:Ll/zq90;

    .line 409
    .line 410
    iget-object v13, v3, Ll/zq90;->b:Ljava/lang/String;

    .line 411
    .line 412
    new-instance v15, Ll/bka0;

    .line 413
    .line 414
    invoke-direct {v15, v0, v1, v2}, Ll/bka0;-><init>(Ll/cla0;ILandroid/content/Intent;)V

    .line 415
    .line 416
    .line 417
    new-instance v3, Ll/cka0;

    .line 418
    .line 419
    invoke-direct {v3, v0, v1, v2}, Ll/cka0;-><init>(Ll/cla0;ILandroid/content/Intent;)V

    .line 420
    .line 421
    .line 422
    invoke-virtual {v0}, Ll/cla0;->pageId()Ljava/lang/String;

    .line 423
    .line 424
    .line 425
    move-result-object v17

    .line 426
    const/16 v19, 0x0

    .line 427
    .line 428
    const/16 v20, 0x0

    .line 429
    .line 430
    const/4 v12, 0x0

    .line 431
    const/4 v14, 0x0

    .line 432
    const/16 v18, 0x0

    .line 433
    .line 434
    move-object/from16 v16, v3

    .line 435
    .line 436
    invoke-static/range {v8 .. v20}, Ll/rgr;->n(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZZLjava/lang/String;Ll/rcj;Ll/y20;Ll/y20;Ljava/lang/String;Lcom/p1/mobile/putong/data/LikeExtraData;Ljava/lang/String;Ljava/lang/String;)Z

    .line 437
    .line 438
    .line 439
    return-void

    .line 440
    :cond_d
    invoke-virtual {v5}, Ll/zq90;->g()Z

    .line 441
    .line 442
    .line 443
    move-result v4

    .line 444
    iget-object v5, v0, Ll/cla0;->d:Ll/zq90;

    .line 445
    .line 446
    if-eqz v4, :cond_11

    .line 447
    .line 448
    iget-object v2, v5, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 449
    .line 450
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 451
    .line 452
    .line 453
    move-result v2

    .line 454
    if-eqz v2, :cond_15

    .line 455
    .line 456
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 457
    .line 458
    .line 459
    move-result-object v8

    .line 460
    iget-object v2, v0, Ll/cla0;->d:Ll/zq90;

    .line 461
    .line 462
    iget-object v9, v2, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 463
    .line 464
    sget-object v2, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 465
    .line 466
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 467
    .line 468
    .line 469
    move-result v2

    .line 470
    if-eq v1, v2, :cond_f

    .line 471
    .line 472
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 473
    .line 474
    .line 475
    move-result v2

    .line 476
    if-ne v1, v2, :cond_e

    .line 477
    .line 478
    goto :goto_8

    .line 479
    :cond_e
    move v10, v7

    .line 480
    goto :goto_9

    .line 481
    :cond_f
    :goto_8
    move v10, v6

    .line 482
    :goto_9
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 483
    .line 484
    .line 485
    move-result v2

    .line 486
    if-ne v1, v2, :cond_10

    .line 487
    .line 488
    move v11, v6

    .line 489
    goto :goto_a

    .line 490
    :cond_10
    move v11, v7

    .line 491
    :goto_a
    invoke-virtual {v0}, Ll/cla0;->pageId()Ljava/lang/String;

    .line 492
    .line 493
    .line 494
    move-result-object v12

    .line 495
    new-instance v13, Ll/dka0;

    .line 496
    .line 497
    invoke-direct {v13, v0}, Ll/dka0;-><init>(Ll/cla0;)V

    .line 498
    .line 499
    .line 500
    invoke-static/range {v8 .. v13}, Ll/rgr;->r(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZLjava/lang/String;Ll/z20;)V

    .line 501
    .line 502
    .line 503
    return-void

    .line 504
    :cond_11
    invoke-virtual {v5}, Ll/zq90;->n()Z

    .line 505
    .line 506
    .line 507
    move-result v4

    .line 508
    iget-object v5, v0, Ll/cla0;->d:Ll/zq90;

    .line 509
    .line 510
    if-eqz v4, :cond_16

    .line 511
    .line 512
    iget-object v4, v5, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 513
    .line 514
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 515
    .line 516
    .line 517
    move-result v4

    .line 518
    if-eqz v4, :cond_15

    .line 519
    .line 520
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 521
    .line 522
    .line 523
    move-result-object v8

    .line 524
    iget-object v4, v0, Ll/cla0;->d:Ll/zq90;

    .line 525
    .line 526
    iget-object v9, v4, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 527
    .line 528
    sget-object v4, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 529
    .line 530
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 531
    .line 532
    .line 533
    move-result v4

    .line 534
    if-eq v1, v4, :cond_13

    .line 535
    .line 536
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 537
    .line 538
    .line 539
    move-result v4

    .line 540
    if-ne v1, v4, :cond_12

    .line 541
    .line 542
    goto :goto_b

    .line 543
    :cond_12
    move v10, v7

    .line 544
    goto :goto_c

    .line 545
    :cond_13
    :goto_b
    move v10, v6

    .line 546
    :goto_c
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 547
    .line 548
    .line 549
    move-result v3

    .line 550
    if-ne v1, v3, :cond_14

    .line 551
    .line 552
    move v11, v6

    .line 553
    goto :goto_d

    .line 554
    :cond_14
    move v11, v7

    .line 555
    :goto_d
    new-instance v15, Ll/eka0;

    .line 556
    .line 557
    invoke-direct {v15, v0, v1, v2}, Ll/eka0;-><init>(Ll/cla0;ILandroid/content/Intent;)V

    .line 558
    .line 559
    .line 560
    new-instance v3, Ll/gka0;

    .line 561
    .line 562
    invoke-direct {v3, v0, v1, v2}, Ll/gka0;-><init>(Ll/cla0;ILandroid/content/Intent;)V

    .line 563
    .line 564
    .line 565
    invoke-virtual {v0}, Ll/cla0;->pageId()Ljava/lang/String;

    .line 566
    .line 567
    .line 568
    move-result-object v17

    .line 569
    const/16 v19, 0x0

    .line 570
    .line 571
    const/16 v20, 0x0

    .line 572
    .line 573
    const/4 v12, 0x0

    .line 574
    const-string v13, "from_find_partner"

    .line 575
    .line 576
    const/4 v14, 0x0

    .line 577
    const/16 v18, 0x0

    .line 578
    .line 579
    move-object/from16 v16, v3

    .line 580
    .line 581
    invoke-static/range {v8 .. v20}, Ll/rgr;->n(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZZLjava/lang/String;Ll/rcj;Ll/y20;Ll/y20;Ljava/lang/String;Lcom/p1/mobile/putong/data/LikeExtraData;Ljava/lang/String;Ljava/lang/String;)Z

    .line 582
    .line 583
    .line 584
    :cond_15
    return-void

    .line 585
    :cond_16
    invoke-virtual {v5}, Ll/zq90;->D()Z

    .line 586
    .line 587
    .line 588
    move-result v4

    .line 589
    if-eqz v4, :cond_1a

    .line 590
    .line 591
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 592
    .line 593
    .line 594
    move-result-object v8

    .line 595
    iget-object v4, v0, Ll/cla0;->d:Ll/zq90;

    .line 596
    .line 597
    iget-object v9, v4, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 598
    .line 599
    sget-object v4, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 600
    .line 601
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 602
    .line 603
    .line 604
    move-result v4

    .line 605
    if-eq v1, v4, :cond_18

    .line 606
    .line 607
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 608
    .line 609
    .line 610
    move-result v4

    .line 611
    if-ne v1, v4, :cond_17

    .line 612
    .line 613
    goto :goto_e

    .line 614
    :cond_17
    move v10, v7

    .line 615
    goto :goto_f

    .line 616
    :cond_18
    :goto_e
    move v10, v6

    .line 617
    :goto_f
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 618
    .line 619
    .line 620
    move-result v3

    .line 621
    if-ne v1, v3, :cond_19

    .line 622
    .line 623
    move v11, v6

    .line 624
    goto :goto_10

    .line 625
    :cond_19
    move v11, v7

    .line 626
    :goto_10
    invoke-virtual {v0}, Ll/cla0;->pageId()Ljava/lang/String;

    .line 627
    .line 628
    .line 629
    move-result-object v12

    .line 630
    new-instance v13, Ll/hka0;

    .line 631
    .line 632
    invoke-direct {v13, v0, v1, v2}, Ll/hka0;-><init>(Ll/cla0;ILandroid/content/Intent;)V

    .line 633
    .line 634
    .line 635
    new-instance v14, Ll/ika0;

    .line 636
    .line 637
    invoke-direct {v14}, Ll/ika0;-><init>()V

    .line 638
    .line 639
    .line 640
    invoke-static/range {v8 .. v14}, Ll/o2c;->j(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZLjava/lang/String;Ll/y20;Ll/x20;)V

    .line 641
    .line 642
    .line 643
    return-void

    .line 644
    :cond_1a
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 645
    .line 646
    .line 647
    move-result-object v3

    .line 648
    invoke-virtual {v3, v1, v2}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 649
    .line 650
    .line 651
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 652
    .line 653
    .line 654
    move-result-object v0

    .line 655
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 656
    .line 657
    .line 658
    return-void
.end method

.method public final synthetic E2(Ll/pf60;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cla0;->d:Ll/zq90;

    .line 2
    .line 3
    iget-object v1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/zq90;->X(Lcom/p1/mobile/putong/data/User;)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    invoke-direct {p0, p1}, Ll/cla0;->Y2(Lcom/p1/mobile/putong/data/User;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/cla0;->a:Lrx/subjects/a;

    .line 18
    .line 19
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final synthetic F2(Ll/pf60;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast p1, Ljava/lang/CharSequence;

    .line 10
    .line 11
    iget-object p0, p0, Ll/cla0;->d:Ll/zq90;

    .line 12
    .line 13
    iget-object p0, p0, Ll/zq90;->d:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public H1(Ljava/lang/String;Ljava/lang/String;)Ll/rcj;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ll/rcj<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/pka0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/pka0;-><init>(Ll/cla0;Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public final synthetic H2(Lcom/p1/mobile/putong/data/RelationshipStatus;)V
    .locals 0

    .line 1
    const/4 p1, 0x3

    .line 2
    invoke-direct {p0, p1}, Ll/cla0;->T2(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic I2(Ljava/util/List;)Ll/pf60;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cla0;->d:Ll/zq90;

    .line 2
    .line 3
    iget-object p0, p0, Ll/zq90;->d:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p0}, Lcom/p1/mobile/putong/core/util/bookmoviesdramas/BookMoviesDramasHelper;->l(Ljava/lang/String;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public J1(Z)V
    .locals 14

    .line 1
    iget-object v0, p0, Ll/cla0;->h:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/cla0;->d:Ll/zq90;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/zq90;->Z()Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Ll/cla0;->h:Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Ll/cla0;->h:Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    goto/16 :goto_2

    .line 22
    .line 23
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/data/LikeExtraData;->new_()Lcom/p1/mobile/putong/data/LikeExtraData;

    .line 24
    .line 25
    .line 26
    move-result-object v10

    .line 27
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 28
    .line 29
    check-cast v0, Ll/ima0;

    .line 30
    .line 31
    invoke-virtual {v0}, Ll/ima0;->S()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    iget-object v1, v10, Lcom/p1/mobile/putong/data/LikeExtraData;->swipeExtraScData:Lcom/p1/mobile/putong/data/SwipeExtraScData;

    .line 36
    .line 37
    iput v0, v1, Lcom/p1/mobile/putong/data/SwipeExtraScData;->picNum:I

    .line 38
    .line 39
    iget-object v2, p0, Ll/cla0;->h:Lcom/p1/mobile/putong/data/User;

    .line 40
    .line 41
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 42
    .line 43
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    iput v2, v1, Lcom/p1/mobile/putong/data/SwipeExtraScData;->picUploads:I

    .line 48
    .line 49
    iget-object v1, p0, Ll/cla0;->d:Ll/zq90;

    .line 50
    .line 51
    iget-object v1, v1, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 52
    .line 53
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_2

    .line 58
    .line 59
    iget-object v1, p0, Ll/cla0;->d:Ll/zq90;

    .line 60
    .line 61
    iget-object v1, v1, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 62
    .line 63
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 64
    .line 65
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    iget-object v2, p0, Ll/cla0;->h:Lcom/p1/mobile/putong/data/User;

    .line 70
    .line 71
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 72
    .line 73
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    if-eq v1, v2, :cond_2

    .line 78
    .line 79
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 80
    .line 81
    new-instance v2, Ljava/lang/StringBuilder;

    .line 82
    .line 83
    const-string v4, " profilelist picture size diff , user  "

    .line 84
    .line 85
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    iget-object v4, p0, Ll/cla0;->d:Ll/zq90;

    .line 89
    .line 90
    iget-object v4, v4, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 91
    .line 92
    iget-object v4, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 93
    .line 94
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    const-string v4, " "

    .line 98
    .line 99
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    iget-object v5, p0, Ll/cla0;->d:Ll/zq90;

    .line 103
    .line 104
    iget-object v5, v5, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 105
    .line 106
    iget-object v5, v5, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 107
    .line 108
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 109
    .line 110
    .line 111
    move-result v5

    .line 112
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    const-string v5, " withRelation "

    .line 116
    .line 117
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    iget-object v5, p0, Ll/cla0;->h:Lcom/p1/mobile/putong/data/User;

    .line 121
    .line 122
    iget-object v5, v5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 123
    .line 124
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    iget-object v4, p0, Ll/cla0;->h:Lcom/p1/mobile/putong/data/User;

    .line 131
    .line 132
    iget-object v4, v4, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 133
    .line 134
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 135
    .line 136
    .line 137
    move-result v4

    .line 138
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v2

    .line 145
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 149
    .line 150
    .line 151
    :cond_2
    iget-object v1, p0, Ll/cla0;->h:Lcom/p1/mobile/putong/data/User;

    .line 152
    .line 153
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 154
    .line 155
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    iget-object v2, v10, Lcom/p1/mobile/putong/data/LikeExtraData;->swipeExtraScData:Lcom/p1/mobile/putong/data/SwipeExtraScData;

    .line 160
    .line 161
    const-string v4, ""

    .line 162
    .line 163
    if-lt v0, v1, :cond_3

    .line 164
    .line 165
    iput-object v4, v2, Lcom/p1/mobile/putong/data/SwipeExtraScData;->picUrl:Ljava/lang/String;

    .line 166
    .line 167
    goto :goto_0

    .line 168
    :cond_3
    iget-object v1, p0, Ll/cla0;->h:Lcom/p1/mobile/putong/data/User;

    .line 169
    .line 170
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 171
    .line 172
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 177
    .line 178
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 179
    .line 180
    iput-object v0, v2, Lcom/p1/mobile/putong/data/SwipeExtraScData;->picUrl:Ljava/lang/String;

    .line 181
    .line 182
    :goto_0
    iget-object v0, p0, Ll/cla0;->d:Ll/zq90;

    .line 183
    .line 184
    invoke-virtual {v0}, Ll/zq90;->T()Z

    .line 185
    .line 186
    .line 187
    move-result v0

    .line 188
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 189
    .line 190
    .line 191
    move-result-object v1

    .line 192
    move-object v2, v1

    .line 193
    iget-object v1, p0, Ll/cla0;->h:Lcom/p1/mobile/putong/data/User;

    .line 194
    .line 195
    if-eqz p1, :cond_4

    .line 196
    .line 197
    const-string v5, "p_profile,superlike"

    .line 198
    .line 199
    goto :goto_1

    .line 200
    :cond_4
    const-string v5, "p_home,likelimit"

    .line 201
    .line 202
    :goto_1
    invoke-virtual {p0, v4, v4}, Ll/cla0;->H1(Ljava/lang/String;Ljava/lang/String;)Ll/rcj;

    .line 203
    .line 204
    .line 205
    move-result-object v6

    .line 206
    new-instance v7, Ll/jka0;

    .line 207
    .line 208
    invoke-direct {v7, p0, p1, v0}, Ll/jka0;-><init>(Ll/cla0;ZZ)V

    .line 209
    .line 210
    .line 211
    new-instance v8, Ll/kka0;

    .line 212
    .line 213
    invoke-direct {v8, p0, p1}, Ll/kka0;-><init>(Ll/cla0;Z)V

    .line 214
    .line 215
    .line 216
    invoke-virtual {p0}, Ll/cla0;->pageId()Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object v9

    .line 220
    new-instance v13, Ll/lka0;

    .line 221
    .line 222
    invoke-direct {v13, p0, p1}, Ll/lka0;-><init>(Ll/cla0;Z)V

    .line 223
    .line 224
    .line 225
    move-object v0, v2

    .line 226
    const/4 v2, 0x1

    .line 227
    const/4 v4, 0x0

    .line 228
    const-string v11, ""

    .line 229
    .line 230
    const-string v12, ""

    .line 231
    .line 232
    move v3, p1

    .line 233
    invoke-static/range {v0 .. v13}, Ll/rgr;->o(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZZLjava/lang/String;Ll/rcj;Ll/y20;Ll/y20;Ljava/lang/String;Lcom/p1/mobile/putong/data/LikeExtraData;Ljava/lang/String;Ljava/lang/String;Ll/x20;)Z

    .line 234
    .line 235
    .line 236
    move-result v0

    .line 237
    if-eqz v0, :cond_6

    .line 238
    .line 239
    iget-object p0, p0, Ll/cla0;->d:Ll/zq90;

    .line 240
    .line 241
    const/4 v0, 0x1

    .line 242
    if-eqz p1, :cond_5

    .line 243
    .line 244
    iput-boolean v0, p0, Ll/zq90;->l:Z

    .line 245
    .line 246
    return-void

    .line 247
    :cond_5
    iput-boolean v0, p0, Ll/zq90;->k:Z

    .line 248
    .line 249
    :cond_6
    :goto_2
    return-void
.end method

.method public final synthetic J2(Ll/pf60;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cla0;->c:Ll/pf60;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/cla0;->W2()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic K2(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/cla0;->Y2(Lcom/p1/mobile/putong/data/User;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/cla0;->d:Ll/zq90;

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ll/zq90;->X(Lcom/p1/mobile/putong/data/User;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/cla0;->a:Lrx/subjects/a;

    .line 10
    .line 11
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public L1(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-virtual {p0, p1}, Ll/cla0;->J1(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic L2(Ll/uxj0;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/cla0;->d:Ll/zq90;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/cla0;->Z2()Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p1, v0}, Ll/zq90;->X(Lcom/p1/mobile/putong/data/User;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-interface {p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-direct {p0, p1}, Ll/cla0;->Y2(Lcom/p1/mobile/putong/data/User;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Ll/cla0;->d:Ll/zq90;

    .line 22
    .line 23
    iget-object p1, p1, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    iget-object p1, p0, Ll/cla0;->f:Lcom/p1/mobile/putong/data/User;

    .line 28
    .line 29
    if-eqz p1, :cond_0

    .line 30
    .line 31
    iget-object p0, p0, Ll/cla0;->a:Lrx/subjects/a;

    .line 32
    .line 33
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public final synthetic M2(Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/ima0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ima0;->V0()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public N1()Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cla0;->g:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic N2()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/ima0;

    .line 4
    .line 5
    iget-object v0, v0, Ll/ima0;->o:Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;

    .line 6
    .line 7
    iget-object p0, p0, Ll/cla0;->d:Ll/zq90;

    .line 8
    .line 9
    iget-object p0, p0, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;->F1(Lcom/p1/mobile/putong/data/User;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public O1()V
    .locals 2

    .line 1
    invoke-static {}, Ll/eu4;->b()Ll/eu4;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/eu4;->g()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->U1:Ll/fg7;

    .line 19
    .line 20
    iget-object v1, v1, Ll/fg7;->S:Lrx/subjects/b;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Ll/xja0;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/xja0;-><init>(Ll/cla0;)V

    .line 37
    .line 38
    .line 39
    new-instance p0, Ll/yja0;

    .line 40
    .line 41
    invoke-direct {p0}, Ll/yja0;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final synthetic P2(Ljava/util/List;)Ll/pf60;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cla0;->d:Ll/zq90;

    .line 2
    .line 3
    iget-object p0, p0, Ll/zq90;->d:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p0}, Lcom/p1/mobile/putong/core/util/bookmoviesdramas/BookMoviesDramasHelper;->l(Ljava/lang/String;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic Q2(Ll/pf60;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cla0;->c:Ll/pf60;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/cla0;->W2()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public R2()Lcom/p1/mobile/putong/data/User;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cla0;->f:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-direct {p0, v0}, Ll/cla0;->Y2(Lcom/p1/mobile/putong/data/User;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object p0, p0, Ll/cla0;->f:Lcom/p1/mobile/putong/data/User;

    .line 17
    .line 18
    return-object p0
.end method

.method public T1()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cla0;->d:Ll/zq90;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/zq90;->o()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/cla0;->d:Ll/zq90;

    .line 10
    .line 11
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 12
    .line 13
    const-string v1, "share_profile"

    .line 14
    .line 15
    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    iget-object v0, p0, Ll/cla0;->d:Ll/zq90;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/zq90;->F()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    return-void

    .line 31
    :cond_1
    :goto_0
    sget-object v0, Ll/lza0;->k:Lrx/subjects/b;

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v1, Ll/rja0;

    .line 38
    .line 39
    invoke-direct {v1, p0}, Ll/rja0;-><init>(Ll/cla0;)V

    .line 40
    .line 41
    .line 42
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public U2()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cla0;->d:Ll/zq90;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/zq90;->E()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string v0, "e_push_profile_quit"

    .line 10
    .line 11
    const-string v1, "p_push_profile"

    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-virtual {p0}, Ll/cla0;->D1()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public V1(Lcom/p1/mobile/putong/data/User;)Z
    .locals 1

    .line 1
    invoke-static {}, Ll/vq8;->b()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    if-eqz p1, :cond_2

    .line 10
    .line 11
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 12
    .line 13
    if-eqz p0, :cond_2

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 16
    .line 17
    if-eqz p0, :cond_2

    .line 18
    .line 19
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-nez p0, :cond_2

    .line 24
    .line 25
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 28
    .line 29
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    if-eqz p0, :cond_2

    .line 34
    .line 35
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    check-cast p0, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 46
    .line 47
    if-nez p0, :cond_1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 53
    .line 54
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    check-cast p0, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 59
    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 61
    .line 62
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideProfileWealthTag:Ljava/lang/Boolean;

    .line 63
    .line 64
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    if-nez p0, :cond_2

    .line 69
    .line 70
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 75
    .line 76
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 77
    .line 78
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    check-cast p1, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 83
    .line 84
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 85
    .line 86
    iget p1, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->wealthGrade:I

    .line 87
    .line 88
    invoke-interface {p0, p1, v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Gj(IZ)Lcom/p1/mobile/putong/data/UserWealthGradeConfig;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    iget-boolean p1, p0, Lcom/p1/mobile/putong/data/UserWealthGradeConfig;->openNewIcon:Z

    .line 93
    .line 94
    if-eqz p1, :cond_2

    .line 95
    .line 96
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UserWealthGradeConfig;->wealthIconUrl:Ljava/lang/String;

    .line 97
    .line 98
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 99
    .line 100
    .line 101
    move-result p0

    .line 102
    if-nez p0, :cond_2

    .line 103
    .line 104
    const/4 p0, 0x1

    .line 105
    return p0

    .line 106
    :cond_2
    :goto_0
    return v0
.end method

.method public V2(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/cla0;->f:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    iget-object p0, p0, Ll/cla0;->d:Ll/zq90;

    .line 8
    .line 9
    invoke-static {v0, p1, v1, p0}, Ll/zki0;->H(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Ll/zq90;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic W1(ILandroid/content/Intent;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-virtual {p3, p1, p2}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public W2()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/cla0;->f:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ll/cla0;->d:Ll/zq90;

    .line 6
    .line 7
    iget-object v0, v0, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    new-instance v0, Ljava/lang/Object;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;->CUSTOM:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;

    .line 22
    .line 23
    const-string v2, "reRenderPage!!!"

    .line 24
    .line 25
    invoke-static {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/PerformanceLogUtil;->logBegin(ILcom/p1/mobile/putong/core/ui/profile/helpers/performance/ProfileLogEntity$ProfileLogName;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Ll/cla0;->a:Lrx/subjects/a;

    .line 29
    .line 30
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic X1(ILandroid/content/Intent;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-virtual {p3, p1, p2}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public X2()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v1, p0, Ll/cla0;->d:Ll/zq90;

    .line 6
    .line 7
    iget-object v1, v1, Ll/zq90;->d:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/dkb;->W9(Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/bja0;

    .line 14
    .line 15
    invoke-direct {v1}, Ll/bja0;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/cja0;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/cja0;-><init>(Ll/cla0;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v1, Ll/dja0;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ll/dja0;-><init>(Ll/cla0;)V

    .line 38
    .line 39
    .line 40
    new-instance p0, Ll/eja0;

    .line 41
    .line 42
    invoke-direct {p0}, Ll/eja0;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final synthetic Y1(ILandroid/content/Intent;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 3

    .line 1
    iget-object v0, p3, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 2
    .line 3
    const-string v1, "liked"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const-string v1, "superliked"

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p3, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 14
    .line 15
    const-string v2, "matched"

    .line 16
    .line 17
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    iget-object v0, p3, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 24
    .line 25
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 33
    .line 34
    .line 35
    move-result-object p3

    .line 36
    invoke-virtual {p3, p1, p2}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    :goto_0
    iget-object p0, p3, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 48
    .line 49
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    if-nez p0, :cond_3

    .line 54
    .line 55
    iget-object p0, p3, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 56
    .line 57
    const-string p2, "superLiked"

    .line 58
    .line 59
    invoke-static {p2}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    invoke-interface {p0, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    if-nez p0, :cond_3

    .line 68
    .line 69
    sget-object p0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 70
    .line 71
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    if-ne p1, p0, :cond_2

    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_2
    const-string p0, "\u559c\u6b22\u5df2\u53d1\u9001"

    .line 79
    .line 80
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    :cond_3
    :goto_1
    return-void
.end method

.method public Z()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ar2;->Z()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->d0:Ll/kua;

    .line 7
    .line 8
    iget-object v0, v0, Ll/kua;->R:Ll/mof0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/mof0;->k()Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Lrx/c;->first()Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {}, Ll/psd0;->B()Ll/gcg0;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/gcg0;)Ll/kcg0;

    .line 23
    .line 24
    .line 25
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;

    .line 26
    .line 27
    iget-object v1, p0, Ll/cla0;->d:Ll/zq90;

    .line 28
    .line 29
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;-><init>(Ll/zq90;)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Ll/cla0;->g:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/cla0;->X2()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final synthetic Z1(ILandroid/content/Intent;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-virtual {p3, p1, p2}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public Z2()Lcom/p1/mobile/putong/data/User;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/cla0;->d:Ll/zq90;

    .line 2
    .line 3
    iget-object v1, v0, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/zq90;->L()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/cla0;->d:Ll/zq90;

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget-object v2, p0, Ll/cla0;->d:Ll/zq90;

    .line 20
    .line 21
    iget-object v2, v2, Ll/zq90;->d:Ljava/lang/String;

    .line 22
    .line 23
    invoke-interface {v1, v2}, Ll/qhk0;->getUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Ll/zq90;->X(Lcom/p1/mobile/putong/data/User;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object p0, p0, Ll/cla0;->d:Ll/zq90;

    .line 31
    .line 32
    iget-object p0, p0, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 33
    .line 34
    return-object p0
.end method

.method public a0()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/cla0;->d:Ll/zq90;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/zq90;->L()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-direct {p0}, Ll/cla0;->R1()V

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-direct {p0}, Ll/cla0;->S1()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, Ll/xc20;->t(Lcom/p1/mobile/android/app/Act;)V

    .line 24
    .line 25
    .line 26
    invoke-direct {p0}, Ll/cla0;->Q1()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Ll/cla0;->T1()V

    .line 30
    .line 31
    .line 32
    :goto_0
    invoke-direct {p0}, Ll/cla0;->P1()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final synthetic a2()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic b2(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/dkb;->Q9(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    move-object p1, v0

    .line 15
    :goto_0
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 22
    .line 23
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/data/Relationship;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    iput-object p2, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 30
    .line 31
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 32
    .line 33
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->U:Ll/fy6;

    .line 34
    .line 35
    new-instance v0, Ll/wka0;

    .line 36
    .line 37
    invoke-direct {v0, p1}, Ll/wka0;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p2, v0}, Ll/fy6;->a(Ll/x20;)V

    .line 41
    .line 42
    .line 43
    :cond_1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    new-instance p2, Ll/xka0;

    .line 48
    .line 49
    invoke-direct {p2, p0}, Ll/xka0;-><init>(Ll/cla0;)V

    .line 50
    .line 51
    .line 52
    const-wide/16 v0, 0x1f4

    .line 53
    .line 54
    invoke-static {p1, p2, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public final synthetic c2(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 1

    .line 1
    new-instance v0, Ll/rka0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/rka0;-><init>(Ll/cla0;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Relationship;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic d2(ILandroid/content/Intent;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 1

    .line 1
    sget-object p3, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 2
    .line 3
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 4
    .line 5
    .line 6
    move-result p3

    .line 7
    if-eq p1, p3, :cond_1

    .line 8
    .line 9
    iget-object p3, p0, Ll/cla0;->d:Ll/zq90;

    .line 10
    .line 11
    iget-object p3, p3, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 14
    .line 15
    .line 16
    move-result p3

    .line 17
    if-eqz p3, :cond_0

    .line 18
    .line 19
    const-string p3, "\u5979"

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const-string p3, "\u4ed6"

    .line 23
    .line 24
    :goto_0
    filled-new-array {p3}, [Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p3

    .line 28
    const-string v0, "\u559c\u6b22\u5df2\u53d1\u9001\uff0c%s\u5c06\u6536\u5230\u4f60\u7684\u559c\u6b22"

    .line 29
    .line 30
    invoke-static {v0, p3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p3

    .line 34
    invoke-static {p3}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    .line 40
    move-result-object p3

    .line 41
    invoke-virtual {p3, p1, p2}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic e2(ILandroid/content/Intent;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-virtual {p3, p1, p2}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic f2(ILandroid/content/Intent;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-virtual {p3, p1, p2}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic g2(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/cla0;->L1(Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic h2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 7

    .line 1
    invoke-virtual {p4}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 10
    .line 11
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/CoreSuggested;->u0:Ll/jxd0;

    .line 12
    .line 13
    invoke-virtual {p3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p3

    .line 17
    check-cast p3, Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 20
    .line 21
    .line 22
    move-result p3

    .line 23
    if-nez p3, :cond_0

    .line 24
    .line 25
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    .line 28
    .line 29
    .line 30
    move-result-object p3

    .line 31
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p3

    .line 35
    if-eqz p3, :cond_0

    .line 36
    .line 37
    invoke-static {}, Ll/rbb0;->t()Z

    .line 38
    .line 39
    .line 40
    move-result p3

    .line 41
    if-nez p3, :cond_0

    .line 42
    .line 43
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result p3

    .line 47
    if-eqz p3, :cond_0

    .line 48
    .line 49
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 50
    .line 51
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 52
    .line 53
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/CoreSuggested;->u0:Ll/jxd0;

    .line 54
    .line 55
    sget-object p4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 56
    .line 57
    invoke-virtual {p3, p4}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    iget-object p3, p0, Ll/cla0;->h:Lcom/p1/mobile/putong/data/User;

    .line 65
    .line 66
    iget-object v2, p3, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 67
    .line 68
    new-instance p3, Ljava/lang/StringBuilder;

    .line 69
    .line 70
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 71
    .line 72
    .line 73
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 74
    .line 75
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Counter;->superLikeLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 80
    .line 81
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;->remainToday()I

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    const-string v1, ""

    .line 89
    .line 90
    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v3

    .line 97
    iget-object p3, p0, Ll/cla0;->h:Lcom/p1/mobile/putong/data/User;

    .line 98
    .line 99
    iget-object p3, p3, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 100
    .line 101
    const-string v1, "male"

    .line 102
    .line 103
    invoke-static {p3, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 104
    .line 105
    .line 106
    move-result v4

    .line 107
    new-instance v5, Ll/uka0;

    .line 108
    .line 109
    invoke-direct {v5, p0, p1, p2}, Ll/uka0;-><init>(Ll/cla0;Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    new-instance v6, Ll/vka0;

    .line 113
    .line 114
    invoke-direct {v6}, Ll/vka0;-><init>()V

    .line 115
    .line 116
    .line 117
    const/4 v1, 0x1

    .line 118
    invoke-static/range {v0 .. v6}, Ll/hl3;->G(Lcom/p1/mobile/android/app/Act;ZLjava/lang/String;Ljava/lang/String;ZLjava/lang/Runnable;Ljava/lang/Runnable;)V

    .line 119
    .line 120
    .line 121
    return-object p4

    .line 122
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 123
    .line 124
    return-object p0
.end method

.method public final synthetic i2(ZZLcom/p1/mobile/putong/data/Relationship;)V
    .locals 0

    .line 1
    const/4 p3, 0x0

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    iget-object p1, p0, Ll/cla0;->d:Ll/zq90;

    .line 5
    .line 6
    iput-boolean p3, p1, Ll/zq90;->l:Z

    .line 7
    .line 8
    const/4 p3, 0x1

    .line 9
    iput-boolean p3, p1, Ll/zq90;->m:Z

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-interface {p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->so()Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_2

    .line 21
    .line 22
    iget-object p1, p0, Ll/cla0;->d:Ll/zq90;

    .line 23
    .line 24
    invoke-virtual {p1}, Ll/zq90;->k()Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-nez p1, :cond_1

    .line 29
    .line 30
    iget-object p1, p0, Ll/cla0;->d:Ll/zq90;

    .line 31
    .line 32
    invoke-virtual {p1}, Ll/zq90;->m()Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-nez p1, :cond_1

    .line 37
    .line 38
    iget-object p1, p0, Ll/cla0;->d:Ll/zq90;

    .line 39
    .line 40
    invoke-virtual {p1}, Ll/zq90;->i()Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-eqz p1, :cond_2

    .line 45
    .line 46
    :cond_1
    const-string p1, "\u559c\u6b22\u5df2\u53d1\u9001"

    .line 47
    .line 48
    invoke-static {p1}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    :cond_2
    iget-object p1, p0, Ll/cla0;->d:Ll/zq90;

    .line 52
    .line 53
    iput-boolean p3, p1, Ll/zq90;->k:Z

    .line 54
    .line 55
    :goto_0
    if-eqz p2, :cond_3

    .line 56
    .line 57
    invoke-virtual {p0}, Ll/cla0;->D1()V

    .line 58
    .line 59
    .line 60
    :cond_3
    return-void
.end method

.method public final synthetic j2(ZLjava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cla0;->d:Ll/zq90;

    .line 2
    .line 3
    const/4 p2, 0x0

    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    iput-boolean p2, p0, Ll/zq90;->l:Z

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iput-boolean p2, p0, Ll/zq90;->k:Z

    .line 10
    .line 11
    return-void
.end method

.method public final synthetic k2(Z)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/cla0;->d:Ll/zq90;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    iput-boolean v0, p0, Ll/zq90;->l:Z

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iput-boolean v0, p0, Ll/zq90;->k:Z

    .line 10
    .line 11
    return-void
.end method

.method public final synthetic l2(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/eu4;->b()Ll/eu4;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {v0, p1}, Ll/eu4;->j(Z)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/cla0;->U2()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic n2(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/cla0;->F1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic o2(Ll/pf60;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cla0;->d:Ll/zq90;

    .line 2
    .line 3
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    iput-object p1, v0, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    const/4 p1, 0x3

    .line 10
    invoke-direct {p0, p1}, Ll/cla0;->T2(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic p2(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cla0;->d:Ll/zq90;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/zq90;->h()Z

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

.method public pageId()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cla0;->d:Ll/zq90;

    .line 2
    .line 3
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 4
    .line 5
    const-string v1, "my_tab_profile_like"

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const-string p0, "p_my_profile_comment"

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    iget-object v0, p0, Ll/cla0;->d:Ll/zq90;

    .line 17
    .line 18
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 19
    .line 20
    const-string v1, "from_guess_liker_result"

    .line 21
    .line 22
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    const-string p0, "p_guess_who_likes_me_profile"

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_1
    iget-object v0, p0, Ll/cla0;->d:Ll/zq90;

    .line 32
    .line 33
    iget-object v0, v0, Ll/zq90;->b:Ljava/lang/String;

    .line 34
    .line 35
    const-string v1, "from_christmas"

    .line 36
    .line 37
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    const-string p0, "p_christmas_profile"

    .line 44
    .line 45
    return-object p0

    .line 46
    :cond_2
    iget-object v0, p0, Ll/cla0;->d:Ll/zq90;

    .line 47
    .line 48
    iget-object v0, v0, Ll/zq90;->d:Ljava/lang/String;

    .line 49
    .line 50
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-nez v0, :cond_3

    .line 55
    .line 56
    iget-object p0, p0, Ll/cla0;->d:Ll/zq90;

    .line 57
    .line 58
    invoke-virtual {p0}, Ll/zq90;->Q()Z

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    if-eqz p0, :cond_3

    .line 63
    .line 64
    const-string p0, "p_unmatch_profile"

    .line 65
    .line 66
    return-object p0

    .line 67
    :cond_3
    const-string p0, "p_suggest_user_profile_info_view"

    .line 68
    .line 69
    return-object p0
.end method

.method public final synthetic q2(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cla0;->d:Ll/zq90;

    .line 2
    .line 3
    iget-object v0, v0, Ll/zq90;->d:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    const/4 p1, 0x1

    .line 12
    invoke-direct {p0, p1}, Ll/cla0;->T2(I)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public final synthetic s2(Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cla0;->d:Ll/zq90;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/zq90;->Q()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic t2(Ljava/lang/Long;)Lrx/c;
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object p0, p0, Ll/cla0;->d:Ll/zq90;

    .line 6
    .line 7
    iget-object p0, p0, Ll/zq90;->d:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Ll/dkb;->W9(Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic u2()Lrx/c;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cla0;->d:Ll/zq90;

    .line 2
    .line 3
    iget-object v0, v0, Ll/zq90;->e:Ll/zq90$a;

    .line 4
    .line 5
    iget-boolean v0, v0, Ll/zq90$a;->f:Z

    .line 6
    .line 7
    xor-int/lit8 v0, v0, 0x1

    .line 8
    .line 9
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/sja0;

    .line 18
    .line 19
    invoke-direct {v1}, Ll/sja0;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/tja0;

    .line 27
    .line 28
    invoke-direct {v1}, Ll/tja0;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    new-instance v1, Ll/vja0;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Ll/vja0;-><init>(Ll/cla0;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    new-instance v1, Ll/wja0;

    .line 53
    .line 54
    invoke-direct {v1, p0}, Ll/wja0;-><init>(Ll/cla0;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    return-object p0
.end method

.method public final synthetic v2(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->isBlocked()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iget-object v0, p0, Ll/cla0;->d:Ll/zq90;

    .line 18
    .line 19
    iget-object v0, v0, Ll/zq90;->d:Ljava/lang/String;

    .line 20
    .line 21
    invoke-interface {p1, v0}, Ll/qhk0;->getUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_0

    .line 30
    .line 31
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iget-object v0, p0, Ll/cla0;->d:Ll/zq90;

    .line 36
    .line 37
    iget-object v0, v0, Ll/zq90;->d:Ljava/lang/String;

    .line 38
    .line 39
    invoke-interface {p1, v0}, Ll/qhk0;->getUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->unilateralBlock()Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-nez p1, :cond_0

    .line 48
    .line 49
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 50
    .line 51
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 52
    .line 53
    iget-object p0, p0, Ll/cla0;->d:Ll/zq90;

    .line 54
    .line 55
    iget-object p0, p0, Ll/zq90;->d:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {p1, p0}, Ll/dkb;->Ba(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    :cond_0
    return-void
.end method

.method public final synthetic w2(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Ll/cla0;->d:Ll/zq90;

    .line 6
    .line 7
    iget-object p1, p1, Ll/zq90;->a:Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast p0, Ll/ima0;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/ima0;->U0()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final synthetic x2()Lrx/c;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/cla0;->d:Ll/zq90;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/zq90;->K()Z

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
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance v0, Ll/mka0;

    .line 16
    .line 17
    invoke-direct {v0}, Ll/mka0;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    new-instance v0, Ll/nka0;

    .line 25
    .line 26
    invoke-direct {v0}, Ll/nka0;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, v0}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public final synthetic y2()Lrx/c;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/cla0;->d:Ll/zq90;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/zq90;->K()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/d0;->j4()Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 v0, 0x0

    .line 23
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    :goto_0
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 30
    .line 31
    iget-object p0, p0, Ll/cla0;->d:Ll/zq90;

    .line 32
    .line 33
    iget-object p0, p0, Ll/zq90;->d:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v1, p0}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 40
    .line 41
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 42
    .line 43
    invoke-virtual {v1}, Ll/dkb;->o9()Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    new-instance v2, Ll/jda0;

    .line 48
    .line 49
    invoke-direct {v2}, Ll/jda0;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-static {v0, p0, v1, v2}, Ll/psd0;->s(Lrx/c;Lrx/c;Lrx/c;Ll/scj;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    return-object p0
.end method

.method public final synthetic z2(Ll/bkj0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cla0;->d:Ll/zq90;

    .line 2
    .line 3
    iget-object v1, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/zq90;->X(Lcom/p1/mobile/putong/data/User;)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    invoke-direct {p0, p1}, Ll/cla0;->Y2(Lcom/p1/mobile/putong/data/User;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ll/cla0;->W2()V

    .line 18
    .line 19
    .line 20
    return-void
.end method
