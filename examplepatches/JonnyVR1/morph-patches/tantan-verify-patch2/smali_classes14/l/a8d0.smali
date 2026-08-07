.class public Ll/a8d0;
.super Ll/spl0;
.source "SourceFile"


# static fields
.field public static e:Ll/a8d0;


# instance fields
.field public b:Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;

.field public c:Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;

.field public d:Ll/kcg0;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/spl0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static A0()Z
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->D0:Lcom/p1/mobile/putong/core/api/v;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/v;->U:Ll/byd0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Long;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    invoke-static {v0, v1}, Ll/pzi0;->D(J)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const/4 v1, 0x0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 27
    .line 28
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 39
    .line 40
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 41
    .line 42
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_0

    .line 51
    .line 52
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 53
    .line 54
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->D0:Lcom/p1/mobile/putong/core/api/v;

    .line 55
    .line 56
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/v;->V:Ll/vxd0;

    .line 57
    .line 58
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    check-cast v0, Ljava/lang/Integer;

    .line 63
    .line 64
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    invoke-static {}, Ll/a8d0;->u0()I

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    if-lt v0, v2, :cond_0

    .line 73
    .line 74
    const/4 v0, 0x1

    .line 75
    return v0

    .line 76
    :cond_0
    return v1
.end method

.method public static E0()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->D0:Lcom/p1/mobile/putong/core/api/v;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/v;->U:Ll/byd0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Long;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    invoke-static {v0, v1}, Ll/pzi0;->D(J)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const/4 v1, 0x1

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->D0:Lcom/p1/mobile/putong/core/api/v;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/v;->V:Ll/vxd0;

    .line 29
    .line 30
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    check-cast v2, Ljava/lang/Integer;

    .line 35
    .line 36
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    add-int/2addr v2, v1

    .line 41
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 50
    .line 51
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->D0:Lcom/p1/mobile/putong/core/api/v;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/v;->U:Ll/byd0;

    .line 54
    .line 55
    invoke-static {}, Ll/pzi0;->o()J

    .line 56
    .line 57
    .line 58
    move-result-wide v2

    .line 59
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-virtual {v0, v2}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 67
    .line 68
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->D0:Lcom/p1/mobile/putong/core/api/v;

    .line 69
    .line 70
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/v;->V:Ll/vxd0;

    .line 71
    .line 72
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-virtual {v0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public static F0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    sput-object v0, Ll/a8d0;->e:Ll/a8d0;

    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/joa;->v4()Lrx/c;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic d0(Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;Z)Lrx/c;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->D0:Lcom/p1/mobile/putong/core/api/v;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->secretKey:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1, p1}, Lcom/p1/mobile/putong/core/api/v;->j4(Ljava/lang/String;Z)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    new-instance v0, Ll/o7d0;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/o7d0;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    new-instance v0, Ll/p7d0;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Ll/p7d0;-><init>(Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1, v0}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    new-instance v0, Ll/q7d0;

    .line 30
    .line 31
    invoke-direct {v0, p0}, Ll/q7d0;-><init>(Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, v0}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method

