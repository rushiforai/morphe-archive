.class public Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel$d;
    }
.end annotation


# instance fields
.field public a:Lv/VImage;

.field public b:Lv/VText;

.field public c:Lv/VText;

.field public d:Lv/VRecyclerView;

.field public e:Lv/VEditText;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public j:Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel$d;

.field public k:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public l:Ll/kcg0;

.field public m:Ll/x20;

.field public n:Ll/x20;

.field public o:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/LetterWrapper;",
            ">;"
        }
    .end annotation
.end field

.field public p:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/LetterWrapper;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->o:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/LinkedList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->p:Ljava/util/List;

    .line 17
    .line 18
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p0, p1, p0}, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->j(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 26
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 27
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->o:Ljava/util/List;

    .line 28
    new-instance p2, Ljava/util/LinkedList;

    invoke-direct {p2}, Ljava/util/LinkedList;-><init>()V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->p:Ljava/util/List;

    .line 29
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    .line 30
    invoke-virtual {p0, p1, p0}, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->j(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 31
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 32
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->o:Ljava/util/List;

    .line 33
    new-instance p2, Ljava/util/LinkedList;

    invoke-direct {p2}, Ljava/util/LinkedList;-><init>()V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->p:Ljava/util/List;

    .line 34
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    .line 35
    invoke-virtual {p0, p1, p0}, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->j(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->n(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->p(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->l(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->m(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->q()V

    return-void
.end method

.method public static synthetic f(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->o(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;)Ll/y20;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->k:Ll/y20;

    return-object p0
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->r()V

    return-void
.end method


# virtual methods
.method public j(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/hsn;->b(Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final k()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->f:Lv/VText;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/core/R$string;->W2:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel$d;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel$d;-><init>(Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->j:Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel$d;

    .line 18
    .line 19
    new-instance v1, Ll/zrn;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/zrn;-><init>(Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel$d;->J(Ll/y20;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->d:Lv/VRecyclerView;

    .line 28
    .line 29
    new-instance v1, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;

    .line 30
    .line 31
    const/4 v2, 0x2

    .line 32
    const/4 v3, 0x0

    .line 33
    invoke-direct {v1, v2, v3}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;-><init>(II)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->d:Lv/VRecyclerView;

    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->j:Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel$d;

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->f:Lv/VText;

    .line 47
    .line 48
    new-instance v1, Ll/asn;

    .line 49
    .line 50
    invoke-direct {v1, p0}, Ll/asn;-><init>(Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;)V

    .line 51
    .line 52
    .line 53
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->i:Lv/VText;

    .line 57
    .line 58
    new-instance v1, Ll/bsn;

    .line 59
    .line 60
    invoke-direct {v1, p0}, Ll/bsn;-><init>(Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;)V

    .line 61
    .line 62
    .line 63
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->e:Lv/VEditText;

    .line 67
    .line 68
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setHorizontallyScrolling(Z)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->e:Lv/VEditText;

    .line 72
    .line 73
    const/4 v1, 0x4

    .line 74
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setImeOptions(I)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->e:Lv/VEditText;

    .line 78
    .line 79
    new-instance v1, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel$a;

    .line 80
    .line 81
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel$a;-><init>(Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->e:Lv/VEditText;

    .line 88
    .line 89
    new-instance v1, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel$b;

    .line 90
    .line 91
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel$b;-><init>(Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->a:Lv/VImage;

    .line 98
    .line 99
    new-instance v1, Ll/csn;

    .line 100
    .line 101
    invoke-direct {v1, p0}, Ll/csn;-><init>(Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 105
    .line 106
    .line 107
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->i:Lv/VText;

    .line 108
    .line 109
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Z2:I

    .line 110
    .line 111
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(I)V

    .line 112
    .line 113
    .line 114
    return-void
.end method

.method public final synthetic l(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->e:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->e:Lv/VEditText;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->e:Lv/VEditText;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/widget/TextView;->length()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setSelection(I)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic m(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->e:Lv/VEditText;

    .line 2
    .line 3
    new-instance v1, Ll/esn;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/esn;-><init>(Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-wide/16 p0, 0x64

    .line 9
    .line 10
    invoke-virtual {v0, v1, p0, p1}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic n(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->r()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic o(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->m:Ll/x20;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/x20;->call()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->l:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->k()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic p(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->n:Ll/x20;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/x20;->call()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic q()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->l:Ll/kcg0;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->l:Ll/kcg0;

    .line 10
    .line 11
    invoke-interface {v0}, Ll/kcg0;->isUnsubscribed()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->l:Ll/kcg0;

    .line 18
    .line 19
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->l:Ll/kcg0;

    .line 24
    .line 25
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->L0:Ll/se9;

    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->e:Lv/VEditText;

    .line 30
    .line 31
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v0, v1}, Ll/se9;->g3(Ljava/lang/String;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    new-instance v1, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel$c;

    .line 48
    .line 49
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel$c;-><init>(Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;)V

    .line 50
    .line 51
    .line 52
    invoke-static {v1}, Ll/psd0;->L(Ll/bb50;)Lcom/p1/mobile/android/rx/a;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->l:Ll/kcg0;

    .line 61
    .line 62
    return-void
.end method

.method public final r()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->e:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Q2:I

    .line 22
    .line 23
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    new-instance v0, Ll/dsn;

    .line 28
    .line 29
    invoke-direct {v0, p0}, Ll/dsn;-><init>(Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;)V

    .line 30
    .line 31
    .line 32
    const-string v1, "e_letter_send_button"

    .line 33
    .line 34
    const-string v2, "p_letter_sentmessage_page"

    .line 35
    .line 36
    invoke-static {v1, v2}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-static {}, Ll/joa;->M3()Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-nez v1, :cond_1

    .line 44
    .line 45
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 58
    .line 59
    const-string v1, "letter"

    .line 60
    .line 61
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->letter:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 62
    .line 63
    invoke-interface {v0, p0, v1, v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->pr(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_1
    invoke-interface {v0}, Ll/x20;->call()V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public final s()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->o:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/p1/mobile/putong/data/LetterWrapper;

    .line 18
    .line 19
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->p:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {v2, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-nez v2, :cond_0

    .line 26
    .line 27
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->p:Ljava/util/List;

    .line 28
    .line 29
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->j:Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel$d;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->p:Ljava/util/List;

    .line 36
    .line 37
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel$d;->I(Ljava/util/List;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public setCloseCallBack(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->n:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public setLetterWrapperLibraries(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/LetterWrapper;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->o:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->o:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public setSendClickCallBack(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->k:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public setSuperLikeClickCallBack(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->m:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public t(Lcom/p1/mobile/putong/data/User;Ll/x20;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->e:Lv/VEditText;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 4
    .line 5
    const-string v2, "female"

    .line 6
    .line 7
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    sget v1, Lcom/p1/mobile/putong/core/R$string;->R2:I

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    sget v1, Lcom/p1/mobile/putong/core/R$string;->S2:I

    .line 17
    .line 18
    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setHint(I)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->b:Lv/VText;

    .line 22
    .line 23
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 24
    .line 25
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_1

    .line 30
    .line 31
    sget v1, Lcom/p1/mobile/putong/core/R$string;->d3:I

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_1
    sget v1, Lcom/p1/mobile/putong/core/R$string;->e3:I

    .line 35
    .line 36
    :goto_1
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->c:Lv/VText;

    .line 40
    .line 41
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 42
    .line 43
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_2

    .line 48
    .line 49
    sget v1, Lcom/p1/mobile/putong/core/R$string;->b3:I

    .line 50
    .line 51
    goto :goto_2

    .line 52
    :cond_2
    sget v1, Lcom/p1/mobile/putong/core/R$string;->c3:I

    .line 53
    .line 54
    :goto_2
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->g:Lv/VText;

    .line 58
    .line 59
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 60
    .line 61
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-eqz v1, :cond_3

    .line 66
    .line 67
    sget v1, Lcom/p1/mobile/putong/core/R$string;->i3:I

    .line 68
    .line 69
    goto :goto_3

    .line 70
    :cond_3
    sget v1, Lcom/p1/mobile/putong/core/R$string;->h3:I

    .line 71
    .line 72
    :goto_3
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->h:Lv/VText;

    .line 76
    .line 77
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 78
    .line 79
    invoke-static {p1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    if-eqz p1, :cond_4

    .line 84
    .line 85
    sget p1, Lcom/p1/mobile/putong/core/R$string;->f3:I

    .line 86
    .line 87
    goto :goto_4

    .line 88
    :cond_4
    sget p1, Lcom/p1/mobile/putong/core/R$string;->g3:I

    .line 89
    .line 90
    :goto_4
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/widget/IntlLetterSendPanel;->s()V

    .line 94
    .line 95
    .line 96
    new-instance p1, Ll/fsn;

    .line 97
    .line 98
    invoke-direct {p1, p2}, Ll/fsn;-><init>(Ll/x20;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 102
    .line 103
    .line 104
    return-void
.end method
