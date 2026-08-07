.class public Ll/edm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/tcm;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public b:Lv/VFrame;

.field public c:Lv/VImage;

.field public d:Lv/VText;

.field public e:Landroid/widget/LinearLayout;

.field public f:Landroidx/recyclerview/widget/RecyclerView;

.field public g:Landroid/widget/RelativeLayout;

.field public h:Lv/VText;

.field public i:Landroid/widget/RelativeLayout;

.field public j:Lv/VText;

.field public k:Landroidx/recyclerview/widget/RecyclerView;

.field public l:Lv/VButton;

.field public final m:Lcom/p1/mobile/putong/core/ui/messages/question/IceBreakingQuestionEditAct;

.field public n:Ll/tcm;

.field public final o:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/nwb0;",
            ">;"
        }
    .end annotation
.end field

.field public final p:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/nwb0;",
            ">;"
        }
    .end annotation
.end field

.field public q:Ll/qwb0;

.field public r:Ll/qwb0;

.field public s:I

.field public final t:Landroid/graphics/Paint;

.field public final u:Landroid/graphics/Rect;

.field public v:Ll/kcm;

.field public w:I

.field public final x:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/question/IceBreakingQuestionEditAct;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

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
    iput-object v0, p0, Ll/edm;->o:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/edm;->p:Ljava/util/List;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput v0, p0, Ll/edm;->s:I

    .line 20
    .line 21
    new-instance v0, Landroid/graphics/Paint;

    .line 22
    .line 23
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Ll/edm;->t:Landroid/graphics/Paint;

    .line 27
    .line 28
    new-instance v1, Landroid/graphics/Rect;

    .line 29
    .line 30
    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object v1, p0, Ll/edm;->u:Landroid/graphics/Rect;

    .line 34
    .line 35
    new-instance v1, Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object v1, p0, Ll/edm;->x:Ljava/util/List;

    .line 41
    .line 42
    iput-object p1, p0, Ll/edm;->m:Lcom/p1/mobile/putong/core/ui/messages/question/IceBreakingQuestionEditAct;

    .line 43
    .line 44
    const/16 p0, 0xe

    .line 45
    .line 46
    invoke-static {p0}, Ll/qa00;->f(I)I

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    int-to-float p0, p0

    .line 51
    invoke-virtual {v0, p0}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method private synthetic F(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/edm;->m:Lcom/p1/mobile/putong/core/ui/messages/question/IceBreakingQuestionEditAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/question/IceBreakingQuestionEditAct;->finish()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic G(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/edm;->n:Ll/tcm;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/tcm;->s0()Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic H(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/edm;->L()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic I(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/edm;->K()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ll/edm;Ljava/lang/Integer;Ll/nwb0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/edm;->C(Ljava/lang/Integer;Ll/nwb0;)V

    return-void
.end method

.method public static synthetic b(Ll/edm;Ljava/lang/Integer;Ll/nwb0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/edm;->E(Ljava/lang/Integer;Ll/nwb0;)V

    return-void
.end method

.method public static synthetic c(Ljava/util/List;Ll/nwb0;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/nwb0;->a()Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic d(Ll/nwb0;Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;->content:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/nwb0;->a()Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;->content:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static synthetic e(Ll/edm;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/edm;->B()V

    return-void
.end method

.method public static synthetic f(Ll/edm;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/edm;->F(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i(Ll/edm;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/edm;->G(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic j(Ll/edm;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/edm;->H(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k(Ll/edm;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/edm;->J()V

    return-void
.end method

.method public static synthetic l(Ll/edm;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/edm;->I(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final A()V
    .locals 4

    .line 1
    new-instance v0, Ll/qwb0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/edm;->p:Ljava/util/List;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/qwb0;-><init>(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Ll/edm;->r:Ll/qwb0;

    .line 9
    .line 10
    new-instance v1, Ll/ucm;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/ucm;-><init>(Ll/edm;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ll/qwb0;->L(Ll/z20;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/edm;->k:Landroidx/recyclerview/widget/RecyclerView;

    .line 19
    .line 20
    new-instance v1, Ll/iuf0;

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    sget v3, Ll/qa00;->j:I

    .line 24
    .line 25
    invoke-direct {v1, v2, v2, v3, v3}, Ll/iuf0;-><init>(IIII)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/edm;->k:Landroidx/recyclerview/widget/RecyclerView;

    .line 32
    .line 33
    iget-object p0, p0, Ll/edm;->r:Ll/qwb0;

    .line 34
    .line 35
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final synthetic B()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/edm;->v:Ll/kcm;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/kcm;->c()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ll/edm;->m:Lcom/p1/mobile/putong/core/ui/messages/question/IceBreakingQuestionEditAct;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic C(Ljava/lang/Integer;Ll/nwb0;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object v0, p0, Ll/edm;->o:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Ll/nwb0;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p1, v0}, Ll/nwb0;->d(Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/edm;->q:Ll/qwb0;

    .line 18
    .line 19
    iget-object v1, p0, Ll/edm;->o:Ljava/util/List;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ll/qwb0;->M(Ljava/util/List;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/edm;->g:Landroid/widget/RelativeLayout;

    .line 25
    .line 26
    const/4 v1, 0x1

    .line 27
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ll/edm;->y()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Ll/edm;->O()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p2}, Ll/nwb0;->c()Z

    .line 37
    .line 38
    .line 39
    move-result p2

    .line 40
    if-nez p2, :cond_0

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    iget-object p2, p0, Ll/edm;->p:Ljava/util/List;

    .line 44
    .line 45
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Ll/edm;->r:Ll/qwb0;

    .line 49
    .line 50
    if-eqz p1, :cond_1

    .line 51
    .line 52
    iget-object p0, p0, Ll/edm;->p:Ljava/util/List;

    .line 53
    .line 54
    invoke-virtual {p1, p0}, Ll/qwb0;->M(Ljava/util/List;)V

    .line 55
    .line 56
    .line 57
    :cond_1
    :goto_0
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/edm;->m:Lcom/p1/mobile/putong/core/ui/messages/question/IceBreakingQuestionEditAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic E(Ljava/lang/Integer;Ll/nwb0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/edm;->o:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x3

    .line 8
    if-lt v0, v1, :cond_0

    .line 9
    .line 10
    const-string p0, "\u6700\u591a\u8bbe\u7f6e3\u4e2a\u8bdd\u9898"

    .line 11
    .line 12
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-virtual {p2}, Ll/nwb0;->a()Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;->content:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p0, p2}, Ll/edm;->u(Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    if-eqz p2, :cond_1

    .line 27
    .line 28
    const-string p0, "\u65b0\u7684\u95ee\u9898\u4e0d\u80fd\u548c\u5df2\u6709\u7684\u91cd\u590d"

    .line 29
    .line 30
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    iget-object p2, p0, Ll/edm;->p:Ljava/util/List;

    .line 39
    .line 40
    invoke-interface {p2, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    check-cast p1, Ll/nwb0;

    .line 45
    .line 46
    const/4 p2, 0x1

    .line 47
    invoke-virtual {p1, p2}, Ll/nwb0;->d(Z)V

    .line 48
    .line 49
    .line 50
    iget-object p2, p0, Ll/edm;->o:Ljava/util/List;

    .line 51
    .line 52
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Ll/edm;->r:Ll/qwb0;

    .line 56
    .line 57
    iget-object p2, p0, Ll/edm;->p:Ljava/util/List;

    .line 58
    .line 59
    invoke-virtual {p1, p2}, Ll/qwb0;->M(Ljava/util/List;)V

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Ll/edm;->q:Ll/qwb0;

    .line 63
    .line 64
    iget-object p2, p0, Ll/edm;->o:Ljava/util/List;

    .line 65
    .line 66
    invoke-virtual {p1, p2}, Ll/qwb0;->M(Ljava/util/List;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0}, Ll/edm;->O()V

    .line 70
    .line 71
    .line 72
    iget-object p1, p0, Ll/edm;->o:Ljava/util/List;

    .line 73
    .line 74
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    if-lt p1, v1, :cond_2

    .line 79
    .line 80
    iget-object p1, p0, Ll/edm;->m:Lcom/p1/mobile/putong/core/ui/messages/question/IceBreakingQuestionEditAct;

    .line 81
    .line 82
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 83
    .line 84
    .line 85
    iget-object p0, p0, Ll/edm;->g:Landroid/widget/RelativeLayout;

    .line 86
    .line 87
    const/4 p1, 0x0

    .line 88
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 89
    .line 90
    .line 91
    :cond_2
    return-void
.end method

.method public final synthetic J()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/edm;->v:Ll/kcm;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/kcm;->d()Ljava/lang/CharSequence;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ll/edm;->v(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/edm;->v:Ll/kcm;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget v1, Ll/edc0;->E0:I

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Landroid/widget/EditText;

    .line 26
    .line 27
    const-string v1, ""

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    invoke-virtual {p0}, Ll/edm;->y()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final K()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/edm;->r:Ll/qwb0;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ll/edm;->x:Ljava/util/List;

    .line 6
    .line 7
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v0, p0, Ll/edm;->x:Ljava/util/List;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ll/edm;->n(Ljava/util/List;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/edm;->r:Ll/qwb0;

    .line 20
    .line 21
    iget-object p0, p0, Ll/edm;->p:Ljava/util/List;

    .line 22
    .line 23
    invoke-virtual {v0, p0}, Ll/qwb0;->M(Ljava/util/List;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    :goto_0
    return-void
.end method

.method public final L()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/edm;->v:Ll/kcm;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/kcm;

    .line 6
    .line 7
    iget-object v1, p0, Ll/edm;->m:Lcom/p1/mobile/putong/core/ui/messages/question/IceBreakingQuestionEditAct;

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ll/kcm;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/edm;->v:Ll/kcm;

    .line 13
    .line 14
    new-instance v1, Ll/bdm;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/bdm;-><init>(Ll/edm;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object v0, p0, Ll/edm;->v:Ll/kcm;

    .line 23
    .line 24
    iget-object v1, p0, Ll/edm;->g:Landroid/widget/RelativeLayout;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ll/kcm;->g(Landroid/view/View;)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Ll/edm;->g:Landroid/widget/RelativeLayout;

    .line 30
    .line 31
    const/4 v0, 0x0

    .line 32
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public M(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;",
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
    if-nez v0, :cond_2

    .line 6
    .line 7
    iget v0, p0, Ll/edm;->s:I

    .line 8
    .line 9
    if-gtz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p0, Ll/edm;->x:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/edm;->x:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput v0, p0, Ll/edm;->w:I

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Ll/edm;->n(Ljava/util/List;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Ll/edm;->r:Ll/qwb0;

    .line 29
    .line 30
    if-nez p1, :cond_1

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/edm;->A()V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    iget-object p0, p0, Ll/edm;->p:Ljava/util/List;

    .line 37
    .line 38
    invoke-virtual {p1, p0}, Ll/qwb0;->M(Ljava/util/List;)V

    .line 39
    .line 40
    .line 41
    :cond_2
    :goto_0
    return-void
.end method

.method public N(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/edm;->o:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v1, 0x0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;

    .line 22
    .line 23
    new-instance v2, Ll/nwb0;

    .line 24
    .line 25
    const/4 v3, 0x1

    .line 26
    invoke-direct {v2, v0, v3, v1}, Ll/nwb0;-><init>(Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;ZZ)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/edm;->o:Ljava/util/List;

    .line 30
    .line 31
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    iget-object p1, p0, Ll/edm;->o:Ljava/util/List;

    .line 36
    .line 37
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    const/4 v0, 0x3

    .line 42
    if-lt p1, v0, :cond_1

    .line 43
    .line 44
    iget-object p1, p0, Ll/edm;->g:Landroid/widget/RelativeLayout;

    .line 45
    .line 46
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    :cond_1
    invoke-static {}, Ll/bnl0;->w0()I

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    invoke-static {}, Ll/bnl0;->F0()I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    sub-int/2addr p1, v0

    .line 58
    const v0, 0x43ca8000    # 405.0f

    .line 59
    .line 60
    .line 61
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    sub-int/2addr p1, v0

    .line 66
    iput p1, p0, Ll/edm;->s:I

    .line 67
    .line 68
    iget-object p1, p0, Ll/edm;->q:Ll/qwb0;

    .line 69
    .line 70
    if-nez p1, :cond_2

    .line 71
    .line 72
    invoke-virtual {p0}, Ll/edm;->z()V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_2
    iget-object p0, p0, Ll/edm;->o:Ljava/util/List;

    .line 77
    .line 78
    invoke-virtual {p1, p0}, Ll/qwb0;->M(Ljava/util/List;)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public final O()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/g;->ao()Lcom/p1/mobile/putong/core/data/ChatProfile;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ChatProfile;->iceBreakingQuestions:Ljava/util/List;

    .line 18
    .line 19
    :goto_0
    new-instance v1, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    iget-object v2, p0, Ll/edm;->o:Ljava/util/List;

    .line 25
    .line 26
    new-instance v3, Ll/adm;

    .line 27
    .line 28
    invoke-direct {v3, v1}, Ll/adm;-><init>(Ljava/util/List;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v2, v3}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v1, v0}, Ll/e39;->a(Ljava/util/List;Ljava/util/List;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    iget-object v1, p0, Ll/edm;->l:Lv/VButton;

    .line 39
    .line 40
    xor-int/lit8 v2, v0, 0x1

    .line 41
    .line 42
    invoke-virtual {v1, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Ll/edm;->l:Lv/VButton;

    .line 46
    .line 47
    if-nez v0, :cond_1

    .line 48
    .line 49
    const/high16 v0, 0x3f800000    # 1.0f

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_1
    const v0, 0x3ecccccd    # 0.4f

    .line 53
    .line 54
    .line 55
    :goto_1
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 56
    .line 57
    .line 58
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
    check-cast p1, Ll/tcm;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/edm;->p(Ll/tcm;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/edm;->m(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public m(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/fdm;->b(Ll/edm;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final n(Ljava/util/List;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/edm;->p:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget v0, p0, Ll/edm;->s:I

    .line 7
    .line 8
    iget-object v1, p0, Ll/edm;->o:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const/4 v2, 0x0

    .line 15
    move v3, v2

    .line 16
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v4

    .line 20
    if-eqz v4, :cond_0

    .line 21
    .line 22
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    check-cast v4, Ll/nwb0;

    .line 27
    .line 28
    invoke-virtual {v4}, Ll/nwb0;->a()Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;->content:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {p0, v4}, Ll/edm;->q(Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    add-int/2addr v3, v4

    .line 39
    goto :goto_0

    .line 40
    :cond_0
    const/high16 v1, 0x43260000    # 166.0f

    .line 41
    .line 42
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-le v3, v1, :cond_1

    .line 47
    .line 48
    sub-int/2addr v3, v1

    .line 49
    sub-int/2addr v0, v3

    .line 50
    :cond_1
    move v1, v2

    .line 51
    :goto_1
    if-ge v1, v0, :cond_3

    .line 52
    .line 53
    iget v3, p0, Ll/edm;->w:I

    .line 54
    .line 55
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    check-cast v3, Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;

    .line 60
    .line 61
    iget-object v4, v3, Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;->content:Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {p0, v4}, Ll/edm;->q(Ljava/lang/String;)I

    .line 64
    .line 65
    .line 66
    move-result v4

    .line 67
    add-int/2addr v1, v4

    .line 68
    if-le v1, v0, :cond_2

    .line 69
    .line 70
    goto :goto_2

    .line 71
    :cond_2
    iget v4, p0, Ll/edm;->w:I

    .line 72
    .line 73
    const/4 v5, 0x1

    .line 74
    add-int/2addr v4, v5

    .line 75
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 76
    .line 77
    .line 78
    move-result v6

    .line 79
    rem-int/2addr v4, v6

    .line 80
    iput v4, p0, Ll/edm;->w:I

    .line 81
    .line 82
    new-instance v4, Ll/nwb0;

    .line 83
    .line 84
    invoke-direct {v4, v3, v2, v5}, Ll/nwb0;-><init>(Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;ZZ)V

    .line 85
    .line 86
    .line 87
    iget-object v3, p0, Ll/edm;->p:Ljava/util/List;

    .line 88
    .line 89
    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    goto :goto_1

    .line 93
    :cond_3
    :goto_2
    return-void
.end method

.method public p(Ll/tcm;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/edm;->n:Ll/tcm;

    .line 2
    .line 3
    return-void
.end method

.method public final q(Ljava/lang/String;)I
    .locals 4

    .line 1
    iget-object v0, p0, Ll/edm;->u:Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/Rect;->setEmpty()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/edm;->t:Landroid/graphics/Paint;

    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    iget-object v2, p0, Ll/edm;->u:Landroid/graphics/Rect;

    .line 13
    .line 14
    const/4 v3, 0x0

    .line 15
    invoke-virtual {v0, p1, v3, v1, v2}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ll/edm;->u:Landroid/graphics/Rect;

    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    invoke-static {}, Ll/bnl0;->y0()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    const/high16 v1, 0x42c80000    # 100.0f

    .line 29
    .line 30
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    sub-int/2addr v0, v1

    .line 35
    div-int/2addr p1, v0

    .line 36
    add-int/lit8 p1, p1, 0x1

    .line 37
    .line 38
    iget-object p0, p0, Ll/edm;->u:Landroid/graphics/Rect;

    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    mul-int/2addr p0, p1

    .line 45
    sget p1, Ll/qa00;->x:I

    .line 46
    .line 47
    add-int/2addr p0, p1

    .line 48
    return p0
.end method

.method public r()V
    .locals 5

    .line 1
    new-instance v0, Landroid/text/SpannableString;

    .line 2
    .line 3
    const-string v1, "\u8bbe\u7f6e 3 \u4e2a\u4f60\u611f\u5174\u8da3\u7684\u95ee\u9898"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    new-instance v1, Landroid/text/style/ForegroundColorSpan;

    .line 9
    .line 10
    const v2, -0xabcb

    .line 11
    .line 12
    .line 13
    invoke-direct {v1, v2}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 14
    .line 15
    .line 16
    const/4 v2, 0x4

    .line 17
    const/16 v3, 0x21

    .line 18
    .line 19
    const/4 v4, 0x2

    .line 20
    invoke-virtual {v0, v1, v4, v2, v3}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Ll/edm;->d:Lv/VText;

    .line 24
    .line 25
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/edm;->l:Lv/VButton;

    .line 29
    .line 30
    const/4 v1, 0x0

    .line 31
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/edm;->l:Lv/VButton;

    .line 35
    .line 36
    const v1, 0x3ecccccd    # 0.4f

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Ll/edm;->c:Lv/VImage;

    .line 43
    .line 44
    new-instance v1, Ll/wcm;

    .line 45
    .line 46
    invoke-direct {v1, p0}, Ll/wcm;-><init>(Ll/edm;)V

    .line 47
    .line 48
    .line 49
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ll/edm;->l:Lv/VButton;

    .line 53
    .line 54
    new-instance v1, Ll/xcm;

    .line 55
    .line 56
    invoke-direct {v1, p0}, Ll/xcm;-><init>(Ll/edm;)V

    .line 57
    .line 58
    .line 59
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Ll/edm;->g:Landroid/widget/RelativeLayout;

    .line 63
    .line 64
    new-instance v1, Ll/ycm;

    .line 65
    .line 66
    invoke-direct {v1, p0}, Ll/ycm;-><init>(Ll/edm;)V

    .line 67
    .line 68
    .line 69
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Ll/edm;->j:Lv/VText;

    .line 73
    .line 74
    new-instance v1, Ll/zcm;

    .line 75
    .line 76
    invoke-direct {v1, p0}, Ll/zcm;-><init>(Ll/edm;)V

    .line 77
    .line 78
    .line 79
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public final s(Ljava/lang/String;)I
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

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
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    sget-object v0, Ll/uqb0;->Z:Ll/a4j;

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ll/a4j;->K(Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_3

    .line 20
    .line 21
    sget-object v0, Ll/uqb0;->Z:Ll/a4j;

    .line 22
    .line 23
    invoke-virtual {v0, p1}, Ll/a4j;->P(Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    invoke-virtual {p0, p1}, Ll/edm;->u(Ljava/lang/String;)Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-eqz p0, :cond_2

    .line 35
    .line 36
    const/4 p0, 0x2

    .line 37
    return p0

    .line 38
    :cond_2
    const/4 p0, 0x0

    .line 39
    return p0

    .line 40
    :cond_3
    :goto_0
    const/4 p0, 0x3

    .line 41
    return p0
.end method

.method public final u(Ljava/lang/String;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/edm;->o:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object p0, p0, Ll/edm;->o:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Ll/nwb0;

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/nwb0;->a()Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;->content:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_0

    .line 38
    .line 39
    const/4 p0, 0x1

    .line 40
    return p0

    .line 41
    :cond_1
    const/4 p0, 0x0

    .line 42
    return p0
.end method

.method public final v(Ljava/lang/CharSequence;)Z
    .locals 5

    .line 1
    iget-object v0, p0, Ll/edm;->g:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/edm;->g:Landroid/widget/RelativeLayout;

    .line 8
    .line 9
    new-instance v2, Ll/ddm;

    .line 10
    .line 11
    invoke-direct {v2, p0}, Ll/ddm;-><init>(Ll/edm;)V

    .line 12
    .line 13
    .line 14
    const-wide/16 v3, 0x28

    .line 15
    .line 16
    invoke-virtual {v0, v2, v3, v4}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 17
    .line 18
    .line 19
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    const/4 v2, 0x0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    return v2

    .line 27
    :cond_0
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p0, p1}, Ll/edm;->s(Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    const/4 v3, 0x3

    .line 36
    if-eqz v0, :cond_3

    .line 37
    .line 38
    const/4 p0, 0x2

    .line 39
    if-ne v0, p0, :cond_1

    .line 40
    .line 41
    const-string p0, "\u65b0\u7684\u95ee\u9898\u4e0d\u80fd\u548c\u5df2\u6709\u7684\u91cd\u590d"

    .line 42
    .line 43
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    if-ne v0, v3, :cond_2

    .line 48
    .line 49
    const-string p0, "\u8bf7\u4fee\u6539\u5185\u5bb9\u540e\u91cd\u8bd5"

    .line 50
    .line 51
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    :cond_2
    :goto_0
    return v2

    .line 55
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;->new_()Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iput-object p1, v0, Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;->content:Ljava/lang/String;

    .line 60
    .line 61
    new-instance p1, Ll/nwb0;

    .line 62
    .line 63
    invoke-direct {p1, v0, v1, v2}, Ll/nwb0;-><init>(Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;ZZ)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Ll/edm;->o:Ljava/util/List;

    .line 67
    .line 68
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    iget-object p1, p0, Ll/edm;->q:Ll/qwb0;

    .line 72
    .line 73
    if-nez p1, :cond_4

    .line 74
    .line 75
    invoke-virtual {p0}, Ll/edm;->z()V

    .line 76
    .line 77
    .line 78
    :cond_4
    iget-object p1, p0, Ll/edm;->q:Ll/qwb0;

    .line 79
    .line 80
    iget-object v0, p0, Ll/edm;->o:Ljava/util/List;

    .line 81
    .line 82
    invoke-virtual {p1, v0}, Ll/qwb0;->M(Ljava/util/List;)V

    .line 83
    .line 84
    .line 85
    iget-object p1, p0, Ll/edm;->m:Lcom/p1/mobile/putong/core/ui/messages/question/IceBreakingQuestionEditAct;

    .line 86
    .line 87
    if-eqz p1, :cond_5

    .line 88
    .line 89
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 90
    .line 91
    .line 92
    :cond_5
    invoke-virtual {p0}, Ll/edm;->O()V

    .line 93
    .line 94
    .line 95
    iget-object p1, p0, Ll/edm;->g:Landroid/widget/RelativeLayout;

    .line 96
    .line 97
    iget-object p0, p0, Ll/edm;->o:Ljava/util/List;

    .line 98
    .line 99
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 100
    .line 101
    .line 102
    move-result p0

    .line 103
    if-ge p0, v3, :cond_6

    .line 104
    .line 105
    move v2, v1

    .line 106
    :cond_6
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 107
    .line 108
    .line 109
    return v1
.end method

.method public w()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/edm;->o:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-eqz v2, :cond_1

    .line 17
    .line 18
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    check-cast v2, Ll/nwb0;

    .line 23
    .line 24
    invoke-static {}, Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;->new_()Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    iget-object v4, p0, Ll/edm;->x:Ljava/util/List;

    .line 29
    .line 30
    new-instance v5, Ll/cdm;

    .line 31
    .line 32
    invoke-direct {v5, v2}, Ll/cdm;-><init>(Ll/nwb0;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v4, v5}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    check-cast v4, Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;

    .line 40
    .line 41
    if-nez v4, :cond_0

    .line 42
    .line 43
    const-string v4, "0"

    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_0
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;->id:Ljava/lang/String;

    .line 47
    .line 48
    :goto_1
    iput-object v4, v3, Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;->id:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v2}, Ll/nwb0;->a()Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;->content:Ljava/lang/String;

    .line 55
    .line 56
    iput-object v2, v3, Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;->content:Ljava/lang/String;

    .line 57
    .line 58
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    return-object v0
.end method

.method public x()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/edm;->l:Lv/VButton;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->isEnabled()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public y()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/edm;->h:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/edm;->O()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final z()V
    .locals 4

    .line 1
    new-instance v0, Ll/qwb0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/edm;->o:Ljava/util/List;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/qwb0;-><init>(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Ll/edm;->q:Ll/qwb0;

    .line 9
    .line 10
    new-instance v1, Ll/vcm;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/vcm;-><init>(Ll/edm;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ll/qwb0;->K(Ll/z20;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/edm;->f:Landroidx/recyclerview/widget/RecyclerView;

    .line 19
    .line 20
    new-instance v1, Ll/iuf0;

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    sget v3, Ll/qa00;->j:I

    .line 24
    .line 25
    invoke-direct {v1, v2, v2, v3, v2}, Ll/iuf0;-><init>(IIII)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/edm;->f:Landroidx/recyclerview/widget/RecyclerView;

    .line 32
    .line 33
    iget-object p0, p0, Ll/edm;->q:Ll/qwb0;

    .line 34
    .line 35
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method
