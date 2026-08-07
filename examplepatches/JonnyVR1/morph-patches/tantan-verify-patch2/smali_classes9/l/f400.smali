.class public Ll/f400;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/iq2;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Z

.field public b:Z

.field public c:Ljava/lang/String;

.field public d:Lcom/p1/mobile/putong/data/User;

.field public e:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ll/kcg0;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Ll/f400;->e:Lrx/subjects/a;

    .line 9
    .line 10
    return-void
.end method

.method private synthetic I0(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string v0, "is_svip_unmatch"

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    iput-boolean p1, p0, Ll/f400;->a:Z

    .line 17
    .line 18
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->B()Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    iget-object p1, p0, Ll/f400;->c:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {p1}, Ll/hcp;->c(Ljava/lang/String;)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_0

    .line 39
    .line 40
    const/4 v1, 0x1

    .line 41
    :cond_0
    iput-boolean v1, p0, Ll/f400;->b:Z

    .line 42
    .line 43
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 44
    .line 45
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 46
    .line 47
    iget-object v0, p0, Ll/f400;->c:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {p1, v0}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {p1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->c()Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-eqz v0, :cond_1

    .line 70
    .line 71
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 72
    .line 73
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 74
    .line 75
    iget-object v1, p0, Ll/f400;->c:Ljava/lang/String;

    .line 76
    .line 77
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->mo(Ljava/lang/String;)Lrx/c;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    goto :goto_0

    .line 86
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {v0}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->Yg()Z

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    if-eqz v0, :cond_2

    .line 99
    .line 100
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-virtual {v0}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    iget-object v1, p0, Ll/f400;->c:Ljava/lang/String;

    .line 109
    .line 110
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->Da(Ljava/lang/String;)Lrx/c;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    goto :goto_0

    .line 119
    :cond_2
    new-instance v0, Ll/pf60;

    .line 120
    .line 121
    const/4 v1, -0x1

    .line 122
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 127
    .line 128
    invoke-direct {v0, v1, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 129
    .line 130
    .line 131
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    :goto_0
    new-instance v1, Ll/u300;

    .line 136
    .line 137
    invoke-direct {v1}, Ll/u300;-><init>()V

    .line 138
    .line 139
    .line 140
    invoke-static {p1, v0, v1}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    new-instance v0, Ll/v300;

    .line 149
    .line 150
    invoke-direct {v0, p0}, Ll/v300;-><init>(Ll/f400;)V

    .line 151
    .line 152
    .line 153
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 158
    .line 159
    .line 160
    return-void
.end method

.method private synthetic L0(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/iq2;

    .line 4
    .line 5
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 6
    .line 7
    iget-object v0, v0, Ll/sre0;->d:Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 8
    .line 9
    iget-object p0, p0, Ll/f400;->d:Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Kk(Lcom/p1/mobile/putong/data/User;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    invoke-virtual {p1, p0}, Ll/iq2;->p(Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic e0(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic f0(Ll/f400;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/f400;->F0(Ll/pf60;)V

    return-void
.end method

.method public static synthetic g0(Ll/f400;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/f400;->I0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic h0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic i0(Ll/f400;Ljava/util/Map;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/f400;->J0(Ljava/util/Map;)V

    return-void
.end method

.method public static synthetic j0(Ll/f400;Lcom/p1/mobile/putong/data/User;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/f400;->E0(Lcom/p1/mobile/putong/data/User;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/data/Picture;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->U:Ll/fy6;

    .line 4
    .line 5
    new-instance v1, Ll/q300;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/q300;-><init>(Lcom/p1/mobile/putong/data/Picture;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/fy6;->a(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic l0(Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic m0()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic n0()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic o0(Ll/f400;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/f400;->L0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic p0(Lcom/p1/mobile/putong/data/Picture;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    iput-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localChatBg:Ljava/util/List;

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localChatBg:Ljava/util/List;

    .line 20
    .line 21
    :goto_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/g;->mq(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static synthetic q0(Ll/f400;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/f400;->G0(Ll/bkj0;)V

    return-void
.end method

.method public static synthetic r0(Ll/f400;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/f400;->H0(Ll/pf60;)V

    return-void
.end method

.method public static synthetic s0(Ll/f400;)Ll/iam;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public final A0()V
    .locals 4

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Cn()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/f400;->x0()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->Ue(Ljava/lang/String;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 29
    .line 30
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->M1:Ll/cn7;

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/f400;->x0()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-virtual {v1, v2}, Ll/cn7;->s3(Ljava/lang/String;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 41
    .line 42
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 43
    .line 44
    invoke-virtual {p0}, Ll/f400;->x0()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    invoke-virtual {v2, v3}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    new-instance v3, Ll/s300;

    .line 53
    .line 54
    invoke-direct {v3}, Ll/s300;-><init>()V

    .line 55
    .line 56
    .line 57
    invoke-static {v0, v1, v2, v3}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Lrx/c;Ll/scj;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    new-instance v1, Ll/t300;

    .line 66
    .line 67
    invoke-direct {v1, p0}, Ll/t300;-><init>(Ll/f400;)V

    .line 68
    .line 69
    .line 70
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public C0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/f400;->a:Z

    .line 2
    .line 3
    return p0
.end method

.method public D0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/f400;->b:Z

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic E0(Lcom/p1/mobile/putong/data/User;Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/iq2;

    .line 4
    .line 5
    sget-object p2, Ll/uqb0;->b0:Ll/sre0;

    .line 6
    .line 7
    iget-object p2, p2, Ll/sre0;->d:Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 8
    .line 9
    invoke-interface {p2, p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Kk(Lcom/p1/mobile/putong/data/User;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-virtual {p0, p1}, Ll/iq2;->p(Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic F0(Ll/pf60;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/iq2;

    .line 4
    .line 5
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p1, Ljava/lang/CharSequence;

    .line 8
    .line 9
    const-string v0, "heartbeatMatch"

    .line 10
    .line 11
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    invoke-virtual {p0, p1}, Ll/iq2;->l(Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic G0(Ll/bkj0;)V
    .locals 5

    .line 1
    iget-object v0, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_5

    .line 10
    .line 11
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

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
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast v0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 24
    .line 25
    const-string v1, "dismissed"

    .line 26
    .line 27
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    iget-object v0, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 35
    .line 36
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    const/4 v1, 0x1

    .line 41
    const/4 v2, 0x0

    .line 42
    if-eqz v0, :cond_2

    .line 43
    .line 44
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iget-object v3, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 53
    .line 54
    check-cast v3, Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 55
    .line 56
    iget-wide v3, v3, Lcom/p1/mobile/putong/core/data/ChatHeat;->degree:D

    .line 57
    .line 58
    invoke-interface {v0, v3, v4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->V7(D)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    iget-object v3, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 63
    .line 64
    if-eqz v0, :cond_1

    .line 65
    .line 66
    check-cast v3, Ll/iq2;

    .line 67
    .line 68
    invoke-virtual {v3, v1}, Ll/iq2;->m(Z)V

    .line 69
    .line 70
    .line 71
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 72
    .line 73
    check-cast p0, Ll/iq2;

    .line 74
    .line 75
    iget-object p1, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 76
    .line 77
    check-cast p1, Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 78
    .line 79
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/ChatHeat;->specialRemind:Z

    .line 80
    .line 81
    invoke-virtual {p0, p1}, Ll/iq2;->i(Z)V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :cond_1
    check-cast v3, Ll/iq2;

    .line 86
    .line 87
    invoke-virtual {v3, v2}, Ll/iq2;->m(Z)V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_2
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 92
    .line 93
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    if-eqz v0, :cond_4

    .line 98
    .line 99
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    iget-object p1, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 108
    .line 109
    check-cast p1, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 110
    .line 111
    iget p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->mm:I

    .line 112
    .line 113
    int-to-double v3, p1

    .line 114
    invoke-interface {v0, v3, v4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->V7(D)Z

    .line 115
    .line 116
    .line 117
    move-result p1

    .line 118
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 119
    .line 120
    if-eqz p1, :cond_3

    .line 121
    .line 122
    check-cast v0, Ll/iq2;

    .line 123
    .line 124
    invoke-virtual {v0, v1}, Ll/iq2;->m(Z)V

    .line 125
    .line 126
    .line 127
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 128
    .line 129
    check-cast p0, Ll/iq2;

    .line 130
    .line 131
    invoke-virtual {p0, v2}, Ll/iq2;->i(Z)V

    .line 132
    .line 133
    .line 134
    return-void

    .line 135
    :cond_3
    check-cast v0, Ll/iq2;

    .line 136
    .line 137
    invoke-virtual {v0, v2}, Ll/iq2;->m(Z)V

    .line 138
    .line 139
    .line 140
    return-void

    .line 141
    :cond_4
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 142
    .line 143
    check-cast p0, Ll/iq2;

    .line 144
    .line 145
    invoke-virtual {p0, v2}, Ll/iq2;->m(Z)V

    .line 146
    .line 147
    .line 148
    :cond_5
    :goto_0
    return-void
.end method

.method public final synthetic H0(Ll/pf60;)V
    .locals 2

    .line 1
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    move-object v1, v0

    .line 4
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 5
    .line 6
    iput-object v1, p0, Ll/f400;->d:Lcom/p1/mobile/putong/data/User;

    .line 7
    .line 8
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast v1, Ll/iq2;

    .line 11
    .line 12
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast p1, Ll/pf60;

    .line 17
    .line 18
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast p1, Ljava/lang/Integer;

    .line 21
    .line 22
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    invoke-virtual {v1, v0, p1}, Ll/iq2;->d(Lcom/p1/mobile/putong/data/User;I)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Ll/f400;->e:Lrx/subjects/a;

    .line 30
    .line 31
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final synthetic J0(Ljava/util/Map;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/iq2;

    .line 4
    .line 5
    iget-object p0, p0, Ll/f400;->d:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Ll/iq2;->k(Lcom/p1/mobile/putong/data/User;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public N0(Lcom/p1/mobile/putong/data/Picture;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->l()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 18
    .line 19
    iget-object p0, p0, Ll/f400;->c:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    new-instance v0, Ll/y300;

    .line 26
    .line 27
    invoke-direct {v0, p1, p0}, Ll/y300;-><init>(Lcom/p1/mobile/putong/data/Picture;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public O0()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Be()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public Z()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ar2;->Z()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "user_id"

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Ll/f400;->c:Ljava/lang/String;

    .line 19
    .line 20
    return-void
.end method

.method public a0()V
    .locals 2

    .line 1
    new-instance v0, Ll/z300;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/z300;-><init>(Ll/f400;)V

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
    invoke-virtual {v0}, Ll/dkb;->N7()Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/a400;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/a400;-><init>(Ll/f400;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Ll/f400;->y0()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/f400;->A0()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ll/f400;->z0()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    new-instance v1, Ll/b400;

    .line 47
    .line 48
    invoke-direct {v1}, Ll/b400;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    new-instance v1, Ll/c400;

    .line 60
    .line 61
    invoke-direct {v1, p0}, Ll/c400;-><init>(Ll/f400;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public t0(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/f400;->f:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 9
    .line 10
    iget-object v0, v0, Ll/dkb;->T1:Lrx/subjects/a;

    .line 11
    .line 12
    invoke-virtual {v0}, Lrx/c;->asObservable()Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const/4 v1, 0x1

    .line 17
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

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
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/p300;

    .line 34
    .line 35
    invoke-direct {v1, p0, p1}, Ll/p300;-><init>(Ll/f400;Lcom/p1/mobile/putong/data/User;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iput-object v0, p0, Ll/f400;->f:Ll/kcg0;

    .line 43
    .line 44
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 45
    .line 46
    iget-object v0, v0, Ll/sre0;->d:Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 47
    .line 48
    invoke-interface {v0, p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Kk(Lcom/p1/mobile/putong/data/User;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_0

    .line 53
    .line 54
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {v0}, Ll/j49;->h()Lcom/p1/mobile/putong/core/profile/service/CoreProfileInnerService;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    new-instance v2, Ll/w300;

    .line 67
    .line 68
    invoke-direct {v2}, Ll/w300;-><init>()V

    .line 69
    .line 70
    .line 71
    invoke-interface {v0, v1, p1, v2}, Lcom/p1/mobile/putong/core/profile/service/CoreProfileInnerService;->r8(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/Runnable;)V

    .line 72
    .line 73
    .line 74
    const-string p1, "remove"

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual {v0}, Ll/j49;->h()Lcom/p1/mobile/putong/core/profile/service/CoreProfileInnerService;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    new-instance v2, Ll/x300;

    .line 90
    .line 91
    invoke-direct {v2}, Ll/x300;-><init>()V

    .line 92
    .line 93
    .line 94
    invoke-interface {v0, v1, p1, v2}, Lcom/p1/mobile/putong/core/profile/service/CoreProfileInnerService;->xt(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/Runnable;)V

    .line 95
    .line 96
    .line 97
    const-string p1, "add"

    .line 98
    .line 99
    :goto_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    const-string v0, "blacklist_management"

    .line 108
    .line 109
    invoke-static {v0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    filled-new-array {p1}, [Ll/pf60;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    const-string v0, "e_blacklist"

    .line 118
    .line 119
    invoke-static {v0, p0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 120
    .line 121
    .line 122
    return-void
.end method

.method public u0()Z
    .locals 4

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->x()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 19
    .line 20
    iget-object v2, p0, Ll/f400;->c:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-eqz v2, :cond_1

    .line 31
    .line 32
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 33
    .line 34
    const-string v3, "dismissed"

    .line 35
    .line 36
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-eqz v2, :cond_0

    .line 41
    .line 42
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 43
    .line 44
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    if-eqz v2, :cond_0

    .line 49
    .line 50
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 51
    .line 52
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->quickChat:Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;

    .line 53
    .line 54
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    if-eqz v2, :cond_0

    .line 59
    .line 60
    iget-object p0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 61
    .line 62
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->quickChat:Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;

    .line 63
    .line 64
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->avatarBlurred:Z

    .line 65
    .line 66
    return p0

    .line 67
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 68
    .line 69
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 70
    .line 71
    iget-object p0, p0, Ll/f400;->c:Ljava/lang/String;

    .line 72
    .line 73
    invoke-virtual {v0, p0}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isOnlinePending()Z

    .line 78
    .line 79
    .line 80
    move-result p0

    .line 81
    if-eqz p0, :cond_1

    .line 82
    .line 83
    const/4 p0, 0x1

    .line 84
    return p0

    .line 85
    :cond_1
    return v1
.end method

.method public x0()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f400;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final y0()V
    .locals 3

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->u()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 18
    .line 19
    iget-object v1, p0, Ll/f400;->c:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->Ne(Ljava/lang/String;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ll/d400;

    .line 26
    .line 27
    invoke-direct {v1}, Ll/d400;-><init>()V

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
    iget-object v1, p0, Ll/f400;->e:Lrx/subjects/a;

    .line 39
    .line 40
    new-instance v2, Ll/avz;

    .line 41
    .line 42
    invoke-direct {v2}, Ll/avz;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-static {v0, v1, v2}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    new-instance v1, Ll/e400;

    .line 54
    .line 55
    invoke-direct {v1, p0}, Ll/e400;-><init>(Ll/f400;)V

    .line 56
    .line 57
    .line 58
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 63
    .line 64
    .line 65
    :cond_0
    return-void
.end method

.method public final z0()V
    .locals 2

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->W8()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/f400;->x0()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->Ue(Ljava/lang/String;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/f400$b;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/f400$b;-><init>(Ll/f400;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    new-instance v1, Ll/f400$a;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Ll/f400$a;-><init>(Ll/f400;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    new-instance v1, Ll/f400$c;

    .line 54
    .line 55
    invoke-direct {v1, p0}, Ll/f400$c;-><init>(Ll/f400;)V

    .line 56
    .line 57
    .line 58
    new-instance p0, Ll/r300;

    .line 59
    .line 60
    invoke-direct {p0}, Ll/r300;-><init>()V

    .line 61
    .line 62
    .line 63
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 68
    .line 69
    .line 70
    :cond_0
    return-void
.end method
