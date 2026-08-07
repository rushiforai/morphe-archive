.class public Ll/jnk;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/nnk;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/android/app/Act;

.field public b:Ljava/lang/String;

.field public c:Ll/w30;

.field public d:Ll/w30;

.field public e:I


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/jnk;->e:I

    .line 6
    .line 7
    iput-object p1, p0, Ll/jnk;->a:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic e0(Ll/jnk;Lcom/p1/mobile/putong/core/data/ChatGroup;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jnk;->n0(Lcom/p1/mobile/putong/core/data/ChatGroup;)V

    return-void
.end method

.method public static synthetic f0(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic g0(Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    iget-object p0, p1, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic h0(Ll/jnk;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jnk;->p0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i0(Ll/jnk;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatGroup;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Ll/jnk;->q0(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatGroup;Lv/VListCell;Lv/VListCell$a;I)V

    return-void
.end method

.method public static synthetic j0(Ll/jnk;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jnk;->o0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k0(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
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
    iget-object v0, p0, Ll/jnk;->a:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sget-object v1, Lcom/p1/mobile/putong/core/ui/messages/group/GroupSettingManagerAct;->f:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Ll/jnk;->b:Ljava/lang/String;

    .line 17
    .line 18
    return-void
.end method

.method public a0()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 7
    .line 8
    iget-object v1, p0, Ll/jnk;->b:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/e;->o6(Ljava/lang/String;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/cnk;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/cnk;-><init>(Ll/jnk;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

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

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public l0()V
    .locals 5

    .line 1
    new-instance v0, Ll/w30$b;

    .line 2
    .line 3
    iget-object v1, p0, Ll/jnk;->a:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/w30$b;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ll/jnk;->a:Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->a:I

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Ll/w30$b;->I(Ljava/lang/CharSequence;)Ll/w30$b;

    .line 21
    .line 22
    .line 23
    new-instance v1, Ll/gnk;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/gnk;-><init>(Ll/jnk;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ll/w30$b;->U(Landroid/view/View$OnClickListener;)Ll/w30$b;

    .line 29
    .line 30
    .line 31
    new-instance v1, Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 34
    .line 35
    .line 36
    iget-object v2, p0, Ll/jnk;->a:Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    invoke-virtual {v2}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    sget v3, Lcom/p1/mobile/putong/core/message/R$string;->y0:I

    .line 43
    .line 44
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    iget-object v3, p0, Ll/jnk;->a:Lcom/p1/mobile/android/app/Act;

    .line 49
    .line 50
    invoke-virtual {v3}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    sget v4, Lcom/p1/mobile/putong/core/message/R$string;->z0:I

    .line 55
    .line 56
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0, v1}, Ll/w30$b;->Q(Ljava/util/List;)Ll/w30$b;

    .line 67
    .line 68
    .line 69
    new-instance v1, Ll/hnk;

    .line 70
    .line 71
    invoke-direct {v1}, Ll/hnk;-><init>()V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0, v1}, Ll/w30$b;->V(Ll/w30$d;)Ll/w30$b;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0}, Ll/w30$b;->F()Ll/w30;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    iput-object v0, p0, Ll/jnk;->c:Ll/w30;

    .line 82
    .line 83
    invoke-virtual {v0}, Ll/w30;->f()V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public m0(Lcom/p1/mobile/putong/core/data/ChatGroup;)V
    .locals 6

    .line 1
    new-instance v0, Ll/l4g0;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/android/app/Dialog;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "p_group_chat_add_method_popup"

    .line 10
    .line 11
    invoke-direct {v0, v2, v1}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->ownerUserId:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    const/4 v1, 0x1

    .line 31
    iput v1, p0, Ll/jnk;->e:I

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->adminUserIds:Ljava/util/List;

    .line 35
    .line 36
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-nez v1, :cond_1

    .line 41
    .line 42
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->adminUserIds:Ljava/util/List;

    .line 43
    .line 44
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-interface {v1, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-eqz v1, :cond_1

    .line 57
    .line 58
    const/4 v1, 0x2

    .line 59
    iput v1, p0, Ll/jnk;->e:I

    .line 60
    .line 61
    :cond_1
    :goto_0
    iget v1, p0, Ll/jnk;->e:I

    .line 62
    .line 63
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    const-string v2, "user_group_title"

    .line 68
    .line 69
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    filled-new-array {v1}, [Ll/pf60;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v0, v1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 78
    .line 79
    .line 80
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 81
    .line 82
    .line 83
    iget-object v1, p0, Ll/jnk;->a:Lcom/p1/mobile/android/app/Act;

    .line 84
    .line 85
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    const-string v2, "groupchat_id"

    .line 90
    .line 91
    iget-object v3, p0, Ll/jnk;->b:Ljava/lang/String;

    .line 92
    .line 93
    invoke-static {v2, v3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    filled-new-array {v2}, [Ll/sfj0$a;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    const-string v3, "e_group_chat_manage_add_method"

    .line 102
    .line 103
    invoke-static {v3, v1, v2}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 104
    .line 105
    .line 106
    new-instance v1, Ll/w30$b;

    .line 107
    .line 108
    iget-object v2, p0, Ll/jnk;->a:Lcom/p1/mobile/android/app/Act;

    .line 109
    .line 110
    invoke-direct {v1, v2}, Ll/w30$b;-><init>(Landroid/content/Context;)V

    .line 111
    .line 112
    .line 113
    iget-object v2, p0, Ll/jnk;->a:Lcom/p1/mobile/android/app/Act;

    .line 114
    .line 115
    invoke-virtual {v2}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    sget v3, Lcom/p1/mobile/putong/core/message/R$string;->a:I

    .line 120
    .line 121
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v2

    .line 125
    invoke-virtual {v1, v2}, Ll/w30$b;->I(Ljava/lang/CharSequence;)Ll/w30$b;

    .line 126
    .line 127
    .line 128
    new-instance v2, Ll/dnk;

    .line 129
    .line 130
    invoke-direct {v2, p0}, Ll/dnk;-><init>(Ll/jnk;)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {v1, v2}, Ll/w30$b;->U(Landroid/view/View$OnClickListener;)Ll/w30$b;

    .line 134
    .line 135
    .line 136
    new-instance v2, Ljava/util/ArrayList;

    .line 137
    .line 138
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 139
    .line 140
    .line 141
    iget-object v3, p0, Ll/jnk;->a:Lcom/p1/mobile/android/app/Act;

    .line 142
    .line 143
    sget v4, Lcom/p1/mobile/putong/core/message/R$string;->y0:I

    .line 144
    .line 145
    invoke-virtual {v3, v4}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v3

    .line 149
    iget-object v4, p0, Ll/jnk;->a:Lcom/p1/mobile/android/app/Act;

    .line 150
    .line 151
    sget v5, Lcom/p1/mobile/putong/core/message/R$string;->z0:I

    .line 152
    .line 153
    invoke-virtual {v4, v5}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v4

    .line 157
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 161
    .line 162
    .line 163
    invoke-virtual {v1, v2}, Ll/w30$b;->Q(Ljava/util/List;)Ll/w30$b;

    .line 164
    .line 165
    .line 166
    new-instance v2, Ll/enk;

    .line 167
    .line 168
    invoke-direct {v2, v0}, Ll/enk;-><init>(Ll/l4g0;)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {v1, v2}, Ll/w30$b;->T(Landroid/content/DialogInterface$OnDismissListener;)Ll/w30$b;

    .line 172
    .line 173
    .line 174
    new-instance v0, Ll/fnk;

    .line 175
    .line 176
    invoke-direct {v0, p0, v3, v4, p1}, Ll/fnk;-><init>(Ll/jnk;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatGroup;)V

    .line 177
    .line 178
    .line 179
    invoke-virtual {v1, v0}, Ll/w30$b;->V(Ll/w30$d;)Ll/w30$b;

    .line 180
    .line 181
    .line 182
    invoke-virtual {v1}, Ll/w30$b;->F()Ll/w30;

    .line 183
    .line 184
    .line 185
    move-result-object p1

    .line 186
    iput-object p1, p0, Ll/jnk;->d:Ll/w30;

    .line 187
    .line 188
    invoke-virtual {p1}, Ll/w30;->f()V

    .line 189
    .line 190
    .line 191
    return-void
.end method

.method public final synthetic n0(Lcom/p1/mobile/putong/core/data/ChatGroup;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/nnk;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/nnk;->m(Lcom/p1/mobile/putong/core/data/ChatGroup;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic o0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jnk;->c:Ll/w30;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic p0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jnk;->d:Ll/w30;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic q0(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatGroup;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    iget-object p4, p5, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 2
    .line 3
    invoke-interface {p4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p4

    .line 7
    invoke-virtual {p4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    const-string p5, "user_group_title"

    .line 12
    .line 13
    const-string p6, "p_group_chat_add_method_popup"

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget p1, p0, Ll/jnk;->e:I

    .line 18
    .line 19
    invoke-static {p5, p1}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    filled-new-array {p1}, [Ll/sfj0$a;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const-string p2, "e_group_chat_add_method_popup_anyone"

    .line 28
    .line 29
    invoke-static {p2, p6, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 30
    .line 31
    .line 32
    const-string p1, "noApplyRequired"

    .line 33
    .line 34
    invoke-static {p1}, Lcom/p1/mobile/putong/core/data/JoinCondition;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/JoinCondition;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    goto :goto_0

    .line 39
    :cond_0
    invoke-virtual {p4, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-eqz p1, :cond_1

    .line 44
    .line 45
    iget p1, p0, Ll/jnk;->e:I

    .line 46
    .line 47
    invoke-static {p5, p1}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    filled-new-array {p1}, [Ll/sfj0$a;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    const-string p2, "e_group_chat_add_method_popup_review"

    .line 56
    .line 57
    invoke-static {p2, p6, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 58
    .line 59
    .line 60
    const-string p1, "applyRequired"

    .line 61
    .line 62
    invoke-static {p1}, Lcom/p1/mobile/putong/core/data/JoinCondition;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/JoinCondition;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    goto :goto_0

    .line 67
    :cond_1
    const/4 p1, 0x0

    .line 68
    :goto_0
    iget-object p2, p3, Lcom/p1/mobile/putong/core/data/ChatGroup;->joinCondition:Lcom/p1/mobile/putong/core/data/JoinCondition;

    .line 69
    .line 70
    invoke-static {p2, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 71
    .line 72
    .line 73
    move-result p2

    .line 74
    if-nez p2, :cond_2

    .line 75
    .line 76
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 77
    .line 78
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 79
    .line 80
    iget-object p3, p0, Ll/jnk;->b:Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {p2, p3, p1}, Lcom/p1/mobile/putong/core/api/e;->k7(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/JoinCondition;)Lrx/c;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    new-instance p2, Ll/ink;

    .line 87
    .line 88
    invoke-direct {p2}, Ll/ink;-><init>()V

    .line 89
    .line 90
    .line 91
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 92
    .line 93
    invoke-virtual {p3}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 94
    .line 95
    .line 96
    move-result-object p3

    .line 97
    invoke-static {p3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    new-instance p4, Ll/oik;

    .line 101
    .line 102
    invoke-direct {p4, p3}, Ll/oik;-><init>(Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;)V

    .line 103
    .line 104
    .line 105
    invoke-static {p2, p4}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 106
    .line 107
    .line 108
    move-result-object p2

    .line 109
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 110
    .line 111
    .line 112
    :cond_2
    iget-object p0, p0, Ll/jnk;->d:Ll/w30;

    .line 113
    .line 114
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 115
    .line 116
    .line 117
    return-void
.end method

.method public r0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jnk;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "groupchat_id"

    .line 8
    .line 9
    iget-object v2, p0, Ll/jnk;->b:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    filled-new-array {v1}, [Ll/sfj0$a;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const-string v2, "e_group_chat_manage_members"

    .line 20
    .line 21
    invoke-static {v2, v0, v1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/jnk;->a:Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    iget-object p0, p0, Ll/jnk;->b:Ljava/lang/String;

    .line 27
    .line 28
    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/ui/messages/group/GroupSettingMemberManagerAct;->a2(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method
