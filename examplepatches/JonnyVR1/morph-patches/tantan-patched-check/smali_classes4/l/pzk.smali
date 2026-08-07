.class public Ll/pzk;
.super Ll/f6l;
.source "SourceFile"

# interfaces
.implements Ll/aof;


# instance fields
.field public A:Landroid/view/ViewStub;

.field public B:Lcom/p1/mobile/putong/core/ui/likeminded/LikeMindedCardTabView;

.field public C:Landroid/view/ViewStub;

.field public D:Lv/VText;

.field public E:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;

.field public F:Landroid/view/View;

.field public G:Lv/VFrame;

.field public H:Landroid/view/ViewStub;

.field public I:Landroid/view/ViewStub;

.field public J:Lv/VImage;

.field public K:Landroid/widget/LinearLayout;

.field public L:Lcom/tantan/library/svga/SVGAnimationView;

.field public M:Landroid/widget/LinearLayout;

.field public N:Lv/VText;

.field public O:Lv/VImage;

.field public P:Lcom/p1/mobile/putong/data/User;

.field public Q:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

.field public R:Ll/aoh0;

.field public S:Ll/kcg0;

.field public T:Ll/kcg0;

.field public U:J

.field public V:Z

.field public W:Z

.field public X:Lv/VDraweeView;

.field public Y:Z

.field public Z:Lcom/p1/mobile/putong/core/ui/intloperation/regularsticker/RegularStickerCardTabView;

.field public a0:Lcom/p1/mobile/putong/core/ui/animalfacial/AnimalFacialCardView;

.field public b0:Lv/VImage;

.field public c0:Lv/VText;

.field public d0:Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;

.field public e0:Z

.field public f:Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;

.field public f0:Z

.field public g:Lv/VFrame;

.field public g0:Ljava/lang/String;

.field public h:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

.field public h0:Z

.field public i:Landroid/view/View;

.field public i0:Ljava/lang/String;

.field public j:Lv/VImage;

.field public k:Lv/VFrame;

.field public l:Lcom/p1/mobile/putong/core/newui/view/LinearMeasureOrderLayout;

.field public m:Lv/VText;

.field public n:Lv/VText;

.field public o:Lv/VFrame;

.field public p:Lcom/tantan/library/svga/SVGAnimationView;

.field public q:Lv/VText;

.field public r:Landroid/view/ViewStub;

.field public s:Landroid/view/ViewStub;

.field public t:Lv/VImage;

.field public u:Landroid/widget/FrameLayout;

.field public v:Lv/VImage;

.field public w:Lv/VImage;

.field public x:Lv/VLinear;

.field public y:Lv/VText;

.field public z:Lv/VImage;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/f6l;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Ll/pzk;->U:J

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Ll/pzk;->V:Z

    .line 10
    .line 11
    iput-boolean v0, p0, Ll/pzk;->W:Z

    .line 12
    .line 13
    iput-boolean v0, p0, Ll/pzk;->Y:Z

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    iput-object v1, p0, Ll/pzk;->b0:Lv/VImage;

    .line 17
    .line 18
    iput-object v1, p0, Ll/pzk;->c0:Lv/VText;

    .line 19
    .line 20
    iput-boolean v0, p0, Ll/pzk;->h0:Z

    .line 21
    .line 22
    return-void
.end method

