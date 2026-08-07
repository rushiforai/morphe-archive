.class public Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Lv/VRecyclerView;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Ll/ig0;

.field public i:Ll/ye0;

.field public j:Ljava/lang/String;

.field public k:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 6
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 7
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;->a0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;->Z(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic R(Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;->Y(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static bridge synthetic S(Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;)Ll/ig0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;->h:Ll/ig0;

    return-object p0
.end method

.method public static bridge synthetic T(Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;)Ll/ye0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;->i:Ll/ye0;

    return-object p0
.end method

.method public static bridge synthetic V(Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;->j:Ljava/lang/String;

    return-void
.end method

.method public static bridge synthetic W(Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;->k:I

    return-void
.end method

.method private synthetic Y(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;->i:Ll/ye0;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/ye0;->J()V

    .line 10
    .line 11
    .line 12
    sget p0, Lcom/p1/mobile/putong/core/R$string;->j9:I

    .line 13
    .line 14
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    sget p0, Lcom/p1/mobile/putong/core/R$string;->r4:I

    .line 19
    .line 20
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private synthetic Z(Landroid/view/View;)V
    .locals 2

    .line 1
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;->k:I

    .line 2
    .line 3
    add-int/lit8 p1, p1, 0x1

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string v0, "intl_ai_photo_no"

    .line 10
    .line 11
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    filled-new-array {p1}, [Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    const-string v0, "e_intl_ai_photo_replace"

    .line 20
    .line 21
    const-string v1, "p_intl_ai_photo_result"

    .line 22
    .line 23
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;->i:Ll/ye0;

    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;->j:Ljava/lang/String;

    .line 29
    .line 30
    new-instance v1, Ll/mg0;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/mg0;-><init>(Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1, v0, v1}, Ll/ye0;->c0(Ljava/lang/String;Ll/y20;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method private synthetic a0(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_intl_ai_photo_restart_btn"

    .line 2
    .line 3
    const-string v0, "p_intl_ai_photo_result"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;->i:Ll/ye0;

    .line 9
    .line 10
    invoke-virtual {p1}, Ll/ye0;->l0()Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    sget p0, Lcom/p1/mobile/putong/core/R$string;->k9:I

    .line 17
    .line 18
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;->i:Ll/ye0;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/ye0;->d0()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private r()V
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NotifyDataSetChanged"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/ig0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/ig0;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;->h:Ll/ig0;

    .line 7
    .line 8
    new-instance v0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const/4 v2, 0x2

    .line 15
    invoke-direct {v0, v1, v2}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;->e:Lv/VRecyclerView;

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;->e:Lv/VRecyclerView;

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;->h:Ll/ig0;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;->h:Ll/ig0;

    .line 31
    .line 32
    new-instance v1, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView$a;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView$a;-><init>(Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ll/ig0;->K(Ll/ig0$a;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;->f:Lv/VText;

    .line 41
    .line 42
    new-instance v1, Ll/kg0;

    .line 43
    .line 44
    invoke-direct {v1, p0}, Ll/kg0;-><init>(Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;)V

    .line 45
    .line 46
    .line 47
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;->g:Lv/VText;

    .line 51
    .line 52
    new-instance v1, Ll/lg0;

    .line 53
    .line 54
    invoke-direct {v1, p0}, Ll/lg0;-><init>(Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;)V

    .line 55
    .line 56
    .line 57
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method


# virtual methods
.method public final X(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ng0;->a(Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b0(Lcom/p1/mobile/putong/core/data/AiAlbumFinishedData;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;->h:Ll/ig0;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/ig0;->M(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;->f:Lv/VText;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;->h:Ll/ig0;

    .line 15
    .line 16
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/AiAlbumFinishedData;->images:Ljava/util/List;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ll/ig0;->L(Ljava/util/List;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;->X(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setPresenter(Ll/ye0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;->i:Ll/ye0;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultView;->r()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
