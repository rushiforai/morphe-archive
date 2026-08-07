.class public Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeGroupPurse;
.super Lv/VFrame;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lv/VLinear;

.field public c:Lv/VText_NoTopPadding;

.field public d:Lv/VDraweeView;

.field public e:Lv/VText_NoTopPadding;

.field public f:Lv/VLinear;

.field public g:Lv/AutoVDraweeView;

.field public h:Lv/AutoVDraweeView;

.field public i:Lv/VText_NoTopPadding;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeGroupPurse;->p(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final p(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/cgp;->a(Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeGroupPurse;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public s(Lcom/p1/mobile/putong/core/data/TribeSubsetContent;Ll/ojo;)V
    .locals 5

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeGroupPurse;->a:Lv/VDraweeView;

    .line 7
    .line 8
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->coverUrl:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeGroupPurse;->d:Lv/VDraweeView;

    .line 16
    .line 17
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->icon:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeGroupPurse;->e:Lv/VText_NoTopPadding;

    .line 23
    .line 24
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->title:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->profilePhoto:Ljava/util/List;

    .line 30
    .line 31
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeGroupPurse;->g:Lv/AutoVDraweeView;

    .line 36
    .line 37
    const/4 v2, 0x2

    .line 38
    const/4 v3, 0x1

    .line 39
    const/4 v4, 0x0

    .line 40
    if-nez v0, :cond_2

    .line 41
    .line 42
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->profilePhoto:Ljava/util/List;

    .line 43
    .line 44
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    check-cast v0, Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v1, v0}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeGroupPurse;->g:Lv/AutoVDraweeView;

    .line 54
    .line 55
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->profilePhoto:Ljava/util/List;

    .line 59
    .line 60
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeGroupPurse;->h:Lv/AutoVDraweeView;

    .line 65
    .line 66
    if-lt v0, v2, :cond_1

    .line 67
    .line 68
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->profilePhoto:Ljava/util/List;

    .line 69
    .line 70
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    check-cast v0, Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {v1, v0}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeGroupPurse;->h:Lv/AutoVDraweeView;

    .line 80
    .line 81
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 82
    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_1
    invoke-static {v1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 86
    .line 87
    .line 88
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeGroupPurse;->f:Lv/VLinear;

    .line 89
    .line 90
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 91
    .line 92
    .line 93
    goto :goto_1

    .line 94
    :cond_2
    invoke-static {v1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeGroupPurse;->h:Lv/AutoVDraweeView;

    .line 98
    .line 99
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeGroupPurse;->f:Lv/VLinear;

    .line 103
    .line 104
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 105
    .line 106
    .line 107
    :goto_1
    iget v0, p1, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->totalCount:I

    .line 108
    .line 109
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeGroupPurse;->i:Lv/VText_NoTopPadding;

    .line 110
    .line 111
    if-lt v0, v2, :cond_3

    .line 112
    .line 113
    invoke-virtual {p2, v0, v4}, Ll/ojo;->t0(IZ)Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 118
    .line 119
    .line 120
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeGroupPurse;->i:Lv/VText_NoTopPadding;

    .line 121
    .line 122
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 123
    .line 124
    .line 125
    goto :goto_2

    .line 126
    :cond_3
    invoke-static {v1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 127
    .line 128
    .line 129
    :goto_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeGroupPurse;->c:Lv/VText_NoTopPadding;

    .line 130
    .line 131
    iget v1, p1, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->currentLikeMe:I

    .line 132
    .line 133
    invoke-virtual {p2, v1, v3}, Ll/ojo;->t0(IZ)Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object p2

    .line 137
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 138
    .line 139
    .line 140
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeGroupPurse;->b:Lv/VLinear;

    .line 141
    .line 142
    iget p1, p1, Lcom/p1/mobile/putong/core/data/TribeSubsetContent;->currentLikeMe:I

    .line 143
    .line 144
    if-lez p1, :cond_4

    .line 145
    .line 146
    goto :goto_3

    .line 147
    :cond_4
    move v3, v4

    .line 148
    :goto_3
    invoke-static {p0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 149
    .line 150
    .line 151
    return-void
.end method
