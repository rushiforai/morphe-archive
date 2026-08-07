.class public Ll/ym20$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ym20;->r()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final a:[Ljava/lang/String;

.field public b:[Ljava/lang/String;

.field public c:[Ljava/lang/String;

.field public final synthetic d:Ll/ym20;


# direct methods
.method public constructor <init>(Ll/ym20;)V
    .locals 4

    .line 1
    iput-object p1, p0, Ll/ym20$a;->d:Ll/ym20;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Ll/ym20;->e()Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->q0:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p1}, Ll/ym20;->e()Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->r0:I

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {p1}, Ll/ym20;->e()Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    sget v3, Lcom/p1/mobile/putong/core/profile/R$string;->s0:I

    .line 31
    .line 32
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-virtual {p1}, Ll/ym20;->e()Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    sget v3, Lcom/p1/mobile/putong/core/profile/R$string;->t0:I

    .line 41
    .line 42
    invoke-virtual {p1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    filled-new-array {v0, v1, v2, p1}, [Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    iput-object p1, p0, Ll/ym20$a;->a:[Ljava/lang/String;

    .line 51
    .line 52
    const-string p1, "dont_like_app"

    .line 53
    .line 54
    const-string v0, "other"

    .line 55
    .line 56
    const-string v1, "found_someone_on_tantan"

    .line 57
    .line 58
    const-string v2, "found_someone_elsewhere"

    .line 59
    .line 60
    filled-new-array {v1, v2, p1, v0}, [Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    iput-object p1, p0, Ll/ym20$a;->b:[Ljava/lang/String;

    .line 65
    .line 66
    const-string p1, "dislike_tantan"

    .line 67
    .line 68
    const-string v0, "other_reasons"

    .line 69
    .line 70
    const-string v1, "already_in_love_from_tantan"

    .line 71
    .line 72
    const-string v2, "already_in_love_from_others"

    .line 73
    .line 74
    filled-new-array {v1, v2, p1, v0}, [Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    iput-object p1, p0, Ll/ym20$a;->c:[Ljava/lang/String;

    .line 79
    .line 80
    return-void
.end method

.method public static synthetic a(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Ll/ym20$a;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ym20$a;->g(ILjava/lang/String;)V

    return-void
.end method

.method public static synthetic c(Ll/ym20$a;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/ym20$a;->h(Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V

    return-void
.end method

.method public static synthetic d(Ll/ym20$a;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ym20$a;->f()Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final synthetic f()Lkotlin/Unit;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ym20$a;->d:Ll/ym20;

    .line 2
    .line 3
    invoke-static {p0}, Ll/ym20;->c(Ll/ym20;)Ll/qm20;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, ""

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/qm20;->N0(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 13
    .line 14
    return-object p0
.end method

.method public final synthetic g(ILjava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ym20$a;->c:[Ljava/lang/String;

    .line 2
    .line 3
    aget-object p1, v0, p1

    .line 4
    .line 5
    const-string v0, "delete_account_reason"

    .line 6
    .line 7
    invoke-static {v0, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    filled-new-array {p1}, [Ll/sfj0$a;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const-string v0, "e_delete_account_confirm_click"

    .line 16
    .line 17
    const-string v1, "p_alert_delete_account_confirm_popup"

    .line 18
    .line 19
    invoke-static {v0, v1, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Ll/ym20$a;->d:Ll/ym20;

    .line 23
    .line 24
    invoke-virtual {p1}, Ll/ym20;->e()Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->R0:I

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Ll/ym20$a;->d:Ll/ym20;

    .line 34
    .line 35
    invoke-static {p0}, Ll/ym20;->c(Ll/ym20;)Ll/qm20;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0, p2}, Ll/qm20;->N0(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final synthetic h(Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 6

    .line 1
    iget-object p1, p0, Ll/ym20$a;->b:[Ljava/lang/String;

    .line 2
    .line 3
    aget-object p1, p1, p3

    .line 4
    .line 5
    iget-object p2, p0, Ll/ym20$a;->c:[Ljava/lang/String;

    .line 6
    .line 7
    aget-object p2, p2, p3

    .line 8
    .line 9
    const-string p4, "delete_account_reason"

    .line 10
    .line 11
    invoke-static {p4, p2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    filled-new-array {p2}, [Ll/sfj0$a;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    const-string p4, "e_delete_account_reason_click"

    .line 20
    .line 21
    const-string v0, "p_delete_account_reason_selection_popup"

    .line 22
    .line 23
    invoke-static {p4, v0, p2}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 24
    .line 25
    .line 26
    const-class p2, Lcom/p1/mobile/android/app/Dialog;

    .line 27
    .line 28
    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    const-string p4, "p_alert_delete_account_confirm_popup"

    .line 33
    .line 34
    invoke-static {p4, p2}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    const-string v4, "account_security_page"

    .line 39
    .line 40
    const-string v5, "delete_account"

    .line 41
    .line 42
    const-string v0, "passive"

    .line 43
    .line 44
    const-string v1, "alert"

    .line 45
    .line 46
    const-string v2, "alert_system"

    .line 47
    .line 48
    const-string v3, "delete_account_reason_button"

    .line 49
    .line 50
    invoke-static/range {v0 .. v5}, Ll/i6e;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    .line 51
    .line 52
    .line 53
    move-result-object p4

    .line 54
    invoke-virtual {p2, p4}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 55
    .line 56
    .line 57
    invoke-static {p2}, Ll/w1e;->f(Ll/l4g0;)V

    .line 58
    .line 59
    .line 60
    iget-object p4, p0, Ll/ym20$a;->d:Ll/ym20;

    .line 61
    .line 62
    invoke-virtual {p4}, Ll/ym20;->e()Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;

    .line 63
    .line 64
    .line 65
    move-result-object p4

    .line 66
    invoke-virtual {p4}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 67
    .line 68
    .line 69
    move-result-object p4

    .line 70
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->v0:I

    .line 71
    .line 72
    invoke-virtual {p4, v0}, Lcom/p1/mobile/android/app/Dialog$e;->E0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 73
    .line 74
    .line 75
    move-result-object p4

    .line 76
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->w0:I

    .line 77
    .line 78
    invoke-virtual {p4, v0}, Lcom/p1/mobile/android/app/Dialog$e;->D(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 79
    .line 80
    .line 81
    move-result-object p4

    .line 82
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->a:I

    .line 83
    .line 84
    invoke-virtual {p4, v0}, Lcom/p1/mobile/android/app/Dialog$e;->k0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 85
    .line 86
    .line 87
    move-result-object p4

    .line 88
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->j:I

    .line 89
    .line 90
    new-instance v1, Ll/wm20;

    .line 91
    .line 92
    invoke-direct {v1, p0, p3, p1}, Ll/wm20;-><init>(Ll/ym20$a;ILjava/lang/String;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p4, v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    new-instance p1, Ll/xm20;

    .line 100
    .line 101
    invoke-direct {p1, p2}, Ll/xm20;-><init>(Ll/l4g0;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->V(Landroid/content/DialogInterface$OnDismissListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 6

    .line 1
    const-class p1, Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const-string v0, "p_delete_account_reason_selection_popup"

    .line 8
    .line 9
    invoke-static {v0, p1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const-string v4, "account_security_page"

    .line 14
    .line 15
    const-string v5, "click"

    .line 16
    .line 17
    const-string v0, "passive"

    .line 18
    .line 19
    const-string v1, "alert"

    .line 20
    .line 21
    const-string v2, "alert_system"

    .line 22
    .line 23
    const-string v3, "account_cancel_button"

    .line 24
    .line 25
    invoke-static/range {v0 .. v5}, Ll/i6e;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p1, v0}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 30
    .line 31
    .line 32
    invoke-static {p1}, Ll/w1e;->f(Ll/l4g0;)V

    .line 33
    .line 34
    .line 35
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 38
    .line 39
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-nez v0, :cond_1

    .line 48
    .line 49
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 50
    .line 51
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->e2()Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_1

    .line 60
    .line 61
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 62
    .line 63
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 64
    .line 65
    invoke-virtual {v0}, Ll/lqb;->Y4()J

    .line 66
    .line 67
    .line 68
    move-result-wide v0

    .line 69
    const-wide/16 v2, 0x0

    .line 70
    .line 71
    cmp-long v0, v0, v2

    .line 72
    .line 73
    if-gtz v0, :cond_1

    .line 74
    .line 75
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->xf()Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-eqz v0, :cond_0

    .line 84
    .line 85
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 86
    .line 87
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->I0:Ll/jan;

    .line 88
    .line 89
    invoke-virtual {v0}, Ll/jan;->K3()J

    .line 90
    .line 91
    .line 92
    move-result-wide v0

    .line 93
    cmp-long v0, v0, v2

    .line 94
    .line 95
    if-lez v0, :cond_0

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_0
    iget-object v0, p0, Ll/ym20$a;->d:Ll/ym20;

    .line 99
    .line 100
    invoke-virtual {v0}, Ll/ym20;->e()Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->u0:I

    .line 109
    .line 110
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->E0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    iget-object v1, p0, Ll/ym20$a;->a:[Ljava/lang/String;

    .line 115
    .line 116
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->f0([Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    new-instance v1, Ll/um20;

    .line 121
    .line 122
    invoke-direct {v1, p0}, Ll/um20;-><init>(Ll/ym20$a;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->g0(Lcom/p1/mobile/android/app/Dialog$g;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->a:I

    .line 130
    .line 131
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Dialog$e;->k0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    new-instance v0, Ll/vm20;

    .line 136
    .line 137
    invoke-direct {v0, p1}, Ll/vm20;-><init>(Ll/l4g0;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Dialog$e;->V(Landroid/content/DialogInterface$OnDismissListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 145
    .line 146
    .line 147
    return-void

    .line 148
    :cond_1
    :goto_0
    sget-object p1, Ll/xk;->Companion:Ll/xk$a;

    .line 149
    .line 150
    iget-object v0, p0, Ll/ym20$a;->d:Ll/ym20;

    .line 151
    .line 152
    invoke-virtual {v0}, Ll/ym20;->e()Lcom/p1/mobile/putong/core/ui/account/NewAccountSecureAct;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    new-instance v1, Ll/tm20;

    .line 157
    .line 158
    invoke-direct {v1, p0}, Ll/tm20;-><init>(Ll/ym20$a;)V

    .line 159
    .line 160
    .line 161
    const/4 p0, 0x1

    .line 162
    invoke-virtual {p1, p0, v0, v1}, Ll/xk$a;->f(ZLcom/p1/mobile/android/app/Act;Lkotlin/jvm/functions/Function0;)V

    .line 163
    .line 164
    .line 165
    return-void
.end method
