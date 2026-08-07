.class public Ll/jrj0;
.super Ll/pej0;
.source "SourceFile"


# instance fields
.field public A:Ll/ir40;

.field public B:Ll/xwb0;

.field public C:Ll/l4g0;

.field public D:Ll/l4g0;

.field public E:Ll/l4g0;

.field public f:Lv/VLinear;

.field public g:Lv/VImage;

.field public h:Lv/VDraweeView;

.field public i:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public j:Lv/VText;

.field public k:Lv/VLinear;

.field public l:Lv/VLinear;

.field public m:Lv/VDraweeView;

.field public n:Lv/VText;

.field public o:Lv/VLinear;

.field public p:Lv/VDraweeView;

.field public q:Lv/VText;

.field public r:Lv/VLinear;

.field public s:Lv/VDraweeView;

.field public t:Lv/VText;

.field public u:Lv/VLinear;

.field public v:Landroidx/recyclerview/widget/RecyclerView;

.field public w:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public x:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public final y:Lcom/p1/mobile/android/app/Act;

.field public z:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 4

    .line 1
    sget v0, Ll/agc0;->c:I

    .line 2
    .line 3
    invoke-direct {p0, p1, v0}, Ll/pej0;-><init>(Landroid/content/Context;I)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ll/l4g0;

    .line 7
    .line 8
    const-class v1, Ll/jrj0;

    .line 9
    .line 10
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    const-string v3, "p_action_survey_experience"

    .line 15
    .line 16
    invoke-direct {v0, v3, v2}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/jrj0;->C:Ll/l4g0;

    .line 20
    .line 21
    new-instance v0, Ll/l4g0;

    .line 22
    .line 23
    const-string v2, "p_action_survey_question"

    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-direct {v0, v2, v3}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Ll/jrj0;->D:Ll/l4g0;

    .line 33
    .line 34
    new-instance v0, Ll/l4g0;

    .line 35
    .line 36
    const-string v2, "p_action_survey_feedback"

    .line 37
    .line 38
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-direct {v0, v2, v1}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    iput-object v0, p0, Ll/jrj0;->E:Ll/l4g0;

    .line 46
    .line 47
    const/4 v0, 0x0

    .line 48
    invoke-virtual {p0, v0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCancelable(Z)V

    .line 49
    .line 50
    .line 51
    iput-object p1, p0, Ll/jrj0;->y:Lcom/p1/mobile/android/app/Act;

    .line 52
    .line 53
    return-void
.end method

.method public static synthetic A(Ll/jrj0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jrj0;->f0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic C(Ll/jrj0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jrj0;->e0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic D(Ll/jrj0;Lcom/p1/mobile/putong/core/data/NextQuestionnaire;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/jrj0;->i0(Lcom/p1/mobile/putong/core/data/NextQuestionnaire;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic E(Ll/jrj0;Lcom/p1/mobile/putong/core/data/NextQuestionnaire;Landroid/view/View;Lcom/p1/mobile/putong/core/data/NextQuestionnaireOptions;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/jrj0;->h0(Lcom/p1/mobile/putong/core/data/NextQuestionnaire;Landroid/view/View;Lcom/p1/mobile/putong/core/data/NextQuestionnaireOptions;I)V

    return-void
.end method

.method public static synthetic F(Ll/jrj0;Lcom/p1/mobile/putong/core/data/Questionnaire;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jrj0;->q0(Lcom/p1/mobile/putong/core/data/Questionnaire;)V

    return-void
.end method

.method public static synthetic G(Ll/jrj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jrj0;->b0()V

    return-void
.end method

.method public static synthetic H(Ll/jrj0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jrj0;->g0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic I(Landroid/content/DialogInterface;)V
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
    const-string v1, "UXQuestionnaireBottomSheetDialog"

    .line 7
    .line 8
    invoke-virtual {p0, v0, v1}, Ll/hlh0;->j(ZLjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic J(Ll/jrj0;Lcom/p1/mobile/putong/core/data/Questionnaire;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jrj0;->t0(Lcom/p1/mobile/putong/core/data/Questionnaire;)V

    return-void
.end method

.method public static synthetic K(Ll/jrj0;Lcom/p1/mobile/putong/core/data/Questionnaire;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/jrj0;->o0(Lcom/p1/mobile/putong/core/data/Questionnaire;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic L(Ll/jrj0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jrj0;->j0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic M(Ll/jrj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jrj0;->m0()V

    return-void
.end method

.method public static synthetic N(Ll/jrj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jrj0;->p0()V

    return-void
.end method

.method public static synthetic O(Ll/jrj0;Lcom/p1/mobile/putong/core/data/Questionnaire;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/jrj0;->d0(Lcom/p1/mobile/putong/core/data/Questionnaire;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic P(Landroid/content/DialogInterface;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/hlh0;->a()Ll/hlh0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    const-string v1, "UXQuestionnaireBottomSheetDialog"

    .line 7
    .line 8
    invoke-virtual {p0, v0, v1}, Ll/hlh0;->j(ZLjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic Q(Ll/jrj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jrj0;->s0()V

    return-void
.end method

.method public static synthetic R(Ll/jrj0;Lcom/p1/mobile/putong/core/data/Questionnaire;Landroid/view/View;Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/jrj0;->c0(Lcom/p1/mobile/putong/core/data/Questionnaire;Landroid/view/View;Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;I)V

    return-void
.end method

.method public static synthetic S(Ll/jrj0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jrj0;->l0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic T(Ll/jrj0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jrj0;->k0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic U(Ll/jrj0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jrj0;->v0(Landroid/view/View;)V

    return-void
.end method

.method private Z()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/jrj0;->f:Lv/VLinear;

    .line 6
    .line 7
    new-instance v2, Ll/mqj0;

    .line 8
    .line 9
    invoke-direct {v2, p0}, Ll/mqj0;-><init>(Ll/jrj0;)V

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
    const v1, 0x1020002

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    sget v1, Ll/odc0;->p:I

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Landroid/widget/FrameLayout;

    .line 47
    .line 48
    sget v1, Ll/tbc0;->a0:I

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 51
    .line 52
    .line 53
    invoke-static {v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    new-instance v1, Ll/jrj0$a;

    .line 58
    .line 59
    invoke-direct {v1, p0, v0}, Ll/jrj0$a;-><init>(Ll/jrj0;Lcom/google/android/material/bottomsheet/BottomSheetBehavior;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setBottomSheetCallback(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;)V

    .line 63
    .line 64
    .line 65
    :cond_0
    return-void
.end method

.method private a0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jrj0;->y:Lcom/p1/mobile/android/app/Act;

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
    invoke-virtual {p0, v0, v1}, Ll/jrj0;->V(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0, v0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(Landroid/view/View;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/jrj0;->n:Lv/VText;

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    invoke-static {v1}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/jrj0;->q:Lv/VText;

    .line 26
    .line 27
    invoke-static {v1}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Ll/jrj0;->t:Lv/VText;

    .line 35
    .line 36
    invoke-static {v1}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public static synthetic x(Ll/jrj0;Lcom/p1/mobile/putong/core/data/Questionnaire;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jrj0;->n0(Lcom/p1/mobile/putong/core/data/Questionnaire;)V

    return-void
.end method

.method public static synthetic y(Ll/jrj0;Lcom/p1/mobile/putong/core/data/Questionnaire;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/jrj0;->r0(Lcom/p1/mobile/putong/core/data/Questionnaire;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic z(Ll/jrj0;Lcom/p1/mobile/putong/core/data/Questionnaire;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/jrj0;->u0(Lcom/p1/mobile/putong/core/data/Questionnaire;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public A0(Lcom/p1/mobile/putong/core/data/Questionnaire;)V
    .locals 5

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    const-string v0, "P1"

    .line 5
    .line 6
    iput-object v0, p0, Ll/jrj0;->z:Ljava/lang/String;

    .line 7
    .line 8
    new-instance v0, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Questionnaire;->options:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_1

    .line 24
    .line 25
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;

    .line 30
    .line 31
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;->value:Ljava/lang/String;

    .line 32
    .line 33
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    const-string v1, "-"

    .line 38
    .line 39
    invoke-static {v1, v0}, Ll/du4;->a(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iget-object v1, p0, Ll/jrj0;->D:Ll/l4g0;

    .line 44
    .line 45
    const-string v2, "paper_number"

    .line 46
    .line 47
    iget-object v3, p0, Ll/jrj0;->z:Ljava/lang/String;

    .line 48
    .line 49
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    const-string v3, "experience_question_number"

    .line 54
    .line 55
    iget-object v4, p1, Lcom/p1/mobile/putong/core/data/Questionnaire;->title:Ljava/lang/String;

    .line 56
    .line 57
    invoke-static {v3, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    const-string v4, "action_survey_answer_list"

    .line 62
    .line 63
    invoke-static {v4, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    filled-new-array {v2, v3, v0}, [Ll/pf60;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {v1, v0}, Ll/l4g0;->p([Ll/pf60;)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Ll/jrj0;->D:Ll/l4g0;

    .line 75
    .line 76
    invoke-virtual {v0}, Ll/l4g0;->i()V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Ll/jrj0;->D:Ll/l4g0;

    .line 80
    .line 81
    invoke-virtual {v0}, Ll/l4g0;->l()V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0}, Ll/jrj0;->show()V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Ll/jrj0;->h:Lv/VDraweeView;

    .line 88
    .line 89
    sget v1, Ll/dbc0;->kr:I

    .line 90
    .line 91
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Questionnaire;->title:Ljava/lang/String;

    .line 95
    .line 96
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    if-nez v0, :cond_2

    .line 101
    .line 102
    iget-object v0, p0, Ll/jrj0;->i:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 103
    .line 104
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Questionnaire;->title:Ljava/lang/String;

    .line 105
    .line 106
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 107
    .line 108
    .line 109
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Questionnaire;->description:Ljava/lang/String;

    .line 110
    .line 111
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    if-nez v0, :cond_3

    .line 116
    .line 117
    iget-object v0, p0, Ll/jrj0;->j:Lv/VText;

    .line 118
    .line 119
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Questionnaire;->description:Ljava/lang/String;

    .line 120
    .line 121
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 122
    .line 123
    .line 124
    :cond_3
    iget-object v0, p0, Ll/jrj0;->k:Lv/VLinear;

    .line 125
    .line 126
    const/4 v1, 0x0

    .line 127
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 128
    .line 129
    .line 130
    iget-object v0, p0, Ll/jrj0;->u:Lv/VLinear;

    .line 131
    .line 132
    const/4 v2, 0x1

    .line 133
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 134
    .line 135
    .line 136
    iget-object v0, p0, Ll/jrj0;->x:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 137
    .line 138
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 139
    .line 140
    .line 141
    new-instance v0, Ll/xwb0;

    .line 142
    .line 143
    iget-object v2, p0, Ll/jrj0;->y:Lcom/p1/mobile/android/app/Act;

    .line 144
    .line 145
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/Questionnaire;->options:Ljava/util/List;

    .line 146
    .line 147
    invoke-direct {v0, v2, v3}, Ll/xwb0;-><init>(Landroid/content/Context;Ljava/util/List;)V

    .line 148
    .line 149
    .line 150
    iput-object v0, p0, Ll/jrj0;->B:Ll/xwb0;

    .line 151
    .line 152
    iget-object v0, p0, Ll/jrj0;->v:Landroidx/recyclerview/widget/RecyclerView;

    .line 153
    .line 154
    new-instance v2, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 155
    .line 156
    iget-object v3, p0, Ll/jrj0;->y:Lcom/p1/mobile/android/app/Act;

    .line 157
    .line 158
    invoke-direct {v2, v3}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 162
    .line 163
    .line 164
    iget-object v0, p0, Ll/jrj0;->v:Landroidx/recyclerview/widget/RecyclerView;

    .line 165
    .line 166
    iget-object v2, p0, Ll/jrj0;->B:Ll/xwb0;

    .line 167
    .line 168
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 169
    .line 170
    .line 171
    iget-object v0, p0, Ll/jrj0;->B:Ll/xwb0;

    .line 172
    .line 173
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 174
    .line 175
    .line 176
    invoke-virtual {p0, v1}, Ll/jrj0;->H0(Z)V

    .line 177
    .line 178
    .line 179
    iget-object v0, p0, Ll/jrj0;->B:Ll/xwb0;

    .line 180
    .line 181
    new-instance v1, Ll/crj0;

    .line 182
    .line 183
    invoke-direct {v1, p0, p1}, Ll/crj0;-><init>(Ll/jrj0;Lcom/p1/mobile/putong/core/data/Questionnaire;)V

    .line 184
    .line 185
    .line 186
    invoke-virtual {v0, v1}, Ll/xwb0;->D(Ll/xwb0$b;)V

    .line 187
    .line 188
    .line 189
    iget-object v0, p0, Ll/jrj0;->w:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 190
    .line 191
    new-instance v1, Ll/drj0;

    .line 192
    .line 193
    invoke-direct {v1, p0, p1}, Ll/drj0;-><init>(Ll/jrj0;Lcom/p1/mobile/putong/core/data/Questionnaire;)V

    .line 194
    .line 195
    .line 196
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 197
    .line 198
    .line 199
    iget-object p1, p0, Ll/jrj0;->g:Lv/VImage;

    .line 200
    .line 201
    new-instance v0, Ll/erj0;

    .line 202
    .line 203
    invoke-direct {v0, p0}, Ll/erj0;-><init>(Ll/jrj0;)V

    .line 204
    .line 205
    .line 206
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 207
    .line 208
    .line 209
    return-void
.end method

.method public final B0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/jrj0;->G0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/jrj0;->h:Lv/VDraweeView;

    .line 5
    .line 6
    sget v1, Ll/dbc0;->jr:I

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/jrj0;->i:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 12
    .line 13
    const-string v1, "\u53cd\u9988\u5df2\u6536\u5230\uff01"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/jrj0;->j:Lv/VText;

    .line 19
    .line 20
    const-string v1, "\u6211\u4eec\u5c06\u5c3d\u5feb\u5904\u7406\u4f60\u7684\u53cd\u9988\u548c\u5efa\u8bae\u3002\u5982\u6709\u4efb\u4f55\u4f53\u9a8c\u95ee\u9898\uff0c\u8bf7\u901a\u8fc7\u6211\u7684\u5ba2\u670d\u53d1\u8d77\u54a8\u8be2\u3002"

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/jrj0;->z:Ljava/lang/String;

    .line 26
    .line 27
    const-string v1, "P1"

    .line 28
    .line 29
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    iget-object v1, p0, Ll/jrj0;->x:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 34
    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    const-string v0, "\u7ee7\u7eed\u5212\u5361"

    .line 38
    .line 39
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    const-string v0, "\u77e5\u9053\u4e86"

    .line 44
    .line 45
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 46
    .line 47
    .line 48
    :goto_0
    iget-object v0, p0, Ll/jrj0;->k:Lv/VLinear;

    .line 49
    .line 50
    const/4 v1, 0x0

    .line 51
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ll/jrj0;->u:Lv/VLinear;

    .line 55
    .line 56
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Ll/jrj0;->x:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 60
    .line 61
    const/4 v1, 0x1

    .line 62
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Ll/jrj0;->x:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 66
    .line 67
    new-instance v1, Ll/rqj0;

    .line 68
    .line 69
    invoke-direct {v1, p0}, Ll/rqj0;-><init>(Ll/jrj0;)V

    .line 70
    .line 71
    .line 72
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Ll/jrj0;->g:Lv/VImage;

    .line 76
    .line 77
    new-instance v1, Ll/sqj0;

    .line 78
    .line 79
    invoke-direct {v1, p0}, Ll/sqj0;-><init>(Ll/jrj0;)V

    .line 80
    .line 81
    .line 82
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public C0(Lcom/p1/mobile/putong/core/data/Questionnaire;)V
    .locals 5

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    const-string v0, "P2"

    .line 5
    .line 6
    iput-object v0, p0, Ll/jrj0;->z:Ljava/lang/String;

    .line 7
    .line 8
    new-instance v0, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Questionnaire;->options:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_1

    .line 24
    .line 25
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;

    .line 30
    .line 31
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;->value:Ljava/lang/String;

    .line 32
    .line 33
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    const-string v1, "-"

    .line 38
    .line 39
    invoke-static {v1, v0}, Ll/du4;->a(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iget-object v1, p0, Ll/jrj0;->C:Ll/l4g0;

    .line 44
    .line 45
    const-string v2, "paper_number"

    .line 46
    .line 47
    const-string v3, "p2"

    .line 48
    .line 49
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    const-string v3, "experience_question_number"

    .line 54
    .line 55
    iget-object v4, p1, Lcom/p1/mobile/putong/core/data/Questionnaire;->title:Ljava/lang/String;

    .line 56
    .line 57
    invoke-static {v3, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    const-string v4, "action_survey_answer_list"

    .line 62
    .line 63
    invoke-static {v4, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    filled-new-array {v2, v3, v0}, [Ll/pf60;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {v1, v0}, Ll/l4g0;->p([Ll/pf60;)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Ll/jrj0;->C:Ll/l4g0;

    .line 75
    .line 76
    invoke-virtual {v0}, Ll/l4g0;->i()V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Ll/jrj0;->C:Ll/l4g0;

    .line 80
    .line 81
    invoke-virtual {v0}, Ll/l4g0;->l()V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0}, Ll/jrj0;->show()V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Ll/jrj0;->h:Lv/VDraweeView;

    .line 88
    .line 89
    sget v1, Ll/dbc0;->mr:I

    .line 90
    .line 91
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p0, p1}, Ll/jrj0;->F0(Lcom/p1/mobile/putong/core/data/Questionnaire;)V

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method public final D0(Lcom/p1/mobile/putong/core/data/NextQuestionnaire;)V
    .locals 5

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/NextQuestionnaire;->options:Ljava/util/List;

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
    if-eqz v2, :cond_0

    .line 17
    .line 18
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    check-cast v2, Lcom/p1/mobile/putong/core/data/NextQuestionnaireOptions;

    .line 23
    .line 24
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/NextQuestionnaireOptions;->value:Ljava/lang/String;

    .line 25
    .line 26
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const-string v1, "-"

    .line 31
    .line 32
    invoke-static {v1, v0}, Ll/du4;->a(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget-object v1, p0, Ll/jrj0;->D:Ll/l4g0;

    .line 37
    .line 38
    const-string v2, "paper_number"

    .line 39
    .line 40
    iget-object v3, p0, Ll/jrj0;->z:Ljava/lang/String;

    .line 41
    .line 42
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    const-string v3, "experience_question_number"

    .line 47
    .line 48
    iget-object v4, p1, Lcom/p1/mobile/putong/core/data/NextQuestionnaire;->title:Ljava/lang/String;

    .line 49
    .line 50
    invoke-static {v3, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    const-string v4, "action_survey_answer_list"

    .line 55
    .line 56
    invoke-static {v4, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    filled-new-array {v2, v3, v0}, [Ll/pf60;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {v1, v0}, Ll/l4g0;->p([Ll/pf60;)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Ll/jrj0;->D:Ll/l4g0;

    .line 68
    .line 69
    invoke-virtual {v0}, Ll/l4g0;->i()V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Ll/jrj0;->D:Ll/l4g0;

    .line 73
    .line 74
    invoke-virtual {v0}, Ll/l4g0;->l()V

    .line 75
    .line 76
    .line 77
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/NextQuestionnaire;->title:Ljava/lang/String;

    .line 78
    .line 79
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-nez v0, :cond_1

    .line 84
    .line 85
    iget-object v0, p0, Ll/jrj0;->i:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 86
    .line 87
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/NextQuestionnaire;->title:Ljava/lang/String;

    .line 88
    .line 89
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 90
    .line 91
    .line 92
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/NextQuestionnaire;->description:Ljava/lang/String;

    .line 93
    .line 94
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    if-nez v0, :cond_2

    .line 99
    .line 100
    iget-object v0, p0, Ll/jrj0;->j:Lv/VText;

    .line 101
    .line 102
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/NextQuestionnaire;->description:Ljava/lang/String;

    .line 103
    .line 104
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 105
    .line 106
    .line 107
    :cond_2
    iget-object v0, p0, Ll/jrj0;->k:Lv/VLinear;

    .line 108
    .line 109
    const/4 v1, 0x0

    .line 110
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 111
    .line 112
    .line 113
    iget-object v0, p0, Ll/jrj0;->u:Lv/VLinear;

    .line 114
    .line 115
    const/4 v2, 0x1

    .line 116
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 117
    .line 118
    .line 119
    iget-object v0, p0, Ll/jrj0;->x:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 120
    .line 121
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 122
    .line 123
    .line 124
    new-instance v0, Ll/ir40;

    .line 125
    .line 126
    iget-object v2, p0, Ll/jrj0;->y:Lcom/p1/mobile/android/app/Act;

    .line 127
    .line 128
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/NextQuestionnaire;->options:Ljava/util/List;

    .line 129
    .line 130
    invoke-direct {v0, v2, v3}, Ll/ir40;-><init>(Landroid/content/Context;Ljava/util/List;)V

    .line 131
    .line 132
    .line 133
    iput-object v0, p0, Ll/jrj0;->A:Ll/ir40;

    .line 134
    .line 135
    iget-object v0, p0, Ll/jrj0;->v:Landroidx/recyclerview/widget/RecyclerView;

    .line 136
    .line 137
    new-instance v2, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 138
    .line 139
    iget-object v3, p0, Ll/jrj0;->y:Lcom/p1/mobile/android/app/Act;

    .line 140
    .line 141
    invoke-direct {v2, v3}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 145
    .line 146
    .line 147
    iget-object v0, p0, Ll/jrj0;->v:Landroidx/recyclerview/widget/RecyclerView;

    .line 148
    .line 149
    iget-object v2, p0, Ll/jrj0;->A:Ll/ir40;

    .line 150
    .line 151
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 152
    .line 153
    .line 154
    iget-object v0, p0, Ll/jrj0;->A:Ll/ir40;

    .line 155
    .line 156
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 157
    .line 158
    .line 159
    invoke-virtual {p0, v1}, Ll/jrj0;->H0(Z)V

    .line 160
    .line 161
    .line 162
    iget-object v0, p0, Ll/jrj0;->A:Ll/ir40;

    .line 163
    .line 164
    new-instance v1, Ll/yqj0;

    .line 165
    .line 166
    invoke-direct {v1, p0, p1}, Ll/yqj0;-><init>(Ll/jrj0;Lcom/p1/mobile/putong/core/data/NextQuestionnaire;)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {v0, v1}, Ll/ir40;->D(Ll/ir40$b;)V

    .line 170
    .line 171
    .line 172
    iget-object v0, p0, Ll/jrj0;->w:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 173
    .line 174
    new-instance v1, Ll/zqj0;

    .line 175
    .line 176
    invoke-direct {v1, p0, p1}, Ll/zqj0;-><init>(Ll/jrj0;Lcom/p1/mobile/putong/core/data/NextQuestionnaire;)V

    .line 177
    .line 178
    .line 179
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 180
    .line 181
    .line 182
    iget-object p1, p0, Ll/jrj0;->g:Lv/VImage;

    .line 183
    .line 184
    new-instance v0, Ll/arj0;

    .line 185
    .line 186
    invoke-direct {v0, p0}, Ll/arj0;-><init>(Ll/jrj0;)V

    .line 187
    .line 188
    .line 189
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 190
    .line 191
    .line 192
    return-void
.end method

.method public final E0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/jrj0;->G0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/jrj0;->h:Lv/VDraweeView;

    .line 5
    .line 6
    sget v1, Ll/dbc0;->jr:I

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/jrj0;->i:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 12
    .line 13
    const-string v1, "\u611f\u8c22\u60a8\u7684\u652f\u6301\uff01"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/jrj0;->j:Lv/VText;

    .line 19
    .line 20
    const-string v1, "\u63a2\u63a2\u5c06\u7ee7\u7eed\u4e3a\u4f60\u63a8\u8350\u66f4\u9002\u5408\u7684\u5bf9\u8c61\uff0c\u5982\u6709\u4efb\u4f55\u4f53\u9a8c\u95ee\u9898\uff0c\u8bf7\u968f\u65f6\u53cd\u9988\u3002"

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/jrj0;->z:Ljava/lang/String;

    .line 26
    .line 27
    const-string v1, "P1"

    .line 28
    .line 29
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    iget-object v1, p0, Ll/jrj0;->x:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 34
    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    const-string v0, "\u7ee7\u7eed\u5212\u5361"

    .line 38
    .line 39
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    const-string v0, "\u77e5\u9053\u4e86"

    .line 44
    .line 45
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 46
    .line 47
    .line 48
    :goto_0
    iget-object v0, p0, Ll/jrj0;->k:Lv/VLinear;

    .line 49
    .line 50
    const/4 v1, 0x0

    .line 51
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ll/jrj0;->u:Lv/VLinear;

    .line 55
    .line 56
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Ll/jrj0;->x:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 60
    .line 61
    const/4 v1, 0x1

    .line 62
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Ll/jrj0;->x:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 66
    .line 67
    new-instance v1, Ll/vqj0;

    .line 68
    .line 69
    invoke-direct {v1, p0}, Ll/vqj0;-><init>(Ll/jrj0;)V

    .line 70
    .line 71
    .line 72
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Ll/jrj0;->g:Lv/VImage;

    .line 76
    .line 77
    new-instance v1, Ll/wqj0;

    .line 78
    .line 79
    invoke-direct {v1, p0}, Ll/wqj0;-><init>(Ll/jrj0;)V

    .line 80
    .line 81
    .line 82
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public final F0(Lcom/p1/mobile/putong/core/data/Questionnaire;)V
    .locals 6

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Questionnaire;->title:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/jrj0;->i:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 10
    .line 11
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Questionnaire;->title:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Questionnaire;->description:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    iget-object v0, p0, Ll/jrj0;->j:Lv/VText;

    .line 25
    .line 26
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Questionnaire;->description:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    iget-object v0, p0, Ll/jrj0;->k:Lv/VLinear;

    .line 32
    .line 33
    const/4 v1, 0x1

    .line 34
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/jrj0;->u:Lv/VLinear;

    .line 38
    .line 39
    const/4 v2, 0x0

    .line 40
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/jrj0;->x:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 44
    .line 45
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 46
    .line 47
    .line 48
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 49
    .line 50
    iget-object v3, p0, Ll/jrj0;->m:Lv/VDraweeView;

    .line 51
    .line 52
    iget-object v4, p1, Lcom/p1/mobile/putong/core/data/Questionnaire;->options:Ljava/util/List;

    .line 53
    .line 54
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    check-cast v4, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;

    .line 59
    .line 60
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;->image:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {v0, v3, v4}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 66
    .line 67
    iget-object v3, p0, Ll/jrj0;->p:Lv/VDraweeView;

    .line 68
    .line 69
    iget-object v4, p1, Lcom/p1/mobile/putong/core/data/Questionnaire;->options:Ljava/util/List;

    .line 70
    .line 71
    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    check-cast v4, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;

    .line 76
    .line 77
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;->image:Ljava/lang/String;

    .line 78
    .line 79
    invoke-virtual {v0, v3, v4}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 83
    .line 84
    iget-object v3, p0, Ll/jrj0;->s:Lv/VDraweeView;

    .line 85
    .line 86
    iget-object v4, p1, Lcom/p1/mobile/putong/core/data/Questionnaire;->options:Ljava/util/List;

    .line 87
    .line 88
    const/4 v5, 0x2

    .line 89
    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v4

    .line 93
    check-cast v4, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;

    .line 94
    .line 95
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;->image:Ljava/lang/String;

    .line 96
    .line 97
    invoke-virtual {v0, v3, v4}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 101
    .line 102
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/Questionnaire;->options:Ljava/util/List;

    .line 103
    .line 104
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    check-cast v3, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;

    .line 109
    .line 110
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;->imageSelected:Ljava/lang/String;

    .line 111
    .line 112
    invoke-virtual {v0, v3}, Ll/fsb0;->x0(Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 116
    .line 117
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/Questionnaire;->options:Ljava/util/List;

    .line 118
    .line 119
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-result-object v3

    .line 123
    check-cast v3, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;

    .line 124
    .line 125
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;->imageSelected:Ljava/lang/String;

    .line 126
    .line 127
    invoke-virtual {v0, v3}, Ll/fsb0;->x0(Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 131
    .line 132
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/Questionnaire;->options:Ljava/util/List;

    .line 133
    .line 134
    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 135
    .line 136
    .line 137
    move-result-object v3

    .line 138
    check-cast v3, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;

    .line 139
    .line 140
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;->imageSelected:Ljava/lang/String;

    .line 141
    .line 142
    invoke-virtual {v0, v3}, Ll/fsb0;->x0(Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    iget-object v0, p0, Ll/jrj0;->n:Lv/VText;

    .line 146
    .line 147
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/Questionnaire;->options:Ljava/util/List;

    .line 148
    .line 149
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    move-result-object v2

    .line 153
    check-cast v2, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;

    .line 154
    .line 155
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;->value:Ljava/lang/String;

    .line 156
    .line 157
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 158
    .line 159
    .line 160
    iget-object v0, p0, Ll/jrj0;->q:Lv/VText;

    .line 161
    .line 162
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Questionnaire;->options:Ljava/util/List;

    .line 163
    .line 164
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 165
    .line 166
    .line 167
    move-result-object v1

    .line 168
    check-cast v1, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;

    .line 169
    .line 170
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;->value:Ljava/lang/String;

    .line 171
    .line 172
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 173
    .line 174
    .line 175
    iget-object v0, p0, Ll/jrj0;->t:Lv/VText;

    .line 176
    .line 177
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Questionnaire;->options:Ljava/util/List;

    .line 178
    .line 179
    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 180
    .line 181
    .line 182
    move-result-object v1

    .line 183
    check-cast v1, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;

    .line 184
    .line 185
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;->value:Ljava/lang/String;

    .line 186
    .line 187
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 188
    .line 189
    .line 190
    iget-object v0, p0, Ll/jrj0;->l:Lv/VLinear;

    .line 191
    .line 192
    new-instance v1, Ll/frj0;

    .line 193
    .line 194
    invoke-direct {v1, p0, p1}, Ll/frj0;-><init>(Ll/jrj0;Lcom/p1/mobile/putong/core/data/Questionnaire;)V

    .line 195
    .line 196
    .line 197
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 198
    .line 199
    .line 200
    iget-object v0, p0, Ll/jrj0;->o:Lv/VLinear;

    .line 201
    .line 202
    new-instance v1, Ll/grj0;

    .line 203
    .line 204
    invoke-direct {v1, p0, p1}, Ll/grj0;-><init>(Ll/jrj0;Lcom/p1/mobile/putong/core/data/Questionnaire;)V

    .line 205
    .line 206
    .line 207
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 208
    .line 209
    .line 210
    iget-object v0, p0, Ll/jrj0;->r:Lv/VLinear;

    .line 211
    .line 212
    new-instance v1, Ll/hrj0;

    .line 213
    .line 214
    invoke-direct {v1, p0, p1}, Ll/hrj0;-><init>(Ll/jrj0;Lcom/p1/mobile/putong/core/data/Questionnaire;)V

    .line 215
    .line 216
    .line 217
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 218
    .line 219
    .line 220
    iget-object p1, p0, Ll/jrj0;->g:Lv/VImage;

    .line 221
    .line 222
    new-instance v0, Ll/irj0;

    .line 223
    .line 224
    invoke-direct {v0, p0}, Ll/irj0;-><init>(Ll/jrj0;)V

    .line 225
    .line 226
    .line 227
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 228
    .line 229
    .line 230
    return-void
.end method

.method public final G0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jrj0;->E:Ll/l4g0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/l4g0;->i()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/jrj0;->E:Ll/l4g0;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final H0(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jrj0;->w:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    sget v1, Ll/dbc0;->Q4:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    sget v1, Ll/dbc0;->R4:I

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 14
    .line 15
    .line 16
    :goto_0
    iget-object p0, p0, Ll/jrj0;->w:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public V(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/krj0;->b(Ll/jrj0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final W()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jrj0;->C:Ll/l4g0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/l4g0;->k()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/jrj0;->C:Ll/l4g0;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final X()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jrj0;->E:Ll/l4g0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/l4g0;->k()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/jrj0;->E:Ll/l4g0;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final Y()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jrj0;->C:Ll/l4g0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/l4g0;->k()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/jrj0;->C:Ll/l4g0;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic b0()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->getBehavior()Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Ll/jrj0;->f:Lv/VLinear;

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

.method public final synthetic c0(Lcom/p1/mobile/putong/core/data/Questionnaire;Landroid/view/View;Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;I)V
    .locals 1

    .line 1
    iget-boolean p2, p3, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;->checked:Z

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    xor-int/2addr p2, v0

    .line 5
    iput-boolean p2, p3, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;->checked:Z

    .line 6
    .line 7
    iget-object p2, p0, Ll/jrj0;->B:Ll/xwb0;

    .line 8
    .line 9
    invoke-virtual {p2, p4}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Questionnaire;->options:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    if-eqz p2, :cond_1

    .line 23
    .line 24
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    check-cast p2, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;

    .line 29
    .line 30
    iget-boolean p2, p2, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;->checked:Z

    .line 31
    .line 32
    if-eqz p2, :cond_0

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    const/4 v0, 0x0

    .line 36
    :goto_0
    invoke-virtual {p0, v0}, Ll/jrj0;->H0(Z)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final synthetic d0(Lcom/p1/mobile/putong/core/data/Questionnaire;Landroid/view/View;)V
    .locals 3

    .line 1
    new-instance p2, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Questionnaire;->options:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;

    .line 23
    .line 24
    iget-boolean v2, v1, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;->checked:Z

    .line 25
    .line 26
    if-eqz v2, :cond_0

    .line 27
    .line 28
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;->value:Ljava/lang/String;

    .line 29
    .line 30
    invoke-interface {p2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    const-string v0, "-"

    .line 35
    .line 36
    invoke-static {v0, p2}, Ll/du4;->a(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    iget-object v0, p0, Ll/jrj0;->z:Ljava/lang/String;

    .line 41
    .line 42
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Questionnaire;->title:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {p0, v0, p1, p2}, Ll/jrj0;->y0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Ll/jrj0;->Y()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Ll/jrj0;->B0()V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final synthetic e0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jrj0;->Y()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic f0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jrj0;->x0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/jrj0;->X()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic g0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jrj0;->X()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic h0(Lcom/p1/mobile/putong/core/data/NextQuestionnaire;Landroid/view/View;Lcom/p1/mobile/putong/core/data/NextQuestionnaireOptions;I)V
    .locals 1

    .line 1
    iget-boolean p2, p3, Lcom/p1/mobile/putong/core/data/NextQuestionnaireOptions;->checked:Z

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    xor-int/2addr p2, v0

    .line 5
    iput-boolean p2, p3, Lcom/p1/mobile/putong/core/data/NextQuestionnaireOptions;->checked:Z

    .line 6
    .line 7
    iget-object p2, p0, Ll/jrj0;->A:Ll/ir40;

    .line 8
    .line 9
    invoke-virtual {p2, p4}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/NextQuestionnaire;->options:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    if-eqz p2, :cond_1

    .line 23
    .line 24
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    check-cast p2, Lcom/p1/mobile/putong/core/data/NextQuestionnaireOptions;

    .line 29
    .line 30
    iget-boolean p2, p2, Lcom/p1/mobile/putong/core/data/NextQuestionnaireOptions;->checked:Z

    .line 31
    .line 32
    if-eqz p2, :cond_0

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    const/4 v0, 0x0

    .line 36
    :goto_0
    invoke-virtual {p0, v0}, Ll/jrj0;->H0(Z)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final synthetic i0(Lcom/p1/mobile/putong/core/data/NextQuestionnaire;Landroid/view/View;)V
    .locals 3

    .line 1
    new-instance p2, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/NextQuestionnaire;->options:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Lcom/p1/mobile/putong/core/data/NextQuestionnaireOptions;

    .line 23
    .line 24
    iget-boolean v2, v1, Lcom/p1/mobile/putong/core/data/NextQuestionnaireOptions;->checked:Z

    .line 25
    .line 26
    if-eqz v2, :cond_0

    .line 27
    .line 28
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/NextQuestionnaireOptions;->value:Ljava/lang/String;

    .line 29
    .line 30
    invoke-interface {p2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    const-string v0, "-"

    .line 35
    .line 36
    invoke-static {v0, p2}, Ll/du4;->a(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    iget-object v0, p0, Ll/jrj0;->z:Ljava/lang/String;

    .line 41
    .line 42
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/NextQuestionnaire;->title:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {p0, v0, p1, p2}, Ll/jrj0;->y0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Ll/jrj0;->Y()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Ll/jrj0;->B0()V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final synthetic j0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jrj0;->Y()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic k0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jrj0;->x0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/jrj0;->X()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic l0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jrj0;->X()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic m0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jrj0;->E0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic n0(Lcom/p1/mobile/putong/core/data/Questionnaire;)V
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Questionnaire;->options:Ljava/util/List;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;

    .line 9
    .line 10
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;->nextPage:Lcom/p1/mobile/putong/core/data/NextQuestionnaire;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/jrj0;->D0(Lcom/p1/mobile/putong/core/data/NextQuestionnaire;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic o0(Lcom/p1/mobile/putong/core/data/Questionnaire;Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p2, p0, Ll/jrj0;->l:Lv/VLinear;

    .line 2
    .line 3
    sget v0, Ll/dbc0;->lr:I

    .line 4
    .line 5
    invoke-virtual {p2, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 6
    .line 7
    .line 8
    iget-object p2, p0, Ll/jrj0;->n:Lv/VText;

    .line 9
    .line 10
    const-string v0, "#FE7E1D"

    .line 11
    .line 12
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 17
    .line 18
    .line 19
    iget-object p2, p0, Ll/jrj0;->z:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Questionnaire;->title:Ljava/lang/String;

    .line 22
    .line 23
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Questionnaire;->options:Ljava/util/List;

    .line 24
    .line 25
    const/4 v2, 0x0

    .line 26
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;

    .line 31
    .line 32
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;->value:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {p0, p2, v0, v1}, Ll/jrj0;->w0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Ll/jrj0;->W()V

    .line 38
    .line 39
    .line 40
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 41
    .line 42
    iget-object v0, p0, Ll/jrj0;->m:Lv/VDraweeView;

    .line 43
    .line 44
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Questionnaire;->options:Ljava/util/List;

    .line 45
    .line 46
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    check-cast v1, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;

    .line 51
    .line 52
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;->imageSelected:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {p2, v0, v1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Questionnaire;->options:Ljava/util/List;

    .line 58
    .line 59
    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    check-cast p2, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;

    .line 64
    .line 65
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;->nextPage:Lcom/p1/mobile/putong/core/data/NextQuestionnaire;

    .line 66
    .line 67
    const-wide/16 v0, 0x1f4

    .line 68
    .line 69
    if-eqz p2, :cond_1

    .line 70
    .line 71
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Questionnaire;->options:Ljava/util/List;

    .line 72
    .line 73
    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    check-cast p2, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;

    .line 78
    .line 79
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;->nextPage:Lcom/p1/mobile/putong/core/data/NextQuestionnaire;

    .line 80
    .line 81
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/NextQuestionnaire;->title:Ljava/lang/String;

    .line 82
    .line 83
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 84
    .line 85
    .line 86
    move-result p2

    .line 87
    if-eqz p2, :cond_0

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_0
    iget-object p2, p0, Ll/jrj0;->y:Lcom/p1/mobile/android/app/Act;

    .line 91
    .line 92
    new-instance v2, Ll/uqj0;

    .line 93
    .line 94
    invoke-direct {v2, p0, p1}, Ll/uqj0;-><init>(Ll/jrj0;Lcom/p1/mobile/putong/core/data/Questionnaire;)V

    .line 95
    .line 96
    .line 97
    invoke-static {p2, v2, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 98
    .line 99
    .line 100
    return-void

    .line 101
    :cond_1
    :goto_0
    iget-object p1, p0, Ll/jrj0;->y:Lcom/p1/mobile/android/app/Act;

    .line 102
    .line 103
    new-instance p2, Ll/tqj0;

    .line 104
    .line 105
    invoke-direct {p2, p0}, Ll/tqj0;-><init>(Ll/jrj0;)V

    .line 106
    .line 107
    .line 108
    invoke-static {p1, p2, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/jrj0;->a0()V

    .line 5
    .line 6
    .line 7
    new-instance p1, Ll/xqj0;

    .line 8
    .line 9
    invoke-direct {p1}, Ll/xqj0;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 13
    .line 14
    .line 15
    new-instance p1, Ll/brj0;

    .line 16
    .line 17
    invoke-direct {p1}, Ll/brj0;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic p0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jrj0;->E0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic q0(Lcom/p1/mobile/putong/core/data/Questionnaire;)V
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Questionnaire;->options:Ljava/util/List;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;

    .line 9
    .line 10
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;->nextPage:Lcom/p1/mobile/putong/core/data/NextQuestionnaire;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/jrj0;->D0(Lcom/p1/mobile/putong/core/data/NextQuestionnaire;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic r0(Lcom/p1/mobile/putong/core/data/Questionnaire;Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p2, p0, Ll/jrj0;->o:Lv/VLinear;

    .line 2
    .line 3
    sget v0, Ll/dbc0;->lr:I

    .line 4
    .line 5
    invoke-virtual {p2, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 6
    .line 7
    .line 8
    iget-object p2, p0, Ll/jrj0;->q:Lv/VText;

    .line 9
    .line 10
    const-string v0, "#FE7E1D"

    .line 11
    .line 12
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 17
    .line 18
    .line 19
    iget-object p2, p0, Ll/jrj0;->z:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Questionnaire;->title:Ljava/lang/String;

    .line 22
    .line 23
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Questionnaire;->options:Ljava/util/List;

    .line 24
    .line 25
    const/4 v2, 0x1

    .line 26
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;

    .line 31
    .line 32
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;->value:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {p0, p2, v0, v1}, Ll/jrj0;->w0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Ll/jrj0;->W()V

    .line 38
    .line 39
    .line 40
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 41
    .line 42
    iget-object v0, p0, Ll/jrj0;->p:Lv/VDraweeView;

    .line 43
    .line 44
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Questionnaire;->options:Ljava/util/List;

    .line 45
    .line 46
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    check-cast v1, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;

    .line 51
    .line 52
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;->imageSelected:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {p2, v0, v1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Questionnaire;->options:Ljava/util/List;

    .line 58
    .line 59
    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    check-cast p2, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;

    .line 64
    .line 65
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;->nextPage:Lcom/p1/mobile/putong/core/data/NextQuestionnaire;

    .line 66
    .line 67
    const-wide/16 v0, 0x1f4

    .line 68
    .line 69
    if-eqz p2, :cond_1

    .line 70
    .line 71
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Questionnaire;->options:Ljava/util/List;

    .line 72
    .line 73
    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    check-cast p2, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;

    .line 78
    .line 79
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;->nextPage:Lcom/p1/mobile/putong/core/data/NextQuestionnaire;

    .line 80
    .line 81
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/NextQuestionnaire;->title:Ljava/lang/String;

    .line 82
    .line 83
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 84
    .line 85
    .line 86
    move-result p2

    .line 87
    if-eqz p2, :cond_0

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_0
    iget-object p2, p0, Ll/jrj0;->y:Lcom/p1/mobile/android/app/Act;

    .line 91
    .line 92
    new-instance v2, Ll/qqj0;

    .line 93
    .line 94
    invoke-direct {v2, p0, p1}, Ll/qqj0;-><init>(Ll/jrj0;Lcom/p1/mobile/putong/core/data/Questionnaire;)V

    .line 95
    .line 96
    .line 97
    invoke-static {p2, v2, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 98
    .line 99
    .line 100
    return-void

    .line 101
    :cond_1
    :goto_0
    iget-object p1, p0, Ll/jrj0;->y:Lcom/p1/mobile/android/app/Act;

    .line 102
    .line 103
    new-instance p2, Ll/pqj0;

    .line 104
    .line 105
    invoke-direct {p2, p0}, Ll/pqj0;-><init>(Ll/jrj0;)V

    .line 106
    .line 107
    .line 108
    invoke-static {p1, p2, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method public final synthetic s0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jrj0;->E0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public show()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->show()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/jrj0;->Z()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic t0(Lcom/p1/mobile/putong/core/data/Questionnaire;)V
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Questionnaire;->options:Ljava/util/List;

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;

    .line 9
    .line 10
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;->nextPage:Lcom/p1/mobile/putong/core/data/NextQuestionnaire;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/jrj0;->D0(Lcom/p1/mobile/putong/core/data/NextQuestionnaire;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic u0(Lcom/p1/mobile/putong/core/data/Questionnaire;Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p2, p0, Ll/jrj0;->r:Lv/VLinear;

    .line 2
    .line 3
    sget v0, Ll/dbc0;->lr:I

    .line 4
    .line 5
    invoke-virtual {p2, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 6
    .line 7
    .line 8
    iget-object p2, p0, Ll/jrj0;->t:Lv/VText;

    .line 9
    .line 10
    const-string v0, "#FE7E1D"

    .line 11
    .line 12
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 17
    .line 18
    .line 19
    iget-object p2, p0, Ll/jrj0;->z:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Questionnaire;->title:Ljava/lang/String;

    .line 22
    .line 23
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Questionnaire;->options:Ljava/util/List;

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;

    .line 31
    .line 32
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;->value:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {p0, p2, v0, v1}, Ll/jrj0;->w0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Ll/jrj0;->W()V

    .line 38
    .line 39
    .line 40
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 41
    .line 42
    iget-object v0, p0, Ll/jrj0;->s:Lv/VDraweeView;

    .line 43
    .line 44
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Questionnaire;->options:Ljava/util/List;

    .line 45
    .line 46
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    check-cast v1, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;

    .line 51
    .line 52
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;->imageSelected:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {p2, v0, v1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Questionnaire;->options:Ljava/util/List;

    .line 58
    .line 59
    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    check-cast p2, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;

    .line 64
    .line 65
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;->nextPage:Lcom/p1/mobile/putong/core/data/NextQuestionnaire;

    .line 66
    .line 67
    const-wide/16 v0, 0x1f4

    .line 68
    .line 69
    if-eqz p2, :cond_1

    .line 70
    .line 71
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/Questionnaire;->options:Ljava/util/List;

    .line 72
    .line 73
    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    check-cast p2, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;

    .line 78
    .line 79
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;->nextPage:Lcom/p1/mobile/putong/core/data/NextQuestionnaire;

    .line 80
    .line 81
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/NextQuestionnaire;->title:Ljava/lang/String;

    .line 82
    .line 83
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 84
    .line 85
    .line 86
    move-result p2

    .line 87
    if-eqz p2, :cond_0

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_0
    iget-object p2, p0, Ll/jrj0;->y:Lcom/p1/mobile/android/app/Act;

    .line 91
    .line 92
    new-instance v2, Ll/oqj0;

    .line 93
    .line 94
    invoke-direct {v2, p0, p1}, Ll/oqj0;-><init>(Ll/jrj0;Lcom/p1/mobile/putong/core/data/Questionnaire;)V

    .line 95
    .line 96
    .line 97
    invoke-static {p2, v2, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 98
    .line 99
    .line 100
    return-void

    .line 101
    :cond_1
    :goto_0
    iget-object p1, p0, Ll/jrj0;->y:Lcom/p1/mobile/android/app/Act;

    .line 102
    .line 103
    new-instance p2, Ll/nqj0;

    .line 104
    .line 105
    invoke-direct {p2, p0}, Ll/nqj0;-><init>(Ll/jrj0;)V

    .line 106
    .line 107
    .line 108
    invoke-static {p1, p2, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method public final synthetic v0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jrj0;->W()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final w0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    const-string p0, "paper_number"

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string p1, "experience_question_number"

    .line 8
    .line 9
    invoke-static {p1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const-string p2, "experience_question_answer"

    .line 14
    .line 15
    invoke-static {p2, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    filled-new-array {p0, p1, p2}, [Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string p1, "e_experience_chose_btn"

    .line 24
    .line 25
    const-string p2, "p_action_survey_experience"

    .line 26
    .line 27
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final x0()V
    .locals 1

    .line 1
    const-string p0, "e_continue_btn"

    .line 2
    .line 3
    const-string v0, "p_action_survey_feedback"

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final y0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    const-string p0, "paper_number"

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string p1, "experience_question_number"

    .line 8
    .line 9
    invoke-static {p1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const-string p2, "experience_question_answer"

    .line 14
    .line 15
    invoke-static {p2, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    filled-new-array {p0, p1, p2}, [Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string p1, "e_question_chose_btn"

    .line 24
    .line 25
    const-string p2, "p_action_survey_question"

    .line 26
    .line 27
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public z0(Lcom/p1/mobile/putong/core/data/Questionnaire;)V
    .locals 5

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    const-string v0, "P1"

    .line 5
    .line 6
    iput-object v0, p0, Ll/jrj0;->z:Ljava/lang/String;

    .line 7
    .line 8
    new-instance v0, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Questionnaire;->options:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_1

    .line 24
    .line 25
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;

    .line 30
    .line 31
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/QuestionnaireOptions;->value:Ljava/lang/String;

    .line 32
    .line 33
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    const-string v1, "-"

    .line 38
    .line 39
    invoke-static {v1, v0}, Ll/du4;->a(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iget-object v1, p0, Ll/jrj0;->C:Ll/l4g0;

    .line 44
    .line 45
    const-string v2, "paper_number"

    .line 46
    .line 47
    iget-object v3, p0, Ll/jrj0;->z:Ljava/lang/String;

    .line 48
    .line 49
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    const-string v3, "experience_question_number"

    .line 54
    .line 55
    iget-object v4, p1, Lcom/p1/mobile/putong/core/data/Questionnaire;->title:Ljava/lang/String;

    .line 56
    .line 57
    invoke-static {v3, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    const-string v4, "action_survey_answer_list"

    .line 62
    .line 63
    invoke-static {v4, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    filled-new-array {v2, v3, v0}, [Ll/pf60;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {v1, v0}, Ll/l4g0;->p([Ll/pf60;)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Ll/jrj0;->C:Ll/l4g0;

    .line 75
    .line 76
    invoke-virtual {v0}, Ll/l4g0;->i()V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Ll/jrj0;->C:Ll/l4g0;

    .line 80
    .line 81
    invoke-virtual {v0}, Ll/l4g0;->l()V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0}, Ll/jrj0;->show()V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Ll/jrj0;->h:Lv/VDraweeView;

    .line 88
    .line 89
    sget v1, Ll/dbc0;->kr:I

    .line 90
    .line 91
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p0, p1}, Ll/jrj0;->F0(Lcom/p1/mobile/putong/core/data/Questionnaire;)V

    .line 95
    .line 96
    .line 97
    return-void
.end method
