.class public final Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;
.super Ll/g6e;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/g6e;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic A(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/pf60;)V
    .locals 6

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-interface {p3, p0}, Ll/qhk0;->getUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 10
    .line 11
    .line 12
    move-result-object p3

    .line 13
    invoke-interface {p3, v2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->isMatchedByRelationship(Lcom/p1/mobile/putong/data/User;)Z

    .line 14
    .line 15
    .line 16
    move-result p3

    .line 17
    if-nez p3, :cond_0

    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 20
    .line 21
    .line 22
    move-result-object p3

    .line 23
    invoke-interface {p3, v2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->isMatchedByFollowship(Lcom/p1/mobile/putong/data/User;)Z

    .line 24
    .line 25
    .line 26
    move-result p3

    .line 27
    if-eqz p3, :cond_0

    .line 28
    .line 29
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    const/4 v4, 0x0

    .line 42
    const/4 v5, 0x0

    .line 43
    const/4 v3, 0x0

    .line 44
    invoke-interface/range {v0 .. v5}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->following(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    new-instance p3, Ll/yl8;

    .line 49
    .line 50
    invoke-direct {p3, p1, p2}, Ll/yl8;-><init>(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 51
    .line 52
    .line 53
    new-instance p2, Ll/zl8;

    .line 54
    .line 55
    invoke-direct {p2, p1}, Ll/zl8;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 56
    .line 57
    .line 58
    invoke-static {p3, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_0
    sget p3, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 67
    .line 68
    const/4 v0, 0x1

    .line 69
    invoke-virtual {p1, p3, v0}, Lcom/p1/mobile/android/app/Act;->progress(IZ)Landroid/app/Dialog;

    .line 70
    .line 71
    .line 72
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 73
    .line 74
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 75
    .line 76
    invoke-virtual {p3, p0, p1}, Lcom/p1/mobile/putong/core/api/g;->qe(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;)Lrx/c;

    .line 77
    .line 78
    .line 79
    move-result-object p3

    .line 80
    new-instance v0, Ll/am8;

    .line 81
    .line 82
    invoke-direct {v0, p0, p1, p2}, Ll/am8;-><init>(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 83
    .line 84
    .line 85
    new-instance p0, Ll/bm8;

    .line 86
    .line 87
    invoke-direct {p0, p1}, Ll/bm8;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 88
    .line 89
    .line 90
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-virtual {p3, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method public static synthetic A0(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static A1(Landroid/view/Menu;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ll/x20;)V
    .locals 9

    .line 1
    const/16 v7, 0xa

    .line 2
    .line 3
    const/4 v8, 0x0

    .line 4
    const/4 v0, 0x1

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v5, 0x1

    .line 7
    const/4 v6, 0x0

    .line 8
    move-object v2, p0

    .line 9
    move-object v3, p1

    .line 10
    move-object v4, p2

    .line 11
    invoke-static/range {v0 .. v8}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->l1(ZZLandroid/view/Menu;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;ZLl/x20;ILcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v4, v2, p3}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->h1(Lcom/p1/mobile/android/app/Act;Landroid/view/Menu;Ll/x20;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic B(Ll/y20;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ll/x20;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Conversation;Ll/x20;Ll/pf60;)V
    .locals 7

    .line 1
    new-instance v1, Ll/cm8;

    .line 2
    .line 3
    invoke-direct {v1, p0, p1, p2, p3}, Ll/cm8;-><init>(Ll/y20;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 4
    .line 5
    .line 6
    new-instance p0, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    iget-object p3, p7, Ll/pf60;->a:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast p3, Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 16
    .line 17
    .line 18
    move-result p3

    .line 19
    if-eqz p3, :cond_0

    .line 20
    .line 21
    sget p3, Lcom/p1/mobile/putong/core/R$string;->Uq:I

    .line 22
    .line 23
    invoke-virtual {p2, p3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p3

    .line 27
    invoke-virtual {p0, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    sget p3, Lcom/p1/mobile/putong/core/R$string;->Tq:I

    .line 31
    .line 32
    invoke-virtual {p2, p3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p3

    .line 36
    invoke-virtual {p0, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    sget p3, Lcom/p1/mobile/putong/core/R$string;->Qq:I

    .line 41
    .line 42
    invoke-virtual {p2, p3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p3

    .line 46
    invoke-virtual {p0, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    :goto_0
    iget-object p3, p7, Ll/pf60;->b:Ljava/lang/Object;

    .line 50
    .line 51
    check-cast p3, Ljava/lang/Boolean;

    .line 52
    .line 53
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 54
    .line 55
    .line 56
    move-result p3

    .line 57
    if-nez p3, :cond_1

    .line 58
    .line 59
    sget p3, Lcom/p1/mobile/putong/core/R$string;->Vq:I

    .line 60
    .line 61
    invoke-virtual {p2, p3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p3

    .line 65
    invoke-virtual {p0, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    :cond_1
    sget p3, Lcom/p1/mobile/putong/core/R$string;->Sq:I

    .line 69
    .line 70
    invoke-virtual {p2, p3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p3

    .line 74
    invoke-virtual {p0, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    sget p3, Lcom/p1/mobile/putong/core/R$string;->Rq:I

    .line 78
    .line 79
    invoke-virtual {p2, p3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p3

    .line 83
    invoke-virtual {p0, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    const-class p3, Lcom/p1/mobile/android/app/Dialog;

    .line 87
    .line 88
    invoke-virtual {p3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p3

    .line 92
    const-string p7, "p_unmatch_dialog"

    .line 93
    .line 94
    invoke-static {p7, p3}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 95
    .line 96
    .line 97
    move-result-object p3

    .line 98
    new-instance p7, Lorg/json/JSONObject;

    .line 99
    .line 100
    invoke-direct {p7}, Lorg/json/JSONObject;-><init>()V

    .line 101
    .line 102
    .line 103
    :try_start_0
    const-string v0, "tooltips_trigger_mode"

    .line 104
    .line 105
    const-string v2, "active"

    .line 106
    .line 107
    invoke-virtual {p7, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 108
    .line 109
    .line 110
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    if-eqz v0, :cond_2

    .line 115
    .line 116
    const-string v0, "unmatch_dialog_show_from"

    .line 117
    .line 118
    invoke-virtual {p7, v0, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 119
    .line 120
    .line 121
    goto :goto_1

    .line 122
    :catch_0
    move-exception v0

    .line 123
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 124
    .line 125
    .line 126
    :cond_2
    :goto_1
    invoke-virtual {p3, p7}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 127
    .line 128
    .line 129
    const/4 p7, 0x1

    .line 130
    new-array v6, p7, [Ll/w30;

    .line 131
    .line 132
    new-instance p7, Ll/w30$b;

    .line 133
    .line 134
    invoke-direct {p7, p2}, Ll/w30$b;-><init>(Landroid/content/Context;)V

    .line 135
    .line 136
    .line 137
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Wq:I

    .line 138
    .line 139
    invoke-virtual {p7, v0}, Ll/w30$b;->M(I)Ll/w30$b;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Pq:I

    .line 144
    .line 145
    invoke-virtual {v0, v2}, Ll/w30$b;->K(I)Ll/w30$b;

    .line 146
    .line 147
    .line 148
    sget v0, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 149
    .line 150
    invoke-virtual {p7, v0}, Ll/w30$b;->H(I)Ll/w30$b;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    new-instance v2, Ll/dm8;

    .line 155
    .line 156
    invoke-direct {v2, v6}, Ll/dm8;-><init>([Ll/w30;)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {v0, v2}, Ll/w30$b;->U(Landroid/view/View$OnClickListener;)Ll/w30$b;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    invoke-virtual {v0, p0}, Ll/w30$b;->Q(Ljava/util/List;)Ll/w30$b;

    .line 164
    .line 165
    .line 166
    move-result-object p0

    .line 167
    new-instance v0, Ll/em8;

    .line 168
    .line 169
    move-object v3, p1

    .line 170
    move-object v5, p2

    .line 171
    move-object v4, p4

    .line 172
    move-object v2, p5

    .line 173
    invoke-direct/range {v0 .. v6}, Ll/em8;-><init>(Ll/y20;Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;[Ll/w30;)V

    .line 174
    .line 175
    .line 176
    invoke-virtual {p0, v0}, Ll/w30$b;->V(Ll/w30$d;)Ll/w30$b;

    .line 177
    .line 178
    .line 179
    move-result-object p0

    .line 180
    new-instance p1, Ll/fm8;

    .line 181
    .line 182
    invoke-direct {p1, p6}, Ll/fm8;-><init>(Ll/x20;)V

    .line 183
    .line 184
    .line 185
    invoke-virtual {p0, p1}, Ll/w30$b;->S(Landroid/content/DialogInterface$OnCancelListener;)Ll/w30$b;

    .line 186
    .line 187
    .line 188
    move-result-object p0

    .line 189
    new-instance p1, Ll/gm8;

    .line 190
    .line 191
    invoke-direct {p1, p3}, Ll/gm8;-><init>(Ll/l4g0;)V

    .line 192
    .line 193
    .line 194
    invoke-virtual {p0, p1}, Ll/w30$b;->T(Landroid/content/DialogInterface$OnDismissListener;)Ll/w30$b;

    .line 195
    .line 196
    .line 197
    move-result-object p0

    .line 198
    new-instance p1, Ll/hm8;

    .line 199
    .line 200
    invoke-direct {p1, p3}, Ll/hm8;-><init>(Ll/l4g0;)V

    .line 201
    .line 202
    .line 203
    invoke-virtual {p0, p1}, Ll/w30$b;->W(Landroid/content/DialogInterface$OnShowListener;)Ll/w30$b;

    .line 204
    .line 205
    .line 206
    invoke-virtual {p7}, Ll/w30$b;->F()Ll/w30;

    .line 207
    .line 208
    .line 209
    move-result-object p0

    .line 210
    const/4 p1, 0x0

    .line 211
    aput-object p0, v6, p1

    .line 212
    .line 213
    invoke-virtual {p0}, Ll/w30;->f()V

    .line 214
    .line 215
    .line 216
    return-void
.end method

.method public static synthetic B0(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static B1(Lcom/p1/mobile/putong/data/User;)Z
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 6
    .line 7
    if-nez v1, :cond_1

    .line 8
    .line 9
    return v0

    .line 10
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->letter()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-nez v1, :cond_3

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->likedMe()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-nez v1, :cond_3

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->superLikedMe()Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_2

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_2
    return v0

    .line 30
    :cond_3
    :goto_0
    const/4 p0, 0x1

    .line 31
    return p0
.end method

.method public static synthetic C(Ljava/util/Set;Lv/VButton;Ljava/util/Set;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/util/Set;->clear()V

    .line 2
    .line 3
    .line 4
    invoke-interface {p0, p2}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 5
    .line 6
    .line 7
    invoke-interface {p0}, Ljava/util/Set;->isEmpty()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    xor-int/lit8 p0, p0, 0x1

    .line 12
    .line 13
    invoke-virtual {p1, p0}, Landroid/view/View;->setEnabled(Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic C0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZLl/x20;Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;Landroid/view/MenuItem;)Z
    .locals 1

    .line 1
    new-instance p5, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$1;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-direct {p5, v0, p2, p3, p0}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$1;-><init>(Landroid/os/Handler;ZLl/x20;Lcom/p1/mobile/android/app/Act;)V

    .line 5
    .line 6
    .line 7
    invoke-static {p0, p1, p2, p5, p4}, Lcom/p1/mobile/putong/core/ui/report/ReportAct;->c2(Landroid/content/Context;Ljava/lang/String;ZLandroid/os/ResultReceiver;Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0
.end method

.method public static C1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)Lrx/c;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/LinkChannel;",
            ">;)",
            "Lrx/c;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Link;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Link;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "invite"

    .line 7
    .line 8
    invoke-static {v1}, Lcom/p1/mobile/putong/data/LinkIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkIntent;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Link;->intent:Lcom/p1/mobile/putong/data/LinkIntent;

    .line 13
    .line 14
    new-instance v1, Lcom/p1/mobile/putong/data/IdBoxed;

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
    const-string v3, "user"

    .line 25
    .line 26
    invoke-direct {v1, v2, v3}, Lcom/p1/mobile/putong/data/IdBoxed;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    filled-new-array {v1}, [Lcom/p1/mobile/putong/data/IdBoxed;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Link;->resources:Ljava/util/List;

    .line 38
    .line 39
    const-string v1, "https://thetantanapp.com"

    .line 40
    .line 41
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Link;->href:Ljava/lang/String;

    .line 42
    .line 43
    const-string v1, "wechat-moments"

    .line 44
    .line 45
    invoke-static {v1}, Lcom/p1/mobile/putong/data/LinkChannel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkChannel;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Link;->channel:Lcom/p1/mobile/putong/data/LinkChannel;

    .line 50
    .line 51
    new-instance v2, Lcom/p1/mobile/putong/ui/share/ShareHelper;

    .line 52
    .line 53
    invoke-direct {v2, v0, p1}, Lcom/p1/mobile/putong/ui/share/ShareHelper;-><init>(Lcom/p1/mobile/putong/data/Link;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    sget p1, Lcom/p1/mobile/putong/core/R$string;->ph:I

    .line 57
    .line 58
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v4

    .line 62
    const/4 v7, 0x1

    .line 63
    move-object v3, p0

    .line 64
    move-object v5, p2

    .line 65
    move-object v6, p3

    .line 66
    invoke-virtual/range {v2 .. v7}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->w0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Z)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    return-object p0
.end method

.method public static synthetic D(Ll/y20;Landroid/app/Dialog;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-interface {p0, p2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/app/Dialog;->dismiss()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic D0(ZLjava/lang/Runnable;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-static {}, Ll/fph0;->A()V

    .line 4
    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    invoke-static {}, Ll/fph0;->x()V

    .line 8
    .line 9
    .line 10
    :goto_0
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p2}, Ll/g1e;->dismiss()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static D1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/util/ArrayList;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/LinkChannel;",
            ">;)",
            "Lrx/c;"
        }
    .end annotation

    .line 1
    sget v0, Lcom/p1/mobile/putong/core/R$string;->yt:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p0, p1, v0, p2}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->C1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic E(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic E0(Lcom/p1/mobile/android/app/Dialog;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static E1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/CharSequence;ILjava/lang/String;Ll/x20;ZLjava/lang/String;Ll/x20;Ll/x20;)V
    .locals 15

    .line 1
    const/4 v13, 0x0

    .line 2
    const/4 v14, 0x0

    .line 3
    const/4 v10, 0x0

    .line 4
    const/4 v11, 0x1

    .line 5
    const/4 v12, 0x0

    .line 6
    move-object v0, p0

    .line 7
    move-object/from16 v1, p1

    .line 8
    .line 9
    move-object/from16 v2, p2

    .line 10
    .line 11
    move/from16 v3, p3

    .line 12
    .line 13
    move-object/from16 v4, p4

    .line 14
    .line 15
    move-object/from16 v5, p5

    .line 16
    .line 17
    move/from16 v6, p6

    .line 18
    .line 19
    move-object/from16 v7, p7

    .line 20
    .line 21
    move-object/from16 v8, p8

    .line 22
    .line 23
    move-object/from16 v9, p9

    .line 24
    .line 25
    invoke-static/range {v0 .. v14}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->F1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/CharSequence;ILjava/lang/String;Ll/x20;ZLjava/lang/String;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/data/User;ZZLjava/lang/String;Ll/x20;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static synthetic F(Ll/x20;Lcom/p1/mobile/putong/data/User;)V
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
    invoke-interface {p0}, Ll/x20;->call()V

    .line 8
    .line 9
    .line 10
    :cond_0
    const-string p0, "receiver_user_id"

    .line 11
    .line 12
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {p0, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    filled-new-array {p0}, [Ll/sfj0$a;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-string p1, "e_alert_dislike_who_liked_me_like"

    .line 23
    .line 24
    const-string v0, "p_alert_dislike_who_liked_me_popup"

    .line 25
    .line 26
    invoke-static {p1, v0, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public static synthetic F0(Ljava/lang/String;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/l51;->q(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static F1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/CharSequence;ILjava/lang/String;Ll/x20;ZLjava/lang/String;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/data/User;ZZLjava/lang/String;Ll/x20;)V
    .locals 16
    .param p10    # Lcom/p1/mobile/putong/data/User;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v15, 0x0

    .line 2
    move-object/from16 v0, p0

    .line 3
    .line 4
    move-object/from16 v1, p1

    .line 5
    .line 6
    move-object/from16 v2, p2

    .line 7
    .line 8
    move/from16 v3, p3

    .line 9
    .line 10
    move-object/from16 v4, p4

    .line 11
    .line 12
    move-object/from16 v5, p5

    .line 13
    .line 14
    move/from16 v6, p6

    .line 15
    .line 16
    move-object/from16 v7, p7

    .line 17
    .line 18
    move-object/from16 v8, p8

    .line 19
    .line 20
    move-object/from16 v9, p9

    .line 21
    .line 22
    move-object/from16 v10, p10

    .line 23
    .line 24
    move/from16 v11, p11

    .line 25
    .line 26
    move/from16 v12, p12

    .line 27
    .line 28
    move-object/from16 v13, p13

    .line 29
    .line 30
    move-object/from16 v14, p14

    .line 31
    .line 32
    invoke-static/range {v0 .. v15}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->G1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/CharSequence;ILjava/lang/String;Ll/x20;ZLjava/lang/String;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/data/User;ZZLjava/lang/String;Ll/x20;Z)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public static synthetic G(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    const-string v0, "input_method"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/view/inputmethod/InputMethodManager;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    const/4 v1, 0x2

    .line 11
    invoke-virtual {p0, v0, v1}, Landroid/view/inputmethod/InputMethodManager;->toggleSoftInput(II)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic G0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Landroid/view/MenuItem;)Z
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/SetTickleAct;->a2(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0
.end method

.method public static G1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/CharSequence;ILjava/lang/String;Ll/x20;ZLjava/lang/String;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/data/User;ZZLjava/lang/String;Ll/x20;Z)V
    .locals 17
    .param p10    # Lcom/p1/mobile/putong/data/User;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static/range {p13 .. p13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 2
    const-string v0, "pic_verification_dialog"

    move-object/from16 v14, p13

    invoke-static {v14, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    move-result-object v0

    :goto_0
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    move-object/from16 v10, p9

    move-object/from16 v11, p10

    move/from16 v12, p11

    move/from16 v13, p12

    move-object/from16 v15, p14

    move-object/from16 v16, v0

    goto :goto_1

    :cond_0
    move-object/from16 v14, p13

    const/4 v0, 0x0

    goto :goto_0

    .line 3
    :goto_1
    invoke-static/range {v1 .. v16}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->H1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/CharSequence;ILjava/lang/String;Ll/x20;ZLjava/lang/String;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/data/User;ZZLjava/lang/String;Ll/x20;Ll/l4g0;)V

    return-void
.end method

.method public static synthetic H(Ll/x20;)V
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
    invoke-interface {p0}, Ll/x20;->call()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic H0(Ll/x20;)V
    .locals 2

    .line 1
    const-string v0, "e_user_profile_share_agreement_popup_cancel"

    .line 2
    .line 3
    const-string v1, "p_user_profile_share_agreement_popup"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p0}, Ll/x20;->call()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static H1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/CharSequence;ILjava/lang/String;Ll/x20;ZLjava/lang/String;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/data/User;ZZLjava/lang/String;Ll/x20;Ll/l4g0;)V
    .locals 8
    .param p10    # Lcom/p1/mobile/putong/data/User;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    new-instance v0, Landroid/text/SpannableStringBuilder;

    invoke-direct {v0, p2}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 2
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->newDialog()Ll/jl80$a;

    move-result-object p2

    .line 3
    invoke-virtual {p2, p1}, Ll/jl80$a;->y0(Ljava/lang/CharSequence;)Ll/jl80$a;

    move-result-object p1

    .line 4
    invoke-virtual {p1, v0}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    move-result-object p1

    .line 5
    invoke-virtual {p1, p3}, Ll/jl80$a;->S(I)Ll/jl80$a;

    move-result-object p1

    move/from16 p2, p11

    .line 6
    invoke-virtual {p1, p2}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    move-result-object p1

    new-instance p2, Ll/wn8;

    move-object/from16 v0, p13

    move-object/from16 v1, p15

    invoke-direct {p2, v0, v1}, Ll/wn8;-><init>(Ljava/lang/String;Ll/l4g0;)V

    .line 7
    invoke-virtual {p1, p2}, Ll/jl80$a;->n0(Landroid/content/DialogInterface$OnDismissListener;)Ll/jl80$a;

    move-result-object p1

    new-instance p2, Ll/xn8;

    invoke-direct {p2, p5}, Ll/xn8;-><init>(Ll/x20;)V

    .line 8
    invoke-virtual {p1, p4, p2}, Ll/jl80$a;->c0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    move-result-object p1

    if-eqz p6, :cond_0

    .line 9
    new-instance p2, Ll/yn8;

    move-object/from16 v2, p8

    invoke-direct {p2, v2}, Ll/yn8;-><init>(Ll/x20;)V

    invoke-virtual {p1, p7, p2}, Ll/jl80$a;->X(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    :cond_0
    const/4 p2, 0x0

    if-eqz p6, :cond_2

    const/4 v2, 0x1

    if-eqz p12, :cond_1

    .line 10
    invoke-static {}, Ll/bnl0;->w0()I

    move-result v3

    const/16 v4, 0x4b0

    if-gt v3, v4, :cond_2

    goto :goto_0

    .line 11
    :cond_1
    invoke-static {}, Ll/bnl0;->w0()I

    move-result v3

    const/16 v4, 0x384

    if-gt v3, v4, :cond_2

    goto :goto_0

    :cond_2
    move v2, p2

    .line 12
    :goto_0
    invoke-static/range {p10 .. p10}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v3

    const-string v4, "en"

    const-string v5, "id"

    const-string v6, "in"

    const-string v7, "ja"

    if-eqz v3, :cond_7

    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    move-result-object p0

    sget p3, Ll/kec0;->xe:I

    const/4 v3, 0x0

    invoke-virtual {p0, p3, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p0

    .line 14
    sget p3, Ll/adc0;->af:I

    invoke-virtual {p0, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Lv/VImage;

    move-object/from16 v3, p10

    .line 15
    invoke-virtual {v3, p3, p3}, Lcom/p1/mobile/putong/data/User;->showPicVerificationIcon(Landroid/view/View;Lv/VImage;)V

    if-eqz v2, :cond_6

    .line 16
    sget p3, Ll/adc0;->Qa:I

    invoke-virtual {p0, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/widget/FrameLayout;

    .line 17
    invoke-virtual {p3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p3

    check-cast p3, Landroid/widget/LinearLayout$LayoutParams;

    if-eqz p12, :cond_5

    .line 18
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v2

    .line 19
    invoke-virtual {v7, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_4

    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_4

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    goto :goto_1

    .line 20
    :cond_3
    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    const/4 v2, 0x4

    goto :goto_2

    :cond_4
    :goto_1
    const/16 v2, 0xa

    goto :goto_2

    :cond_5
    const/16 v2, 0x14

    :goto_2
    int-to-float v2, v2

    .line 21
    invoke-static {v2}, Ll/qa00;->d(F)I

    move-result v2

    iput v2, p3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 22
    :cond_6
    sget p3, Ll/adc0;->Pa:I

    invoke-virtual {p0, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Lv/VDraweeView;

    .line 23
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    move-result-object v3

    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object v3

    invoke-virtual {v2, p3, v3, p2}, Ll/fsb0;->J0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Z)V

    .line 24
    invoke-virtual {p1, p0}, Ll/jl80$a;->R(Landroid/view/View;)Ll/jl80$a;

    move-result-object p0

    invoke-virtual {p0}, Ll/jl80$a;->O()Ll/jl80;

    move-result-object p0

    goto :goto_4

    :cond_7
    if-eqz v2, :cond_9

    if-eqz p12, :cond_9

    .line 25
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object p0

    .line 26
    invoke-virtual {v7, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_9

    invoke-virtual {v6, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_9

    invoke-virtual {v5, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_8

    goto :goto_3

    .line 27
    :cond_8
    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    :cond_9
    :goto_3
    invoke-virtual {p1, p3}, Ll/jl80$a;->S(I)Ll/jl80$a;

    move-result-object p0

    invoke-virtual {p0}, Ll/jl80$a;->O()Ll/jl80;

    move-result-object p0

    .line 29
    :goto_4
    invoke-static/range {p9 .. p9}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_a

    .line 30
    new-instance p1, Ll/zn8;

    move-object/from16 p2, p9

    move-object/from16 p3, p14

    invoke-direct {p1, p2, p3}, Ll/zn8;-><init>(Ll/x20;Ll/x20;)V

    invoke-virtual {p0, p1}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 31
    :cond_a
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_b

    .line 32
    invoke-static {v1}, Ll/w1e;->f(Ll/l4g0;)V

    .line 33
    :cond_b
    invoke-virtual {p0}, Ll/jl80;->show()V

    return-void
.end method

.method public static synthetic I(Lcom/p1/mobile/android/app/Dialog;Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    invoke-interface {p1}, Ll/x20;->call()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic I0(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static I1(Lcom/p1/mobile/android/app/Act;Ll/pcj;Ll/y20;Ll/y20;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/pcj<",
            "Ljava/lang/Double;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/Double;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/Date;

    .line 2
    .line 3
    invoke-interface {p1}, Ll/pcj;->call()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ljava/lang/Double;

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    .line 10
    .line 11
    .line 12
    move-result-wide v1

    .line 13
    double-to-long v1, v1

    .line 14
    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    .line 15
    .line 16
    .line 17
    new-instance p1, Ll/go8;

    .line 18
    .line 19
    invoke-direct {p1, p3, p2}, Ll/go8;-><init>(Ll/y20;Ll/y20;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/util/Date;->getYear()I

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    add-int/lit16 p2, p2, 0x76c

    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/util/Date;->getMonth()I

    .line 29
    .line 30
    .line 31
    move-result p3

    .line 32
    invoke-virtual {v0}, Ljava/util/Date;->getDate()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    const/4 v1, 0x1

    .line 37
    invoke-static {p1, p2, p3, v0, v1}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->h4(Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$d;IIIZ)Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p1, v1}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->o4(Z)V

    .line 42
    .line 43
    .line 44
    new-instance p2, Ll/ho8;

    .line 45
    .line 46
    invoke-direct {p2, p0}, Ll/ho8;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1, p2}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->L1(Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$c;)V

    .line 50
    .line 51
    .line 52
    sget p2, Lcom/p1/mobile/putong/core/R$string;->T:I

    .line 53
    .line 54
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    invoke-virtual {p1, p2}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->l4(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    sget p2, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 62
    .line 63
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    invoke-virtual {p1, p2}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->j4(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    const-string p2, "dpd"

    .line 75
    .line 76
    invoke-virtual {p1, p0, p2}, Landroidx/fragment/app/DialogFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public static synthetic J(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic J0(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/g;->o0:Ll/jxd0;

    .line 6
    .line 7
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    const-string v0, "cheat_prevention_from"

    .line 13
    .line 14
    const-string v1, "tips_popup"

    .line 15
    .line 16
    invoke-static {v0, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    filled-new-array {v0}, [Ll/sfj0$a;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-string v1, "e_cheat_prevention_guide_click"

    .line 25
    .line 26
    const-string v2, "p_alert_cheat_prevention__tips_popup"

    .line 27
    .line 28
    invoke-static {v1, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 29
    .line 30
    .line 31
    const-string v0, "no_prompt_again"

    .line 32
    .line 33
    const-string v1, "yes"

    .line 34
    .line 35
    invoke-static {v0, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    filled-new-array {v0}, [Ll/sfj0$a;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const-string v1, "e_alert_cheat_prevention__tips_click"

    .line 44
    .line 45
    invoke-static {v1, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 46
    .line 47
    .line 48
    const-string v0, "https://live-web.tantanapp.com/anti_fraud_reminder/guide"

    .line 49
    .line 50
    const/4 v1, 0x1

    .line 51
    const-string v2, ""

    .line 52
    .line 53
    invoke-static {p0, v2, v0, v1}, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->b2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public static J1(Landroid/view/Menu;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;ZZLjava/lang/String;Ll/x20;Ll/x20;Ljava/lang/String;)V
    .locals 11

    .line 1
    const/4 v8, 0x1

    .line 2
    const/4 v9, 0x0

    .line 3
    move-object v0, p0

    .line 4
    move-object v1, p1

    .line 5
    move-object v2, p2

    .line 6
    move v3, p3

    .line 7
    move v4, p4

    .line 8
    move-object/from16 v5, p5

    .line 9
    .line 10
    move-object/from16 v6, p6

    .line 11
    .line 12
    move-object/from16 v7, p7

    .line 13
    .line 14
    move-object/from16 v10, p8

    .line 15
    .line 16
    invoke-static/range {v0 .. v10}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->K1(Landroid/view/Menu;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;ZZLjava/lang/String;Ll/x20;Ll/x20;ZZLjava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static synthetic K(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic K0(Lcom/p1/mobile/android/app/Act;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    sget p0, Lcom/p1/mobile/putong/core/R$string;->zm:I

    .line 5
    .line 6
    sget p1, Lcom/p1/mobile/putong/core/R$string;->om:I

    .line 7
    .line 8
    invoke-static {p0, p1}, Ll/lu6;->b(II)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static K1(Landroid/view/Menu;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;ZZLjava/lang/String;Ll/x20;Ll/x20;ZZLjava/lang/String;)V
    .locals 12

    const/4 v11, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move/from16 v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    move/from16 v8, p8

    move/from16 v9, p9

    move-object/from16 v10, p10

    .line 1
    invoke-static/range {v0 .. v11}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->L1(Landroid/view/Menu;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;ZZLjava/lang/String;Ll/x20;Ll/x20;ZZLjava/lang/String;Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;)V

    return-void
.end method

.method public static synthetic L(Lv/VText;Lcom/p1/mobile/putong/core/newui/messages/b;Ll/vg60;)V
    .locals 1

    .line 1
    iget-object v0, p2, Ll/vg60;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p2, Ll/vg60;->a:Ljava/util/List;

    .line 11
    .line 12
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/newui/messages/b;->G(Ljava/util/List;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic L0(Ll/l4g0;Ll/z20;Ljava/lang/StringBuilder;Lcom/google/android/material/bottomsheet/BottomSheetDialog;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    const-string p0, "success"

    .line 5
    .line 6
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    invoke-interface {p1, p0, p2}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p3}, Landroid/app/Dialog;->dismiss()V

    .line 14
    .line 15
    .line 16
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->Fo()Lrx/c;

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static L1(Landroid/view/Menu;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;ZZLjava/lang/String;Ll/x20;Ll/x20;ZZLjava/lang/String;Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;)V
    .locals 9

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    invoke-virtual {v0, p1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    move-result-object v0

    if-nez v0, :cond_0

    .line 2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    move-result-object v0

    invoke-interface {v0, p1}, Ll/qhk0;->getUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    move-result-object v0

    :cond_0
    move-object v8, v0

    if-eqz v8, :cond_1

    .line 3
    iget-object v0, v8, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    move-result-object v1

    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {v8}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    if-nez v0, :cond_2

    if-nez p3, :cond_2

    goto :goto_2

    .line 5
    :cond_2
    invoke-static {v8}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    instance-of v1, p2, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    if-eqz v1, :cond_3

    invoke-virtual {v8}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    move-result v1

    if-nez v1, :cond_3

    .line 6
    invoke-static {p2, p0, p1}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->m1(Lcom/p1/mobile/android/app/Act;Landroid/view/Menu;Ljava/lang/String;)V

    :cond_3
    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move v1, p4

    move-object v5, p6

    move-object/from16 v6, p11

    .line 7
    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->k1(ZZLandroid/view/Menu;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ll/x20;Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;)V

    .line 8
    invoke-static {p3, p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->i1(ZLandroid/view/Menu;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;)V

    if-eqz p8, :cond_4

    move-object v4, p0

    move-object v5, p1

    move-object v3, p2

    move v1, p4

    move-object/from16 v6, p7

    move-object/from16 v7, p10

    move-object v2, v8

    .line 9
    invoke-static/range {v0 .. v7}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->p1(ZZLcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Landroid/view/Menu;Ljava/lang/String;Ll/x20;Ljava/lang/String;)V

    goto :goto_1

    :cond_4
    move-object v2, v8

    :goto_1
    if-eqz p9, :cond_5

    .line 10
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    move-result v0

    if-nez v0, :cond_5

    .line 11
    iget-object v0, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-static {p2, p0, v0}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->o1(Lcom/p1/mobile/android/app/Act;Landroid/view/Menu;Ljava/lang/String;)V

    :cond_5
    :goto_2
    return-void
.end method

.method public static synthetic M(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic M0(Ljava/lang/Runnable;Z)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    invoke-static {}, Ll/fph0;->B()V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-static {}, Ll/fph0;->y()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static M1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 3

    .line 1
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->N1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/core/data/Message;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance p2, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Ll/pf60;

    .line 25
    .line 26
    iget-object v1, v1, Ll/pf60;->a:Ljava/lang/Object;

    .line 27
    .line 28
    check-cast v1, Ljava/lang/CharSequence;

    .line 29
    .line 30
    invoke-interface {p2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    new-instance v0, Ll/w30$b;

    .line 35
    .line 36
    invoke-direct {v0, p0}, Ll/w30$b;-><init>(Landroid/content/Context;)V

    .line 37
    .line 38
    .line 39
    const/4 v1, 0x1

    .line 40
    new-array v1, v1, [Ll/w30;

    .line 41
    .line 42
    sget v2, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 43
    .line 44
    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {v0, p0}, Ll/w30$b;->I(Ljava/lang/CharSequence;)Ll/w30$b;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    new-instance v0, Ll/hp8;

    .line 53
    .line 54
    invoke-direct {v0, v1}, Ll/hp8;-><init>([Ll/w30;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0, v0}, Ll/w30$b;->U(Landroid/view/View$OnClickListener;)Ll/w30$b;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p0, p2}, Ll/w30$b;->Q(Ljava/util/List;)Ll/w30$b;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    new-instance p2, Ll/ip8;

    .line 66
    .line 67
    invoke-direct {p2, p1, v1}, Ll/ip8;-><init>(Ljava/util/List;[Ll/w30;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0, p2}, Ll/w30$b;->V(Ll/w30$d;)Ll/w30$b;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {p0}, Ll/w30$b;->F()Ll/w30;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {p0}, Ll/w30;->f()V

    .line 79
    .line 80
    .line 81
    const/4 p1, 0x0

    .line 82
    aput-object p0, v1, p1

    .line 83
    .line 84
    return-void
.end method

.method public static synthetic N(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;Ljava/lang/String;Landroid/view/MenuItem;)Z
    .locals 6

    .line 1
    const/4 v2, 0x0

    .line 2
    const/4 v3, 0x0

    .line 3
    move-object v0, p0

    .line 4
    move-object v1, p1

    .line 5
    move-object v4, p2

    .line 6
    move-object v5, p3

    .line 7
    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->v1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;Ll/x20;Ll/x20;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0
.end method

.method public static synthetic N0(ZLjava/lang/Runnable;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-static {}, Ll/fph0;->A()V

    .line 4
    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    invoke-static {}, Ll/fph0;->x()V

    .line 8
    .line 9
    .line 10
    :goto_0
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static N1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/core/data/Message;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/data/Media;",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ")",
            "Ljava/util/List<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/Runnable;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 7
    .line 8
    sget v2, Lcom/p1/mobile/putong/core/R$string;->u:I

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    new-instance v2, Ll/pp8;

    .line 15
    .line 16
    invoke-direct {v2, p0, p1}, Ll/pp8;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Media;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_1

    .line 31
    .line 32
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Message;->isGroupMessage()Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-nez v1, :cond_1

    .line 37
    .line 38
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-nez v1, :cond_1

    .line 43
    .line 44
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 45
    .line 46
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 47
    .line 48
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v1, v2}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    new-instance v2, Ll/qp8;

    .line 55
    .line 56
    invoke-direct {v2}, Ll/qp8;-><init>()V

    .line 57
    .line 58
    .line 59
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 60
    .line 61
    invoke-static {v1, v2, v3}, Ll/jyb;->X(Ljava/lang/Object;Ll/qcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    check-cast v1, Ljava/lang/Boolean;

    .line 66
    .line 67
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    if-nez v1, :cond_1

    .line 72
    .line 73
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 74
    .line 75
    instance-of p1, p1, Lcom/p1/mobile/putong/data/Video;

    .line 76
    .line 77
    if-eqz p1, :cond_0

    .line 78
    .line 79
    sget p1, Lcom/p1/mobile/putong/core/R$string;->lk:I

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_0
    sget p1, Lcom/p1/mobile/putong/core/R$string;->kk:I

    .line 83
    .line 84
    :goto_0
    invoke-virtual {v1, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    new-instance v1, Ll/rp8;

    .line 89
    .line 90
    invoke-direct {v1, p0, p2}, Ll/rp8;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 91
    .line 92
    .line 93
    invoke-static {p1, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    :cond_1
    return-object v0
.end method

.method public static synthetic O([Ll/w30;Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    aget-object p0, p0, p1

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic O0(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

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

.method public static O1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/core/data/Message;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/data/Media;",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ")",
            "Ljava/util/List<",
            "Ll/ovb0<",
            "Ljava/lang/String;",
            "Ljava/lang/Runnable;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Void;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 7
    .line 8
    sget v2, Lcom/p1/mobile/putong/core/R$string;->u:I

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    new-instance v2, Ll/in8;

    .line 15
    .line 16
    invoke-direct {v2, p0, p1}, Ll/in8;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Media;)V

    .line 17
    .line 18
    .line 19
    sget v3, Ll/dbc0;->ff:I

    .line 20
    .line 21
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    const/4 v4, 0x0

    .line 26
    invoke-static {v1, v2, v3, v4}, Ll/jyb;->Z(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/ovb0;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_2

    .line 38
    .line 39
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Message;->isGroupMessage()Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-nez v1, :cond_2

    .line 44
    .line 45
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-nez v1, :cond_2

    .line 50
    .line 51
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 52
    .line 53
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 54
    .line 55
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {v1, v2}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    new-instance v2, Ll/tn8;

    .line 62
    .line 63
    invoke-direct {v2}, Ll/tn8;-><init>()V

    .line 64
    .line 65
    .line 66
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 67
    .line 68
    invoke-static {v1, v2, v3}, Ll/jyb;->X(Ljava/lang/Object;Ll/qcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    check-cast v1, Ljava/lang/Boolean;

    .line 73
    .line 74
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    if-nez v1, :cond_2

    .line 79
    .line 80
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 81
    .line 82
    instance-of p1, p1, Lcom/p1/mobile/putong/data/Video;

    .line 83
    .line 84
    if-eqz p1, :cond_0

    .line 85
    .line 86
    sget v2, Lcom/p1/mobile/putong/core/R$string;->lk:I

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_0
    sget v2, Lcom/p1/mobile/putong/core/R$string;->kk:I

    .line 90
    .line 91
    :goto_0
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    new-instance v2, Ll/eo8;

    .line 96
    .line 97
    invoke-direct {v2, p0, p2}, Ll/eo8;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 98
    .line 99
    .line 100
    if-eqz p1, :cond_1

    .line 101
    .line 102
    sget p0, Ll/dbc0;->ef:I

    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_1
    sget p0, Ll/dbc0;->ef:I

    .line 106
    .line 107
    :goto_1
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    invoke-static {v1, v2, p0, v4}, Ll/jyb;->Z(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/ovb0;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    :cond_2
    return-object v0
.end method

.method public static synthetic P(Ll/y20;Ll/y20;Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;III)V
    .locals 7

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/data/Converter;->CALENDAR:Ljava/lang/ThreadLocal;

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    move-object v0, p2

    .line 8
    check-cast v0, Ljava/util/GregorianCalendar;

    .line 9
    .line 10
    const/4 v5, 0x0

    .line 11
    const/4 v6, 0x0

    .line 12
    const/4 v4, 0x0

    .line 13
    move v1, p3

    .line 14
    move v2, p4

    .line 15
    move v3, p5

    .line 16
    invoke-virtual/range {v0 .. v6}, Ljava/util/Calendar;->set(IIIIII)V

    .line 17
    .line 18
    .line 19
    const/16 p2, 0xe

    .line 20
    .line 21
    const/4 p3, 0x0

    .line 22
    invoke-virtual {v0, p2, p3}, Ljava/util/Calendar;->set(II)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    invoke-static {}, Ll/bsj0;->V()Ljava/util/Date;

    .line 30
    .line 31
    .line 32
    move-result-object p3

    .line 33
    invoke-virtual {p2, p3}, Ljava/util/Date;->compareTo(Ljava/util/Date;)I

    .line 34
    .line 35
    .line 36
    move-result p3

    .line 37
    if-lez p3, :cond_0

    .line 38
    .line 39
    sget p1, Lcom/p1/mobile/putong/core/R$string;->A9:I

    .line 40
    .line 41
    invoke-static {p1}, Ll/o1j0;->h(I)V

    .line 42
    .line 43
    .line 44
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-eqz p1, :cond_1

    .line 49
    .line 50
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 51
    .line 52
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_0
    invoke-static {}, Ll/bsj0;->N()Ljava/util/Date;

    .line 57
    .line 58
    .line 59
    move-result-object p3

    .line 60
    invoke-virtual {p2, p3}, Ljava/util/Date;->compareTo(Ljava/util/Date;)I

    .line 61
    .line 62
    .line 63
    move-result p3

    .line 64
    if-gez p3, :cond_2

    .line 65
    .line 66
    sget p1, Lcom/p1/mobile/putong/core/R$string;->z9:I

    .line 67
    .line 68
    invoke-static {p1}, Ll/o1j0;->h(I)V

    .line 69
    .line 70
    .line 71
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    if-eqz p1, :cond_1

    .line 76
    .line 77
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 78
    .line 79
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 80
    .line 81
    .line 82
    :cond_1
    return-void

    .line 83
    :cond_2
    invoke-virtual {p2}, Ljava/util/Date;->getTime()J

    .line 84
    .line 85
    .line 86
    move-result-wide p2

    .line 87
    long-to-double p2, p2

    .line 88
    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public static synthetic P0(Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    sget p0, Lcom/p1/mobile/putong/core/R$string;->p4:I

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 4
    .line 5
    .line 6
    new-instance p0, Ljava/lang/Exception;

    .line 7
    .line 8
    new-instance v0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string v1, "downloadMedia Fail exception:"

    .line 11
    .line 12
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-direct {p0, v0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 27
    .line 28
    .line 29
    const/16 p1, 0x32

    .line 30
    .line 31
    invoke-static {p0, p1}, Lcom/tantanapp/common/utils/CrashHelper;->d(Ljava/lang/Throwable;I)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public static P1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ll/z20;)Lcom/google/android/material/bottomsheet/BottomSheetDialog;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "I",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ll/z20<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/google/android/material/bottomsheet/BottomSheetDialog;"
        }
    .end annotation

    if-nez p8, :cond_0

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    goto :goto_0

    :cond_0
    move-object/from16 v0, p8

    .line 2
    :goto_0
    const-class v1, Lcom/p1/mobile/android/app/Dialog;

    .line 3
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "p_friends_list"

    invoke-static {v2, v1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    move-result-object v7

    .line 4
    const-string v1, "share_source"

    move-object/from16 v2, p9

    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    move-result-object v1

    filled-new-array {v1}, [Ll/pf60;

    move-result-object v1

    invoke-virtual {v7, v1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 5
    new-instance v9, Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    invoke-direct {v9, p0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;-><init>(Landroid/content/Context;)V

    .line 6
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    sget v2, Ll/kec0;->Wb:I

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 7
    invoke-virtual {v9, v1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(Landroid/view/View;)V

    .line 8
    invoke-virtual {v9}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 9
    sget v3, Ll/vcc0;->E:I

    invoke-virtual {v2, v3}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .line 10
    sget v3, Ll/c9c0;->V1:I

    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 11
    :cond_1
    sget v2, Ll/adc0;->je:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lv/VText;

    .line 12
    sget v3, Ll/adc0;->bd:I

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lv/VText;

    .line 13
    sget v4, Ll/adc0;->F0:I

    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    move-object v10, v4

    check-cast v10, Lv/VButton;

    .line 14
    sget v4, Ll/adc0;->x3:I

    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lv/VText;

    .line 15
    invoke-virtual {v2, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 16
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    const/4 v2, 0x0

    if-nez p2, :cond_2

    .line 17
    invoke-virtual {v3, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 18
    :cond_2
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    :goto_1
    invoke-virtual {v10, v2}, Landroid/view/View;->setEnabled(Z)V

    move-object/from16 p2, p5

    .line 20
    invoke-virtual {v10, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    sget p2, Ll/adc0;->D4:I

    invoke-virtual {v1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lv/VRecyclerView;

    .line 22
    new-instance p3, Landroidx/recyclerview/widget/LinearLayoutManager;

    const/4 v1, 0x1

    invoke-direct {p3, p0, v1, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    invoke-virtual {p2, p3}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 23
    new-instance p3, Lcom/p1/mobile/putong/core/newui/messages/b;

    move-object/from16 v3, p6

    invoke-direct {p3, p0, p4, v3}, Lcom/p1/mobile/putong/core/newui/messages/b;-><init>(Lcom/p1/mobile/android/app/Act;ILjava/lang/String;)V

    .line 24
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 25
    new-instance v3, Ll/jn8;

    invoke-direct {v3, v2, v10}, Ll/jn8;-><init>(Ljava/util/Set;Lv/VButton;)V

    invoke-virtual {p3, v3}, Lcom/p1/mobile/putong/core/newui/messages/b;->H(Lcom/p1/mobile/putong/core/newui/messages/b$a;)V

    .line 26
    invoke-virtual {p2, p3}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 27
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 28
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/core/api/g;->pn(Ljava/util/List;)Lrx/c;

    move-result-object p2

    .line 29
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    move-result-object p0

    new-instance p2, Ll/kn8;

    invoke-direct {p2, v4, p3}, Ll/kn8;-><init>(Lv/VText;Lcom/p1/mobile/putong/core/newui/messages/b;)V

    .line 30
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    move-result-object p2

    .line 31
    invoke-virtual {p0, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    invoke-static {v7}, Ll/w1e;->f(Ll/l4g0;)V

    .line 33
    new-instance p0, Ll/ln8;

    invoke-direct {p0, v7}, Ll/ln8;-><init>(Ll/l4g0;)V

    invoke-virtual {v9, p0}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 34
    invoke-virtual {v9}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->getBehavior()Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    move-result-object p0

    const/4 p2, 0x3

    invoke-virtual {p0, p2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 35
    invoke-virtual {v9}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->getBehavior()Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    move-result-object p0

    invoke-virtual {p0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setSkipCollapsed(Z)V

    .line 36
    invoke-virtual {v9}, Landroid/app/Dialog;->show()V

    .line 37
    new-instance v3, Ll/mn8;

    move-object v5, p1

    move-object/from16 v6, p7

    move-object/from16 v8, p10

    move-object v4, v2

    invoke-direct/range {v3 .. v9}, Ll/mn8;-><init>(Ljava/util/Set;Ljava/lang/String;Ljava/lang/String;Ll/l4g0;Ll/z20;Lcom/google/android/material/bottomsheet/BottomSheetDialog;)V

    invoke-static {v10, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    return-object v9
.end method

.method public static synthetic Q(Lcom/p1/mobile/android/app/Act;Landroid/content/DialogInterface;)V
    .locals 1

    .line 1
    const-string p1, "input_method"

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/view/inputmethod/InputMethodManager;

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    const/4 v0, 0x2

    .line 11
    invoke-virtual {p0, p1, v0}, Landroid/view/inputmethod/InputMethodManager;->toggleSoftInput(II)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic Q0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Landroid/view/MenuItem;)Z
    .locals 0

    .line 1
    const/4 p2, 0x0

    .line 2
    invoke-static {p0, p1, p2, p2}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->t1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;Ll/x20;)V

    .line 3
    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0
.end method

.method public static Q1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/z20;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "I",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ll/z20<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v8, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    move-object v0, p0

    .line 7
    move-object v1, p1

    .line 8
    move-object v2, p2

    .line 9
    move-object v3, p3

    .line 10
    move v4, p4

    .line 11
    move-object/from16 v5, p5

    .line 12
    .line 13
    move-object/from16 v6, p6

    .line 14
    .line 15
    move-object/from16 v7, p7

    .line 16
    .line 17
    move-object/from16 v9, p8

    .line 18
    .line 19
    move-object/from16 v10, p9

    .line 20
    .line 21
    invoke-static/range {v0 .. v10}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->P1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ll/z20;)Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static synthetic R(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-interface {p3, p0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->updateUserOnBlock(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 9
    .line 10
    .line 11
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 14
    .line 15
    iget-object p1, p1, Ll/dkb;->J1:Lrx/subjects/b;

    .line 16
    .line 17
    invoke-virtual {p1, p0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    invoke-interface {p2}, Ll/x20;->call()V

    .line 27
    .line 28
    .line 29
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-interface {p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->coreMomentMutedUsers()Ll/prl;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-interface {p1}, Ll/prl;->d()Ljava/util/List;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    if-nez p1, :cond_1

    .line 42
    .line 43
    new-instance p1, Ljava/util/ArrayList;

    .line 44
    .line 45
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 46
    .line 47
    .line 48
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    invoke-interface {p2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->coreMomentMutedUsers()Ll/prl;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    invoke-static {p1, p0}, Ll/jyb;->c0(Ljava/util/List;Ljava/lang/Object;)Ljava/util/List;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-interface {p2, p0}, Ll/prl;->e(Ljava/util/List;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public static synthetic R0(Ll/jl80;Landroid/view/View;)V
    .locals 2

    .line 1
    const/4 p1, 0x0

    .line 2
    new-array p1, p1, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v0, "e_alert_cheat_prevention__risk_alarm_click"

    .line 5
    .line 6
    const-string v1, "p_alert_cheat_prevention__risk_alarm_popup"

    .line 7
    .line 8
    invoke-static {v0, v1, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static R1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/z20;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "I",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ll/z20<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v8, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v9, ""

    .line 7
    .line 8
    move-object v0, p0

    .line 9
    move-object v1, p1

    .line 10
    move-object v2, p2

    .line 11
    move-object v3, p3

    .line 12
    move v4, p4

    .line 13
    move-object/from16 v5, p5

    .line 14
    .line 15
    move-object/from16 v6, p6

    .line 16
    .line 17
    move-object/from16 v7, p7

    .line 18
    .line 19
    move-object/from16 v10, p8

    .line 20
    .line 21
    invoke-static/range {v0 .. v10}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->P1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ll/z20;)Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static synthetic S(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic S0(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static S1(Lcom/p1/mobile/android/app/Act;Z)V
    .locals 8

    .line 1
    const-class v0, Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "p_alert_cheat_prevention__risk_alarm_popup"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Ll/pk50;->f()Ll/rj50;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    sget-object v2, Lcom/p1/mobile/putong/core/oms/OmsDialog;->alert_cheat_risk_alarm_popup:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 22
    .line 23
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    const-string p1, "active"

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const-string p1, "passive"

    .line 33
    .line 34
    :goto_0
    const-string v3, "tooltips_trigger_mode"

    .line 35
    .line 36
    invoke-static {v3, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    const-string v3, "tooltips_type_ui"

    .line 41
    .line 42
    const-string v4, "alert_self_definition_basic"

    .line 43
    .line 44
    invoke-static {v3, v4}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    const-string v4, "tooltips_trigger_page"

    .line 49
    .line 50
    const-string v5, "swipe_page"

    .line 51
    .line 52
    invoke-static {v4, v5}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    const-string v5, "tooltips_trigger_module"

    .line 57
    .line 58
    const-string v6, "null"

    .line 59
    .line 60
    invoke-static {v5, v6}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 61
    .line 62
    .line 63
    move-result-object v5

    .line 64
    const-string v6, "tooltips_trigger_reason"

    .line 65
    .line 66
    const-string v7, "cheat_prevention"

    .line 67
    .line 68
    invoke-static {v6, v7}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 69
    .line 70
    .line 71
    move-result-object v6

    .line 72
    filled-new-array {p1, v3, v4, v5, v6}, [Ll/pf60;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-virtual {v1, v2, p1}, Ll/rj50;->V(Ljava/lang/String;[Ll/pf60;)[Ll/pf60;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-virtual {v0, p1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 81
    .line 82
    .line 83
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    sget v1, Ll/kec0;->Qb:I

    .line 88
    .line 89
    const/4 v2, 0x0

    .line 90
    invoke-virtual {p1, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    sget v1, Ll/adc0;->bd:I

    .line 95
    .line 96
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    check-cast v1, Lv/VText;

    .line 101
    .line 102
    sget v2, Ll/adc0;->za:I

    .line 103
    .line 104
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    check-cast v2, Lv/VButton;

    .line 109
    .line 110
    sget v3, Ll/adc0;->ce:I

    .line 111
    .line 112
    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    check-cast v3, Lv/VButton;

    .line 117
    .line 118
    const-string v4, "\u5df2\u88ab\u63a2\u63a2\u5c01\u7981\u5e76\u4ece\u4f60\u7684\u597d\u53cb\u5217\u8868\u4e2d\u79fb\u9664"

    .line 119
    .line 120
    invoke-static {v4}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 121
    .line 122
    .line 123
    move-result-object v4

    .line 124
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 125
    .line 126
    .line 127
    move-result-object v5

    .line 128
    sget v6, Ll/c9c0;->I:I

    .line 129
    .line 130
    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getColor(I)I

    .line 131
    .line 132
    .line 133
    move-result v5

    .line 134
    const/4 v6, 0x2

    .line 135
    invoke-static {v6}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 136
    .line 137
    .line 138
    move-result-object v6

    .line 139
    const-string v7, "\u4f60\u7684\u597d\u53cb\u4e2d\u6709\u7591\u4f3c\u5883\u5916\u8bc8\u9a97\u56e2\u4f19\uff0cTA\u5df2\u88ab\u63a2\u63a2\u5c01\u7981\u5e76\u4ece\u4f60\u7684\u597d\u53cb\u5217\u8868\u4e2d\u79fb\u9664\uff01\u8bf7\u5c3d\u5feb\u641c\u7d22\u4e86\u89e3\u201c\u6740\u732a\u76d8\u201d\u6b3a\u8bc8\u4fe1\u606f\uff0c\u4e0d\u8981\u53c2\u4e0e\u4efb\u4f55\u8d4c\u535a\uff0c\u7ade\u731c\uff0c\u5f69\u7968\uff0c\u865a\u62df\u8d27\u5e01\u7b49\u9879\u76ee\uff0c\u5982\u6709\u4efb\u4f55\u5f02\u5e38\uff0c\u8bf7\u53ca\u65f6\u5728\u201c\u8bbe\u7f6e\u9875\u201d\u201c\u5e2e\u52a9\u4e0e\u53cd\u9988\u201d\u4e2d\u4e3e\u62a5"

    .line 140
    .line 141
    invoke-static {v7, v4, v5, v6}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 142
    .line 143
    .line 144
    move-result-object v4

    .line 145
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 146
    .line 147
    .line 148
    new-instance v1, Ll/jl80$a;

    .line 149
    .line 150
    invoke-direct {v1, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {v1, p1}, Ll/jl80$a;->R(Landroid/view/View;)Ll/jl80$a;

    .line 154
    .line 155
    .line 156
    move-result-object p1

    .line 157
    const/4 v1, 0x0

    .line 158
    invoke-virtual {p1, v1}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    invoke-virtual {p1, v1}, Ll/jl80$a;->M(Z)Ll/jl80$a;

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    new-instance v4, Ll/lm8;

    .line 167
    .line 168
    invoke-direct {v4, v0}, Ll/lm8;-><init>(Ll/l4g0;)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {p1, v4}, Ll/jl80$a;->n0(Landroid/content/DialogInterface$OnDismissListener;)Ll/jl80$a;

    .line 172
    .line 173
    .line 174
    move-result-object p1

    .line 175
    invoke-virtual {p1}, Ll/jl80$a;->O()Ll/jl80;

    .line 176
    .line 177
    .line 178
    move-result-object p1

    .line 179
    new-instance v4, Ll/nm8;

    .line 180
    .line 181
    invoke-direct {v4, p0}, Ll/nm8;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 182
    .line 183
    .line 184
    invoke-virtual {v2, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 185
    .line 186
    .line 187
    const-string v2, "10s"

    .line 188
    .line 189
    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 190
    .line 191
    .line 192
    invoke-virtual {v3, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 193
    .line 194
    .line 195
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 196
    .line 197
    sget v4, Ll/u7c0;->e:I

    .line 198
    .line 199
    invoke-static {v2, v4}, Landroid/animation/AnimatorInflater;->loadStateListAnimator(Landroid/content/Context;I)Landroid/animation/StateListAnimator;

    .line 200
    .line 201
    .line 202
    move-result-object v2

    .line 203
    invoke-virtual {v3, v2}, Landroid/view/View;->setStateListAnimator(Landroid/animation/StateListAnimator;)V

    .line 204
    .line 205
    .line 206
    invoke-virtual {p0}, Landroid/app/Activity;->getLocalClassName()Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v2

    .line 210
    const/16 v4, 0xa

    .line 211
    .line 212
    invoke-static {v2, v4}, Ll/l51;->N(Ljava/lang/String;I)Lrx/c;

    .line 213
    .line 214
    .line 215
    move-result-object v2

    .line 216
    invoke-virtual {p0, v2, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;Z)Lrx/c;

    .line 217
    .line 218
    .line 219
    move-result-object v1

    .line 220
    new-instance v2, Ll/om8;

    .line 221
    .line 222
    invoke-direct {v2, v3, p0, p1}, Ll/om8;-><init>(Lv/VButton;Lcom/p1/mobile/android/app/Act;Ll/jl80;)V

    .line 223
    .line 224
    .line 225
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 226
    .line 227
    .line 228
    move-result-object p0

    .line 229
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 230
    .line 231
    .line 232
    invoke-virtual {p1}, Ll/jl80;->show()V

    .line 233
    .line 234
    .line 235
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 236
    .line 237
    .line 238
    return-void
.end method

.method public static synthetic T(Ll/x20;)V
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
    invoke-interface {p0}, Ll/x20;->call()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic T0(Ll/x20;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static T1(Lcom/p1/mobile/android/app/Act;)V
    .locals 9

    .line 1
    const-class v0, Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "p_alert_cheat_prevention__tips_popup"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Ll/pk50;->f()Ll/rj50;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    sget-object v2, Lcom/p1/mobile/putong/core/oms/OmsDialog;->alert_cheat_tips_popup:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 22
    .line 23
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    const-string v3, "tooltips_trigger_mode"

    .line 28
    .line 29
    const-string v4, "active"

    .line 30
    .line 31
    invoke-static {v3, v4}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    const-string v4, "tooltips_type_ui"

    .line 36
    .line 37
    const-string v5, "alert_self_definition_basic"

    .line 38
    .line 39
    invoke-static {v4, v5}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    const-string v5, "tooltips_trigger_page"

    .line 44
    .line 45
    const-string v6, "message_list_page"

    .line 46
    .line 47
    invoke-static {v5, v6}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 48
    .line 49
    .line 50
    move-result-object v5

    .line 51
    const-string v6, "tooltips_trigger_module"

    .line 52
    .line 53
    const-string v7, "null"

    .line 54
    .line 55
    invoke-static {v6, v7}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 56
    .line 57
    .line 58
    move-result-object v6

    .line 59
    const-string v7, "tooltips_trigger_reason"

    .line 60
    .line 61
    const-string v8, "cheat_prevention"

    .line 62
    .line 63
    invoke-static {v7, v8}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 64
    .line 65
    .line 66
    move-result-object v7

    .line 67
    filled-new-array {v3, v4, v5, v6, v7}, [Ll/pf60;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    invoke-virtual {v1, v2, v3}, Ll/rj50;->V(Ljava/lang/String;[Ll/pf60;)[Ll/pf60;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-virtual {v0, v1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 76
    .line 77
    .line 78
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    sget v2, Ll/kec0;->Qb:I

    .line 83
    .line 84
    const/4 v3, 0x0

    .line 85
    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    sget v2, Ll/adc0;->je:I

    .line 90
    .line 91
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    check-cast v2, Lv/VText;

    .line 96
    .line 97
    sget v3, Ll/adc0;->bd:I

    .line 98
    .line 99
    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 100
    .line 101
    .line 102
    move-result-object v3

    .line 103
    check-cast v3, Lv/VText;

    .line 104
    .line 105
    sget v4, Ll/adc0;->za:I

    .line 106
    .line 107
    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 108
    .line 109
    .line 110
    move-result-object v4

    .line 111
    check-cast v4, Lv/VButton;

    .line 112
    .line 113
    sget v5, Ll/adc0;->ce:I

    .line 114
    .line 115
    invoke-virtual {v1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 116
    .line 117
    .line 118
    move-result-object v5

    .line 119
    check-cast v5, Lv/VButton;

    .line 120
    .line 121
    const/4 v6, 0x0

    .line 122
    invoke-static {v4, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 123
    .line 124
    .line 125
    invoke-static {v5, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 126
    .line 127
    .line 128
    const-string v4, "\u6e29\u99a8\u63d0\u793a"

    .line 129
    .line 130
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 131
    .line 132
    .line 133
    const-string v2, "\u4f01\u56fe\u8bc8\u9a97\u7528\u6237"

    .line 134
    .line 135
    const-string v4, "\u6d89\u53ca\u4efb\u4f55\u8d44\u91d1\u5f80\u6765"

    .line 136
    .line 137
    filled-new-array {v2, v4}, [Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v2

    .line 141
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 142
    .line 143
    .line 144
    move-result-object v2

    .line 145
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 146
    .line 147
    .line 148
    move-result-object v4

    .line 149
    sget v5, Ll/c9c0;->I:I

    .line 150
    .line 151
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getColor(I)I

    .line 152
    .line 153
    .line 154
    move-result v4

    .line 155
    const/4 v5, 0x2

    .line 156
    invoke-static {v5}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 157
    .line 158
    .line 159
    move-result-object v5

    .line 160
    const-string v7, "\u7cfb\u7edf\u68c0\u6d4b\u5230\u4f60\u7684\u597d\u53cb\u5217\u8868\u4e2d\u6709\u4f01\u56fe\u8bc8\u9a97\u7528\u6237\uff0cTA\u5df2\u88ab\u63a2\u63a2\u5c01\u7981\u5e76\u4ece\u4f60\u7684\u597d\u53cb\u5217\u8868\u4e2d\u79fb\u9664\uff01\u804a\u5929\u8fc7\u7a0b\u4e2d\u5982\u679c\u6d89\u53ca\u4efb\u4f55\u8d44\u91d1\u5f80\u6765\uff0c\u8bf7\u6ce8\u610f\u63d0\u9ad8\u8b66\u60d5"

    .line 161
    .line 162
    invoke-static {v7, v2, v4, v5}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 163
    .line 164
    .line 165
    move-result-object v2

    .line 166
    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 167
    .line 168
    .line 169
    new-instance v2, Ll/jl80$a;

    .line 170
    .line 171
    invoke-direct {v2, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 172
    .line 173
    .line 174
    invoke-virtual {v2, v1}, Ll/jl80$a;->R(Landroid/view/View;)Ll/jl80$a;

    .line 175
    .line 176
    .line 177
    move-result-object v1

    .line 178
    const-string v2, "\u4e86\u89e3\u66f4\u591a\u9632\u9a97\u6280\u5de7"

    .line 179
    .line 180
    invoke-virtual {v1, v2}, Ll/jl80$a;->b0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 181
    .line 182
    .line 183
    move-result-object v1

    .line 184
    const-string v2, "\u77e5\u9053\u5566"

    .line 185
    .line 186
    invoke-virtual {v1, v2}, Ll/jl80$a;->W(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 187
    .line 188
    .line 189
    move-result-object v1

    .line 190
    invoke-virtual {v1, v6}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 191
    .line 192
    .line 193
    move-result-object v1

    .line 194
    invoke-virtual {v1, v6}, Ll/jl80$a;->M(Z)Ll/jl80$a;

    .line 195
    .line 196
    .line 197
    move-result-object v1

    .line 198
    new-instance v2, Ll/bn8;

    .line 199
    .line 200
    invoke-direct {v2, v0}, Ll/bn8;-><init>(Ll/l4g0;)V

    .line 201
    .line 202
    .line 203
    invoke-virtual {v1, v2}, Ll/jl80$a;->n0(Landroid/content/DialogInterface$OnDismissListener;)Ll/jl80$a;

    .line 204
    .line 205
    .line 206
    move-result-object v1

    .line 207
    invoke-virtual {v1}, Ll/jl80$a;->O()Ll/jl80;

    .line 208
    .line 209
    .line 210
    move-result-object v1

    .line 211
    new-instance v2, Ll/cn8;

    .line 212
    .line 213
    invoke-direct {v2, p0}, Ll/cn8;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 214
    .line 215
    .line 216
    invoke-virtual {v1, v2}, Ll/jl80;->W(Ljava/lang/Runnable;)V

    .line 217
    .line 218
    .line 219
    new-instance p0, Ll/dn8;

    .line 220
    .line 221
    invoke-direct {p0, v1}, Ll/dn8;-><init>(Ll/jl80;)V

    .line 222
    .line 223
    .line 224
    invoke-virtual {v1, p0}, Ll/jl80;->V(Ljava/lang/Runnable;)V

    .line 225
    .line 226
    .line 227
    invoke-virtual {v1}, Ll/jl80;->show()V

    .line 228
    .line 229
    .line 230
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 231
    .line 232
    .line 233
    return-void
.end method

.method public static synthetic U(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/pk50;->f()Ll/rj50;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_user_passive_show_chat:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {p1, v0, v1, v1}, Ll/rj50;->b0(Ljava/lang/String;IZ)Z

    .line 17
    .line 18
    .line 19
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic U0(Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static U1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/y20;Ll/x20;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/data/User;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;",
            "Ll/x20;",
            ")V"
        }
    .end annotation

    .line 1
    new-instance v0, Landroid/app/Dialog;

    .line 2
    .line 3
    sget v1, Ll/agc0;->z:I

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const-string v2, "p_choose_letter_or_superlike"

    .line 17
    .line 18
    invoke-static {v2, v1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const/4 v2, 0x1

    .line 23
    invoke-virtual {v0, v2}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v2}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    sget v3, Ll/kec0;->Gd:I

    .line 34
    .line 35
    const/4 v4, 0x0

    .line 36
    const/4 v5, 0x0

    .line 37
    invoke-virtual {v2, v3, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    check-cast v2, Landroid/widget/ScrollView;

    .line 42
    .line 43
    sget v3, Ll/adc0;->U6:I

    .line 44
    .line 45
    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    check-cast v3, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;

    .line 50
    .line 51
    new-instance v4, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$b;

    .line 52
    .line 53
    invoke-direct {v4, v2, v3}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$b;-><init>(Landroid/widget/ScrollView;Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v3, v4}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 57
    .line 58
    .line 59
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v4

    .line 63
    if-eqz v4, :cond_0

    .line 64
    .line 65
    new-instance v4, Ll/ao8;

    .line 66
    .line 67
    invoke-direct {v4, p2, v0}, Ll/ao8;-><init>(Ll/y20;Landroid/app/Dialog;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->setSendClickCallBack(Ll/y20;)V

    .line 71
    .line 72
    .line 73
    :cond_0
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result p2

    .line 77
    if-eqz p2, :cond_1

    .line 78
    .line 79
    new-instance p2, Ll/bo8;

    .line 80
    .line 81
    invoke-direct {p2, p3, v0}, Ll/bo8;-><init>(Ll/x20;Landroid/app/Dialog;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v3, p2}, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->setSuperLikeClickCallBack(Ll/x20;)V

    .line 85
    .line 86
    .line 87
    :cond_1
    new-instance p2, Ll/vsb;

    .line 88
    .line 89
    invoke-direct {p2, v0}, Ll/vsb;-><init>(Landroid/app/Dialog;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v3, p2}, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->setCloseCallBack(Ll/x20;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v0, v2}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 99
    .line 100
    .line 101
    move-result-object p2

    .line 102
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 103
    .line 104
    .line 105
    move-result-object p3

    .line 106
    invoke-virtual {p3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 107
    .line 108
    .line 109
    move-result-object p3

    .line 110
    iget p3, p3, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 111
    .line 112
    iput p3, p2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 113
    .line 114
    invoke-virtual {v3, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 118
    .line 119
    .line 120
    move-result-object p2

    .line 121
    const/16 p3, 0x50

    .line 122
    .line 123
    invoke-virtual {p2, p3}, Landroid/view/Window;->setGravity(I)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 127
    .line 128
    .line 129
    move-result-object p2

    .line 130
    sget p3, Ll/agc0;->A:I

    .line 131
    .line 132
    invoke-virtual {p2, p3}, Landroid/view/Window;->setWindowAnimations(I)V

    .line 133
    .line 134
    .line 135
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->d:Ll/yy6;

    .line 136
    .line 137
    iget-object p3, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 138
    .line 139
    invoke-static {}, Ll/q8g0;->y()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    invoke-virtual {p2, p3, v2}, Ll/yy6;->B(Lcom/p1/mobile/putong/data/Gender;Ljava/lang/String;)Ljava/util/List;

    .line 144
    .line 145
    .line 146
    move-result-object p2

    .line 147
    invoke-virtual {v3, p2}, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->setLetterWrapperLibraries(Ljava/util/List;)V

    .line 148
    .line 149
    .line 150
    new-instance p2, Ll/co8;

    .line 151
    .line 152
    invoke-direct {p2, p0}, Ll/co8;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {v3, p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->t(Lcom/p1/mobile/putong/data/User;Ll/x20;)V

    .line 156
    .line 157
    .line 158
    new-instance p1, Ll/do8;

    .line 159
    .line 160
    invoke-direct {p1, p0}, Ll/do8;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 161
    .line 162
    .line 163
    invoke-virtual {v0, p1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 164
    .line 165
    .line 166
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 167
    .line 168
    .line 169
    move-result-object p0

    .line 170
    const/16 p1, 0x10

    .line 171
    .line 172
    invoke-virtual {p0, p1}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 173
    .line 174
    .line 175
    new-instance p0, Ll/fo8;

    .line 176
    .line 177
    invoke-direct {p0, v1}, Ll/fo8;-><init>(Ll/l4g0;)V

    .line 178
    .line 179
    .line 180
    invoke-virtual {v0, p0}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 181
    .line 182
    .line 183
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 184
    .line 185
    .line 186
    invoke-static {v1}, Ll/w1e;->f(Ll/l4g0;)V

    .line 187
    .line 188
    .line 189
    return-void
.end method

.method public static synthetic V(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic V0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->w1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Media;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static V1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/x20;Ll/x20;)V
    .locals 3

    .line 1
    const-class v0, Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "p_suggest_live_room_pop"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/jl80$a;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 16
    .line 17
    .line 18
    sget v2, Ll/kec0;->M0:I

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Ll/jl80$a;->Q(I)Ll/jl80$a;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    const/4 v2, 0x0

    .line 25
    invoke-virtual {v1, v2}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    const/4 v2, 0x1

    .line 30
    invoke-virtual {v1, v2}, Ll/jl80$a;->M(Z)Ll/jl80$a;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    new-instance v2, Ll/nn8;

    .line 35
    .line 36
    invoke-direct {v2, v0}, Ll/nn8;-><init>(Ll/l4g0;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1, v2}, Ll/jl80$a;->n0(Landroid/content/DialogInterface$OnDismissListener;)Ll/jl80$a;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    new-instance v2, Ll/on8;

    .line 44
    .line 45
    invoke-direct {v2, v0}, Ll/on8;-><init>(Ll/l4g0;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1, v2}, Ll/jl80$a;->o0(Landroid/content/DialogInterface$OnShowListener;)Ll/jl80$a;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    sget v1, Lcom/p1/mobile/putong/core/R$string;->th:I

    .line 53
    .line 54
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    new-instance v2, Ll/pn8;

    .line 59
    .line 60
    invoke-direct {v2, p2}, Ll/pn8;-><init>(Ll/x20;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, v1, v2}, Ll/jl80$a;->c0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    sget v0, Lcom/p1/mobile/putong/core/R$string;->wh:I

    .line 68
    .line 69
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    new-instance v0, Ll/qn8;

    .line 74
    .line 75
    invoke-direct {v0, p3}, Ll/qn8;-><init>(Ll/x20;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p2, p0, v0}, Ll/jl80$a;->X(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {p0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {p0}, Ll/jl80;->L()Landroid/view/View;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    sget p2, Ll/adc0;->O:I

    .line 91
    .line 92
    invoke-virtual {p0, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    check-cast p0, Lv/VDraweeView;

    .line 97
    .line 98
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 99
    .line 100
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    invoke-virtual {p2, p0, p1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method public static synthetic W([Ll/w30;Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    aget-object p0, p0, p1

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic W0(Ljava/lang/Runnable;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static W1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 5

    .line 1
    const-class v0, Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "p_user_passive_popup"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Ll/pk50;->f()Ll/rj50;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    sget-object v2, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_user_passive_show_chat:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 22
    .line 23
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    const-string v3, "userpassive_showfrom"

    .line 28
    .line 29
    const-string v4, "chat"

    .line 30
    .line 31
    invoke-static {v3, v4}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    const-string v4, "userpassive_word"

    .line 36
    .line 37
    invoke-static {v4, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    filled-new-array {v3, p1}, [Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {v1, v2, p1}, Ll/rj50;->V(Ljava/lang/String;[Ll/pf60;)[Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {v0, p1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    sget v1, Ll/kec0;->j2:I

    .line 57
    .line 58
    const/4 v2, 0x0

    .line 59
    invoke-virtual {p1, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->newDialog()Ll/jl80$a;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-virtual {v1, p1}, Ll/jl80$a;->R(Landroid/view/View;)Ll/jl80$a;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    const/4 v2, 0x0

    .line 72
    invoke-virtual {v1, v2}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    new-instance v2, Ll/to8;

    .line 77
    .line 78
    invoke-direct {v2, v0}, Ll/to8;-><init>(Ll/l4g0;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v1, v2}, Ll/jl80$a;->o0(Landroid/content/DialogInterface$OnShowListener;)Ll/jl80$a;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    new-instance v2, Ll/uo8;

    .line 86
    .line 87
    invoke-direct {v2, v0}, Ll/uo8;-><init>(Ll/l4g0;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v1, v2}, Ll/jl80$a;->n0(Landroid/content/DialogInterface$OnDismissListener;)Ll/jl80$a;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-virtual {v0}, Ll/jl80$a;->O()Ll/jl80;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    sget v1, Ll/adc0;->j6:I

    .line 99
    .line 100
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    new-instance v2, Ll/vo8;

    .line 105
    .line 106
    invoke-direct {v2, v0}, Ll/vo8;-><init>(Ll/jl80;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 110
    .line 111
    .line 112
    sget v1, Ll/adc0;->De:I

    .line 113
    .line 114
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    new-instance v2, Ll/wo8;

    .line 119
    .line 120
    invoke-direct {v2, v0}, Ll/wo8;-><init>(Ll/jl80;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 124
    .line 125
    .line 126
    sget v1, Ll/adc0;->Je:I

    .line 127
    .line 128
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    new-instance v2, Ll/xo8;

    .line 133
    .line 134
    invoke-direct {v2, p1, p0, v0}, Ll/xo8;-><init>(Landroid/view/View;Lcom/p1/mobile/android/app/Act;Ll/jl80;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {v0}, Ll/jl80;->show()V

    .line 141
    .line 142
    .line 143
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    new-instance p1, Ll/yo8;

    .line 148
    .line 149
    invoke-direct {p1}, Ll/yo8;-><init>()V

    .line 150
    .line 151
    .line 152
    invoke-virtual {p0, p1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    new-instance p1, Ll/zo8;

    .line 157
    .line 158
    invoke-direct {p1, v0}, Ll/zo8;-><init>(Ll/jl80;)V

    .line 159
    .line 160
    .line 161
    invoke-static {p1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 166
    .line 167
    .line 168
    return-void
.end method

.method public static synthetic X(Ll/x20;)V
    .locals 2

    .line 1
    const-string v0, "e_suggest_live_room_card_popup_no"

    .line 2
    .line 3
    const-string v1, "p_suggest_live_room_pop"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p0}, Ll/x20;->call()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic X0(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static X1(Lcom/p1/mobile/android/app/Act;Z)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->Y1(Lcom/p1/mobile/android/app/Act;ZLl/x20;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic Y(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Report;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Report;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/p1/mobile/putong/data/Report;->CATEGORY_DEFAULT:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Report;->category:Ljava/lang/String;

    .line 9
    .line 10
    const-string v1, ""

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Report;->value:Ljava/lang/String;

    .line 13
    .line 14
    sget v1, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    invoke-virtual {p0, v1, v2}, Lcom/p1/mobile/android/app/Act;->progress(IZ)Landroid/app/Dialog;

    .line 18
    .line 19
    .line 20
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 23
    .line 24
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 25
    .line 26
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v1, v2, p1, v0}, Lcom/p1/mobile/putong/core/api/g;->qp(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Report;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    new-instance v0, Ll/up8;

    .line 33
    .line 34
    invoke-direct {v0, p0}, Ll/up8;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 35
    .line 36
    .line 37
    new-instance v1, Ll/vp8;

    .line 38
    .line 39
    invoke-direct {v1, p0}, Ll/vp8;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 40
    .line 41
    .line 42
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public static synthetic Y0(Ll/x20;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ll/x20;->call()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static Y1(Lcom/p1/mobile/android/app/Act;ZLl/x20;)V
    .locals 3

    .line 1
    new-instance v0, Ll/th0$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    sget v0, Lcom/p1/mobile/putong/core/R$string;->o2:I

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p1, v0}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    sget v0, Lcom/p1/mobile/putong/core/R$string;->rk:I

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p1, v0}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    sget v0, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 31
    .line 32
    invoke-virtual {p1, v0}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    sget v0, Lcom/p1/mobile/putong/core/R$string;->n2:I

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    sget v1, Lcom/p1/mobile/putong/core/R$string;->p2:I

    .line 43
    .line 44
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    sget v2, Lcom/p1/mobile/putong/core/R$string;->m2:I

    .line 49
    .line 50
    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    filled-new-array {v0, v1, v2}, [Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    const-string v1, "%s\n%s\n%s"

    .line 59
    .line 60
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {p1, v0}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    const v0, 0x800003

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1, v0}, Ll/th0$a;->k(I)Ll/th0$a;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    new-instance v0, Ll/fn8;

    .line 76
    .line 77
    invoke-direct {v0, p0, p2}, Ll/fn8;-><init>(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p1, v0}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method public static synthetic Z(Ll/x20;Lcom/p1/mobile/android/app/Act;)V
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
    invoke-interface {p0}, Ll/x20;->call()V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic Z0(Ljava/util/Set;Ljava/lang/String;Ljava/lang/String;Ll/l4g0;Ll/z20;Lcom/google/android/material/bottomsheet/BottomSheetDialog;Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p6, "share_friends_nums"

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/Set;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-static {p6, v0}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 8
    .line 9
    .line 10
    move-result-object p6

    .line 11
    filled-new-array {p6}, [Ll/sfj0$a;

    .line 12
    .line 13
    .line 14
    move-result-object p6

    .line 15
    const-string v0, "e_friends_share"

    .line 16
    .line 17
    const-string v1, "p_friends_list"

    .line 18
    .line 19
    invoke-static {v0, v1, p6}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 20
    .line 21
    .line 22
    new-instance p6, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    invoke-direct {p6}, Ljava/lang/StringBuilder;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_0

    .line 36
    .line 37
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    check-cast v1, Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {p6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const/16 v1, 0x2c

    .line 47
    .line 48
    invoke-virtual {p6, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    invoke-virtual {p6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    const-string v1, ","

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_1

    .line 63
    .line 64
    invoke-virtual {p6}, Ljava/lang/StringBuilder;->length()I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    add-int/lit8 v0, v0, -0x1

    .line 69
    .line 70
    invoke-virtual {p6, v0}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    .line 74
    .line 75
    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 76
    .line 77
    .line 78
    const-string p0, "sendMsg"

    .line 79
    .line 80
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    if-eqz p0, :cond_2

    .line 85
    .line 86
    :try_start_0
    sget-object p0, Lcom/p1/mobile/putong/core/data/Message;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 87
    .line 88
    const-string p1, "UTF-8"

    .line 89
    .line 90
    invoke-static {p2, p1}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    check-cast p0, Lcom/p1/mobile/putong/core/data/Message;

    .line 99
    .line 100
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 101
    .line 102
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 103
    .line 104
    invoke-static {}, Ll/qzd;->a()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p2

    .line 108
    invoke-virtual {p1, p2, v0, p0}, Lcom/p1/mobile/putong/core/api/g;->Ho(Ljava/lang/String;Ljava/util/List;Lcom/p1/mobile/putong/core/data/Message;)Lrx/c;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    new-instance p1, Ll/fp8;

    .line 113
    .line 114
    invoke-direct {p1, p3, p4, p6, p5}, Ll/fp8;-><init>(Ll/l4g0;Ll/z20;Ljava/lang/StringBuilder;Lcom/google/android/material/bottomsheet/BottomSheetDialog;)V

    .line 115
    .line 116
    .line 117
    new-instance p2, Ll/gp8;

    .line 118
    .line 119
    invoke-direct {p2, p4, p6}, Ll/gp8;-><init>(Ll/z20;Ljava/lang/StringBuilder;)V

    .line 120
    .line 121
    .line 122
    invoke-static {p1, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 127
    .line 128
    .line 129
    return-void

    .line 130
    :catch_0
    move-exception p0

    .line 131
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 132
    .line 133
    .line 134
    return-void

    .line 135
    :cond_2
    const-string p0, "selectFriends"

    .line 136
    .line 137
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 138
    .line 139
    .line 140
    move-result p0

    .line 141
    if-eqz p0, :cond_3

    .line 142
    .line 143
    invoke-static {p3}, Ll/w1e;->e(Ll/l4g0;)V

    .line 144
    .line 145
    .line 146
    const-string p0, "success"

    .line 147
    .line 148
    invoke-virtual {p6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    invoke-interface {p4, p0, p1}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {p5}, Landroid/app/Dialog;->dismiss()V

    .line 156
    .line 157
    .line 158
    :cond_3
    return-void
.end method

.method public static Z1(Lcom/p1/mobile/android/app/Act;Ll/x20;Ljava/lang/String;)V
    .locals 4

    .line 1
    const-class v0, Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "p_age_verify_popup"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "age_verify_show_from"

    .line 14
    .line 15
    invoke-static {v1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    const-string v1, "tooltips_trigger_mode"

    .line 20
    .line 21
    const-string v2, "active"

    .line 22
    .line 23
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    filled-new-array {p2, v1}, [Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    invoke-virtual {v0, p2}, Ll/l4g0;->p([Ll/pf60;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    sget v1, Ll/kec0;->jd:I

    .line 42
    .line 43
    const/4 v2, 0x0

    .line 44
    const/4 v3, 0x0

    .line 45
    invoke-virtual {p2, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->newDialog()Ll/jl80$a;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0, p2}, Ll/jl80$a;->R(Landroid/view/View;)Ll/jl80$a;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    const/4 v1, 0x1

    .line 58
    invoke-virtual {p0, v1}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    new-instance v1, Ll/ym8;

    .line 63
    .line 64
    invoke-direct {v1, v0}, Ll/ym8;-><init>(Ll/l4g0;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0, v1}, Ll/jl80$a;->n0(Landroid/content/DialogInterface$OnDismissListener;)Ll/jl80$a;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {p0}, Ll/jl80$a;->O()Ll/jl80;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    check-cast p2, Lcom/p1/mobile/putong/core/ui/verification/AgeVerificationSingleGuideView;

    .line 76
    .line 77
    invoke-static {}, Ll/vb0;->d()Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    new-instance v1, Ll/zm8;

    .line 86
    .line 87
    invoke-direct {v1, p1, p0}, Ll/zm8;-><init>(Ll/x20;Ll/jl80;)V

    .line 88
    .line 89
    .line 90
    new-instance p1, Ll/an8;

    .line 91
    .line 92
    invoke-direct {p1, p0}, Ll/an8;-><init>(Ll/jl80;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p2, v0, v1, p1}, Lcom/p1/mobile/putong/core/ui/verification/AgeVerificationSingleGuideView;->T(Ljava/lang/Boolean;Ll/x20;Ll/x20;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p0}, Ll/jl80;->show()V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public static synthetic a0(Lcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->x1(Lcom/p1/mobile/putong/data/Media;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a1(Ll/x20;Ll/x20;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-interface {p1}, Ll/x20;->call()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public static a2(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V
    .locals 6

    .line 1
    new-instance v0, Lcom/p1/mobile/android/app/Dialog$e;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/android/app/Dialog$e;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    sget v1, Ll/c9c0;->J:I

    .line 7
    .line 8
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    sget-object v2, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 13
    .line 14
    invoke-virtual {v2}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 15
    .line 16
    .line 17
    move-result-wide v2

    .line 18
    invoke-static {}, Ll/rbb0;->g()J

    .line 19
    .line 20
    .line 21
    move-result-wide v4

    .line 22
    sub-long/2addr v4, v2

    .line 23
    const-wide/16 v2, 0x0

    .line 24
    .line 25
    cmp-long v2, v4, v2

    .line 26
    .line 27
    if-ltz v2, :cond_0

    .line 28
    .line 29
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Bk:I

    .line 30
    .line 31
    invoke-virtual {p0, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    const-string v2, "\u5f00\u542f\u6b64\u529f\u80fd\u4f1a\u5bfc\u81f4\u201c\u67e5\u770b\u8c01\u559c\u6b22\u6211\u201c\u5217\u8868\u5185\u4e0d\u4f1a\u518d\u6709\u65b0\u7684\u559c\u6b22\u4f60\u7684\u7528\u6237\uff0c\u5982\u679c\u540e\u7eed\u518d\u8d2d\u4e70\u201c\u67e5\u770b\u8c01\u559c\u6b22\u6211\u201c\u5c06\u9ed8\u8ba4\u91cd\u65b0\u5173\u95ed"

    .line 37
    .line 38
    :goto_0
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->o(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->o0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    const/high16 v1, 0x41600000    # 14.0f

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->K(F)Lcom/p1/mobile/android/app/Dialog$e;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Ck:I

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->E0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    sget v1, Ll/c9c0;->C:I

    .line 59
    .line 60
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->H0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    sget v1, Ll/c9c0;->D:I

    .line 73
    .line 74
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/Dialog$e;->G(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Q3:I

    .line 83
    .line 84
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Dialog$e;->s0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    sget v0, Lcom/p1/mobile/putong/core/R$string;->M:I

    .line 89
    .line 90
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->l0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method public static b(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/p1/mobile/putong/core/R$string;->i:I

    .line 6
    .line 7
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    filled-new-array {p0}, [Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/Dialog$e;->e0(Ljava/util/List;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    new-instance v0, Ll/xm8;

    .line 24
    .line 25
    invoke-direct {v0, p1}, Ll/xm8;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Dialog$e;->g0(Lcom/p1/mobile/android/app/Dialog$g;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public static synthetic b0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;Lcom/p1/mobile/putong/data/Followship;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 7
    .line 8
    iget-object p0, p0, Ll/dkb;->J1:Lrx/subjects/b;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    invoke-interface {p2}, Ll/x20;->call()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public static synthetic b1(Lv/VButton;Lcom/p1/mobile/android/app/Act;Ll/jl80;Ljava/lang/Long;)V
    .locals 4

    .line 1
    invoke-virtual {p3}, Ljava/lang/Long;->longValue()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x9

    .line 6
    .line 7
    cmp-long v0, v0, v2

    .line 8
    .line 9
    if-gez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p3}, Ljava/lang/Long;->longValue()J

    .line 12
    .line 13
    .line 14
    move-result-wide p1

    .line 15
    sub-long/2addr v2, p1

    .line 16
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    const-string p2, "%ds"

    .line 25
    .line 26
    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    const-string p3, "\u77e5\u9053\u4e86"

    .line 35
    .line 36
    invoke-virtual {p0, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p1, Lcom/p1/mobile/android/app/Act;->res:Landroid/content/res/Resources;

    .line 40
    .line 41
    sget p3, Ll/c9c0;->D:I

    .line 42
    .line 43
    invoke-virtual {p1, p3}, Landroid/content/res/Resources;->getColor(I)I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 48
    .line 49
    .line 50
    const/4 p1, 0x1

    .line 51
    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 52
    .line 53
    .line 54
    new-instance p1, Ll/so8;

    .line 55
    .line 56
    invoke-direct {p1, p2}, Ll/so8;-><init>(Ll/jl80;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public static b2(Lcom/p1/mobile/putong/app/PutongAct;)V
    .locals 5

    .line 1
    const-class v0, Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "p_age_verify_photo_upload_type_popup"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "tooltips_trigger_mode"

    .line 14
    .line 15
    const-string v2, "active"

    .line 16
    .line 17
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    filled-new-array {v1}, [Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 29
    .line 30
    .line 31
    sget v1, Lcom/p1/mobile/putong/core/R$string;->C:I

    .line 32
    .line 33
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    sget v2, Lcom/p1/mobile/putong/core/R$string;->D:I

    .line 38
    .line 39
    invoke-virtual {p0, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    filled-new-array {v1, v2}, [Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    invoke-static {v4}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    invoke-virtual {v3, v4}, Lcom/p1/mobile/android/app/Dialog$e;->e0(Ljava/util/List;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    new-instance v4, Ll/gn8;

    .line 60
    .line 61
    invoke-direct {v4, v1, p0, v2}, Ll/gn8;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v3, v4}, Lcom/p1/mobile/android/app/Dialog$e;->g0(Lcom/p1/mobile/android/app/Dialog$g;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    new-instance v1, Ll/hn8;

    .line 69
    .line 70
    invoke-direct {v1, v0}, Ll/hn8;-><init>(Ll/l4g0;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->V(Landroid/content/DialogInterface$OnDismissListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public static synthetic c0(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic c1(Lcom/p1/mobile/android/app/Act;)V
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
    instance-of p0, p0, Lcom/p1/mobile/putong/core/ui/settings/PersonalDetailsAct;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const-string p0, "e_edit_basic_info_calendar"

    .line 12
    .line 13
    const-string v0, "p_edit_basic_info_view"

    .line 14
    .line 15
    invoke-static {p0, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public static c2(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/x20;)Ll/jl80;
    .locals 2

    .line 1
    const-class v0, Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "p_user_profile_share_agreement_popup"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 14
    .line 15
    .line 16
    new-instance v1, Ll/jl80$a;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    const-string p0, "\u5206\u4eab\u65b0\u529f\u80fd"

    .line 22
    .line 23
    invoke-virtual {v1, p0}, Ll/jl80$a;->y0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string v1, "\u8fdb\u5165ta\u4eba\u4e3b\u9875\u53ef\u5206\u4eab\u540d\u7247\u7ed9\u4f60\u7684\u670b\u53cb\uff0c\u4f7f\u7528\u622a\u56fe\u6709\u66f4\u591a\u60ca\u559c\uff01\u9ed8\u8ba4\u4e3a\u60a8\u6253\u5f00\u4e86\u5206\u4eab\u529f\u80fd\u7684\u4f7f\u7528\u6743\uff0c\u82e5\u60a8\u4e0d\u60f3\u88ab\u4ed6\u4eba\u5206\u4eab\uff0c\u53ef\u524d\u5f80\u8bbe\u7f6e-\u9690\u79c1\u548c\u901a\u77e5\u8fdb\u884c\u5173\u95ed\u3002"

    .line 28
    .line 29
    invoke-virtual {p0, v1}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    new-instance v1, Ll/oo8;

    .line 34
    .line 35
    invoke-direct {v1, p1}, Ll/oo8;-><init>(Ll/x20;)V

    .line 36
    .line 37
    .line 38
    const-string p1, "\u6211\u77e5\u9053\u4e86"

    .line 39
    .line 40
    invoke-virtual {p0, p1, v1}, Ll/jl80$a;->c0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    new-instance p1, Ll/qo8;

    .line 45
    .line 46
    invoke-direct {p1, p2}, Ll/qo8;-><init>(Ll/x20;)V

    .line 47
    .line 48
    .line 49
    const-string p2, "\u540e\u7eed\u4e86\u89e3"

    .line 50
    .line 51
    invoke-virtual {p0, p2, p1}, Ll/jl80$a;->X(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    const/4 p1, 0x0

    .line 56
    invoke-virtual {p0, p1}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    new-instance p1, Ll/ro8;

    .line 61
    .line 62
    invoke-direct {p1, v0}, Ll/ro8;-><init>(Ll/l4g0;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0, p1}, Ll/jl80$a;->n0(Landroid/content/DialogInterface$OnDismissListener;)Ll/jl80$a;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    return-object p0
.end method

.method public static synthetic d0(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic d1(Ll/y20;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ll/x20;Ljava/lang/String;)V
    .locals 6

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
    invoke-interface {p0, p4}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-interface {p0, p1}, Ll/qhk0;->getUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-interface {p0, v2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->isMatchedByRelationship(Lcom/p1/mobile/putong/data/User;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-nez p0, :cond_1

    .line 27
    .line 28
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-interface {p0, v2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->isMatchedByFollowship(Lcom/p1/mobile/putong/data/User;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-eqz p0, :cond_1

    .line 37
    .line 38
    invoke-static {v2}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->B1(Lcom/p1/mobile/putong/data/User;)Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    if-nez p0, :cond_1

    .line 43
    .line 44
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    const/4 v4, 0x0

    .line 57
    const/4 v5, 0x0

    .line 58
    const/4 v3, 0x0

    .line 59
    invoke-interface/range {v0 .. v5}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->following(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    new-instance p4, Ll/rn8;

    .line 64
    .line 65
    invoke-direct {p4, p2, p1, p3}, Ll/rn8;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;)V

    .line 66
    .line 67
    .line 68
    new-instance p1, Ll/sn8;

    .line 69
    .line 70
    invoke-direct {p1, p2}, Ll/sn8;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 71
    .line 72
    .line 73
    invoke-static {p4, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_1
    sget p0, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 82
    .line 83
    const/4 p4, 0x1

    .line 84
    invoke-virtual {p2, p0, p4}, Lcom/p1/mobile/android/app/Act;->progress(IZ)Landroid/app/Dialog;

    .line 85
    .line 86
    .line 87
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 88
    .line 89
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 90
    .line 91
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/api/g;->qe(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;)Lrx/c;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    new-instance p4, Ll/un8;

    .line 96
    .line 97
    invoke-direct {p4, p1, p2, p3}, Ll/un8;-><init>(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 98
    .line 99
    .line 100
    new-instance p1, Ll/vn8;

    .line 101
    .line 102
    invoke-direct {p1, p2}, Ll/vn8;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 103
    .line 104
    .line 105
    invoke-static {p4, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 110
    .line 111
    .line 112
    return-void
.end method

.method public static d2(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/x20;)V
    .locals 10

    .line 1
    const-string v0, "p_alert_dislike_who_liked_me_popup"

    .line 2
    .line 3
    const-string v1, "showSpecialLikeRetailDlg"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "tooltips_trigger_mode"

    .line 10
    .line 11
    const-string v2, "active"

    .line 12
    .line 13
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    const-string v1, "tooltips_type"

    .line 18
    .line 19
    const-string v2, "alert"

    .line 20
    .line 21
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    const-string v1, "tooltips_type_ui"

    .line 26
    .line 27
    const-string v2, "alert_self_definition_basic"

    .line 28
    .line 29
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 30
    .line 31
    .line 32
    move-result-object v5

    .line 33
    const-string v1, "tooltips_trigger_reason"

    .line 34
    .line 35
    const-string v2, "swipe"

    .line 36
    .line 37
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 38
    .line 39
    .line 40
    move-result-object v6

    .line 41
    const-string v1, "tooltips_trigger_page"

    .line 42
    .line 43
    const-string v2, "swipe_page"

    .line 44
    .line 45
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 46
    .line 47
    .line 48
    move-result-object v7

    .line 49
    const-string v1, "tooltips_trigger_module"

    .line 50
    .line 51
    const-string v2, "card"

    .line 52
    .line 53
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 54
    .line 55
    .line 56
    move-result-object v8

    .line 57
    const-string v1, "receiver_user_id"

    .line 58
    .line 59
    iget-object v2, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 62
    .line 63
    .line 64
    move-result-object v9

    .line 65
    filled-new-array/range {v3 .. v9}, [Ll/sfj0$a;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-static {v1}, Ll/sfj0;->b([Ll/sfj0$a;)Lorg/json/JSONObject;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    invoke-virtual {v2}, Ll/pk50;->f()Ll/rj50;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    sget-object v3, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_alert_dislike_who_liked_me_popup:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 82
    .line 83
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v3

    .line 87
    invoke-virtual {v2, v3, v1}, Ll/rj50;->U(Ljava/lang/String;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    invoke-virtual {v0, v1}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 92
    .line 93
    .line 94
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    sget v2, Ll/kec0;->ac:I

    .line 102
    .line 103
    const/4 v3, 0x0

    .line 104
    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    sget v2, Ll/adc0;->Sa:I

    .line 109
    .line 110
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    check-cast v2, Lv/VDraweeView;

    .line 115
    .line 116
    sget v3, Ll/adc0;->Ta:I

    .line 117
    .line 118
    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 119
    .line 120
    .line 121
    move-result-object v3

    .line 122
    check-cast v3, Lv/VDraweeView;

    .line 123
    .line 124
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 125
    .line 126
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 127
    .line 128
    invoke-virtual {v4}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 129
    .line 130
    .line 131
    move-result-object v4

    .line 132
    sget-object v5, Ll/uqb0;->G:Ll/fsb0;

    .line 133
    .line 134
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 135
    .line 136
    .line 137
    move-result-object v4

    .line 138
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 139
    .line 140
    .line 141
    move-result-object v4

    .line 142
    invoke-virtual {v5, v2, v4}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 143
    .line 144
    .line 145
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 146
    .line 147
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 148
    .line 149
    .line 150
    move-result-object v4

    .line 151
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 152
    .line 153
    .line 154
    move-result-object v4

    .line 155
    invoke-virtual {v2, v3, v4}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 156
    .line 157
    .line 158
    sget v2, Ll/adc0;->X6:I

    .line 159
    .line 160
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 161
    .line 162
    .line 163
    move-result-object v2

    .line 164
    check-cast v2, Landroid/widget/TextView;

    .line 165
    .line 166
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 167
    .line 168
    .line 169
    move-result v3

    .line 170
    const-string v4, "%s\n%s"

    .line 171
    .line 172
    if-eqz v3, :cond_0

    .line 173
    .line 174
    sget v3, Lcom/p1/mobile/putong/core/R$string;->Lp:I

    .line 175
    .line 176
    invoke-virtual {p1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object v3

    .line 180
    sget v5, Lcom/p1/mobile/putong/core/R$string;->Mp:I

    .line 181
    .line 182
    invoke-virtual {p1, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v5

    .line 186
    filled-new-array {v3, v5}, [Ljava/lang/Object;

    .line 187
    .line 188
    .line 189
    move-result-object v3

    .line 190
    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object v3

    .line 194
    goto :goto_0

    .line 195
    :cond_0
    sget v3, Lcom/p1/mobile/putong/core/R$string;->Np:I

    .line 196
    .line 197
    invoke-virtual {p1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object v3

    .line 201
    sget v5, Lcom/p1/mobile/putong/core/R$string;->Op:I

    .line 202
    .line 203
    invoke-virtual {p1, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object v5

    .line 207
    filled-new-array {v3, v5}, [Ljava/lang/Object;

    .line 208
    .line 209
    .line 210
    move-result-object v3

    .line 211
    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object v3

    .line 215
    :goto_0
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 216
    .line 217
    .line 218
    new-instance v2, Ll/jl80$a;

    .line 219
    .line 220
    invoke-direct {v2, p1}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 221
    .line 222
    .line 223
    invoke-virtual {v2, v1}, Ll/jl80$a;->R(Landroid/view/View;)Ll/jl80$a;

    .line 224
    .line 225
    .line 226
    move-result-object p1

    .line 227
    const/4 v1, 0x0

    .line 228
    invoke-virtual {p1, v1}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 229
    .line 230
    .line 231
    move-result-object p1

    .line 232
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 233
    .line 234
    .line 235
    move-result v1

    .line 236
    if-eqz v1, :cond_1

    .line 237
    .line 238
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Rp:I

    .line 239
    .line 240
    goto :goto_1

    .line 241
    :cond_1
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Sp:I

    .line 242
    .line 243
    :goto_1
    new-instance v2, Ll/pm8;

    .line 244
    .line 245
    invoke-direct {v2, p2, p0}, Ll/pm8;-><init>(Ll/x20;Lcom/p1/mobile/putong/data/User;)V

    .line 246
    .line 247
    .line 248
    invoke-virtual {p1, v1, v2}, Ll/jl80$a;->a0(ILjava/lang/Runnable;)Ll/jl80$a;

    .line 249
    .line 250
    .line 251
    move-result-object p1

    .line 252
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 253
    .line 254
    .line 255
    move-result p2

    .line 256
    if-eqz p2, :cond_2

    .line 257
    .line 258
    sget p2, Lcom/p1/mobile/putong/core/R$string;->Pp:I

    .line 259
    .line 260
    goto :goto_2

    .line 261
    :cond_2
    sget p2, Lcom/p1/mobile/putong/core/R$string;->Qp:I

    .line 262
    .line 263
    :goto_2
    new-instance v1, Ll/qm8;

    .line 264
    .line 265
    invoke-direct {v1, p3, p0}, Ll/qm8;-><init>(Ll/x20;Lcom/p1/mobile/putong/data/User;)V

    .line 266
    .line 267
    .line 268
    invoke-virtual {p1, p2, v1}, Ll/jl80$a;->U(ILjava/lang/Runnable;)Ll/jl80$a;

    .line 269
    .line 270
    .line 271
    move-result-object p0

    .line 272
    new-instance p1, Ll/rm8;

    .line 273
    .line 274
    invoke-direct {p1, v0}, Ll/rm8;-><init>(Ll/l4g0;)V

    .line 275
    .line 276
    .line 277
    invoke-virtual {p0, p1}, Ll/jl80$a;->n0(Landroid/content/DialogInterface$OnDismissListener;)Ll/jl80$a;

    .line 278
    .line 279
    .line 280
    move-result-object p0

    .line 281
    invoke-virtual {p0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 282
    .line 283
    .line 284
    return-void
.end method

.method public static synthetic e0(Ll/x20;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;[Ll/w30;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p4

    .line 5
    if-eqz p4, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ll/x20;->call()V

    .line 8
    .line 9
    .line 10
    :cond_0
    sget p0, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 11
    .line 12
    const/4 p4, 0x1

    .line 13
    invoke-virtual {p1, p0, p4}, Lcom/p1/mobile/android/app/Act;->progress(IZ)Landroid/app/Dialog;

    .line 14
    .line 15
    .line 16
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 19
    .line 20
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/api/g;->xn(Ljava/lang/String;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    new-instance p4, Ll/jp8;

    .line 25
    .line 26
    invoke-direct {p4}, Ll/jp8;-><init>()V

    .line 27
    .line 28
    .line 29
    new-instance p5, Ll/kp8;

    .line 30
    .line 31
    invoke-direct {p5, p1}, Ll/kp8;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 32
    .line 33
    .line 34
    new-instance p6, Ll/mp8;

    .line 35
    .line 36
    invoke-direct {p6, p2, p1}, Ll/mp8;-><init>(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;)V

    .line 37
    .line 38
    .line 39
    invoke-static {p4, p5, p6}, Ll/psd0;->I(Ll/y20;Ll/y20;Ll/x20;)Lcom/p1/mobile/android/rx/a;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 44
    .line 45
    .line 46
    const/4 p0, 0x0

    .line 47
    aget-object p0, p3, p0

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public static synthetic e1(Ll/x20;Lcom/p1/mobile/putong/data/User;)V
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
    invoke-interface {p0}, Ll/x20;->call()V

    .line 8
    .line 9
    .line 10
    :cond_0
    const-string p0, "receiver_user_id"

    .line 11
    .line 12
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {p0, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    filled-new-array {p0}, [Ll/sfj0$a;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-string p1, "e_alert_dislike_who_liked_me_dislike"

    .line 23
    .line 24
    const-string v0, "p_alert_dislike_who_liked_me_popup"

    .line 25
    .line 26
    invoke-static {p1, v0, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public static e2(Lcom/p1/mobile/android/app/Act;Ll/x20;Z)V
    .locals 8

    .line 1
    const-class v0, Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "p_unlock_message_popup"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v2, "ageCheck"

    .line 14
    .line 15
    const-string v3, "vipMembership"

    .line 16
    .line 17
    if-eqz p2, :cond_0

    .line 18
    .line 19
    move-object v4, v3

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    move-object v4, v2

    .line 22
    :goto_0
    const-string v5, "unlock_message_step"

    .line 23
    .line 24
    invoke-static {v5, v4}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    const-string v6, "tooltips_trigger_mode"

    .line 29
    .line 30
    const-string v7, "active"

    .line 31
    .line 32
    invoke-static {v6, v7}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 33
    .line 34
    .line 35
    move-result-object v6

    .line 36
    filled-new-array {v4, v6}, [Ll/sfj0$a;

    .line 37
    .line 38
    .line 39
    move-result-object v4

    .line 40
    invoke-static {v4}, Ll/sfj0;->b([Ll/sfj0$a;)Lorg/json/JSONObject;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    invoke-virtual {v0, v4}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 45
    .line 46
    .line 47
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 48
    .line 49
    .line 50
    if-eqz p2, :cond_1

    .line 51
    .line 52
    move-object v2, v3

    .line 53
    :cond_1
    invoke-static {v5, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    filled-new-array {p2}, [Ll/sfj0$a;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    const-string v2, "e_unlock_message"

    .line 62
    .line 63
    invoke-static {v2, v1, p2}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    sget v1, Ll/kec0;->id:I

    .line 71
    .line 72
    const/4 v2, 0x0

    .line 73
    const/4 v3, 0x0

    .line 74
    invoke-virtual {p2, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    const/4 v1, 0x1

    .line 83
    invoke-virtual {p0, p2, v1}, Lcom/p1/mobile/android/app/Dialog$e;->P(Landroid/view/View;Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->u()Lcom/p1/mobile/android/app/Dialog$e;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    new-instance v1, Ll/cp8;

    .line 96
    .line 97
    invoke-direct {v1, v0}, Ll/cp8;-><init>(Ll/l4g0;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->V(Landroid/content/DialogInterface$OnDismissListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    check-cast p2, Lcom/p1/mobile/putong/core/ui/verification/AgeVerificationDoubleGuideView;

    .line 109
    .line 110
    new-instance v0, Ll/dp8;

    .line 111
    .line 112
    invoke-direct {v0, p0, p1}, Ll/dp8;-><init>(Lcom/p1/mobile/android/app/Dialog;Ll/x20;)V

    .line 113
    .line 114
    .line 115
    new-instance p1, Ll/ep8;

    .line 116
    .line 117
    invoke-direct {p1, p0}, Ll/ep8;-><init>(Lcom/p1/mobile/android/app/Dialog;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p2, v0, p1}, Lcom/p1/mobile/putong/core/ui/verification/AgeVerificationDoubleGuideView;->S(Ll/x20;Ll/x20;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 124
    .line 125
    .line 126
    return-void
.end method

.method public static synthetic f0(Landroid/view/View;Lcom/p1/mobile/android/app/Act;Ll/jl80;Landroid/view/View;)V
    .locals 2

    .line 1
    new-instance p3, Landroid/content/Intent;

    .line 2
    .line 3
    const-string v0, "android.intent.action.DIAL"

    .line 4
    .line 5
    invoke-direct {p3, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget v0, Ll/adc0;->Je:I

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Landroid/widget/TextView;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    new-instance v0, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    const-string v1, "tel:"

    .line 27
    .line 28
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p3, p0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1, p3}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p2}, Ll/g1e;->dismiss()V

    .line 49
    .line 50
    .line 51
    const/4 p0, 0x0

    .line 52
    new-array p0, p0, [Ll/sfj0$a;

    .line 53
    .line 54
    const-string p1, "e_user_passive_popup_number"

    .line 55
    .line 56
    const-string p2, "p_user_passive_popup"

    .line 57
    .line 58
    invoke-static {p1, p2, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public static synthetic f1(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g0(Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/lang/StringBuilder;)V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    new-instance v1, Landroid/content/Intent;

    .line 4
    .line 5
    new-instance v2, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v3, "file://"

    .line 8
    .line 9
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->v()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string v2, "android.intent.action.MEDIA_SCANNER_SCAN_FILE"

    .line 28
    .line 29
    invoke-direct {v1, v2, p0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 33
    .line 34
    .line 35
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 36
    .line 37
    sget v0, Lcom/p1/mobile/putong/core/R$string;->R3:I

    .line 38
    .line 39
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p0, v0, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public static synthetic g1(Ll/jl80;)V
    .locals 3

    .line 1
    const-string v0, "no_prompt_again"

    .line 2
    .line 3
    const-string v1, "no"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    filled-new-array {v0}, [Ll/sfj0$a;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "e_alert_cheat_prevention__tips_click"

    .line 14
    .line 15
    const-string v2, "p_alert_cheat_prevention__tips_popup"

    .line 16
    .line 17
    invoke-static {v1, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Report;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Report;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/p1/mobile/putong/data/Report;->CATEGORY_DEFAULT:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Report;->category:Ljava/lang/String;

    .line 9
    .line 10
    const-string v1, ""

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Report;->value:Ljava/lang/String;

    .line 13
    .line 14
    sget v1, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    invoke-virtual {p0, v1, v2}, Lcom/p1/mobile/android/app/Act;->progress(IZ)Landroid/app/Dialog;

    .line 18
    .line 19
    .line 20
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 23
    .line 24
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 25
    .line 26
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v1, v2, p1, v0}, Lcom/p1/mobile/putong/core/api/g;->qp(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Report;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    new-instance v0, Ll/im8;

    .line 33
    .line 34
    invoke-direct {v0, p0}, Ll/im8;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 35
    .line 36
    .line 37
    new-instance v1, Ll/jm8;

    .line 38
    .line 39
    invoke-direct {v1, p0}, Ll/jm8;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 40
    .line 41
    .line 42
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public static synthetic h0(Ll/jl80;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/app/Dialog;->isShowing()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public static h1(Lcom/p1/mobile/android/app/Act;Landroid/view/Menu;Ll/x20;)V
    .locals 3

    .line 1
    sget v0, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 v0, 0x0

    .line 8
    const/4 v1, 0x6

    .line 9
    const/16 v2, 0x1e

    .line 10
    .line 11
    invoke-interface {p1, v0, v1, v2, p0}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance p1, Ll/en8;

    .line 16
    .line 17
    invoke-direct {p1, p2}, Ll/en8;-><init>(Ll/x20;)V

    .line 18
    .line 19
    .line 20
    invoke-interface {p0, p1}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static i1(ZLandroid/view/Menu;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    const/16 v0, 0xf

    .line 2
    .line 3
    invoke-static {p0, p1, p2, p3, v0}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->j1(ZLandroid/view/Menu;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic j(Ljava/util/List;[Ll/w30;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    invoke-interface {p0, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/pf60;

    .line 6
    .line 7
    iget-object p0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast p0, Ljava/lang/Runnable;

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    aget-object p0, p1, p0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic j0(Ljava/lang/String;Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    invoke-static {p1}, Ll/w1e;->e(Ll/l4g0;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static j1(ZLandroid/view/Menu;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;I)V
    .locals 2

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x2

    .line 4
    sget v0, Lcom/p1/mobile/putong/core/R$string;->jk:I

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-interface {p1, v1, p0, p4, v0}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance p1, Ll/xl8;

    .line 12
    .line 13
    invoke-direct {p1, p3, p2}, Ll/xl8;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-interface {p0, p1}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public static synthetic k(Ll/jl80;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k0(Lcom/p1/mobile/android/app/Act;Ll/x20;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p2, "checkPermissionDlg"

    .line 2
    .line 3
    const-string v0, "click to setting"

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/qxv;->c()Z

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    if-eqz p2, :cond_1

    .line 13
    .line 14
    invoke-static {}, Ll/xxv;->o()Z

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    if-nez p2, :cond_0

    .line 19
    .line 20
    new-instance p2, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$a;

    .line 21
    .line 22
    const/16 v0, 0x3f2

    .line 23
    .line 24
    invoke-direct {p2, v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$a;-><init>(ILcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/app/Act;->registerOnActivityResultListener(Lcom/p1/mobile/android/app/a$a;)V

    .line 28
    .line 29
    .line 30
    new-instance p1, Landroid/content/Intent;

    .line 31
    .line 32
    const-string p2, "android.settings.LOCATION_SOURCE_SETTINGS"

    .line 33
    .line 34
    invoke-direct {p1, p2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, p1, v0}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p2

    .line 45
    if-eqz p2, :cond_2

    .line 46
    .line 47
    invoke-interface {p1}, Ll/x20;->call()V

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    if-eqz p2, :cond_2

    .line 56
    .line 57
    invoke-interface {p1}, Ll/x20;->call()V

    .line 58
    .line 59
    .line 60
    :cond_2
    :goto_0
    :try_start_0
    invoke-static {p0}, Ll/hve0;->x(Landroid/app/Activity;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :catch_0
    move-exception p0

    .line 65
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public static k1(ZZLandroid/view/Menu;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ll/x20;Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;)V
    .locals 9

    .line 1
    const/4 v5, 0x0

    .line 2
    const/16 v7, 0xa

    .line 3
    .line 4
    move v0, p0

    .line 5
    move v1, p1

    .line 6
    move-object v2, p2

    .line 7
    move-object v3, p3

    .line 8
    move-object v4, p4

    .line 9
    move-object v6, p5

    .line 10
    move-object v8, p6

    .line 11
    invoke-static/range {v0 .. v8}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->l1(ZZLandroid/view/Menu;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;ZLl/x20;ILcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic l(Ll/x20;Ll/jl80;)V
    .locals 2

    .line 1
    const-string v0, "e_age_verify_operate"

    .line 2
    .line 3
    const-string v1, "p_age_verify_popup"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/vb0;->d()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    sget p0, Lcom/p1/mobile/putong/core/R$string;->J:I

    .line 15
    .line 16
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-interface {p0}, Ll/x20;->call()V

    .line 21
    .line 22
    .line 23
    :goto_0
    invoke-virtual {p1}, Ll/g1e;->dismiss()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static synthetic l0(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static l1(ZZLandroid/view/Menu;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;ZLl/x20;ILcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;)V
    .locals 1

    .line 1
    if-nez p5, :cond_0

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    if-eqz p0, :cond_1

    .line 7
    .line 8
    sget p0, Lcom/p1/mobile/putong/core/R$string;->r:I

    .line 9
    .line 10
    const/4 p5, 0x0

    .line 11
    invoke-static {p4, p5, p0, p5}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->z1(Lcom/p1/mobile/android/app/Act;ZII)Ljava/lang/CharSequence;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const/4 v0, 0x1

    .line 16
    invoke-interface {p2, p5, v0, p7, p0}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    move-object p2, p4

    .line 21
    move p4, p1

    .line 22
    new-instance p1, Ll/km8;

    .line 23
    .line 24
    move-object p5, p6

    .line 25
    move-object p6, p8

    .line 26
    invoke-direct/range {p1 .. p6}, Ll/km8;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZLl/x20;Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;)V

    .line 27
    .line 28
    .line 29
    invoke-interface {p0, p1}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    .line 30
    .line 31
    .line 32
    :cond_1
    :goto_0
    return-void
.end method

.method public static synthetic m(Ll/x20;Landroid/app/Dialog;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/app/Dialog;->dismiss()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic m0(Ll/jl80;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    new-array p0, p0, [Ll/sfj0$a;

    .line 6
    .line 7
    const-string p1, "e_user_passive_popup_cancel"

    .line 8
    .line 9
    const-string v0, "p_user_passive_popup"

    .line 10
    .line 11
    invoke-static {p1, v0, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static m1(Lcom/p1/mobile/android/app/Act;Landroid/view/Menu;Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x5

    .line 2
    invoke-static {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->n1(Lcom/p1/mobile/android/app/Act;Landroid/view/Menu;Ljava/lang/String;I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic n(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic n0(Lcom/p1/mobile/android/app/Act;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    sget p0, Lcom/p1/mobile/putong/core/R$string;->zm:I

    .line 5
    .line 6
    sget p1, Lcom/p1/mobile/putong/core/R$string;->om:I

    .line 7
    .line 8
    invoke-static {p0, p1}, Ll/lu6;->b(II)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static n1(Lcom/p1/mobile/android/app/Act;Landroid/view/Menu;Ljava/lang/String;I)V
    .locals 2

    .line 1
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Dc:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p0, v0}, Ll/e1b;->S0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-interface {p1, v1, v1, p3, v0}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    new-instance p3, Ll/wp8;

    .line 17
    .line 18
    invoke-direct {p3, p0, p2}, Ll/wp8;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-interface {p1, p3}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static synthetic o(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-interface {p3, p0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->updateUserOnBlock(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 9
    .line 10
    .line 11
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    invoke-interface {p2}, Ll/x20;->call()V

    .line 18
    .line 19
    .line 20
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-interface {p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->coreMomentMutedUsers()Ll/prl;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-interface {p1}, Ll/prl;->d()Ljava/util/List;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    if-nez p1, :cond_1

    .line 33
    .line 34
    new-instance p1, Ljava/util/ArrayList;

    .line 35
    .line 36
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 37
    .line 38
    .line 39
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    invoke-interface {p2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->coreMomentMutedUsers()Ll/prl;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    invoke-static {p1, p0}, Ll/jyb;->c0(Ljava/util/List;Ljava/lang/Object;)Ljava/util/List;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-interface {p2, p0}, Ll/prl;->e(Ljava/util/List;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public static synthetic o0(Ll/x20;Landroid/view/MenuItem;)Z
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x1

    .line 5
    return p0
.end method

.method public static o1(Lcom/p1/mobile/android/app/Act;Landroid/view/Menu;Ljava/lang/String;)V
    .locals 3

    .line 1
    const/4 v0, 0x4

    .line 2
    sget v1, Lcom/p1/mobile/putong/core/R$string;->H1:I

    .line 3
    .line 4
    const/4 v2, 0x0

    .line 5
    invoke-interface {p1, v2, v0, v0, v1}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    new-instance v0, Ll/po8;

    .line 10
    .line 11
    invoke-direct {v0, p0, p2}, Ll/po8;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/android/app/Act;Ll/x20;Lcom/p1/mobile/putong/data/Followship;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-interface {p1}, Ll/x20;->call()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public static synthetic p0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Landroid/view/MenuItem;)Z
    .locals 1

    .line 1
    const-string p2, "e_message_page_set_nickname"

    .line 2
    .line 3
    const-string v0, "p_chat_view"

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 11
    .line 12
    invoke-virtual {p2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    if-eqz p2, :cond_0

    .line 21
    .line 22
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/SetNicknameAct;->Z1(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const-string p1, "p_chat_view,e_message_page_set_nickname,click"

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/putong/core/data/Privilege;->vip_membership_remark_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 33
    .line 34
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/c;->J1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 35
    .line 36
    .line 37
    :goto_0
    const/4 p0, 0x1

    .line 38
    return p0
.end method

.method public static p1(ZZLcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Landroid/view/Menu;Ljava/lang/String;Ll/x20;Ljava/lang/String;)V
    .locals 9

    .line 1
    const/16 v8, 0x14

    .line 2
    .line 3
    move v0, p0

    .line 4
    move v1, p1

    .line 5
    move-object v2, p2

    .line 6
    move-object v3, p3

    .line 7
    move-object v4, p4

    .line 8
    move-object v5, p5

    .line 9
    move-object v6, p6

    .line 10
    move-object/from16 v7, p7

    .line 11
    .line 12
    invoke-static/range {v0 .. v8}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->q1(ZZLcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Landroid/view/Menu;Ljava/lang/String;Ll/x20;Ljava/lang/String;I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic q(Ljava/lang/StringBuilder;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/io/File;)V
    .locals 0

    .line 1
    new-instance p2, Ll/bp8;

    .line 2
    .line 3
    invoke-direct {p2, p1, p0}, Ll/bp8;-><init>(Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/lang/StringBuilder;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p2}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic q0(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static q1(ZZLcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Landroid/view/Menu;Ljava/lang/String;Ll/x20;Ljava/lang/String;I)V
    .locals 0

    .line 1
    if-eqz p0, :cond_2

    .line 2
    .line 3
    if-eqz p1, :cond_2

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0, p2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->isMatchedByRelationship(Lcom/p1/mobile/putong/data/User;)Z

    .line 10
    .line 11
    .line 12
    if-eqz p2, :cond_0

    .line 13
    .line 14
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->unilateralBlock()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    :cond_0
    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-nez p0, :cond_1

    .line 23
    .line 24
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    if-eqz p0, :cond_1

    .line 31
    .line 32
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 35
    .line 36
    invoke-virtual {p0, p5}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 37
    .line 38
    .line 39
    :cond_1
    sget p0, Lcom/p1/mobile/putong/core/R$string;->mk:I

    .line 40
    .line 41
    invoke-virtual {p3, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    const/4 p1, 0x0

    .line 46
    const/4 p2, 0x3

    .line 47
    invoke-interface {p4, p1, p2, p8, p0}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    new-instance p1, Ll/mm8;

    .line 52
    .line 53
    invoke-direct {p1, p3, p5, p6, p7}, Ll/mm8;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-interface {p0, p1}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    .line 57
    .line 58
    .line 59
    :cond_2
    return-void
.end method

.method public static synthetic r(Ljava/lang/Boolean;Ljava/lang/Boolean;)Ll/pf60;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic r0(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p1, "cheat_prevention_from"

    .line 2
    .line 3
    const-string v0, "risk_alarm_popup"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    filled-new-array {p1}, [Ll/sfj0$a;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const-string v0, "e_cheat_prevention_guide_click"

    .line 14
    .line 15
    const-string v1, "p_alert_cheat_prevention__risk_alarm_popup"

    .line 16
    .line 17
    invoke-static {v0, v1, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 18
    .line 19
    .line 20
    const-string p1, "https://live-web.tantanapp.com/anti_fraud_reminder/guide"

    .line 21
    .line 22
    const/4 v0, 0x1

    .line 23
    const-string v1, ""

    .line 24
    .line 25
    invoke-static {p0, v1, p1, v0}, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->b2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static r1(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/pk50;->f()Ll/rj50;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_verification_canceled_profile_avatar_popup:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, p0, v1}, Ll/rj50;->s0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic s(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic s0(Ll/z20;Ljava/lang/StringBuilder;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const-string v0, "failed"

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {p0, v0, p1}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p2}, Ll/ey6;->b(Ljava/lang/Throwable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static s1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;Ll/x20;)V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const-string v1, ""

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 15
    .line 16
    :goto_0
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 19
    .line 20
    iget-object v3, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v2, v3}, Ll/dkb;->y7(Ljava/lang/String;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    if-nez v3, :cond_1

    .line 31
    .line 32
    move-object v1, v2

    .line 33
    goto :goto_1

    .line 34
    :cond_1
    invoke-static {}, Ll/gra;->t1()Z

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    if-eqz v3, :cond_3

    .line 39
    .line 40
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-eqz v2, :cond_3

    .line 45
    .line 46
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-eqz v2, :cond_2

    .line 51
    .line 52
    iget-boolean v2, v0, Lcom/p1/mobile/putong/data/User;->inactivated:Z

    .line 53
    .line 54
    if-nez v2, :cond_2

    .line 55
    .line 56
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 57
    .line 58
    const-string v2, "RISK_TAG_CHAT_PROFILE_PICTURE_HIDDEN"

    .line 59
    .line 60
    invoke-static {v2}, Lcom/p1/mobile/putong/data/UserStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserStatus;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-interface {v0, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-eqz v0, :cond_3

    .line 69
    .line 70
    :cond_2
    const-string v1, "ta"

    .line 71
    .line 72
    :cond_3
    :goto_1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    const-string v2, "\u662f\u5426\u8981\u89e3\u9664\u548c%s\u7684\u914d\u5bf9\uff1f"

    .line 77
    .line 78
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    const/4 v1, 0x0

    .line 91
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    new-instance v1, Ll/np8;

    .line 96
    .line 97
    invoke-direct {v1, p0, p1, p2}, Ll/np8;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;)V

    .line 98
    .line 99
    .line 100
    const-string p1, "\u89e3\u9664"

    .line 101
    .line 102
    invoke-virtual {v0, p1, v1}, Lcom/p1/mobile/android/app/Dialog$e;->v0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    sget p2, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 107
    .line 108
    new-instance v0, Ll/op8;

    .line 109
    .line 110
    invoke-direct {v0, p3, p0}, Ll/op8;-><init>(Ll/x20;Lcom/p1/mobile/android/app/Act;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p1, p2, v0}, Lcom/p1/mobile/android/app/Dialog$e;->l0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 118
    .line 119
    .line 120
    return-void
.end method

.method public static synthetic t(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic t0(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/o3z;->g()Ll/o3z;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ll/o3z;->e(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->Fo()Lrx/c;

    .line 16
    .line 17
    .line 18
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static t1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;Ll/x20;)V
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    new-array v0, v0, [Ll/w30;

    .line 3
    .line 4
    new-instance v1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    sget v2, Lcom/p1/mobile/putong/core/R$string;->jk:I

    .line 10
    .line 11
    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    new-instance v2, Ll/w30$b;

    .line 19
    .line 20
    invoke-direct {v2, p0}, Ll/w30$b;-><init>(Landroid/content/Context;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    sget v4, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 28
    .line 29
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-virtual {v2, v3}, Ll/w30$b;->I(Ljava/lang/CharSequence;)Ll/w30$b;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    new-instance v4, Ll/sm8;

    .line 38
    .line 39
    invoke-direct {v4, v0}, Ll/sm8;-><init>([Ll/w30;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v3, v4}, Ll/w30$b;->U(Landroid/view/View$OnClickListener;)Ll/w30$b;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    invoke-virtual {v3, v1}, Ll/w30$b;->Q(Ljava/util/List;)Ll/w30$b;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    new-instance v3, Ll/tm8;

    .line 51
    .line 52
    invoke-direct {v3, p2, p0, p1, v0}, Ll/tm8;-><init>(Ll/x20;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;[Ll/w30;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1, v3}, Ll/w30$b;->V(Ll/w30$d;)Ll/w30$b;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    new-instance p1, Ll/um8;

    .line 60
    .line 61
    invoke-direct {p1, p3}, Ll/um8;-><init>(Ll/x20;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0, p1}, Ll/w30$b;->T(Landroid/content/DialogInterface$OnDismissListener;)Ll/w30$b;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v2}, Ll/w30$b;->F()Ll/w30;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    const/4 p1, 0x0

    .line 72
    aput-object p0, v0, p1

    .line 73
    .line 74
    invoke-virtual {p0}, Ll/w30;->f()V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public static synthetic u(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic u0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/api/g;->Mg(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 12
    .line 13
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/core/api/g;->Ig(Ljava/lang/String;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    new-instance v2, Ll/sp8;

    .line 18
    .line 19
    invoke-direct {v2}, Ll/sp8;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-static {v0, v1, v2}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Lrx/c;->first()Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Ll/tp8;

    .line 35
    .line 36
    invoke-direct {v1, p1, p0, p2}, Ll/tp8;-><init>(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 37
    .line 38
    .line 39
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public static u1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    .line 1
    const/4 v3, 0x0

    .line 2
    const/4 v4, 0x0

    .line 3
    const/4 v2, 0x0

    .line 4
    move-object v0, p0

    .line 5
    move-object v1, p1

    .line 6
    move-object v5, p2

    .line 7
    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->v1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;Ll/x20;Ll/x20;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic v(Ljava/lang/Boolean;Ljava/lang/Boolean;)Ll/pf60;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic v0(Ll/y20;Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;[Ll/w30;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    iget-object p6, p7, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 2
    .line 3
    invoke-interface {p6}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p6

    .line 7
    invoke-virtual {p6}, Ljava/lang/String;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p7

    .line 11
    invoke-interface {p0, p7}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    const-string p0, "receiver_user_id"

    .line 21
    .line 22
    invoke-static {p0, p2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const-string p1, "source_type"

    .line 27
    .line 28
    invoke-static {p1, p3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    const-string p3, "cancel_item"

    .line 33
    .line 34
    invoke-virtual {p6}, Ljava/lang/String;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p7

    .line 38
    invoke-static {p3, p7}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 39
    .line 40
    .line 41
    move-result-object p3

    .line 42
    sget-object p7, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 43
    .line 44
    iget-object p7, p7, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 45
    .line 46
    invoke-virtual {p7, p2}, Ll/dkb;->M7(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->matchFromForTrack()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    const-string p7, "matchfrom"

    .line 55
    .line 56
    invoke-static {p7, p2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    filled-new-array {p0, p1, p3, p2}, [Ll/sfj0$a;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    const-string p1, "e_cancelmatch"

    .line 65
    .line 66
    const-string p2, "p_messages_view"

    .line 67
    .line 68
    invoke-static {p1, p2, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 69
    .line 70
    .line 71
    :cond_0
    invoke-virtual {p6}, Ljava/lang/String;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Qq:I

    .line 76
    .line 77
    invoke-virtual {p4, p1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    if-eqz p1, :cond_1

    .line 86
    .line 87
    const-string p0, "dont_talk"

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_1
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Uq:I

    .line 91
    .line 92
    invoke-virtual {p4, p1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    if-eqz p1, :cond_2

    .line 101
    .line 102
    const-string p0, "spam"

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_2
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Tq:I

    .line 106
    .line 107
    invoke-virtual {p4, p1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result p1

    .line 115
    if-eqz p1, :cond_3

    .line 116
    .line 117
    const-string p0, "harassment"

    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_3
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Sq:I

    .line 121
    .line 122
    invoke-virtual {p4, p1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    move-result p1

    .line 130
    if-eqz p1, :cond_4

    .line 131
    .line 132
    const-string p0, "fake_profile"

    .line 133
    .line 134
    goto :goto_0

    .line 135
    :cond_4
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Rq:I

    .line 136
    .line 137
    invoke-virtual {p4, p1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    move-result p1

    .line 145
    if-eqz p1, :cond_5

    .line 146
    .line 147
    const-string p0, "dont_want_to_tell_you"

    .line 148
    .line 149
    goto :goto_0

    .line 150
    :cond_5
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Vq:I

    .line 151
    .line 152
    invoke-virtual {p4, p1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 157
    .line 158
    .line 159
    move-result p0

    .line 160
    if-eqz p0, :cond_6

    .line 161
    .line 162
    const-string p0, "swiped_wrong"

    .line 163
    .line 164
    goto :goto_0

    .line 165
    :cond_6
    const-string p0, ""

    .line 166
    .line 167
    :goto_0
    const-string p1, "unmatch_reason"

    .line 168
    .line 169
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 170
    .line 171
    .line 172
    move-result-object p0

    .line 173
    filled-new-array {p0}, [Ll/pf60;

    .line 174
    .line 175
    .line 176
    move-result-object p0

    .line 177
    const-string p1, "e_chat_unmatch"

    .line 178
    .line 179
    const-string p2, "p_unmatch_dialog"

    .line 180
    .line 181
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 182
    .line 183
    .line 184
    const/4 p0, 0x0

    .line 185
    aget-object p0, p5, p0

    .line 186
    .line 187
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 188
    .line 189
    .line 190
    return-void
.end method

.method public static v1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;Ll/x20;Ll/x20;Ljava/lang/String;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;",
            "Ll/x20;",
            "Ll/x20;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 6
    .line 7
    .line 8
    move-result-object v7

    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/api/g;->Mg(Ljava/lang/String;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 20
    .line 21
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/core/api/g;->Jg(Ljava/lang/String;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    new-instance v2, Ll/ap8;

    .line 26
    .line 27
    invoke-direct {v2}, Ll/ap8;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-static {v0, v1, v2}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Lrx/c;->first()Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    new-instance v1, Ll/lp8;

    .line 43
    .line 44
    move-object v4, p0

    .line 45
    move-object v3, p1

    .line 46
    move-object v2, p2

    .line 47
    move-object v8, p3

    .line 48
    move-object v5, p4

    .line 49
    move-object v6, p5

    .line 50
    invoke-direct/range {v1 .. v8}, Ll/lp8;-><init>(Ll/y20;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ll/x20;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Conversation;Ll/x20;)V

    .line 51
    .line 52
    .line 53
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public static synthetic w([Ll/w30;Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    aget-object p0, p0, p1

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic w0(Ll/x20;)V
    .locals 2

    .line 1
    const-string v0, "e_user_profile_share_agreement_popup_confirm"

    .line 2
    .line 3
    const-string v1, "p_user_profile_share_agreement_popup"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p0}, Ll/x20;->call()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static w1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Media;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/wzx;->k()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->x1(Lcom/p1/mobile/putong/data/Media;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->c()Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "android.permission.WRITE_EXTERNAL_STORAGE"

    .line 16
    .line 17
    filled-new-array {v1}, [Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->r([Ljava/lang/String;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->w(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const/4 v1, 0x1

    .line 31
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->u(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v1, Ll/vm8;

    .line 36
    .line 37
    invoke-direct {v1, p1}, Ll/vm8;-><init>(Lcom/p1/mobile/putong/data/Media;)V

    .line 38
    .line 39
    .line 40
    new-instance p1, Ll/wm8;

    .line 41
    .line 42
    invoke-direct {p1}, Ll/wm8;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v1, p1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->m(Ll/x20;Ll/y20;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->i(Landroid/app/Activity;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public static synthetic x(Ll/jl80;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    new-array p0, p0, [Ll/sfj0$a;

    .line 6
    .line 7
    const-string p1, "e_user_passive_popup_ok"

    .line 8
    .line 9
    const-string v0, "p_user_passive_popup"

    .line 10
    .line 11
    invoke-static {p1, v0, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic x0(Ll/x20;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ll/x20;->call()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static x1(Lcom/p1/mobile/putong/data/Media;)V
    .locals 10

    .line 1
    const-string v0, "Tantan"

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    :try_start_0
    instance-of v3, p0, Lcom/p1/mobile/putong/data/Video;

    .line 10
    .line 11
    if-eqz v3, :cond_0

    .line 12
    .line 13
    check-cast p0, Lcom/p1/mobile/putong/data/Video;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Video;->formatAspectRatio()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    sget-object v3, Landroid/os/Environment;->DIRECTORY_MOVIES:Ljava/lang/String;

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :catch_0
    move-exception p0

    .line 23
    goto/16 :goto_2

    .line 24
    .line 25
    :cond_0
    instance-of v3, p0, Lcom/p1/mobile/putong/data/Picture;

    .line 26
    .line 27
    if-eqz v3, :cond_1

    .line 28
    .line 29
    check-cast p0, Lcom/p1/mobile/putong/data/Picture;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->aspectRatioBiggest()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    sget-object v3, Landroid/os/Environment;->DIRECTORY_PICTURES:Ljava/lang/String;

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    move-object p0, v2

    .line 43
    move-object v3, p0

    .line 44
    :goto_0
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    if-nez v4, :cond_4

    .line 49
    .line 50
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    if-nez v4, :cond_4

    .line 55
    .line 56
    const-string v4, "."

    .line 57
    .line 58
    invoke-virtual {p0, v4}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    .line 59
    .line 60
    .line 61
    move-result v4

    .line 62
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 63
    .line 64
    .line 65
    move-result v5

    .line 66
    invoke-virtual {p0, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v4

    .line 70
    const/16 v5, 0x3f

    .line 71
    .line 72
    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(I)I

    .line 73
    .line 74
    .line 75
    move-result v5

    .line 76
    const/4 v6, -0x1

    .line 77
    if-ne v5, v6, :cond_2

    .line 78
    .line 79
    new-instance v5, Ljava/lang/StringBuilder;

    .line 80
    .line 81
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 82
    .line 83
    .line 84
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 85
    .line 86
    .line 87
    move-result-wide v6

    .line 88
    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v4

    .line 98
    goto :goto_1

    .line 99
    :cond_2
    new-instance v6, Ljava/lang/StringBuilder;

    .line 100
    .line 101
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 102
    .line 103
    .line 104
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 105
    .line 106
    .line 107
    move-result-wide v7

    .line 108
    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    const/4 v7, 0x0

    .line 112
    invoke-virtual {v4, v7, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v4

    .line 116
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v4

    .line 123
    :goto_1
    new-instance v5, Ljava/lang/StringBuilder;

    .line 124
    .line 125
    invoke-static {v3}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    .line 126
    .line 127
    .line 128
    move-result-object v6

    .line 129
    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v6

    .line 133
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    sget-object v6, Ljava/io/File;->separator:Ljava/lang/String;

    .line 137
    .line 138
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v5

    .line 148
    new-instance v7, Ljava/io/File;

    .line 149
    .line 150
    invoke-direct {v7, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {v7}, Ljava/io/File;->exists()Z

    .line 154
    .line 155
    .line 156
    move-result v8

    .line 157
    if-nez v8, :cond_3

    .line 158
    .line 159
    invoke-virtual {v7}, Ljava/io/File;->exists()Z

    .line 160
    .line 161
    .line 162
    move-result v8

    .line 163
    if-nez v8, :cond_4

    .line 164
    .line 165
    invoke-virtual {v7}, Ljava/io/File;->mkdirs()Z

    .line 166
    .line 167
    .line 168
    move-result v7

    .line 169
    if-eqz v7, :cond_4

    .line 170
    .line 171
    :cond_3
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 172
    .line 173
    .line 174
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 175
    .line 176
    .line 177
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 184
    .line 185
    .line 186
    new-instance v0, Ljava/lang/StringBuilder;

    .line 187
    .line 188
    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 189
    .line 190
    .line 191
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 201
    :cond_4
    move-object v9, v2

    .line 202
    move-object v2, p0

    .line 203
    move-object p0, v9

    .line 204
    goto :goto_3

    .line 205
    :goto_2
    new-instance v0, Ljava/lang/Exception;

    .line 206
    .line 207
    new-instance v3, Ljava/lang/StringBuilder;

    .line 208
    .line 209
    const-string v4, "downloadMediaWithPermission exception:"

    .line 210
    .line 211
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 212
    .line 213
    .line 214
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object v4

    .line 218
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 219
    .line 220
    .line 221
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object v3

    .line 225
    invoke-direct {v0, v3, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 226
    .line 227
    .line 228
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 229
    .line 230
    .line 231
    move-object p0, v2

    .line 232
    :goto_3
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 233
    .line 234
    .line 235
    move-result v0

    .line 236
    if-nez v0, :cond_6

    .line 237
    .line 238
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 239
    .line 240
    .line 241
    move-result v0

    .line 242
    if-nez v0, :cond_6

    .line 243
    .line 244
    new-instance v0, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 245
    .line 246
    sget-object v3, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 247
    .line 248
    invoke-virtual {v3}, Lcom/p1/mobile/putong/api/api/Network;->getDownloadHttp()Ll/rg50;

    .line 249
    .line 250
    .line 251
    move-result-object v3

    .line 252
    invoke-direct {v0, v3}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;-><init>(Ll/rg50;)V

    .line 253
    .line 254
    .line 255
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->q(Ljava/lang/String;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 256
    .line 257
    .line 258
    move-result-object v0

    .line 259
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->o(Ljava/lang/String;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 260
    .line 261
    .line 262
    move-result-object p0

    .line 263
    new-instance v0, Ll/io8;

    .line 264
    .line 265
    invoke-direct {v0, v1}, Ll/io8;-><init>(Ljava/lang/StringBuilder;)V

    .line 266
    .line 267
    .line 268
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->j(Ll/z20;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 269
    .line 270
    .line 271
    move-result-object p0

    .line 272
    new-instance v0, Ll/jo8;

    .line 273
    .line 274
    invoke-direct {v0}, Ll/jo8;-><init>()V

    .line 275
    .line 276
    .line 277
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->f(Ll/z20;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 278
    .line 279
    .line 280
    move-result-object p0

    .line 281
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->a()Lcom/p1/mobile/putong/ui/download/DownloadTask;

    .line 282
    .line 283
    .line 284
    move-result-object p0

    .line 285
    invoke-static {}, Lcom/p1/mobile/putong/ui/download/a;->u()Lcom/p1/mobile/putong/ui/download/a;

    .line 286
    .line 287
    .line 288
    move-result-object v0

    .line 289
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->x()Ljava/lang/String;

    .line 290
    .line 291
    .line 292
    move-result-object v1

    .line 293
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/download/a;->y(Ljava/lang/String;)Z

    .line 294
    .line 295
    .line 296
    move-result v0

    .line 297
    if-eqz v0, :cond_5

    .line 298
    .line 299
    sget p0, Lcom/p1/mobile/putong/core/R$string;->br:I

    .line 300
    .line 301
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 302
    .line 303
    .line 304
    goto :goto_4

    .line 305
    :cond_5
    invoke-static {}, Lcom/p1/mobile/putong/ui/download/a;->u()Lcom/p1/mobile/putong/ui/download/a;

    .line 306
    .line 307
    .line 308
    move-result-object v0

    .line 309
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/ui/download/a;->o(Lcom/p1/mobile/putong/ui/download/DownloadTask;)V

    .line 310
    .line 311
    .line 312
    goto :goto_4

    .line 313
    :cond_6
    sget p0, Lcom/p1/mobile/putong/core/R$string;->p4:I

    .line 314
    .line 315
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 316
    .line 317
    .line 318
    :goto_4
    return-void
.end method

.method public static synthetic y(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->w1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Media;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic y0(Ljava/lang/String;Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const-string p3, "select_photo_way"

    .line 6
    .line 7
    const-string p4, "p_age_verify_photo_upload_type_popup"

    .line 8
    .line 9
    const-string p5, "e_age_verify_photo_upload_type"

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const-string p0, "select_from_album"

    .line 14
    .line 15
    invoke-static {p3, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    filled-new-array {p0}, [Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {p5, p4, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 24
    .line 25
    .line 26
    const/4 p0, 0x1

    .line 27
    const/4 p2, 0x0

    .line 28
    invoke-virtual {p1, p0, p2, p2, p2}, Lcom/p1/mobile/putong/app/PutongAct;->pickImagesWithPicker(IZZZ)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    invoke-virtual {p2, p6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-eqz p0, :cond_1

    .line 37
    .line 38
    const-string p0, "take_photo"

    .line 39
    .line 40
    invoke-static {p3, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    filled-new-array {p0}, [Ll/pf60;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-static {p5, p4, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 49
    .line 50
    .line 51
    invoke-static {p1}, Ll/l7y;->l(Lcom/p1/mobile/android/app/Act;)V

    .line 52
    .line 53
    .line 54
    :cond_1
    return-void
.end method

.method public static y1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLjava/lang/Runnable;Ljava/lang/Runnable;)V
    .locals 7

    .line 1
    const-string v0, "male"

    .line 2
    .line 3
    if-eqz p2, :cond_1

    .line 4
    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 6
    .line 7
    invoke-static {v1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    sget v0, Lcom/p1/mobile/putong/core/R$string;->I3:I

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    sget v0, Lcom/p1/mobile/putong/core/R$string;->H3:I

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 20
    .line 21
    invoke-static {v1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    sget v0, Lcom/p1/mobile/putong/core/R$string;->E3:I

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_2
    sget v0, Lcom/p1/mobile/putong/core/R$string;->D3:I

    .line 31
    .line 32
    :goto_0
    if-eqz p2, :cond_3

    .line 33
    .line 34
    invoke-static {}, Ll/fph0;->C()V

    .line 35
    .line 36
    .line 37
    goto :goto_1

    .line 38
    :cond_3
    invoke-static {}, Ll/fph0;->z()V

    .line 39
    .line 40
    .line 41
    :goto_1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-nez v1, :cond_7

    .line 46
    .line 47
    invoke-static {}, Ll/d09;->g()Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-nez v1, :cond_7

    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    const/4 v2, 0x1

    .line 58
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    new-instance v2, Ll/ko8;

    .line 63
    .line 64
    invoke-direct {v2, p3}, Ll/ko8;-><init>(Ljava/lang/Runnable;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->A(Landroid/content/DialogInterface$OnCancelListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Dialog$e;->u()Lcom/p1/mobile/android/app/Dialog$e;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Dialog$e;->s()Lcom/p1/mobile/android/app/Dialog$e;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    if-eqz p2, :cond_4

    .line 80
    .line 81
    sget v2, Ll/dbc0;->As:I

    .line 82
    .line 83
    goto :goto_2

    .line 84
    :cond_4
    sget v2, Ll/dbc0;->ys:I

    .line 85
    .line 86
    :goto_2
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->c0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    if-eqz p2, :cond_5

    .line 95
    .line 96
    sget v2, Lcom/p1/mobile/putong/core/R$string;->J3:I

    .line 97
    .line 98
    goto :goto_3

    .line 99
    :cond_5
    sget v2, Lcom/p1/mobile/putong/core/R$string;->F3:I

    .line 100
    .line 101
    :goto_3
    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    invoke-virtual {v1, p0}, Lcom/p1/mobile/android/app/Dialog$e;->G0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 110
    .line 111
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->E(I[Ljava/lang/Object;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    sget p1, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 120
    .line 121
    new-instance v0, Ll/lo8;

    .line 122
    .line 123
    invoke-direct {v0, p3, p2}, Ll/lo8;-><init>(Ljava/lang/Runnable;Z)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->l0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    if-eqz p2, :cond_6

    .line 131
    .line 132
    sget p1, Lcom/p1/mobile/putong/core/R$string;->G3:I

    .line 133
    .line 134
    goto :goto_4

    .line 135
    :cond_6
    sget p1, Lcom/p1/mobile/putong/core/R$string;->C3:I

    .line 136
    .line 137
    :goto_4
    new-instance p3, Ll/mo8;

    .line 138
    .line 139
    invoke-direct {p3, p2, p4}, Ll/mo8;-><init>(ZLjava/lang/Runnable;)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {p0, p1, p3}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 147
    .line 148
    .line 149
    return-void

    .line 150
    :cond_7
    if-eqz p2, :cond_8

    .line 151
    .line 152
    sget p3, Lcom/p1/mobile/putong/core/R$string;->yr:I

    .line 153
    .line 154
    goto :goto_5

    .line 155
    :cond_8
    sget p3, Lcom/p1/mobile/putong/core/R$string;->xr:I

    .line 156
    .line 157
    :goto_5
    if-eqz p2, :cond_9

    .line 158
    .line 159
    sget v1, Lcom/p1/mobile/putong/core/R$string;->G3:I

    .line 160
    .line 161
    goto :goto_6

    .line 162
    :cond_9
    sget v1, Lcom/p1/mobile/putong/core/R$string;->C3:I

    .line 163
    .line 164
    :goto_6
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 165
    .line 166
    .line 167
    move-result-object p0

    .line 168
    const/4 v2, 0x0

    .line 169
    invoke-virtual {p0, v2}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 170
    .line 171
    .line 172
    move-result-object p0

    .line 173
    sget v3, Ll/kec0;->rf:I

    .line 174
    .line 175
    invoke-virtual {p0, v3}, Lcom/p1/mobile/android/app/Dialog$e;->M(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 176
    .line 177
    .line 178
    move-result-object p0

    .line 179
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->u()Lcom/p1/mobile/android/app/Dialog$e;

    .line 180
    .line 181
    .line 182
    move-result-object p0

    .line 183
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 184
    .line 185
    .line 186
    move-result-object p0

    .line 187
    invoke-virtual {p0, v2}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 188
    .line 189
    .line 190
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->P()Landroid/view/View;

    .line 191
    .line 192
    .line 193
    move-result-object v2

    .line 194
    sget v3, Ll/adc0;->N5:I

    .line 195
    .line 196
    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 197
    .line 198
    .line 199
    move-result-object v3

    .line 200
    check-cast v3, Lv/VImage;

    .line 201
    .line 202
    sget v4, Ll/adc0;->L0:I

    .line 203
    .line 204
    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 205
    .line 206
    .line 207
    move-result-object v4

    .line 208
    check-cast v4, Lv/VText;

    .line 209
    .line 210
    sget v5, Ll/adc0;->je:I

    .line 211
    .line 212
    invoke-virtual {v2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 213
    .line 214
    .line 215
    move-result-object v5

    .line 216
    check-cast v5, Lv/VText;

    .line 217
    .line 218
    sget v6, Ll/adc0;->P1:I

    .line 219
    .line 220
    invoke-virtual {v2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 221
    .line 222
    .line 223
    move-result-object v2

    .line 224
    check-cast v2, Lv/VText;

    .line 225
    .line 226
    invoke-virtual {v5, p3}, Landroid/widget/TextView;->setText(I)V

    .line 227
    .line 228
    .line 229
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 230
    .line 231
    .line 232
    move-result-object p3

    .line 233
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 234
    .line 235
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 236
    .line 237
    .line 238
    move-result-object p1

    .line 239
    invoke-virtual {p3, v0, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 240
    .line 241
    .line 242
    move-result-object p1

    .line 243
    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 244
    .line 245
    .line 246
    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setText(I)V

    .line 247
    .line 248
    .line 249
    if-eqz p2, :cond_a

    .line 250
    .line 251
    sget p1, Ll/dbc0;->Bs:I

    .line 252
    .line 253
    goto :goto_7

    .line 254
    :cond_a
    sget p1, Ll/dbc0;->zs:I

    .line 255
    .line 256
    :goto_7
    invoke-virtual {v3, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 257
    .line 258
    .line 259
    new-instance p1, Ll/no8;

    .line 260
    .line 261
    invoke-direct {p1, p2, p4, p0}, Ll/no8;-><init>(ZLjava/lang/Runnable;Lcom/p1/mobile/android/app/Dialog;)V

    .line 262
    .line 263
    .line 264
    invoke-virtual {v4, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 265
    .line 266
    .line 267
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 268
    .line 269
    .line 270
    return-void
.end method

.method public static synthetic z(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic z0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static z1(Lcom/p1/mobile/android/app/Act;ZII)Ljava/lang/CharSequence;
    .locals 1

    .line 1
    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    if-eqz p1, :cond_1

    .line 6
    .line 7
    if-gtz p3, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    new-instance p1, Landroid/text/SpannableStringBuilder;

    .line 11
    .line 12
    invoke-direct {p1, p2}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 13
    .line 14
    .line 15
    const-string p2, " "

    .line 16
    .line 17
    invoke-virtual {p1, p2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    new-instance p2, Landroid/graphics/drawable/BitmapDrawable;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p0, p3}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-direct {p2, v0, p0}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p2}, Landroid/graphics/drawable/BitmapDrawable;->getIntrinsicWidth()I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    invoke-virtual {p2}, Landroid/graphics/drawable/BitmapDrawable;->getIntrinsicHeight()I

    .line 43
    .line 44
    .line 45
    move-result p3

    .line 46
    const/4 v0, 0x0

    .line 47
    invoke-virtual {p2, v0, v0, p0, p3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 48
    .line 49
    .line 50
    new-instance p0, Ll/qxw;

    .line 51
    .line 52
    const/high16 p3, 0x41000000    # 8.0f

    .line 53
    .line 54
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 55
    .line 56
    .line 57
    move-result p3

    .line 58
    invoke-direct {p0, p2, p3}, Ll/qxw;-><init>(Landroid/graphics/drawable/Drawable;I)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p1}, Landroid/text/SpannableStringBuilder;->length()I

    .line 62
    .line 63
    .line 64
    move-result p2

    .line 65
    add-int/lit8 p2, p2, -0x1

    .line 66
    .line 67
    invoke-virtual {p1}, Landroid/text/SpannableStringBuilder;->length()I

    .line 68
    .line 69
    .line 70
    move-result p3

    .line 71
    const/16 v0, 0x11

    .line 72
    .line 73
    invoke-virtual {p1, p0, p2, p3, v0}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 74
    .line 75
    .line 76
    return-object p1

    .line 77
    :cond_1
    :goto_0
    return-object p2
.end method
