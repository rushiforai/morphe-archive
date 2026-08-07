.class public Lcom/p1/mobile/putong/core/ui/visitor/MomentVisitorsAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# instance fields
.field public c:Lcom/p1/mobile/putong/core/ui/visitor/MomentVisitorsFrag;

.field public d:Lcom/p1/mobile/putong/core/ui/visitor/visitorsme/VisitorsMeFrag;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static X1(Landroid/content/Context;Z)Landroid/content/Intent;
    .locals 2

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {p0, p1, v0, v1}, Lcom/p1/mobile/putong/core/ui/visitor/MomentVisitorsAct;->Z1(Landroid/content/Context;ZLjava/lang/String;Z)Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public static Y1(Landroid/content/Context;ZLjava/lang/String;)Landroid/content/Intent;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/visitor/MomentVisitorsAct;->Z1(Landroid/content/Context;ZLjava/lang/String;Z)Landroid/content/Intent;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static Z1(Landroid/content/Context;ZLjava/lang/String;Z)Landroid/content/Intent;
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->d4()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    new-instance v0, Landroid/content/Intent;

    .line 16
    .line 17
    const-class v1, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsAct;

    .line 18
    .line 19
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 20
    .line 21
    .line 22
    const/4 p0, 0x1

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    new-instance v0, Landroid/content/Intent;

    .line 25
    .line 26
    const-class v1, Lcom/p1/mobile/putong/core/ui/visitor/MomentVisitorsAct;

    .line 27
    .line 28
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 29
    .line 30
    .line 31
    const/4 p0, 0x0

    .line 32
    :goto_0
    const-string v1, "hasPermission"

    .line 33
    .line 34
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 35
    .line 36
    .line 37
    const-string p1, "fromDeeplink"

    .line 38
    .line 39
    invoke-virtual {v0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 40
    .line 41
    .line 42
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-nez p1, :cond_1

    .line 47
    .line 48
    const-string p1, "from"

    .line 49
    .line 50
    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 51
    .line 52
    .line 53
    :cond_1
    const-string p1, "hideNavigation"

    .line 54
    .line 55
    invoke-virtual {v0, p1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 56
    .line 57
    .line 58
    return-object v0
.end method

.method public static a2(Landroid/content/Context;ZZ)Landroid/content/Intent;
    .locals 1

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    invoke-static {p0, p1, v0, p2}, Lcom/p1/mobile/putong/core/ui/visitor/MomentVisitorsAct;->Z1(Landroid/content/Context;ZLjava/lang/String;Z)Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method


# virtual methods
.method public disableAutoPV()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 9

    .line 1
    new-instance p1, Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-direct {p1, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    sget p2, Ll/ddc0;->V:I

    .line 7
    .line 8
    invoke-virtual {p1, p2}, Landroid/view/View;->setId(I)V

    .line 9
    .line 10
    .line 11
    iget-object p2, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    invoke-virtual {p2}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    const-string v0, "visitor_frag"

    .line 18
    .line 19
    invoke-virtual {p2, v0}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-static {}, Ll/rs9;->i()Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    const/4 v3, 0x1

    .line 28
    const/4 v4, 0x0

    .line 29
    const-string v5, "hasPermission"

    .line 30
    .line 31
    const-string v6, "fromDeeplink"

    .line 32
    .line 33
    const-string v7, "from"

    .line 34
    .line 35
    if-eqz v2, :cond_2

    .line 36
    .line 37
    instance-of v2, v1, Lcom/p1/mobile/putong/core/ui/visitor/visitorsme/VisitorsMeFrag;

    .line 38
    .line 39
    if-eqz v2, :cond_0

    .line 40
    .line 41
    check-cast v1, Lcom/p1/mobile/putong/core/ui/visitor/visitorsme/VisitorsMeFrag;

    .line 42
    .line 43
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/visitor/MomentVisitorsAct;->d:Lcom/p1/mobile/putong/core/ui/visitor/visitorsme/VisitorsMeFrag;

    .line 44
    .line 45
    return-object p1

    .line 46
    :cond_0
    new-instance v1, Lcom/p1/mobile/putong/core/ui/visitor/visitorsme/VisitorsMeFrag;

    .line 47
    .line 48
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/ui/visitor/visitorsme/VisitorsMeFrag;-><init>()V

    .line 49
    .line 50
    .line 51
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/visitor/MomentVisitorsAct;->d:Lcom/p1/mobile/putong/core/ui/visitor/visitorsme/VisitorsMeFrag;

    .line 52
    .line 53
    new-instance v1, Landroid/os/Bundle;

    .line 54
    .line 55
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {v2, v7}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 67
    .line 68
    .line 69
    move-result-object v8

    .line 70
    invoke-virtual {v8, v6, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 71
    .line 72
    .line 73
    move-result v4

    .line 74
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 75
    .line 76
    .line 77
    move-result-object v8

    .line 78
    invoke-virtual {v8, v5, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 79
    .line 80
    .line 81
    move-result v3

    .line 82
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 83
    .line 84
    .line 85
    move-result v8

    .line 86
    if-nez v8, :cond_1

    .line 87
    .line 88
    invoke-virtual {v1, v7, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    :cond_1
    invoke-virtual {v1, v6, v4}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v1, v5, v3}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 95
    .line 96
    .line 97
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/visitor/MomentVisitorsAct;->d:Lcom/p1/mobile/putong/core/ui/visitor/visitorsme/VisitorsMeFrag;

    .line 98
    .line 99
    invoke-virtual {v2, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p2}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 103
    .line 104
    .line 105
    move-result-object p2

    .line 106
    sget v1, Ll/ddc0;->V:I

    .line 107
    .line 108
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/MomentVisitorsAct;->d:Lcom/p1/mobile/putong/core/ui/visitor/visitorsme/VisitorsMeFrag;

    .line 109
    .line 110
    invoke-virtual {p2, v1, p0, v0}, Landroidx/fragment/app/k;->t(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/k;

    .line 111
    .line 112
    .line 113
    invoke-virtual {p2}, Landroidx/fragment/app/k;->j()I

    .line 114
    .line 115
    .line 116
    return-object p1

    .line 117
    :cond_2
    instance-of v2, v1, Lcom/p1/mobile/putong/core/ui/visitor/MomentVisitorsFrag;

    .line 118
    .line 119
    if-eqz v2, :cond_3

    .line 120
    .line 121
    check-cast v1, Lcom/p1/mobile/putong/core/ui/visitor/MomentVisitorsFrag;

    .line 122
    .line 123
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/visitor/MomentVisitorsAct;->c:Lcom/p1/mobile/putong/core/ui/visitor/MomentVisitorsFrag;

    .line 124
    .line 125
    return-object p1

    .line 126
    :cond_3
    new-instance v1, Lcom/p1/mobile/putong/core/ui/visitor/MomentVisitorsFrag;

    .line 127
    .line 128
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/ui/visitor/MomentVisitorsFrag;-><init>()V

    .line 129
    .line 130
    .line 131
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/visitor/MomentVisitorsAct;->c:Lcom/p1/mobile/putong/core/ui/visitor/MomentVisitorsFrag;

    .line 132
    .line 133
    new-instance v1, Landroid/os/Bundle;

    .line 134
    .line 135
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 136
    .line 137
    .line 138
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 139
    .line 140
    .line 141
    move-result-object v2

    .line 142
    invoke-virtual {v2, v7}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v2

    .line 146
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 147
    .line 148
    .line 149
    move-result-object v8

    .line 150
    invoke-virtual {v8, v6, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 151
    .line 152
    .line 153
    move-result v4

    .line 154
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 155
    .line 156
    .line 157
    move-result-object v8

    .line 158
    invoke-virtual {v8, v5, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 159
    .line 160
    .line 161
    move-result v3

    .line 162
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 163
    .line 164
    .line 165
    move-result v8

    .line 166
    if-nez v8, :cond_4

    .line 167
    .line 168
    invoke-virtual {v1, v7, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    :cond_4
    invoke-virtual {v1, v6, v4}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 172
    .line 173
    .line 174
    invoke-virtual {v1, v5, v3}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 175
    .line 176
    .line 177
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/visitor/MomentVisitorsAct;->c:Lcom/p1/mobile/putong/core/ui/visitor/MomentVisitorsFrag;

    .line 178
    .line 179
    invoke-virtual {v2, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 180
    .line 181
    .line 182
    invoke-virtual {p2}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 183
    .line 184
    .line 185
    move-result-object p2

    .line 186
    sget v1, Ll/ddc0;->V:I

    .line 187
    .line 188
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/MomentVisitorsAct;->c:Lcom/p1/mobile/putong/core/ui/visitor/MomentVisitorsFrag;

    .line 189
    .line 190
    invoke-virtual {p2, v1, p0, v0}, Landroidx/fragment/app/k;->c(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/k;

    .line 191
    .line 192
    .line 193
    invoke-virtual {p2}, Landroidx/fragment/app/k;->j()I

    .line 194
    .line 195
    .line 196
    return-object p1
.end method
