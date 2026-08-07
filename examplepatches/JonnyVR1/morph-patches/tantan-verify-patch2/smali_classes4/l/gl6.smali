.class public Ll/gl6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/zk6;",
        ">;",
        "Landroid/animation/ValueAnimator$AnimatorUpdateListener;"
    }
.end annotation


# instance fields
.field public a:Landroid/widget/FrameLayout;

.field public b:Lv/VRecyclerView;

.field public c:Landroid/widget/LinearLayout;

.field public d:Lv/VText;

.field public e:Landroid/widget/LinearLayout;

.field public f:Landroid/widget/FrameLayout;

.field public g:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

.field public h:Lv/VImage;

.field public i:Lv/VImage;

.field public j:Lv/VText;

.field public k:Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;

.field public l:Landroid/animation/ValueAnimator;

.field public m:Ll/zk6;

.field public n:Ll/tk6;

.field public o:Z

.field public p:I

.field public final q:I

.field public final r:Ll/tk6$a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/gl6;->o:Z

    .line 6
    .line 7
    iput v0, p0, Ll/gl6;->p:I

    .line 8
    .line 9
    const/4 v0, 0x3

    .line 10
    iput v0, p0, Ll/gl6;->q:I

    .line 11
    .line 12
    new-instance v0, Ll/gl6$a;

    .line 13
    .line 14
    invoke-direct {v0, p0}, Ll/gl6$a;-><init>(Ll/gl6;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/gl6;->r:Ll/tk6$a;

    .line 18
    .line 19
    iput-object p1, p0, Ll/gl6;->k:Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;

    .line 20
    .line 21
    return-void
.end method

.method public static synthetic a(Ll/gl6;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/gl6;->s(Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    return-void
.end method

.method public static synthetic b(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    const/4 p0, 0x6

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    const/4 p0, 0x1

    .line 5
    return p0

    .line 6
    :cond_0
    const/4 p0, 0x0

    .line 7
    return p0
.end method

.method public static synthetic c(Ll/gl6;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/gl6;->n()V

    return-void
.end method

.method public static synthetic d(Ll/gl6;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/gl6;->p(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ll/gl6;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/gl6;->u()V

    return-void
.end method

.method public static synthetic f(Ll/gl6;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/gl6;->q(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic i(Ll/gl6;)Ll/zk6;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gl6;->m:Ll/zk6;

    return-object p0
.end method

.method private synthetic p(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_canncel_search"

    .line 2
    .line 3
    const-string v0, "p_chat_search"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/gl6;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget-object v0, p0, Ll/gl6;->g:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Ll/gl6;->g:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/view/View;->clearFocus()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/gl6;->m()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method private synthetic q(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/gl6;->g:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/gl6;->i:Lv/VImage;

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/gl6;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gl6;->k:Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public h(II)V
    .locals 1

    .line 1
    if-lez p1, :cond_0

    .line 2
    .line 3
    const/4 p2, 0x1

    .line 4
    iput-boolean p2, p0, Ll/gl6;->o:Z

    .line 5
    .line 6
    :cond_0
    iget-object p0, p0, Ll/gl6;->b:Lv/VRecyclerView;

    .line 7
    .line 8
    const/high16 p2, 0x41400000    # 12.0f

    .line 9
    .line 10
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-virtual {p0, v0, p2, v0, p1}, Landroid/view/View;->setPadding(IIII)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/zk6;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/gl6;->k(Ll/zk6;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/gl6;->j(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/hl6;->b(Ll/gl6;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public k(Ll/zk6;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/gl6;->m:Ll/zk6;

    .line 2
    .line 3
    return-void
.end method

.method public final l()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/gl6;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/el6;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/el6;-><init>(Ll/gl6;)V

    .line 8
    .line 9
    .line 10
    const-wide/16 v2, 0x96

    .line 11
    .line 12
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public m()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/gl6;->o:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/gl6;->l:Landroid/animation/ValueAnimator;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const/4 v0, 0x0

    .line 16
    invoke-virtual {p0, v0}, Ll/gl6;->z(Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic n()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/gl6;->o:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Ll/gl6;->p:I

    .line 6
    .line 7
    const/4 v1, 0x3

    .line 8
    if-ge v0, v1, :cond_0

    .line 9
    .line 10
    add-int/lit8 v0, v0, 0x1

    .line 11
    .line 12
    iput v0, p0, Ll/gl6;->p:I

    .line 13
    .line 14
    iget-object v0, p0, Ll/gl6;->g:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ll/gl6;->act()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v1, p0, Ll/gl6;->g:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 24
    .line 25
    const/4 v2, 0x0

    .line 26
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Ll/gl6;->l()V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-virtual {p0, p1}, Ll/gl6;->y(F)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public r()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/gl6;->k:Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Nm:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/gl6;->m:Ll/zk6;

    .line 10
    .line 11
    iget v1, v1, Ll/zk6;->e:I

    .line 12
    .line 13
    sget v2, Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;->o:I

    .line 14
    .line 15
    if-ne v1, v2, :cond_1

    .line 16
    .line 17
    invoke-static {}, Ll/pkb;->q0()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    const-string v0, "\u8f93\u5165\u6635\u79f0/\u804a\u5929\u5185\u5bb9/ID\u641c\u7d22"

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget-object v0, p0, Ll/gl6;->k:Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;

    .line 27
    .line 28
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Pm:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    goto :goto_0

    .line 35
    :cond_1
    sget v2, Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;->n:I

    .line 36
    .line 37
    if-ne v1, v2, :cond_2

    .line 38
    .line 39
    iget-object v0, p0, Ll/gl6;->k:Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;

    .line 40
    .line 41
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Mm:I

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    :cond_2
    :goto_0
    iget-object v1, p0, Ll/gl6;->d:Lv/VText;

    .line 48
    .line 49
    iget-object v2, p0, Ll/gl6;->k:Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;

    .line 50
    .line 51
    sget v3, Lcom/p1/mobile/putong/core/R$string;->Om:I

    .line 52
    .line 53
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 58
    .line 59
    .line 60
    iget-object v1, p0, Ll/gl6;->g:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 61
    .line 62
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->setSpaceHint(Ljava/lang/CharSequence;)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Ll/gl6;->j:Lv/VText;

    .line 66
    .line 67
    new-instance v1, Ll/bl6;

    .line 68
    .line 69
    invoke-direct {v1, p0}, Ll/bl6;-><init>(Ll/gl6;)V

    .line 70
    .line 71
    .line 72
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 73
    .line 74
    .line 75
    invoke-static {}, Ll/gra;->z()Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-eqz v0, :cond_3

    .line 80
    .line 81
    iget-object v0, p0, Ll/gl6;->j:Lv/VText;

    .line 82
    .line 83
    const-string v1, "#66000000"

    .line 84
    .line 85
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 90
    .line 91
    .line 92
    :cond_3
    iget-object v0, p0, Ll/gl6;->i:Lv/VImage;

    .line 93
    .line 94
    new-instance v1, Ll/cl6;

    .line 95
    .line 96
    invoke-direct {v1, p0}, Ll/cl6;-><init>(Ll/gl6;)V

    .line 97
    .line 98
    .line 99
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 100
    .line 101
    .line 102
    new-instance v0, Ll/tk6;

    .line 103
    .line 104
    iget-object v1, p0, Ll/gl6;->k:Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;

    .line 105
    .line 106
    iget-object v2, p0, Ll/gl6;->m:Ll/zk6;

    .line 107
    .line 108
    iget v3, v2, Ll/zk6;->e:I

    .line 109
    .line 110
    iget-boolean v2, v2, Ll/zk6;->g:Z

    .line 111
    .line 112
    iget-object v4, p0, Ll/gl6;->r:Ll/tk6$a;

    .line 113
    .line 114
    invoke-direct {v0, v1, v3, v2, v4}, Ll/tk6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;IZLl/tk6$a;)V

    .line 115
    .line 116
    .line 117
    iput-object v0, p0, Ll/gl6;->n:Ll/tk6;

    .line 118
    .line 119
    iget-object v0, p0, Ll/gl6;->b:Lv/VRecyclerView;

    .line 120
    .line 121
    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 122
    .line 123
    invoke-virtual {p0}, Ll/gl6;->act()Lcom/p1/mobile/android/app/Act;

    .line 124
    .line 125
    .line 126
    move-result-object v2

    .line 127
    invoke-direct {v1, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 128
    .line 129
    .line 130
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 131
    .line 132
    .line 133
    iget-object v0, p0, Ll/gl6;->b:Lv/VRecyclerView;

    .line 134
    .line 135
    iget-object v1, p0, Ll/gl6;->n:Ll/tk6;

    .line 136
    .line 137
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 138
    .line 139
    .line 140
    iget-object v0, p0, Ll/gl6;->k:Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;

    .line 141
    .line 142
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    if-eqz v0, :cond_4

    .line 151
    .line 152
    iget-object v0, p0, Ll/gl6;->k:Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;

    .line 153
    .line 154
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    sget-object v1, Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;->h:Ljava/lang/String;

    .line 159
    .line 160
    invoke-virtual {v0, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    .line 161
    .line 162
    .line 163
    move-result v0

    .line 164
    if-eqz v0, :cond_4

    .line 165
    .line 166
    iget-object v0, p0, Ll/gl6;->k:Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;

    .line 167
    .line 168
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    sget-object v1, Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;->h:Ljava/lang/String;

    .line 173
    .line 174
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 179
    .line 180
    .line 181
    move-result v1

    .line 182
    if-nez v1, :cond_4

    .line 183
    .line 184
    iget-object v1, p0, Ll/gl6;->g:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 185
    .line 186
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 187
    .line 188
    .line 189
    iget-object v1, p0, Ll/gl6;->m:Ll/zk6;

    .line 190
    .line 191
    invoke-virtual {v1, v0}, Ll/zk6;->t0(Ljava/lang/String;)V

    .line 192
    .line 193
    .line 194
    :cond_4
    iget-object v0, p0, Ll/gl6;->g:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 195
    .line 196
    new-instance v1, Ll/gl6$b;

    .line 197
    .line 198
    invoke-direct {v1, p0}, Ll/gl6$b;-><init>(Ll/gl6;)V

    .line 199
    .line 200
    .line 201
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 202
    .line 203
    .line 204
    iget-object v0, p0, Ll/gl6;->g:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 205
    .line 206
    new-instance v1, Ll/dl6;

    .line 207
    .line 208
    invoke-direct {v1}, Ll/dl6;-><init>()V

    .line 209
    .line 210
    .line 211
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 212
    .line 213
    .line 214
    iget-object v0, p0, Ll/gl6;->a:Landroid/widget/FrameLayout;

    .line 215
    .line 216
    const/high16 v1, 0x42400000    # 48.0f

    .line 217
    .line 218
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 219
    .line 220
    .line 221
    move-result v1

    .line 222
    invoke-static {}, Ll/bnl0;->F0()I

    .line 223
    .line 224
    .line 225
    move-result v2

    .line 226
    add-int/2addr v1, v2

    .line 227
    const/4 v2, 0x0

    .line 228
    invoke-virtual {v0, v2, v1, v2, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 229
    .line 230
    .line 231
    iget-object v0, p0, Ll/gl6;->e:Landroid/widget/LinearLayout;

    .line 232
    .line 233
    const/high16 v1, 0x42300000    # 44.0f

    .line 234
    .line 235
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 236
    .line 237
    .line 238
    move-result v1

    .line 239
    invoke-static {}, Ll/bnl0;->F0()I

    .line 240
    .line 241
    .line 242
    move-result v3

    .line 243
    add-int/2addr v1, v3

    .line 244
    invoke-static {v0, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 245
    .line 246
    .line 247
    iget-object p0, p0, Ll/gl6;->e:Landroid/widget/LinearLayout;

    .line 248
    .line 249
    sget v0, Ll/qa00;->j:I

    .line 250
    .line 251
    invoke-static {}, Ll/bnl0;->F0()I

    .line 252
    .line 253
    .line 254
    move-result v1

    .line 255
    invoke-virtual {p0, v0, v1, v0, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 256
    .line 257
    .line 258
    return-void
.end method

.method public final synthetic s(Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gl6;->n:Ll/tk6;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/tk6;->L(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/gl6;->n:Ll/tk6;

    .line 7
    .line 8
    invoke-virtual {p0, p2, p3, p4, p5}, Ll/tk6;->K(Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic u()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/gl6;->g:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/gl6;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object v1, p0, Ll/gl6;->g:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/gl6;->l()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public v(Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/lang/String;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/gl6;->k:Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;

    .line 2
    .line 3
    new-instance v1, Ll/fl6;

    .line 4
    .line 5
    move-object v2, p0

    .line 6
    move-object v4, p1

    .line 7
    move-object v5, p2

    .line 8
    move-object v6, p3

    .line 9
    move-object v7, p4

    .line 10
    move-object v3, p5

    .line 11
    invoke-direct/range {v1 .. v7}, Ll/fl6;-><init>(Ll/gl6;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public w(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gl6;->b:Lv/VRecyclerView;

    .line 2
    .line 3
    xor-int/lit8 v1, p1, 0x1

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Ll/gl6;->c:Landroid/widget/LinearLayout;

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public x(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gl6;->c:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/gl6;->b:Lv/VRecyclerView;

    .line 7
    .line 8
    xor-int/lit8 p1, p1, 0x1

    .line 9
    .line 10
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public y(F)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/gl6;->k:Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Ll/gl6;->k:Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget-object v2, Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;->f:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v0, v2}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    iget-object v0, p0, Ll/gl6;->k:Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;

    .line 29
    .line 30
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    sget-object v2, Lcom/p1/mobile/putong/core/newui/messages/search/ConversationSearchAct;->f:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    :cond_0
    iget-object v0, p0, Ll/gl6;->a:Landroid/widget/FrameLayout;

    .line 41
    .line 42
    invoke-virtual {v0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/gl6;->e:Landroid/widget/LinearLayout;

    .line 46
    .line 47
    invoke-virtual {v0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 48
    .line 49
    .line 50
    const/high16 v0, 0x41200000    # 10.0f

    .line 51
    .line 52
    mul-float/2addr v0, p1

    .line 53
    const/high16 v2, 0x3f800000    # 1.0f

    .line 54
    .line 55
    invoke-static {v2, v0}, Ljava/lang/Math;->min(FF)F

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    const/4 v3, 0x0

    .line 60
    invoke-static {v3, v0}, Ljava/lang/Math;->max(FF)F

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    iget-object v3, p0, Ll/gl6;->f:Landroid/widget/FrameLayout;

    .line 65
    .line 66
    invoke-virtual {v3, v0}, Landroid/view/View;->setAlpha(F)V

    .line 67
    .line 68
    .line 69
    iget-object p0, p0, Ll/gl6;->e:Landroid/widget/LinearLayout;

    .line 70
    .line 71
    invoke-static {}, Ll/bnl0;->y0()I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    const/high16 v3, 0x42560000    # 53.5f

    .line 76
    .line 77
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 78
    .line 79
    .line 80
    move-result v3

    .line 81
    sub-int/2addr v0, v3

    .line 82
    sub-int/2addr v0, v1

    .line 83
    int-to-float v0, v0

    .line 84
    sub-float/2addr v2, p1

    .line 85
    mul-float/2addr v0, v2

    .line 86
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public z(Z)V
    .locals 4

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    move v2, v1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    move v2, v0

    .line 9
    :goto_0
    if-eqz p1, :cond_1

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_1
    move v0, v1

    .line 13
    :goto_1
    iget-object v1, p0, Ll/gl6;->l:Landroid/animation/ValueAnimator;

    .line 14
    .line 15
    if-eqz v1, :cond_2

    .line 16
    .line 17
    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_2

    .line 22
    .line 23
    iget-object v1, p0, Ll/gl6;->l:Landroid/animation/ValueAnimator;

    .line 24
    .line 25
    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Ljava/lang/Float;

    .line 30
    .line 31
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    iget-object v1, p0, Ll/gl6;->l:Landroid/animation/ValueAnimator;

    .line 36
    .line 37
    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->cancel()V

    .line 38
    .line 39
    .line 40
    :cond_2
    const/4 v1, 0x2

    .line 41
    new-array v1, v1, [F

    .line 42
    .line 43
    const/4 v3, 0x0

    .line 44
    aput v2, v1, v3

    .line 45
    .line 46
    const/4 v2, 0x1

    .line 47
    aput v0, v1, v2

    .line 48
    .line 49
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iput-object v0, p0, Ll/gl6;->l:Landroid/animation/ValueAnimator;

    .line 54
    .line 55
    new-instance v1, Landroid/view/animation/DecelerateInterpolator;

    .line 56
    .line 57
    invoke-direct {v1}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Ll/gl6;->l:Landroid/animation/ValueAnimator;

    .line 64
    .line 65
    const-wide/16 v1, 0x15e

    .line 66
    .line 67
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Ll/gl6;->l:Landroid/animation/ValueAnimator;

    .line 71
    .line 72
    invoke-virtual {v0, p0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Ll/gl6;->l:Landroid/animation/ValueAnimator;

    .line 76
    .line 77
    new-instance v1, Ll/gl6$c;

    .line 78
    .line 79
    invoke-direct {v1, p0, p1}, Ll/gl6$c;-><init>(Ll/gl6;Z)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Ll/gl6;->l:Landroid/animation/ValueAnimator;

    .line 86
    .line 87
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 88
    .line 89
    .line 90
    if-eqz p1, :cond_3

    .line 91
    .line 92
    invoke-virtual {p0}, Ll/gl6;->act()Lcom/p1/mobile/android/app/Act;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    new-instance v0, Ll/al6;

    .line 97
    .line 98
    invoke-direct {v0, p0}, Ll/al6;-><init>(Ll/gl6;)V

    .line 99
    .line 100
    .line 101
    const-wide/16 v1, 0x64

    .line 102
    .line 103
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 104
    .line 105
    .line 106
    :cond_3
    return-void
.end method
