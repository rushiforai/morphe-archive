.class public Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public A:Lv/VText;

.field public d:Ll/rpl;

.field public e:Lcom/p1/mobile/putong/core/view/LookUpView;

.field public f:Landroid/view/View;

.field public g:Lcom/p1/mobile/putong/core/ui/vip/widget/SwitchVerticalFrameLayout;

.field public h:Lv/VDraweeView;

.field public i:Landroid/widget/ImageView;

.field public j:Landroid/widget/FrameLayout;

.field public k:Landroid/view/ViewStub;

.field public l:Landroid/view/ViewStub;

.field public m:Lcom/tantan/library/svga/SVGAnimationView;

.field public n:Lv/VFrame;

.field public o:Lv/VText_AutoFit;

.field public p:Landroid/widget/TextView;

.field public q:Landroid/view/View;

.field public r:Lcom/tantan/library/svga/SVGAnimationView;

.field public s:Lv/VImage;

.field public t:Landroid/view/ViewStub;

.field public u:Lv/VImage;

.field public v:Lv/VText;

.field public w:Lv/VText;

.field public x:Landroid/view/View;

.field public y:Lv/VText;

.field public z:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 9
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 8
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->init()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private init()V
    .locals 4

    .line 1
    const/4 p0, 0x1

    .line 2
    invoke-static {p0}, Ll/v83;->c(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    invoke-static {}, Ll/b8d0;->b()Ll/b8d0;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Ll/b8d0;->g()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    const/4 v2, 0x0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-static {}, Ll/rbb0;->q()Z

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    if-nez v3, :cond_2

    .line 22
    .line 23
    :cond_0
    if-eqz v1, :cond_1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    move p0, v2

    .line 27
    :cond_2
    :goto_0
    sput-boolean p0, Ll/v83;->a:Z

    .line 28
    .line 29
    invoke-static {}, Ll/b8d0;->b()Ll/b8d0;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0}, Ll/b8d0;->i()V

    .line 34
    .line 35
    .line 36
    sget-boolean p0, Ll/v83;->a:Z

    .line 37
    .line 38
    if-eqz p0, :cond_5

    .line 39
    .line 40
    if-eqz v0, :cond_3

    .line 41
    .line 42
    if-eqz v1, :cond_3

    .line 43
    .line 44
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 47
    .line 48
    iget-object p0, p0, Ll/m27;->a0:Ll/jxd0;

    .line 49
    .line 50
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    :cond_3
    if-eqz v1, :cond_4

    .line 56
    .line 57
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 60
    .line 61
    iget-object p0, p0, Ll/m27;->b0:Ll/vxd0;

    .line 62
    .line 63
    invoke-virtual {p0}, Ll/vxd0;->clear()Z

    .line 64
    .line 65
    .line 66
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 67
    .line 68
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 69
    .line 70
    iget-object p0, p0, Ll/m27;->c0:Ll/vxd0;

    .line 71
    .line 72
    invoke-virtual {p0}, Ll/vxd0;->clear()Z

    .line 73
    .line 74
    .line 75
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 76
    .line 77
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 78
    .line 79
    iget-object p0, p0, Ll/m27;->d0:Ll/vxd0;

    .line 80
    .line 81
    invoke-virtual {p0}, Ll/vxd0;->clear()Z

    .line 82
    .line 83
    .line 84
    sget-object p0, Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper;->Companion:Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper$a;

    .line 85
    .line 86
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper$a;->b()Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper;->g()Ll/vxd0;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-virtual {p0}, Ll/vxd0;->clear()Z

    .line 95
    .line 96
    .line 97
    :cond_4
    invoke-static {}, Ll/b8d0;->b()Ll/b8d0;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-virtual {p0, v2}, Ll/b8d0;->l(Z)V

    .line 102
    .line 103
    .line 104
    :cond_5
    return-void
.end method


