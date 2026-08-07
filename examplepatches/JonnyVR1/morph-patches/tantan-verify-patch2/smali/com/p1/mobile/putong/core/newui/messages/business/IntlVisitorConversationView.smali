.class public Lcom/p1/mobile/putong/core/newui/messages/business/IntlVisitorConversationView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lv/VDraweeView;

.field public e:Lv/VText_AutoFit;

.field public f:Landroid/view/ViewStub;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Lcom/p1/mobile/putong/core/view/IntlVisitorLookUpView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/messages/business/IntlVisitorConversationView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 6
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/newui/messages/business/IntlVisitorConversationView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 7
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/core/newui/messages/business/IntlVisitorConversationView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/business/IntlVisitorConversationView;->k0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/core/newui/messages/business/IntlVisitorConversationView;Lcom/p1/mobile/putong/core/data/VisitorDoorInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/business/IntlVisitorConversationView;->l0(Lcom/p1/mobile/putong/core/data/VisitorDoorInfo;)V

    return-void
.end method


# virtual methods
.method public final j0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/eop;->a(Lcom/p1/mobile/putong/core/newui/messages/business/IntlVisitorConversationView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic k0(Landroid/view/View;)V
    .locals 3

    .line 1
    const-string p1, "secondary_page_type"

    .line 2
    .line 3
    const-string v0, "visitor"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    filled-new-array {p1}, [Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const-string v1, "e_intl_message_meet_entrance"

    .line 14
    .line 15
    const-string v2, "p_messages_view"

    .line 16
    .line 17
    invoke-static {v1, v2, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const-string v1, ""

    .line 29
    .line 30
    invoke-static {p0, v1, v0}, Lcom/p1/mobile/putong/core/newui/intlmeet/IntlMeetAct;->Z1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final l0(Lcom/p1/mobile/putong/core/data/VisitorDoorInfo;)V
    .locals 5

    .line 1
    if-eqz p1, :cond_6

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/VisitorDoorInfo;->userID:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto/16 :goto_2

    .line 12
    .line 13
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 16
    .line 17
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/VisitorDoorInfo;->userID:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/VisitorDoorInfo;->title:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-nez v1, :cond_1

    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/business/IntlVisitorConversationView;->g:Lv/VText;

    .line 32
    .line 33
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/VisitorDoorInfo;->title:Ljava/lang/String;

    .line 34
    .line 35
    const-string v3, "#F86E65"

    .line 36
    .line 37
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    invoke-static {v2, v3}, Ll/xri0;->a(Ljava/lang/String;I)Landroid/text/SpannableStringBuilder;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 46
    .line 47
    .line 48
    :cond_1
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/VisitorDoorInfo;->describe:Ljava/lang/String;

    .line 49
    .line 50
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-nez v1, :cond_2

    .line 55
    .line 56
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/business/IntlVisitorConversationView;->h:Lv/VText;

    .line 57
    .line 58
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/VisitorDoorInfo;->describe:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/business/IntlVisitorConversationView;->e:Lv/VText_AutoFit;

    .line 64
    .line 65
    const/4 v2, 0x0

    .line 66
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 67
    .line 68
    .line 69
    iget v1, p1, Lcom/p1/mobile/putong/core/data/VisitorDoorInfo;->unReadCount:I

    .line 70
    .line 71
    const/4 v3, 0x1

    .line 72
    if-lez v1, :cond_4

    .line 73
    .line 74
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/business/IntlVisitorConversationView;->e:Lv/VText_AutoFit;

    .line 75
    .line 76
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 77
    .line 78
    .line 79
    iget p1, p1, Lcom/p1/mobile/putong/core/data/VisitorDoorInfo;->unReadCount:I

    .line 80
    .line 81
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/business/IntlVisitorConversationView;->e:Lv/VText_AutoFit;

    .line 82
    .line 83
    const/16 v4, 0x63

    .line 84
    .line 85
    if-gt p1, v4, :cond_3

    .line 86
    .line 87
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    invoke-static {v1, p1}, Ll/bnl0;->H0(Landroid/widget/TextView;Ljava/lang/String;)Z

    .line 92
    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_3
    const-string p1, "99+"

    .line 96
    .line 97
    invoke-static {v1, p1}, Ll/bnl0;->H0(Landroid/widget/TextView;Ljava/lang/String;)Z

    .line 98
    .line 99
    .line 100
    :cond_4
    :goto_0
    invoke-static {}, Ll/joa;->M3()Z

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    if-nez p1, :cond_5

    .line 105
    .line 106
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 107
    .line 108
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/business/IntlVisitorConversationView;->d:Lv/VDraweeView;

    .line 109
    .line 110
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/data/User;->picture(I)Lcom/p1/mobile/putong/data/Picture;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 115
    .line 116
    const/4 v2, 0x2

    .line 117
    const/16 v4, 0x14

    .line 118
    .line 119
    invoke-virtual {p1, v1, v0, v2, v4}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 120
    .line 121
    .line 122
    goto :goto_1

    .line 123
    :cond_5
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 124
    .line 125
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/business/IntlVisitorConversationView;->d:Lv/VDraweeView;

    .line 126
    .line 127
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/data/User;->picture(I)Lcom/p1/mobile/putong/data/Picture;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 132
    .line 133
    invoke-virtual {p1, v1, v0}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    :goto_1
    invoke-static {}, Ll/joa;->M3()Z

    .line 137
    .line 138
    .line 139
    move-result p1

    .line 140
    xor-int/2addr p1, v3

    .line 141
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/business/IntlVisitorConversationView;->setLookUpViewVisibility(Z)V

    .line 142
    .line 143
    .line 144
    new-instance p1, Ll/dop;

    .line 145
    .line 146
    invoke-direct {p1, p0}, Ll/dop;-><init>(Lcom/p1/mobile/putong/core/newui/messages/business/IntlVisitorConversationView;)V

    .line 147
    .line 148
    .line 149
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 150
    .line 151
    .line 152
    :cond_6
    :goto_2
    return-void
.end method

.method public m0(Ll/ner;Ll/dq1;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/ner;",
            "Ll/dq1<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;)V"
        }
    .end annotation

    return-void

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->n1:Lcom/p1/mobile/putong/core/api/m;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/m;->F3()Lcom/p1/mobile/putong/core/data/VisitorDoorInfo;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/messages/business/IntlVisitorConversationView;->l0(Lcom/p1/mobile/putong/core/data/VisitorDoorInfo;)V

    .line 10
    .line 11
    .line 12
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->n1:Lcom/p1/mobile/putong/core/api/m;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/m;->G3()Lrx/subjects/a;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p2, p1, v0}, Ll/dq1;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    new-instance p2, Ll/cop;

    .line 25
    .line 26
    invoke-direct {p2, p0}, Ll/cop;-><init>(Lcom/p1/mobile/putong/core/newui/messages/business/IntlVisitorConversationView;)V

    .line 27
    .line 28
    .line 29
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
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
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/messages/business/IntlVisitorConversationView;->j0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/business/IntlVisitorConversationView;->g:Lv/VText;

    .line 8
    .line 9
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/business/IntlVisitorConversationView;->f:Landroid/view/ViewStub;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/p1/mobile/putong/core/view/IntlVisitorLookUpView;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/business/IntlVisitorConversationView;->i:Lcom/p1/mobile/putong/core/view/IntlVisitorLookUpView;

    .line 23
    .line 24
    return-void
.end method

.method public setLookUpViewVisibility(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/business/IntlVisitorConversationView;->f:Landroid/view/ViewStub;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/business/IntlVisitorConversationView;->i:Lcom/p1/mobile/putong/core/view/IntlVisitorLookUpView;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/business/IntlVisitorConversationView;->i:Lcom/p1/mobile/putong/core/view/IntlVisitorLookUpView;

    .line 19
    .line 20
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method
