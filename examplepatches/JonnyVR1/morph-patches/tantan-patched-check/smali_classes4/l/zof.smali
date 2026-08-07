.class public Ll/zof;
.super Ll/g1e;
.source "SourceFile"


# static fields
.field public static final r:Ljava/lang/String;

.field public static s:J


# instance fields
.field public j:Lv/VImage;

.field public k:Lv/VDraweeView;

.field public l:Landroid/widget/TextView;

.field public m:Landroid/widget/TextView;

.field public n:Landroid/widget/TextView;

.field public final o:Lcom/p1/mobile/android/app/Act;

.field public final p:Ljava/lang/String;

.field public q:Lcom/p1/mobile/putong/core/newui/explore/data/ExploreDialogData;


# direct methods
.method static constructor <clinit>()V
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
    const-string v0, "http://m.staging2.p1staff.com"

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string v0, "https://m.tantanapp.com"

    .line 11
    .line 12
    :goto_0
    sput-object v0, Ll/zof;->r:Ljava/lang/String;

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    sget v1, Ll/agc0;->l:I

    .line 3
    .line 4
    invoke-direct {p0, p1, v0, v1}, Ll/g1e;-><init>(Landroid/content/Context;ZI)V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Ll/zof;->o:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    iput-object p2, p0, Ll/zof;->p:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public static synthetic E(Ll/zof;Lcom/p1/mobile/putong/core/newui/explore/data/ExploreDialogData;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/zof;->H(Lcom/p1/mobile/putong/core/newui/explore/data/ExploreDialogData;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic F(Ll/zof;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zof;->I(Landroid/view/View;)V

    return-void
.end method

.method public static M(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/newui/explore/data/ExploreDialogData;Z)V
    .locals 4

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    const-string p0, "\u5f53\u524d\u7528\u6237\u72b6\u6001\u5f02\u5e38\uff0c\u8bf7\u66f4\u65b0\u72b6\u6001\u540e\u5c1d\u8bd5"

    .line 4
    .line 5
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    sget-wide v2, Ll/zof;->s:J

    .line 14
    .line 15
    sub-long/2addr v0, v2

    .line 16
    const-wide/16 v2, 0x1f4

    .line 17
    .line 18
    cmp-long v0, v0, v2

    .line 19
    .line 20
    if-lez v0, :cond_3

    .line 21
    .line 22
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 23
    .line 24
    .line 25
    move-result-wide v0

    .line 26
    sput-wide v0, Ll/zof;->s:J

    .line 27
    .line 28
    const-string v0, "tag"

    .line 29
    .line 30
    iget-object v1, p2, Lcom/p1/mobile/putong/core/newui/explore/data/ExploreDialogData;->skip:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    invoke-static {}, Ll/aw90;->V()Z

    .line 39
    .line 40
    .line 41
    move-result p2

    .line 42
    if-nez p2, :cond_3

    .line 43
    .line 44
    new-instance p2, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 47
    .line 48
    .line 49
    sget-object p3, Ll/zof;->r:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string p3, "/fep/tantan/frontend/tantan-frontend-app-pages-v2/src/pages/growth/explore/index.html?speed=true&_bid=1004854&tagType="

    .line 55
    .line 56
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    const-string p1, "&hideNavigationBar=1&hideNotch=1#/label-select"

    .line 63
    .line 64
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    const-string p2, ""

    .line 72
    .line 73
    invoke-static {p0, p2, p1}, Lcom/p1/mobile/putong/ui/webview/mk/MkDlgWebViewAct;->Y1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    const-string p2, "hideNavigationBar"

    .line 78
    .line 79
    const/4 p3, 0x1

    .line 80
    invoke-virtual {p1, p2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 81
    .line 82
    .line 83
    const-string p2, "skipLoading"

    .line 84
    .line 85
    invoke-virtual {p1, p2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 86
    .line 87
    .line 88
    const-string p2, "transparent_status_bar"

    .line 89
    .line 90
    invoke-virtual {p1, p2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 91
    .line 92
    .line 93
    const-string p2, "webviewColor"

    .line 94
    .line 95
    const-string v0, "transparent"

    .line 96
    .line 97
    invoke-virtual {p1, p2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 98
    .line 99
    .line 100
    const-string p2, "hideNotch"

    .line 101
    .line 102
    invoke-virtual {p1, p2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 103
    .line 104
    .line 105
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 106
    .line 107
    .line 108
    const/4 p1, 0x0

    .line 109
    invoke-virtual {p0, p1, p1}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 110
    .line 111
    .line 112
    return-void

    .line 113
    :cond_1
    new-instance v0, Ll/zof;

    .line 114
    .line 115
    invoke-direct {v0, p0, p1}, Ll/zof;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    if-eqz p3, :cond_2

    .line 119
    .line 120
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    move-result p1

    .line 128
    if-eqz p1, :cond_3

    .line 129
    .line 130
    invoke-virtual {p0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    const/16 p3, 0x50

    .line 135
    .line 136
    iput p3, p1, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 137
    .line 138
    const/4 p3, -0x1

    .line 139
    iput p3, p1, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 140
    .line 141
    const/4 p3, -0x2

    .line 142
    iput p3, p1, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 143
    .line 144
    invoke-virtual {p0, p1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 145
    .line 146
    .line 147
    const p1, 0x3e99999a    # 0.3f

    .line 148
    .line 149
    .line 150
    invoke-virtual {p0, p1}, Landroid/view/Window;->setDimAmount(F)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {v0}, Ll/g1e;->show()V

    .line 154
    .line 155
    .line 156
    invoke-virtual {v0, p2}, Ll/zof;->J(Lcom/p1/mobile/putong/core/newui/explore/data/ExploreDialogData;)V

    .line 157
    .line 158
    .line 159
    return-void

    .line 160
    :cond_2
    invoke-virtual {v0, p2}, Ll/zof;->K(Lcom/p1/mobile/putong/core/newui/explore/data/ExploreDialogData;)V

    .line 161
    .line 162
    .line 163
    :cond_3
    return-void
.end method


# virtual methods
.method public G(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/apf;->b(Ll/zof;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic H(Lcom/p1/mobile/putong/core/newui/explore/data/ExploreDialogData;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/aw90;->V()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-nez p2, :cond_1

    .line 6
    .line 7
    const-string p2, "portrait"

    .line 8
    .line 9
    iget-object v0, p1, Lcom/p1/mobile/putong/core/newui/explore/data/ExploreDialogData;->skip:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    if-nez p2, :cond_0

    .line 16
    .line 17
    const-string p2, "new_portrait"

    .line 18
    .line 19
    iget-object v0, p1, Lcom/p1/mobile/putong/core/newui/explore/data/ExploreDialogData;->skip:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    if-eqz p2, :cond_1

    .line 26
    .line 27
    :cond_0
    iget-object p2, p0, Ll/zof;->o:Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    const-string v0, "from_explore_card"

    .line 30
    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/explore/data/ExploreDialogData;->exploreUploadPic:Lcom/p1/mobile/putong/core/newui/explore/data/ExploreDialogData$ExploreUploadPic;

    .line 32
    .line 33
    invoke-static {p2, v0, p1}, Ll/we60;->b(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/newui/explore/data/ExploreDialogData$ExploreUploadPic;)Z

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/zof;->N()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 40
    .line 41
    .line 42
    :cond_1
    return-void
.end method

.method public final synthetic I(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final J(Lcom/p1/mobile/putong/core/newui/explore/data/ExploreDialogData;)V
    .locals 3

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/zof;->k:Lv/VDraweeView;

    .line 4
    .line 5
    iget-object v2, p1, Lcom/p1/mobile/putong/core/newui/explore/data/ExploreDialogData;->pop_up_icon:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/zof;->l:Landroid/widget/TextView;

    .line 11
    .line 12
    iget-object v1, p1, Lcom/p1/mobile/putong/core/newui/explore/data/ExploreDialogData;->pop_up_title:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->H0(Landroid/widget/TextView;Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/zof;->m:Landroid/widget/TextView;

    .line 18
    .line 19
    iget-object v1, p1, Lcom/p1/mobile/putong/core/newui/explore/data/ExploreDialogData;->pop_up_sub_title:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v0, v1}, Ll/bnl0;->H0(Landroid/widget/TextView;Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/zof;->n:Landroid/widget/TextView;

    .line 25
    .line 26
    const-string v1, "\u4e0a\u4f20\u7167\u7247"

    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/bnl0;->H0(Landroid/widget/TextView;Ljava/lang/String;)Z

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Ll/zof;->O()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, p1}, Ll/zof;->L(Lcom/p1/mobile/putong/core/newui/explore/data/ExploreDialogData;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final K(Lcom/p1/mobile/putong/core/newui/explore/data/ExploreDialogData;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/zof;->q:Lcom/p1/mobile/putong/core/newui/explore/data/ExploreDialogData;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/zof;->o:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {p0, v0, v1}, Ll/zof;->G(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 20
    .line 21
    iget-object p0, p0, Ll/zof;->k:Lv/VDraweeView;

    .line 22
    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/explore/data/ExploreDialogData;->pop_up_icon:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v0, p0, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public final L(Lcom/p1/mobile/putong/core/newui/explore/data/ExploreDialogData;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zof;->n:Landroid/widget/TextView;

    .line 2
    .line 3
    new-instance v1, Ll/xof;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/xof;-><init>(Ll/zof;Lcom/p1/mobile/putong/core/newui/explore/data/ExploreDialogData;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ll/zof;->j:Lv/VImage;

    .line 12
    .line 13
    new-instance v0, Ll/yof;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Ll/yof;-><init>(Ll/zof;)V

    .line 16
    .line 17
    .line 18
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final N()V
    .locals 2

    .line 1
    const-string v0, "tantanx_scene_name"

    .line 2
    .line 3
    iget-object p0, p0, Ll/zof;->p:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    filled-new-array {p0}, [Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string v0, "e_tantanx_card_popup_confirm"

    .line 14
    .line 15
    const-string v1, "p_tantanx_card"

    .line 16
    .line 17
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final O()V
    .locals 2

    .line 1
    const-string v0, "tantanx_scene_name"

    .line 2
    .line 3
    iget-object p0, p0, Ll/zof;->p:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    filled-new-array {p0}, [Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string v0, "e_tantanx_card_popup"

    .line 14
    .line 15
    const-string v1, "p_tantanx_card"

    .line 16
    .line 17
    invoke-static {v0, v1, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroidx/appcompat/app/a;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/zof;->o:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p0, p1, v0}, Ll/zof;->G(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Ll/nu0;->setContentView(Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
