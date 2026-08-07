.class public Ll/t05;
.super Ll/pej0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/t05$b;
    }
.end annotation


# instance fields
.field public f:Lv/VLinear;

.field public g:Lv/VImage;

.field public h:Lv/VDraweeView;

.field public i:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public j:Lv/VText;

.field public k:Lv/VLinear;

.field public l:Lv/VDraweeView;

.field public m:Lv/VDraweeView;

.field public n:Lv/VText;

.field public o:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public p:Lv/VRecyclerView;

.field public q:Landroid/view/View;

.field public r:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public s:Lcom/p1/mobile/android/app/Act;

.field public t:Ll/l4g0;

.field public u:Lcom/p1/mobile/putong/core/data/ChatPartnerText;

.field public v:Lcom/p1/mobile/putong/core/data/ChatPartners;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/ChatPartners;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget v0, Ll/agc0;->c:I

    .line 2
    .line 3
    invoke-direct {p0, p1, v0}, Ll/pej0;-><init>(Landroid/content/Context;I)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Ll/t05;->s:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    iput-object p2, p0, Ll/t05;->v:Lcom/p1/mobile/putong/core/data/ChatPartners;

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCancelable(Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic A(Ll/t05;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/t05;->L(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic C(Landroid/content/DialogInterface;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/hlh0;->a()Ll/hlh0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x1

    .line 6
    const-string v1, "ChatPartnerHalfDialogViewModel"

    .line 7
    .line 8
    invoke-virtual {p0, v0, v1}, Ll/hlh0;->j(ZLjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic D(Ll/t05;)Lcom/p1/mobile/putong/core/data/ChatPartnerText;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t05;->u:Lcom/p1/mobile/putong/core/data/ChatPartnerText;

    return-object p0
.end method

.method public static bridge synthetic E(Ll/t05;Lcom/p1/mobile/putong/core/data/ChatPartnerText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/t05;->u:Lcom/p1/mobile/putong/core/data/ChatPartnerText;

    return-void
.end method

.method private G()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/t05;->f:Lv/VLinear;

    .line 6
    .line 7
    new-instance v2, Ll/o05;

    .line 8
    .line 9
    invoke-direct {v2, p0}, Ll/o05;-><init>(Ll/t05;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1, v2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->getBehavior()Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const/4 v2, 0x3

    .line 20
    invoke-virtual {v1, v2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 21
    .line 22
    .line 23
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    const/4 v1, -0x1

    .line 30
    invoke-virtual {v0, v1, v1}, Landroid/view/Window;->setLayout(II)V

    .line 31
    .line 32
    .line 33
    const v1, 0x3e99999a    # 0.3f

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/view/Window;->setDimAmount(F)V

    .line 37
    .line 38
    .line 39
    const v1, 0x1020002

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    sget v1, Ll/odc0;->p:I

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    check-cast v0, Landroid/widget/FrameLayout;

    .line 53
    .line 54
    sget v1, Ll/tbc0;->a0:I

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 57
    .line 58
    .line 59
    invoke-static {v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    new-instance v1, Ll/t05$a;

    .line 64
    .line 65
    invoke-direct {v1, p0, v0}, Ll/t05$a;-><init>(Ll/t05;Lcom/google/android/material/bottomsheet/BottomSheetBehavior;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setBottomSheetCallback(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;)V

    .line 69
    .line 70
    .line 71
    :cond_0
    return-void
.end method

.method private synthetic I()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->getBehavior()Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Ll/t05;->f:Lv/VLinear;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-virtual {v0, p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setPeekHeight(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private synthetic J(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_close_chatting_partner_signal_pop"

    .line 2
    .line 3
    const-string v0, "p_chatting_partner_signal_pop"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private synthetic K(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/t05;->u:Lcom/p1/mobile/putong/core/data/ChatPartnerText;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/t05;->u:Lcom/p1/mobile/putong/core/data/ChatPartnerText;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ChatPartnerText;->value:Ljava/lang/String;

    .line 12
    .line 13
    const-string v0, "word_content"

    .line 14
    .line 15
    invoke-static {v0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    filled-new-array {p1}, [Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const-string v0, "e_sent_chatting_partner_signal"

    .line 24
    .line 25
    const-string v1, "p_chatting_partner_signal_pop"

    .line 26
    .line 27
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Ll/t05;->s:Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    iget-object v0, p0, Ll/t05;->v:Lcom/p1/mobile/putong/core/data/ChatPartners;

    .line 33
    .line 34
    iget-object v1, p0, Ll/t05;->u:Lcom/p1/mobile/putong/core/data/ChatPartnerText;

    .line 35
    .line 36
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ChatPartnerText;->id:Ljava/lang/String;

    .line 37
    .line 38
    const-string v2, "pop1"

    .line 39
    .line 40
    invoke-static {p1, v0, v1, v2}, Lcom/p1/mobile/putong/core/newui/partner/ChatPartnerSelectFriendAct;->a2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/ChatPartners;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iget-object v0, p0, Ll/t05;->s:Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    invoke-virtual {v0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 47
    .line 48
    .line 49
    :cond_0
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method private synthetic L(Landroid/content/DialogInterface;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/t05;->t:Ll/l4g0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/hlh0;->a()Ll/hlh0;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const/4 p1, 0x0

    .line 11
    const-string v0, "ChatPartnerHalfDialogViewModel"

    .line 12
    .line 13
    invoke-virtual {p0, p1, v0}, Ll/hlh0;->j(ZLjava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic x(Ll/t05;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/t05;->J(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic y(Ll/t05;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/t05;->K(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic z(Ll/t05;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/t05;->I()V

    return-void
.end method


# virtual methods
.method public F(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/v05;->b(Ll/t05;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public H()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/t05;->s:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p0, v0, v1}, Ll/t05;->F(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0, v0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(Landroid/view/View;)V

    .line 13
    .line 14
    .line 15
    new-instance v0, Ll/zyf0;

    .line 16
    .line 17
    invoke-direct {v0}, Ll/zyf0;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/pej0;->v(Ll/pej0$a;)V

    .line 21
    .line 22
    .line 23
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 24
    .line 25
    iget-object v1, p0, Ll/t05;->l:Lv/VDraweeView;

    .line 26
    .line 27
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 30
    .line 31
    invoke-virtual {v2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Gc()Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    if-nez v0, :cond_0

    .line 59
    .line 60
    iget-object v0, p0, Ll/t05;->m:Lv/VDraweeView;

    .line 61
    .line 62
    sget v1, Ll/dbc0;->o5:I

    .line 63
    .line 64
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 65
    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_0
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 69
    .line 70
    iget-object v1, p0, Ll/t05;->m:Lv/VDraweeView;

    .line 71
    .line 72
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    invoke-interface {v2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Gc()Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    iget-object v2, v2, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 81
    .line 82
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Emotion;->emojiUrl:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    :goto_0
    iget-object v0, p0, Ll/t05;->v:Lcom/p1/mobile/putong/core/data/ChatPartners;

    .line 88
    .line 89
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ChatPartners;->texts:Ljava/util/List;

    .line 90
    .line 91
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    if-nez v1, :cond_1

    .line 96
    .line 97
    const/4 v1, 0x0

    .line 98
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    check-cast v2, Lcom/p1/mobile/putong/core/data/ChatPartnerText;

    .line 103
    .line 104
    iput-object v2, p0, Ll/t05;->u:Lcom/p1/mobile/putong/core/data/ChatPartnerText;

    .line 105
    .line 106
    iget-object v3, p0, Ll/t05;->n:Lv/VText;

    .line 107
    .line 108
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/ChatPartnerText;->value:Ljava/lang/String;

    .line 109
    .line 110
    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 111
    .line 112
    .line 113
    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    iget-object v1, p0, Ll/t05;->p:Lv/VRecyclerView;

    .line 117
    .line 118
    new-instance v2, Ll/t05$b;

    .line 119
    .line 120
    invoke-direct {v2, p0, v0}, Ll/t05$b;-><init>(Ll/t05;Ljava/util/List;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 124
    .line 125
    .line 126
    :cond_1
    iget-object v0, p0, Ll/t05;->g:Lv/VImage;

    .line 127
    .line 128
    new-instance v1, Ll/r05;

    .line 129
    .line 130
    invoke-direct {v1, p0}, Ll/r05;-><init>(Ll/t05;)V

    .line 131
    .line 132
    .line 133
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 134
    .line 135
    .line 136
    iget-object v0, p0, Ll/t05;->r:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 137
    .line 138
    new-instance v1, Ll/s05;

    .line 139
    .line 140
    invoke-direct {v1, p0}, Ll/s05;-><init>(Ll/t05;)V

    .line 141
    .line 142
    .line 143
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 144
    .line 145
    .line 146
    iget-object v0, p0, Ll/t05;->u:Lcom/p1/mobile/putong/core/data/ChatPartnerText;

    .line 147
    .line 148
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    move-result v0

    .line 152
    if-eqz v0, :cond_2

    .line 153
    .line 154
    iget-object p0, p0, Ll/t05;->u:Lcom/p1/mobile/putong/core/data/ChatPartnerText;

    .line 155
    .line 156
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ChatPartnerText;->value:Ljava/lang/String;

    .line 157
    .line 158
    const-string v0, "word_content"

    .line 159
    .line 160
    invoke-static {v0, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 161
    .line 162
    .line 163
    move-result-object p0

    .line 164
    filled-new-array {p0}, [Ll/pf60;

    .line 165
    .line 166
    .line 167
    move-result-object p0

    .line 168
    const-string v0, "e_preset_word"

    .line 169
    .line 170
    const-string v1, "p_chatting_partner_signal_pop"

    .line 171
    .line 172
    invoke-static {v0, v1, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 173
    .line 174
    .line 175
    :cond_2
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/t05;->H()V

    .line 5
    .line 6
    .line 7
    const-class p1, Lcom/p1/mobile/android/app/Dialog;

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const-string v0, "p_chatting_partner_signal_pop"

    .line 14
    .line 15
    invoke-static {v0, p1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, p0, Ll/t05;->t:Ll/l4g0;

    .line 20
    .line 21
    invoke-static {p1}, Ll/w1e;->f(Ll/l4g0;)V

    .line 22
    .line 23
    .line 24
    new-instance p1, Ll/p05;

    .line 25
    .line 26
    invoke-direct {p1, p0}, Ll/p05;-><init>(Ll/t05;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 30
    .line 31
    .line 32
    new-instance p1, Ll/q05;

    .line 33
    .line 34
    invoke-direct {p1}, Ll/q05;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public show()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->show()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/t05;->G()V

    .line 5
    .line 6
    .line 7
    return-void
.end method
