.class public Ll/ijk;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/sjk;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Lcom/p1/mobile/putong/core/data/ChatGroup;

.field public c:Lcom/p1/mobile/putong/core/data/ChatGroupMember;

.field public d:Lcom/p1/mobile/putong/core/data/GroupApply;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e0(Ll/ijk;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ijk;->o0(Lcom/p1/mobile/putong/core/data/Conversation;)V

    return-void
.end method

.method public static synthetic f0(Ll/ijk;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ijk;->r0(Ll/pf60;)V

    return-void
.end method

.method public static synthetic g0(Lcom/p1/mobile/putong/core/data/ChatGroup;)Lrx/c;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->ownerUserId:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/dkb;->Ma(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/fjk;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/fjk;-><init>(Lcom/p1/mobile/putong/core/data/ChatGroup;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public static synthetic h0(Ll/ijk;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ijk;->q0(Ll/bkj0;)V

    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/p1/mobile/putong/data/User;)Ll/pf60;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic j0(Ll/ijk;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ijk;->p0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic k0(Ll/ijk;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ijk;->n0(Ljava/lang/String;)V

    return-void
.end method

.method private synthetic p0(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/sjk;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/sjk;->r()V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/ijk;->b:Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 9
    .line 10
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 17
    .line 18
    check-cast p1, Ll/sjk;

    .line 19
    .line 20
    iget-object v0, p0, Ll/ijk;->b:Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 21
    .line 22
    iget-object v1, p0, Ll/ijk;->c:Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    .line 23
    .line 24
    iget-object p0, p0, Ll/ijk;->d:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 25
    .line 26
    invoke-virtual {p1, v0, v1, p0}, Ll/sjk;->p0(Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/p1/mobile/putong/core/data/ChatGroupMember;Lcom/p1/mobile/putong/core/data/GroupApply;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method private synthetic q0(Ll/bkj0;)V
    .locals 3

    .line 1
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    move-object v1, v0

    .line 4
    check-cast v1, Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 5
    .line 6
    iput-object v1, p0, Ll/ijk;->b:Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 7
    .line 8
    iget-object v1, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 9
    .line 10
    move-object v2, v1

    .line 11
    check-cast v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    .line 12
    .line 13
    iput-object v2, p0, Ll/ijk;->c:Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    .line 14
    .line 15
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 16
    .line 17
    move-object v2, p1

    .line 18
    check-cast v2, Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 19
    .line 20
    iput-object v2, p0, Ll/ijk;->d:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 21
    .line 22
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 23
    .line 24
    check-cast p0, Ll/sjk;

    .line 25
    .line 26
    check-cast v0, Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 27
    .line 28
    check-cast v1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    .line 29
    .line 30
    check-cast p1, Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 31
    .line 32
    invoke-virtual {p0, v0, v1, p1}, Ll/sjk;->p0(Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/p1/mobile/putong/core/data/ChatGroupMember;Lcom/p1/mobile/putong/core/data/GroupApply;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method


# virtual methods
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
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    const-string v1, "group_id"

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iput-object v1, p0, Ll/ijk;->a:Ljava/lang/String;

    .line 25
    .line 26
    const-string v1, "chat_group"

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 33
    .line 34
    iput-object v0, p0, Ll/ijk;->b:Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public a0()V
    .locals 5

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ajk;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/ajk;-><init>(Ll/ijk;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 15
    .line 16
    iget-object v1, p0, Ll/ijk;->a:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/e;->o6(Ljava/lang/String;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/ui7;

    .line 23
    .line 24
    invoke-direct {v1}, Ll/ui7;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 32
    .line 33
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 34
    .line 35
    iget-object v2, p0, Ll/ijk;->a:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    const/4 v4, 0x1

    .line 46
    invoke-virtual {v1, v2, v3, v4}, Lcom/p1/mobile/putong/core/api/e;->U6(Ljava/lang/String;Ljava/lang/String;Z)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 51
    .line 52
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 53
    .line 54
    iget-object v3, p0, Ll/ijk;->a:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/api/e;->M6(Ljava/lang/String;)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    new-instance v3, Ll/bjk;

    .line 61
    .line 62
    invoke-direct {v3}, Ll/bjk;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-static {v0, v1, v2, v3}, Ll/psd0;->s(Lrx/c;Lrx/c;Lrx/c;Ll/scj;)Lrx/c;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    new-instance v1, Ll/cjk;

    .line 74
    .line 75
    invoke-direct {v1, p0}, Ll/cjk;-><init>(Ll/ijk;)V

    .line 76
    .line 77
    .line 78
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 83
    .line 84
    .line 85
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 86
    .line 87
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 88
    .line 89
    iget-object v1, p0, Ll/ijk;->a:Ljava/lang/String;

    .line 90
    .line 91
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/e;->o6(Ljava/lang/String;)Lrx/c;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    new-instance v1, Ll/ui7;

    .line 96
    .line 97
    invoke-direct {v1}, Ll/ui7;-><init>()V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    new-instance v1, Ll/djk;

    .line 105
    .line 106
    invoke-direct {v1}, Ll/djk;-><init>()V

    .line 107
    .line 108
    .line 109
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    new-instance v1, Ll/ejk;

    .line 118
    .line 119
    invoke-direct {v1, p0}, Ll/ejk;-><init>(Ll/ijk;)V

    .line 120
    .line 121
    .line 122
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 127
    .line 128
    .line 129
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 130
    .line 131
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 132
    .line 133
    iget-object p0, p0, Ll/ijk;->a:Ljava/lang/String;

    .line 134
    .line 135
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/e;->X8(Ljava/lang/String;)Lrx/c;

    .line 136
    .line 137
    .line 138
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public l0(Ljava/lang/String;)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/ijk;->c:Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    .line 2
    .line 3
    const-string v1, "is_anonymou_group"

    .line 4
    .line 5
    const-string v2, "groupchat_id"

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->status:Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;

    .line 10
    .line 11
    const-string v3, "exited"

    .line 12
    .line 13
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-virtual {p0}, Ll/ijk;->pageId()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iget-object v0, p0, Ll/ijk;->a:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v2, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v2, p0, Ll/ijk;->b:Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 31
    .line 32
    invoke-static {v2}, Ll/jek;->s(Lcom/p1/mobile/putong/core/data/ChatGroup;)Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    invoke-static {v1, v2}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    filled-new-array {v0, v1}, [Ll/sfj0$a;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    const-string v1, "e_enter_groupchat"

    .line 45
    .line 46
    invoke-static {v1, p1, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 47
    .line 48
    .line 49
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 50
    .line 51
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 52
    .line 53
    iget-object v0, p0, Ll/ijk;->a:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/api/g;->Dg(Ljava/lang/String;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    new-instance v0, Ll/sb8;

    .line 64
    .line 65
    invoke-direct {v0}, Ll/sb8;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    const/4 v0, 0x1

    .line 73
    invoke-virtual {p1, v0}, Lrx/c;->take(I)Lrx/c;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    new-instance v0, Ll/hjk;

    .line 78
    .line 79
    invoke-direct {v0, p0}, Ll/hjk;-><init>(Ll/ijk;)V

    .line 80
    .line 81
    .line 82
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :cond_1
    :goto_0
    invoke-virtual {p0}, Ll/ijk;->pageId()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    iget-object v3, p0, Ll/ijk;->a:Ljava/lang/String;

    .line 95
    .line 96
    invoke-static {v2, v3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    iget-object v3, p0, Ll/ijk;->b:Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 101
    .line 102
    invoke-static {v3}, Ll/jek;->s(Lcom/p1/mobile/putong/core/data/ChatGroup;)Z

    .line 103
    .line 104
    .line 105
    move-result v3

    .line 106
    invoke-static {v1, v3}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    filled-new-array {v2, v1}, [Ll/sfj0$a;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    const-string v2, "e_apply_add_group_button"

    .line 115
    .line 116
    invoke-static {v2, v0, v1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 117
    .line 118
    .line 119
    iget-object v0, p0, Ll/ijk;->b:Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 120
    .line 121
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->category:Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 122
    .line 123
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;->id:Ljava/lang/String;

    .line 124
    .line 125
    const-string v1, "17"

    .line 126
    .line 127
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    if-eqz v0, :cond_2

    .line 132
    .line 133
    sget-object p1, Ll/uqb0;->b0:Ll/sre0;

    .line 134
    .line 135
    iget-object p1, p1, Ll/sre0;->c:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 136
    .line 137
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    iget-object p0, p0, Ll/ijk;->a:Ljava/lang/String;

    .line 142
    .line 143
    invoke-interface {p1, v0, p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->ek(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    return-void

    .line 147
    :cond_2
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    const-string v0, "group_apply"

    .line 152
    .line 153
    invoke-static {v0}, Lcom/p1/mobile/putong/data/DetectCategoryType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/DetectCategoryType;

    .line 154
    .line 155
    .line 156
    move-result-object v3

    .line 157
    invoke-virtual {p0}, Ll/ijk;->pageId()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v5

    .line 161
    new-instance v6, Ll/gjk;

    .line 162
    .line 163
    invoke-direct {v6, p0, p1}, Ll/gjk;-><init>(Ll/ijk;Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    const/4 v7, 0x0

    .line 167
    const-string v4, "group_apply"

    .line 168
    .line 169
    move-object v2, p1

    .line 170
    invoke-static/range {v1 .. v7}, Lcom/p1/mobile/putong/util/AntiSpamHelper;->c(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/DetectCategoryType;Ljava/lang/String;Ljava/lang/String;Ll/x20;Ll/x20;)V

    .line 171
    .line 172
    .line 173
    return-void
.end method

.method public m0()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ijk;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic n0(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Ll/ijk;->a:Ljava/lang/String;

    .line 6
    .line 7
    const-string v1, "profile"

    .line 8
    .line 9
    invoke-static {v0, p0, p1, v1}, Ll/jek;->t(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic o0(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-static {p0, p1, v1, v1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->k2(Landroid/content/Context;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_group_information"

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic r0(Ll/pf60;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/sjk;

    .line 4
    .line 5
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v0, Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 8
    .line 9
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    invoke-virtual {p0, v0, p1}, Ll/sjk;->o0(Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/p1/mobile/putong/data/User;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public s0()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/ijk;->b:Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    iget-object p0, p0, Ll/ijk;->b:Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 23
    .line 24
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->ownerUserId:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {p0}, Ll/jek;->s(Lcom/p1/mobile/putong/core/data/ChatGroup;)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    if-eqz p0, :cond_1

    .line 31
    .line 32
    const-string p0, "chat_group_anonymity"

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    const-string p0, "chat_group"

    .line 36
    .line 37
    :goto_0
    const/4 v4, 0x0

    .line 38
    invoke-interface {v1, v2, v3, p0, v4}, Ll/r97;->M1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method
