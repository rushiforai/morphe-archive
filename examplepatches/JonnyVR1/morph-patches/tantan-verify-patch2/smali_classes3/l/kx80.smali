.class public Ll/kx80;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ll/vxd0;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ll/vxd0;

    .line 2
    .line 3
    const-string v1, "privacy_policy_version"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Ll/kx80;->a:Ll/vxd0;

    .line 10
    .line 11
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

.method public static synthetic a([Ll/jl80;Landroid/app/Activity;Ll/y20;)V
    .locals 3

    .line 1
    const-string v0, "e_first_privacy_policy_popup_confirm_button"

    .line 2
    .line 3
    const-string v1, "p_first_privacy_policy_popup"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    aget-object v1, p0, v0

    .line 10
    .line 11
    sget v2, Lcom/p1/mobile/putong/common/R$string;->A1:I

    .line 12
    .line 13
    invoke-virtual {p1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {v1, p1}, Ll/jl80;->Y(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    sget-object p1, Ll/uqb0;->B:Ll/jxd0;

    .line 21
    .line 22
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 23
    .line 24
    invoke-virtual {p1, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_0

    .line 32
    .line 33
    aget-object p0, p0, v0

    .line 34
    .line 35
    invoke-interface {p2, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public static synthetic b(Ljava/lang/Runnable;Ll/jl80;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p2, "e_second_privacy_policy_popup_leave_button"

    .line 2
    .line 3
    const-string v0, "p_second_privacy_policy_popup"

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    if-eqz p2, :cond_0

    .line 13
    .line 14
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-virtual {p1}, Landroid/app/Dialog;->isShowing()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    invoke-virtual {p1}, Ll/g1e;->dismiss()V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void
.end method

.method public static synthetic c(Landroid/app/Activity;[Ll/jl80;Ll/l4g0;)V
    .locals 1

    .line 1
    new-instance v0, Ll/ex80;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, Ll/ex80;-><init>([Ll/jl80;Ll/l4g0;)V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ll/fx80;

    .line 7
    .line 8
    invoke-direct {p1, p0}, Ll/fx80;-><init>(Landroid/app/Activity;)V

    .line 9
    .line 10
    .line 11
    new-instance p2, Ll/gx80;

    .line 12
    .line 13
    invoke-direct {p2}, Ll/gx80;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-static {p0, v0, p1, p2}, Ll/kx80;->n(Landroid/app/Activity;Ljava/lang/Runnable;Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static synthetic d([Ll/jl80;Ll/l4g0;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-object p0, p0, v0

    .line 3
    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/jl80;->show()V

    .line 7
    .line 8
    .line 9
    :cond_0
    invoke-static {p1}, Ll/w1e;->f(Ll/l4g0;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic e(Ljava/lang/Runnable;Ll/jl80;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p2, "e_second_privacy_policy_popup_read_button"

    .line 2
    .line 3
    const-string v0, "p_second_privacy_policy_popup"

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    if-eqz p2, :cond_0

    .line 13
    .line 14
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-virtual {p1}, Landroid/app/Dialog;->isShowing()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    invoke-virtual {p1}, Ll/g1e;->dismiss()V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void
.end method

.method public static synthetic f([Ll/jl80;Ll/x20;)V
    .locals 2

    .line 1
    const-string v0, "e_first_privacy_policy_popup_refuse_button"

    .line 2
    .line 3
    const-string v1, "p_first_privacy_policy_popup"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    aget-object p0, p0, v0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 12
    .line 13
    .line 14
    invoke-interface {p1}, Ll/x20;->call()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic g()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic h(Landroid/app/Activity;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/zwk;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "http://m.staging2.p1staff.com/fep/tantan/frontend/tantan-frontend-app-pages-v2/src/pages/growth/visitor-mode/index.html?speed=true&dialog=true#/"

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string v0, "https://m.tantanapp.com/fep/tantan/frontend/tantan-frontend-app-pages-v2/src/pages/growth/visitor-mode/index.html?speed=true&dialog=true#/"

    .line 11
    .line 12
    :goto_0
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/ui/WebViewPreAct;->L0(Landroid/app/Activity;Ljava/lang/String;)Landroid/content/Intent;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static synthetic i(Ljava/lang/Runnable;Ljava/lang/Runnable;Ll/jl80;Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p3, 0x1

    .line 2
    invoke-static {p3}, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->setVisitorHasClick(Z)V

    .line 3
    .line 4
    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-virtual {p2}, Landroid/app/Dialog;->isShowing()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-eqz p0, :cond_1

    .line 19
    .line 20
    invoke-virtual {p2}, Ll/g1e;->dismiss()V

    .line 21
    .line 22
    .line 23
    :cond_1
    return-void
.end method

.method public static synthetic j(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static k(Landroid/app/Activity;Ll/y20;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ll/y20<",
            "Ll/jl80;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/uqb0;->B:Ll/jxd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    const-string v0, "android.permission-group.LOCATION"

    .line 17
    .line 18
    filled-new-array {v0}, [Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-static {v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->b([Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    new-instance v0, Lcom/p1/mobile/putong/util/DataFileObserver$FileModifyException;

    .line 29
    .line 30
    const-string v1, "Privacy Dialog Show With Location Permission"

    .line 31
    .line 32
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/util/DataFileObserver$FileModifyException;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v0}, Ll/qu2;->w(Ljava/lang/Throwable;)V

    .line 36
    .line 37
    .line 38
    :cond_1
    const/4 v0, 0x1

    .line 39
    new-array v0, v0, [Ll/jl80;

    .line 40
    .line 41
    const-class v1, Lcom/p1/mobile/android/app/Dialog;

    .line 42
    .line 43
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    const-string v2, "p_first_privacy_policy_popup"

    .line 48
    .line 49
    invoke-static {v2, v1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    const-string v6, "logon_page"

    .line 54
    .line 55
    const-string v7, "privacy_permission_make_sure"

    .line 56
    .line 57
    const-string v2, "passive"

    .line 58
    .line 59
    const-string v3, "alert"

    .line 60
    .line 61
    const-string v4, "alert_self_definition_basic"

    .line 62
    .line 63
    const-string v5, "null"

    .line 64
    .line 65
    invoke-static/range {v2 .. v7}, Ll/i6e;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-virtual {v1, v2}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    sget v3, Ll/jec0;->N:I

    .line 77
    .line 78
    const/4 v4, 0x0

    .line 79
    const/4 v5, 0x0

    .line 80
    invoke-virtual {v2, v3, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    sget v3, Ll/ycc0;->s0:I

    .line 85
    .line 86
    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    check-cast v3, Lv/VText;

    .line 91
    .line 92
    const/4 v4, 0x2

    .line 93
    invoke-static {v4}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 94
    .line 95
    .line 96
    move-result-object v4

    .line 97
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 98
    .line 99
    .line 100
    sget v3, Ll/ycc0;->y0:I

    .line 101
    .line 102
    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 103
    .line 104
    .line 105
    move-result-object v3

    .line 106
    check-cast v3, Lv/VText;

    .line 107
    .line 108
    new-instance v4, Ll/ax80;

    .line 109
    .line 110
    invoke-direct {v4, p0, v0, v1}, Ll/ax80;-><init>(Landroid/app/Activity;[Ll/jl80;Ll/l4g0;)V

    .line 111
    .line 112
    .line 113
    new-instance v6, Ll/jl80$a;

    .line 114
    .line 115
    invoke-direct {v6, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {v6, v2}, Ll/jl80$a;->R(Landroid/view/View;)Ll/jl80$a;

    .line 119
    .line 120
    .line 121
    move-result-object v2

    .line 122
    invoke-virtual {v2, v5}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 123
    .line 124
    .line 125
    move-result-object v2

    .line 126
    invoke-virtual {v2, v5}, Ll/jl80$a;->M(Z)Ll/jl80$a;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    sget v6, Lcom/p1/mobile/putong/common/R$string;->x1:I

    .line 131
    .line 132
    new-instance v7, Ll/bx80;

    .line 133
    .line 134
    invoke-direct {v7, v0, p0, p1}, Ll/bx80;-><init>([Ll/jl80;Landroid/app/Activity;Ll/y20;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {v2, v6, v7}, Ll/jl80$a;->a0(ILjava/lang/Runnable;)Ll/jl80$a;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    sget v2, Lcom/p1/mobile/putong/common/R$string;->z1:I

    .line 142
    .line 143
    new-instance v6, Ll/cx80;

    .line 144
    .line 145
    invoke-direct {v6, v0, v4}, Ll/cx80;-><init>([Ll/jl80;Ll/x20;)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {p1, v2, v6}, Ll/jl80$a;->U(ILjava/lang/Runnable;)Ll/jl80$a;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    new-instance v2, Ll/dx80;

    .line 153
    .line 154
    invoke-direct {v2, v1}, Ll/dx80;-><init>(Ll/l4g0;)V

    .line 155
    .line 156
    .line 157
    invoke-virtual {p1, v2}, Ll/jl80$a;->n0(Landroid/content/DialogInterface$OnDismissListener;)Ll/jl80$a;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    invoke-virtual {p1}, Ll/jl80$a;->O()Ll/jl80;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    aput-object p1, v0, v5

    .line 166
    .line 167
    invoke-virtual {p1}, Ll/jl80;->show()V

    .line 168
    .line 169
    .line 170
    invoke-static {v1}, Ll/w1e;->f(Ll/l4g0;)V

    .line 171
    .line 172
    .line 173
    sget p1, Lcom/p1/mobile/putong/common/R$string;->G1:I

    .line 174
    .line 175
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object p1

    .line 179
    sget v0, Lcom/p1/mobile/putong/common/R$string;->B1:I

    .line 180
    .line 181
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 186
    .line 187
    .line 188
    move-result-object v1

    .line 189
    sget v2, Ll/b9c0;->h:I

    .line 190
    .line 191
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 192
    .line 193
    .line 194
    move-result v1

    .line 195
    sget v2, Lcom/p1/mobile/putong/common/R$string;->y1:I

    .line 196
    .line 197
    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object v2

    .line 201
    filled-new-array {p1, v0}, [Ljava/lang/Object;

    .line 202
    .line 203
    .line 204
    move-result-object v4

    .line 205
    invoke-static {v2, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object v2

    .line 209
    invoke-static {}, Ll/zwk;->j()Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object v4

    .line 213
    invoke-static {}, Ll/zwk;->i()Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object v5

    .line 217
    filled-new-array {p1, v4, v0, v5}, [Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object p1

    .line 221
    invoke-static {p0, v1, v2, p1}, Ll/q8g0;->D(Landroid/app/Activity;ILjava/lang/String;[Ljava/lang/String;)Landroid/text/SpannableStringBuilder;

    .line 222
    .line 223
    .line 224
    move-result-object p0

    .line 225
    invoke-virtual {v3, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 226
    .line 227
    .line 228
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    .line 229
    .line 230
    .line 231
    move-result-object p0

    .line 232
    invoke-virtual {v3, p0}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 233
    .line 234
    .line 235
    return-void
.end method

.method public static l(Landroid/app/Activity;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static m(Landroid/app/Activity;Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public static n(Landroid/app/Activity;Ljava/lang/Runnable;Ljava/lang/Runnable;Ljava/lang/Runnable;)V
    .locals 7

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_0

    .line 8
    .line 9
    :cond_0
    const-class v0, Lcom/p1/mobile/android/app/Dialog;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "p_second_privacy_policy_popup"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v5, "logon_page"

    .line 22
    .line 23
    const-string v6, "privacy_permission_make_sure"

    .line 24
    .line 25
    const-string v1, "passive"

    .line 26
    .line 27
    const-string v2, "alert"

    .line 28
    .line 29
    const-string v3, "alert_self_definition_basic"

    .line 30
    .line 31
    const-string v4, "null"

    .line 32
    .line 33
    invoke-static/range {v1 .. v6}, Ll/i6e;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v0, v1}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    sget v2, Ll/jec0;->q:I

    .line 45
    .line 46
    const/4 v3, 0x0

    .line 47
    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    sget v2, Ll/ycc0;->A0:I

    .line 52
    .line 53
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    check-cast v2, Lv/VText;

    .line 58
    .line 59
    const/4 v3, 0x3

    .line 60
    invoke-static {v3}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    const/4 v4, 0x1

    .line 65
    invoke-virtual {v2, v3, v4}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 66
    .line 67
    .line 68
    sget v2, Ll/ycc0;->m:I

    .line 69
    .line 70
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    check-cast v2, Lv/VButton;

    .line 75
    .line 76
    sget v3, Ll/ycc0;->x0:I

    .line 77
    .line 78
    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    check-cast v3, Lv/VText;

    .line 83
    .line 84
    sget v4, Ll/ycc0;->z0:I

    .line 85
    .line 86
    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 87
    .line 88
    .line 89
    move-result-object v4

    .line 90
    check-cast v4, Lv/VText;

    .line 91
    .line 92
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 93
    .line 94
    .line 95
    move-result-object v5

    .line 96
    invoke-virtual {v5}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v5

    .line 100
    const-string v6, "zh"

    .line 101
    .line 102
    invoke-static {v6, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 103
    .line 104
    .line 105
    move-result v5

    .line 106
    if-eqz v5, :cond_1

    .line 107
    .line 108
    sget v5, Ll/ycc0;->A0:I

    .line 109
    .line 110
    invoke-virtual {v1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 111
    .line 112
    .line 113
    move-result-object v5

    .line 114
    check-cast v5, Lv/VText;

    .line 115
    .line 116
    const-string v6, "\u8bbf\u5ba2\u6a21\u5f0f"

    .line 117
    .line 118
    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 119
    .line 120
    .line 121
    const-string v6, "\u7528\u6237\u9690\u79c1\u653f\u7b56"

    .line 122
    .line 123
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 124
    .line 125
    .line 126
    :cond_1
    new-instance v5, Ll/jl80$a;

    .line 127
    .line 128
    invoke-direct {v5, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {v5, v1}, Ll/jl80$a;->R(Landroid/view/View;)Ll/jl80$a;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    const/4 v1, 0x0

    .line 136
    invoke-virtual {p0, v1}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    invoke-virtual {p0}, Ll/jl80$a;->O()Ll/jl80;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    new-instance v5, Ll/kx80$a;

    .line 145
    .line 146
    invoke-direct {v5, v0}, Ll/kx80$a;-><init>(Ll/l4g0;)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {p0, v5}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {p0, v1}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {p0}, Landroid/app/Dialog;->isShowing()Z

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    if-eqz v1, :cond_2

    .line 160
    .line 161
    :goto_0
    return-void

    .line 162
    :cond_2
    new-instance v1, Ll/hx80;

    .line 163
    .line 164
    invoke-direct {v1, p1, p0}, Ll/hx80;-><init>(Ljava/lang/Runnable;Ll/jl80;)V

    .line 165
    .line 166
    .line 167
    invoke-static {v2, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 168
    .line 169
    .line 170
    new-instance p1, Ll/ix80;

    .line 171
    .line 172
    invoke-direct {p1, p3, p2, p0}, Ll/ix80;-><init>(Ljava/lang/Runnable;Ljava/lang/Runnable;Ll/jl80;)V

    .line 173
    .line 174
    .line 175
    invoke-static {v3, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 176
    .line 177
    .line 178
    new-instance p1, Ll/jx80;

    .line 179
    .line 180
    invoke-direct {p1, p3, p0}, Ll/jx80;-><init>(Ljava/lang/Runnable;Ll/jl80;)V

    .line 181
    .line 182
    .line 183
    invoke-static {v4, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 184
    .line 185
    .line 186
    invoke-virtual {p0}, Ll/jl80;->show()V

    .line 187
    .line 188
    .line 189
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 190
    .line 191
    .line 192
    return-void
.end method
