.class public Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;
.super Lcom/p1/mobile/putong/live/livingroom/archi/act/LivingBaseAct;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/archi/act/LivingBaseAct;",
        "Ll/iam<",
        "Ll/w7s;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Lv/VDraweeView;

.field public d:Lv/VImage;

.field public e:Lv/VDraweeView;

.field public f:Lv/VButton;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public j:Lv/VButton;

.field public k:Ll/w7s;

.field public l:Lcom/p1/mobile/putong/data/Picture;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LivingBaseAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;->g2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;->h2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Z1(Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;->k2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic a2(Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;->i2(Landroid/view/View;)V

    return-void
.end method

.method public static c2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "old_room_info_tag"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p0, "from_tag"

    .line 14
    .line 15
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method private synthetic g2(Landroid/view/View;)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    move-object v0, p0

    .line 6
    check-cast v0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 7
    .line 8
    const/4 v4, 0x1

    .line 9
    const-string v5, "from_change_anchor_cover"

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    const/4 v2, 0x0

    .line 13
    const/4 v3, 0x0

    .line 14
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/app/PutongAct;->pickImagesWithPicker(IZZZLjava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private synthetic h2(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic i2(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;->k:Ll/w7s;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/w7s;->D0(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic k2(Landroid/view/View;)V
    .locals 0

    .line 1
    sget-object p1, Ll/efv;->c:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/base/webview/LiveWebViewAct;->d2(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public A3(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->setTransparentStatusBar()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;->d:Lv/VImage;

    .line 5
    .line 6
    invoke-static {}, Ll/bnl0;->F0()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    sget v2, Ll/qa00;->h:I

    .line 11
    .line 12
    add-int/2addr v1, v2

    .line 13
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;->e:Lv/VDraweeView;

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 23
    .line 24
    invoke-static {}, Ll/bnl0;->y0()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    const/high16 v2, 0x42000000    # 32.0f

    .line 29
    .line 30
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    sub-int/2addr v1, v2

    .line 35
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 36
    .line 37
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;->e:Lv/VDraweeView;

    .line 40
    .line 41
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;->f:Lv/VButton;

    .line 45
    .line 46
    new-instance v1, Ll/g7s;

    .line 47
    .line 48
    invoke-direct {v1, p0}, Ll/g7s;-><init>(Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;)V

    .line 49
    .line 50
    .line 51
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;->d:Lv/VImage;

    .line 55
    .line 56
    new-instance v1, Ll/h7s;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/h7s;-><init>(Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;->j:Lv/VButton;

    .line 65
    .line 66
    new-instance v1, Ll/i7s;

    .line 67
    .line 68
    invoke-direct {v1, p0}, Ll/i7s;-><init>(Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;)V

    .line 69
    .line 70
    .line 71
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 72
    .line 73
    .line 74
    const-string v0, "from_voice"

    .line 75
    .line 76
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;->i:Lv/VText;

    .line 81
    .line 82
    const/4 v2, 0x0

    .line 83
    if-eqz p1, :cond_0

    .line 84
    .line 85
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 86
    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_0
    new-instance p1, Ll/j7s;

    .line 90
    .line 91
    invoke-direct {p1, p0}, Ll/j7s;-><init>(Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;)V

    .line 92
    .line 93
    .line 94
    invoke-static {v1, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 95
    .line 96
    .line 97
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;->l:Lcom/p1/mobile/putong/data/Picture;

    .line 98
    .line 99
    if-eqz p1, :cond_1

    .line 100
    .line 101
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 102
    .line 103
    invoke-virtual {p0, v2, p1}, Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;->l2(ZLjava/lang/String;)V

    .line 104
    .line 105
    .line 106
    :cond_1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    const-string v1, "from_tag"

    .line 111
    .line 112
    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 117
    .line 118
    .line 119
    move-result p1

    .line 120
    if-eqz p1, :cond_2

    .line 121
    .line 122
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;->g:Lv/VText;

    .line 123
    .line 124
    const-string v0, "\u8bed\u97f3\u623f\u5c01\u9762"

    .line 125
    .line 126
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 127
    .line 128
    .line 129
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;->h:Lv/VText;

    .line 130
    .line 131
    const-string p1, "\u5c01\u9762\u4e3a\u4eba\u5de5\u5ba1\u6838\uff0c\u8bf7\u52ff\u4e0a\u4f20\u66b4\u9732/\u6a21\u7cca\u7684\u7167\u7247\uff0c\u5c01\u9762\u5982\u5728\u5ba1\u6838\u4e2d/\u88ab\u9a73\u56de\uff0c\u4f1a\u4fdd\u6301\u539f\u5c01\u9762\u4e0d\u53d8"

    .line 132
    .line 133
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 134
    .line 135
    .line 136
    :cond_2
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    return-object p0
.end method

.method public b2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/k7s;->b(Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d2(Ll/w7s;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;->k:Ll/w7s;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public e2()Lcom/p1/mobile/putong/data/Picture;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;->l:Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/w7s;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;->d2(Ll/w7s;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;->b2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public initDataOnCreate()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/w7s;

    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    invoke-direct {v0, v1, v1}, Ll/w7s;-><init>(Lcom/p1/mobile/android/app/Act;Ll/ner;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ll/ar2;->C(Ll/iam;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public initSubscription()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;->k:Ll/w7s;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/w7s;->a0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public l2(ZLjava/lang/String;)V
    .locals 4

    .line 1
    const/high16 v0, 0x41a00000    # 20.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;->e:Lv/VDraweeView;

    .line 8
    .line 9
    const-string v2, "context_livingAct"

    .line 10
    .line 11
    invoke-static {v2, v1, p2}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;->c:Lv/VDraweeView;

    .line 15
    .line 16
    const/4 v3, 0x1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    invoke-static {v2, v1, p2, v3, v0}, Ll/izs;->p(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-static {v1, p2, v3, v0}, Ll/izs;->q(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;->j:Lv/VButton;

    .line 27
    .line 28
    invoke-virtual {p0, v3}, Landroid/view/View;->setEnabled(Z)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public onPickImagesResult(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 13
    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;->l:Lcom/p1/mobile/putong/data/Picture;

    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;->j:Lv/VButton;

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    invoke-virtual {p1, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;->l:Lcom/p1/mobile/putong/data/Picture;

    .line 23
    .line 24
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;->l2(ZLjava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public onRestoreGlobalState(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->onRestoreGlobalState(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "changed_picture"

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 11
    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;->l:Lcom/p1/mobile/putong/data/Picture;

    .line 13
    .line 14
    return-void
.end method

.method public onSaveGlobalState(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->onSaveGlobalState(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;->l:Lcom/p1/mobile/putong/data/Picture;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    const-string v0, "changed_picture"

    .line 9
    .line 10
    invoke-virtual {p1, v0, p0}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->preCreateView(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;->k:Ll/w7s;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const-string v1, "old_room_info_tag"

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const-string v1, "from_tag"

    .line 21
    .line 22
    invoke-virtual {p0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p1, v0, p0}, Ll/w7s;->C0(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method
