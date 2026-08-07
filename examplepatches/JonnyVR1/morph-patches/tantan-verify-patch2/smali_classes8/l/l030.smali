.class public Ll/l030;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/b030;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/widget/FrameLayout;

.field public b:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

.field public c:Landroid/widget/FrameLayout;

.field public d:Lv/VText;

.field public e:Landroid/widget/FrameLayout;

.field public f:Lv/VProgressBar;

.field public g:Lv/VDraweeView;

.field public h:Landroid/widget/TextView;

.field public i:Lv/VFrame;

.field public j:Lv/VText;

.field public k:Lcom/google/android/material/tabs/TabLayout;

.field public l:Lv/VPager;

.field public m:Ll/b030;

.field public n:Lcom/p1/mobile/android/app/Act;

.field public o:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/businessdata/NewGiftInfoPanelWrapper;",
            ">;"
        }
    .end annotation
.end field

.field public p:Ljava/lang/Runnable;

.field public q:Ljava/lang/Runnable;

.field public r:I

.field public s:Ll/sz20;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/l030;->r:I

    .line 6
    .line 7
    iput-object p1, p0, Ll/l030;->n:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    return-void
.end method

.method private A(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l030;->b:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/l030;->d:Lv/VText;

    .line 7
    .line 8
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(Ll/l030;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/l030;->p(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/l030;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/l030;->n(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/l030;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/l030;->u()V

    return-void
.end method

.method public static synthetic d(Ll/l030;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/l030;->q()V

    return-void
.end method

.method public static synthetic e(Ll/l030;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/l030;->s(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V

    return-void
.end method

.method public static bridge synthetic f(Ll/l030;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l030;->o:Ljava/util/List;

    return-object p0
.end method

.method public static bridge synthetic i(Ll/l030;)Ll/b030;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l030;->m:Ll/b030;

    return-object p0
.end method

.method public static bridge synthetic j(Ll/l030;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/l030;->l()V

    return-void
.end method

.method private l()V
    .locals 3

    .line 1
    iget v0, p0, Ll/l030;->r:I

    .line 2
    .line 3
    iget-object v1, p0, Ll/l030;->a:Landroid/widget/FrameLayout;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/l030;->b:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 18
    .line 19
    iget-object v1, p0, Ll/l030;->m:Ll/b030;

    .line 20
    .line 21
    invoke-virtual {v1}, Ll/b030;->v()Ll/pz20;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iget v1, v1, Ll/pz20;->t:I

    .line 26
    .line 27
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 28
    .line 29
    iget-object v1, p0, Ll/l030;->m:Ll/b030;

    .line 30
    .line 31
    invoke-virtual {v1}, Ll/b030;->v()Ll/pz20;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    iget v1, v1, Ll/pz20;->t:I

    .line 36
    .line 37
    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 38
    .line 39
    add-int/2addr v1, v2

    .line 40
    iget-object v2, p0, Ll/l030;->a:Landroid/widget/FrameLayout;

    .line 41
    .line 42
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    sub-int/2addr v1, v2

    .line 47
    neg-int v1, v1

    .line 48
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 49
    .line 50
    iget-object v1, p0, Ll/l030;->b:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 51
    .line 52
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 53
    .line 54
    .line 55
    :cond_0
    iget-object v0, p0, Ll/l030;->a:Landroid/widget/FrameLayout;

    .line 56
    .line 57
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    iput v0, p0, Ll/l030;->r:I

    .line 62
    .line 63
    return-void
.end method

.method private synthetic n(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/l030;->m:Ll/b030;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/b030;->v()Ll/pz20;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Ll/pz20;->L()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const-string v0, "e_chat_gift_bar_recharge"

    .line 12
    .line 13
    invoke-static {v0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Ll/l030;->m:Ll/b030;

    .line 17
    .line 18
    invoke-virtual {p1}, Ll/b030;->v()Ll/pz20;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1}, Ll/pz20;->G()Lcom/p1/mobile/putong/data/CoreGiftPanelName;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    const-string v0, "note"

    .line 27
    .line 28
    invoke-static {v0}, Lcom/p1/mobile/putong/data/CoreGiftPanelName;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/CoreGiftPanelName;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    if-ne p1, v0, :cond_2

    .line 33
    .line 34
    iget-object p1, p0, Ll/l030;->m:Ll/b030;

    .line 35
    .line 36
    invoke-virtual {p1}, Ll/b030;->v()Ll/pz20;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p1}, Ll/pz20;->F()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    const-string v0, "from_meet_picks"

    .line 45
    .line 46
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-eqz p1, :cond_0

    .line 51
    .line 52
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    iget-object p0, p0, Ll/l030;->n:Lcom/p1/mobile/android/app/Act;

    .line 61
    .line 62
    const-string v0, "p_meet_view,e_meet_gift_bar_picks,click"

    .line 63
    .line 64
    invoke-interface {p1, p0, v0}, Ll/r97;->n4(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_0
    iget-object p1, p0, Ll/l030;->m:Ll/b030;

    .line 69
    .line 70
    invoke-virtual {p1}, Ll/b030;->v()Ll/pz20;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-virtual {p1}, Ll/pz20;->F()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    const-string v0, "from_meet_liked"

    .line 79
    .line 80
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    if-eqz p1, :cond_1

    .line 85
    .line 86
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    iget-object p0, p0, Ll/l030;->n:Lcom/p1/mobile/android/app/Act;

    .line 95
    .line 96
    const-string v0, "p_meet_view,e_meet_gift_bar_ilike,click"

    .line 97
    .line 98
    invoke-interface {p1, p0, v0}, Ll/r97;->n4(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    iget-object p0, p0, Ll/l030;->n:Lcom/p1/mobile/android/app/Act;

    .line 111
    .line 112
    const-string v0, "p_meet_view,e_meet_gift_bar,click"

    .line 113
    .line 114
    invoke-interface {p1, p0, v0}, Ll/r97;->n4(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    return-void

    .line 118
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    iget-object v0, p0, Ll/l030;->n:Lcom/p1/mobile/android/app/Act;

    .line 127
    .line 128
    iget-object p0, p0, Ll/l030;->m:Ll/b030;

    .line 129
    .line 130
    invoke-virtual {p0}, Ll/b030;->v()Ll/pz20;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    invoke-virtual {p0}, Ll/pz20;->L()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    const-string v1, "e_recharge"

    .line 139
    .line 140
    invoke-static {p0, v1}, Ll/vvj;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    invoke-interface {p1, v0, p0}, Ll/r97;->n4(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    return-void
.end method

.method private synthetic p(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/l030;->b:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->o()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/l030;->b:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->F()V

    .line 12
    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    invoke-direct {p0, p1}, Ll/l030;->A(Z)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-object p0, p0, Ll/l030;->m:Ll/b030;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/b030;->v()Ll/pz20;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Landroid/app/Dialog;->cancel()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method private synthetic q()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Ll/l030;->A(Z)V

    .line 3
    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-object v0, p0, Ll/l030;->p:Ljava/lang/Runnable;

    .line 7
    .line 8
    return-void
.end method

.method private synthetic s(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/l030;->l()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    invoke-direct {p0, v0}, Ll/l030;->A(Z)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/l030;->b:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 9
    .line 10
    new-instance v1, Ll/h030;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/h030;-><init>(Ll/l030;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, p1, v1}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->w(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Ll/x20;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->shopGuide:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iget-object p0, p0, Ll/l030;->d:Lv/VText;

    .line 27
    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    const-string p1, "\u8fd9\u4e2a\u793c\u7269\u5f88\u53d7\u6b22\u8fce\u54e6"

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 37
    .line 38
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->shopGuide:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method private synthetic u()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Ll/l030;->A(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method


# virtual methods
.method public B(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/l030;->d:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/l030;->d:Lv/VText;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ll/l030;->q:Ljava/lang/Runnable;

    .line 13
    .line 14
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    iget-object p1, p0, Ll/l030;->q:Ljava/lang/Runnable;

    .line 21
    .line 22
    invoke-static {p1}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object p1, p0, Ll/l030;->n:Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    new-instance v0, Ll/k030;

    .line 28
    .line 29
    invoke-direct {v0, p0}, Ll/k030;-><init>(Ll/l030;)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Ll/l030;->q:Ljava/lang/Runnable;

    .line 33
    .line 34
    const-wide/16 v1, 0x5dc

    .line 35
    .line 36
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public C()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l030;->b:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->E()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-direct {p0, v0}, Ll/l030;->A(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/l030;->n:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/b030;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/l030;->m(Ll/b030;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/l030;->k(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public k(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/m030;->b(Ll/l030;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public m(Ll/b030;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/l030;->m:Ll/b030;

    .line 2
    .line 3
    return-void
.end method

.method public r()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/l030;->f:Lv/VProgressBar;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/l030;->b:Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/gift/layer/CoreGiftLayer;->setEnableFrameCheck(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/l030;->l:Lv/VPager;

    .line 13
    .line 14
    iget-object v2, p0, Ll/l030;->m:Ll/b030;

    .line 15
    .line 16
    invoke-virtual {v2}, Ll/b030;->v()Ll/pz20;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {v2}, Ll/pz20;->H()Ll/sz20;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    iput-object v2, p0, Ll/l030;->s:Ll/sz20;

    .line 25
    .line 26
    invoke-virtual {v0, v2}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/l030;->l:Lv/VPager;

    .line 30
    .line 31
    new-instance v2, Ll/l030$a;

    .line 32
    .line 33
    invoke-direct {v2, p0}, Ll/l030$a;-><init>(Ll/l030;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v2}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/l030;->i:Lv/VFrame;

    .line 40
    .line 41
    new-instance v2, Ll/i030;

    .line 42
    .line 43
    invoke-direct {v2, p0}, Ll/i030;-><init>(Ll/l030;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v2}, Lv/VFrame;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Ll/l030;->m:Ll/b030;

    .line 50
    .line 51
    invoke-virtual {v0}, Ll/b030;->v()Ll/pz20;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v0}, Ll/pz20;->G()Lcom/p1/mobile/putong/data/CoreGiftPanelName;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    const-string v2, "note"

    .line 60
    .line 61
    invoke-static {v2}, Lcom/p1/mobile/putong/data/CoreGiftPanelName;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/CoreGiftPanelName;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    const/high16 v3, 0x41a00000    # 20.0f

    .line 66
    .line 67
    const/high16 v4, 0x41400000    # 12.0f

    .line 68
    .line 69
    const/4 v5, 0x0

    .line 70
    if-ne v0, v2, :cond_1

    .line 71
    .line 72
    iget-object v0, p0, Ll/l030;->k:Lcom/google/android/material/tabs/TabLayout;

    .line 73
    .line 74
    invoke-static {v0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Ll/l030;->j:Lv/VText;

    .line 78
    .line 79
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 80
    .line 81
    .line 82
    invoke-static {}, Ll/c17;->u0()Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-eqz v0, :cond_0

    .line 87
    .line 88
    const-string v0, "\u4ed6"

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_0
    const-string v0, "\u5979"

    .line 92
    .line 93
    :goto_0
    iget-object v1, p0, Ll/l030;->h:Landroid/widget/TextView;

    .line 94
    .line 95
    const-string v2, "%s\u4eca\u5929\u6536\u5230\u592a\u591a\u62db\u547c\u4e86"

    .line 96
    .line 97
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v6

    .line 101
    invoke-static {v2, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 106
    .line 107
    .line 108
    iget-object v1, p0, Ll/l030;->h:Landroid/widget/TextView;

    .line 109
    .line 110
    sget-object v2, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 111
    .line 112
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 113
    .line 114
    .line 115
    iget-object v1, p0, Ll/l030;->h:Landroid/widget/TextView;

    .line 116
    .line 117
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 118
    .line 119
    .line 120
    move-result v2

    .line 121
    invoke-static {v1, v2}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 122
    .line 123
    .line 124
    iget-object v1, p0, Ll/l030;->j:Lv/VText;

    .line 125
    .line 126
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 127
    .line 128
    .line 129
    move-result v2

    .line 130
    invoke-static {v1, v2}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 131
    .line 132
    .line 133
    iget-object v1, p0, Ll/l030;->j:Lv/VText;

    .line 134
    .line 135
    const-string v2, "\u5148\u5173\u6ce8%s\u6216\u9001\u4e2a\u5c0f\u793c\u7269\u8ba9%s\u6ce8\u610f\u5230\u4f60\u5427"

    .line 136
    .line 137
    filled-new-array {v0, v0}, [Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    invoke-static {v2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 146
    .line 147
    .line 148
    goto/16 :goto_1

    .line 149
    .line 150
    :cond_1
    iget-object v0, p0, Ll/l030;->m:Ll/b030;

    .line 151
    .line 152
    invoke-virtual {v0}, Ll/b030;->v()Ll/pz20;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    invoke-virtual {v0}, Ll/pz20;->G()Lcom/p1/mobile/putong/data/CoreGiftPanelName;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    const-string v2, "greet"

    .line 161
    .line 162
    invoke-static {v2}, Lcom/p1/mobile/putong/data/CoreGiftPanelName;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/CoreGiftPanelName;

    .line 163
    .line 164
    .line 165
    move-result-object v2

    .line 166
    iget-object v6, p0, Ll/l030;->k:Lcom/google/android/material/tabs/TabLayout;

    .line 167
    .line 168
    if-ne v0, v2, :cond_3

    .line 169
    .line 170
    invoke-static {v6, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 171
    .line 172
    .line 173
    iget-object v0, p0, Ll/l030;->j:Lv/VText;

    .line 174
    .line 175
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 176
    .line 177
    .line 178
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 179
    .line 180
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 181
    .line 182
    iget-object v2, p0, Ll/l030;->m:Ll/b030;

    .line 183
    .line 184
    invoke-virtual {v2}, Ll/b030;->v()Ll/pz20;

    .line 185
    .line 186
    .line 187
    move-result-object v2

    .line 188
    invoke-virtual {v2}, Ll/pz20;->N()Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object v2

    .line 192
    invoke-virtual {v0, v2}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 197
    .line 198
    .line 199
    move-result v2

    .line 200
    if-eqz v2, :cond_2

    .line 201
    .line 202
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 203
    .line 204
    .line 205
    move-result v0

    .line 206
    xor-int/2addr v1, v0

    .line 207
    :cond_2
    iget-object v0, p0, Ll/l030;->h:Landroid/widget/TextView;

    .line 208
    .line 209
    invoke-static {v1}, Ll/ggm;->b(Z)Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object v2

    .line 213
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 214
    .line 215
    .line 216
    iget-object v0, p0, Ll/l030;->j:Lv/VText;

    .line 217
    .line 218
    invoke-static {v1}, Ll/ggm;->a(Z)Ljava/lang/String;

    .line 219
    .line 220
    .line 221
    move-result-object v1

    .line 222
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 223
    .line 224
    .line 225
    iget-object v0, p0, Ll/l030;->h:Landroid/widget/TextView;

    .line 226
    .line 227
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 228
    .line 229
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 230
    .line 231
    .line 232
    iget-object v0, p0, Ll/l030;->h:Landroid/widget/TextView;

    .line 233
    .line 234
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 235
    .line 236
    .line 237
    move-result v1

    .line 238
    invoke-static {v0, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 239
    .line 240
    .line 241
    iget-object v0, p0, Ll/l030;->j:Lv/VText;

    .line 242
    .line 243
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 244
    .line 245
    .line 246
    move-result v1

    .line 247
    invoke-static {v0, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 248
    .line 249
    .line 250
    goto :goto_1

    .line 251
    :cond_3
    invoke-static {v6, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 252
    .line 253
    .line 254
    iget-object v0, p0, Ll/l030;->j:Lv/VText;

    .line 255
    .line 256
    invoke-static {v0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 257
    .line 258
    .line 259
    iget-object v0, p0, Ll/l030;->k:Lcom/google/android/material/tabs/TabLayout;

    .line 260
    .line 261
    invoke-virtual {v0, v5}, Lcom/google/android/material/tabs/TabLayout;->setTabMode(I)V

    .line 262
    .line 263
    .line 264
    iget-object v0, p0, Ll/l030;->k:Lcom/google/android/material/tabs/TabLayout;

    .line 265
    .line 266
    sget v1, Ll/ibc0;->c0:I

    .line 267
    .line 268
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->setSelectedTabIndicator(I)V

    .line 269
    .line 270
    .line 271
    iget-object v0, p0, Ll/l030;->k:Lcom/google/android/material/tabs/TabLayout;

    .line 272
    .line 273
    iget-object v1, p0, Ll/l030;->n:Lcom/p1/mobile/android/app/Act;

    .line 274
    .line 275
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 276
    .line 277
    .line 278
    move-result-object v1

    .line 279
    sget v2, Ll/g9c0;->o:I

    .line 280
    .line 281
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 282
    .line 283
    .line 284
    move-result v1

    .line 285
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->setSelectedTabIndicatorColor(I)V

    .line 286
    .line 287
    .line 288
    iget-object v0, p0, Ll/l030;->k:Lcom/google/android/material/tabs/TabLayout;

    .line 289
    .line 290
    invoke-virtual {v0, v5}, Lcom/google/android/material/tabs/TabLayout;->setTabIndicatorFullWidth(Z)V

    .line 291
    .line 292
    .line 293
    iget-object v0, p0, Ll/l030;->k:Lcom/google/android/material/tabs/TabLayout;

    .line 294
    .line 295
    sget v1, Ll/g9c0;->Y:I

    .line 296
    .line 297
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->setTabRippleColorResource(I)V

    .line 298
    .line 299
    .line 300
    iget-object v0, p0, Ll/l030;->k:Lcom/google/android/material/tabs/TabLayout;

    .line 301
    .line 302
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 303
    .line 304
    .line 305
    move-result v1

    .line 306
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->setSelectedTabIndicatorHeight(I)V

    .line 307
    .line 308
    .line 309
    iget-object v0, p0, Ll/l030;->k:Lcom/google/android/material/tabs/TabLayout;

    .line 310
    .line 311
    invoke-virtual {v0, v5}, Lcom/google/android/material/tabs/TabLayout;->setTabGravity(I)V

    .line 312
    .line 313
    .line 314
    iget-object v0, p0, Ll/l030;->k:Lcom/google/android/material/tabs/TabLayout;

    .line 315
    .line 316
    new-instance v1, Ll/l030$b;

    .line 317
    .line 318
    invoke-direct {v1, p0}, Ll/l030$b;-><init>(Ll/l030;)V

    .line 319
    .line 320
    .line 321
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->addOnTabSelectedListener(Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;)V

    .line 322
    .line 323
    .line 324
    iget-object v0, p0, Ll/l030;->k:Lcom/google/android/material/tabs/TabLayout;

    .line 325
    .line 326
    iget-object v1, p0, Ll/l030;->l:Lv/VPager;

    .line 327
    .line 328
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->setupWithViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 329
    .line 330
    .line 331
    :goto_1
    iget-object v0, p0, Ll/l030;->l:Lv/VPager;

    .line 332
    .line 333
    invoke-virtual {v0, v5}, Lv/VPager;->setScrollble(Z)V

    .line 334
    .line 335
    .line 336
    iget-object v0, p0, Ll/l030;->c:Landroid/widget/FrameLayout;

    .line 337
    .line 338
    new-instance v1, Ll/j030;

    .line 339
    .line 340
    invoke-direct {v1, p0}, Ll/j030;-><init>(Ll/l030;)V

    .line 341
    .line 342
    .line 343
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 344
    .line 345
    .line 346
    iget-object v0, p0, Ll/l030;->l:Lv/VPager;

    .line 347
    .line 348
    const/16 v1, 0xa

    .line 349
    .line 350
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setOffscreenPageLimit(I)V

    .line 351
    .line 352
    .line 353
    iget-object v0, p0, Ll/l030;->a:Landroid/widget/FrameLayout;

    .line 354
    .line 355
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 356
    .line 357
    .line 358
    move-result-object v0

    .line 359
    new-instance v1, Ll/l030$c;

    .line 360
    .line 361
    invoke-direct {v1, p0}, Ll/l030$c;-><init>(Ll/l030;)V

    .line 362
    .line 363
    .line 364
    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 365
    .line 366
    .line 367
    return-void
.end method

.method public v()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/l030;->m:Ll/b030;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/b030;->v()Ll/pz20;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/pz20;->G()Lcom/p1/mobile/putong/data/CoreGiftPanelName;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "note"

    .line 12
    .line 13
    invoke-static {v1}, Lcom/p1/mobile/putong/data/CoreGiftPanelName;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/CoreGiftPanelName;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget-object v2, p0, Ll/l030;->g:Lv/VDraweeView;

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    if-ne v0, v1, :cond_0

    .line 21
    .line 22
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    new-instance v0, Ll/l030$d;

    .line 30
    .line 31
    invoke-direct {v0, p0}, Ll/l030$d;-><init>(Ll/l030;)V

    .line 32
    .line 33
    .line 34
    const-string v1, "asset:///core_giftpanel_ic_gif.gif"

    .line 35
    .line 36
    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-static {}, Ll/f9j;->g()Ll/lq70;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {v2, v1}, Ll/lq70;->N(Landroid/net/Uri;)Ll/lq70;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    iget-object v2, p0, Ll/l030;->g:Lv/VDraweeView;

    .line 49
    .line 50
    invoke-virtual {v2}, Lcom/facebook/drawee/view/DraweeView;->getController()Ll/lde;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-virtual {v1, v2}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->E(Ll/lde;)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    check-cast v1, Ll/lq70;

    .line 59
    .line 60
    const/4 v2, 0x1

    .line 61
    invoke-virtual {v1, v2}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->z(Z)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    check-cast v1, Ll/lq70;

    .line 66
    .line 67
    invoke-virtual {v1, v0}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->B(Ll/v36;)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    check-cast v0, Ll/lq70;

    .line 72
    .line 73
    iget-object p0, p0, Ll/l030;->g:Lv/VDraweeView;

    .line 74
    .line 75
    invoke-virtual {v0}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->c()Ll/c7;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {p0, v0}, Lv/VDraweeView;->setController(Ll/lde;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public w(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l030;->q:Ljava/lang/Runnable;

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
    iget-object v0, p0, Ll/l030;->q:Ljava/lang/Runnable;

    .line 10
    .line 11
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-object v0, p0, Ll/l030;->q:Ljava/lang/Runnable;

    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Ll/l030;->p:Ljava/lang/Runnable;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    iget-object v0, p0, Ll/l030;->p:Ljava/lang/Runnable;

    .line 26
    .line 27
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 28
    .line 29
    .line 30
    :cond_1
    iget-object v0, p0, Ll/l030;->n:Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    new-instance v1, Ll/g030;

    .line 33
    .line 34
    invoke-direct {v1, p0, p1}, Ll/g030;-><init>(Ll/l030;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V

    .line 35
    .line 36
    .line 37
    iput-object v1, p0, Ll/l030;->p:Ljava/lang/Runnable;

    .line 38
    .line 39
    const-wide/16 p0, 0x96

    .line 40
    .line 41
    invoke-static {v0, v1, p0, p1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public x(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/businessdata/NewGiftInfoPanelWrapper;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/l030;->o:Ljava/util/List;

    .line 2
    .line 3
    iget-object v0, p0, Ll/l030;->f:Lv/VProgressBar;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/l030;->m:Ll/b030;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/b030;->v()Ll/pz20;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/pz20;->H()Ll/sz20;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0, p1}, Ll/sz20;->q(Ljava/util/List;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public y(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l030;->h:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/l030;->j:Lv/VText;

    .line 7
    .line 8
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public z(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getCustomView()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Landroid/widget/TextView;

    .line 8
    .line 9
    iget-object p0, p0, Ll/l030;->n:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getText()Ljava/lang/CharSequence;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-virtual {p0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 27
    .line 28
    .line 29
    const/16 p0, 0x11

    .line 30
    .line 31
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setGravity(I)V

    .line 32
    .line 33
    .line 34
    new-instance p0, Landroid/view/ViewGroup$LayoutParams;

    .line 35
    .line 36
    const/4 v1, -0x1

    .line 37
    const/4 v2, -0x2

    .line 38
    invoke-direct {p0, v1, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, v0}, Lcom/google/android/material/tabs/TabLayout$Tab;->setCustomView(Landroid/view/View;)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 45
    .line 46
    .line 47
    :cond_0
    return-void
.end method
