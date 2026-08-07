.class public Ll/agg;
.super Landroidx/recyclerview/widget/RecyclerView$e0;
.source "SourceFile"


# instance fields
.field public a:Z

.field public b:Lv/VDraweeView;

.field public c:Lcom/p1/mobile/putong/live/base/business/fansgroup/UserAgeGenderView;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public j:Ll/otl;


# direct methods
.method public constructor <init>(Landroid/view/View;Z)V
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$e0;-><init>(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iput-boolean p2, p0, Ll/agg;->a:Z

    .line 5
    .line 6
    invoke-direct {p0, p1}, Ll/agg;->c(Landroid/view/View;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic a(Ll/agg;Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupAuditsItemBean;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/agg;->e(Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupAuditsItemBean;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/agg;Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupAuditsItemBean;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/agg;->d(Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupAuditsItemBean;Landroid/view/View;)V

    return-void
.end method

.method private c(Landroid/view/View;)V
    .locals 1

    .line 1
    sget v0, Ll/jdc0;->i1:I

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lv/VDraweeView;

    .line 8
    .line 9
    iput-object v0, p0, Ll/agg;->b:Lv/VDraweeView;

    .line 10
    .line 11
    sget v0, Ll/jdc0;->k1:I

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lv/VText;

    .line 18
    .line 19
    iput-object v0, p0, Ll/agg;->d:Lv/VText;

    .line 20
    .line 21
    sget v0, Ll/jdc0;->O:I

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lcom/p1/mobile/putong/live/base/business/fansgroup/UserAgeGenderView;

    .line 28
    .line 29
    iput-object v0, p0, Ll/agg;->c:Lcom/p1/mobile/putong/live/base/business/fansgroup/UserAgeGenderView;

    .line 30
    .line 31
    sget v0, Ll/jdc0;->d:I

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lv/VText;

    .line 38
    .line 39
    iput-object v0, p0, Ll/agg;->e:Lv/VText;

    .line 40
    .line 41
    sget v0, Ll/jdc0;->e:I

    .line 42
    .line 43
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Lv/VText;

    .line 48
    .line 49
    iput-object v0, p0, Ll/agg;->f:Lv/VText;

    .line 50
    .line 51
    sget v0, Ll/jdc0;->a:I

    .line 52
    .line 53
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    check-cast v0, Lv/VText;

    .line 58
    .line 59
    iput-object v0, p0, Ll/agg;->g:Lv/VText;

    .line 60
    .line 61
    sget v0, Ll/jdc0;->A0:I

    .line 62
    .line 63
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    check-cast v0, Lv/VText;

    .line 68
    .line 69
    iput-object v0, p0, Ll/agg;->h:Lv/VText;

    .line 70
    .line 71
    sget v0, Ll/jdc0;->b:I

    .line 72
    .line 73
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    check-cast p1, Lv/VText;

    .line 78
    .line 79
    iput-object p1, p0, Ll/agg;->i:Lv/VText;

    .line 80
    .line 81
    return-void
.end method


# virtual methods
.method public final synthetic d(Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupAuditsItemBean;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p2, p0, Ll/agg;->j:Ll/otl;

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$e0;->getAdapterPosition()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupAuditsItemBean;->getGroupId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupAuditsItemBean;->getId()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-interface {p2, p0, v0, p1}, Ll/otl;->b(ILjava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public final synthetic e(Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupAuditsItemBean;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p2, p0, Ll/agg;->j:Ll/otl;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$e0;->getAdapterPosition()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupAuditsItemBean;->getGroupId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupAuditsItemBean;->getId()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-interface {p2, p0, v0, p1}, Ll/otl;->e(ILjava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public f(Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupAuditsItemBean;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/agg;->b:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupAuditsItemBean;->getAvatar()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const-string v2, "context_livingAct"

    .line 8
    .line 9
    invoke-static {v2, v0, v1}, Ll/izs;->o(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/agg;->d:Lv/VText;

    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupAuditsItemBean;->getName()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/agg;->c:Lcom/p1/mobile/putong/live/base/business/fansgroup/UserAgeGenderView;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupAuditsItemBean;->getGender()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupAuditsItemBean;->getAge()I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/base/business/fansgroup/UserAgeGenderView;->Q(Ljava/lang/String;I)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/agg;->e:Lv/VText;

    .line 35
    .line 36
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupAuditsItemBean;->getDesc()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/agg;->f:Lv/VText;

    .line 44
    .line 45
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupAuditsItemBean;->getDate()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ll/agg;->d:Lv/VText;

    .line 53
    .line 54
    const/4 v1, 0x0

    .line 55
    const/4 v2, 0x1

    .line 56
    invoke-virtual {v0, v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupAuditsItemBean;->getStatus()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    const-string v1, "pending"

    .line 64
    .line 65
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    iget-object v1, p0, Ll/agg;->g:Lv/VText;

    .line 70
    .line 71
    const/16 v2, 0x8

    .line 72
    .line 73
    const/4 v3, 0x0

    .line 74
    if-eqz v0, :cond_0

    .line 75
    .line 76
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Ll/agg;->h:Lv/VText;

    .line 80
    .line 81
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Ll/agg;->i:Lv/VText;

    .line 85
    .line 86
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Ll/agg;->g:Lv/VText;

    .line 90
    .line 91
    new-instance v1, Ll/yfg;

    .line 92
    .line 93
    invoke-direct {v1, p0, p1}, Ll/yfg;-><init>(Ll/agg;Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupAuditsItemBean;)V

    .line 94
    .line 95
    .line 96
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 97
    .line 98
    .line 99
    iget-object v0, p0, Ll/agg;->h:Lv/VText;

    .line 100
    .line 101
    new-instance v1, Ll/zfg;

    .line 102
    .line 103
    invoke-direct {v1, p0, p1}, Ll/zfg;-><init>(Ll/agg;Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupAuditsItemBean;)V

    .line 104
    .line 105
    .line 106
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 107
    .line 108
    .line 109
    return-void

    .line 110
    :cond_0
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 111
    .line 112
    .line 113
    iget-object v0, p0, Ll/agg;->h:Lv/VText;

    .line 114
    .line 115
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 116
    .line 117
    .line 118
    iget-object v0, p0, Ll/agg;->i:Lv/VText;

    .line 119
    .line 120
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupAuditsItemBean;->getStatus()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    const-string v0, "approved"

    .line 128
    .line 129
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 130
    .line 131
    .line 132
    move-result p1

    .line 133
    iget-object p0, p0, Ll/agg;->i:Lv/VText;

    .line 134
    .line 135
    if-eqz p1, :cond_1

    .line 136
    .line 137
    sget p1, Lcom/p1/mobile/putong/live/base/R$string;->E:I

    .line 138
    .line 139
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 140
    .line 141
    .line 142
    return-void

    .line 143
    :cond_1
    sget p1, Lcom/p1/mobile/putong/live/base/R$string;->G:I

    .line 144
    .line 145
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 146
    .line 147
    .line 148
    return-void
.end method

.method public g(Ll/otl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/agg;->j:Ll/otl;

    .line 2
    .line 3
    return-void
.end method
