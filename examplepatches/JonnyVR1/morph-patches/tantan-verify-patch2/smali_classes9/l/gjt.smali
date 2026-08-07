.class public Ll/gjt;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Landroid/view/View;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lv/VLinear;

.field public c:Lv/VDraweeView;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VFrame;

.field public g:Lv/VDraweeView;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public j:Lv/VFrame;

.field public k:Lv/VDraweeView;

.field public l:Lv/VText;

.field public m:Lv/VText;

.field public n:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;

.field public o:Ll/vit;

.field public p:I


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;Ll/vit;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/gjt;->p:I

    .line 6
    .line 7
    iput-object p1, p0, Ll/gjt;->n:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;

    .line 8
    .line 9
    iput-object p2, p0, Ll/gjt;->o:Ll/vit;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic H(Ll/gjt;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gjt;->O(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic I(Ll/gjt;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/gjt;->P(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic J(Ll/gjt;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/gjt;->N(Landroid/view/View;)V

    return-void
.end method

.method private synthetic N(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/gjt;->o:Ll/vit;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Ll/gjt;->n:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;->level2SuggestedLives:Ljava/util/List;

    .line 8
    .line 9
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Ll/gjt;->o:Ll/vit;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/gjt;->p()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v1, p0, Ll/gjt;->n:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;

    .line 22
    .line 23
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;->level2SuggestedLives:Ljava/util/List;

    .line 24
    .line 25
    const/4 v2, 0x0

    .line 26
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 31
    .line 32
    invoke-virtual {p1, v0, v1}, Ll/vit;->W3(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Ll/gjt;->p()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    iget-object p0, p0, Ll/gjt;->n:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;->level2SuggestedLives:Ljava/util/List;

    .line 42
    .line 43
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 48
    .line 49
    invoke-static {p1, p0}, Ll/amd0;->a(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)V

    .line 50
    .line 51
    .line 52
    :cond_0
    return-void
.end method

.method private synthetic P(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/gjt;->o:Ll/vit;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const-string p1, "e_exit_first_click"

    .line 6
    .line 7
    const-string v0, "p_live_exit_popup"

    .line 8
    .line 9
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ll/gjt;->o:Ll/vit;

    .line 13
    .line 14
    iget-object p0, p0, Ll/gjt;->n:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;->pageViewId:Ljava/lang/String;

    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    invoke-virtual {p1, v0, p0}, Ll/vit;->b4(ZLjava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method


# virtual methods
.method public final K(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/hjt;->a(Ll/gjt;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public L(Landroid/view/View;I)V
    .locals 0

    .line 1
    invoke-static {p2}, Ll/vl4;->e(I)I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    iput p2, p0, Ll/gjt;->p:I

    .line 6
    .line 7
    invoke-static {p1, p2}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 8
    .line 9
    .line 10
    sget p2, Ll/qa00;->j:I

    .line 11
    .line 12
    invoke-static {p1, p2}, Ll/ynp0;->m(Landroid/view/View;I)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Ll/gjt;->g:Lv/VDraweeView;

    .line 16
    .line 17
    sget p2, Ll/qa00;->o:I

    .line 18
    .line 19
    invoke-static {p1, p2}, Ll/ynp0;->m(Landroid/view/View;I)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/gjt;->k:Lv/VDraweeView;

    .line 23
    .line 24
    invoke-static {p0, p2}, Ll/ynp0;->m(Landroid/view/View;I)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic O(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/gjt;->n:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;->level2SuggestedLives:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Ll/gjt;->n:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;->level2SuggestedLives:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    const/4 v0, 0x1

    .line 20
    if-le p1, v0, :cond_0

    .line 21
    .line 22
    iget-object p1, p0, Ll/gjt;->o:Ll/vit;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/gjt;->p()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iget-object v2, p0, Ll/gjt;->n:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;

    .line 29
    .line 30
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;->level2SuggestedLives:Ljava/util/List;

    .line 31
    .line 32
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 37
    .line 38
    invoke-virtual {p1, v1, v2}, Ll/vit;->W3(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ll/gjt;->p()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iget-object p0, p0, Ll/gjt;->n:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;

    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;->level2SuggestedLives:Ljava/util/List;

    .line 48
    .line 49
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 54
    .line 55
    invoke-static {p1, p0}, Ll/amd0;->a(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)V

    .line 56
    .line 57
    .line 58
    :cond_0
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->Y5:I

    .line 2
    .line 3
    return p0
.end method

.method public p()Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const-string p0, "p_live_exit_popup"

    .line 2
    .line 3
    return-object p0
.end method

.method public q()I
    .locals 0

    .line 1
    const/4 p0, 0x3

    .line 2
    return p0
.end method

.method public u(Landroid/view/View;)V
    .locals 5

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/gjt;->n:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    goto/16 :goto_0

    .line 9
    .line 10
    :cond_0
    invoke-virtual {p0, p1}, Ll/gjt;->K(Landroid/view/View;)V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    invoke-virtual {p0, p1, v0}, Ll/gjt;->L(Landroid/view/View;I)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Ll/gjt;->f:Lv/VFrame;

    .line 18
    .line 19
    new-instance v1, Ll/djt;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/djt;-><init>(Ll/gjt;)V

    .line 22
    .line 23
    .line 24
    invoke-static {p1, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Ll/gjt;->j:Lv/VFrame;

    .line 28
    .line 29
    new-instance v1, Ll/ejt;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/ejt;-><init>(Ll/gjt;)V

    .line 32
    .line 33
    .line 34
    invoke-static {p1, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Ll/gjt;->b:Lv/VLinear;

    .line 38
    .line 39
    new-instance v1, Ll/fjt;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/fjt;-><init>(Ll/gjt;)V

    .line 42
    .line 43
    .line 44
    invoke-static {p1, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Ll/gjt;->a:Lv/VDraweeView;

    .line 48
    .line 49
    iget-object v1, p0, Ll/gjt;->n:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;

    .line 50
    .line 51
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;->recommendPolicyImage:Ljava/lang/String;

    .line 52
    .line 53
    const-string v2, "context_single_room"

    .line 54
    .line 55
    invoke-static {v2, p1, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    iget-object p1, p0, Ll/gjt;->c:Lv/VDraweeView;

    .line 59
    .line 60
    iget-object v1, p0, Ll/gjt;->n:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;

    .line 61
    .line 62
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;->recommendPolicyIcon:Ljava/lang/String;

    .line 63
    .line 64
    invoke-static {v2, p1, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Ll/gjt;->d:Lv/VText;

    .line 68
    .line 69
    iget-object v1, p0, Ll/gjt;->n:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;

    .line 70
    .line 71
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;->recommendPolicyName:Ljava/lang/String;

    .line 72
    .line 73
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 74
    .line 75
    .line 76
    iget-object p1, p0, Ll/gjt;->n:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;

    .line 77
    .line 78
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;->level2SuggestedLives:Ljava/util/List;

    .line 79
    .line 80
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    if-eqz p1, :cond_1

    .line 85
    .line 86
    goto/16 :goto_0

    .line 87
    .line 88
    :cond_1
    iget-object p1, p0, Ll/gjt;->e:Lv/VText;

    .line 89
    .line 90
    iget-object v1, p0, Ll/gjt;->n:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;

    .line 91
    .line 92
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;->level2SuggestedLives:Ljava/util/List;

    .line 93
    .line 94
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 103
    .line 104
    .line 105
    iget-object p1, p0, Ll/gjt;->n:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;

    .line 106
    .line 107
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;->level2SuggestedLives:Ljava/util/List;

    .line 108
    .line 109
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 110
    .line 111
    .line 112
    move-result p1

    .line 113
    const/4 v1, 0x1

    .line 114
    if-lt p1, v1, :cond_2

    .line 115
    .line 116
    iget-object p1, p0, Ll/gjt;->n:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;

    .line 117
    .line 118
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;->level2SuggestedLives:Ljava/util/List;

    .line 119
    .line 120
    const/4 v3, 0x0

    .line 121
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    if-eqz p1, :cond_2

    .line 126
    .line 127
    iget-object p1, p0, Ll/gjt;->g:Lv/VDraweeView;

    .line 128
    .line 129
    iget-object v4, p0, Ll/gjt;->n:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;

    .line 130
    .line 131
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;->level2SuggestedLives:Ljava/util/List;

    .line 132
    .line 133
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object v4

    .line 137
    check-cast v4, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 138
    .line 139
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;

    .line 140
    .line 141
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;->profilePicture:Ljava/lang/String;

    .line 142
    .line 143
    invoke-static {v2, p1, v4}, Ll/izs;->o(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    iget-object p1, p0, Ll/gjt;->h:Lv/VText;

    .line 147
    .line 148
    iget-object v4, p0, Ll/gjt;->n:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;

    .line 149
    .line 150
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;->level2SuggestedLives:Ljava/util/List;

    .line 151
    .line 152
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    move-result-object v4

    .line 156
    check-cast v4, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 157
    .line 158
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;

    .line 159
    .line 160
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;->name:Ljava/lang/String;

    .line 161
    .line 162
    invoke-virtual {p1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 163
    .line 164
    .line 165
    invoke-virtual {p0}, Ll/gjt;->p()Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    iget-object v4, p0, Ll/gjt;->n:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;

    .line 170
    .line 171
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;->level2SuggestedLives:Ljava/util/List;

    .line 172
    .line 173
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    move-result-object v3

    .line 177
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 178
    .line 179
    invoke-static {p1, v3}, Ll/amd0;->b(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)V

    .line 180
    .line 181
    .line 182
    :cond_2
    iget-object p1, p0, Ll/gjt;->n:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;

    .line 183
    .line 184
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;->level2SuggestedLives:Ljava/util/List;

    .line 185
    .line 186
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 187
    .line 188
    .line 189
    move-result p1

    .line 190
    if-lt p1, v0, :cond_3

    .line 191
    .line 192
    iget-object p1, p0, Ll/gjt;->n:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;

    .line 193
    .line 194
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;->level2SuggestedLives:Ljava/util/List;

    .line 195
    .line 196
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 197
    .line 198
    .line 199
    move-result-object p1

    .line 200
    if-eqz p1, :cond_3

    .line 201
    .line 202
    iget-object p1, p0, Ll/gjt;->k:Lv/VDraweeView;

    .line 203
    .line 204
    iget-object v0, p0, Ll/gjt;->n:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;

    .line 205
    .line 206
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;->level2SuggestedLives:Ljava/util/List;

    .line 207
    .line 208
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 209
    .line 210
    .line 211
    move-result-object v0

    .line 212
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 213
    .line 214
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;

    .line 215
    .line 216
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;->profilePicture:Ljava/lang/String;

    .line 217
    .line 218
    invoke-static {v2, p1, v0}, Ll/izs;->o(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 219
    .line 220
    .line 221
    iget-object p1, p0, Ll/gjt;->l:Lv/VText;

    .line 222
    .line 223
    iget-object v0, p0, Ll/gjt;->n:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;

    .line 224
    .line 225
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;->level2SuggestedLives:Ljava/util/List;

    .line 226
    .line 227
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 232
    .line 233
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;

    .line 234
    .line 235
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;->name:Ljava/lang/String;

    .line 236
    .line 237
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 238
    .line 239
    .line 240
    invoke-virtual {p0}, Ll/gjt;->p()Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    move-result-object p1

    .line 244
    iget-object p0, p0, Ll/gjt;->n:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;

    .line 245
    .line 246
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;->level2SuggestedLives:Ljava/util/List;

    .line 247
    .line 248
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 249
    .line 250
    .line 251
    move-result-object p0

    .line 252
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 253
    .line 254
    invoke-static {p1, p0}, Ll/amd0;->b(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)V

    .line 255
    .line 256
    .line 257
    :cond_3
    :goto_0
    return-void
.end method
