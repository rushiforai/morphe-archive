.class public Ll/dg6;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ll/jxd0;

.field public static b:Ll/jxd0;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ll/jxd0;

    .line 2
    .line 3
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 4
    .line 5
    const-string v2, "show_heartbeat_debug_item"

    .line 6
    .line 7
    invoke-direct {v0, v2, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Ll/dg6;->a:Ll/jxd0;

    .line 11
    .line 12
    new-instance v0, Ll/jxd0;

    .line 13
    .line 14
    const-string v2, "show_chatemoji_debug_item"

    .line 15
    .line 16
    invoke-direct {v0, v2, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Ll/dg6;->b:Ll/jxd0;

    .line 20
    .line 21
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a()V
    .locals 0

    .line 1
    invoke-static {}, Ll/dg6;->u()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->I:Lrx/subjects/a;

    .line 6
    .line 7
    const-string v1, "match_timeout"

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    new-instance v0, Ll/nf6;

    .line 18
    .line 19
    invoke-direct {v0}, Ll/nf6;-><init>()V

    .line 20
    .line 21
    .line 22
    const-wide/16 v1, 0xbb8

    .line 23
    .line 24
    invoke-static {p0, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static synthetic c()V
    .locals 0

    .line 1
    invoke-static {}, Ll/dg6;->v()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d()V
    .locals 0

    .line 1
    invoke-static {}, Ll/dg6;->u()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e()V
    .locals 0

    .line 1
    invoke-static {}, Ll/dg6;->v()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Tag;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Tag;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1, p0}, Lcom/p1/mobile/putong/data/Tag;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public static synthetic g()V
    .locals 0

    .line 1
    invoke-static {}, Ll/dg6;->v()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h()V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;->isSpeedMatch:Z

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;->userId:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-interface {v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;->user:Lcom/p1/mobile/putong/data/User;

    .line 28
    .line 29
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->m0(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;)Lcom/p1/mobile/android/app/Dialog;

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/dg6;->v()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/rf6;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/rf6;-><init>()V

    .line 7
    .line 8
    .line 9
    const-wide/16 v1, 0xbb8

    .line 10
    .line 11
    invoke-static {p0, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic j(Ljava/util/ArrayList;Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/vf6;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/vf6;-><init>()V

    .line 7
    .line 8
    .line 9
    const-string v1, "\u63a8\u9001\u5fc3\u52a8\u4fe1\u53f7\uff1a"

    .line 10
    .line 11
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    new-instance v0, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    const-string v1, "\u6253\u5f00\u5173\u95eddebug\u5165\u53e3\uff1a"

    .line 21
    .line 22
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    sget-object v1, Ll/dg6;->a:Ll/jxd0;

    .line 26
    .line 27
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    new-instance v1, Ll/wf6;

    .line 39
    .line 40
    invoke-direct {v1}, Ll/wf6;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    new-instance v0, Ll/xf6;

    .line 51
    .line 52
    invoke-direct {v0}, Ll/xf6;-><init>()V

    .line 53
    .line 54
    .line 55
    const-string v1, "\u95ea\u804a\u6210\u529f\uff1a"

    .line 56
    .line 57
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    new-instance v0, Ll/yf6;

    .line 65
    .line 66
    invoke-direct {v0, p1}, Ll/yf6;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 67
    .line 68
    .line 69
    const-string v1, "\u95ea\u804a\u6210\u529f-- \u63a8\u9001\u5fc3\u52a8\u4fe1\u53f7"

    .line 70
    .line 71
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    new-instance v0, Ll/zf6;

    .line 79
    .line 80
    invoke-direct {v0, p1}, Ll/zf6;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 81
    .line 82
    .line 83
    const-string v1, "\u63a8\u9001\u5fc3\u52a8\u4fe1\u53f7-- \u95ea\u804a\u6210\u529f"

    .line 84
    .line 85
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    new-instance v0, Ll/ag6;

    .line 93
    .line 94
    invoke-direct {v0}, Ll/ag6;-><init>()V

    .line 95
    .line 96
    .line 97
    const-string v1, "\u63d2\u5165\u5e7f\u64ad"

    .line 98
    .line 99
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    new-instance v0, Ll/bg6;

    .line 107
    .line 108
    invoke-direct {v0, p1}, Ll/bg6;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 109
    .line 110
    .line 111
    const-string v1, "\u63a8\u9001\u5fc3\u52a8\u4fe1\u53f7--\u63d2\u5165\u5e7f\u64ad"

    .line 112
    .line 113
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    new-instance v0, Ll/cg6;

    .line 121
    .line 122
    invoke-direct {v0, p1}, Ll/cg6;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 123
    .line 124
    .line 125
    const-string v1, "\u63d2\u5165\u5e7f\u64ad--\u63a8\u9001\u5fc3\u52a8\u4fe1\u53f7"

    .line 126
    .line 127
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    new-instance v0, Ll/lf6;

    .line 135
    .line 136
    invoke-direct {v0, p1}, Ll/lf6;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 137
    .line 138
    .line 139
    const-string v1, "\u63a8\u9001\u5fc3\u52a8\u4fe1\u53f7--\u8d85\u65f6"

    .line 140
    .line 141
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 146
    .line 147
    .line 148
    new-instance v0, Ll/mf6;

    .line 149
    .line 150
    invoke-direct {v0, p1}, Ll/mf6;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 151
    .line 152
    .line 153
    const-string v1, "\u8d85\u65f6--\u63a8\u9001\u5fc3\u52a8\u4fe1\u53f7"

    .line 154
    .line 155
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 160
    .line 161
    .line 162
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->showDebugMenu(Ljava/util/ArrayList;)V

    .line 163
    .line 164
    .line 165
    return-void
.end method

.method public static synthetic k()V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;->userId:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-interface {v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;->user:Lcom/p1/mobile/putong/data/User;

    .line 25
    .line 26
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->m0(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;)Lcom/p1/mobile/android/app/Dialog;

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/dg6;->u()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/pf6;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/pf6;-><init>()V

    .line 7
    .line 8
    .line 9
    const-wide/16 v1, 0xbb8

    .line 10
    .line 11
    invoke-static {p0, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic m(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/dg6;->v()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/sf6;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/sf6;-><init>()V

    .line 7
    .line 8
    .line 9
    const-wide/16 v1, 0xbb8

    .line 10
    .line 11
    invoke-static {p0, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic n(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;->userId:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-interface {v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;->user:Lcom/p1/mobile/putong/data/User;

    .line 25
    .line 26
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->m0(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;)Lcom/p1/mobile/android/app/Dialog;

    .line 27
    .line 28
    .line 29
    new-instance v0, Ll/qf6;

    .line 30
    .line 31
    invoke-direct {v0}, Ll/qf6;-><init>()V

    .line 32
    .line 33
    .line 34
    const-wide/16 v1, 0xbb8

    .line 35
    .line 36
    invoke-static {p0, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public static synthetic o()V
    .locals 2

    .line 1
    sget-object v0, Ll/dg6;->a:Ll/jxd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    xor-int/lit8 v1, v1, 0x1

    .line 14
    .line 15
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic p()V
    .locals 0

    .line 1
    invoke-static {}, Ll/dg6;->v()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic q()V
    .locals 2

    .line 1
    sget-object v0, Ll/dg6;->a:Ll/jxd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    xor-int/lit8 v1, v1, 0x1

    .line 14
    .line 15
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic r(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/dg6;->v()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/of6;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/of6;-><init>()V

    .line 7
    .line 8
    .line 9
    const-wide/16 v1, 0xbb8

    .line 10
    .line 11
    invoke-static {p0, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic s()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->I:Lrx/subjects/a;

    .line 6
    .line 7
    const-string v1, "match_timeout"

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static t(Lcom/p1/mobile/android/app/Act;Ll/zt6;)Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/zt6;",
            ")",
            "Ljava/util/ArrayList<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ll/x20;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance p1, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ll/kf6;

    .line 7
    .line 8
    invoke-direct {v0, p1, p0}, Ll/kf6;-><init>(Ljava/util/ArrayList;Lcom/p1/mobile/android/app/Act;)V

    .line 9
    .line 10
    .line 11
    const-string p0, "\u5fc3\u52a8\u4fe1\u53f7"

    .line 12
    .line 13
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    new-instance p0, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string v0, "\u6253\u5f00\u5173\u95edchatEmoji debug\u5165\u53e3\uff1a"

    .line 23
    .line 24
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    sget-object v0, Ll/dg6;->a:Ll/jxd0;

    .line 28
    .line 29
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    new-instance v0, Ll/uf6;

    .line 41
    .line 42
    invoke-direct {v0}, Ll/uf6;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    return-object p1
.end method

.method public static u()V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "\u91cd\u751f\u7684\u5c0f\u80d6\u5b50"

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->name:Ljava/lang/String;

    .line 9
    .line 10
    const-string v1, "349281368"

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->userId:Ljava/lang/String;

    .line 13
    .line 14
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 17
    .line 18
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    const-string v1, "https://auto.tancdn.com/v1/images/eyJpZCI6Ikk2MlRQNldBSVFaM1ZRRFRPU01FSFdIS043Nk5RUTA0IiwidyI6MTk2MCwiaCI6MTk1OSwiZCI6MCwibXQiOiJpbWFnZS9qcGVnIiwiZGgiOjYxNzE0NDg5Nzk1MzUzMzg2ODAsImFiIjowfQ.jpg?format=128x128"

    .line 34
    .line 35
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->avatarUrl:Ljava/lang/String;

    .line 36
    .line 37
    const-string v1, ""

    .line 38
    .line 39
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->action:Ljava/lang/String;

    .line 40
    .line 41
    const-string v1, "female"

    .line 42
    .line 43
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->gender:Ljava/lang/String;

    .line 44
    .line 45
    const-string v1, "10"

    .line 46
    .line 47
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->age:Ljava/lang/String;

    .line 48
    .line 49
    const/16 v1, 0x64

    .line 50
    .line 51
    iput v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->distance:I

    .line 52
    .line 53
    const-string v1, "\u559c\u6b22\u5e7f\u573a\u821e"

    .line 54
    .line 55
    const-string v2, "\u559c\u6b22\u54c8\u54c8\u54c8"

    .line 56
    .line 57
    const-string v3, "\u5531\u5404\u8428\u8fbe\u591a\u4e2a"

    .line 58
    .line 59
    filled-new-array {v3, v1, v2}, [Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    new-instance v2, Ll/tf6;

    .line 64
    .line 65
    invoke-direct {v2}, Ll/tf6;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-static {v1, v2}, Ll/jyb;->R([Ljava/lang/Object;Ll/qcj;)Ljava/util/ArrayList;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->userTagList:Ljava/util/ArrayList;

    .line 73
    .line 74
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 75
    .line 76
    iget-object v2, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 77
    .line 78
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 79
    .line 80
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->a0:Lrx/subjects/a;

    .line 81
    .line 82
    invoke-virtual {v1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    check-cast v1, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 87
    .line 88
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 89
    .line 90
    const/4 v3, 0x1

    .line 91
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    check-cast v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 96
    .line 97
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 98
    .line 99
    invoke-virtual {v2, v1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->user:Lcom/p1/mobile/putong/data/User;

    .line 104
    .line 105
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->I:Lrx/subjects/a;

    .line 110
    .line 111
    new-instance v2, Ll/pf60;

    .line 112
    .line 113
    const-string v3, "tickets_broadcast"

    .line 114
    .line 115
    invoke-direct {v2, v3, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {v1, v2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 119
    .line 120
    .line 121
    return-void
.end method

.method public static v()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/PushMessageCustom;->new_()Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->userId:Ljava/lang/String;

    .line 14
    .line 15
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->H1:Ll/f49;

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-virtual {v1, v0, v2}, Ll/f49;->W3(Lcom/p1/mobile/putong/data/PushMessageCustom;Z)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static w(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    const-wide/16 v1, 0x0

    .line 3
    .line 4
    invoke-static {p0, v0, v0, v1, v2}, Ll/nbz;->C2(Lcom/p1/mobile/putong/core/data/Conversation;ZZJ)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static x(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/nbz;->D2(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