# virtual methods
.method public final h0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/gk3;->a(Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public i0(Ll/ner;Ll/dq1;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/ner;",
            "Ll/dq1<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->d:Ll/rpl;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ll/rpl;->b(Ll/ner;Ll/dq1;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/bhe0;->f()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFinishInflate()V
    .locals 5

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->h0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->v:Lv/VText;

    .line 8
    .line 9
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->h:Lv/VDraweeView;

    .line 15
    .line 16
    invoke-static {}, Ll/bhe0;->a()Ljava/lang/Integer;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->m:Lcom/tantan/library/svga/SVGAnimationView;

    .line 28
    .line 29
    const/16 v1, 0x8

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->d:Ll/rpl;

    .line 35
    .line 36
    if-nez v0, :cond_0

    .line 37
    .line 38
    invoke-static {p0}, Ll/zu80;->d(Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;)Ll/zu80;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Ll/zu80;->c()Ll/rpl;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->d:Ll/rpl;

    .line 47
    .line 48
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->d:Ll/rpl;

    .line 49
    .line 50
    invoke-interface {v0}, Ll/rpl;->a()V

    .line 51
    .line 52
    .line 53
    invoke-static {}, Ll/gra;->z()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_1

    .line 58
    .line 59
    sget v0, Ll/sj6;->R:I

    .line 60
    .line 61
    invoke-static {p0, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 62
    .line 63
    .line 64
    const/high16 v0, 0x428c0000    # 70.0f

    .line 65
    .line 66
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->h:Lv/VDraweeView;

    .line 71
    .line 72
    const/4 v2, 0x1

    .line 73
    new-array v3, v2, [Landroid/view/View;

    .line 74
    .line 75
    const/4 v4, 0x0

    .line 76
    aput-object v1, v3, v4

    .line 77
    .line 78
    invoke-static {v0, v3}, Ll/ue6;->v(I[Landroid/view/View;)V

    .line 79
    .line 80
    .line 81
    const/high16 v0, 0x42700000    # 60.0f

    .line 82
    .line 83
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->j:Landroid/widget/FrameLayout;

    .line 88
    .line 89
    new-array v2, v2, [Landroid/view/View;

    .line 90
    .line 91
    aput-object v1, v2, v4

    .line 92
    .line 93
    invoke-static {v0, v2}, Ll/ue6;->v(I[Landroid/view/View;)V

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->h:Lv/VDraweeView;

    .line 97
    .line 98
    sget v1, Ll/qa00;->f:I

    .line 99
    .line 100
    invoke-static {v0, v1}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 101
    .line 102
    .line 103
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->h:Lv/VDraweeView;

    .line 104
    .line 105
    invoke-static {v0, v1}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 106
    .line 107
    .line 108
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->v:Lv/VText;

    .line 109
    .line 110
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->A:Lv/VText;

    .line 111
    .line 112
    invoke-static {v0, v1}, Ll/ue6;->k0(Landroid/widget/TextView;Landroid/widget/TextView;)V

    .line 113
    .line 114
    .line 115
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->y:Lv/VText;

    .line 116
    .line 117
    invoke-static {v0}, Ll/ue6;->e0(Landroid/widget/TextView;)V

    .line 118
    .line 119
    .line 120
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->A:Lv/VText;

    .line 121
    .line 122
    sget v1, Ll/qa00;->m:I

    .line 123
    .line 124
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 125
    .line 126
    .line 127
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->u:Lv/VImage;

    .line 128
    .line 129
    const/high16 v1, 0x423c0000    # 47.0f

    .line 130
    .line 131
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 132
    .line 133
    .line 134
    move-result v2

    .line 135
    invoke-static {v0, v2}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 136
    .line 137
    .line 138
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->u:Lv/VImage;

    .line 139
    .line 140
    const/high16 v2, 0x42480000    # 50.0f

    .line 141
    .line 142
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 143
    .line 144
    .line 145
    move-result v2

    .line 146
    invoke-static {v0, v2}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 147
    .line 148
    .line 149
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->n:Lv/VFrame;

    .line 150
    .line 151
    const/high16 v2, 0x42180000    # 38.0f

    .line 152
    .line 153
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 154
    .line 155
    .line 156
    move-result v2

    .line 157
    invoke-static {v0, v2}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 158
    .line 159
    .line 160
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->n:Lv/VFrame;

    .line 161
    .line 162
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 163
    .line 164
    .line 165
    move-result v1

    .line 166
    invoke-static {v0, v1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 167
    .line 168
    .line 169
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->i:Landroid/widget/ImageView;

    .line 170
    .line 171
    sget v0, Ll/dbc0;->ug:I

    .line 172
    .line 173
    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 174
    .line 175
    .line 176
    :cond_1
    return-void
.end method

.method public setLookUpViewVisibility(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->e:Lcom/p1/mobile/putong/core/view/LookUpView;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->e:Lcom/p1/mobile/putong/core/view/LookUpView;

    .line 10
    .line 11
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    xor-int/2addr v0, p1

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->e:Lcom/p1/mobile/putong/core/view/LookUpView;

    .line 19
    .line 20
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method
