.class public Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/w0;
.super Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    const-string v0, "e_avatarVerification_reverify_confirm_re_click"

    .line 2
    .line 3
    const-string v1, "p_avatarVerification_fail_popup"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/hxf;->n()V

    .line 9
    .line 10
    .line 11
    const-string v0, "dialog"

    .line 12
    .line 13
    invoke-static {p0, v0}, Ll/hxf;->h(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic q(Lcom/p1/mobile/android/app/Act;)V
    .locals 4

    .line 1
    const-string v0, "e_avatarVerification_change_avatar"

    .line 2
    .line 3
    const-string v1, "p_avatarVerification_fail_popup"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const/4 v1, 0x0

    .line 17
    const/4 v2, 0x1

    .line 18
    const-string v3, ""

    .line 19
    .line 20
    invoke-static {p0, v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->q2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static synthetic r(Ll/l4g0;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic s()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/d0;->V:Ll/jxd0;

    .line 6
    .line 7
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/e2m;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/w0;->t(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic b(Ll/e2m;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/w0;->u(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public t(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 17

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    const-class v1, Lcom/p1/mobile/android/app/Dialog;

    .line 10
    .line 11
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const-string v3, "p_avatarVerification_fail_popup"

    .line 16
    .line 17
    invoke-static {v3, v1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const-string v7, "swipe_page"

    .line 22
    .line 23
    const-string v8, "swipe"

    .line 24
    .line 25
    const-string v3, "passive"

    .line 26
    .line 27
    const-string v4, "alert"

    .line 28
    .line 29
    const-string v5, "alert_self_definition_basic"

    .line 30
    .line 31
    const-string v6, "card"

    .line 32
    .line 33
    invoke-static/range {v3 .. v8}, Ll/i6e;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    invoke-virtual {v1, v3}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v1}, Ll/w1e;->f(Ll/l4g0;)V

    .line 41
    .line 42
    .line 43
    sget v3, Lcom/p1/mobile/putong/core/R$string;->Yr:I

    .line 44
    .line 45
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    sget v4, Lcom/p1/mobile/putong/core/R$string;->Xr:I

    .line 50
    .line 51
    invoke-virtual {v2, v4}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    sget v5, Ll/dbc0;->kk:I

    .line 56
    .line 57
    sget v6, Lcom/p1/mobile/putong/core/R$string;->Wr:I

    .line 58
    .line 59
    invoke-virtual {v2, v6}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v6

    .line 63
    new-instance v7, Ll/dlh0;

    .line 64
    .line 65
    invoke-direct {v7, v2}, Ll/dlh0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 66
    .line 67
    .line 68
    sget v8, Lcom/p1/mobile/putong/core/R$string;->Vr:I

    .line 69
    .line 70
    invoke-virtual {v2, v8}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v9

    .line 74
    new-instance v10, Ll/elh0;

    .line 75
    .line 76
    invoke-direct {v10, v2}, Ll/elh0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 77
    .line 78
    .line 79
    new-instance v11, Ll/flh0;

    .line 80
    .line 81
    invoke-direct {v11}, Ll/flh0;-><init>()V

    .line 82
    .line 83
    .line 84
    new-instance v8, Ll/glh0;

    .line 85
    .line 86
    invoke-direct {v8, v1}, Ll/glh0;-><init>(Ll/l4g0;)V

    .line 87
    .line 88
    .line 89
    move-object/from16 v16, v8

    .line 90
    .line 91
    const/4 v8, 0x1

    .line 92
    const/4 v12, 0x0

    .line 93
    const/4 v13, 0x0

    .line 94
    const/4 v14, 0x1

    .line 95
    const/4 v15, 0x0

    .line 96
    invoke-static/range {v2 .. v16}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->F1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/CharSequence;ILjava/lang/String;Ll/x20;ZLjava/lang/String;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/data/User;ZZLjava/lang/String;Ll/x20;)V

    .line 97
    .line 98
    .line 99
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a:Ll/b240;

    .line 100
    .line 101
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->f:Lcom/p1/mobile/putong/core/newui/home/d;

    .line 102
    .line 103
    const-string v2, "failPicReject"

    .line 104
    .line 105
    invoke-virtual {v1, v0, v2}, Ll/b240;->P8(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    sget-object v0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->back:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 109
    .line 110
    return-object v0
.end method

.method public u(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/d0;->k4()Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 18
    .line 19
    const-string p1, "rejected"

    .line 20
    .line 21
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/d0;->V:Ll/jxd0;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    check-cast p0, Ljava/lang/Boolean;

    .line 38
    .line 39
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    return p0

    .line 44
    :cond_0
    const/4 p0, 0x0

    .line 45
    return p0
.end method
