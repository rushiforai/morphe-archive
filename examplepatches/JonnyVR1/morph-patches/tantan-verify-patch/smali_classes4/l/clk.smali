.class public Ll/clk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/mlk;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/widget/FrameLayout;

.field public b:Landroid/widget/RelativeLayout;

.field public c:Lv/VImage;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Landroid/widget/LinearLayout;

.field public g:Landroid/widget/FrameLayout;

.field public h:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

.field public i:Lv/VImage;

.field public j:Lv/VImage;

.field public k:Lv/VText;

.field public l:Landroid/widget/RelativeLayout;

.field public m:Lv/VText;

.field public n:Lcom/p1/mobile/putong/core/newui/group/GroupSuggestLayout;

.field public o:Lv/VRecyclerView;

.field public p:Ll/kcg0;

.field public q:Ll/mlk;

.field public r:Lcom/p1/mobile/putong/core/newui/group/GroupSearchAct;

.field public s:Ll/pkk;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/group/GroupSearchAct;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/clk;->r:Lcom/p1/mobile/putong/core/newui/group/GroupSearchAct;

    .line 5
    .line 6
    new-instance v0, Ll/pkk;

    .line 7
    .line 8
    invoke-direct {v0, p1}, Ll/pkk;-><init>(Lcom/p1/mobile/putong/core/newui/group/GroupSearchAct;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/clk;->s:Ll/pkk;

    .line 12
    .line 13
    return-void
.end method

.method private synthetic A(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    const/4 p1, 0x3

    .line 2
    if-ne p2, p1, :cond_0

    .line 3
    .line 4
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iget-object p0, p0, Ll/clk;->h:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 9
    .line 10
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 11
    .line 12
    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method private synthetic B()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/clk;->h:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static I(Landroid/widget/EditText;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/EditText;",
            ")",
            "Lrx/c<",
            "Ljava/lang/CharSequence;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/alk;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/alk;-><init>(Landroid/widget/EditText;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-static {}, Ll/psd0;->R()Lrx/c$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public static synthetic a(Ll/clk;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/clk;->y(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic c(Landroid/widget/EditText;Landroid/text/TextWatcher;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Ll/clk;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/clk;->w(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ll/clk;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/clk;->v(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Ll/clk;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/clk;->x(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i(Ll/clk;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/clk;->z(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public static synthetic j(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatGroup;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic k(Ll/clk;Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/clk;->A(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic l(Landroid/widget/EditText;Ll/gcg0;)V
    .locals 2

    .line 1
    new-instance v0, Ll/clk$c;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/clk$c;-><init>(Ll/gcg0;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ll/skk;

    .line 10
    .line 11
    invoke-direct {v1, p0, v0}, Ll/skk;-><init>(Landroid/widget/EditText;Landroid/text/TextWatcher;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v1}, Ll/pcg0;->a(Ll/x20;)Ll/kcg0;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p1, p0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic m(Ll/clk;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/clk;->C(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic n(Ll/clk;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/clk;->B()V

    return-void
.end method

.method public static bridge synthetic p(Ll/clk;)Lcom/p1/mobile/putong/core/newui/group/GroupSearchAct;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/clk;->r:Lcom/p1/mobile/putong/core/newui/group/GroupSearchAct;

    return-object p0
.end method

.method public static bridge synthetic q(Ll/clk;)Ll/pkk;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/clk;->s:Ll/pkk;

    return-object p0
.end method

.method private r()V
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/r97;->E()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-static {}, Ll/pkb;->q0()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iget-object v1, p0, Ll/clk;->h:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    const-string v0, "\u8f93\u5165\u5173\u952e\u8bcd/\u7fa4\u53f7\u8fdb\u884c\u641c\u7d22"

    .line 24
    .line 25
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    iget-object v0, p0, Ll/clk;->r:Lcom/p1/mobile/putong/core/newui/group/GroupSearchAct;

    .line 30
    .line 31
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->A0:I

    .line 32
    .line 33
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 38
    .line 39
    .line 40
    :cond_1
    :goto_0
    iget-object v0, p0, Ll/clk;->k:Lv/VText;

    .line 41
    .line 42
    new-instance v1, Ll/qkk;

    .line 43
    .line 44
    invoke-direct {v1, p0}, Ll/qkk;-><init>(Ll/clk;)V

    .line 45
    .line 46
    .line 47
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Ll/clk;->j:Lv/VImage;

    .line 51
    .line 52
    new-instance v1, Ll/tkk;

    .line 53
    .line 54
    invoke-direct {v1, p0}, Ll/tkk;-><init>(Ll/clk;)V

    .line 55
    .line 56
    .line 57
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Ll/clk;->a:Landroid/widget/FrameLayout;

    .line 61
    .line 62
    new-instance v1, Ll/ukk;

    .line 63
    .line 64
    invoke-direct {v1, p0}, Ll/ukk;-><init>(Ll/clk;)V

    .line 65
    .line 66
    .line 67
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Ll/clk;->e:Lv/VText;

    .line 71
    .line 72
    new-instance v1, Ll/vkk;

    .line 73
    .line 74
    invoke-direct {v1, p0}, Ll/vkk;-><init>(Ll/clk;)V

    .line 75
    .line 76
    .line 77
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Ll/clk;->o:Lv/VRecyclerView;

    .line 81
    .line 82
    new-instance v1, Ll/clk$a;

    .line 83
    .line 84
    invoke-direct {v1, p0}, Ll/clk$a;-><init>(Ll/clk;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 88
    .line 89
    .line 90
    iget-object v0, p0, Ll/clk;->o:Lv/VRecyclerView;

    .line 91
    .line 92
    iget-object v1, p0, Ll/clk;->s:Ll/pkk;

    .line 93
    .line 94
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Ll/clk;->o:Lv/VRecyclerView;

    .line 98
    .line 99
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getItemAnimator()Landroidx/recyclerview/widget/RecyclerView$l;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    check-cast v0, Landroidx/recyclerview/widget/v;

    .line 104
    .line 105
    const/4 v1, 0x0

    .line 106
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/v;->setSupportsChangeAnimations(Z)V

    .line 107
    .line 108
    .line 109
    iget-object v0, p0, Ll/clk;->o:Lv/VRecyclerView;

    .line 110
    .line 111
    new-instance v1, Ll/clk$b;

    .line 112
    .line 113
    invoke-direct {v1, p0}, Ll/clk$b;-><init>(Ll/clk;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 117
    .line 118
    .line 119
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    iget-object v1, p0, Ll/clk;->h:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 124
    .line 125
    invoke-static {v1}, Ll/clk;->I(Landroid/widget/EditText;)Lrx/c;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    const-wide/16 v1, 0x1f4

    .line 134
    .line 135
    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 136
    .line 137
    invoke-virtual {v0, v1, v2, v3}, Lrx/c;->throttleLast(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    new-instance v1, Ll/wkk;

    .line 150
    .line 151
    invoke-direct {v1, p0}, Ll/wkk;-><init>(Ll/clk;)V

    .line 152
    .line 153
    .line 154
    new-instance v2, Ll/xkk;

    .line 155
    .line 156
    invoke-direct {v2}, Ll/xkk;-><init>()V

    .line 157
    .line 158
    .line 159
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 160
    .line 161
    .line 162
    move-result-object v1

    .line 163
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    iput-object v0, p0, Ll/clk;->p:Ll/kcg0;

    .line 168
    .line 169
    iget-object v0, p0, Ll/clk;->h:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 170
    .line 171
    new-instance v1, Ll/ykk;

    .line 172
    .line 173
    invoke-direct {v1, p0}, Ll/ykk;-><init>(Ll/clk;)V

    .line 174
    .line 175
    .line 176
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 177
    .line 178
    .line 179
    iget-object v0, p0, Ll/clk;->h:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 180
    .line 181
    new-instance v1, Ll/zkk;

    .line 182
    .line 183
    invoke-direct {v1, p0}, Ll/zkk;-><init>(Ll/clk;)V

    .line 184
    .line 185
    .line 186
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 187
    .line 188
    .line 189
    invoke-virtual {p0}, Ll/clk;->H()V

    .line 190
    .line 191
    .line 192
    return-void
.end method

.method private synthetic v(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/clk;->r:Lcom/p1/mobile/putong/core/newui/group/GroupSearchAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic w(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/clk;->h:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 2
    .line 3
    const-string p1, ""

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic x(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/clk;->r:Lcom/p1/mobile/putong/core/newui/group/GroupSearchAct;

    .line 2
    .line 3
    iget-object p0, p0, Ll/clk;->h:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic y(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/clk;->q:Ll/mlk;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/mlk;->x0()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private synthetic z(Ljava/lang/CharSequence;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/clk;->j:Lv/VImage;

    .line 2
    .line 3
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    xor-int/lit8 v1, v1, 0x1

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iget-object p0, p0, Ll/clk;->q:Ll/mlk;

    .line 17
    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ll/mlk;->y0(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method


# virtual methods
.method public final synthetic C(Ljava/lang/String;Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p2, p0, Ll/clk;->r:Lcom/p1/mobile/putong/core/newui/group/GroupSearchAct;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/group/GroupSearchAct;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    const-string v0, "recommend_vocabulary"

    .line 8
    .line 9
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    filled-new-array {v0}, [Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "e_recommend_search"

    .line 18
    .line 19
    invoke-static {v1, p2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 20
    .line 21
    .line 22
    iget-object p2, p0, Ll/clk;->h:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 23
    .line 24
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Ll/clk;->h:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 28
    .line 29
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setSelection(I)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/clk;->r:Lcom/p1/mobile/putong/core/newui/group/GroupSearchAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public E()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/clk;->b:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/clk;->o:Lv/VRecyclerView;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/clk;->l:Landroid/widget/RelativeLayout;

    .line 14
    .line 15
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public F(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/clk;->m:Lv/VText;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/clk;->n:Lcom/p1/mobile/putong/core/newui/group/GroupSuggestLayout;

    .line 14
    .line 15
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    const/4 v0, 0x1

    .line 20
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Ll/clk;->n:Lcom/p1/mobile/putong/core/newui/group/GroupSuggestLayout;

    .line 24
    .line 25
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/clk;->r:Lcom/p1/mobile/putong/core/newui/group/GroupSearchAct;

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/group/GroupSearchAct;->pageId()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const-string v1, "e_recommend_search"

    .line 35
    .line 36
    invoke-static {v1, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    new-instance v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 40
    .line 41
    const/4 v1, -0x2

    .line 42
    invoke-direct {v0, v1, v1}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 43
    .line 44
    .line 45
    const/high16 v1, 0x41000000    # 8.0f

    .line 46
    .line 47
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    const/high16 v3, 0x41200000    # 10.0f

    .line 52
    .line 53
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    invoke-virtual {v0, v2, v2, v1, v3}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 58
    .line 59
    .line 60
    iget-object v1, p0, Ll/clk;->n:Lcom/p1/mobile/putong/core/newui/group/GroupSuggestLayout;

    .line 61
    .line 62
    invoke-virtual {v1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 63
    .line 64
    .line 65
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    if-eqz v1, :cond_1

    .line 74
    .line 75
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    check-cast v1, Ljava/lang/String;

    .line 80
    .line 81
    iget-object v2, p0, Ll/clk;->r:Lcom/p1/mobile/putong/core/newui/group/GroupSearchAct;

    .line 82
    .line 83
    invoke-virtual {v2}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    sget v3, Ll/qec0;->h:I

    .line 88
    .line 89
    const/4 v4, 0x0

    .line 90
    invoke-virtual {v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    sget v3, Ll/edc0;->v4:I

    .line 95
    .line 96
    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 97
    .line 98
    .line 99
    move-result-object v3

    .line 100
    check-cast v3, Lv/VText;

    .line 101
    .line 102
    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 103
    .line 104
    .line 105
    iget-object v4, p0, Ll/clk;->n:Lcom/p1/mobile/putong/core/newui/group/GroupSuggestLayout;

    .line 106
    .line 107
    invoke-virtual {v4, v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 108
    .line 109
    .line 110
    new-instance v2, Ll/blk;

    .line 111
    .line 112
    invoke-direct {v2, p0, v1}, Ll/blk;-><init>(Ll/clk;Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    invoke-static {v3, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 116
    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_1
    return-void
.end method

.method public G(Ljava/util/List;Ljava/util/List;Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/clk;->b:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/clk;->o:Lv/VRecyclerView;

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/clk;->l:Landroid/widget/RelativeLayout;

    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-interface {v0}, Ll/r97;->E()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    iget-object v1, p0, Ll/clk;->s:Ll/pkk;

    .line 31
    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    invoke-virtual {v1, p1, p2, p3}, Ll/pkk;->P(Ljava/util/List;Ljava/util/List;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    invoke-virtual {v1, p1}, Ll/pkk;->O(Ljava/util/List;)V

    .line 39
    .line 40
    .line 41
    :goto_0
    iget-object p0, p0, Ll/clk;->s:Ll/pkk;

    .line 42
    .line 43
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public H()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/clk;->b:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/clk;->o:Lv/VRecyclerView;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/clk;->l:Landroid/widget/RelativeLayout;

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/clk;->m:Lv/VText;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    iget-object v0, p0, Ll/clk;->r:Lcom/p1/mobile/putong/core/newui/group/GroupSearchAct;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/group/GroupSearchAct;->pageId()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const-string v1, "e_recommend_search"

    .line 33
    .line 34
    invoke-static {v1, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    iget-object v0, p0, Ll/clk;->s:Ll/pkk;

    .line 38
    .line 39
    sget-object v1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Ll/pkk;->O(Ljava/util/List;)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Ll/clk;->s:Ll/pkk;

    .line 45
    .line 46
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public J()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/clk;->s:Ll/pkk;

    .line 2
    .line 3
    iget-boolean v1, v0, Ll/pkk;->f:Z

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    iget-object v0, v0, Ll/pkk;->e:Ljava/util/List;

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, v0, Ll/pkk;->d:Ljava/util/List;

    .line 11
    .line 12
    :goto_0
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 15
    .line 16
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/e;->B6()Ljava/util/HashMap;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    :cond_1
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    if-eqz v3, :cond_2

    .line 33
    .line 34
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    check-cast v3, Ljava/lang/String;

    .line 39
    .line 40
    new-instance v4, Ll/rkk;

    .line 41
    .line 42
    invoke-direct {v4, v3}, Ll/rkk;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-static {v0, v4}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    check-cast v4, Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 50
    .line 51
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v5

    .line 55
    if-eqz v5, :cond_1

    .line 56
    .line 57
    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    check-cast v3, Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 62
    .line 63
    iget-object v5, v4, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupApply:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 64
    .line 65
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/GroupApply;->status:Lcom/p1/mobile/putong/core/data/GroupApplyStatus;

    .line 66
    .line 67
    iget-object v6, v3, Lcom/p1/mobile/putong/core/data/GroupApply;->status:Lcom/p1/mobile/putong/core/data/GroupApplyStatus;

    .line 68
    .line 69
    invoke-static {v5, v6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 70
    .line 71
    .line 72
    move-result v5

    .line 73
    if-nez v5, :cond_1

    .line 74
    .line 75
    iget-object v5, v4, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupApply:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 76
    .line 77
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/GroupApply;->status:Lcom/p1/mobile/putong/core/data/GroupApplyStatus;

    .line 78
    .line 79
    iput-object v3, v5, Lcom/p1/mobile/putong/core/data/GroupApply;->status:Lcom/p1/mobile/putong/core/data/GroupApplyStatus;

    .line 80
    .line 81
    iget-object v3, p0, Ll/clk;->s:Ll/pkk;

    .line 82
    .line 83
    invoke-interface {v0, v4}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 84
    .line 85
    .line 86
    move-result v4

    .line 87
    iget-object v5, p0, Ll/clk;->s:Ll/pkk;

    .line 88
    .line 89
    iget-boolean v5, v5, Ll/pkk;->f:Z

    .line 90
    .line 91
    add-int/2addr v4, v5

    .line 92
    invoke-virtual {v3, v4}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 93
    .line 94
    .line 95
    goto :goto_1

    .line 96
    :cond_2
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/clk;->p:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/mlk;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/clk;->u(Ll/mlk;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/clk;->s(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0}, Ll/clk;->r()V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method

.method public s(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/dlk;->b(Ll/clk;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public u(Ll/mlk;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/clk;->q:Ll/mlk;

    .line 2
    .line 3
    return-void
.end method
