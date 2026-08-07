.class public Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lcom/tantan/library/svga/SVGAnimationView;

.field public e:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

.field public f:Lv/VLinear_FillerMeasure;

.field public g:Lv/VText;

.field public h:Landroidx/legacy/widget/Space;

.field public i:Lv/VImage;

.field public j:Landroidx/legacy/widget/Space;

.field public k:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

.field public l:Lv/VText;

.field public m:Landroid/widget/LinearLayout;

.field public n:Lv/VFrame_Shadow;

.field public o:Landroid/widget/ImageView;

.field public p:Landroid/widget/ImageView;

.field public q:Lv/VFrame_Shadow;

.field public r:Landroid/widget/TextView;

.field public s:Landroid/widget/FrameLayout;

.field public t:Landroid/widget/TextView;

.field public u:Landroid/view/View;

.field public v:Landroid/widget/LinearLayout;

.field public w:Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;

.field public x:Ll/czl;

.field public y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

.field public z:Lv/VDraweeView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedItemData;Lcom/p1/mobile/putong/data/User;Z)V
    .locals 0

    .line 1
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedItemData;->isAllShow:Z

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    const-string p0, "other_user_id"

    .line 6
    .line 7
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    filled-new-array {p0}, [Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string p1, "e_meet_card_unfold"

    .line 18
    .line 19
    const-string p2, "p_meet"

    .line 20
    .line 21
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/data/User;[ILjava/lang/StringBuilder;Lcom/p1/mobile/putong/data/Tag;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 4
    .line 5
    new-instance v0, Ll/l9y;

    .line 6
    .line 7
    invoke-direct {v0, p3}, Ll/l9y;-><init>(Lcom/p1/mobile/putong/data/Tag;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Lcom/p1/mobile/putong/data/Tag;

    .line 15
    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    const/4 p3, 0x0

    .line 19
    aget v0, p1, p3

    .line 20
    .line 21
    if-lez v0, :cond_0

    .line 22
    .line 23
    const-string v0, "\uff0c"

    .line 24
    .line 25
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Tag;->value:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Tag;->value:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    :goto_0
    aget p0, p1, p3

    .line 40
    .line 41
    add-int/lit8 p0, p0, 0x1

    .line 42
    .line 43
    aput p0, p1, p3

    .line 44
    .line 45
    :cond_1
    return-void
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/data/Tag;Lcom/p1/mobile/putong/data/Tag;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Tag;->value:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Tag;->value:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic l0(Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->u0(Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic m0(Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->w0(Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic n0(Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->t0(Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic o0(Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;Lcom/p1/mobile/putong/data/User;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->z0(Lcom/p1/mobile/putong/data/User;Z)V

    return-void
.end method

.method public static synthetic p0(Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->v0(Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;Landroid/view/View;)V

    return-void
.end method

.method private synthetic y0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->z:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public B0(Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;)V
    .locals 12

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->g:Lv/VText;

    .line 4
    .line 5
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;->item:Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 11
    .line 12
    iget v2, v0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->readStatus:I

    .line 13
    .line 14
    if-nez v2, :cond_0

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->id:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->L0(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 22
    .line 23
    instance-of v2, v0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSeeItemData;

    .line 24
    .line 25
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->g:Lv/VText;

    .line 26
    .line 27
    const/4 v4, 0x1

    .line 28
    const/4 v5, 0x0

    .line 29
    if-eqz v2, :cond_4

    .line 30
    .line 31
    const-string v0, "\u559c\u6b22\u6211\u7684\u4eba"

    .line 32
    .line 33
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->d:Lcom/tantan/library/svga/SVGAnimationView;

    .line 37
    .line 38
    invoke-static {v0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 42
    .line 43
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 44
    .line 45
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->v5()Lcom/p1/mobile/putong/core/api/CoreLikers$a;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-eqz v1, :cond_2

    .line 54
    .line 55
    iget-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->d:Ljava/util/List;

    .line 56
    .line 57
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-nez v1, :cond_2

    .line 62
    .line 63
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->d:Ljava/util/List;

    .line 64
    .line 65
    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 70
    .line 71
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->r0(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-virtual {v1}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Fs()Z

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->z:Lv/VDraweeView;

    .line 88
    .line 89
    if-eqz v1, :cond_1

    .line 90
    .line 91
    sget v1, Ll/gbc0;->I0:I

    .line 92
    .line 93
    invoke-static {v2, v0, v1}, Ll/vnb;->v1(Lv/VDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;I)V

    .line 94
    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_1
    sget v1, Ll/gbc0;->I0:I

    .line 98
    .line 99
    invoke-static {v2, v0, v1}, Ll/vnb;->w1(Lv/VDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;I)V

    .line 100
    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_2
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 104
    .line 105
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->z:Lv/VDraweeView;

    .line 106
    .line 107
    sget v2, Ll/gbc0;->I0:I

    .line 108
    .line 109
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 110
    .line 111
    .line 112
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 113
    .line 114
    move-object v1, v0

    .line 115
    check-cast v1, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSeeItemData;

    .line 116
    .line 117
    iget-object v1, v1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;->item:Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 118
    .line 119
    iget v1, v1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->lowPopSeeCount:I

    .line 120
    .line 121
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->l:Lv/VText;

    .line 122
    .line 123
    if-nez v1, :cond_3

    .line 124
    .line 125
    check-cast v0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSeeItemData;

    .line 126
    .line 127
    iget-object v0, v0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;->item:Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 128
    .line 129
    iget v0, v0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->seeCount:I

    .line 130
    .line 131
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    const-string v1, "%s\u4f4d\u7528\u6237\u559c\u6b22\u4e86\u4f60"

    .line 140
    .line 141
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 146
    .line 147
    .line 148
    goto :goto_1

    .line 149
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 150
    .line 151
    const-string v1, "\u6536\u5230\u7684\u65b0\u559c\u6b22:"

    .line 152
    .line 153
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 157
    .line 158
    check-cast v1, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSeeItemData;

    .line 159
    .line 160
    iget-object v1, v1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;->item:Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 161
    .line 162
    iget v1, v1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->lowPopSeeCount:I

    .line 163
    .line 164
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 172
    .line 173
    .line 174
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->t:Landroid/widget/TextView;

    .line 175
    .line 176
    invoke-static {v0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 177
    .line 178
    .line 179
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->n:Lv/VFrame_Shadow;

    .line 180
    .line 181
    invoke-static {v0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 182
    .line 183
    .line 184
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->p:Landroid/widget/ImageView;

    .line 185
    .line 186
    invoke-static {v0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 187
    .line 188
    .line 189
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->q:Lv/VFrame_Shadow;

    .line 190
    .line 191
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 192
    .line 193
    .line 194
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->w:Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;

    .line 195
    .line 196
    invoke-static {v0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 197
    .line 198
    .line 199
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->j:Landroidx/legacy/widget/Space;

    .line 200
    .line 201
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 202
    .line 203
    .line 204
    new-instance v0, Ll/h9y;

    .line 205
    .line 206
    invoke-direct {v0, p0}, Ll/h9y;-><init>(Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;)V

    .line 207
    .line 208
    .line 209
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 210
    .line 211
    .line 212
    goto/16 :goto_e

    .line 213
    .line 214
    :cond_4
    check-cast v0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;

    .line 215
    .line 216
    iget-object v0, v0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 217
    .line 218
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 219
    .line 220
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 221
    .line 222
    .line 223
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 224
    .line 225
    check-cast v0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;

    .line 226
    .line 227
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->H0(Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;)V

    .line 228
    .line 229
    .line 230
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 231
    .line 232
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m1:Lcom/p1/mobile/putong/core/api/s;

    .line 233
    .line 234
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 235
    .line 236
    check-cast v2, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;

    .line 237
    .line 238
    iget-object v2, v2, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 239
    .line 240
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 241
    .line 242
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/api/s;->q4(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;

    .line 243
    .line 244
    .line 245
    move-result-object v0

    .line 246
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 247
    .line 248
    .line 249
    move-result v2

    .line 250
    if-eqz v2, :cond_5

    .line 251
    .line 252
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->anonymous:Z

    .line 253
    .line 254
    if-eqz v0, :cond_5

    .line 255
    .line 256
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 257
    .line 258
    check-cast v0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;

    .line 259
    .line 260
    iget-object v0, v0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 261
    .line 262
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 263
    .line 264
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 265
    .line 266
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->live:Lcom/p1/mobile/putong/data/VirtualVoiceLive;

    .line 267
    .line 268
    iget-object v0, v0, Lcom/p1/mobile/putong/data/VirtualVoiceLive;->voiceImgUrl:Ljava/util/List;

    .line 269
    .line 270
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 271
    .line 272
    .line 273
    move-result v0

    .line 274
    if-nez v0, :cond_5

    .line 275
    .line 276
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->e:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 277
    .line 278
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 279
    .line 280
    check-cast v2, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;

    .line 281
    .line 282
    iget-object v2, v2, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 283
    .line 284
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 285
    .line 286
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 287
    .line 288
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->live:Lcom/p1/mobile/putong/data/VirtualVoiceLive;

    .line 289
    .line 290
    iget-object v2, v2, Lcom/p1/mobile/putong/data/VirtualVoiceLive;->voiceImgUrl:Ljava/util/List;

    .line 291
    .line 292
    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 293
    .line 294
    .line 295
    move-result-object v2

    .line 296
    check-cast v2, Ljava/lang/String;

    .line 297
    .line 298
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->B0(Ljava/lang/String;)V

    .line 299
    .line 300
    .line 301
    goto/16 :goto_2

    .line 302
    .line 303
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 304
    .line 305
    check-cast v0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;

    .line 306
    .line 307
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->isSeePortraitUser()Z

    .line 308
    .line 309
    .line 310
    move-result v0

    .line 311
    if-eqz v0, :cond_6

    .line 312
    .line 313
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 314
    .line 315
    .line 316
    move-result-object v0

    .line 317
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 318
    .line 319
    .line 320
    move-result-object v0

    .line 321
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->e2()Z

    .line 322
    .line 323
    .line 324
    move-result v0

    .line 325
    if-eqz v0, :cond_6

    .line 326
    .line 327
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->e:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 328
    .line 329
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 330
    .line 331
    move-object v3, v2

    .line 332
    check-cast v3, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;

    .line 333
    .line 334
    iget-object v3, v3, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 335
    .line 336
    check-cast v2, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;

    .line 337
    .line 338
    iget-object v2, v2, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 339
    .line 340
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 341
    .line 342
    .line 343
    move-result-object v2

    .line 344
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 345
    .line 346
    .line 347
    move-result-object v2

    .line 348
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 349
    .line 350
    .line 351
    move-result-object v2

    .line 352
    invoke-virtual {v0, v3, v2}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->w0(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 353
    .line 354
    .line 355
    goto :goto_2

    .line 356
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 357
    .line 358
    check-cast v0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;

    .line 359
    .line 360
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->isLowSeeSingleUser()Z

    .line 361
    .line 362
    .line 363
    move-result v0

    .line 364
    if-eqz v0, :cond_7

    .line 365
    .line 366
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 367
    .line 368
    .line 369
    move-result-object v0

    .line 370
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 371
    .line 372
    .line 373
    move-result-object v0

    .line 374
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->e2()Z

    .line 375
    .line 376
    .line 377
    move-result v0

    .line 378
    if-eqz v0, :cond_7

    .line 379
    .line 380
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->e:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 381
    .line 382
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 383
    .line 384
    check-cast v2, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;

    .line 385
    .line 386
    iget-object v2, v2, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 387
    .line 388
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 389
    .line 390
    .line 391
    move-result-object v2

    .line 392
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 393
    .line 394
    .line 395
    move-result-object v2

    .line 396
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 397
    .line 398
    .line 399
    move-result-object v2

    .line 400
    const/4 v3, 0x2

    .line 401
    const/16 v6, 0x8

    .line 402
    .line 403
    invoke-virtual {v0, v2, v3, v6}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->i0(Ljava/lang/String;II)V

    .line 404
    .line 405
    .line 406
    goto :goto_2

    .line 407
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->e:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 408
    .line 409
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 410
    .line 411
    check-cast v2, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;

    .line 412
    .line 413
    iget-object v2, v2, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 414
    .line 415
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->t0(Lcom/p1/mobile/putong/data/User;)V

    .line 416
    .line 417
    .line 418
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 419
    .line 420
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->z:Lv/VDraweeView;

    .line 421
    .line 422
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 423
    .line 424
    check-cast v3, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;

    .line 425
    .line 426
    iget-object v3, v3, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 427
    .line 428
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 429
    .line 430
    .line 431
    move-result-object v3

    .line 432
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 433
    .line 434
    .line 435
    move-result-object v3

    .line 436
    invoke-virtual {v0, v2, v3}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 437
    .line 438
    .line 439
    :goto_2
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 440
    .line 441
    iget-object v0, v0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 442
    .line 443
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 444
    .line 445
    .line 446
    move-result-object v2

    .line 447
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 448
    .line 449
    check-cast v3, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;

    .line 450
    .line 451
    iget-object v3, v3, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 452
    .line 453
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->i:Lv/VImage;

    .line 454
    .line 455
    invoke-interface {v0, v2, v3, v6}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->showUserVerificationLogo(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Lv/VImage;)V

    .line 456
    .line 457
    .line 458
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->h:Landroidx/legacy/widget/Space;

    .line 459
    .line 460
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->i:Lv/VImage;

    .line 461
    .line 462
    invoke-static {v2}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 463
    .line 464
    .line 465
    move-result v2

    .line 466
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 467
    .line 468
    .line 469
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 470
    .line 471
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 472
    .line 473
    .line 474
    move-result-object v0

    .line 475
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->e()Z

    .line 476
    .line 477
    .line 478
    move-result v0

    .line 479
    if-eqz v0, :cond_8

    .line 480
    .line 481
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 482
    .line 483
    check-cast v0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;

    .line 484
    .line 485
    iget-object v0, v0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 486
    .line 487
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isSupremePartner()Z

    .line 488
    .line 489
    .line 490
    move-result v0

    .line 491
    if-eqz v0, :cond_8

    .line 492
    .line 493
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 494
    .line 495
    check-cast v0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;

    .line 496
    .line 497
    iget-object v0, v0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 498
    .line 499
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isHideIconFromSVipWithMe()Z

    .line 500
    .line 501
    .line 502
    move-result v0

    .line 503
    if-nez v0, :cond_8

    .line 504
    .line 505
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->k:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 506
    .line 507
    invoke-virtual {v0}, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->n0()V

    .line 508
    .line 509
    .line 510
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->j:Landroidx/legacy/widget/Space;

    .line 511
    .line 512
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 513
    .line 514
    .line 515
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->k:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 516
    .line 517
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 518
    .line 519
    .line 520
    goto :goto_3

    .line 521
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 522
    .line 523
    check-cast v0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;

    .line 524
    .line 525
    iget-object v0, v0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 526
    .line 527
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isODiamond()Z

    .line 528
    .line 529
    .line 530
    move-result v0

    .line 531
    if-eqz v0, :cond_9

    .line 532
    .line 533
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 534
    .line 535
    check-cast v0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;

    .line 536
    .line 537
    iget-object v0, v0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 538
    .line 539
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isHideIconFromSVipWithMe()Z

    .line 540
    .line 541
    .line 542
    move-result v0

    .line 543
    if-nez v0, :cond_9

    .line 544
    .line 545
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->k:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 546
    .line 547
    invoke-virtual {v0}, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->p0()V

    .line 548
    .line 549
    .line 550
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->j:Landroidx/legacy/widget/Space;

    .line 551
    .line 552
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 553
    .line 554
    .line 555
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->k:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 556
    .line 557
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 558
    .line 559
    .line 560
    goto :goto_3

    .line 561
    :cond_9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 562
    .line 563
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 564
    .line 565
    .line 566
    move-result-object v0

    .line 567
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->b8()Z

    .line 568
    .line 569
    .line 570
    move-result v0

    .line 571
    if-eqz v0, :cond_a

    .line 572
    .line 573
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 574
    .line 575
    check-cast v0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;

    .line 576
    .line 577
    iget-object v0, v0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 578
    .line 579
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isPlatinum()Z

    .line 580
    .line 581
    .line 582
    move-result v0

    .line 583
    if-eqz v0, :cond_a

    .line 584
    .line 585
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 586
    .line 587
    check-cast v0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;

    .line 588
    .line 589
    iget-object v0, v0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 590
    .line 591
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isHideIconFromSVipWithMe()Z

    .line 592
    .line 593
    .line 594
    move-result v0

    .line 595
    if-nez v0, :cond_a

    .line 596
    .line 597
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->k:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 598
    .line 599
    invoke-virtual {v0}, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->m0()V

    .line 600
    .line 601
    .line 602
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->j:Landroidx/legacy/widget/Space;

    .line 603
    .line 604
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 605
    .line 606
    .line 607
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->k:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 608
    .line 609
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 610
    .line 611
    .line 612
    goto :goto_3

    .line 613
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->j:Landroidx/legacy/widget/Space;

    .line 614
    .line 615
    invoke-static {v0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 616
    .line 617
    .line 618
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->k:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 619
    .line 620
    invoke-static {v0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 621
    .line 622
    .line 623
    :goto_3
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->E0(Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;)V

    .line 624
    .line 625
    .line 626
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->t:Landroid/widget/TextView;

    .line 627
    .line 628
    sget v2, Ll/qa00;->j:I

    .line 629
    .line 630
    invoke-static {v0, v2}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 631
    .line 632
    .line 633
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 634
    .line 635
    instance-of v3, v0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedItemData;

    .line 636
    .line 637
    const/high16 v6, -0x1000000

    .line 638
    .line 639
    const-string v7, "sans-serif"

    .line 640
    .line 641
    const-string v8, ": "

    .line 642
    .line 643
    const-string v9, "...: "

    .line 644
    .line 645
    const/16 v10, 0xa

    .line 646
    .line 647
    if-eqz v3, :cond_e

    .line 648
    .line 649
    check-cast v0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedItemData;

    .line 650
    .line 651
    iget-object v2, v0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 652
    .line 653
    iget-object v3, v0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedItemData;->moment:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 654
    .line 655
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->value:Ljava/lang/String;

    .line 656
    .line 657
    invoke-static {v3}, Ll/jyb;->L(Ljava/lang/String;)Z

    .line 658
    .line 659
    .line 660
    move-result v3

    .line 661
    iget-object v11, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->w:Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;

    .line 662
    .line 663
    if-eqz v3, :cond_b

    .line 664
    .line 665
    invoke-static {v11, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 666
    .line 667
    .line 668
    goto :goto_5

    .line 669
    :cond_b
    invoke-static {v11, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 670
    .line 671
    .line 672
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->w:Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;

    .line 673
    .line 674
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->getTextView()Lv/VText;

    .line 675
    .line 676
    .line 677
    move-result-object v3

    .line 678
    if-eqz v3, :cond_c

    .line 679
    .line 680
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->w:Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;

    .line 681
    .line 682
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->getTextView()Lv/VText;

    .line 683
    .line 684
    .line 685
    move-result-object v3

    .line 686
    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setBreakStrategy(I)V

    .line 687
    .line 688
    .line 689
    :cond_c
    iget-object v3, v2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 690
    .line 691
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    .line 692
    .line 693
    .line 694
    move-result v3

    .line 695
    iget-object v4, v2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 696
    .line 697
    if-le v3, v10, :cond_d

    .line 698
    .line 699
    invoke-virtual {v4, v5, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 700
    .line 701
    .line 702
    move-result-object v3

    .line 703
    invoke-virtual {v3, v9}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 704
    .line 705
    .line 706
    move-result-object v3

    .line 707
    goto :goto_4

    .line 708
    :cond_d
    new-instance v3, Ljava/lang/StringBuilder;

    .line 709
    .line 710
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 711
    .line 712
    .line 713
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 714
    .line 715
    .line 716
    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 717
    .line 718
    .line 719
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 720
    .line 721
    .line 722
    move-result-object v3

    .line 723
    :goto_4
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->w:Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;

    .line 724
    .line 725
    iget-boolean v8, v0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedItemData;->isAllShow:Z

    .line 726
    .line 727
    invoke-virtual {v4, v8}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->H(Z)Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;

    .line 728
    .line 729
    .line 730
    move-result-object v4

    .line 731
    new-instance v8, Ll/i9y;

    .line 732
    .line 733
    invoke-direct {v8, v0, v2}, Ll/i9y;-><init>(Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedItemData;Lcom/p1/mobile/putong/data/User;)V

    .line 734
    .line 735
    .line 736
    invoke-virtual {v4, v8}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->J(Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer$d;)Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;

    .line 737
    .line 738
    .line 739
    move-result-object v2

    .line 740
    new-instance v4, Ljava/lang/StringBuilder;

    .line 741
    .line 742
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 743
    .line 744
    .line 745
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 746
    .line 747
    .line 748
    iget-object v0, v0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedItemData;->moment:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 749
    .line 750
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->value:Ljava/lang/String;

    .line 751
    .line 752
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 753
    .line 754
    .line 755
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 756
    .line 757
    .line 758
    move-result-object v0

    .line 759
    new-instance v4, Lv/text/CustomTypefaceSpan;

    .line 760
    .line 761
    invoke-direct {v4, v7, v1, v6, v5}, Lv/text/CustomTypefaceSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;II)V

    .line 762
    .line 763
    .line 764
    invoke-virtual {v2, v0, v3, v4}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->I(Ljava/lang/CharSequence;Ljava/lang/String;Lv/text/CustomTypefaceSpan;)Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;

    .line 765
    .line 766
    .line 767
    :goto_5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->G0()V

    .line 768
    .line 769
    .line 770
    goto/16 :goto_d

    .line 771
    .line 772
    :cond_e
    instance-of v3, v0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;

    .line 773
    .line 774
    if-eqz v3, :cond_21

    .line 775
    .line 776
    check-cast v0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;

    .line 777
    .line 778
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->isSeeUser()Z

    .line 779
    .line 780
    .line 781
    move-result v0

    .line 782
    if-nez v0, :cond_f

    .line 783
    .line 784
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 785
    .line 786
    check-cast v0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;

    .line 787
    .line 788
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->isPicksUser()Z

    .line 789
    .line 790
    .line 791
    move-result v0

    .line 792
    if-nez v0, :cond_f

    .line 793
    .line 794
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 795
    .line 796
    check-cast v0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;

    .line 797
    .line 798
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->isLikedUser()Z

    .line 799
    .line 800
    .line 801
    move-result v0

    .line 802
    if-nez v0, :cond_f

    .line 803
    .line 804
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 805
    .line 806
    check-cast v0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;

    .line 807
    .line 808
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->isSeePortraitUser()Z

    .line 809
    .line 810
    .line 811
    move-result v0

    .line 812
    if-nez v0, :cond_f

    .line 813
    .line 814
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 815
    .line 816
    check-cast v0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;

    .line 817
    .line 818
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->isMomentBeLikeUser()Z

    .line 819
    .line 820
    .line 821
    move-result v0

    .line 822
    if-nez v0, :cond_f

    .line 823
    .line 824
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 825
    .line 826
    check-cast v0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;

    .line 827
    .line 828
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->isMomentLikeUser()Z

    .line 829
    .line 830
    .line 831
    move-result v0

    .line 832
    if-eqz v0, :cond_21

    .line 833
    .line 834
    :cond_f
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 835
    .line 836
    check-cast v0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;

    .line 837
    .line 838
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->isMomentBeLikeUser()Z

    .line 839
    .line 840
    .line 841
    move-result v0

    .line 842
    if-nez v0, :cond_12

    .line 843
    .line 844
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 845
    .line 846
    check-cast v0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;

    .line 847
    .line 848
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->isMomentLikeUser()Z

    .line 849
    .line 850
    .line 851
    move-result v0

    .line 852
    if-eqz v0, :cond_10

    .line 853
    .line 854
    goto :goto_6

    .line 855
    :cond_10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 856
    .line 857
    check-cast v0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;

    .line 858
    .line 859
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->isSeePortraitUser()Z

    .line 860
    .line 861
    .line 862
    move-result v0

    .line 863
    if-eqz v0, :cond_11

    .line 864
    .line 865
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->t:Landroid/widget/TextView;

    .line 866
    .line 867
    sget v2, Ll/qa00;->A:I

    .line 868
    .line 869
    invoke-static {v0, v2}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 870
    .line 871
    .line 872
    goto :goto_7

    .line 873
    :cond_11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 874
    .line 875
    check-cast v0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;

    .line 876
    .line 877
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->isSeePortraitUser()Z

    .line 878
    .line 879
    .line 880
    move-result v0

    .line 881
    if-nez v0, :cond_13

    .line 882
    .line 883
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->t:Landroid/widget/TextView;

    .line 884
    .line 885
    sget v2, Ll/qa00;->A:I

    .line 886
    .line 887
    invoke-static {v0, v2}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 888
    .line 889
    .line 890
    goto :goto_7

    .line 891
    :cond_12
    :goto_6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->t:Landroid/widget/TextView;

    .line 892
    .line 893
    invoke-static {v0, v2}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 894
    .line 895
    .line 896
    :cond_13
    :goto_7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->w:Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;

    .line 897
    .line 898
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 899
    .line 900
    .line 901
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->w:Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;

    .line 902
    .line 903
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->getTextView()Lv/VText;

    .line 904
    .line 905
    .line 906
    move-result-object v0

    .line 907
    if-eqz v0, :cond_14

    .line 908
    .line 909
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->w:Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;

    .line 910
    .line 911
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->getTextView()Lv/VText;

    .line 912
    .line 913
    .line 914
    move-result-object v0

    .line 915
    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setBreakStrategy(I)V

    .line 916
    .line 917
    .line 918
    :cond_14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 919
    .line 920
    check-cast v0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;

    .line 921
    .line 922
    iget-object v0, v0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 923
    .line 924
    iget-object v2, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 925
    .line 926
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 927
    .line 928
    .line 929
    move-result v2

    .line 930
    iget-object v3, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 931
    .line 932
    if-le v2, v10, :cond_15

    .line 933
    .line 934
    invoke-virtual {v3, v5, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 935
    .line 936
    .line 937
    move-result-object v2

    .line 938
    invoke-virtual {v2, v9}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 939
    .line 940
    .line 941
    move-result-object v2

    .line 942
    goto :goto_8

    .line 943
    :cond_15
    new-instance v2, Ljava/lang/StringBuilder;

    .line 944
    .line 945
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 946
    .line 947
    .line 948
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 949
    .line 950
    .line 951
    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 952
    .line 953
    .line 954
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 955
    .line 956
    .line 957
    move-result-object v2

    .line 958
    :goto_8
    new-instance v3, Ljava/lang/StringBuilder;

    .line 959
    .line 960
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 961
    .line 962
    .line 963
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 964
    .line 965
    check-cast v4, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;

    .line 966
    .line 967
    iget-object v4, v4, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;->item:Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 968
    .line 969
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->momentMediaType:Ljava/lang/String;

    .line 970
    .line 971
    sget-object v8, Lcom/p1/mobile/putong/core/api/s;->Companion:Lcom/p1/mobile/putong/core/api/s$a;

    .line 972
    .line 973
    invoke-virtual {v8}, Lcom/p1/mobile/putong/core/api/s$a;->a()Ljava/lang/String;

    .line 974
    .line 975
    .line 976
    move-result-object v8

    .line 977
    invoke-static {v4, v8}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 978
    .line 979
    .line 980
    move-result v4

    .line 981
    if-eqz v4, :cond_16

    .line 982
    .line 983
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 984
    .line 985
    check-cast v4, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;

    .line 986
    .line 987
    iget-object v4, v4, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;->moment:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 988
    .line 989
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->value:Ljava/lang/String;

    .line 990
    .line 991
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 992
    .line 993
    .line 994
    goto/16 :goto_c

    .line 995
    .line 996
    :cond_16
    iget-object v4, v0, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 997
    .line 998
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 999
    .line 1000
    .line 1001
    move-result v4

    .line 1002
    if-nez v4, :cond_17

    .line 1003
    .line 1004
    iget-object v4, v0, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 1005
    .line 1006
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1007
    .line 1008
    .line 1009
    goto/16 :goto_c

    .line 1010
    .line 1011
    :cond_17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isHideLocationFromSVip()Z

    .line 1012
    .line 1013
    .line 1014
    move-result v4

    .line 1015
    if-nez v4, :cond_1d

    .line 1016
    .line 1017
    iget-object v4, v0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 1018
    .line 1019
    iget v4, v4, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 1020
    .line 1021
    sget-object v8, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 1022
    .line 1023
    iget-object v8, v8, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 1024
    .line 1025
    invoke-virtual {v8}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 1026
    .line 1027
    .line 1028
    move-result-object v8

    .line 1029
    iget-object v8, v8, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 1030
    .line 1031
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 1032
    .line 1033
    iget-object v9, v0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 1034
    .line 1035
    iget-object v9, v9, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 1036
    .line 1037
    iget-object v9, v9, Lcom/p1/mobile/putong/data/Region;->district:Ljava/lang/String;

    .line 1038
    .line 1039
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 1040
    .line 1041
    .line 1042
    move-result v9

    .line 1043
    if-nez v9, :cond_18

    .line 1044
    .line 1045
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 1046
    .line 1047
    iget-object v9, v0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 1048
    .line 1049
    iget-object v9, v9, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 1050
    .line 1051
    iget-object v9, v9, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 1052
    .line 1053
    invoke-static {v8, v9}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 1054
    .line 1055
    .line 1056
    move-result v8

    .line 1057
    if-eqz v8, :cond_18

    .line 1058
    .line 1059
    iget-object v8, v0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 1060
    .line 1061
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 1062
    .line 1063
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Region;->district:Ljava/lang/String;

    .line 1064
    .line 1065
    goto :goto_9

    .line 1066
    :cond_18
    iget-object v8, v0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 1067
    .line 1068
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 1069
    .line 1070
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 1071
    .line 1072
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 1073
    .line 1074
    .line 1075
    move-result v8

    .line 1076
    iget-object v9, v0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 1077
    .line 1078
    if-nez v8, :cond_19

    .line 1079
    .line 1080
    iget-object v8, v9, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 1081
    .line 1082
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 1083
    .line 1084
    goto :goto_9

    .line 1085
    :cond_19
    iget-object v8, v9, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 1086
    .line 1087
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Region;->country:Ljava/lang/String;

    .line 1088
    .line 1089
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 1090
    .line 1091
    .line 1092
    move-result v8

    .line 1093
    if-nez v8, :cond_1a

    .line 1094
    .line 1095
    iget-object v8, v0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 1096
    .line 1097
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 1098
    .line 1099
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Region;->country:Ljava/lang/String;

    .line 1100
    .line 1101
    goto :goto_9

    .line 1102
    :cond_1a
    const/4 v8, 0x0

    .line 1103
    :goto_9
    const/16 v9, 0x64

    .line 1104
    .line 1105
    if-ge v4, v9, :cond_1b

    .line 1106
    .line 1107
    move v4, v9

    .line 1108
    :cond_1b
    invoke-static {v4}, Ll/c17;->r0(I)Ljava/lang/String;

    .line 1109
    .line 1110
    .line 1111
    move-result-object v9

    .line 1112
    const/16 v10, 0x2710

    .line 1113
    .line 1114
    if-le v4, v10, :cond_1c

    .line 1115
    .line 1116
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 1117
    .line 1118
    .line 1119
    move-result v4

    .line 1120
    if-nez v4, :cond_1c

    .line 1121
    .line 1122
    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1123
    .line 1124
    .line 1125
    goto :goto_a

    .line 1126
    :cond_1c
    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1127
    .line 1128
    .line 1129
    :cond_1d
    :goto_a
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isHideAgeFromSVip()Z

    .line 1130
    .line 1131
    .line 1132
    move-result v4

    .line 1133
    const-string v8, "\uff0c"

    .line 1134
    .line 1135
    if-nez v4, :cond_1e

    .line 1136
    .line 1137
    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1138
    .line 1139
    .line 1140
    iget-object v4, v0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 1141
    .line 1142
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 1143
    .line 1144
    .line 1145
    const-string v4, "\u5c81"

    .line 1146
    .line 1147
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1148
    .line 1149
    .line 1150
    :cond_1e
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1151
    .line 1152
    .line 1153
    move-result-object v4

    .line 1154
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 1155
    .line 1156
    .line 1157
    move-result v4

    .line 1158
    if-eqz v4, :cond_1f

    .line 1159
    .line 1160
    iget-object v4, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 1161
    .line 1162
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 1163
    .line 1164
    invoke-static {v4}, Ll/q8g0;->j0(Lcom/p1/mobile/putong/data/ProfileZodiac;)Ljava/lang/String;

    .line 1165
    .line 1166
    .line 1167
    move-result-object v4

    .line 1168
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1169
    .line 1170
    .line 1171
    goto :goto_b

    .line 1172
    :cond_1f
    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1173
    .line 1174
    .line 1175
    iget-object v4, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 1176
    .line 1177
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 1178
    .line 1179
    invoke-static {v4}, Ll/q8g0;->j0(Lcom/p1/mobile/putong/data/ProfileZodiac;)Ljava/lang/String;

    .line 1180
    .line 1181
    .line 1182
    move-result-object v4

    .line 1183
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1184
    .line 1185
    .line 1186
    :goto_b
    iget-object v4, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 1187
    .line 1188
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 1189
    .line 1190
    invoke-static {v4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 1191
    .line 1192
    .line 1193
    move-result v4

    .line 1194
    if-nez v4, :cond_20

    .line 1195
    .line 1196
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 1197
    .line 1198
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 1199
    .line 1200
    invoke-virtual {v4}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 1201
    .line 1202
    .line 1203
    move-result-object v4

    .line 1204
    new-instance v8, Ljava/lang/StringBuilder;

    .line 1205
    .line 1206
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 1207
    .line 1208
    .line 1209
    const-string v9, "\uff0c\u559c\u6b22"

    .line 1210
    .line 1211
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1212
    .line 1213
    .line 1214
    filled-new-array {v5}, [I

    .line 1215
    .line 1216
    .line 1217
    move-result-object v9

    .line 1218
    iget-object v10, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 1219
    .line 1220
    iget-object v10, v10, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 1221
    .line 1222
    new-instance v11, Ll/j9y;

    .line 1223
    .line 1224
    invoke-direct {v11, v4, v9, v8}, Ll/j9y;-><init>(Lcom/p1/mobile/putong/data/User;[ILjava/lang/StringBuilder;)V

    .line 1225
    .line 1226
    .line 1227
    invoke-static {v10, v11}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 1228
    .line 1229
    .line 1230
    aget v4, v9, v5

    .line 1231
    .line 1232
    if-lez v4, :cond_20

    .line 1233
    .line 1234
    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 1235
    .line 1236
    .line 1237
    :cond_20
    :goto_c
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->w:Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;

    .line 1238
    .line 1239
    iget-object v8, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 1240
    .line 1241
    check-cast v8, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;

    .line 1242
    .line 1243
    iget-boolean v8, v8, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;->isAllShow:Z

    .line 1244
    .line 1245
    invoke-virtual {v4, v8}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->H(Z)Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;

    .line 1246
    .line 1247
    .line 1248
    move-result-object v4

    .line 1249
    new-instance v8, Ll/k9y;

    .line 1250
    .line 1251
    invoke-direct {v8, p0, v0}, Ll/k9y;-><init>(Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;Lcom/p1/mobile/putong/data/User;)V

    .line 1252
    .line 1253
    .line 1254
    invoke-virtual {v4, v8}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->J(Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer$d;)Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;

    .line 1255
    .line 1256
    .line 1257
    move-result-object v0

    .line 1258
    new-instance v4, Ljava/lang/StringBuilder;

    .line 1259
    .line 1260
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 1261
    .line 1262
    .line 1263
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1264
    .line 1265
    .line 1266
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 1267
    .line 1268
    .line 1269
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1270
    .line 1271
    .line 1272
    move-result-object v3

    .line 1273
    new-instance v4, Lv/text/CustomTypefaceSpan;

    .line 1274
    .line 1275
    invoke-direct {v4, v7, v1, v6, v5}, Lv/text/CustomTypefaceSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;II)V

    .line 1276
    .line 1277
    .line 1278
    invoke-virtual {v0, v3, v2, v4}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;->I(Ljava/lang/CharSequence;Ljava/lang/String;Lv/text/CustomTypefaceSpan;)Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;

    .line 1279
    .line 1280
    .line 1281
    goto :goto_d

    .line 1282
    :cond_21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->w:Lcom/p1/mobile/putong/core/newui/newmeet/feed/CoreExpandableTextContainer;

    .line 1283
    .line 1284
    invoke-static {v0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 1285
    .line 1286
    .line 1287
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->t:Landroid/widget/TextView;

    .line 1288
    .line 1289
    sget v1, Ll/qa00;->A:I

    .line 1290
    .line 1291
    invoke-static {v0, v1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 1292
    .line 1293
    .line 1294
    :goto_d
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 1295
    .line 1296
    check-cast v0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;

    .line 1297
    .line 1298
    invoke-virtual {p0, v0, p2}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->D0(Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;)V

    .line 1299
    .line 1300
    .line 1301
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->v:Landroid/widget/LinearLayout;

    .line 1302
    .line 1303
    invoke-static {v0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 1304
    .line 1305
    .line 1306
    :goto_e
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->s0(Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;)V

    .line 1307
    .line 1308
    .line 1309
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->x:Ll/czl;

    .line 1310
    .line 1311
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->act()Lcom/p1/mobile/android/app/Act;

    .line 1312
    .line 1313
    .line 1314
    move-result-object v1

    .line 1315
    invoke-interface {v0, p1, v1}, Ll/czl;->a(Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;Lcom/p1/mobile/android/app/Act;)V

    .line 1316
    .line 1317
    .line 1318
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 1319
    .line 1320
    instance-of v0, p1, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedItemData;

    .line 1321
    .line 1322
    if-eqz v0, :cond_23

    .line 1323
    .line 1324
    instance-of p1, p1, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedVideoItemData;

    .line 1325
    .line 1326
    if-eqz p1, :cond_22

    .line 1327
    .line 1328
    const-string p1, "video"

    .line 1329
    .line 1330
    goto :goto_f

    .line 1331
    :cond_22
    const-string p1, "photo"

    .line 1332
    .line 1333
    :goto_f
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->act()Lcom/p1/mobile/android/app/Act;

    .line 1334
    .line 1335
    .line 1336
    move-result-object p2

    .line 1337
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 1338
    .line 1339
    .line 1340
    move-result-object p2

    .line 1341
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 1342
    .line 1343
    check-cast v0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedItemData;

    .line 1344
    .line 1345
    iget-object v0, v0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedItemData;->moment:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 1346
    .line 1347
    iget-object v0, v0, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 1348
    .line 1349
    const-string v1, "moment_id"

    .line 1350
    .line 1351
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 1352
    .line 1353
    .line 1354
    move-result-object v0

    .line 1355
    const-string v1, "moment_type"

    .line 1356
    .line 1357
    invoke-static {v1, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 1358
    .line 1359
    .line 1360
    move-result-object p1

    .line 1361
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 1362
    .line 1363
    check-cast p0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedItemData;

    .line 1364
    .line 1365
    iget-object p0, p0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 1366
    .line 1367
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 1368
    .line 1369
    const-string v1, "owner_id"

    .line 1370
    .line 1371
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 1372
    .line 1373
    .line 1374
    move-result-object p0

    .line 1375
    filled-new-array {v0, p1, p0}, [Ll/pf60;

    .line 1376
    .line 1377
    .line 1378
    move-result-object p0

    .line 1379
    const-string p1, "e_moment"

    .line 1380
    .line 1381
    invoke-static {p1, p2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 1382
    .line 1383
    .line 1384
    :cond_23
    return-void
.end method

.method public final D0(Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->t:Landroid/widget/TextView;

    .line 2
    .line 3
    const-string v1, "#fe7e1d"

    .line 4
    .line 5
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->t:Landroid/widget/TextView;

    .line 13
    .line 14
    sget v1, Ll/gbc0;->A0:I

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    const-string v0, "\u5979"

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const-string v0, "\u4ed6"

    .line 31
    .line 32
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->u:Landroid/view/View;

    .line 33
    .line 34
    const/4 v2, 0x0

    .line 35
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->isPicksUser()Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_3

    .line 43
    .line 44
    instance-of v1, p1, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;

    .line 45
    .line 46
    if-eqz v1, :cond_3

    .line 47
    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->t:Landroid/widget/TextView;

    .line 49
    .line 50
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->act()Lcom/p1/mobile/android/app/Act;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    sget v3, Ll/gbc0;->z0:I

    .line 55
    .line 56
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-static {v1, v2}, Ll/bnl0;->k(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;)V

    .line 61
    .line 62
    .line 63
    iget-object v1, p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;->item:Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 64
    .line 65
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 66
    .line 67
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/MeetRelation;->status:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 68
    .line 69
    const-string v2, "liked"

    .line 70
    .line 71
    invoke-static {v2}, Lcom/p1/mobile/putong/data/RelationshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    if-eq v1, v2, :cond_2

    .line 76
    .line 77
    iget-object p1, p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;->item:Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 78
    .line 79
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 80
    .line 81
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MeetRelation;->status:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 82
    .line 83
    const-string v1, "superliked"

    .line 84
    .line 85
    invoke-static {v1}, Lcom/p1/mobile/putong/data/RelationshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    if-ne p1, v1, :cond_1

    .line 90
    .line 91
    goto :goto_1

    .line 92
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->t:Landroid/widget/TextView;

    .line 93
    .line 94
    const-string v1, "\u559c\u6b22%s"

    .line 95
    .line 96
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 105
    .line 106
    .line 107
    goto :goto_2

    .line 108
    :cond_2
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->u:Landroid/view/View;

    .line 109
    .line 110
    const/4 v0, 0x1

    .line 111
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 112
    .line 113
    .line 114
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->t:Landroid/widget/TextView;

    .line 115
    .line 116
    const-string v0, "\u5df2\u559c\u6b22"

    .line 117
    .line 118
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 119
    .line 120
    .line 121
    :goto_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->t:Landroid/widget/TextView;

    .line 122
    .line 123
    const-string v0, "#ff4a97"

    .line 124
    .line 125
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 130
    .line 131
    .line 132
    goto/16 :goto_5

    .line 133
    .line 134
    :cond_3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->isSeeUser()Z

    .line 135
    .line 136
    .line 137
    move-result v1

    .line 138
    const-string v2, "\u56de\u5e94%s"

    .line 139
    .line 140
    if-nez v1, :cond_9

    .line 141
    .line 142
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->isSeePortraitUser()Z

    .line 143
    .line 144
    .line 145
    move-result v1

    .line 146
    if-nez v1, :cond_9

    .line 147
    .line 148
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->isMomentBeLikeUser()Z

    .line 149
    .line 150
    .line 151
    move-result v1

    .line 152
    if-eqz v1, :cond_4

    .line 153
    .line 154
    goto/16 :goto_4

    .line 155
    .line 156
    :cond_4
    iget-object p1, p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;->item:Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 157
    .line 158
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->overheating:Lcom/p1/mobile/putong/core/data/OverHeatingStatus;

    .line 159
    .line 160
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/OverHeatingStatus;->isHot:Z

    .line 161
    .line 162
    if-nez v1, :cond_7

    .line 163
    .line 164
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/OverHeatingStatus;->isStop:Z

    .line 165
    .line 166
    if-eqz p1, :cond_5

    .line 167
    .line 168
    goto :goto_3

    .line 169
    :cond_5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 170
    .line 171
    .line 172
    move-result-object p1

    .line 173
    invoke-interface {p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Co()Z

    .line 174
    .line 175
    .line 176
    move-result p1

    .line 177
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->t:Landroid/widget/TextView;

    .line 178
    .line 179
    if-eqz p1, :cond_6

    .line 180
    .line 181
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->act()Lcom/p1/mobile/android/app/Act;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    sget v0, Ll/gbc0;->w0:I

    .line 186
    .line 187
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 188
    .line 189
    .line 190
    move-result-object p1

    .line 191
    invoke-static {v1, p1}, Ll/bnl0;->k(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;)V

    .line 192
    .line 193
    .line 194
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->t:Landroid/widget/TextView;

    .line 195
    .line 196
    sget v0, Lcom/p1/mobile/putong/core/member/R$string;->H:I

    .line 197
    .line 198
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 199
    .line 200
    .line 201
    goto/16 :goto_5

    .line 202
    .line 203
    :cond_6
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->act()Lcom/p1/mobile/android/app/Act;

    .line 204
    .line 205
    .line 206
    move-result-object p1

    .line 207
    sget v3, Ll/gbc0;->C0:I

    .line 208
    .line 209
    invoke-virtual {p1, v3}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 210
    .line 211
    .line 212
    move-result-object p1

    .line 213
    invoke-static {v1, p1}, Ll/bnl0;->k(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;)V

    .line 214
    .line 215
    .line 216
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->t:Landroid/widget/TextView;

    .line 217
    .line 218
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 219
    .line 220
    .line 221
    move-result-object v0

    .line 222
    invoke-static {v2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object v0

    .line 226
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 227
    .line 228
    .line 229
    goto :goto_5

    .line 230
    :cond_7
    :goto_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->t:Landroid/widget/TextView;

    .line 231
    .line 232
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->act()Lcom/p1/mobile/android/app/Act;

    .line 233
    .line 234
    .line 235
    move-result-object v1

    .line 236
    sget v3, Ll/gbc0;->B0:I

    .line 237
    .line 238
    invoke-virtual {v1, v3}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 239
    .line 240
    .line 241
    move-result-object v1

    .line 242
    invoke-static {p1, v1}, Ll/bnl0;->k(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;)V

    .line 243
    .line 244
    .line 245
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 246
    .line 247
    .line 248
    move-result-object p1

    .line 249
    invoke-interface {p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Co()Z

    .line 250
    .line 251
    .line 252
    move-result p1

    .line 253
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->t:Landroid/widget/TextView;

    .line 254
    .line 255
    if-eqz p1, :cond_8

    .line 256
    .line 257
    sget p1, Lcom/p1/mobile/putong/core/member/R$string;->H:I

    .line 258
    .line 259
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(I)V

    .line 260
    .line 261
    .line 262
    goto :goto_5

    .line 263
    :cond_8
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 264
    .line 265
    .line 266
    move-result-object p1

    .line 267
    invoke-static {v2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 268
    .line 269
    .line 270
    move-result-object p1

    .line 271
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 272
    .line 273
    .line 274
    goto :goto_5

    .line 275
    :cond_9
    :goto_4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 276
    .line 277
    .line 278
    move-result-object p1

    .line 279
    invoke-interface {p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Co()Z

    .line 280
    .line 281
    .line 282
    move-result p1

    .line 283
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->t:Landroid/widget/TextView;

    .line 284
    .line 285
    if-eqz p1, :cond_a

    .line 286
    .line 287
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->act()Lcom/p1/mobile/android/app/Act;

    .line 288
    .line 289
    .line 290
    move-result-object p1

    .line 291
    sget v0, Ll/gbc0;->w0:I

    .line 292
    .line 293
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 294
    .line 295
    .line 296
    move-result-object p1

    .line 297
    invoke-static {v1, p1}, Ll/bnl0;->k(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;)V

    .line 298
    .line 299
    .line 300
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->t:Landroid/widget/TextView;

    .line 301
    .line 302
    sget v0, Lcom/p1/mobile/putong/core/member/R$string;->H:I

    .line 303
    .line 304
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 305
    .line 306
    .line 307
    goto :goto_5

    .line 308
    :cond_a
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->act()Lcom/p1/mobile/android/app/Act;

    .line 309
    .line 310
    .line 311
    move-result-object p1

    .line 312
    sget v3, Ll/gbc0;->C0:I

    .line 313
    .line 314
    invoke-virtual {p1, v3}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 315
    .line 316
    .line 317
    move-result-object p1

    .line 318
    invoke-static {v1, p1}, Ll/bnl0;->k(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;)V

    .line 319
    .line 320
    .line 321
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->t:Landroid/widget/TextView;

    .line 322
    .line 323
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 324
    .line 325
    .line 326
    move-result-object v0

    .line 327
    invoke-static {v2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 328
    .line 329
    .line 330
    move-result-object v0

    .line 331
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 332
    .line 333
    .line 334
    :goto_5
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 335
    .line 336
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 337
    .line 338
    .line 339
    move-result-object p1

    .line 340
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I5()Z

    .line 341
    .line 342
    .line 343
    move-result p1

    .line 344
    if-eqz p1, :cond_b

    .line 345
    .line 346
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->t:Landroid/widget/TextView;

    .line 347
    .line 348
    invoke-virtual {p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 349
    .line 350
    .line 351
    move-result-object p1

    .line 352
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->act()Lcom/p1/mobile/android/app/Act;

    .line 353
    .line 354
    .line 355
    move-result-object v0

    .line 356
    sget v1, Lcom/p1/mobile/putong/core/member/R$string;->H:I

    .line 357
    .line 358
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 359
    .line 360
    .line 361
    move-result-object v0

    .line 362
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 363
    .line 364
    .line 365
    move-result p1

    .line 366
    if-eqz p1, :cond_b

    .line 367
    .line 368
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->t:Landroid/widget/TextView;

    .line 369
    .line 370
    const-string v0, "\u62a2\u5148\u544a\u767d"

    .line 371
    .line 372
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 373
    .line 374
    .line 375
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->t:Landroid/widget/TextView;

    .line 376
    .line 377
    const-string v0, "#FF55EE"

    .line 378
    .line 379
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 380
    .line 381
    .line 382
    move-result v0

    .line 383
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 384
    .line 385
    .line 386
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->t:Landroid/widget/TextView;

    .line 387
    .line 388
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->act()Lcom/p1/mobile/android/app/Act;

    .line 389
    .line 390
    .line 391
    move-result-object p1

    .line 392
    sget p2, Ll/gbc0;->x0:I

    .line 393
    .line 394
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 395
    .line 396
    .line 397
    move-result-object p1

    .line 398
    invoke-static {p0, p1}, Ll/bnl0;->k(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;)V

    .line 399
    .line 400
    .line 401
    :cond_b
    return-void
.end method

.method public final E0(Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;

    .line 4
    .line 5
    iget-object v1, v0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    const-string v1, "\u5979"

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const-string v1, "\u4ed6"

    .line 17
    .line 18
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->o:Landroid/widget/ImageView;

    .line 19
    .line 20
    const/high16 v3, 0x41200000    # 10.0f

    .line 21
    .line 22
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    invoke-static {v2, v3}, Ll/bnl0;->h0(Landroid/view/View;I)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->isMomentLikeUser()Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    const/4 v3, 0x1

    .line 34
    if-eqz v2, :cond_1

    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->l:Lv/VText;

    .line 37
    .line 38
    const-string v2, "\u6211\u8d5e\u8fc7"

    .line 39
    .line 40
    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->l:Lv/VText;

    .line 48
    .line 49
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->act()Lcom/p1/mobile/android/app/Act;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    sget v1, Ll/gbc0;->H0:I

    .line 54
    .line 55
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-static {v0, p1}, Ll/bnl0;->k(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;)V

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->n:Lv/VFrame_Shadow;

    .line 63
    .line 64
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 65
    .line 66
    .line 67
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->o:Landroid/widget/ImageView;

    .line 68
    .line 69
    sget p1, Ll/gbc0;->z0:I

    .line 70
    .line 71
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_1
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->isMomentBeLikeUser()Z

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    if-eqz v2, :cond_2

    .line 80
    .line 81
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->l:Lv/VText;

    .line 82
    .line 83
    const-string v2, "\u8d5e\u8fc7\u6211"

    .line 84
    .line 85
    invoke-virtual {v1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->l:Lv/VText;

    .line 93
    .line 94
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->act()Lcom/p1/mobile/android/app/Act;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    sget v1, Ll/gbc0;->H0:I

    .line 99
    .line 100
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    invoke-static {v0, p1}, Ll/bnl0;->k(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;)V

    .line 105
    .line 106
    .line 107
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->n:Lv/VFrame_Shadow;

    .line 108
    .line 109
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 110
    .line 111
    .line 112
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->o:Landroid/widget/ImageView;

    .line 113
    .line 114
    sget p1, Ll/gbc0;->z0:I

    .line 115
    .line 116
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 117
    .line 118
    .line 119
    return-void

    .line 120
    :cond_2
    iget-object v2, v0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;->item:Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 121
    .line 122
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 123
    .line 124
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/MeetRelation;->status:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 125
    .line 126
    const-string v4, "liked"

    .line 127
    .line 128
    invoke-static {v4}, Lcom/p1/mobile/putong/data/RelationshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 129
    .line 130
    .line 131
    move-result-object v4

    .line 132
    if-ne v2, v4, :cond_3

    .line 133
    .line 134
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->l:Lv/VText;

    .line 135
    .line 136
    const-string v2, "\u6211\u559c\u6b22\u4e86"

    .line 137
    .line 138
    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v1

    .line 142
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 143
    .line 144
    .line 145
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->l:Lv/VText;

    .line 146
    .line 147
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->act()Lcom/p1/mobile/android/app/Act;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    sget v1, Ll/gbc0;->E0:I

    .line 152
    .line 153
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 154
    .line 155
    .line 156
    move-result-object p1

    .line 157
    invoke-static {v0, p1}, Ll/bnl0;->k(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;)V

    .line 158
    .line 159
    .line 160
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->n:Lv/VFrame_Shadow;

    .line 161
    .line 162
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 163
    .line 164
    .line 165
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->o:Landroid/widget/ImageView;

    .line 166
    .line 167
    sget p1, Ll/gbc0;->Q0:I

    .line 168
    .line 169
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 170
    .line 171
    .line 172
    return-void

    .line 173
    :cond_3
    iget-object v2, v0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;->item:Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 174
    .line 175
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 176
    .line 177
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/MeetRelation;->status:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 178
    .line 179
    const-string v4, "superliked"

    .line 180
    .line 181
    invoke-static {v4}, Lcom/p1/mobile/putong/data/RelationshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 182
    .line 183
    .line 184
    move-result-object v4

    .line 185
    if-ne v2, v4, :cond_4

    .line 186
    .line 187
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->l:Lv/VText;

    .line 188
    .line 189
    const-string v2, "\u6211\u8d85\u7ea7\u559c\u6b22\u4e86"

    .line 190
    .line 191
    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object v1

    .line 195
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 196
    .line 197
    .line 198
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->l:Lv/VText;

    .line 199
    .line 200
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->act()Lcom/p1/mobile/android/app/Act;

    .line 201
    .line 202
    .line 203
    move-result-object p1

    .line 204
    sget v1, Ll/gbc0;->G0:I

    .line 205
    .line 206
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 207
    .line 208
    .line 209
    move-result-object p1

    .line 210
    invoke-static {v0, p1}, Ll/bnl0;->k(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;)V

    .line 211
    .line 212
    .line 213
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->n:Lv/VFrame_Shadow;

    .line 214
    .line 215
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 216
    .line 217
    .line 218
    move-result-object v0

    .line 219
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Co()Z

    .line 220
    .line 221
    .line 222
    move-result v0

    .line 223
    xor-int/2addr v0, v3

    .line 224
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 225
    .line 226
    .line 227
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->o:Landroid/widget/ImageView;

    .line 228
    .line 229
    sget p1, Ll/gbc0;->y0:I

    .line 230
    .line 231
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 232
    .line 233
    .line 234
    return-void

    .line 235
    :cond_4
    iget-object v2, v0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;->item:Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 236
    .line 237
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 238
    .line 239
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/MeetRelation;->status:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 240
    .line 241
    const-string v4, "lettered"

    .line 242
    .line 243
    invoke-static {v4}, Lcom/p1/mobile/putong/data/RelationshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 244
    .line 245
    .line 246
    move-result-object v4

    .line 247
    if-ne v2, v4, :cond_5

    .line 248
    .line 249
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->l:Lv/VText;

    .line 250
    .line 251
    const-string v1, "\u5df2\u62a2\u5148\u8868\u767d"

    .line 252
    .line 253
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 254
    .line 255
    .line 256
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->l:Lv/VText;

    .line 257
    .line 258
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->act()Lcom/p1/mobile/android/app/Act;

    .line 259
    .line 260
    .line 261
    move-result-object p1

    .line 262
    sget v1, Ll/gbc0;->G0:I

    .line 263
    .line 264
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 265
    .line 266
    .line 267
    move-result-object p1

    .line 268
    invoke-static {v0, p1}, Ll/bnl0;->k(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;)V

    .line 269
    .line 270
    .line 271
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->n:Lv/VFrame_Shadow;

    .line 272
    .line 273
    const/4 p1, 0x0

    .line 274
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 275
    .line 276
    .line 277
    return-void

    .line 278
    :cond_5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->isSeeUser()Z

    .line 279
    .line 280
    .line 281
    move-result v2

    .line 282
    if-eqz v2, :cond_6

    .line 283
    .line 284
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->l:Lv/VText;

    .line 285
    .line 286
    const-string v2, "%s\u559c\u6b22\u4e86\u6211"

    .line 287
    .line 288
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 289
    .line 290
    .line 291
    move-result-object v1

    .line 292
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 293
    .line 294
    .line 295
    move-result-object v1

    .line 296
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 297
    .line 298
    .line 299
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->l:Lv/VText;

    .line 300
    .line 301
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->act()Lcom/p1/mobile/android/app/Act;

    .line 302
    .line 303
    .line 304
    move-result-object p1

    .line 305
    sget v1, Ll/gbc0;->E0:I

    .line 306
    .line 307
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 308
    .line 309
    .line 310
    move-result-object p1

    .line 311
    invoke-static {v0, p1}, Ll/bnl0;->k(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;)V

    .line 312
    .line 313
    .line 314
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->n:Lv/VFrame_Shadow;

    .line 315
    .line 316
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 317
    .line 318
    .line 319
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->o:Landroid/widget/ImageView;

    .line 320
    .line 321
    sget p1, Ll/gbc0;->Q0:I

    .line 322
    .line 323
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 324
    .line 325
    .line 326
    return-void

    .line 327
    :cond_6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->isSeePortraitUser()Z

    .line 328
    .line 329
    .line 330
    move-result v0

    .line 331
    if-eqz v0, :cond_7

    .line 332
    .line 333
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->l:Lv/VText;

    .line 334
    .line 335
    const-string v1, "\u5373\u523b\u804a\u5929"

    .line 336
    .line 337
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 338
    .line 339
    .line 340
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->l:Lv/VText;

    .line 341
    .line 342
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->act()Lcom/p1/mobile/android/app/Act;

    .line 343
    .line 344
    .line 345
    move-result-object p1

    .line 346
    sget v1, Ll/gbc0;->P0:I

    .line 347
    .line 348
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 349
    .line 350
    .line 351
    move-result-object p1

    .line 352
    invoke-static {v0, p1}, Ll/bnl0;->k(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;)V

    .line 353
    .line 354
    .line 355
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->n:Lv/VFrame_Shadow;

    .line 356
    .line 357
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 358
    .line 359
    .line 360
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->o:Landroid/widget/ImageView;

    .line 361
    .line 362
    sget p1, Ll/gbc0;->Q0:I

    .line 363
    .line 364
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 365
    .line 366
    .line 367
    return-void

    .line 368
    :cond_7
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 369
    .line 370
    .line 371
    move-result-object v0

    .line 372
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 373
    .line 374
    .line 375
    move-result-object v0

    .line 376
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Lc()Z

    .line 377
    .line 378
    .line 379
    move-result v0

    .line 380
    if-eqz v0, :cond_8

    .line 381
    .line 382
    const-string v0, "\u7cbe\u9009"

    .line 383
    .line 384
    goto :goto_1

    .line 385
    :cond_8
    const-string v0, "\u6bcf\u65e5\u5fc3\u52a8"

    .line 386
    .line 387
    :goto_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->l:Lv/VText;

    .line 388
    .line 389
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 390
    .line 391
    .line 392
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->l:Lv/VText;

    .line 393
    .line 394
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->act()Lcom/p1/mobile/android/app/Act;

    .line 395
    .line 396
    .line 397
    move-result-object p1

    .line 398
    sget v1, Ll/gbc0;->F0:I

    .line 399
    .line 400
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 401
    .line 402
    .line 403
    move-result-object p1

    .line 404
    invoke-static {v0, p1}, Ll/bnl0;->k(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;)V

    .line 405
    .line 406
    .line 407
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->n:Lv/VFrame_Shadow;

    .line 408
    .line 409
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 410
    .line 411
    .line 412
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->o:Landroid/widget/ImageView;

    .line 413
    .line 414
    sget p1, Ll/gbc0;->Q0:I

    .line 415
    .line 416
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 417
    .line 418
    .line 419
    return-void
.end method

.method public final G0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedItemData;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedItemData;->moment:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x1

    .line 14
    if-ne v0, v1, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 17
    .line 18
    check-cast v0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedItemData;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedItemData;->moment:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 30
    .line 31
    invoke-static {v0}, Ll/cey;->e(Lcom/p1/mobile/putong/data/Media;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v1, Landroidx/constraintlayout/widget/a;

    .line 36
    .line 37
    invoke-direct {v1}, Landroidx/constraintlayout/widget/a;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1, p0}, Landroidx/constraintlayout/widget/a;->c(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    .line 41
    .line 42
    .line 43
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->s:Landroid/widget/FrameLayout;

    .line 44
    .line 45
    invoke-virtual {v2}, Landroid/view/View;->getId()I

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    invoke-virtual {v1, v2, v0}, Landroidx/constraintlayout/widget/a;->q(ILjava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v1, p0}, Landroidx/constraintlayout/widget/a;->a(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_0
    new-instance v0, Landroidx/constraintlayout/widget/a;

    .line 57
    .line 58
    invoke-direct {v0}, Landroidx/constraintlayout/widget/a;-><init>()V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, p0}, Landroidx/constraintlayout/widget/a;->c(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    .line 62
    .line 63
    .line 64
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->s:Landroid/widget/FrameLayout;

    .line 65
    .line 66
    invoke-virtual {v1}, Landroid/view/View;->getId()I

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    const-string v2, "1:1"

    .line 71
    .line 72
    invoke-virtual {v0, v1, v2}, Landroidx/constraintlayout/widget/a;->q(ILjava/lang/String;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0, p0}, Landroidx/constraintlayout/widget/a;->a(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public final H0(Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;)V
    .locals 7

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m1:Lcom/p1/mobile/putong/core/api/s;

    .line 4
    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/s;->q4(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_2

    .line 18
    .line 19
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->liveType:Lcom/p1/mobile/putong/core/data/LiveType;

    .line 20
    .line 21
    const-string v2, "live"

    .line 22
    .line 23
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/LiveType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/LiveType;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    const/4 v3, 0x1

    .line 28
    const-string v4, "meet_feed"

    .line 29
    .line 30
    const-string v5, "meet_realtime_relationship"

    .line 31
    .line 32
    const-string v6, "p_meet"

    .line 33
    .line 34
    if-ne v1, v2, :cond_0

    .line 35
    .line 36
    iget-object v1, p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 37
    .line 38
    invoke-static {p1, v0, v1}, Ll/dby;->b(Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-static {v5, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    const-string v1, "module"

    .line 47
    .line 48
    invoke-static {v1, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    iget-object p1, p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 53
    .line 54
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 55
    .line 56
    const-string v2, "other_user_id"

    .line 57
    .line 58
    invoke-static {v2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    const-string v2, "live_enter_source"

    .line 63
    .line 64
    const-string v4, "realtime_meet"

    .line 65
    .line 66
    invoke-static {v2, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    filled-new-array {v0, v1, p1, v2}, [Ll/pf60;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    const-string v0, "e_live_room_enter"

    .line 75
    .line 76
    invoke-static {v0, v6, p1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 77
    .line 78
    .line 79
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->d:Lcom/tantan/library/svga/SVGAnimationView;

    .line 80
    .line 81
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-static {p1}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    const-string v0, "https://auto.tancdn.com/v1/raw/72743c67-2110-42bd-974e-377e97d0970910.pdf"

    .line 93
    .line 94
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->d:Lcom/tantan/library/svga/SVGAnimationView;

    .line 99
    .line 100
    invoke-virtual {p1, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 101
    .line 102
    .line 103
    return-void

    .line 104
    :cond_0
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->liveType:Lcom/p1/mobile/putong/core/data/LiveType;

    .line 105
    .line 106
    const-string v2, "liveVoice"

    .line 107
    .line 108
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/LiveType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/LiveType;

    .line 109
    .line 110
    .line 111
    move-result-object v2

    .line 112
    if-ne v1, v2, :cond_1

    .line 113
    .line 114
    iget-object v1, p1, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 115
    .line 116
    invoke-static {p1, v0, v1}, Ll/dby;->b(Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    invoke-static {v5, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    const-string v0, "audio_card_type"

    .line 125
    .line 126
    invoke-static {v0, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    filled-new-array {p1, v0}, [Ll/pf60;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    const-string v0, "e_live_audio_room_enter"

    .line 135
    .line 136
    invoke-static {v0, v6, p1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 137
    .line 138
    .line 139
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->d:Lcom/tantan/library/svga/SVGAnimationView;

    .line 140
    .line 141
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    invoke-static {p1}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    const-string v0, "https://auto.tancdn.com/v1/raw/e7598d54-54de-4388-84e1-793927cb7db410.pdf"

    .line 153
    .line 154
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->d:Lcom/tantan/library/svga/SVGAnimationView;

    .line 159
    .line 160
    invoke-virtual {p1, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 161
    .line 162
    .line 163
    :cond_1
    return-void

    .line 164
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->d:Lcom/tantan/library/svga/SVGAnimationView;

    .line 165
    .line 166
    const/4 p1, 0x0

    .line 167
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 168
    .line 169
    .line 170
    return-void
.end method

.method public getContentView()Ll/czl;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->x:Ll/czl;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFeedVisiblePercentInWindow()F
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->s:Landroid/widget/FrameLayout;

    .line 7
    .line 8
    invoke-virtual {v1, v0}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    .line 9
    .line 10
    .line 11
    iget v1, v0, Landroid/graphics/Rect;->bottom:I

    .line 12
    .line 13
    if-lez v1, :cond_0

    .line 14
    .line 15
    iget v0, v0, Landroid/graphics/Rect;->top:I

    .line 16
    .line 17
    sub-int/2addr v1, v0

    .line 18
    int-to-float v0, v1

    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->s:Landroid/widget/FrameLayout;

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    int-to-float p0, p0

    .line 26
    div-float/2addr v0, p0

    .line 27
    return v0

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    return p0
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->x:Ll/czl;

    .line 5
    .line 6
    invoke-interface {p0}, Ll/czl;->release()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->q0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->e:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->get_pic()Lv/VDraweeView;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->z:Lv/VDraweeView;

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->e:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 16
    .line 17
    sget v1, Ll/gbc0;->j:I

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->setPicFailed(I)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->e:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 23
    .line 24
    sget v0, Ll/gbc0;->j:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->setPicPlace(I)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final q0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/q9y;->a(Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final r0(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method

.method public final s0(Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->z:Lv/VDraweeView;

    .line 2
    .line 3
    new-instance v1, Ll/m9y;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/m9y;-><init>(Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 12
    .line 13
    instance-of v0, v0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->p:Landroid/widget/ImageView;

    .line 18
    .line 19
    new-instance v1, Ll/n9y;

    .line 20
    .line 21
    invoke-direct {v1, p0, p1}, Ll/n9y;-><init>(Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->n:Lv/VFrame_Shadow;

    .line 28
    .line 29
    new-instance v1, Ll/o9y;

    .line 30
    .line 31
    invoke-direct {v1, p0, p1}, Ll/o9y;-><init>(Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->t:Landroid/widget/TextView;

    .line 38
    .line 39
    new-instance v1, Ll/p9y;

    .line 40
    .line 41
    invoke-direct {v1, p0, p1}, Ll/p9y;-><init>(Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 45
    .line 46
    .line 47
    :cond_0
    return-void
.end method

.method public setMainContentItemView(Ll/czl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->x:Ll/czl;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic t0(Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 2
    .line 3
    instance-of p2, p0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSeeItemData;

    .line 4
    .line 5
    const-string v0, "p_meet"

    .line 6
    .line 7
    if-eqz p2, :cond_1

    .line 8
    .line 9
    const-string p0, "meet_see"

    .line 10
    .line 11
    const-string p2, "low_pop_level"

    .line 12
    .line 13
    invoke-static {p0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    filled-new-array {p0}, [Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string p2, "e_meet_see_total"

    .line 22
    .line 23
    invoke-static {p2, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 24
    .line 25
    .line 26
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-eqz p0, :cond_0

    .line 37
    .line 38
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Counter;->likersLimit:Lcom/p1/mobile/putong/data/LikersLimit;

    .line 45
    .line 46
    iget p0, p0, Lcom/p1/mobile/putong/data/LikersLimit;->remaining:I

    .line 47
    .line 48
    if-lez p0, :cond_0

    .line 49
    .line 50
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->act()Lcom/p1/mobile/android/app/Act;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->act()Lcom/p1/mobile/android/app/Act;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    const-string p2, "from_meet"

    .line 59
    .line 60
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersAct;->Y1(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    const/16 p2, 0x12

    .line 65
    .line 66
    invoke-virtual {p0, p1, p2}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->act()Lcom/p1/mobile/android/app/Act;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    const-string p2, "p_meet_view,e_see_banner,click"

    .line 83
    .line 84
    invoke-interface {p0, p1, p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->l1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :cond_1
    instance-of p2, p0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;

    .line 89
    .line 90
    if-eqz p2, :cond_8

    .line 91
    .line 92
    check-cast p0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;

    .line 93
    .line 94
    iget-object p2, p0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 95
    .line 96
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 97
    .line 98
    const-string v1, "other_user_id"

    .line 99
    .line 100
    invoke-static {v1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 101
    .line 102
    .line 103
    move-result-object p2

    .line 104
    filled-new-array {p2}, [Ll/pf60;

    .line 105
    .line 106
    .line 107
    move-result-object p2

    .line 108
    const-string v2, "e_meet_card_avatar"

    .line 109
    .line 110
    invoke-static {v2, v0, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 111
    .line 112
    .line 113
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 114
    .line 115
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->m1:Lcom/p1/mobile/putong/core/api/s;

    .line 116
    .line 117
    iget-object v2, p0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 118
    .line 119
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 120
    .line 121
    invoke-virtual {p2, v2}, Lcom/p1/mobile/putong/core/api/s;->q4(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;

    .line 122
    .line 123
    .line 124
    move-result-object p2

    .line 125
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    move-result v2

    .line 129
    if-eqz v2, :cond_3

    .line 130
    .line 131
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->liveType:Lcom/p1/mobile/putong/core/data/LiveType;

    .line 132
    .line 133
    const-string v3, "live"

    .line 134
    .line 135
    invoke-static {v3}, Lcom/p1/mobile/putong/core/data/LiveType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/LiveType;

    .line 136
    .line 137
    .line 138
    move-result-object v3

    .line 139
    const-string v4, "meet_feed"

    .line 140
    .line 141
    const-string v5, "meet_realtime_relationship"

    .line 142
    .line 143
    if-ne v2, v3, :cond_2

    .line 144
    .line 145
    iget-object v2, p0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 146
    .line 147
    invoke-static {p0, p2, v2}, Ll/dby;->b(Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v2

    .line 151
    invoke-static {v5, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 152
    .line 153
    .line 154
    move-result-object v2

    .line 155
    const-string v3, "module"

    .line 156
    .line 157
    invoke-static {v3, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 158
    .line 159
    .line 160
    move-result-object v3

    .line 161
    iget-object v4, p0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 162
    .line 163
    iget-object v4, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 164
    .line 165
    invoke-static {v1, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 166
    .line 167
    .line 168
    move-result-object v1

    .line 169
    const-string v4, "live_enter_source"

    .line 170
    .line 171
    const-string v5, "realtime_meet"

    .line 172
    .line 173
    invoke-static {v4, v5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 174
    .line 175
    .line 176
    move-result-object v4

    .line 177
    filled-new-array {v2, v3, v1, v4}, [Ll/pf60;

    .line 178
    .line 179
    .line 180
    move-result-object v1

    .line 181
    const-string v2, "e_live_room_enter"

    .line 182
    .line 183
    invoke-static {v2, v0, v1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 184
    .line 185
    .line 186
    iget-object p0, p0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 187
    .line 188
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 189
    .line 190
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->roomId:Ljava/lang/String;

    .line 191
    .line 192
    invoke-virtual {p1, p0, p2}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->n1(Ljava/lang/String;Ljava/lang/String;)V

    .line 193
    .line 194
    .line 195
    return-void

    .line 196
    :cond_2
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->liveType:Lcom/p1/mobile/putong/core/data/LiveType;

    .line 197
    .line 198
    const-string v2, "liveVoice"

    .line 199
    .line 200
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/LiveType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/LiveType;

    .line 201
    .line 202
    .line 203
    move-result-object v2

    .line 204
    if-ne v1, v2, :cond_8

    .line 205
    .line 206
    iget-object v1, p0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 207
    .line 208
    invoke-static {p0, p2, v1}, Ll/dby;->b(Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v1

    .line 212
    invoke-static {v5, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 213
    .line 214
    .line 215
    move-result-object v1

    .line 216
    const-string v2, "audio_card_type"

    .line 217
    .line 218
    invoke-static {v2, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 219
    .line 220
    .line 221
    move-result-object v2

    .line 222
    filled-new-array {v1, v2}, [Ll/pf60;

    .line 223
    .line 224
    .line 225
    move-result-object v1

    .line 226
    const-string v2, "e_live_audio_room_enter"

    .line 227
    .line 228
    invoke-static {v2, v0, v1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 229
    .line 230
    .line 231
    iget-object p0, p0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 232
    .line 233
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 234
    .line 235
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->roomId:Ljava/lang/String;

    .line 236
    .line 237
    invoke-virtual {p1, p0, p2}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->o1(Ljava/lang/String;Ljava/lang/String;)V

    .line 238
    .line 239
    .line 240
    return-void

    .line 241
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->isLikedUser()Z

    .line 242
    .line 243
    .line 244
    move-result p2

    .line 245
    const/16 v0, 0x10

    .line 246
    .line 247
    if-eqz p2, :cond_4

    .line 248
    .line 249
    invoke-static {}, Lcom/p1/mobile/putong/core/data/LikedUser;->new_()Lcom/p1/mobile/putong/core/data/LikedUser;

    .line 250
    .line 251
    .line 252
    move-result-object p2

    .line 253
    iget-object v1, p0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 254
    .line 255
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 256
    .line 257
    iput-object v1, p2, Lcom/p1/mobile/putong/core/data/LikedUser;->id:Ljava/lang/String;

    .line 258
    .line 259
    iget-object v1, p0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;->item:Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 260
    .line 261
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 262
    .line 263
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/MeetRelation;->status:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 264
    .line 265
    iput-object v2, p2, Lcom/p1/mobile/putong/core/data/LikedUser;->status:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 266
    .line 267
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/MeetRelation;->otherStatus:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 268
    .line 269
    iput-object v1, p2, Lcom/p1/mobile/putong/core/data/LikedUser;->otherStatus:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 270
    .line 271
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 272
    .line 273
    .line 274
    move-result-object v1

    .line 275
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 276
    .line 277
    .line 278
    move-result-object v1

    .line 279
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->act()Lcom/p1/mobile/android/app/Act;

    .line 280
    .line 281
    .line 282
    move-result-object v2

    .line 283
    iget-object p0, p0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 284
    .line 285
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 286
    .line 287
    invoke-interface {v1, v2, p0, p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Rj(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/LikedUser;)Landroid/content/Intent;

    .line 288
    .line 289
    .line 290
    move-result-object p0

    .line 291
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->act()Lcom/p1/mobile/android/app/Act;

    .line 292
    .line 293
    .line 294
    move-result-object p1

    .line 295
    invoke-virtual {p1, p0, v0}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 296
    .line 297
    .line 298
    return-void

    .line 299
    :cond_4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->isSeeUser()Z

    .line 300
    .line 301
    .line 302
    move-result p2

    .line 303
    if-nez p2, :cond_6

    .line 304
    .line 305
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->isSeePortraitUser()Z

    .line 306
    .line 307
    .line 308
    move-result p2

    .line 309
    if-nez p2, :cond_6

    .line 310
    .line 311
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->isMomentBeLikeUser()Z

    .line 312
    .line 313
    .line 314
    move-result p2

    .line 315
    if-nez p2, :cond_6

    .line 316
    .line 317
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->isMomentLikeUser()Z

    .line 318
    .line 319
    .line 320
    move-result p2

    .line 321
    if-eqz p2, :cond_5

    .line 322
    .line 323
    goto :goto_0

    .line 324
    :cond_5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 325
    .line 326
    .line 327
    move-result-object p2

    .line 328
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 329
    .line 330
    .line 331
    move-result-object p2

    .line 332
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->act()Lcom/p1/mobile/android/app/Act;

    .line 333
    .line 334
    .line 335
    move-result-object v1

    .line 336
    iget-object p0, p0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 337
    .line 338
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 339
    .line 340
    invoke-interface {p2, v1, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->mt(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Landroid/content/Intent;

    .line 341
    .line 342
    .line 343
    move-result-object p0

    .line 344
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->act()Lcom/p1/mobile/android/app/Act;

    .line 345
    .line 346
    .line 347
    move-result-object p1

    .line 348
    invoke-virtual {p1, p0, v0}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 349
    .line 350
    .line 351
    return-void

    .line 352
    :cond_6
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->isLowSeeSingleUser()Z

    .line 353
    .line 354
    .line 355
    move-result p2

    .line 356
    if-eqz p2, :cond_7

    .line 357
    .line 358
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 359
    .line 360
    .line 361
    move-result-object p2

    .line 362
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 363
    .line 364
    .line 365
    move-result-object p2

    .line 366
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->e2()Z

    .line 367
    .line 368
    .line 369
    move-result p2

    .line 370
    if-eqz p2, :cond_7

    .line 371
    .line 372
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 373
    .line 374
    .line 375
    move-result-object p0

    .line 376
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 377
    .line 378
    .line 379
    move-result-object p0

    .line 380
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->act()Lcom/p1/mobile/android/app/Act;

    .line 381
    .line 382
    .line 383
    move-result-object p1

    .line 384
    const-string p2, ""

    .line 385
    .line 386
    invoke-interface {p0, p1, p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->l1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 387
    .line 388
    .line 389
    return-void

    .line 390
    :cond_7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 391
    .line 392
    .line 393
    move-result-object p2

    .line 394
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 395
    .line 396
    .line 397
    move-result-object p2

    .line 398
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->act()Lcom/p1/mobile/android/app/Act;

    .line 399
    .line 400
    .line 401
    move-result-object v1

    .line 402
    iget-object p0, p0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 403
    .line 404
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 405
    .line 406
    invoke-interface {p2, v1, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Sq(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Landroid/content/Intent;

    .line 407
    .line 408
    .line 409
    move-result-object p0

    .line 410
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->act()Lcom/p1/mobile/android/app/Act;

    .line 411
    .line 412
    .line 413
    move-result-object p1

    .line 414
    invoke-virtual {p1, p0, v0}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 415
    .line 416
    .line 417
    :cond_8
    return-void
.end method

.method public final synthetic u0(Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;

    .line 4
    .line 5
    const/4 p2, 0x0

    .line 6
    invoke-virtual {p1, p0, p2}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->h1(Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic v0(Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;Landroid/view/View;)V
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;

    .line 4
    .line 5
    iget-object p2, p0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;->item:Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 6
    .line 7
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 8
    .line 9
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/MeetRelation;->status:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 10
    .line 11
    const-string v0, "liked"

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/putong/data/RelationshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const/4 v1, 0x1

    .line 18
    const/4 v2, 0x0

    .line 19
    const-string v3, "I_like_say_hi"

    .line 20
    .line 21
    if-ne p2, v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p1, p0, v1, v1, v2}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->f1(Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;ZZZ)V

    .line 24
    .line 25
    .line 26
    goto :goto_1

    .line 27
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;->item:Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 28
    .line 29
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 30
    .line 31
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/MeetRelation;->status:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 32
    .line 33
    const-string v0, "superliked"

    .line 34
    .line 35
    invoke-static {v0}, Lcom/p1/mobile/putong/data/RelationshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    if-ne p2, v0, :cond_1

    .line 40
    .line 41
    invoke-virtual {p1, p0, v1, v1, v1}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->f1(Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;ZZZ)V

    .line 42
    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->isSeeUser()Z

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    if-nez p2, :cond_6

    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->isSeePortraitUser()Z

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    if-eqz p2, :cond_2

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->isPicksUser()Z

    .line 59
    .line 60
    .line 61
    move-result p2

    .line 62
    if-eqz p2, :cond_3

    .line 63
    .line 64
    invoke-virtual {p1, p0, v1, v1, v2}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->f1(Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;ZZZ)V

    .line 65
    .line 66
    .line 67
    const-string v3, "picks_say_hi"

    .line 68
    .line 69
    goto :goto_1

    .line 70
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->isMomentBeLikeUser()Z

    .line 71
    .line 72
    .line 73
    move-result p2

    .line 74
    if-nez p2, :cond_4

    .line 75
    .line 76
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->isMomentLikeUser()Z

    .line 77
    .line 78
    .line 79
    move-result p2

    .line 80
    if-eqz p2, :cond_5

    .line 81
    .line 82
    :cond_4
    invoke-virtual {p1, p0, v1, v2, v2}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->f1(Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;ZZZ)V

    .line 83
    .line 84
    .line 85
    :cond_5
    move v1, v2

    .line 86
    goto :goto_1

    .line 87
    :cond_6
    :goto_0
    invoke-virtual {p1, p0, v1, v1, v2}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->f1(Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;ZZZ)V

    .line 88
    .line 89
    .line 90
    const-string v3, "high_level_pop_see_say_hi"

    .line 91
    .line 92
    :goto_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 93
    .line 94
    const-string p1, "other_user_id"

    .line 95
    .line 96
    const-string p2, "p_meet"

    .line 97
    .line 98
    const-string v0, "e_meet_card_superlike"

    .line 99
    .line 100
    if-eqz v1, :cond_7

    .line 101
    .line 102
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 103
    .line 104
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    const-string p1, "meet_say_hi_relationship"

    .line 109
    .line 110
    invoke-static {p1, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    filled-new-array {p0, p1}, [Ll/pf60;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-static {v0, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 119
    .line 120
    .line 121
    return-void

    .line 122
    :cond_7
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 123
    .line 124
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    filled-new-array {p0}, [Ll/pf60;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    invoke-static {v0, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 133
    .line 134
    .line 135
    return-void
.end method

.method public final synthetic w0(Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;Landroid/view/View;)V
    .locals 8

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;

    .line 4
    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->isSeeUser()Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    const/4 v0, 0x1

    .line 10
    const/4 v1, 0x0

    .line 11
    const-string v2, "other_user_id"

    .line 12
    .line 13
    const-string v3, "meet_say_hi_relationship"

    .line 14
    .line 15
    const-string v4, "p_meet"

    .line 16
    .line 17
    const-string v5, "e_meet_card_sayhi"

    .line 18
    .line 19
    if-nez p2, :cond_6

    .line 20
    .line 21
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 22
    .line 23
    check-cast p2, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;

    .line 24
    .line 25
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->isSeePortraitUser()Z

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    if-nez p2, :cond_6

    .line 30
    .line 31
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 32
    .line 33
    check-cast p2, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;

    .line 34
    .line 35
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->isMomentBeLikeUser()Z

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    if-nez p2, :cond_6

    .line 40
    .line 41
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 42
    .line 43
    check-cast p2, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;

    .line 44
    .line 45
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->isMomentLikeUser()Z

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    if-eqz p2, :cond_0

    .line 50
    .line 51
    goto/16 :goto_2

    .line 52
    .line 53
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 54
    .line 55
    instance-of v6, p2, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;

    .line 56
    .line 57
    const-string v7, "picks_say_hi"

    .line 58
    .line 59
    if-eqz v6, :cond_2

    .line 60
    .line 61
    check-cast p2, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;

    .line 62
    .line 63
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->isPicksUser()Z

    .line 64
    .line 65
    .line 66
    move-result p2

    .line 67
    if-eqz p2, :cond_2

    .line 68
    .line 69
    invoke-static {v3, v7}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 74
    .line 75
    check-cast v3, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;

    .line 76
    .line 77
    iget-object v3, v3, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 78
    .line 79
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 80
    .line 81
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    filled-new-array {p2, v2}, [Ll/pf60;

    .line 86
    .line 87
    .line 88
    move-result-object p2

    .line 89
    invoke-static {v5, v4, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 90
    .line 91
    .line 92
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->u:Landroid/view/View;

    .line 93
    .line 94
    invoke-static {p2}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 95
    .line 96
    .line 97
    move-result p2

    .line 98
    if-eqz p2, :cond_1

    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 102
    .line 103
    check-cast p0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;

    .line 104
    .line 105
    invoke-virtual {p1, p0, v0, v1, v1}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->f1(Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;ZZZ)V

    .line 106
    .line 107
    .line 108
    return-void

    .line 109
    :cond_2
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 110
    .line 111
    instance-of v0, p2, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;

    .line 112
    .line 113
    if-eqz v0, :cond_3

    .line 114
    .line 115
    check-cast p2, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;

    .line 116
    .line 117
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->isLikedUser()Z

    .line 118
    .line 119
    .line 120
    move-result p2

    .line 121
    if-eqz p2, :cond_3

    .line 122
    .line 123
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 124
    .line 125
    check-cast p0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;

    .line 126
    .line 127
    const/4 p2, 0x0

    .line 128
    invoke-virtual {p1, p0, p2, p2}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->i1(Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;Ljava/lang/String;Ljava/lang/Object;)V

    .line 129
    .line 130
    .line 131
    return-void

    .line 132
    :cond_3
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 133
    .line 134
    instance-of v0, p2, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedItemData;

    .line 135
    .line 136
    if-eqz v0, :cond_5

    .line 137
    .line 138
    check-cast p2, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedItemData;

    .line 139
    .line 140
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->isPicksUser()Z

    .line 141
    .line 142
    .line 143
    move-result p2

    .line 144
    if-eqz p2, :cond_4

    .line 145
    .line 146
    invoke-static {v3, v7}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 147
    .line 148
    .line 149
    move-result-object p2

    .line 150
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 151
    .line 152
    check-cast v0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;

    .line 153
    .line 154
    iget-object v0, v0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 155
    .line 156
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 157
    .line 158
    invoke-static {v2, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    filled-new-array {p2, v0}, [Ll/pf60;

    .line 163
    .line 164
    .line 165
    move-result-object p2

    .line 166
    invoke-static {v5, v4, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 167
    .line 168
    .line 169
    goto :goto_0

    .line 170
    :cond_4
    const-string p2, "i_like_say_hi"

    .line 171
    .line 172
    invoke-static {v3, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 173
    .line 174
    .line 175
    move-result-object p2

    .line 176
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 177
    .line 178
    check-cast v0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;

    .line 179
    .line 180
    iget-object v0, v0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 181
    .line 182
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 183
    .line 184
    invoke-static {v2, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    filled-new-array {p2, v0}, [Ll/pf60;

    .line 189
    .line 190
    .line 191
    move-result-object p2

    .line 192
    invoke-static {v5, v4, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 193
    .line 194
    .line 195
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 196
    .line 197
    check-cast p0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedItemData;

    .line 198
    .line 199
    iget-object p2, p0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedItemData;->moment:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 200
    .line 201
    iget-object p2, p2, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 202
    .line 203
    iget-object v0, p0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedItemData;->originalMoment:Ljava/lang/Object;

    .line 204
    .line 205
    invoke-virtual {p1, p0, p2, v0}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->i1(Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;Ljava/lang/String;Ljava/lang/Object;)V

    .line 206
    .line 207
    .line 208
    :cond_5
    :goto_1
    return-void

    .line 209
    :cond_6
    :goto_2
    const-string p2, "high_level_pop_see_say_hi"

    .line 210
    .line 211
    invoke-static {v3, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 212
    .line 213
    .line 214
    move-result-object p2

    .line 215
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 216
    .line 217
    check-cast v3, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;

    .line 218
    .line 219
    iget-object v3, v3, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 220
    .line 221
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 222
    .line 223
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 224
    .line 225
    .line 226
    move-result-object v2

    .line 227
    filled-new-array {p2, v2}, [Ll/pf60;

    .line 228
    .line 229
    .line 230
    move-result-object p2

    .line 231
    invoke-static {v5, v4, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 232
    .line 233
    .line 234
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 235
    .line 236
    check-cast p0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;

    .line 237
    .line 238
    invoke-virtual {p1, p0, v0, v1, v1}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;->f1(Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;ZZZ)V

    .line 239
    .line 240
    .line 241
    return-void
.end method

.method public final synthetic z0(Lcom/p1/mobile/putong/data/User;Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/MeetFeedBaseItemView;->y:Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;

    .line 4
    .line 5
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;->isAllShow:Z

    .line 6
    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    const-string p0, "other_user_id"

    .line 10
    .line 11
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    filled-new-array {p0}, [Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string p1, "e_meet_card_unfold"

    .line 22
    .line 23
    const-string p2, "p_meet"

    .line 24
    .line 25
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method
