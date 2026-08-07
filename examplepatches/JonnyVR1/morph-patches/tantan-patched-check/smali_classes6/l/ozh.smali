.class public Ll/ozh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;
.implements Ll/d0r;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/ozh$d;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/izh;",
        ">;",
        "Ll/d0r;"
    }
.end annotation


# static fields
.field public static final A:I

.field public static final B:I

.field public static final r:I

.field public static final s:I

.field public static final t:I

.field public static final u:I

.field public static final v:I

.field public static final w:I

.field public static final x:I

.field public static final y:I

.field public static final z:I


# instance fields
.field public a:Lv/VFrame;

.field public b:Lv/VLinear;

.field public c:Lv/VRelative;

.field public d:Landroid/view/View;

.field public e:Landroid/view/View;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Lv/AutoVDraweeView;

.field public i:Lv/VEditText;

.field public j:Landroid/widget/TextView;

.field public k:Landroidx/recyclerview/widget/RecyclerView;

.field public l:Lv/VText;

.field public m:Ll/izh;

.field public n:Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;

.field public o:Ll/rzh;

.field public p:Z

.field public q:Ll/h80;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    const/high16 v0, 0x41000000    # 8.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    sput v1, Ll/ozh;->r:I

    .line 8
    .line 9
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    sput v0, Ll/ozh;->s:I

    .line 14
    .line 15
    const/high16 v2, 0x41b00000    # 22.0f

    .line 16
    .line 17
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    sput v2, Ll/ozh;->t:I

    .line 22
    .line 23
    const/high16 v3, 0x41300000    # 11.0f

    .line 24
    .line 25
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    sput v3, Ll/ozh;->u:I

    .line 30
    .line 31
    const/high16 v4, 0x41a00000    # 20.0f

    .line 32
    .line 33
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    sput v4, Ll/ozh;->v:I

    .line 38
    .line 39
    div-int/lit8 v5, v0, 0x2

    .line 40
    .line 41
    sub-int/2addr v4, v5

    .line 42
    sput v4, Ll/ozh;->w:I

    .line 43
    .line 44
    const/high16 v4, 0x42500000    # 52.0f

    .line 45
    .line 46
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 47
    .line 48
    .line 49
    move-result v4

    .line 50
    sput v4, Ll/ozh;->x:I

    .line 51
    .line 52
    div-int/lit8 v1, v1, 0x2

    .line 53
    .line 54
    sput v1, Ll/ozh;->y:I

    .line 55
    .line 56
    div-int/lit8 v0, v0, 0x2

    .line 57
    .line 58
    sput v0, Ll/ozh;->z:I

    .line 59
    .line 60
    sub-int/2addr v2, v1

    .line 61
    sput v2, Ll/ozh;->A:I

    .line 62
    .line 63
    sub-int/2addr v3, v1

    .line 64
    sput v3, Ll/ozh;->B:I

    .line 65
    .line 66
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ozh$b;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/ozh$b;-><init>(Ll/ozh;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/ozh;->q:Ll/h80;

    .line 10
    .line 11
    iput-object p1, p0, Ll/ozh;->n:Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;

    .line 12
    .line 13
    return-void
.end method

.method private C()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ozh;->n:Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;->l:Ljava/lang/String;

    .line 4
    .line 5
    const-string v1, "source_page"

    .line 6
    .line 7
    invoke-static {v1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    filled-new-array {v0}, [Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "e_set_my_state_post"

    .line 16
    .line 17
    const-string v2, "p_set_my_state_post"

    .line 18
    .line 19
    invoke-static {v1, v2, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Ll/cmg;->E()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iget-object v1, p0, Ll/ozh;->g:Lv/VText;

    .line 27
    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    const-string v0, "24\u5c0f\u65f6\u540e\u5c06\u81ea\u52a8\u6d88\u5931"

    .line 31
    .line 32
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Ll/ozh;->f:Lv/VText;

    .line 36
    .line 37
    const-string v0, "\u53d1\u5e03\u6b64\u523b\u72b6\u6001"

    .line 38
    .line 39
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_0
    const-string v0, "\u4ec5\u597d\u53cb\u53ef\u89c1\uff0c24\u5c0f\u65f6\u540e\u5c06\u81ea\u52a8\u6d88\u5931"

    .line 44
    .line 45
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Ll/ozh;->f:Lv/VText;

    .line 49
    .line 50
    const-string v0, "\u53d1\u5e03\u6211\u7684\u72b6\u6001"

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public static synthetic a(Ll/ozh;Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ozh;->y(Lcom/p1/mobile/putong/data/BubbleInfo;)V

    return-void
.end method

.method public static synthetic b(Ll/ozh;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ozh;->w(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/ozh;Lcom/p1/mobile/putong/data/Emotion;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ozh;->x(Lcom/p1/mobile/putong/data/Emotion;)V

    return-void
.end method

.method public static synthetic d(Ll/ozh;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ozh;->v(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic e(Ll/ozh;)Ll/rzh;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ozh;->o:Ll/rzh;

    return-object p0
.end method

.method public static bridge synthetic f(Ll/ozh;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ozh;->p:Z

    return p0
.end method

.method public static bridge synthetic i()I
    .locals 1

    .line 1
    sget v0, Ll/ozh;->z:I

    return v0
.end method

.method public static bridge synthetic j()I
    .locals 1

    .line 1
    sget v0, Ll/ozh;->y:I

    return v0
.end method

.method public static bridge synthetic k()I
    .locals 1

    .line 1
    sget v0, Ll/ozh;->B:I

    return v0
.end method

.method public static bridge synthetic l()I
    .locals 1

    .line 1
    sget v0, Ll/ozh;->A:I

    return v0
.end method

.method private s()V
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ozh;->i:Lv/VEditText;

    .line 2
    .line 3
    new-instance v1, Ll/b4h;

    .line 4
    .line 5
    const/16 v2, 0x1e

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ll/b4h;-><init>(I)V

    .line 8
    .line 9
    .line 10
    const/4 v2, 0x1

    .line 11
    new-array v2, v2, [Landroid/text/InputFilter;

    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    aput-object v1, v2, v3

    .line 15
    .line 16
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setFilters([Landroid/text/InputFilter;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/ozh;->i:Lv/VEditText;

    .line 20
    .line 21
    new-instance v1, Ll/ozh$a;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/ozh$a;-><init>(Ll/ozh;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/ozh;->l:Lv/VText;

    .line 30
    .line 31
    new-instance v1, Ll/jzh;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/jzh;-><init>(Ll/ozh;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/ozh;->j:Landroid/widget/TextView;

    .line 40
    .line 41
    new-instance v1, Ll/kzh;

    .line 42
    .line 43
    invoke-direct {v1, p0}, Ll/kzh;-><init>(Ll/ozh;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method private u()V
    .locals 4

    .line 1
    new-instance v0, Ll/rzh;

    .line 2
    .line 3
    iget-object v1, p0, Ll/ozh;->n:Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;

    .line 4
    .line 5
    const-string v2, "p_set_my_state_post"

    .line 6
    .line 7
    iget-object v3, p0, Ll/ozh;->q:Ll/h80;

    .line 8
    .line 9
    invoke-direct {v0, v1, v2, v3}, Ll/rzh;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/h80;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/ozh;->o:Ll/rzh;

    .line 13
    .line 14
    new-instance v1, Ll/lzh;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/lzh;-><init>(Ll/ozh;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ll/rzh;->N(Ll/y20;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/ozh;->k:Landroidx/recyclerview/widget/RecyclerView;

    .line 23
    .line 24
    iget-object v1, p0, Ll/ozh;->o:Ll/rzh;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/ozh;->k:Landroidx/recyclerview/widget/RecyclerView;

    .line 30
    .line 31
    new-instance v1, Ll/ozh$d;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/ozh$d;-><init>(Ll/ozh;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/ozh;->k:Landroidx/recyclerview/widget/RecyclerView;

    .line 40
    .line 41
    sget v1, Ll/ozh;->w:I

    .line 42
    .line 43
    sget v2, Ll/ozh;->x:I

    .line 44
    .line 45
    const/4 v3, 0x0

    .line 46
    invoke-virtual {v0, v1, v3, v1, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 47
    .line 48
    .line 49
    new-instance v0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 50
    .line 51
    iget-object v1, p0, Ll/ozh;->n:Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;

    .line 52
    .line 53
    const/4 v2, 0x4

    .line 54
    invoke-direct {v0, v1, v2}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 55
    .line 56
    .line 57
    new-instance v1, Ll/ozh$c;

    .line 58
    .line 59
    invoke-direct {v1, p0}, Ll/ozh$c;-><init>(Ll/ozh;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/GridLayoutManager;->v(Landroidx/recyclerview/widget/GridLayoutManager$c;)V

    .line 63
    .line 64
    .line 65
    iget-object v1, p0, Ll/ozh;->k:Landroidx/recyclerview/widget/RecyclerView;

    .line 66
    .line 67
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 68
    .line 69
    .line 70
    iget-object p0, p0, Ll/ozh;->k:Landroidx/recyclerview/widget/RecyclerView;

    .line 71
    .line 72
    invoke-virtual {p0, v3}, Landroidx/recyclerview/widget/RecyclerView;->setClipToPadding(Z)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method private synthetic v(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ozh;->E()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic w(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ozh;->E()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/data/Emotion;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object p0, p0, Ll/ozh;->h:Lv/AutoVDraweeView;

    .line 5
    .line 6
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Emotion;->emojiUrl:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-virtual {p0, p1, v0}, Lv/AutoVDraweeView;->x(Ljava/lang/String;I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public B(Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v1, p0, Ll/ozh;->n:Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;

    .line 9
    .line 10
    iput-object v0, v1, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;->h:Lcom/p1/mobile/putong/data/Emotion;

    .line 11
    .line 12
    iget-object v1, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->textTheme:Lcom/p1/mobile/putong/data/TextTheme;

    .line 13
    .line 14
    iget-object v1, v1, Lcom/p1/mobile/putong/data/TextTheme;->backgroundColor:Ljava/util/List;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Emotion;->backgroundColor:Ljava/util/List;

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ll/ozh;->A(Lcom/p1/mobile/putong/data/Emotion;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->value:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    iget-object p0, p0, Ll/ozh;->i:Lv/VEditText;

    .line 30
    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->value:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 34
    .line 35
    .line 36
    :cond_1
    :goto_0
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public final E()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ozh;->n:Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/api/api/Network;->isConnected(Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string p0, "\u7f51\u7edc\u5f02\u5e38"

    .line 10
    .line 11
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-static {}, Ll/mrb0;->C()Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isJailedOrRestrict()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    invoke-static {}, Ll/orb0;->I()V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    iget-object v0, p0, Ll/ozh;->n:Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;

    .line 30
    .line 31
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;->h:Lcom/p1/mobile/putong/data/Emotion;

    .line 32
    .line 33
    if-nez v1, :cond_2

    .line 34
    .line 35
    return-void

    .line 36
    :cond_2
    const-string v1, "source_page"

    .line 37
    .line 38
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;->l:Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {v1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    filled-new-array {v0}, [Ll/pf60;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    const-string v1, "e_set_my_state_post"

    .line 49
    .line 50
    const-string v2, "p_set_my_state_post"

    .line 51
    .line 52
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 53
    .line 54
    .line 55
    new-instance v0, Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 56
    .line 57
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/BubbleInfo;-><init>()V

    .line 58
    .line 59
    .line 60
    iget-object v1, p0, Ll/ozh;->i:Lv/VEditText;

    .line 61
    .line 62
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 71
    .line 72
    .line 73
    move-result v2

    .line 74
    if-nez v2, :cond_3

    .line 75
    .line 76
    iput-object v1, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->value:Ljava/lang/String;

    .line 77
    .line 78
    :cond_3
    iget-object v2, p0, Ll/ozh;->n:Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;

    .line 79
    .line 80
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;->h:Lcom/p1/mobile/putong/data/Emotion;

    .line 81
    .line 82
    iput-object v2, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 83
    .line 84
    new-instance v2, Lcom/p1/mobile/putong/data/TextTheme;

    .line 85
    .line 86
    invoke-direct {v2}, Lcom/p1/mobile/putong/data/TextTheme;-><init>()V

    .line 87
    .line 88
    .line 89
    iget-object v3, p0, Ll/ozh;->n:Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;

    .line 90
    .line 91
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;->h:Lcom/p1/mobile/putong/data/Emotion;

    .line 92
    .line 93
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Emotion;->backgroundColor:Ljava/util/List;

    .line 94
    .line 95
    iput-object v3, v2, Lcom/p1/mobile/putong/data/TextTheme;->backgroundColor:Ljava/util/List;

    .line 96
    .line 97
    invoke-static {}, Ll/cmg;->E()Z

    .line 98
    .line 99
    .line 100
    move-result v3

    .line 101
    if-eqz v3, :cond_4

    .line 102
    .line 103
    iget-object v3, p0, Ll/ozh;->n:Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;

    .line 104
    .line 105
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;->h:Lcom/p1/mobile/putong/data/Emotion;

    .line 106
    .line 107
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Emotion;->iconColor:Ljava/util/List;

    .line 108
    .line 109
    iput-object v3, v2, Lcom/p1/mobile/putong/data/TextTheme;->iconColor:Ljava/util/List;

    .line 110
    .line 111
    :cond_4
    iput-object v2, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->textTheme:Lcom/p1/mobile/putong/data/TextTheme;

    .line 112
    .line 113
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 114
    .line 115
    .line 116
    move-result v2

    .line 117
    if-nez v2, :cond_5

    .line 118
    .line 119
    iget-object v2, p0, Ll/ozh;->m:Ll/izh;

    .line 120
    .line 121
    new-instance v3, Ll/mzh;

    .line 122
    .line 123
    invoke-direct {v3, p0, v0}, Ll/mzh;-><init>(Ll/ozh;Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v2, v1, v3}, Ll/izh;->g0(Ljava/lang/String;Ll/x20;)V

    .line 127
    .line 128
    .line 129
    return-void

    .line 130
    :cond_5
    invoke-virtual {p0, v0}, Ll/ozh;->z(Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 131
    .line 132
    .line 133
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ozh;->n:Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;

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
    .locals 0

    .line 1
    if-gtz p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput-boolean p1, p0, Ll/ozh;->p:Z

    .line 5
    .line 6
    iget-object p0, p0, Ll/ozh;->j:Landroid/widget/TextView;

    .line 7
    .line 8
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    const/4 p1, 0x1

    .line 13
    iput-boolean p1, p0, Ll/ozh;->p:Z

    .line 14
    .line 15
    iget-object p2, p0, Ll/ozh;->j:Landroid/widget/TextView;

    .line 16
    .line 17
    iget-object p0, p0, Ll/ozh;->i:Lv/VEditText;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    xor-int/2addr p0, p1

    .line 36
    invoke-static {p2, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/izh;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ozh;->p(Ll/izh;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ozh;->m(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p2, p0, Ll/ozh;->f:Lv/VText;

    .line 6
    .line 7
    invoke-virtual {p2}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-direct {p0}, Ll/ozh;->s()V

    .line 18
    .line 19
    .line 20
    invoke-direct {p0}, Ll/ozh;->C()V

    .line 21
    .line 22
    .line 23
    invoke-direct {p0}, Ll/ozh;->u()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ll/ozh;->n()V

    .line 27
    .line 28
    .line 29
    return-object p1
.end method

.method public m(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/pzh;->b(Ll/ozh;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public n()V
    .locals 2

    .line 1
    new-instance v0, Ll/f0r;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ozh;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Ll/f0r;-><init>(Landroid/app/Activity;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ll/f0r;->g(Ll/d0r;)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/ozh;->n:Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    new-instance v1, Ll/kqg;

    .line 24
    .line 25
    invoke-direct {v1, v0}, Ll/kqg;-><init>(Ll/f0r;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public p(Ll/izh;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ozh;->m:Ll/izh;

    .line 2
    .line 3
    return-void
.end method

.method public q()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ozh;->o:Ll/rzh;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ozh;->m:Ll/izh;

    .line 4
    .line 5
    iget-object p0, p0, Ll/izh;->b:Ljava/util/List;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Ll/rzh;->M(Ljava/util/List;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic x(Lcom/p1/mobile/putong/data/Emotion;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ozh;->n:Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;

    .line 2
    .line 3
    iput-object p1, v0, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;->h:Lcom/p1/mobile/putong/data/Emotion;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/ozh;->A(Lcom/p1/mobile/putong/data/Emotion;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic y(Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ozh;->z(Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public z(Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ozh;->n:Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;

    .line 2
    .line 3
    iget-object v1, p0, Ll/ozh;->i:Lv/VEditText;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/ozh;->m:Ll/izh;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ll/izh;->k0(Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/ozh;->n:Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->finish()V

    .line 16
    .line 17
    .line 18
    return-void
.end method