.method public static synthetic D(Ll/pzk;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/UserLiveState;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/pzk;->s0(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/UserLiveState;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic E(Ll/pzk;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pzk;->p0(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic F(Ll/pzk;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/pzk;->q0(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic G(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper$b;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper$b;->c:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    goto :goto_1

    .line 18
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 19
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public static synthetic H(Ll/pzk;ZLcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/pzk;->r0(ZLcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic I(Ll/pzk;Lcom/p1/mobile/putong/data/User;ZLandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/pzk;->m0(Lcom/p1/mobile/putong/data/User;ZLandroid/view/View;)V

    return-void
.end method

.method public static synthetic J()Lkotlin/Unit;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->i2:Lrx/subjects/b;

    .line 6
    .line 7
    sget-object v1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    return-object v0
.end method

.method public static synthetic K(Ll/pzk;Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pzk;->o0(Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper$b;)V

    return-void
.end method

.method public static synthetic L(Ll/pzk;ZLcom/p1/mobile/putong/data/User;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/pzk;->n0(ZLcom/p1/mobile/putong/data/User;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic M(Ll/pzk;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/UserLiveState;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/pzk;->t0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/UserLiveState;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic N(Ll/pzk;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pzk;->l0(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic O(Ll/pzk;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/pzk;->V:Z

    return p0
.end method

.method public static bridge synthetic P(Ll/pzk;)Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pzk;->Q:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    return-object p0
.end method

.method public static bridge synthetic Q(Ll/pzk;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pzk;->X()V

    return-void
.end method

.method public static bridge synthetic R(Ll/pzk;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pzk;->i0()V

    return-void
.end method

.method public static bridge synthetic S(Ll/pzk;F)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pzk;->G0(F)V

    return-void
.end method

.method public static bridge synthetic T(Ll/pzk;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pzk;->L0()V

    return-void
.end method

.method public static bridge synthetic U(Ll/pzk;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pzk;->M0()V

    return-void
.end method


# virtual methods
.method public final A0(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;)V
    .locals 9

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/pzk;->f0:Z

    .line 3
    .line 4
    iget-object v1, p0, Ll/pzk;->K:Landroid/widget/LinearLayout;

    .line 5
    .line 6
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object v1, p0, Ll/pzk;->o:Lv/VFrame;

    .line 10
    .line 11
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Ll/vq8;->b()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_b

    .line 19
    .line 20
    sget-object v1, Ll/uqb0;->b0:Ll/sre0;

    .line 21
    .line 22
    iget-object v1, v1, Ll/sre0;->c:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 23
    .line 24
    invoke-interface {v1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Bq()Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-nez v1, :cond_0

    .line 29
    .line 30
    goto/16 :goto_3

    .line 31
    .line 32
    :cond_0
    iget-object v5, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 33
    .line 34
    iget-object v6, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->from:Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-interface {v1, v5}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->lt(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserLiveState;

    .line 41
    .line 42
    .line 43
    move-result-object v7

    .line 44
    iget-object v1, p0, Ll/pzk;->K:Landroid/widget/LinearLayout;

    .line 45
    .line 46
    const/4 v2, 0x0

    .line 47
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 48
    .line 49
    .line 50
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 51
    .line 52
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 53
    .line 54
    invoke-virtual {v1, v5}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 59
    .line 60
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 61
    .line 62
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/CoreSuggested;->o2:Ljava/lang/String;

    .line 63
    .line 64
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    if-nez v2, :cond_1

    .line 69
    .line 70
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 71
    .line 72
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 73
    .line 74
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/CoreSuggested;->o2:Ljava/lang/String;

    .line 75
    .line 76
    invoke-static {v2, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    if-eqz v2, :cond_1

    .line 81
    .line 82
    if-nez v1, :cond_1

    .line 83
    .line 84
    return-void

    .line 85
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-interface {v1, v5}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->getUserLiveId(Ljava/lang/String;)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    if-nez v1, :cond_2

    .line 98
    .line 99
    goto/16 :goto_3

    .line 100
    .line 101
    :cond_2
    const/4 v1, 0x1

    .line 102
    iput-boolean v1, p0, Ll/pzk;->f0:Z

    .line 103
    .line 104
    iget-object v2, p0, Ll/pzk;->K:Landroid/widget/LinearLayout;

    .line 105
    .line 106
    iget-object v3, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->renderFrom:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 107
    .line 108
    sget-object v8, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->PROFILE:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 109
    .line 110
    if-eq v3, v8, :cond_4

    .line 111
    .line 112
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->o()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->s()Z

    .line 117
    .line 118
    .line 119
    move-result v3

    .line 120
    if-eqz v3, :cond_3

    .line 121
    .line 122
    goto :goto_0

    .line 123
    :cond_3
    move v3, v0

    .line 124
    goto :goto_1

    .line 125
    :cond_4
    :goto_0
    move v3, v1

    .line 126
    :goto_1
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 127
    .line 128
    .line 129
    iget-object v2, p0, Ll/pzk;->o:Lv/VFrame;

    .line 130
    .line 131
    iget-object v3, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->renderFrom:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 132
    .line 133
    if-eq v3, v8, :cond_5

    .line 134
    .line 135
    move v0, v1

    .line 136
    :cond_5
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 137
    .line 138
    .line 139
    iget-object v0, p0, Ll/pzk;->N:Lv/VText;

    .line 140
    .line 141
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 142
    .line 143
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 144
    .line 145
    .line 146
    iget-object v0, p0, Ll/pzk;->K:Landroid/widget/LinearLayout;

    .line 147
    .line 148
    new-instance v2, Ll/gzk;

    .line 149
    .line 150
    move-object v3, p0

    .line 151
    move-object v4, p2

    .line 152
    invoke-direct/range {v2 .. v7}, Ll/gzk;-><init>(Ll/pzk;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/UserLiveState;)V

    .line 153
    .line 154
    .line 155
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 156
    .line 157
    .line 158
    iget-object p0, v3, Ll/pzk;->o:Lv/VFrame;

    .line 159
    .line 160
    new-instance p2, Ll/hzk;

    .line 161
    .line 162
    invoke-direct {p2, v3, v4, v7, v6}, Ll/hzk;-><init>(Ll/pzk;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/UserLiveState;Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    invoke-static {p0, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 166
    .line 167
    .line 168
    iget-object p0, v3, Ll/pzk;->g0:Ljava/lang/String;

    .line 169
    .line 170
    invoke-static {p0, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 171
    .line 172
    .line 173
    move-result p0

    .line 174
    if-nez p0, :cond_6

    .line 175
    .line 176
    iput-object v5, v3, Ll/pzk;->g0:Ljava/lang/String;

    .line 177
    .line 178
    const-string p0, "p_suggest_user_profile_info_view"

    .line 179
    .line 180
    invoke-virtual {v3, v4, v7, v6}, Ll/pzk;->Z(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/UserLiveState;Ljava/lang/String;)Ljava/util/HashMap;

    .line 181
    .line 182
    .line 183
    move-result-object p2

    .line 184
    const-string v0, "e_live_room_enter"

    .line 185
    .line 186
    invoke-static {v0, p0, p2}, Ll/i4g0;->y(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 187
    .line 188
    .line 189
    :cond_6
    if-eqz v7, :cond_7

    .line 190
    .line 191
    iget-object p0, v7, Lcom/p1/mobile/putong/data/UserLiveState;->multiCallInfo:Lcom/p1/mobile/putong/data/LiveMultiCallInfo;

    .line 192
    .line 193
    iget-object p0, p0, Lcom/p1/mobile/putong/data/LiveMultiCallInfo;->onGoingMultiCallId:Ljava/lang/String;

    .line 194
    .line 195
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 196
    .line 197
    .line 198
    move-result p0

    .line 199
    if-nez p0, :cond_7

    .line 200
    .line 201
    iget-object p0, v3, Ll/pzk;->N:Lv/VText;

    .line 202
    .line 203
    sget p2, Lcom/p1/mobile/putong/core/R$string;->yh:I

    .line 204
    .line 205
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(I)V

    .line 206
    .line 207
    .line 208
    iget-object p0, v3, Ll/pzk;->q:Lv/VText;

    .line 209
    .line 210
    sget p2, Lcom/p1/mobile/putong/core/R$string;->yh:I

    .line 211
    .line 212
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(I)V

    .line 213
    .line 214
    .line 215
    goto :goto_2

    .line 216
    :cond_7
    iget-object p0, v3, Ll/pzk;->N:Lv/VText;

    .line 217
    .line 218
    sget p2, Lcom/p1/mobile/putong/core/R$string;->xh:I

    .line 219
    .line 220
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(I)V

    .line 221
    .line 222
    .line 223
    iget-object p0, v3, Ll/pzk;->q:Lv/VText;

    .line 224
    .line 225
    sget p2, Lcom/p1/mobile/putong/core/R$string;->xh:I

    .line 226
    .line 227
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(I)V

    .line 228
    .line 229
    .line 230
    :goto_2
    iget-object p0, v3, Ll/pzk;->L:Lcom/tantan/library/svga/SVGAnimationView;

    .line 231
    .line 232
    invoke-virtual {p0}, Lcom/tantan/library/svga/SVGAnimationView;->isAnimating()Z

    .line 233
    .line 234
    .line 235
    move-result p0

    .line 236
    const-string p2, "https://auto.tancdn.com/v1/raw/b83d11f9-6b88-41a2-a0dd-c3617bde118510.so"

    .line 237
    .line 238
    if-nez p0, :cond_8

    .line 239
    .line 240
    invoke-virtual {v3}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 241
    .line 242
    .line 243
    move-result-object p0

    .line 244
    invoke-static {p0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 245
    .line 246
    .line 247
    move-result-object p0

    .line 248
    invoke-virtual {p0, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 249
    .line 250
    .line 251
    move-result-object p0

    .line 252
    iget-object v0, v3, Ll/pzk;->L:Lcom/tantan/library/svga/SVGAnimationView;

    .line 253
    .line 254
    invoke-virtual {p0, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 255
    .line 256
    .line 257
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->renderFrom:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 258
    .line 259
    if-eq p0, v8, :cond_9

    .line 260
    .line 261
    iget-object p0, v3, Ll/pzk;->p:Lcom/tantan/library/svga/SVGAnimationView;

    .line 262
    .line 263
    invoke-virtual {p0}, Lcom/tantan/library/svga/SVGAnimationView;->isAnimating()Z

    .line 264
    .line 265
    .line 266
    move-result p0

    .line 267
    if-nez p0, :cond_9

    .line 268
    .line 269
    invoke-virtual {v3}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 270
    .line 271
    .line 272
    move-result-object p0

    .line 273
    invoke-static {p0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 274
    .line 275
    .line 276
    move-result-object p0

    .line 277
    invoke-virtual {p0, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 278
    .line 279
    .line 280
    move-result-object p0

    .line 281
    iget-object p1, v3, Ll/pzk;->p:Lcom/tantan/library/svga/SVGAnimationView;

    .line 282
    .line 283
    invoke-virtual {p0, p1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 284
    .line 285
    .line 286
    :cond_9
    iget-boolean p0, v3, Ll/pzk;->W:Z

    .line 287
    .line 288
    iget-object p1, v3, Ll/pzk;->K:Landroid/widget/LinearLayout;

    .line 289
    .line 290
    if-eqz p0, :cond_a

    .line 291
    .line 292
    const/high16 p0, 0x42480000    # 50.0f

    .line 293
    .line 294
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 295
    .line 296
    .line 297
    move-result p0

    .line 298
    invoke-static {p1, p0}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 299
    .line 300
    .line 301
    return-void

    .line 302
    :cond_a
    const/high16 p0, 0x41a00000    # 20.0f

    .line 303
    .line 304
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 305
    .line 306
    .line 307
    move-result p0

    .line 308
    invoke-static {p1, p0}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 309
    .line 310
    .line 311
    :cond_b
    :goto_3
    return-void
.end method

.method public B(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;III)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/pzk;->F0()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/pzk;->P:Lcom/p1/mobile/putong/data/User;

    .line 5
    .line 6
    iput-object p1, p0, Ll/pzk;->Q:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 7
    .line 8
    iget-object p4, p0, Ll/pzk;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 9
    .line 10
    invoke-virtual {p4, p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->setParentHolder(Ll/pzk;)V

    .line 11
    .line 12
    .line 13
    iget-object p4, p0, Ll/pzk;->f:Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;

    .line 14
    .line 15
    iget-object p5, p0, Ll/pzk;->Q:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 16
    .line 17
    iget-object p5, p5, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->renderFrom:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 18
    .line 19
    invoke-virtual {p4, p5}, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->setRenderFrom(Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, p1, p2, p3}, Ll/pzk;->e0(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;I)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, p1, p2, p3}, Ll/pzk;->y0(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;I)V

    .line 26
    .line 27
    .line 28
    iget-object p4, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->renderFrom:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 29
    .line 30
    sget-object p5, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->PROFILE:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 31
    .line 32
    const/4 v0, 0x1

    .line 33
    if-ne p4, p5, :cond_0

    .line 34
    .line 35
    iput-boolean v0, p0, Ll/pzk;->e0:Z

    .line 36
    .line 37
    invoke-virtual {p0}, Ll/pzk;->J0()V

    .line 38
    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->o()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;

    .line 42
    .line 43
    .line 44
    move-result-object p4

    .line 45
    invoke-virtual {p4}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->n()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper$b;

    .line 46
    .line 47
    .line 48
    move-result-object p4

    .line 49
    if-nez p3, :cond_1

    .line 50
    .line 51
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->o()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;

    .line 52
    .line 53
    .line 54
    move-result-object p5

    .line 55
    invoke-virtual {p5}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->s()Z

    .line 56
    .line 57
    .line 58
    move-result p5

    .line 59
    if-eqz p5, :cond_1

    .line 60
    .line 61
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result p5

    .line 65
    if-eqz p5, :cond_1

    .line 66
    .line 67
    iget-object p5, p4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper$b;->d:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 68
    .line 69
    invoke-static {p5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result p5

    .line 73
    if-eqz p5, :cond_1

    .line 74
    .line 75
    iget-object p5, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 76
    .line 77
    iget-object p4, p4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper$b;->d:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 78
    .line 79
    iget-object p4, p4, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 80
    .line 81
    invoke-static {p5, p4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 82
    .line 83
    .line 84
    move-result p4

    .line 85
    if-eqz p4, :cond_1

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_1
    const/4 v0, 0x0

    .line 89
    :goto_0
    iput-boolean v0, p0, Ll/pzk;->e0:Z

    .line 90
    .line 91
    invoke-virtual {p0, p1, p2, p3}, Ll/pzk;->I0(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;I)V

    .line 92
    .line 93
    .line 94
    :goto_1
    invoke-virtual {p0, p1, p2}, Ll/pzk;->A0(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;)V

    .line 95
    .line 96
    .line 97
    iget-object p4, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->renderFrom:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 98
    .line 99
    sget-object p5, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->CARD:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 100
    .line 101
    if-ne p4, p5, :cond_3

    .line 102
    .line 103
    iget-object p4, p0, Ll/pzk;->f:Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;

    .line 104
    .line 105
    const/high16 p5, 0x42c80000    # 100.0f

    .line 106
    .line 107
    invoke-static {p5}, Ll/qa00;->d(F)I

    .line 108
    .line 109
    .line 110
    move-result p5

    .line 111
    invoke-virtual {p4, p5}, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->setNextInfoExposureSizePx(I)V

    .line 112
    .line 113
    .line 114
    if-nez p3, :cond_2

    .line 115
    .line 116
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->o()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;

    .line 117
    .line 118
    .line 119
    move-result-object p3

    .line 120
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->r()F

    .line 121
    .line 122
    .line 123
    move-result p3

    .line 124
    invoke-virtual {p0, p3}, Ll/pzk;->z(F)V

    .line 125
    .line 126
    .line 127
    goto :goto_2

    .line 128
    :cond_2
    const/4 p3, 0x0

    .line 129
    invoke-virtual {p0, p3}, Ll/pzk;->z(F)V

    .line 130
    .line 131
    .line 132
    :cond_3
    :goto_2
    invoke-virtual {p0, p1, p2}, Ll/pzk;->d0(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;)V

    .line 133
    .line 134
    .line 135
    return-void
.end method

.method public B0(Lcom/p1/mobile/putong/data/User;I)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/pzk;->W:Z

    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iget-object v1, p0, Ll/pzk;->Q:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 12
    .line 13
    invoke-static {p1, v1}, Ll/br5;->r(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    :goto_0
    return-void

    .line 20
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->superLikedMe()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-nez v1, :cond_3

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->letter()Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_2

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_2
    return-void

    .line 34
    :cond_3
    :goto_1
    const/4 v1, 0x1

    .line 35
    iput-boolean v1, p0, Ll/pzk;->W:Z

    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->superLikedMe()Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-eqz p1, :cond_5

    .line 42
    .line 43
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-eqz p1, :cond_4

    .line 48
    .line 49
    sget p1, Ll/dbc0;->I2:I

    .line 50
    .line 51
    goto :goto_2

    .line 52
    :cond_4
    sget p1, Ll/dbc0;->G2:I

    .line 53
    .line 54
    goto :goto_2

    .line 55
    :cond_5
    sget p1, Ll/dbc0;->G2:I

    .line 56
    .line 57
    :goto_2
    iget-object v2, p0, Ll/pzk;->v:Lv/VImage;

    .line 58
    .line 59
    invoke-virtual {v2, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 60
    .line 61
    .line 62
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    if-eqz p1, :cond_6

    .line 67
    .line 68
    sget p1, Ll/dbc0;->yi:I

    .line 69
    .line 70
    goto :goto_3

    .line 71
    :cond_6
    sget p1, Ll/dbc0;->Ai:I

    .line 72
    .line 73
    :goto_3
    iget-object v2, p0, Ll/pzk;->J:Lv/VImage;

    .line 74
    .line 75
    invoke-virtual {v2, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Ll/pzk;->v:Lv/VImage;

    .line 79
    .line 80
    if-nez p2, :cond_7

    .line 81
    .line 82
    iget-object p0, p0, Ll/pzk;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 83
    .line 84
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->getCurrentItem()I

    .line 85
    .line 86
    .line 87
    move-result p0

    .line 88
    if-nez p0, :cond_7

    .line 89
    .line 90
    move v0, v1

    .line 91
    :cond_7
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public final C0(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isNewHere()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-boolean p1, p0, Ll/pzk;->V:Z

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    iget-boolean p1, p0, Ll/pzk;->W:Z

    .line 12
    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    iget-boolean p1, p0, Ll/pzk;->Y:Z

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iget-object p1, p0, Ll/pzk;->z:Lv/VImage;

    .line 20
    .line 21
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-nez p1, :cond_0

    .line 26
    .line 27
    iget-object p0, p0, Ll/pzk;->D:Lv/VText;

    .line 28
    .line 29
    const/4 p1, 0x1

    .line 30
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    iget-object p0, p0, Ll/pzk;->D:Lv/VText;

    .line 35
    .line 36
    const/4 p1, 0x0

    .line 37
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public D0(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/pzk;->W:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    sget-object v0, Ll/qap;->Companion:Ll/qap$a;

    .line 7
    .line 8
    iget-object v1, p0, Ll/pzk;->Q:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 9
    .line 10
    invoke-virtual {v0, v1, p1}, Ll/qap$a;->n(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-nez p1, :cond_2

    .line 15
    .line 16
    iget-object p1, p0, Ll/pzk;->Q:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ll/qap$a;->m(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_1
    :goto_0
    return-void

    .line 26
    :cond_2
    :goto_1
    const/4 p1, 0x1

    .line 27
    iput-boolean p1, p0, Ll/pzk;->V:Z

    .line 28
    .line 29
    iget-object v0, p0, Ll/pzk;->Q:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->getRenderUser()Lcom/p1/mobile/putong/data/User;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    if-eqz v0, :cond_3

    .line 36
    .line 37
    iget-object v0, p0, Ll/pzk;->Q:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->getRenderUser()Lcom/p1/mobile/putong/data/User;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isNonBinary()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_3

    .line 48
    .line 49
    iget-object v0, p0, Ll/pzk;->y:Lv/VText;

    .line 50
    .line 51
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Qf:I

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 54
    .line 55
    .line 56
    :cond_3
    iget-object p0, p0, Ll/pzk;->x:Lv/VLinear;

    .line 57
    .line 58
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public final E0(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;)V
    .locals 5

    .line 1
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->hasLikeMeSlideCardTop:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_4

    .line 5
    .line 6
    sget-object v0, Ll/qap;->Companion:Ll/qap$a;

    .line 7
    .line 8
    invoke-virtual {v0, p1, p2}, Ll/qap$a;->n(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;)Z

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    const/4 v3, 0x3

    .line 13
    const/4 v4, 0x1

    .line 14
    if-nez v2, :cond_3

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ll/qap$a;->m(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_0
    iget-object p1, p0, Ll/pzk;->n:Lv/VText;

    .line 24
    .line 25
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Ll/pzk;->m:Lv/VText;

    .line 29
    .line 30
    invoke-static {p1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Ll/pzk;->m:Lv/VText;

    .line 34
    .line 35
    invoke-static {v3}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {p1, v0, v4}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Ll/pzk;->m:Lv/VText;

    .line 43
    .line 44
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isNonBinary()Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_1

    .line 49
    .line 50
    iget-object p0, p0, Ll/pzk;->m:Lv/VText;

    .line 51
    .line 52
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    sget p2, Lcom/p1/mobile/putong/core/R$string;->Rf:I

    .line 57
    .line 58
    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    goto :goto_0

    .line 63
    :cond_1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 64
    .line 65
    .line 66
    move-result p2

    .line 67
    iget-object p0, p0, Ll/pzk;->m:Lv/VText;

    .line 68
    .line 69
    if-eqz p2, :cond_2

    .line 70
    .line 71
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    sget p2, Lcom/p1/mobile/putong/core/R$string;->ld:I

    .line 76
    .line 77
    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    goto :goto_0

    .line 82
    :cond_2
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    sget p2, Lcom/p1/mobile/putong/core/R$string;->kd:I

    .line 87
    .line 88
    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    :goto_0
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :cond_3
    :goto_1
    iget-object p1, p0, Ll/pzk;->n:Lv/VText;

    .line 97
    .line 98
    invoke-static {p1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 99
    .line 100
    .line 101
    iget-object p0, p0, Ll/pzk;->n:Lv/VText;

    .line 102
    .line 103
    invoke-static {v3}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    invoke-virtual {p0, p1, v4}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 108
    .line 109
    .line 110
    return-void

    .line 111
    :cond_4
    iget-object p1, p0, Ll/pzk;->m:Lv/VText;

    .line 112
    .line 113
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 114
    .line 115
    .line 116
    iget-object p0, p0, Ll/pzk;->n:Lv/VText;

    .line 117
    .line 118
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 119
    .line 120
    .line 121
    return-void
.end method

.method public final F0()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/pzk;->Q:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->renderFrom:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 7
    .line 8
    sget-object v2, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->CARD:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 9
    .line 10
    if-ne v0, v2, :cond_1

    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->o()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->s()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->o()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->n()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper$b;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->o()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->n()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper$b;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper$b;->d:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 41
    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    iget-object v0, p0, Ll/pzk;->Q:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 45
    .line 46
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->o()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->n()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper$b;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    iget-object v2, v2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper$b;->d:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 57
    .line 58
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 59
    .line 60
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-eqz v0, :cond_1

    .line 65
    .line 66
    iget-object p0, p0, Ll/pzk;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 67
    .line 68
    if-eqz p0, :cond_0

    .line 69
    .line 70
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->W(Z)V

    .line 71
    .line 72
    .line 73
    :cond_0
    return-void

    .line 74
    :cond_1
    iget-object v0, p0, Ll/pzk;->Q:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 75
    .line 76
    if-eqz v0, :cond_3

    .line 77
    .line 78
    iget-object v0, p0, Ll/pzk;->E:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;

    .line 79
    .line 80
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->n()V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Ll/pzk;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 84
    .line 85
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->c0()V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Ll/pzk;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 89
    .line 90
    iget-object v2, p0, Ll/pzk;->Q:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 91
    .line 92
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->renderFrom:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 93
    .line 94
    sget-object v3, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->CARD:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 95
    .line 96
    const/4 v4, 0x0

    .line 97
    if-ne v2, v3, :cond_2

    .line 98
    .line 99
    move v2, v1

    .line 100
    goto :goto_0

    .line 101
    :cond_2
    move v2, v4

    .line 102
    :goto_0
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->A(Z)V

    .line 103
    .line 104
    .line 105
    iget-object v0, p0, Ll/pzk;->Q:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 106
    .line 107
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->renderFrom:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 108
    .line 109
    if-ne v0, v3, :cond_3

    .line 110
    .line 111
    iget-object v0, p0, Ll/pzk;->k:Lv/VFrame;

    .line 112
    .line 113
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 114
    .line 115
    .line 116
    iget-object v0, p0, Ll/pzk;->u:Landroid/widget/FrameLayout;

    .line 117
    .line 118
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 119
    .line 120
    .line 121
    iget-object v0, p0, Ll/pzk;->G:Lv/VFrame;

    .line 122
    .line 123
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 124
    .line 125
    .line 126
    iget-object v0, p0, Ll/pzk;->l:Lcom/p1/mobile/putong/core/newui/view/LinearMeasureOrderLayout;

    .line 127
    .line 128
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 129
    .line 130
    .line 131
    iget-object v0, p0, Ll/pzk;->i:Landroid/view/View;

    .line 132
    .line 133
    const/high16 v2, 0x3f800000    # 1.0f

    .line 134
    .line 135
    invoke-virtual {v0, v2}, Landroid/view/View;->setAlpha(F)V

    .line 136
    .line 137
    .line 138
    iget-object v0, p0, Ll/pzk;->B:Lcom/p1/mobile/putong/core/ui/likeminded/LikeMindedCardTabView;

    .line 139
    .line 140
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 141
    .line 142
    .line 143
    iget-object v0, p0, Ll/pzk;->J:Lv/VImage;

    .line 144
    .line 145
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 146
    .line 147
    .line 148
    iget-object v0, p0, Ll/pzk;->v:Lv/VImage;

    .line 149
    .line 150
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 151
    .line 152
    .line 153
    iput-boolean v4, p0, Ll/pzk;->W:Z

    .line 154
    .line 155
    iput-boolean v4, p0, Ll/pzk;->Y:Z

    .line 156
    .line 157
    iput-boolean v4, p0, Ll/pzk;->h0:Z

    .line 158
    .line 159
    iget-object v0, p0, Ll/pzk;->t:Lv/VImage;

    .line 160
    .line 161
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 162
    .line 163
    .line 164
    invoke-virtual {p0}, Ll/pzk;->c0()V

    .line 165
    .line 166
    .line 167
    :cond_3
    iget-object v0, p0, Ll/pzk;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 168
    .line 169
    if-eqz v0, :cond_4

    .line 170
    .line 171
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->W(Z)V

    .line 172
    .line 173
    .line 174
    iget-object v0, p0, Ll/pzk;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 175
    .line 176
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->b0()V

    .line 177
    .line 178
    .line 179
    :cond_4
    iget-object v0, p0, Ll/pzk;->S:Ll/kcg0;

    .line 180
    .line 181
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 182
    .line 183
    .line 184
    iget-object p0, p0, Ll/pzk;->T:Ll/kcg0;

    .line 185
    .line 186
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 187
    .line 188
    .line 189
    return-void
.end method

.method public final G0(F)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/pzk;->f:Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;

    .line 2
    .line 3
    iget-object v1, p0, Ll/pzk;->Q:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->renderFrom:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 6
    .line 7
    sget-object v2, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->CARD:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 8
    .line 9
    const/4 v3, 0x1

    .line 10
    const/4 v4, 0x0

    .line 11
    if-ne v1, v2, :cond_2

    .line 12
    .line 13
    :goto_0
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    instance-of v1, v1, Landroid/view/ViewGroup;

    .line 18
    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    instance-of v1, v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;

    .line 26
    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Landroid/view/View;

    .line 34
    .line 35
    move v1, v3

    .line 36
    goto :goto_1

    .line 37
    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Landroid/view/View;

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    move v1, v4

    .line 45
    :goto_1
    if-nez v1, :cond_2

    .line 46
    .line 47
    iget-object v0, p0, Ll/pzk;->f:Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;

    .line 48
    .line 49
    :cond_2
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    int-to-float p0, p0

    .line 54
    const/high16 v1, 0x40000000    # 2.0f

    .line 55
    .line 56
    div-float/2addr p0, v1

    .line 57
    invoke-virtual {v0, p0}, Landroid/view/View;->setPivotX(F)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    int-to-float p0, p0

    .line 65
    div-float/2addr p0, v1

    .line 66
    invoke-virtual {v0, p0}, Landroid/view/View;->setPivotY(F)V

    .line 67
    .line 68
    .line 69
    sget-object p0, Landroid/view/View;->ROTATION_Y:Landroid/util/Property;

    .line 70
    .line 71
    const/4 v1, 0x3

    .line 72
    new-array v1, v1, [F

    .line 73
    .line 74
    const/4 v2, 0x0

    .line 75
    aput v2, v1, v4

    .line 76
    .line 77
    aput p1, v1, v3

    .line 78
    .line 79
    const/4 p1, 0x2

    .line 80
    aput v2, v1, p1

    .line 81
    .line 82
    invoke-static {v0, p0, v1}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    const-wide/16 v0, 0xc8

    .line 87
    .line 88
    invoke-virtual {p0, v0, v1}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public final H0()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pzk;->P:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/pzk;->P:Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Ll/pzk;->P:Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    invoke-static {v0}, Ll/br5;->p(Lcom/p1/mobile/putong/data/User;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    iget-boolean v0, p0, Ll/pzk;->e0:Z

    .line 28
    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    iget-object p0, p0, Ll/pzk;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 32
    .line 33
    if-eqz p0, :cond_0

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->F()Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-nez p0, :cond_0

    .line 40
    .line 41
    const/4 p0, 0x1

    .line 42
    return p0

    .line 43
    :cond_0
    const/4 p0, 0x0

    .line 44
    return p0
.end method

.method public final I0(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;I)V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/pzk;->i:Landroid/view/View;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p2, p1}, Ll/pzk;->u0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/pzk;->i:Landroid/view/View;

    .line 11
    .line 12
    const/high16 v2, 0x3f800000    # 1.0f

    .line 13
    .line 14
    invoke-virtual {v0, v2}, Landroid/view/View;->setAlpha(F)V

    .line 15
    .line 16
    .line 17
    iget-object v3, p0, Ll/pzk;->E:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;

    .line 18
    .line 19
    iget-object v5, p0, Ll/pzk;->Q:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 20
    .line 21
    iget-object v7, p0, Ll/pzk;->f:Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;

    .line 22
    .line 23
    iget-object v8, p0, Ll/pzk;->F:Landroid/view/View;

    .line 24
    .line 25
    move-object v4, p2

    .line 26
    move v6, p3

    .line 27
    invoke-virtual/range {v3 .. v8}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->m(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;ILcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;Landroid/view/View;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, v4}, Ll/pzk;->D0(Lcom/p1/mobile/putong/data/User;)V

    .line 31
    .line 32
    .line 33
    const/4 p2, 0x0

    .line 34
    invoke-virtual {p0, v4, p2}, Ll/pzk;->B0(Lcom/p1/mobile/putong/data/User;I)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, p1, v6}, Ll/pzk;->w0(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;I)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0, p1, v4}, Ll/pzk;->E0(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;)V

    .line 41
    .line 42
    .line 43
    iget-object p3, p0, Ll/pzk;->Q:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 44
    .line 45
    invoke-virtual {p0, v4, p3, v6}, Ll/pzk;->v0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;I)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, p1}, Ll/pzk;->z0(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V

    .line 49
    .line 50
    .line 51
    iget-object p3, v4, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 52
    .line 53
    iget-object p3, p3, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 54
    .line 55
    sget v0, Ll/qa00;->m:I

    .line 56
    .line 57
    iget-object v2, p0, Ll/pzk;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 58
    .line 59
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->getCurrentItem()I

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    if-nez v2, :cond_0

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_0
    move v1, p2

    .line 67
    :goto_0
    invoke-virtual {p0, p1, p3, v0, v1}, Ll/pzk;->x0(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/Extensions;IZ)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0, v4}, Ll/pzk;->C0(Lcom/p1/mobile/putong/data/User;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public final J0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pzk;->i:Landroid/view/View;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/pzk;->f:Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->setShortCardStyle(Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/pzk;->E:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/pzk;->P:Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    invoke-virtual {p0, v0, v1}, Ll/pzk;->B0(Lcom/p1/mobile/putong/data/User;I)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/pzk;->v:Lv/VImage;

    .line 25
    .line 26
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/pzk;->J:Lv/VImage;

    .line 30
    .line 31
    iget-boolean p0, p0, Ll/pzk;->W:Z

    .line 32
    .line 33
    invoke-static {v0, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final K0(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pzk;->i0:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string v0, "e_special_card"

    .line 10
    .line 11
    const-string v1, "p_suggest_users_home_view"

    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Ll/pzk;->i0:Ljava/lang/String;

    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final L0()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/pzk;->h0:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Ll/pzk;->e0:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/pzk;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->getCurrentItem()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 v0, 0x0

    .line 20
    :goto_0
    iget-object v1, p0, Ll/pzk;->t:Lv/VImage;

    .line 21
    .line 22
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Ll/pzk;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 26
    .line 27
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->setCertBtnShowing(Z)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/pzk;->E:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;

    .line 31
    .line 32
    iget-boolean p0, p0, Ll/pzk;->h0:Z

    .line 33
    .line 34
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->setHideCertIconForCardBtn(Z)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final M0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pzk;->j:Lv/VImage;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ll/pzk;->P:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/pzk;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {p0}, Ll/pzk;->H0()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iget-object v1, p0, Ll/pzk;->j:Lv/VImage;

    .line 19
    .line 20
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    iget-object v0, p0, Ll/pzk;->Q:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    const-string v0, "profile_photo_compliment_btn"

    .line 30
    .line 31
    invoke-static {v0}, Ll/gp5;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-nez v1, :cond_1

    .line 40
    .line 41
    iget-object v1, p0, Ll/pzk;->Q:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 42
    .line 43
    invoke-virtual {p0, v1}, Ll/f6l;->A(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-static {p0, v0}, Ll/gp5;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    :cond_1
    :goto_0
    return-void
.end method

.method public final N0(ZZ)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pzk;->F:Landroid/view/View;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/pzk;->E:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->d:Lv/VImage;

    .line 9
    .line 10
    invoke-static {p0, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final V(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/qzk;->a(Ll/pzk;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final W(ZZ)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v0, Ll/pzk;->E:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;

    .line 6
    .line 7
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->g(Z)V

    .line 8
    .line 9
    .line 10
    xor-int/lit8 v2, v1, 0x1

    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    const/4 v4, 0x0

    .line 17
    const/4 v5, 0x1

    .line 18
    if-nez v3, :cond_0

    .line 19
    .line 20
    if-nez v1, :cond_0

    .line 21
    .line 22
    move v3, v5

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    move v3, v4

    .line 25
    :goto_0
    invoke-virtual {v0, v2, v3}, Ll/pzk;->N0(ZZ)V

    .line 26
    .line 27
    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    iget-object v2, v0, Ll/pzk;->F:Landroid/view/View;

    .line 31
    .line 32
    invoke-static {v2, v4}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 33
    .line 34
    .line 35
    iget-object v2, v0, Ll/pzk;->E:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;

    .line 36
    .line 37
    iget-object v2, v2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->d:Lv/VImage;

    .line 38
    .line 39
    invoke-static {v2, v4}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    instance-of v2, v2, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 47
    .line 48
    if-eqz v2, :cond_2

    .line 49
    .line 50
    invoke-virtual {v0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    check-cast v2, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 55
    .line 56
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->d6()Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/main/NewMainViewModel;->O()V

    .line 61
    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_1
    iget-object v2, v0, Ll/pzk;->E:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;

    .line 65
    .line 66
    iget-object v3, v2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->g:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;

    .line 67
    .line 68
    if-eqz v3, :cond_2

    .line 69
    .line 70
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->v()Ll/qk4;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    iget-object v6, v0, Ll/pzk;->F:Landroid/view/View;

    .line 75
    .line 76
    invoke-virtual {v2, v3, v6}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->q(Ll/qk4;Landroid/view/View;)V

    .line 77
    .line 78
    .line 79
    :cond_2
    :goto_1
    iget-object v2, v0, Ll/pzk;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 80
    .line 81
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->Y()V

    .line 82
    .line 83
    .line 84
    iget-object v2, v0, Ll/pzk;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 85
    .line 86
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->j0()V

    .line 87
    .line 88
    .line 89
    iget-object v2, v0, Ll/pzk;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 90
    .line 91
    xor-int/lit8 v3, v1, 0x1

    .line 92
    .line 93
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->A(Z)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v0}, Ll/pzk;->L0()V

    .line 97
    .line 98
    .line 99
    iget-object v2, v0, Ll/pzk;->i:Landroid/view/View;

    .line 100
    .line 101
    if-eqz v1, :cond_3

    .line 102
    .line 103
    const/4 v3, 0x0

    .line 104
    goto :goto_2

    .line 105
    :cond_3
    const/high16 v3, 0x3f800000    # 1.0f

    .line 106
    .line 107
    :goto_2
    invoke-virtual {v2, v3}, Landroid/view/View;->setAlpha(F)V

    .line 108
    .line 109
    .line 110
    iget-object v2, v0, Ll/pzk;->k:Lv/VFrame;

    .line 111
    .line 112
    xor-int/lit8 v3, v1, 0x1

    .line 113
    .line 114
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 115
    .line 116
    .line 117
    iget-object v2, v0, Ll/pzk;->u:Landroid/widget/FrameLayout;

    .line 118
    .line 119
    xor-int/lit8 v3, v1, 0x1

    .line 120
    .line 121
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 122
    .line 123
    .line 124
    iget-object v2, v0, Ll/pzk;->G:Lv/VFrame;

    .line 125
    .line 126
    xor-int/lit8 v3, v1, 0x1

    .line 127
    .line 128
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 129
    .line 130
    .line 131
    iget-object v2, v0, Ll/pzk;->l:Lcom/p1/mobile/putong/core/newui/view/LinearMeasureOrderLayout;

    .line 132
    .line 133
    xor-int/lit8 v3, v1, 0x1

    .line 134
    .line 135
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 136
    .line 137
    .line 138
    iget-object v2, v0, Ll/pzk;->J:Lv/VImage;

    .line 139
    .line 140
    if-eqz v1, :cond_4

    .line 141
    .line 142
    iget-boolean v3, v0, Ll/pzk;->W:Z

    .line 143
    .line 144
    if-eqz v3, :cond_4

    .line 145
    .line 146
    move v3, v5

    .line 147
    goto :goto_3

    .line 148
    :cond_4
    move v3, v4

    .line 149
    :goto_3
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 150
    .line 151
    .line 152
    iget-object v2, v0, Ll/pzk;->K:Landroid/widget/LinearLayout;

    .line 153
    .line 154
    if-eqz v1, :cond_5

    .line 155
    .line 156
    iget-boolean v3, v0, Ll/pzk;->f0:Z

    .line 157
    .line 158
    if-eqz v3, :cond_5

    .line 159
    .line 160
    move v3, v5

    .line 161
    goto :goto_4

    .line 162
    :cond_5
    move v3, v4

    .line 163
    :goto_4
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 164
    .line 165
    .line 166
    iget-object v2, v0, Ll/pzk;->o:Lv/VFrame;

    .line 167
    .line 168
    if-nez v1, :cond_6

    .line 169
    .line 170
    iget-boolean v3, v0, Ll/pzk;->f0:Z

    .line 171
    .line 172
    if-eqz v3, :cond_6

    .line 173
    .line 174
    move v3, v5

    .line 175
    goto :goto_5

    .line 176
    :cond_6
    move v3, v4

    .line 177
    :goto_5
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 178
    .line 179
    .line 180
    invoke-virtual {v0}, Ll/pzk;->M0()V

    .line 181
    .line 182
    .line 183
    if-eqz p2, :cond_7

    .line 184
    .line 185
    iget-object v2, v0, Ll/pzk;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 186
    .line 187
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->T()Z

    .line 188
    .line 189
    .line 190
    move-result v2

    .line 191
    if-nez v2, :cond_7

    .line 192
    .line 193
    if-eqz v1, :cond_7

    .line 194
    .line 195
    iget-object v2, v0, Ll/pzk;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 196
    .line 197
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->D()Z

    .line 198
    .line 199
    .line 200
    :cond_7
    if-eqz v1, :cond_13

    .line 201
    .line 202
    :try_start_0
    iget-object v1, v0, Ll/pzk;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 203
    .line 204
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->getCurrentView()Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 205
    .line 206
    .line 207
    move-result-object v1

    .line 208
    if-eqz v1, :cond_9

    .line 209
    .line 210
    iget-object v1, v0, Ll/pzk;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 211
    .line 212
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->getCurrentView()Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 213
    .line 214
    .line 215
    move-result-object v1

    .line 216
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/PictureView;->I0:Lrx/subjects/a;

    .line 217
    .line 218
    invoke-virtual {v1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 219
    .line 220
    .line 221
    move-result-object v1

    .line 222
    check-cast v1, Ljava/lang/Boolean;

    .line 223
    .line 224
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 225
    .line 226
    .line 227
    move-result v1

    .line 228
    if-nez v1, :cond_8

    .line 229
    .line 230
    goto :goto_6

    .line 231
    :cond_8
    move v1, v4

    .line 232
    goto :goto_7

    .line 233
    :cond_9
    :goto_6
    move v1, v5

    .line 234
    :goto_7
    const-string v2, "null"

    .line 235
    .line 236
    iget-object v3, v0, Ll/pzk;->Q:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 237
    .line 238
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isUserLikeMe()Z

    .line 239
    .line 240
    .line 241
    move-result v3

    .line 242
    if-nez v3, :cond_b

    .line 243
    .line 244
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 245
    .line 246
    invoke-virtual {v3}, Ll/gta;->b()Lcom/p1/mobile/putong/core/api/inject/provider/CoreMemberProviderInterface;

    .line 247
    .line 248
    .line 249
    move-result-object v3

    .line 250
    invoke-interface {v3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreMemberProviderInterface;->wf()Z

    .line 251
    .line 252
    .line 253
    move-result v3

    .line 254
    if-eqz v3, :cond_a

    .line 255
    .line 256
    iget-object v3, v0, Ll/pzk;->Q:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 257
    .line 258
    iget-boolean v3, v3, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->hasLikeMeSlideCardTop:Z

    .line 259
    .line 260
    if-eqz v3, :cond_a

    .line 261
    .line 262
    goto :goto_8

    .line 263
    :cond_a
    move v3, v4

    .line 264
    goto :goto_9

    .line 265
    :cond_b
    :goto_8
    move v3, v5

    .line 266
    :goto_9
    if-eqz v3, :cond_c

    .line 267
    .line 268
    const-string v2, "upper_right"

    .line 269
    .line 270
    :cond_c
    iget-object v6, v0, Ll/pzk;->E:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;

    .line 271
    .line 272
    iget-object v6, v6, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->g:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;

    .line 273
    .line 274
    invoke-static {v6}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 275
    .line 276
    .line 277
    move-result v6

    .line 278
    if-eqz v6, :cond_d

    .line 279
    .line 280
    iget-object v6, v0, Ll/pzk;->E:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;

    .line 281
    .line 282
    iget-object v6, v6, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->g:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;

    .line 283
    .line 284
    invoke-virtual {v6}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;->i()Z

    .line 285
    .line 286
    .line 287
    move-result v6

    .line 288
    if-eqz v6, :cond_d

    .line 289
    .line 290
    const-string v2, "lower_left"

    .line 291
    .line 292
    move v3, v5

    .line 293
    :cond_d
    invoke-virtual {v0}, Ll/pzk;->a0()Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 294
    .line 295
    .line 296
    move-result-object v6

    .line 297
    const-string v7, "IsWhiteBlock"

    .line 298
    .line 299
    invoke-static {v7, v1}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 300
    .line 301
    .line 302
    move-result-object v8

    .line 303
    const-string v1, "moments_user_id"

    .line 304
    .line 305
    iget-object v7, v0, Ll/pzk;->P:Lcom/p1/mobile/putong/data/User;

    .line 306
    .line 307
    iget-object v7, v7, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 308
    .line 309
    invoke-static {v7}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 310
    .line 311
    .line 312
    move-result v7

    .line 313
    invoke-static {v1, v7}, Ll/sfj0$a;->i(Ljava/lang/String;Z)Ll/sfj0$a;

    .line 314
    .line 315
    .line 316
    move-result-object v9

    .line 317
    const-string v1, "show_he_liked"

    .line 318
    .line 319
    invoke-static {v1, v3}, Ll/sfj0$a;->i(Ljava/lang/String;Z)Ll/sfj0$a;

    .line 320
    .line 321
    .line 322
    move-result-object v10

    .line 323
    const-string v1, "show_he_liked_position"

    .line 324
    .line 325
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 326
    .line 327
    .line 328
    move-result-object v11

    .line 329
    const-string v1, "is_first_picture"

    .line 330
    .line 331
    sget-object v2, Ll/b240;->V0:Ljava/lang/String;

    .line 332
    .line 333
    iget-object v3, v0, Ll/pzk;->P:Lcom/p1/mobile/putong/data/User;

    .line 334
    .line 335
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 336
    .line 337
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 338
    .line 339
    .line 340
    move-result v2

    .line 341
    if-eqz v2, :cond_e

    .line 342
    .line 343
    iget-object v2, v0, Ll/pzk;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 344
    .line 345
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->getCurrentItem()I

    .line 346
    .line 347
    .line 348
    move-result v2

    .line 349
    if-nez v2, :cond_e

    .line 350
    .line 351
    move v2, v5

    .line 352
    goto :goto_a

    .line 353
    :cond_e
    move v2, v4

    .line 354
    :goto_a
    invoke-static {v1, v2}, Ll/sfj0$a;->i(Ljava/lang/String;Z)Ll/sfj0$a;

    .line 355
    .line 356
    .line 357
    move-result-object v12

    .line 358
    const-string v1, "swipe_scene"

    .line 359
    .line 360
    const-string v2, "default"

    .line 361
    .line 362
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 363
    .line 364
    .line 365
    move-result-object v13

    .line 366
    const-string v1, "theme_card_ornot"

    .line 367
    .line 368
    iget-object v2, v0, Ll/pzk;->Q:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 369
    .line 370
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 371
    .line 372
    .line 373
    move-result v2

    .line 374
    if-eqz v2, :cond_f

    .line 375
    .line 376
    iget-object v2, v0, Ll/pzk;->Q:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 377
    .line 378
    iget-boolean v2, v2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isThemeCard:Z

    .line 379
    .line 380
    if-eqz v2, :cond_f

    .line 381
    .line 382
    goto :goto_b

    .line 383
    :cond_f
    move v5, v4

    .line 384
    :goto_b
    invoke-static {v1, v5}, Ll/sfj0$a;->i(Ljava/lang/String;Z)Ll/sfj0$a;

    .line 385
    .line 386
    .line 387
    move-result-object v14

    .line 388
    const-string v1, "is_moment_card"

    .line 389
    .line 390
    invoke-virtual {v0}, Ll/pzk;->k0()Z

    .line 391
    .line 392
    .line 393
    move-result v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 394
    const-string v3, "1"

    .line 395
    .line 396
    const-string v5, "0"

    .line 397
    .line 398
    if-eqz v2, :cond_10

    .line 399
    .line 400
    move-object v2, v3

    .line 401
    goto :goto_c

    .line 402
    :cond_10
    move-object v2, v5

    .line 403
    :goto_c
    :try_start_1
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 404
    .line 405
    .line 406
    move-result-object v15

    .line 407
    const-string v1, "moment_id"

    .line 408
    .line 409
    if-eqz v6, :cond_11

    .line 410
    .line 411
    iget-object v2, v6, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 412
    .line 413
    goto :goto_d

    .line 414
    :cond_11
    move-object v2, v5

    .line 415
    :goto_d
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 416
    .line 417
    .line 418
    move-result-object v16

    .line 419
    const-string v1, "is_show_longtimenosee_tag"

    .line 420
    .line 421
    invoke-static {}, Ll/gra;->r1()Z

    .line 422
    .line 423
    .line 424
    move-result v2

    .line 425
    if-eqz v2, :cond_12

    .line 426
    .line 427
    iget-object v2, v0, Ll/pzk;->Q:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 428
    .line 429
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 430
    .line 431
    .line 432
    move-result v2

    .line 433
    if-eqz v2, :cond_12

    .line 434
    .line 435
    iget-object v0, v0, Ll/pzk;->Q:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 436
    .line 437
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->meetAgain:Z

    .line 438
    .line 439
    if-eqz v0, :cond_12

    .line 440
    .line 441
    goto :goto_e

    .line 442
    :cond_12
    move-object v3, v5

    .line 443
    :goto_e
    invoke-static {v1, v3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 444
    .line 445
    .line 446
    move-result-object v17

    .line 447
    filled-new-array/range {v8 .. v17}, [Ll/sfj0$a;

    .line 448
    .line 449
    .line 450
    move-result-object v0

    .line 451
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 452
    .line 453
    .line 454
    move-result-object v0

    .line 455
    const-string v1, "e_card"

    .line 456
    .line 457
    const-string v2, "p_suggest_users_home_view"

    .line 458
    .line 459
    new-array v3, v4, [Ll/sfj0$a;

    .line 460
    .line 461
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 462
    .line 463
    .line 464
    move-result-object v0

    .line 465
    check-cast v0, [Ll/sfj0$a;

    .line 466
    .line 467
    invoke-static {v1, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 468
    .line 469
    .line 470
    :catch_0
    :cond_13
    return-void
.end method

.method public final X()V
    .locals 4

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Ll/pzk;->U:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    const-wide/16 v2, 0x140

    .line 9
    .line 10
    cmp-long v0, v0, v2

    .line 11
    .line 12
    if-gez v0, :cond_0

    .line 13
    .line 14
    goto :goto_2

    .line 15
    :cond_0
    invoke-static {}, Ll/pzi0;->o()J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    iput-wide v0, p0, Ll/pzk;->U:J

    .line 20
    .line 21
    iget-object v0, p0, Ll/pzk;->Q:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->renderFrom:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 24
    .line 25
    sget-object v1, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->CARD:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 26
    .line 27
    const/4 v2, 0x1

    .line 28
    if-ne v0, v1, :cond_1

    .line 29
    .line 30
    move v3, v2

    .line 31
    goto :goto_0

    .line 32
    :cond_1
    const/4 v3, 0x0

    .line 33
    :goto_0
    if-ne v0, v1, :cond_2

    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_2
    move v2, v3

    .line 37
    :goto_1
    if-eqz v2, :cond_4

    .line 38
    .line 39
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->o()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->s()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_3

    .line 48
    .line 49
    const-string v0, "hotspot"

    .line 50
    .line 51
    invoke-static {v0}, Ll/pza0;->h(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->o()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    iget-object v1, p0, Ll/pzk;->P:Lcom/p1/mobile/putong/data/User;

    .line 59
    .line 60
    iget-object p0, p0, Ll/pzk;->Q:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 61
    .line 62
    const-string v2, "card click back"

    .line 63
    .line 64
    invoke-virtual {v0, v1, p0, v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->k(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->o()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iget-object v1, p0, Ll/pzk;->P:Lcom/p1/mobile/putong/data/User;

    .line 73
    .line 74
    iget-object p0, p0, Ll/pzk;->Q:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 75
    .line 76
    invoke-virtual {v0, v1, p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->m(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_4
    sget-object v1, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->PROFILE:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 81
    .line 82
    if-ne v0, v1, :cond_5

    .line 83
    .line 84
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 89
    .line 90
    .line 91
    :cond_5
    :goto_2
    return-void
.end method

.method public final Y(Lcom/p1/mobile/putong/data/UserLiveState;)Ljava/lang/String;
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/data/UserLiveState;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserLiveState;->multiCallInfo:Lcom/p1/mobile/putong/data/LiveMultiCallInfo;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/LiveMultiCallInfo;->onGoingMultiCallRole:Ljava/lang/String;

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string p0, ""

    .line 13
    .line 14
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-interface {p1, p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Dr(Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public final Z(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/UserLiveState;Ljava/lang/String;)Ljava/util/HashMap;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/data/UserLiveState;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    iget-object v1, p2, Lcom/p1/mobile/putong/data/UserLiveState;->multiCallInfo:Lcom/p1/mobile/putong/data/LiveMultiCallInfo;

    .line 9
    .line 10
    iget-object v1, v1, Lcom/p1/mobile/putong/data/LiveMultiCallInfo;->onGoingMultiCallId:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v1, 0x0

    .line 21
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    iget-object v3, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 26
    .line 27
    invoke-interface {v2, v3}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->getUserLiveId(Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    const-string v3, "liveId"

    .line 32
    .line 33
    invoke-virtual {v0, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    const-string v2, "anchorId"

    .line 37
    .line 38
    iget-object v3, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    const-string v2, "index"

    .line 44
    .line 45
    const-string v3, "NA"

    .line 46
    .line 47
    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    const-string v2, "module"

    .line 51
    .line 52
    const-string v4, "e_profile_album"

    .line 53
    .line 54
    invoke-virtual {v0, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    const-string v2, "trace_id"

    .line 58
    .line 59
    const-string v4, ""

    .line 60
    .line 61
    invoke-virtual {v0, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    if-eqz p2, :cond_1

    .line 65
    .line 66
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/UserLiveState;->isLiveOpened()Z

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    if-eqz v2, :cond_1

    .line 71
    .line 72
    const-string v2, "on"

    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_1
    const-string v2, "off"

    .line 76
    .line 77
    :goto_1
    const-string v5, "live_status"

    .line 78
    .line 79
    invoke-virtual {v0, v5, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    const-string v2, "right_recommend_type"

    .line 83
    .line 84
    invoke-virtual {v0, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    if-eqz v1, :cond_2

    .line 88
    .line 89
    goto :goto_2

    .line 90
    :cond_2
    const/4 p2, 0x0

    .line 91
    :goto_2
    invoke-virtual {p0, p2}, Ll/pzk;->Y(Lcom/p1/mobile/putong/data/UserLiveState;)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    const-string p2, "live_room_live_type"

    .line 96
    .line 97
    invoke-virtual {v0, p2, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    if-eqz v1, :cond_3

    .line 101
    .line 102
    const-string p0, "\u8fde\u7ebf"

    .line 103
    .line 104
    goto :goto_3

    .line 105
    :cond_3
    move-object p0, v4

    .line 106
    :goto_3
    const-string p2, "show_label"

    .line 107
    .line 108
    invoke-virtual {v0, p2, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    const-string p0, "home_card"

    .line 112
    .line 113
    invoke-virtual {p0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    move-result p2

    .line 117
    if-eqz p2, :cond_4

    .line 118
    .line 119
    move-object v4, p0

    .line 120
    :cond_4
    const-string p2, "refer_pid"

    .line 121
    .line 122
    invoke-virtual {v0, p2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    const-string p2, "liveRecommendCategory"

    .line 126
    .line 127
    invoke-virtual {v0, p2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 131
    .line 132
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 133
    .line 134
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 135
    .line 136
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->L6(Ljava/lang/String;)Z

    .line 137
    .line 138
    .line 139
    move-result p1

    .line 140
    const-string p2, "live_enter_source"

    .line 141
    .line 142
    if-eqz p1, :cond_5

    .line 143
    .line 144
    invoke-virtual {p0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    move-result p0

    .line 148
    if-eqz p0, :cond_5

    .line 149
    .line 150
    const-string p0, "suggest_live_card_profile"

    .line 151
    .line 152
    invoke-virtual {v0, p2, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    return-object v0

    .line 156
    :cond_5
    invoke-virtual {v0, p2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    return-object v0
.end method

.method public a0()Lcom/p1/mobile/putong/core/data/CoreMomentInfo;
    .locals 1

    .line 1
    invoke-static {}, Ll/gra;->I0()Lcom/p1/mobile/putong/core/data/MomentThemeCardeConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/MomentThemeCardeConfig;->enabled:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ll/nh00;->b()Ll/nh00;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Ll/nh00;->f()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    :cond_0
    iget-object p0, p0, Ll/pzk;->Q:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 20
    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->coreMomentInfo:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 24
    .line 25
    if-eqz p0, :cond_1

    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_1
    const/4 p0, 0x0

    .line 29
    return-object p0
.end method

.method public b()Lrx/subjects/a;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/pzk;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->getCurrentView()Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/pzk;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->getCurrentView()Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->I0:Lrx/subjects/a;

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return-object p0
.end method

.method public final b0(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "e_clone_card_avatar_verified_tag"

    .line 10
    .line 11
    const-string v2, "p_suggest_users_home_view"

    .line 12
    .line 13
    invoke-static {v1, v2}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    new-instance v0, Ll/ak4;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-direct {v0, p0, p1}, Ll/ak4;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Ll/ak4;->show()V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    const/4 v0, 0x0

    .line 46
    const-string v1, "card_verify_popup"

    .line 47
    .line 48
    invoke-static {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterAct;->Z1(Landroid/content/Context;ZLjava/lang/String;)Landroid/content/Intent;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public c()Lrx/subjects/a;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/pzk;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->getCurrentView()Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/pzk;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->getCurrentView()Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->J0:Lrx/subjects/a;

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return-object p0
.end method

.method public final c0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/pzk;->V:Z

    .line 3
    .line 4
    iget-object p0, p0, Ll/pzk;->x:Lv/VLinear;

    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public d()Lcom/p1/mobile/putong/data/Media;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pzk;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->getCurrentView()Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/pzk;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->getCurrentView()Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->G:Lcom/p1/mobile/putong/data/Media;

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return-object p0
.end method

.method public final d0(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pzk;->j:Lv/VImage;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v0, p0, Ll/pzk;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 6
    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->b:Lcom/p1/mobile/putong/core/ui/profile/views/VPager_SquaredRefactor;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_1

    .line 14
    :cond_0
    new-instance v1, Ll/pzk$c;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/pzk$c;-><init>(Ll/pzk;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/pzk;->M0()V

    .line 23
    .line 24
    .line 25
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->renderFrom:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 26
    .line 27
    sget-object v0, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->PROFILE:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 28
    .line 29
    if-ne p1, v0, :cond_1

    .line 30
    .line 31
    const/4 p1, 0x1

    .line 32
    goto :goto_0

    .line 33
    :cond_1
    const/4 p1, 0x0

    .line 34
    :goto_0
    iget-object v0, p0, Ll/pzk;->j:Lv/VImage;

    .line 35
    .line 36
    new-instance v1, Ll/jzk;

    .line 37
    .line 38
    invoke-direct {v1, p0, p2, p1}, Ll/jzk;-><init>(Ll/pzk;Lcom/p1/mobile/putong/data/User;Z)V

    .line 39
    .line 40
    .line 41
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 42
    .line 43
    .line 44
    :cond_2
    :goto_1
    return-void
.end method

.method public final e0(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;I)V
    .locals 5

    .line 1
    new-instance v0, Ll/aoh0;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, Ll/aoh0;-><init>(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/pzk;->R:Ll/aoh0;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/pzk;->h0(Ll/aoh0;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->renderFrom:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 12
    .line 13
    sget-object v1, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->CARD:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 14
    .line 15
    if-ne v0, v1, :cond_3

    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->o()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->s()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const/4 v2, 0x1

    .line 26
    const/4 v3, 0x0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    if-eqz p3, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    move v0, v3

    .line 33
    goto :goto_1

    .line 34
    :cond_1
    :goto_0
    move v0, v2

    .line 35
    :goto_1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    if-nez v4, :cond_2

    .line 40
    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    goto :goto_2

    .line 44
    :cond_2
    move v2, v3

    .line 45
    :goto_2
    invoke-virtual {p0, v0, v2}, Ll/pzk;->N0(ZZ)V

    .line 46
    .line 47
    .line 48
    if-nez p3, :cond_3

    .line 49
    .line 50
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->renderFrom:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 51
    .line 52
    if-ne p1, v1, :cond_3

    .line 53
    .line 54
    iget-object p1, p0, Ll/pzk;->S:Ll/kcg0;

    .line 55
    .line 56
    invoke-static {p1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->o()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;

    .line 64
    .line 65
    .line 66
    move-result-object p3

    .line 67
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->y()Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object p3

    .line 71
    invoke-virtual {p0, p1, p3}, Ll/dmf;->k(Ll/ner;Lrx/c;)Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    new-instance p3, Ll/kzk;

    .line 76
    .line 77
    invoke-direct {p3, p2}, Ll/kzk;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p1, p3}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    new-instance p2, Ll/lzk;

    .line 85
    .line 86
    invoke-direct {p2, p0}, Ll/lzk;-><init>(Ll/pzk;)V

    .line 87
    .line 88
    .line 89
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 90
    .line 91
    .line 92
    move-result-object p2

    .line 93
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    iput-object p1, p0, Ll/pzk;->S:Ll/kcg0;

    .line 98
    .line 99
    iget-object p1, p0, Ll/pzk;->T:Ll/kcg0;

    .line 100
    .line 101
    invoke-static {p1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    sget-object p2, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->INSTANCE:Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;

    .line 109
    .line 110
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/admob/NavigationBarAdmobHelper;->l()Lrx/subjects/a;

    .line 111
    .line 112
    .line 113
    move-result-object p2

    .line 114
    invoke-virtual {p0, p1, p2}, Ll/dmf;->k(Ll/ner;Lrx/c;)Lrx/c;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    new-instance p2, Ll/mzk;

    .line 119
    .line 120
    invoke-direct {p2, p0}, Ll/mzk;-><init>(Ll/pzk;)V

    .line 121
    .line 122
    .line 123
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 124
    .line 125
    .line 126
    move-result-object p2

    .line 127
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    iput-object p1, p0, Ll/pzk;->T:Ll/kcg0;

    .line 132
    .line 133
    :cond_3
    return-void
.end method

.method public final f0(Lcom/p1/mobile/putong/data/Extensions;IZ)V
    .locals 1

    .line 1
    :try_start_0
    sget-object v0, Ll/sp0;->INSTANCE:Ll/sp0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/sp0;->l(Lcom/p1/mobile/putong/data/Extensions;)Lcom/p1/mobile/putong/core/data/LikeMindedItemStatusData;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/pzk;->a0:Lcom/p1/mobile/putong/core/ui/animalfacial/AnimalFacialCardView;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object p3, p0, Ll/pzk;->C:Landroid/view/ViewStub;

    .line 18
    .line 19
    invoke-virtual {p3}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object p3

    .line 23
    check-cast p3, Lcom/p1/mobile/putong/core/ui/animalfacial/AnimalFacialCardView;

    .line 24
    .line 25
    iput-object p3, p0, Ll/pzk;->a0:Lcom/p1/mobile/putong/core/ui/animalfacial/AnimalFacialCardView;

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    iget-object v0, p0, Ll/pzk;->a0:Lcom/p1/mobile/putong/core/ui/animalfacial/AnimalFacialCardView;

    .line 29
    .line 30
    invoke-static {v0, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    :goto_0
    iget-object p3, p0, Ll/pzk;->a0:Lcom/p1/mobile/putong/core/ui/animalfacial/AnimalFacialCardView;

    .line 34
    .line 35
    invoke-static {p3, p2}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Ll/pzk;->a0:Lcom/p1/mobile/putong/core/ui/animalfacial/AnimalFacialCardView;

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/animalfacial/AnimalFacialCardView;->b(Lcom/p1/mobile/putong/core/data/LikeMindedItemStatusData;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 41
    .line 42
    .line 43
    :catch_0
    :cond_1
    return-void
.end method

.method public g(Landroid/view/View;)V
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ResourceType"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1}, Ll/dmf;->g(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/pzk;->V(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/pzk;->F:Landroid/view/View;

    .line 8
    .line 9
    new-instance v0, Ll/ezk;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/ezk;-><init>(Ll/pzk;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final g0(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;ZZ)V
    .locals 7

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/pzk;->X:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p2, p0, Ll/pzk;->r:Landroid/view/ViewStub;

    .line 10
    .line 11
    invoke-virtual {p2}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    check-cast p2, Lv/VDraweeView;

    .line 16
    .line 17
    iput-object p2, p0, Ll/pzk;->X:Lv/VDraweeView;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object v0, p0, Ll/pzk;->X:Lv/VDraweeView;

    .line 21
    .line 22
    invoke-static {v0, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    :goto_0
    if-eqz p3, :cond_1

    .line 26
    .line 27
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->samesCardData:Lcom/p1/mobile/putong/core/data/SamesCardData;

    .line 28
    .line 29
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/SamesCardData;->tag_url:Ljava/lang/String;

    .line 30
    .line 31
    :goto_1
    move-object v2, p1

    .line 32
    goto :goto_2

    .line 33
    :cond_1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->samesCardData:Lcom/p1/mobile/putong/core/data/SamesCardData;

    .line 34
    .line 35
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/SamesCardData;->icon_url:Ljava/lang/String;

    .line 36
    .line 37
    goto :goto_1

    .line 38
    :goto_2
    iget-object p1, p0, Ll/pzk;->X:Lv/VDraweeView;

    .line 39
    .line 40
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    if-eq p1, v2, :cond_2

    .line 45
    .line 46
    iget-object p1, p0, Ll/pzk;->X:Lv/VDraweeView;

    .line 47
    .line 48
    invoke-virtual {p1, v2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 52
    .line 53
    iget-object v1, p0, Ll/pzk;->X:Lv/VDraweeView;

    .line 54
    .line 55
    const/4 v5, 0x0

    .line 56
    const/4 v6, 0x0

    .line 57
    const/4 v3, 0x1

    .line 58
    const/4 v4, 0x0

    .line 59
    invoke-virtual/range {v0 .. v6}, Ll/fsb0;->O0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;ZZLl/q3d0;Ll/fn2;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 60
    .line 61
    .line 62
    :catch_0
    :cond_2
    return-void
.end method

.method public final h0(Ll/aoh0;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/pzk;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 2
    .line 3
    iget-object v1, p0, Ll/pzk;->P:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    new-instance v2, Ll/pzk$b;

    .line 6
    .line 7
    invoke-direct {v2, p0}, Ll/pzk$b;-><init>(Ll/pzk;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p1, v1, v2}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->a0(Ll/aoh0;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$b;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final i0()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/pzk;->B:Lcom/p1/mobile/putong/core/ui/likeminded/LikeMindedCardTabView;

    .line 2
    .line 3
    iget-boolean v1, p0, Ll/pzk;->Y:Z

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-object v1, p0, Ll/pzk;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->getCurrentItem()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    move v1, v3

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    move v1, v2

    .line 20
    :goto_0
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/pzk;->X:Lv/VDraweeView;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    iget-object v0, p0, Ll/pzk;->X:Lv/VDraweeView;

    .line 32
    .line 33
    iget-object v1, p0, Ll/pzk;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 34
    .line 35
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->getCurrentItem()I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-nez v1, :cond_1

    .line 40
    .line 41
    move v1, v3

    .line 42
    goto :goto_1

    .line 43
    :cond_1
    move v1, v2

    .line 44
    :goto_1
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 45
    .line 46
    .line 47
    :cond_2
    iget-object v0, p0, Ll/pzk;->Z:Lcom/p1/mobile/putong/core/ui/intloperation/regularsticker/RegularStickerCardTabView;

    .line 48
    .line 49
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_4

    .line 54
    .line 55
    iget-object v0, p0, Ll/pzk;->Z:Lcom/p1/mobile/putong/core/ui/intloperation/regularsticker/RegularStickerCardTabView;

    .line 56
    .line 57
    iget-object v1, p0, Ll/pzk;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 58
    .line 59
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->getCurrentItem()I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-nez v1, :cond_3

    .line 64
    .line 65
    move v1, v3

    .line 66
    goto :goto_2

    .line 67
    :cond_3
    move v1, v2

    .line 68
    :goto_2
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 69
    .line 70
    .line 71
    :cond_4
    iget-object v0, p0, Ll/pzk;->a0:Lcom/p1/mobile/putong/core/ui/animalfacial/AnimalFacialCardView;

    .line 72
    .line 73
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-eqz v0, :cond_6

    .line 78
    .line 79
    iget-object v0, p0, Ll/pzk;->a0:Lcom/p1/mobile/putong/core/ui/animalfacial/AnimalFacialCardView;

    .line 80
    .line 81
    iget-object p0, p0, Ll/pzk;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 82
    .line 83
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->getCurrentItem()I

    .line 84
    .line 85
    .line 86
    move-result p0

    .line 87
    if-nez p0, :cond_5

    .line 88
    .line 89
    move v2, v3

    .line 90
    :cond_5
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 91
    .line 92
    .line 93
    :cond_6
    return-void
.end method

.method public j(Landroid/view/View;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public j0()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pzk;->d0:Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;

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
    iget-object v0, p0, Ll/pzk;->d0:Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;

    .line 10
    .line 11
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/pzk;->G:Lv/VFrame;

    .line 18
    .line 19
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public final k0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pzk;->Q:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->coreMomentInfo:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public final synthetic l0(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/pzk;->P:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->q6()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Ll/pzk;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->z()V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public final synthetic m0(Lcom/p1/mobile/putong/data/User;ZLandroid/view/View;)V
    .locals 7

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object p3

    .line 8
    iget-object v0, p0, Ll/pzk;->Q:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 9
    .line 10
    const-string v1, "profile_photo_compliment_btn"

    .line 11
    .line 12
    invoke-static {p3, v0, p1, v1}, Ll/np5;->b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)Z

    .line 13
    .line 14
    .line 15
    move-result p3

    .line 16
    if-eqz p3, :cond_1

    .line 17
    .line 18
    :goto_0
    return-void

    .line 19
    :cond_1
    iget-object p3, p0, Ll/pzk;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 20
    .line 21
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->getCurrentPosition()I

    .line 22
    .line 23
    .line 24
    move-result p3

    .line 25
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    new-instance v5, Ll/ozk;

    .line 34
    .line 35
    invoke-direct {v5, p0, p2}, Ll/ozk;-><init>(Ll/pzk;Z)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Ll/pzk;->Q:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 39
    .line 40
    iget-object v6, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->liveRoomInfo:Ljava/lang/String;

    .line 41
    .line 42
    const-string v2, "profile_photo_compliment_btn"

    .line 43
    .line 44
    const/4 v4, 0x0

    .line 45
    move-object v1, p1

    .line 46
    invoke-static/range {v0 .. v6}, Ll/fp5;->n(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ljava/lang/Integer;Ll/x20;Lkotlin/jvm/functions/Function1;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public final synthetic n0(ZLcom/p1/mobile/putong/data/User;)Lkotlin/Unit;
    .locals 1

    .line 1
    invoke-static {}, Ll/fp5;->i()Lkotlin/jvm/functions/Function1;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0, p2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    if-eqz p1, :cond_1

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    instance-of p1, p1, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;

    .line 15
    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;

    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->D2()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    instance-of p2, p1, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;

    .line 29
    .line 30
    if-eqz p2, :cond_0

    .line 31
    .line 32
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragExpandedImpl;->V4()Ll/g6a0;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->REMOVE:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 39
    .line 40
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    invoke-virtual {p0, p1}, Ll/g6a0;->n1(I)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 53
    .line 54
    .line 55
    :cond_1
    :goto_0
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 56
    .line 57
    return-object p0
.end method

.method public final synthetic o0(Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper$b;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper$b;->e()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iput-boolean p1, p0, Ll/pzk;->e0:Z

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-virtual {p0, p1, v0}, Ll/pzk;->W(ZZ)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic p0(Ljava/lang/Integer;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/pzk;->f:Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->P()V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/pzk;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 7
    .line 8
    new-instance v0, Ll/pzk$a;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Ll/pzk$a;-><init>(Ll/pzk;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public q(Z)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/pzk;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->W(Z)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public final synthetic q0(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pzk;->b0(Lcom/p1/mobile/putong/data/User;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic r0(ZLcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Landroid/view/View;)V
    .locals 9

    .line 1
    sget-object p3, Ll/nbw;->INSTANCE:Ll/nbw;

    .line 2
    .line 3
    const-string v0, "click"

    .line 4
    .line 5
    invoke-virtual {p3, p1, v0}, Ll/nbw;->N(ZLjava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object p1, Ll/haw;->Companion:Ll/haw$a;

    .line 9
    .line 10
    invoke-virtual {p1}, Ll/haw$a;->a()Ll/haw;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iget-object p0, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->intlInsertCardData:Lcom/p1/mobile/putong/core/data/IntlInsertCardData;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/IntlInsertCardData;->buzzUser:Lcom/p1/mobile/putong/core/data/BuzzUser;

    .line 21
    .line 22
    iget-object v2, p0, Lcom/p1/mobile/putong/core/data/BuzzUser;->buzzToken:Ljava/lang/String;

    .line 23
    .line 24
    iget-object v3, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p3}, Ll/nbw;->x()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    new-instance v5, Ll/fzk;

    .line 31
    .line 32
    invoke-direct {v5}, Ll/fzk;-><init>()V

    .line 33
    .line 34
    .line 35
    const/4 v7, 0x0

    .line 36
    const/4 v8, 0x1

    .line 37
    const/4 v6, 0x0

    .line 38
    invoke-virtual/range {v0 .. v8}, Ll/haw;->W(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Z)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public s()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/dmf;->s()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/pzk;->F0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic s0(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/UserLiveState;Landroid/view/View;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 2
    .line 3
    .line 4
    move-result p5

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p5, :cond_0

    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 9
    .line 10
    .line 11
    move-result-object p5

    .line 12
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const/4 v2, 0x0

    .line 17
    const/4 v3, 0x1

    .line 18
    invoke-interface {p5, v1, v2, v3, v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->F8(Lcom/p1/mobile/android/app/Act;ZZLjava/lang/String;)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 23
    .line 24
    .line 25
    move-result-object p5

    .line 26
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-interface {v2, p2}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->getUserLiveId(Ljava/lang/String;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    const-string v3, "profile"

    .line 39
    .line 40
    invoke-interface {p5, v1, v2, v3, v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->startAudienceLive(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    :goto_0
    sget-object p5, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 44
    .line 45
    iget-object p5, p5, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 46
    .line 47
    invoke-virtual {p5, p2}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->L6(Ljava/lang/String;)Z

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    const-string p5, "p_suggest_user_profile_info_view"

    .line 52
    .line 53
    if-eqz p2, :cond_1

    .line 54
    .line 55
    const-string p2, "home_card"

    .line 56
    .line 57
    invoke-static {p2, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 58
    .line 59
    .line 60
    move-result p2

    .line 61
    if-eqz p2, :cond_1

    .line 62
    .line 63
    invoke-static {p5, p1}, Ll/tvn;->a(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_1
    const-string p2, "e_live_room_enter"

    .line 68
    .line 69
    invoke-virtual {p0, p1, p4, p3}, Ll/pzk;->Z(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/UserLiveState;Ljava/lang/String;)Ljava/util/HashMap;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-static {p2, p5, p0}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public final synthetic t0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/UserLiveState;Ljava/lang/String;Landroid/view/View;)V
    .locals 4

    .line 1
    sget-object p4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p4, p4, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p4, v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->L6(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p4

    .line 11
    if-eqz p4, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 15
    .line 16
    .line 17
    move-result-object p4

    .line 18
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 27
    .line 28
    invoke-interface {v1, v2}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->getUserLiveId(Ljava/lang/String;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    const-string v2, "suggest-card"

    .line 33
    .line 34
    const/4 v3, 0x0

    .line 35
    invoke-interface {p4, v0, v1, v2, v3}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->startAudienceLive(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    const-string p4, "p_suggest_users_home_view"

    .line 39
    .line 40
    invoke-virtual {p0, p1, p2, p3}, Ll/pzk;->Z(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/UserLiveState;Ljava/lang/String;)Ljava/util/HashMap;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    const-string p1, "e_live_room_enter"

    .line 45
    .line 46
    invoke-static {p1, p4, p0}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public final u0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    const/4 p2, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p2, 0x0

    .line 16
    :goto_0
    iput-boolean p2, p0, Ll/pzk;->h0:Z

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/pzk;->L0()V

    .line 19
    .line 20
    .line 21
    iget-boolean p2, p0, Ll/pzk;->h0:Z

    .line 22
    .line 23
    if-eqz p2, :cond_1

    .line 24
    .line 25
    const-string p2, "e_clone_card_avatar_verified_tag"

    .line 26
    .line 27
    const-string v0, "p_suggest_users_home_view"

    .line 28
    .line 29
    invoke-static {p2, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object p2, p0, Ll/pzk;->t:Lv/VImage;

    .line 33
    .line 34
    new-instance v0, Ll/izk;

    .line 35
    .line 36
    invoke-direct {v0, p0, p1}, Ll/izk;-><init>(Ll/pzk;Lcom/p1/mobile/putong/data/User;)V

    .line 37
    .line 38
    .line 39
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 40
    .line 41
    .line 42
    :cond_1
    return-void
.end method

.method public v()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/dmf;->v()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/pzk;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->W(Z)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public v0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;I)V
    .locals 5

    .line 1
    sget-object v0, Ll/qap;->Companion:Ll/qap$a;

    .line 2
    .line 3
    invoke-virtual {v0, p2, p1}, Ll/qap$a;->n(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/pzk;->d0:Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v0, :cond_3

    .line 11
    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Ll/pzk;->I:Landroid/view/ViewStub;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;

    .line 21
    .line 22
    iput-object v0, p0, Ll/pzk;->d0:Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;

    .line 23
    .line 24
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iget-object v1, p0, Ll/pzk;->d0:Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;

    .line 29
    .line 30
    const/high16 v3, 0x42b40000    # 90.0f

    .line 31
    .line 32
    const/high16 v4, 0x41a00000    # 20.0f

    .line 33
    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    const/high16 v0, 0x42a00000    # 80.0f

    .line 37
    .line 38
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    invoke-static {v1, v0}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/pzk;->d0:Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;

    .line 46
    .line 47
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    invoke-static {v0, v1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ll/pzk;->E:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;

    .line 55
    .line 56
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->h(I)V

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_1
    invoke-static {v1, v2}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Ll/pzk;->d0:Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;

    .line 68
    .line 69
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    invoke-static {v0, v1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Ll/pzk;->E:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;

    .line 77
    .line 78
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->h(I)V

    .line 83
    .line 84
    .line 85
    :goto_0
    iget-object v0, p0, Ll/pzk;->d0:Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;

    .line 86
    .line 87
    const/4 v1, 0x1

    .line 88
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Ll/pzk;->d0:Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;

    .line 92
    .line 93
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-virtual {v0, p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/home/views/IntlCommercialCardBottomActionLayout;->Y(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;I)V

    .line 98
    .line 99
    .line 100
    if-nez p3, :cond_4

    .line 101
    .line 102
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 103
    .line 104
    .line 105
    move-result p0

    .line 106
    if-eqz p0, :cond_2

    .line 107
    .line 108
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 109
    .line 110
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 111
    .line 112
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->m2:Lrx/subjects/b;

    .line 113
    .line 114
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 115
    .line 116
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 117
    .line 118
    .line 119
    return-void

    .line 120
    :cond_2
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 121
    .line 122
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 123
    .line 124
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->l2:Lrx/subjects/b;

    .line 125
    .line 126
    const-string p1, "renderCommercialCardBottomActionLayout"

    .line 127
    .line 128
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 129
    .line 130
    .line 131
    return-void

    .line 132
    :cond_3
    if-eqz v1, :cond_4

    .line 133
    .line 134
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 135
    .line 136
    .line 137
    :cond_4
    return-void
.end method

.method public final w0(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;I)V
    .locals 5

    .line 1
    invoke-static {}, Ll/d79;->e0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_8

    .line 7
    .line 8
    iget-object v0, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->intlInsertCardData:Lcom/p1/mobile/putong/core/data/IntlInsertCardData;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_8

    .line 15
    .line 16
    iget-object v0, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->intlInsertCardData:Lcom/p1/mobile/putong/core/data/IntlInsertCardData;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/IntlInsertCardData;->buzzUser:Lcom/p1/mobile/putong/core/data/BuzzUser;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_8

    .line 25
    .line 26
    iget-object v0, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->intlInsertCardData:Lcom/p1/mobile/putong/core/data/IntlInsertCardData;

    .line 27
    .line 28
    iget v2, v0, Lcom/p1/mobile/putong/core/data/IntlInsertCardData;->cardType:I

    .line 29
    .line 30
    const/16 v3, 0xa

    .line 31
    .line 32
    if-ne v2, v3, :cond_8

    .line 33
    .line 34
    iget v2, v0, Lcom/p1/mobile/putong/core/data/IntlInsertCardData;->showType:I

    .line 35
    .line 36
    const/4 v3, 0x1

    .line 37
    if-ne v2, v3, :cond_8

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/IntlInsertCardData;->buzzUser:Lcom/p1/mobile/putong/core/data/BuzzUser;

    .line 40
    .line 41
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/BuzzUser;->isBlur:Z

    .line 42
    .line 43
    if-nez p2, :cond_0

    .line 44
    .line 45
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 46
    .line 47
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 48
    .line 49
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/CoreSuggested;->J0:Lrx/subjects/b;

    .line 50
    .line 51
    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 52
    .line 53
    invoke-virtual {v2, v4}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    sget-object v2, Ll/nbw;->INSTANCE:Ll/nbw;

    .line 57
    .line 58
    invoke-virtual {v2, v0}, Ll/nbw;->O(Z)V

    .line 59
    .line 60
    .line 61
    :cond_0
    if-eqz v0, :cond_1

    .line 62
    .line 63
    invoke-virtual {p0, v1, v1}, Ll/pzk;->N0(ZZ)V

    .line 64
    .line 65
    .line 66
    :cond_1
    iget-object v2, p0, Ll/pzk;->c0:Lv/VText;

    .line 67
    .line 68
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    if-eqz v2, :cond_3

    .line 73
    .line 74
    iget-object v2, p0, Ll/pzk;->c0:Lv/VText;

    .line 75
    .line 76
    if-nez p2, :cond_2

    .line 77
    .line 78
    move v4, v3

    .line 79
    goto :goto_0

    .line 80
    :cond_2
    move v4, v1

    .line 81
    :goto_0
    invoke-static {v2, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 82
    .line 83
    .line 84
    :cond_3
    iget-object v2, p0, Ll/pzk;->b0:Lv/VImage;

    .line 85
    .line 86
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    if-eqz v2, :cond_4

    .line 91
    .line 92
    iget-object v2, p0, Ll/pzk;->b0:Lv/VImage;

    .line 93
    .line 94
    invoke-static {v2}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    if-eqz v2, :cond_4

    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_4
    iget-object v2, p0, Ll/pzk;->b0:Lv/VImage;

    .line 102
    .line 103
    if-nez v2, :cond_5

    .line 104
    .line 105
    iget-object v2, p0, Ll/pzk;->s:Landroid/view/ViewStub;

    .line 106
    .line 107
    invoke-virtual {v2}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    check-cast v2, Lv/VImage;

    .line 112
    .line 113
    iput-object v2, p0, Ll/pzk;->b0:Lv/VImage;

    .line 114
    .line 115
    :cond_5
    iget-object v2, p0, Ll/pzk;->c0:Lv/VText;

    .line 116
    .line 117
    if-nez v2, :cond_6

    .line 118
    .line 119
    iget-object v2, p0, Ll/pzk;->H:Landroid/view/ViewStub;

    .line 120
    .line 121
    invoke-virtual {v2}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 122
    .line 123
    .line 124
    move-result-object v2

    .line 125
    check-cast v2, Lv/VText;

    .line 126
    .line 127
    iput-object v2, p0, Ll/pzk;->c0:Lv/VText;

    .line 128
    .line 129
    :cond_6
    iget-object v2, p0, Ll/pzk;->b0:Lv/VImage;

    .line 130
    .line 131
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 132
    .line 133
    .line 134
    iget-object v2, p0, Ll/pzk;->c0:Lv/VText;

    .line 135
    .line 136
    if-nez p2, :cond_7

    .line 137
    .line 138
    move v1, v3

    .line 139
    :cond_7
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 140
    .line 141
    .line 142
    iget-object p2, p0, Ll/pzk;->E:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;

    .line 143
    .line 144
    const/high16 v1, 0x42a80000    # 84.0f

    .line 145
    .line 146
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 147
    .line 148
    .line 149
    move-result v1

    .line 150
    invoke-virtual {p2, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedCardInforLayout;->h(I)V

    .line 151
    .line 152
    .line 153
    iget-object p2, p0, Ll/pzk;->b0:Lv/VImage;

    .line 154
    .line 155
    sget v1, Ll/dbc0;->j9:I

    .line 156
    .line 157
    invoke-virtual {p2, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 158
    .line 159
    .line 160
    iget-object p2, p0, Ll/pzk;->c0:Lv/VText;

    .line 161
    .line 162
    new-instance v1, Ll/nzk;

    .line 163
    .line 164
    invoke-direct {v1, p0, v0, p1}, Ll/nzk;-><init>(Ll/pzk;ZLcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V

    .line 165
    .line 166
    .line 167
    invoke-static {p2, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 168
    .line 169
    .line 170
    return-void

    .line 171
    :cond_8
    iget-object p1, p0, Ll/pzk;->b0:Lv/VImage;

    .line 172
    .line 173
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 174
    .line 175
    .line 176
    move-result p1

    .line 177
    if-eqz p1, :cond_9

    .line 178
    .line 179
    iget-object p1, p0, Ll/pzk;->b0:Lv/VImage;

    .line 180
    .line 181
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 182
    .line 183
    .line 184
    :cond_9
    iget-object p1, p0, Ll/pzk;->c0:Lv/VText;

    .line 185
    .line 186
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 187
    .line 188
    .line 189
    move-result p1

    .line 190
    if-eqz p1, :cond_a

    .line 191
    .line 192
    iget-object p0, p0, Ll/pzk;->c0:Lv/VText;

    .line 193
    .line 194
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 195
    .line 196
    .line 197
    :cond_a
    :goto_1
    return-void
.end method

.method public final x0(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/Extensions;IZ)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->samesCardData:Lcom/p1/mobile/putong/core/data/SamesCardData;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_6

    .line 5
    .line 6
    iget-object p2, v0, Lcom/p1/mobile/putong/core/data/SamesCardData;->type:Ljava/lang/String;

    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/a;->Companion:Lcom/p1/mobile/putong/core/newui/home/a$a;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/a$a;->h()Z

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    if-eqz v2, :cond_3

    .line 15
    .line 16
    iget-object v0, p0, Ll/pzk;->B:Lcom/p1/mobile/putong/core/ui/likeminded/LikeMindedCardTabView;

    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    iput-boolean v1, p0, Ll/pzk;->Y:Z

    .line 22
    .line 23
    const-string v0, "quiz"

    .line 24
    .line 25
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    invoke-virtual {p0, p1, p4, v1}, Ll/pzk;->g0(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;ZZ)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    const-string v0, "regular"

    .line 36
    .line 37
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-nez v0, :cond_1

    .line 42
    .line 43
    const-string v0, "flash"

    .line 44
    .line 45
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    if-eqz p2, :cond_a

    .line 50
    .line 51
    :cond_1
    iget-boolean p2, p0, Ll/pzk;->V:Z

    .line 52
    .line 53
    if-nez p2, :cond_a

    .line 54
    .line 55
    iget-object p2, p0, Ll/pzk;->Z:Lcom/p1/mobile/putong/core/ui/intloperation/regularsticker/RegularStickerCardTabView;

    .line 56
    .line 57
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result p2

    .line 61
    if-nez p2, :cond_2

    .line 62
    .line 63
    iget-object p2, p0, Ll/pzk;->A:Landroid/view/ViewStub;

    .line 64
    .line 65
    invoke-virtual {p2}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object p2

    .line 69
    check-cast p2, Lcom/p1/mobile/putong/core/ui/intloperation/regularsticker/RegularStickerCardTabView;

    .line 70
    .line 71
    iput-object p2, p0, Ll/pzk;->Z:Lcom/p1/mobile/putong/core/ui/intloperation/regularsticker/RegularStickerCardTabView;

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_2
    iget-object p2, p0, Ll/pzk;->Z:Lcom/p1/mobile/putong/core/ui/intloperation/regularsticker/RegularStickerCardTabView;

    .line 75
    .line 76
    invoke-static {p2, p4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 77
    .line 78
    .line 79
    :goto_0
    iget-object p2, p0, Ll/pzk;->Z:Lcom/p1/mobile/putong/core/ui/intloperation/regularsticker/RegularStickerCardTabView;

    .line 80
    .line 81
    invoke-static {p2, p3}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 82
    .line 83
    .line 84
    iget-object p2, p0, Ll/pzk;->Z:Lcom/p1/mobile/putong/core/ui/intloperation/regularsticker/RegularStickerCardTabView;

    .line 85
    .line 86
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object p2

    .line 90
    iget-object p3, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->samesCardData:Lcom/p1/mobile/putong/core/data/SamesCardData;

    .line 91
    .line 92
    iget-object p3, p3, Lcom/p1/mobile/putong/core/data/SamesCardData;->id:Ljava/lang/String;

    .line 93
    .line 94
    if-eq p2, p3, :cond_a

    .line 95
    .line 96
    iget-object p2, p0, Ll/pzk;->Z:Lcom/p1/mobile/putong/core/ui/intloperation/regularsticker/RegularStickerCardTabView;

    .line 97
    .line 98
    invoke-virtual {p2, p3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 99
    .line 100
    .line 101
    iget-object p0, p0, Ll/pzk;->Z:Lcom/p1/mobile/putong/core/ui/intloperation/regularsticker/RegularStickerCardTabView;

    .line 102
    .line 103
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->samesCardData:Lcom/p1/mobile/putong/core/data/SamesCardData;

    .line 104
    .line 105
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/intloperation/regularsticker/RegularStickerCardTabView;->b(Lcom/p1/mobile/putong/core/data/SamesCardData;)V

    .line 106
    .line 107
    .line 108
    return-void

    .line 109
    :cond_3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/a$a;->c()Z

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    const/4 v2, 0x1

    .line 114
    if-eqz v1, :cond_4

    .line 115
    .line 116
    invoke-virtual {p0, p1, p4, v2}, Ll/pzk;->g0(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;ZZ)V

    .line 117
    .line 118
    .line 119
    return-void

    .line 120
    :cond_4
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/a$a;->g()Z

    .line 121
    .line 122
    .line 123
    move-result p1

    .line 124
    if-eqz p1, :cond_5

    .line 125
    .line 126
    iget-boolean p1, p0, Ll/pzk;->V:Z

    .line 127
    .line 128
    if-nez p1, :cond_5

    .line 129
    .line 130
    sget-object p1, Ll/xnf0;->INSTANCE:Ll/xnf0;

    .line 131
    .line 132
    invoke-virtual {p1, p2}, Ll/xnf0;->k(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SimilarInterestsItemSwipeData;

    .line 133
    .line 134
    .line 135
    move-result-object p2

    .line 136
    if-eqz p2, :cond_a

    .line 137
    .line 138
    iget-object v0, p0, Ll/pzk;->B:Lcom/p1/mobile/putong/core/ui/likeminded/LikeMindedCardTabView;

    .line 139
    .line 140
    invoke-static {v0, p3}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 141
    .line 142
    .line 143
    iget-object p3, p0, Ll/pzk;->B:Lcom/p1/mobile/putong/core/ui/likeminded/LikeMindedCardTabView;

    .line 144
    .line 145
    invoke-virtual {p1}, Ll/xnf0;->e()Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    invoke-virtual {p3, p2, p1}, Lcom/p1/mobile/putong/core/ui/likeminded/LikeMindedCardTabView;->c(Lcom/p1/mobile/putong/core/data/SimilarInterestsItemSwipeData;Lcom/p1/mobile/putong/core/data/SimilarInterestsBaseData;)V

    .line 150
    .line 151
    .line 152
    iget-object p1, p0, Ll/pzk;->B:Lcom/p1/mobile/putong/core/ui/likeminded/LikeMindedCardTabView;

    .line 153
    .line 154
    invoke-static {p1, p4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 155
    .line 156
    .line 157
    iput-boolean v2, p0, Ll/pzk;->Y:Z

    .line 158
    .line 159
    return-void

    .line 160
    :cond_5
    iget-boolean p1, p0, Ll/pzk;->V:Z

    .line 161
    .line 162
    if-nez p1, :cond_a

    .line 163
    .line 164
    sget-object p1, Ll/jfr;->INSTANCE:Ll/jfr;

    .line 165
    .line 166
    invoke-virtual {p1, p2}, Ll/jfr;->d(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/LikeMindedItemStatusData;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    if-eqz p1, :cond_a

    .line 171
    .line 172
    iget-object p2, p0, Ll/pzk;->B:Lcom/p1/mobile/putong/core/ui/likeminded/LikeMindedCardTabView;

    .line 173
    .line 174
    invoke-static {p2, p3}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 175
    .line 176
    .line 177
    iget-object p2, p0, Ll/pzk;->B:Lcom/p1/mobile/putong/core/ui/likeminded/LikeMindedCardTabView;

    .line 178
    .line 179
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/ui/likeminded/LikeMindedCardTabView;->b(Lcom/p1/mobile/putong/core/data/LikeMindedItemStatusData;)V

    .line 180
    .line 181
    .line 182
    iget-object p1, p0, Ll/pzk;->B:Lcom/p1/mobile/putong/core/ui/likeminded/LikeMindedCardTabView;

    .line 183
    .line 184
    invoke-static {p1, p4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 185
    .line 186
    .line 187
    iput-boolean v2, p0, Ll/pzk;->Y:Z

    .line 188
    .line 189
    return-void

    .line 190
    :cond_6
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/a;->Companion:Lcom/p1/mobile/putong/core/newui/home/a$a;

    .line 191
    .line 192
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/a$a;->b()Z

    .line 193
    .line 194
    .line 195
    move-result p1

    .line 196
    if-eqz p1, :cond_7

    .line 197
    .line 198
    sget-object p1, Ll/sp0;->INSTANCE:Ll/sp0;

    .line 199
    .line 200
    invoke-virtual {p1, p2}, Ll/sp0;->j(Lcom/p1/mobile/putong/data/Extensions;)Z

    .line 201
    .line 202
    .line 203
    move-result p1

    .line 204
    if-eqz p1, :cond_7

    .line 205
    .line 206
    iget-boolean p1, p0, Ll/pzk;->W:Z

    .line 207
    .line 208
    if-nez p1, :cond_7

    .line 209
    .line 210
    iget-boolean p1, p0, Ll/pzk;->V:Z

    .line 211
    .line 212
    if-nez p1, :cond_7

    .line 213
    .line 214
    invoke-virtual {p0, p2, p3, p4}, Ll/pzk;->f0(Lcom/p1/mobile/putong/data/Extensions;IZ)V

    .line 215
    .line 216
    .line 217
    return-void

    .line 218
    :cond_7
    iget-object p1, p0, Ll/pzk;->B:Lcom/p1/mobile/putong/core/ui/likeminded/LikeMindedCardTabView;

    .line 219
    .line 220
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 221
    .line 222
    .line 223
    iget-object p1, p0, Ll/pzk;->X:Lv/VDraweeView;

    .line 224
    .line 225
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 226
    .line 227
    .line 228
    move-result p1

    .line 229
    if-eqz p1, :cond_8

    .line 230
    .line 231
    iget-object p1, p0, Ll/pzk;->X:Lv/VDraweeView;

    .line 232
    .line 233
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 234
    .line 235
    .line 236
    :cond_8
    iput-boolean v1, p0, Ll/pzk;->Y:Z

    .line 237
    .line 238
    iget-object p1, p0, Ll/pzk;->Z:Lcom/p1/mobile/putong/core/ui/intloperation/regularsticker/RegularStickerCardTabView;

    .line 239
    .line 240
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 241
    .line 242
    .line 243
    move-result p1

    .line 244
    if-eqz p1, :cond_9

    .line 245
    .line 246
    iget-object p1, p0, Ll/pzk;->Z:Lcom/p1/mobile/putong/core/ui/intloperation/regularsticker/RegularStickerCardTabView;

    .line 247
    .line 248
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 249
    .line 250
    .line 251
    :cond_9
    iget-object p1, p0, Ll/pzk;->a0:Lcom/p1/mobile/putong/core/ui/animalfacial/AnimalFacialCardView;

    .line 252
    .line 253
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 254
    .line 255
    .line 256
    move-result p1

    .line 257
    if-eqz p1, :cond_a

    .line 258
    .line 259
    iget-object p0, p0, Ll/pzk;->a0:Lcom/p1/mobile/putong/core/ui/animalfacial/AnimalFacialCardView;

    .line 260
    .line 261
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 262
    .line 263
    .line 264
    :cond_a
    return-void
.end method

.method public y()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/f6l;->y()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final y0(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;I)V
    .locals 8

    .line 1
    iput-object p1, p0, Ll/pzk;->Q:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 2
    .line 3
    iget-object v0, p0, Ll/pzk;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 4
    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    iget-object v0, p0, Ll/pzk;->R:Ll/aoh0;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {v0}, Ll/aoh0;->a()Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    iget-object v0, p0, Ll/pzk;->R:Ll/aoh0;

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/aoh0;->a()Ljava/util/List;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    iget-object v0, p0, Ll/pzk;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 32
    .line 33
    const/4 v1, 0x1

    .line 34
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->setAutoPlayEnabled(Z)V

    .line 35
    .line 36
    .line 37
    iget-object v2, p0, Ll/pzk;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 38
    .line 39
    iget-object v5, p0, Ll/pzk;->R:Ll/aoh0;

    .line 40
    .line 41
    iget-object v7, p0, Ll/f6l;->e:Ll/jm50;

    .line 42
    .line 43
    move-object v4, p1

    .line 44
    move-object v3, p2

    .line 45
    move v6, p3

    .line 46
    invoke-virtual/range {v2 .. v7}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->Z(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Ll/aoh0;ILl/jm50;)V

    .line 47
    .line 48
    .line 49
    :cond_2
    :goto_0
    return-void
.end method

.method public z(F)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/f6l;->z(F)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/pzk;->f:Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardHeadLayoutV2;->setCardStyleChangeProgress(F)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/pzk;->i:Landroid/view/View;

    .line 10
    .line 11
    const/high16 v1, 0x3f800000    # 1.0f

    .line 12
    .line 13
    sub-float/2addr v1, p1

    .line 14
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/pzk;->h:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->setCardStyleChangeProgress(F)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public z0(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/pzk;->V:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Ll/pzk;->z:Lv/VImage;

    .line 7
    .line 8
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {}, Lcom/p1/mobile/putong/core/api/a0;->j()Lcom/p1/mobile/putong/core/api/a0;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/a0;->d:Ll/wyd0;

    .line 19
    .line 20
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_6

    .line 29
    .line 30
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const-string v1, "in"

    .line 39
    .line 40
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-nez v1, :cond_5

    .line 45
    .line 46
    const-string v1, "id"

    .line 47
    .line 48
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-eqz v1, :cond_1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    const-string v1, "ja"

    .line 56
    .line 57
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-eqz v1, :cond_2

    .line 62
    .line 63
    sget v0, Ll/dbc0;->X2:I

    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_2
    const-string v1, "ko"

    .line 67
    .line 68
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    if-eqz v1, :cond_3

    .line 73
    .line 74
    sget v0, Ll/dbc0;->Y2:I

    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_3
    const-string v1, "th"

    .line 78
    .line 79
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-eqz v0, :cond_4

    .line 84
    .line 85
    sget v0, Ll/dbc0;->Z2:I

    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_4
    sget v0, Ll/dbc0;->W2:I

    .line 89
    .line 90
    goto :goto_1

    .line 91
    :cond_5
    :goto_0
    sget v0, Ll/dbc0;->V2:I

    .line 92
    .line 93
    :goto_1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 94
    .line 95
    invoke-virtual {p0, p1}, Ll/pzk;->K0(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    iget-object p1, p0, Ll/pzk;->z:Lv/VImage;

    .line 99
    .line 100
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 101
    .line 102
    .line 103
    iget-object p0, p0, Ll/pzk;->z:Lv/VImage;

    .line 104
    .line 105
    const/4 p1, 0x1

    .line 106
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 107
    .line 108
    .line 109
    return-void

    .line 110
    :cond_6
    iget-object p0, p0, Ll/pzk;->z:Lv/VImage;

    .line 111
    .line 112
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 113
    .line 114
    .line 115
    return-void
.end method
