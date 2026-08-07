.class public Ll/dew;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/vdw;",
        ">;"
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

.field public k:Ll/kcg0;

.field public l:Lcom/p1/mobile/putong/core/newui/loveletter/search/LoveLetterSearchAct;

.field public m:Ll/vdw;

.field public n:Lcom/p1/mobile/putong/core/newui/loveletter/a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/loveletter/search/LoveLetterSearchAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/dew;->l:Lcom/p1/mobile/putong/core/newui/loveletter/search/LoveLetterSearchAct;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/dew;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/dew;->k(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/dew;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/dew;->l(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
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

.method public static synthetic d(Ll/dew;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/dew;->m(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public static synthetic e(Landroid/widget/EditText;Ll/gcg0;)V
    .locals 2

    .line 1
    new-instance v0, Ll/dew$a;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/dew$a;-><init>(Ll/gcg0;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ll/cew;

    .line 10
    .line 11
    invoke-direct {v1, p0, v0}, Ll/cew;-><init>(Landroid/widget/EditText;Landroid/text/TextWatcher;)V

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

.method public static synthetic f(Landroid/widget/EditText;Landroid/text/TextWatcher;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic k(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/dew;->l:Lcom/p1/mobile/putong/core/newui/loveletter/search/LoveLetterSearchAct;

    .line 2
    .line 3
    iget-object v0, p0, Ll/dew;->g:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/dew;->g:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/view/View;->clearFocus()V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/dew;->l:Lcom/p1/mobile/putong/core/newui/loveletter/search/LoveLetterSearchAct;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/loveletter/search/LoveLetterSearchAct;->finish()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private synthetic l(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/dew;->g:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/dew;->i:Lv/VImage;

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

.method private synthetic m(Ljava/lang/CharSequence;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dew;->m:Ll/vdw;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    iget-object p1, p0, Ll/dew;->m:Ll/vdw;

    .line 30
    .line 31
    const-string v1, ""

    .line 32
    .line 33
    invoke-virtual {p1, v1}, Ll/vdw;->l0(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Ll/dew;->g:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 37
    .line 38
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    iget-object v1, p0, Ll/dew;->m:Ll/vdw;

    .line 43
    .line 44
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {v1, p1}, Ll/vdw;->l0(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    :goto_0
    iget-object p0, p0, Ll/dew;->i:Lv/VImage;

    .line 56
    .line 57
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    xor-int/lit8 p1, p1, 0x1

    .line 62
    .line 63
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 64
    .line 65
    .line 66
    :cond_1
    return-void
.end method

.method public static q(Landroid/widget/EditText;)Lrx/c;
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
    new-instance v0, Ll/bew;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/bew;-><init>(Landroid/widget/EditText;)V

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


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dew;->l:Lcom/p1/mobile/putong/core/newui/loveletter/search/LoveLetterSearchAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dew;->l:Lcom/p1/mobile/putong/core/newui/loveletter/search/LoveLetterSearchAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dew;->k:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/eew;->b(Ll/dew;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/vdw;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/dew;->j(Ll/vdw;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/dew;->i(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j(Ll/vdw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dew;->m:Ll/vdw;

    .line 2
    .line 3
    return-void
.end method

.method public n(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/dew;->n:Lcom/p1/mobile/putong/core/newui/loveletter/a;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/newui/loveletter/a;->R(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    invoke-virtual {p0, p1}, Ll/dew;->p(Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public p(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dew;->c:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/dew;->b:Lv/VRecyclerView;

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

.method public r()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/dew;->l:Lcom/p1/mobile/putong/core/newui/loveletter/search/LoveLetterSearchAct;

    .line 2
    .line 3
    iget-object v1, p0, Ll/dew;->g:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 4
    .line 5
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    new-instance v2, Ll/wdw;

    .line 9
    .line 10
    invoke-direct {v2, v1}, Ll/wdw;-><init>(Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Act;->post(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/dew;->d:Lv/VText;

    .line 17
    .line 18
    const-string v1, "\u62b1\u6b49\uff0c\u6682\u65e0\u5339\u914d\u7ed3\u679c"

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/dew;->g:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 24
    .line 25
    const-string v1, "\u8f93\u5165\u6635\u79f0"

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->setSpaceHint(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/dew;->j:Lv/VText;

    .line 31
    .line 32
    new-instance v1, Ll/xdw;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Ll/xdw;-><init>(Ll/dew;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/dew;->i:Lv/VImage;

    .line 41
    .line 42
    new-instance v1, Ll/ydw;

    .line 43
    .line 44
    invoke-direct {v1, p0}, Ll/ydw;-><init>(Ll/dew;)V

    .line 45
    .line 46
    .line 47
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 48
    .line 49
    .line 50
    new-instance v0, Lcom/p1/mobile/putong/core/newui/loveletter/a;

    .line 51
    .line 52
    iget-object v1, p0, Ll/dew;->m:Ll/vdw;

    .line 53
    .line 54
    iget-object v2, p0, Ll/dew;->b:Lv/VRecyclerView;

    .line 55
    .line 56
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/core/newui/loveletter/a;-><init>(Ll/few;Lv/VRecyclerView;)V

    .line 57
    .line 58
    .line 59
    iput-object v0, p0, Ll/dew;->n:Lcom/p1/mobile/putong/core/newui/loveletter/a;

    .line 60
    .line 61
    iget-object v0, p0, Ll/dew;->b:Lv/VRecyclerView;

    .line 62
    .line 63
    new-instance v1, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 64
    .line 65
    iget-object v2, p0, Ll/dew;->l:Lcom/p1/mobile/putong/core/newui/loveletter/search/LoveLetterSearchAct;

    .line 66
    .line 67
    const/4 v3, 0x2

    .line 68
    invoke-direct {v1, v2, v3}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Ll/dew;->b:Lv/VRecyclerView;

    .line 75
    .line 76
    iget-object v1, p0, Ll/dew;->n:Lcom/p1/mobile/putong/core/newui/loveletter/a;

    .line 77
    .line 78
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Ll/dew;->l:Lcom/p1/mobile/putong/core/newui/loveletter/search/LoveLetterSearchAct;

    .line 82
    .line 83
    iget-object v1, p0, Ll/dew;->g:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 84
    .line 85
    invoke-static {v1}, Ll/dew;->q(Landroid/widget/EditText;)Lrx/c;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    const-wide/16 v1, 0x1f4

    .line 94
    .line 95
    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 96
    .line 97
    invoke-virtual {v0, v1, v2, v3}, Lrx/c;->throttleLast(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    new-instance v1, Ll/zdw;

    .line 110
    .line 111
    invoke-direct {v1, p0}, Ll/zdw;-><init>(Ll/dew;)V

    .line 112
    .line 113
    .line 114
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    iput-object v0, p0, Ll/dew;->k:Ll/kcg0;

    .line 123
    .line 124
    iget-object v0, p0, Ll/dew;->g:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 125
    .line 126
    new-instance v1, Ll/aew;

    .line 127
    .line 128
    invoke-direct {v1}, Ll/aew;-><init>()V

    .line 129
    .line 130
    .line 131
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 132
    .line 133
    .line 134
    iget-object p0, p0, Ll/dew;->a:Landroid/widget/FrameLayout;

    .line 135
    .line 136
    const/high16 v0, 0x42400000    # 48.0f

    .line 137
    .line 138
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 139
    .line 140
    .line 141
    move-result v0

    .line 142
    const/4 v1, 0x0

    .line 143
    invoke-virtual {p0, v1, v0, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 144
    .line 145
    .line 146
    return-void
.end method
