.class public Ll/ldj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/cdj0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VRecyclerView;

.field public b:Landroid/widget/LinearLayout;

.field public c:Landroid/widget/LinearLayout;

.field public d:Landroid/view/View;

.field public e:Landroid/widget/LinearLayout;

.field public f:Lv/VEditText;

.field public g:Landroid/widget/TextView;

.field public h:Lv/VLinear;

.field public i:Ll/pcj0;

.field public j:Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationHeaderView;

.field public k:Lcom/p1/mobile/android/app/Act;

.field public l:Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationFeedFrag;

.field public m:Ll/cdj0;

.field public n:Z

.field public o:I

.field public p:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationFeedFrag;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/gdj0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/gdj0;-><init>(Ll/ldj0;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/ldj0;->p:Ll/y20;

    .line 10
    .line 11
    iput-object p1, p0, Ll/ldj0;->l:Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationFeedFrag;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iput-object p1, p0, Ll/ldj0;->k:Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    return-void
.end method

.method public static synthetic a()V
    .locals 1

    .line 1
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->I3:I

    .line 2
    .line 3
    invoke-static {v0}, Ll/o1j0;->w(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic b(Ll/ldj0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ldj0;->y(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/ldj0;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ldj0;->z(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic d(Ll/ldj0;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ldj0;->v(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic e(Ll/ldj0;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ldj0;->x(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    return-void
.end method

.method public static synthetic f(Ll/ldj0;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ldj0;->A(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic i(Ll/ldj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ldj0;->u()V

    return-void
.end method

.method public static synthetic j(Ll/ldj0;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ldj0;->w(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private l(Ll/x20;)V
    .locals 3

    .line 1
    iget-object p0, p0, Ll/ldj0;->k:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    new-instance v0, Ll/kdj0;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/kdj0;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    sget-object v2, Ll/l3h;->c:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p0, v0, v1, p1, v2}, Ll/k3h;->P0(Lcom/p1/mobile/android/app/Act;Ll/x20;ZLl/x20;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private n()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ldj0;->m:Ll/cdj0;

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    iput-object v0, p0, Ll/cdj0;->h:Ljava/lang/String;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, Ll/cdj0;->g:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method

.method private s()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ldj0;->f:Lv/VEditText;

    .line 2
    .line 3
    iget-object v1, p0, Ll/ldj0;->k:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->D:I

    .line 6
    .line 7
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Ll/owi;->a()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Ll/ldj0;->f:Lv/VEditText;

    .line 21
    .line 22
    invoke-virtual {v0}, Landroid/widget/TextView;->getInputType()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iput v0, p0, Ll/ldj0;->o:I

    .line 27
    .line 28
    iget-object v0, p0, Ll/ldj0;->f:Lv/VEditText;

    .line 29
    .line 30
    const/4 v1, 0x0

    .line 31
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setInputType(I)V

    .line 32
    .line 33
    .line 34
    :cond_0
    iget-object v0, p0, Ll/ldj0;->f:Lv/VEditText;

    .line 35
    .line 36
    new-instance v1, Ll/ddj0;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Ll/ddj0;-><init>(Ll/ldj0;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Ll/ldj0;->k:Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    iget-object v1, p0, Ll/ldj0;->f:Lv/VEditText;

    .line 47
    .line 48
    const/4 v2, 0x1

    .line 49
    invoke-virtual {v1, v2}, Lv/VEditText;->i(Z)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    new-instance v1, Ll/edj0;

    .line 58
    .line 59
    invoke-direct {v1, p0}, Ll/edj0;-><init>(Ll/ldj0;)V

    .line 60
    .line 61
    .line 62
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Ll/ldj0;->g:Landroid/widget/TextView;

    .line 70
    .line 71
    new-instance v1, Ll/fdj0;

    .line 72
    .line 73
    invoke-direct {v1, p0}, Ll/fdj0;-><init>(Ll/ldj0;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method private synthetic z(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput-boolean v0, p0, Ll/ldj0;->n:Z

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Ll/ldj0;->f:Lv/VEditText;

    .line 14
    .line 15
    iget-object p0, p0, Ll/ldj0;->k:Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->D:I

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method


# virtual methods
.method public final synthetic A(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ldj0;->f:Lv/VEditText;

    .line 2
    .line 3
    iget v1, p0, Ll/ldj0;->o:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setInputType(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1, p2}, Ll/ldj0;->J(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public B(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/ldj0;->m:Ll/cdj0;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    iput-boolean v0, p1, Ll/cdj0;->k:Z

    .line 5
    .line 6
    iget-object p0, p0, Ll/ldj0;->b:Landroid/widget/LinearLayout;

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public C(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ldj0;->i:Ll/pcj0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/pcj0;->e0(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public E(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ldj0;->i:Ll/pcj0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/pcj0;->d0(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public F()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ldj0;->a:Lv/VRecyclerView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public G(Ll/ucj0;Lcom/p1/mobile/putong/feed/data/TopicMoment;I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ldj0;->j:Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationHeaderView;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ldj0;->m:Ll/cdj0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/cdj0;->e:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, p1, p2, p3, p0}, Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationHeaderView;->d(Ll/ucj0;Lcom/p1/mobile/putong/feed/data/TopicMoment;ILjava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public H(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ldj0;->b:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public I(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ldj0;->f:Lv/VEditText;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->A(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/owi;->a()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    new-instance v0, Ll/idj0;

    .line 13
    .line 14
    invoke-direct {v0, p0, p1, p2}, Ll/idj0;-><init>(Ll/ldj0;Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-direct {p0, v0}, Ll/ldj0;->l(Ll/x20;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    invoke-virtual {p0, p1, p2}, Ll/ldj0;->J(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final J(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ldj0;->k:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iget-object v1, p0, Ll/ldj0;->f:Lv/VEditText;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/ldj0;->f:Lv/VEditText;

    .line 10
    .line 11
    iget-object p0, p0, Ll/ldj0;->m:Ll/cdj0;

    .line 12
    .line 13
    invoke-virtual {p0, p1, p2}, Ll/cdj0;->D0(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public K()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ldj0;->k:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/ldj0;->f:Lv/VEditText;

    .line 7
    .line 8
    iget-object v1, p0, Ll/ldj0;->k:Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->D:I

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/ldj0;->f:Lv/VEditText;

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/cdj0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ldj0;->m(Ll/cdj0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ldj0;->k(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance p2, Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationHeaderView;

    .line 6
    .line 7
    iget-object v0, p0, Ll/ldj0;->k:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    invoke-direct {p2, v0}, Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationHeaderView;-><init>(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    iput-object p2, p0, Ll/ldj0;->j:Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationHeaderView;

    .line 13
    .line 14
    new-instance p2, Landroidx/recyclerview/widget/RecyclerView$p;

    .line 15
    .line 16
    const/4 v0, -0x1

    .line 17
    const/4 v1, -0x2

    .line 18
    invoke-direct {p2, v0, v1}, Landroidx/recyclerview/widget/RecyclerView$p;-><init>(II)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/ldj0;->j:Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationHeaderView;

    .line 22
    .line 23
    invoke-virtual {v0, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 24
    .line 25
    .line 26
    iget-object p2, p0, Ll/ldj0;->l:Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationFeedFrag;

    .line 27
    .line 28
    invoke-static {p1}, Lcom/p1/mobile/android/app/Act;->keyboardListenerObservable(Landroid/view/View;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    iget-object p0, p0, Ll/ldj0;->p:Ll/y20;

    .line 37
    .line 38
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    return-object p1
.end method

.method public k(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/mdj0;->b(Ll/ldj0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public m(Ll/cdj0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ldj0;->m:Ll/cdj0;

    .line 2
    .line 3
    return-void
.end method

.method public p(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ldj0;->k:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->setTitle(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public q(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/ldj0;->a:Lv/VRecyclerView;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getItemAnimator()Landroidx/recyclerview/widget/RecyclerView$l;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const-wide/16 v0, 0x0

    .line 8
    .line 9
    invoke-virtual {p1, v0, v1}, Landroidx/recyclerview/widget/RecyclerView$l;->setAddDuration(J)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ll/ldj0;->a:Lv/VRecyclerView;

    .line 13
    .line 14
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getItemAnimator()Landroidx/recyclerview/widget/RecyclerView$l;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1, v0, v1}, Landroidx/recyclerview/widget/RecyclerView$l;->setChangeDuration(J)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Ll/ldj0;->a:Lv/VRecyclerView;

    .line 22
    .line 23
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getItemAnimator()Landroidx/recyclerview/widget/RecyclerView$l;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p1, v0, v1}, Landroidx/recyclerview/widget/RecyclerView$l;->setMoveDuration(J)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Ll/ldj0;->a:Lv/VRecyclerView;

    .line 31
    .line 32
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getItemAnimator()Landroidx/recyclerview/widget/RecyclerView$l;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p1, v0, v1}, Landroidx/recyclerview/widget/RecyclerView$l;->setRemoveDuration(J)V

    .line 37
    .line 38
    .line 39
    invoke-direct {p0}, Ll/ldj0;->s()V

    .line 40
    .line 41
    .line 42
    new-instance p1, Ll/pcj0;

    .line 43
    .line 44
    iget-object v0, p0, Ll/ldj0;->k:Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    iget-object v1, p0, Ll/ldj0;->m:Ll/cdj0;

    .line 47
    .line 48
    invoke-direct {p1, v0, v1}, Ll/pcj0;-><init>(Lcom/p1/mobile/android/app/Act;Ll/cdj0;)V

    .line 49
    .line 50
    .line 51
    iput-object p1, p0, Ll/ldj0;->i:Ll/pcj0;

    .line 52
    .line 53
    new-instance v0, Ll/zzk;

    .line 54
    .line 55
    invoke-direct {v0, p1}, Ll/zzk;-><init>(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 56
    .line 57
    .line 58
    iget-object p1, p0, Ll/ldj0;->j:Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationHeaderView;

    .line 59
    .line 60
    invoke-virtual {v0, p1}, Ll/zzk;->H(Landroid/view/View;)V

    .line 61
    .line 62
    .line 63
    iget-object p1, p0, Ll/ldj0;->a:Lv/VRecyclerView;

    .line 64
    .line 65
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 66
    .line 67
    .line 68
    iget-object p0, p0, Ll/ldj0;->m:Ll/cdj0;

    .line 69
    .line 70
    invoke-virtual {p0}, Ll/cdj0;->m0()V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public final synthetic u()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ldj0;->f:Lv/VEditText;

    .line 2
    .line 3
    iget v1, p0, Ll/ldj0;->o:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setInputType(I)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Ll/ldj0;->n()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic v(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 p2, 0x1

    .line 6
    const/4 v0, 0x0

    .line 7
    if-ne p1, p2, :cond_1

    .line 8
    .line 9
    iget-boolean p1, p0, Ll/ldj0;->n:Z

    .line 10
    .line 11
    if-nez p1, :cond_1

    .line 12
    .line 13
    iget-object p1, p0, Ll/ldj0;->f:Lv/VEditText;

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    invoke-static {}, Ll/owi;->a()Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_0

    .line 30
    .line 31
    new-instance p1, Ll/jdj0;

    .line 32
    .line 33
    invoke-direct {p1, p0}, Ll/jdj0;-><init>(Ll/ldj0;)V

    .line 34
    .line 35
    .line 36
    invoke-direct {p0, p1}, Ll/ldj0;->l(Ll/x20;)V

    .line 37
    .line 38
    .line 39
    return v0

    .line 40
    :cond_0
    invoke-direct {p0}, Ll/ldj0;->n()V

    .line 41
    .line 42
    .line 43
    :cond_1
    return v0
.end method

.method public final synthetic w(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ldj0;->f:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p0, p0, Ll/ldj0;->g:Landroid/widget/TextView;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-nez p1, :cond_0

    .line 24
    .line 25
    const/4 p1, 0x1

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/4 p1, 0x0

    .line 28
    :goto_0
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final synthetic x(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ldj0;->m:Ll/cdj0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/cdj0;->C0(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic y(Landroid/view/View;)V
    .locals 2

    .line 1
    new-instance p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 2
    .line 3
    invoke-direct {p1}, Lcom/p1/mobile/putong/feed/data/MomentMessage;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/ldj0;->f:Lv/VEditText;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->value:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v0, p0, Ll/ldj0;->f:Lv/VEditText;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    sget-object v1, Ll/uqb0;->Z:Ll/a4j;

    .line 33
    .line 34
    invoke-virtual {v1, v0}, Ll/a4j;->K(Ljava/lang/String;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    iget-object v0, p0, Ll/ldj0;->k:Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    new-instance v1, Ll/hdj0;

    .line 43
    .line 44
    invoke-direct {v1, p0, p1}, Ll/hdj0;-><init>(Ll/ldj0;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 45
    .line 46
    .line 47
    const/4 p0, 0x0

    .line 48
    invoke-static {v0, v1, p0}, Ll/k3h;->A0(Lcom/p1/mobile/android/app/Act;Ll/x20;Z)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_0
    iget-object p0, p0, Ll/ldj0;->m:Ll/cdj0;

    .line 53
    .line 54
    invoke-virtual {p0, p1}, Ll/cdj0;->C0(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method
