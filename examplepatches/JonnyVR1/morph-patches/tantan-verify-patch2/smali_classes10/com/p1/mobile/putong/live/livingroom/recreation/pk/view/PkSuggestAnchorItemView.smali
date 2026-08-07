.class public Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkSuggestAnchorItemView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/TextView;

.field public b:Lv/VDraweeView;

.field public c:Landroid/widget/TextView;

.field public d:Landroid/widget/TextView;

.field public e:Landroid/widget/TextView;

.field public f:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Ll/z20;Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;->source:Lcom/p1/mobile/putong/live/base/data/BLivePkInviteSource;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic b(Ll/z20;Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;->source:Lcom/p1/mobile/putong/live/base/data/BLivePkInviteSource;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/na80;->a(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkSuggestAnchorItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;Ll/z20;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "*>;",
            "Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;",
            "Ll/z20<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;",
            "Lcom/p1/mobile/putong/live/base/data/BLivePkInviteSource;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkSuggestAnchorItemView;->c:Landroid/widget/TextView;

    .line 2
    .line 3
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;->userName:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkSuggestAnchorItemView;->b:Lv/VDraweeView;

    .line 9
    .line 10
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;->avatar:Ljava/lang/String;

    .line 11
    .line 12
    const/high16 v1, 0x425c0000    # 55.0f

    .line 13
    .line 14
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    const-string v2, "context_single_room"

    .line 19
    .line 20
    invoke-static {v2, p1, v0, v1}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkSuggestAnchorItemView;->d:Landroid/widget/TextView;

    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkSuggestAnchorItemView;->d:Landroid/widget/TextView;

    .line 30
    .line 31
    new-instance v0, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    const-string v1, "\u63a2\u63a2ID:"

    .line 34
    .line 35
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;->publicId:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkSuggestAnchorItemView;->a:Landroid/widget/TextView;

    .line 51
    .line 52
    const/4 v0, 0x0

    .line 53
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkSuggestAnchorItemView;->e:Landroid/widget/TextView;

    .line 57
    .line 58
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkSuggestAnchorItemView;->e(Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;)V

    .line 62
    .line 63
    .line 64
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkSuggestAnchorItemView;->e:Landroid/widget/TextView;

    .line 65
    .line 66
    new-instance p1, Ll/ma80;

    .line 67
    .line 68
    invoke-direct {p1, p3, p2}, Ll/ma80;-><init>(Ll/z20;Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;)V

    .line 69
    .line 70
    .line 71
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public final e(Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;->userId:Ljava/lang/String;

    .line 2
    .line 3
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkSuggestAnchorItemView;->f:Landroid/widget/TextView;

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkSuggestAnchorItemView;->e:Landroid/widget/TextView;

    .line 22
    .line 23
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;->isOnlive:Z

    .line 31
    .line 32
    const/4 v1, 0x1

    .line 33
    if-nez v0, :cond_1

    .line 34
    .line 35
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkSuggestAnchorItemView;->f:Landroid/widget/TextView;

    .line 36
    .line 37
    const-string v0, "\u6682\u672a\u5f00\u64ad"

    .line 38
    .line 39
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkSuggestAnchorItemView;->f:Landroid/widget/TextView;

    .line 43
    .line 44
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_1
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;->refusePk:Z

    .line 49
    .line 50
    if-eqz v0, :cond_2

    .line 51
    .line 52
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkSuggestAnchorItemView;->f:Landroid/widget/TextView;

    .line 53
    .line 54
    const-string v0, "\u4e0d\u63a5\u53d7\u9080\u8bf7"

    .line 55
    .line 56
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkSuggestAnchorItemView;->f:Landroid/widget/TextView;

    .line 60
    .line 61
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_2
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;->isPking:Z

    .line 66
    .line 67
    if-eqz p1, :cond_3

    .line 68
    .line 69
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkSuggestAnchorItemView;->f:Landroid/widget/TextView;

    .line 70
    .line 71
    const-string v0, "\u6b63\u5728PK"

    .line 72
    .line 73
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 74
    .line 75
    .line 76
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkSuggestAnchorItemView;->f:Landroid/widget/TextView;

    .line 77
    .line 78
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkSuggestAnchorItemView;->e:Landroid/widget/TextView;

    .line 83
    .line 84
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public f(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;Ll/z20;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "*>;",
            "Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;",
            "Ll/z20<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;",
            "Lcom/p1/mobile/putong/live/base/data/BLivePkInviteSource;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkSuggestAnchorItemView;->c:Landroid/widget/TextView;

    .line 2
    .line 3
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;->userName:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkSuggestAnchorItemView;->b:Lv/VDraweeView;

    .line 9
    .line 10
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;->avatar:Ljava/lang/String;

    .line 11
    .line 12
    const/high16 v2, 0x425c0000    # 55.0f

    .line 13
    .line 14
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    const-string v3, "context_single_room"

    .line 19
    .line 20
    invoke-static {v3, v0, v1, v2}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkSuggestAnchorItemView;->d:Landroid/widget/TextView;

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkSuggestAnchorItemView;->e:Landroid/widget/TextView;

    .line 30
    .line 31
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkSuggestAnchorItemView;->a:Landroid/widget/TextView;

    .line 35
    .line 36
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkSuggestAnchorItemView;->e(Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;->source:Lcom/p1/mobile/putong/live/base/data/BLivePkInviteSource;

    .line 43
    .line 44
    const-string v1, "hour"

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/data/BLivePkInviteSource;->equals(Ljava/lang/String;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_0

    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkSuggestAnchorItemView;->a:Landroid/widget/TextView;

    .line 53
    .line 54
    const/4 v1, 0x1

    .line 55
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkSuggestAnchorItemView;->a:Landroid/widget/TextView;

    .line 59
    .line 60
    iget v1, p2, Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;->rank:I

    .line 61
    .line 62
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 67
    .line 68
    .line 69
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkSuggestAnchorItemView;->e:Landroid/widget/TextView;

    .line 70
    .line 71
    new-instance v0, Ll/la80;

    .line 72
    .line 73
    invoke-direct {v0, p3, p2}, Ll/la80;-><init>(Ll/z20;Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;)V

    .line 74
    .line 75
    .line 76
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 77
    .line 78
    .line 79
    iget-object p0, p1, Ll/dum;->h:Ll/oo2;

    .line 80
    .line 81
    invoke-virtual {p0}, Ll/oo2;->j0()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    const-string p3, "anchorId"

    .line 86
    .line 87
    invoke-static {p3, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    iget-object p1, p1, Ll/dum;->h:Ll/oo2;

    .line 92
    .line 93
    invoke-virtual {p1}, Ll/vp20;->k()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    const-string p3, "liveId"

    .line 98
    .line 99
    invoke-static {p3, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    const-string p3, "other_user_id"

    .line 104
    .line 105
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;->userId:Ljava/lang/String;

    .line 106
    .line 107
    invoke-static {p3, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 108
    .line 109
    .line 110
    move-result-object p3

    .line 111
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;->source:Lcom/p1/mobile/putong/live/base/data/BLivePkInviteSource;

    .line 112
    .line 113
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object p2

    .line 117
    const-string v0, "page_tab_type"

    .line 118
    .line 119
    invoke-static {v0, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 120
    .line 121
    .line 122
    move-result-object p2

    .line 123
    filled-new-array {p0, p1, p3, p2}, [Ll/pf60;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    const-string p1, "e_pk_invite_button"

    .line 128
    .line 129
    const-string p2, "p_anchor_live_room"

    .line 130
    .line 131
    invoke-static {p1, p2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 132
    .line 133
    .line 134
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkSuggestAnchorItemView;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkSuggestAnchorItemView;->a:Landroid/widget/TextView;

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-static {v0}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
