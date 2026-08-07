.class public Ll/yik;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/zik;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/data/Links;


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

.method public static synthetic e0(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic f0()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/e;->U8()Lrx/c;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic g0(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic h0(Ll/yik;Lcom/p1/mobile/putong/core/data/GroupApply;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yik;->t0(Lcom/p1/mobile/putong/core/data/GroupApply;)V

    return-void
.end method

.method public static synthetic i0(Ll/yik;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/yik;->x0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic j0(Ll/yik;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yik;->u0(Landroid/util/Pair;)V

    return-void
.end method

.method public static synthetic k0(Ll/yik;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yik;->y0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic l0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic m0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->B2:I

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic n0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic o0(Ll/yik;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/yik;->z0(Ljava/lang/Throwable;)V

    return-void
.end method

.method private pageId()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->pageId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method private s0()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/e;->C6()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/sik;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/sik;-><init>(Ll/yik;)V

    .line 24
    .line 25
    .line 26
    new-instance v2, Ll/tik;

    .line 27
    .line 28
    invoke-direct {v2}, Ll/tik;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 39
    .line 40
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/e;->c7()Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    new-instance v1, Ll/uik;

    .line 59
    .line 60
    invoke-direct {v1, p0}, Ll/uik;-><init>(Ll/yik;)V

    .line 61
    .line 62
    .line 63
    new-instance v2, Ll/vik;

    .line 64
    .line 65
    invoke-direct {v2}, Ll/vik;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 76
    .line 77
    check-cast v0, Ll/zik;

    .line 78
    .line 79
    const/4 v1, 0x1

    .line 80
    invoke-virtual {v0, v1}, Ll/zik;->f(Z)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0}, Ll/yik;->C0()V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method private synthetic x0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/zik;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/zik;->r()V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Ll/yik;->s0()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private synthetic z0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget p1, Lcom/p1/mobile/putong/core/message/R$string;->B2:I

    .line 2
    .line 3
    invoke-static {p1}, Ll/o1j0;->h(I)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 7
    .line 8
    check-cast p0, Ll/zik;

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    invoke-virtual {p0, p1}, Ll/zik;->f(Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public A0(Lcom/p1/mobile/putong/core/data/GroupNotification;Lcom/p1/mobile/putong/core/data/GroupApplyStatus;)V
    .locals 8

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/GroupNotification;->groupApplyData:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/GroupApply;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/yik;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance v1, Ll/pf60;

    .line 10
    .line 11
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/GroupNotification;->chatGroupData:Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 12
    .line 13
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 14
    .line 15
    const-string v3, "groupchat_id"

    .line 16
    .line 17
    invoke-direct {v1, v3, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    new-instance v2, Ll/pf60;

    .line 21
    .line 22
    const-string v3, "approved"

    .line 23
    .line 24
    invoke-static {p2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    const-string v4, "is_agree"

    .line 33
    .line 34
    invoke-direct {v2, v4, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    new-instance v3, Ll/pf60;

    .line 38
    .line 39
    iget-object v4, p1, Lcom/p1/mobile/putong/core/data/GroupNotification;->chatGroupData:Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 40
    .line 41
    invoke-static {v4}, Ll/jek;->s(Lcom/p1/mobile/putong/core/data/ChatGroup;)Z

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    const-string v5, "is_anonymou_group"

    .line 50
    .line 51
    invoke-direct {v3, v5, v4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    new-instance v4, Ll/pf60;

    .line 55
    .line 56
    const-string v5, "notice_id"

    .line 57
    .line 58
    iget-object v6, p1, Lcom/p1/mobile/putong/core/data/GroupNotification;->id:Ljava/lang/String;

    .line 59
    .line 60
    invoke-direct {v4, v5, v6}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    new-instance v5, Ll/pf60;

    .line 64
    .line 65
    const-string v6, "notice_type"

    .line 66
    .line 67
    iget-object v7, p1, Lcom/p1/mobile/putong/core/data/GroupNotification;->type:Ljava/lang/String;

    .line 68
    .line 69
    invoke-direct {v5, v6, v7}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 70
    .line 71
    .line 72
    new-instance v6, Ll/pf60;

    .line 73
    .line 74
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/GroupNotification;->userData:Lcom/p1/mobile/putong/data/User;

    .line 75
    .line 76
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 77
    .line 78
    const-string v7, "user_id"

    .line 79
    .line 80
    invoke-direct {v6, v7, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 81
    .line 82
    .line 83
    filled-new-array/range {v1 .. v6}, [Ll/pf60;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    const-string v1, "e_apply_add_group_notice"

    .line 88
    .line 89
    invoke-static {v1, p0, p1}, Ll/sfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 90
    .line 91
    .line 92
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 93
    .line 94
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 95
    .line 96
    invoke-virtual {p0, v0, p2}, Lcom/p1/mobile/putong/core/api/e;->J8(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/GroupApplyStatus;)Lrx/c;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    new-instance p1, Ll/nik;

    .line 101
    .line 102
    invoke-direct {p1}, Ll/nik;-><init>()V

    .line 103
    .line 104
    .line 105
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 106
    .line 107
    .line 108
    move-result-object p2

    .line 109
    invoke-virtual {p2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 110
    .line 111
    .line 112
    move-result-object p2

    .line 113
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    new-instance v0, Ll/oik;

    .line 117
    .line 118
    invoke-direct {v0, p2}, Ll/oik;-><init>(Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;)V

    .line 119
    .line 120
    .line 121
    invoke-static {p1, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 126
    .line 127
    .line 128
    return-void
.end method

.method public C0()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/e;->a7()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/mik;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/mik;-><init>(Ll/yik;)V

    .line 16
    .line 17
    .line 18
    new-instance v2, Ll/pik;

    .line 19
    .line 20
    invoke-direct {v2, p0}, Ll/pik;-><init>(Ll/yik;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public a0()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/qik;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/qik;-><init>(Ll/yik;)V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ll/rik;

    .line 10
    .line 11
    invoke-direct {v1}, Ll/rik;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0, v1}, Ll/ar2;->creates(Ll/y20;Ll/x20;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public p0(Lcom/p1/mobile/putong/core/data/GroupNotification;)V
    .locals 6

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/GroupNotification;->chatGroupData:Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/GroupNotification;->userData:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-direct {p0}, Ll/yik;->pageId()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    new-instance v0, Ll/pf60;

    .line 15
    .line 16
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/GroupNotification;->chatGroupData:Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 17
    .line 18
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 19
    .line 20
    const-string v2, "groupchat_id"

    .line 21
    .line 22
    invoke-direct {v0, v2, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    new-instance v1, Ll/pf60;

    .line 26
    .line 27
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/GroupNotification;->chatGroupData:Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 28
    .line 29
    invoke-static {v2}, Ll/jek;->s(Lcom/p1/mobile/putong/core/data/ChatGroup;)Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    const-string v3, "is_anonymou_group"

    .line 38
    .line 39
    invoke-direct {v1, v3, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    new-instance v2, Ll/pf60;

    .line 43
    .line 44
    const-string v3, "notice_id"

    .line 45
    .line 46
    iget-object v4, p1, Lcom/p1/mobile/putong/core/data/GroupNotification;->id:Ljava/lang/String;

    .line 47
    .line 48
    invoke-direct {v2, v3, v4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    new-instance v3, Ll/pf60;

    .line 52
    .line 53
    const-string v4, "notice_type"

    .line 54
    .line 55
    iget-object v5, p1, Lcom/p1/mobile/putong/core/data/GroupNotification;->type:Ljava/lang/String;

    .line 56
    .line 57
    invoke-direct {v3, v4, v5}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    new-instance v4, Ll/pf60;

    .line 61
    .line 62
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/GroupNotification;->userData:Lcom/p1/mobile/putong/data/User;

    .line 63
    .line 64
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 65
    .line 66
    const-string v5, "user_id"

    .line 67
    .line 68
    invoke-direct {v4, v5, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 69
    .line 70
    .line 71
    filled-new-array {v0, v1, v2, v3, v4}, [Ll/pf60;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    const-string v0, "e_apply_add_group_notice"

    .line 76
    .line 77
    invoke-static {v0, p0, p1}, Ll/sfj0;->l(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 78
    .line 79
    .line 80
    :cond_1
    :goto_0
    return-void
.end method

.method public q0(Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-static {p1}, Ll/jek;->s(Lcom/p1/mobile/putong/core/data/ChatGroup;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    invoke-interface {v0, p1}, Ll/r97;->n0(Z)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {p0, p2, p1}, Ll/jek;->e(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 45
    .line 46
    .line 47
    :cond_1
    :goto_0
    return-void
.end method

.method public r()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/e;->D6()Lrx/subjects/a;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Landroid/util/Pair;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iget-object v1, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 18
    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    check-cast v1, Lcom/p1/mobile/putong/data/Links;

    .line 22
    .line 23
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    iget-object v0, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 33
    .line 34
    check-cast v0, Lcom/p1/mobile/putong/data/Links;

    .line 35
    .line 36
    iput-object v0, p0, Ll/yik;->a:Lcom/p1/mobile/putong/data/Links;

    .line 37
    .line 38
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 39
    .line 40
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/api/e;->b7(Ljava/lang/String;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    new-instance v0, Ll/wik;

    .line 53
    .line 54
    invoke-direct {v0}, Ll/wik;-><init>()V

    .line 55
    .line 56
    .line 57
    new-instance v1, Ll/xik;

    .line 58
    .line 59
    invoke-direct {v1}, Ll/xik;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 67
    .line 68
    .line 69
    :cond_1
    :goto_0
    return-void
.end method

.method public r0()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yik;->a:Lcom/p1/mobile/putong/data/Links;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/yik;->a:Lcom/p1/mobile/putong/data/Links;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public final synthetic t0(Lcom/p1/mobile/putong/core/data/GroupApply;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/zik;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/zik;->i(Lcom/p1/mobile/putong/core/data/GroupApply;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic u0(Landroid/util/Pair;)V
    .locals 1

    .line 1
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/data/Links;

    .line 4
    .line 5
    iput-object v0, p0, Ll/yik;->a:Lcom/p1/mobile/putong/data/Links;

    .line 6
    .line 7
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast p0, Ll/zik;

    .line 10
    .line 11
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast p1, Ljava/util/List;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/zik;->e(Ljava/util/List;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic y0(Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/zik;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-virtual {p0, p1}, Ll/zik;->f(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