.method public static synthetic e0(Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;Z)Lrx/c;
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->D0:Lcom/p1/mobile/putong/core/api/v;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->secretKey:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v2, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->biz:Lcom/p1/mobile/putong/core/data/QuickChatType;

    .line 8
    .line 9
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->stage:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1, p1, v2, v3}, Lcom/p1/mobile/putong/core/api/v;->h4(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    new-instance v0, Ll/z7d0;

    .line 20
    .line 21
    invoke-direct {v0}, Ll/z7d0;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    new-instance v0, Ll/m7d0;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Ll/m7d0;-><init>(Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1, v0}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    new-instance v0, Ll/n7d0;

    .line 38
    .line 39
    invoke-direct {v0, p0}, Ll/n7d0;-><init>(Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1, v0}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0
.end method

.method public static synthetic f0(Ll/x20;ZLcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;Ljava/lang/String;Ll/uxj0;)V
    .locals 9

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p5

    .line 5
    if-eqz p5, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ll/x20;->call()V

    .line 8
    .line 9
    .line 10
    :cond_0
    if-eqz p1, :cond_1

    .line 11
    .line 12
    iget-object v1, p3, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->userID:Ljava/lang/String;

    .line 13
    .line 14
    const/4 v6, 0x0

    .line 15
    const/4 v7, 0x7

    .line 16
    const/4 v2, 0x0

    .line 17
    const/4 v3, 0x0

    .line 18
    const/4 v4, 0x0

    .line 19
    const/4 v5, 0x0

    .line 20
    move-object v0, p2

    .line 21
    move-object v8, p4

    .line 22
    invoke-static/range {v0 .. v8}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->q2(Landroid/content/Context;Ljava/lang/String;ZZZZLandroid/content/Intent;ILjava/lang/String;)Landroid/content/Intent;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    move-object v0, p2

    .line 31
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 34
    .line 35
    iget-object p1, p3, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->userID:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->l0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/android/app/Dialog;

    .line 42
    .line 43
    .line 44
    :goto_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/joa;->v4()Lrx/c;

    .line 49
    .line 50
    .line 51
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    iget-object p1, p3, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->userID:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->a0(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public static synthetic g0(Lcom/p1/mobile/putong/core/data/VirtualCardType;Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 2
    .line 3
    if-ne v0, p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->quickChatCardWrapper:Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;

    .line 6
    .line 7
    iget p0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->cardType:I

    .line 8
    .line 9
    iget p1, p1, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->cardType:I

    .line 10
    .line 11
    if-ne p0, p1, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;Ljava/lang/Boolean;)Lrx/c;
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->userID:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Ll/dkb;->t9(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic i0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->userID:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/g;->ap(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->userID:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/g;->ap(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic l0(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic m0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/joa;->v4()Lrx/c;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic n0(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;)V
    .locals 2

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
    const-string v0, "poll and get quickchat"

    .line 8
    .line 9
    invoke-static {v0}, Ll/t4j;->h(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ll/a8d0;->x0()Ll/a8d0;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;

    .line 17
    .line 18
    invoke-direct {v1, p1}, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;-><init>(Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p0, v1}, Ll/a8d0;->B0(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public static synthetic o0(Ll/x20;ZLcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;Ljava/lang/String;Ll/uxj0;)V
    .locals 9

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p5

    .line 5
    if-eqz p5, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ll/x20;->call()V

    .line 8
    .line 9
    .line 10
    :cond_0
    if-eqz p1, :cond_1

    .line 11
    .line 12
    iget-object v1, p3, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->userID:Ljava/lang/String;

    .line 13
    .line 14
    const/4 v6, 0x0

    .line 15
    const/4 v7, 0x7

    .line 16
    const/4 v2, 0x0

    .line 17
    const/4 v3, 0x0

    .line 18
    const/4 v4, 0x0

    .line 19
    const/4 v5, 0x0

    .line 20
    move-object v0, p2

    .line 21
    move-object v8, p4

    .line 22
    invoke-static/range {v0 .. v8}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->q2(Landroid/content/Context;Ljava/lang/String;ZZZZLandroid/content/Intent;ILjava/lang/String;)Landroid/content/Intent;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    move-object v0, p2

    .line 31
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 34
    .line 35
    iget-object p1, p3, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->userID:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->l0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/android/app/Dialog;

    .line 42
    .line 43
    .line 44
    :goto_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/joa;->v4()Lrx/c;

    .line 49
    .line 50
    .line 51
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    iget-object p1, p3, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->userID:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->a0(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public static synthetic p0(Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;Lcom/p1/mobile/putong/core/data/QuickChatOneside;)Lrx/c;
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/QuickChatOneside;->tracker:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->userID:Ljava/lang/String;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/QuickChatOneside;->tracker:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->e0(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->userID:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p1, p0}, Ll/dkb;->t9(Ljava/lang/String;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public static q0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;ZZLjava/lang/String;)V
    .locals 6

    .line 1
    const/4 v5, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move v2, p2

    .line 5
    move v3, p3

    .line 6
    move-object v4, p4

    .line 7
    invoke-static/range {v0 .. v5}, Ll/a8d0;->r0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;ZZLjava/lang/String;Ll/x20;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static r0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;ZZLjava/lang/String;Ll/x20;)V
    .locals 6
    .param p5    # Ll/x20;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    new-instance v0, Ll/s7d0;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, Ll/s7d0;-><init>(Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;Z)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    new-instance v0, Ll/t7d0;

    .line 11
    .line 12
    move-object v3, p0

    .line 13
    move-object v4, p1

    .line 14
    move v2, p3

    .line 15
    move-object v5, p4

    .line 16
    move-object v1, p5

    .line 17
    invoke-direct/range {v0 .. v5}, Ll/t7d0;-><init>(Ll/x20;ZLcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    new-instance p0, Ll/u7d0;

    .line 21
    .line 22
    invoke-direct {p0}, Ll/u7d0;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static s0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;ZZLjava/lang/String;Ll/x20;)V
    .locals 6
    .param p5    # Ll/x20;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    new-instance v0, Ll/v7d0;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, Ll/v7d0;-><init>(Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;Z)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    new-instance v0, Ll/w7d0;

    .line 11
    .line 12
    move-object v3, p0

    .line 13
    move-object v4, p1

    .line 14
    move v2, p3

    .line 15
    move-object v5, p4

    .line 16
    move-object v1, p5

    .line 17
    invoke-direct/range {v0 .. v5}, Ll/w7d0;-><init>(Ll/x20;ZLcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    new-instance p0, Ll/x7d0;

    .line 21
    .line 22
    invoke-direct {p0}, Ll/x7d0;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static u0()I
    .locals 2

    .line 1
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "quickchat_show_limit_female"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->y(Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    return v0

    .line 12
    :catch_0
    const v0, 0x7fffffff

    .line 13
    .line 14
    .line 15
    return v0
.end method

.method public static x0()Ll/a8d0;
    .locals 2

    .line 1
    sget-object v0, Ll/a8d0;->e:Ll/a8d0;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/a8d0;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/a8d0;->e:Ll/a8d0;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/a8d0;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/a8d0;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/a8d0;->e:Ll/a8d0;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/a8d0;->e:Ll/a8d0;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public B0(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;)V
    .locals 5

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->isPeiLiao()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/a8d0;->A0()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->getBroadcastCard()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->getBroadcastCard()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->isAudioBroadcast:Z

    .line 28
    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    goto/16 :goto_6

    .line 32
    .line 33
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->a0:Lrx/subjects/a;

    .line 38
    .line 39
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    check-cast v0, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 44
    .line 45
    sget-object v1, Lcom/p1/mobile/putong/core/data/VirtualCardType;->OnlineMatchBroadcastCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 46
    .line 47
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->isPeiLiao()Z

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    const/4 v3, 0x2

    .line 52
    if-eqz v2, :cond_1

    .line 53
    .line 54
    sget-object v1, Lcom/p1/mobile/putong/core/data/VirtualCardType;->OnlineMatchBroadcastPeiLiaoCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    iget v2, p2, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->cardType:I

    .line 58
    .line 59
    if-ne v2, v3, :cond_2

    .line 60
    .line 61
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->getBroadcastCard()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    if-eqz v2, :cond_2

    .line 70
    .line 71
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->getBroadcastCard()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    iget-boolean v2, v2, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->isAudioBroadcast:Z

    .line 76
    .line 77
    if-eqz v2, :cond_2

    .line 78
    .line 79
    sget-object v1, Lcom/p1/mobile/putong/core/data/VirtualCardType;->QuickAudioBroadcastCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 80
    .line 81
    :cond_2
    :goto_0
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    if-eqz v2, :cond_4

    .line 86
    .line 87
    invoke-static {v0}, Ll/upm;->V(Lcom/p1/mobile/putong/core/data/PartialListOpt;)Z

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    if-eqz v2, :cond_3

    .line 92
    .line 93
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->isPeiLiao()Z

    .line 94
    .line 95
    .line 96
    move-result v2

    .line 97
    if-nez v2, :cond_3

    .line 98
    .line 99
    goto/16 :goto_6

    .line 100
    .line 101
    :cond_3
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 102
    .line 103
    new-instance v4, Ll/y7d0;

    .line 104
    .line 105
    invoke-direct {v4, v1, p2}, Ll/y7d0;-><init>(Lcom/p1/mobile/putong/core/data/VirtualCardType;Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;)V

    .line 106
    .line 107
    .line 108
    invoke-static {v2, v4}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object v2

    .line 112
    check-cast v2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 113
    .line 114
    goto :goto_1

    .line 115
    :cond_4
    const/4 v2, 0x0

    .line 116
    :goto_1
    if-nez v2, :cond_c

    .line 117
    .line 118
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->isPeiLiao()Z

    .line 119
    .line 120
    .line 121
    move-result v2

    .line 122
    if-nez v2, :cond_5

    .line 123
    .line 124
    invoke-static {}, Ll/a8d0;->E0()V

    .line 125
    .line 126
    .line 127
    :cond_5
    iget v2, p2, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->cardType:I

    .line 128
    .line 129
    const/4 v4, 0x1

    .line 130
    if-ne v2, v4, :cond_6

    .line 131
    .line 132
    iput-object p2, p0, Ll/a8d0;->b:Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;

    .line 133
    .line 134
    goto :goto_2

    .line 135
    :cond_6
    if-ne v2, v3, :cond_7

    .line 136
    .line 137
    iput-object p2, p0, Ll/a8d0;->c:Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;

    .line 138
    .line 139
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->w()V

    .line 144
    .line 145
    .line 146
    :cond_7
    :goto_2
    new-instance v2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 147
    .line 148
    invoke-direct {v2}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;-><init>()V

    .line 149
    .line 150
    .line 151
    const-string v3, "VirtualCard"

    .line 152
    .line 153
    iput-object v3, v2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 154
    .line 155
    iget-object v3, p2, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->userId:Ljava/lang/String;

    .line 156
    .line 157
    iput-object v3, v2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->extraInfo:Ljava/lang/String;

    .line 158
    .line 159
    iput-object v1, v2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 160
    .line 161
    iput-object p2, v2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->quickChatCardWrapper:Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;

    .line 162
    .line 163
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->isPeiLiao()Z

    .line 164
    .line 165
    .line 166
    move-result v1

    .line 167
    if-eqz v1, :cond_8

    .line 168
    .line 169
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 170
    .line 171
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 172
    .line 173
    iget-object v3, p2, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->userId:Ljava/lang/String;

    .line 174
    .line 175
    filled-new-array {v3}, [Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v3

    .line 179
    invoke-static {v3}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 180
    .line 181
    .line 182
    move-result-object v3

    .line 183
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->H8(Ljava/util/List;)V

    .line 184
    .line 185
    .line 186
    goto :goto_3

    .line 187
    :cond_8
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 188
    .line 189
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 190
    .line 191
    iget-object v3, p2, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->userId:Ljava/lang/String;

    .line 192
    .line 193
    filled-new-array {v3}, [Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v3

    .line 197
    invoke-static {v3}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 198
    .line 199
    .line 200
    move-result-object v3

    .line 201
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->H8(Ljava/util/List;)V

    .line 202
    .line 203
    .line 204
    :goto_3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->g6()Z

    .line 205
    .line 206
    .line 207
    move-result v1

    .line 208
    if-nez v1, :cond_a

    .line 209
    .line 210
    invoke-virtual {p0, v0}, Ll/a8d0;->z0(Lcom/p1/mobile/putong/core/data/PartialListOpt;)Z

    .line 211
    .line 212
    .line 213
    move-result v0

    .line 214
    if-eqz v0, :cond_9

    .line 215
    .line 216
    iget v0, p2, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->cardType:I

    .line 217
    .line 218
    if-ne v0, v4, :cond_9

    .line 219
    .line 220
    goto :goto_4

    .line 221
    :cond_9
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 222
    .line 223
    iput-object v0, v2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->preSwipedDirection:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 224
    .line 225
    new-instance v0, Ljava/lang/StringBuilder;

    .line 226
    .line 227
    const-string v1, "insertQuick card real to 0 "

    .line 228
    .line 229
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 230
    .line 231
    .line 232
    iget v1, p2, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->cardType:I

    .line 233
    .line 234
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 235
    .line 236
    .line 237
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 238
    .line 239
    .line 240
    move-result-object v0

    .line 241
    invoke-static {v0}, Ll/t4j;->h(Ljava/lang/String;)V

    .line 242
    .line 243
    .line 244
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 245
    .line 246
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 247
    .line 248
    const/4 v1, 0x0

    .line 249
    invoke-virtual {v0, v2, v1}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->w6(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;I)Lrx/c;

    .line 250
    .line 251
    .line 252
    goto :goto_5

    .line 253
    :cond_a
    :goto_4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 254
    .line 255
    const-string v1, "insertQuick card real to 1 "

    .line 256
    .line 257
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 258
    .line 259
    .line 260
    iget v1, p2, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->cardType:I

    .line 261
    .line 262
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 263
    .line 264
    .line 265
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 266
    .line 267
    .line 268
    move-result-object v0

    .line 269
    invoke-static {v0}, Ll/t4j;->h(Ljava/lang/String;)V

    .line 270
    .line 271
    .line 272
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 273
    .line 274
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 275
    .line 276
    invoke-virtual {v0, v2, v4}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->w6(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;I)Lrx/c;

    .line 277
    .line 278
    .line 279
    :goto_5
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->isPeiLiao()Z

    .line 280
    .line 281
    .line 282
    move-result v0

    .line 283
    if-nez v0, :cond_b

    .line 284
    .line 285
    invoke-virtual {p0, p2}, Ll/a8d0;->H0(Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;)V

    .line 286
    .line 287
    .line 288
    invoke-virtual {p0, p2}, Ll/a8d0;->G0(Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;)V

    .line 289
    .line 290
    .line 291
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->d7()V

    .line 292
    .line 293
    .line 294
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 295
    .line 296
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->consumeRunnable()Ljava/lang/Runnable;

    .line 297
    .line 298
    .line 299
    move-result-object p1

    .line 300
    const-wide/32 v0, 0x493e0

    .line 301
    .line 302
    .line 303
    invoke-static {p0, p1, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 304
    .line 305
    .line 306
    return-void

    .line 307
    :cond_b
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->markAsConsumed()V

    .line 308
    .line 309
    .line 310
    :cond_c
    :goto_6
    return-void
.end method

.method public final C0(Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->getBroadcastCard()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->getBroadcastCard()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->isMaleQuickChatRing:Z

    .line 22
    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public D0(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/a8d0;->d:Ll/kcg0;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-interface {v0}, Ll/kcg0;->isUnsubscribed()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    return-void

    .line 13
    :cond_1
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->D0:Lcom/p1/mobile/putong/core/api/v;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/v;->A4()Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ll/l7d0;

    .line 26
    .line 27
    invoke-direct {v1, p1}, Ll/l7d0;-><init>(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;)V

    .line 28
    .line 29
    .line 30
    new-instance p1, Ll/r7d0;

    .line 31
    .line 32
    invoke-direct {p1}, Ll/r7d0;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-static {v1, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {v0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iput-object p1, p0, Ll/a8d0;->d:Ll/kcg0;

    .line 44
    .line 45
    return-void
.end method

.method public final G0(Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;)V
    .locals 1

    .line 1
    iget p0, p1, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->cardType:I

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->getBroadcastCard()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->isBell:Z

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->D0:Lcom/p1/mobile/putong/core/api/v;

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->getBroadcastCard()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->tracker:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/v;->N4(Ljava/lang/String;)Lrx/c;

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    iget p0, p1, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->cardType:I

    .line 29
    .line 30
    if-ne p0, v0, :cond_1

    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->getBroadcastCard()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->isSpeedMatch:Z

    .line 37
    .line 38
    if-eqz p0, :cond_1

    .line 39
    .line 40
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->D0:Lcom/p1/mobile/putong/core/api/v;

    .line 43
    .line 44
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->getBroadcastCard()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->tracker:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/v;->N4(Ljava/lang/String;)Lrx/c;

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 55
    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->D0:Lcom/p1/mobile/putong/core/api/v;

    .line 57
    .line 58
    const-string v0, ""

    .line 59
    .line 60
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->userId:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/core/api/v;->P4(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public H0(Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "other_user_id"

    .line 7
    .line 8
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->userId:Ljava/lang/String;

    .line 9
    .line 10
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    iget v1, p1, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->cardType:I

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    if-ne v1, v2, :cond_0

    .line 17
    .line 18
    const-string v1, "fixed"

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const-string v1, "radio"

    .line 22
    .line 23
    :goto_0
    const-string v2, "quickchat_card_type"

    .line 24
    .line 25
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 29
    .line 30
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 31
    .line 32
    iget-object v1, v1, Ll/dkb;->P0:Ll/byd0;

    .line 33
    .line 34
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    const-string v2, "quickchat_which_number"

    .line 39
    .line 40
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    iget v1, p1, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->cardType:I

    .line 44
    .line 45
    const/4 v2, 0x2

    .line 46
    if-ne v1, v2, :cond_1

    .line 47
    .line 48
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->getBroadcastCard()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->radioType:Ljava/lang/String;

    .line 53
    .line 54
    const-string v2, "radio_type"

    .line 55
    .line 56
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->getBroadcastCard()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    iget-boolean v1, v1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->isBell:Z

    .line 64
    .line 65
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    const-string v2, "is_quickchatbell"

    .line 70
    .line 71
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    :cond_1
    const-string v1, "user_action"

    .line 75
    .line 76
    invoke-virtual {p0, p1}, Ll/a8d0;->y0(Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    const-string v1, "which_content"

    .line 84
    .line 85
    invoke-virtual {p0, p1}, Ll/a8d0;->v0(Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0, p1}, Ll/a8d0;->C0(Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;)Z

    .line 93
    .line 94
    .line 95
    move-result p0

    .line 96
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    const-string p1, "quickchat_male_ring"

    .line 101
    .line 102
    invoke-interface {v0, p1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    const-string p0, "e_card_quickchat"

    .line 106
    .line 107
    const-string p1, "p_suggest_users_home_view"

    .line 108
    .line 109
    invoke-static {p0, p1, v0}, Ll/i4g0;->y(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 110
    .line 111
    .line 112
    return-void
.end method

.method public t0(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/a8d0;->b:Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;

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
    iget-object v0, p0, Ll/a8d0;->b:Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->userId:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Ll/a8d0;->b:Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->consume()V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    iget-object v0, p0, Ll/a8d0;->c:Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    iget-object v0, p0, Ll/a8d0;->c:Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->userId:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-eqz p1, :cond_1

    .line 42
    .line 43
    iget-object p0, p0, Ll/a8d0;->c:Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->consume()V

    .line 46
    .line 47
    .line 48
    :cond_1
    return-void
.end method

.method public final v0(Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-nez p0, :cond_0

    .line 22
    .line 23
    const-string p0, "sign"

    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 33
    .line 34
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-nez p0, :cond_1

    .line 39
    .line 40
    const-string p0, "label"

    .line 41
    .line 42
    return-object p0

    .line 43
    :cond_1
    const-string p0, "nothing"

    .line 44
    .line 45
    return-object p0
.end method

.method public w0(I)Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, v0, :cond_0

    .line 3
    .line 4
    iget-object v0, p0, Ll/a8d0;->b:Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/a8d0;->b:Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->isConsumed()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Ll/a8d0;->b:Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_0
    const/4 v0, 0x2

    .line 24
    if-ne p1, v0, :cond_1

    .line 25
    .line 26
    iget-object p1, p0, Ll/a8d0;->c:Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;

    .line 27
    .line 28
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-eqz p1, :cond_1

    .line 33
    .line 34
    iget-object p1, p0, Ll/a8d0;->c:Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;

    .line 35
    .line 36
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->isConsumed()Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    if-nez p1, :cond_1

    .line 41
    .line 42
    iget-object p0, p0, Ll/a8d0;->c:Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;

    .line 43
    .line 44
    return-object p0

    .line 45
    :cond_1
    const/4 p0, 0x0

    .line 46
    return-object p0
.end method

.method public final y0(Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;)Ljava/lang/String;
    .locals 1

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->rsStateReceiverToSender:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 2
    .line 3
    const-string v0, "superliked"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const-string p0, "superlike"

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->rsStateReceiverToSender:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 15
    .line 16
    const-string p1, "liked"

    .line 17
    .line 18
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    const-string p0, "like"

    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_1
    const-string p0, "normal"

    .line 28
    .line 29
    return-object p0
.end method

.method public z0(Lcom/p1/mobile/putong/core/data/PartialListOpt;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/PartialListOpt<",
            "Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;",
            ">;)Z"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return p0

    .line 5
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-lez v0, :cond_1

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {p1, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isPassiveQuickChat()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    :cond_1
    return p0
.end method
