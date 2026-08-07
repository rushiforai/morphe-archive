.class public Lcom/p1/mobile/putong/core/newui/icebreak/a;
.super Ll/pej0;
.source "SourceFile"


# instance fields
.field public f:Landroid/view/View;

.field public g:Landroid/widget/LinearLayout;

.field public h:Landroid/widget/ImageView;

.field public i:Lv/VImage;

.field public j:Landroid/widget/TextView;

.field public k:Lv/VLinear;

.field public l:Lv/VText;

.field public m:Lv/VCheckBox;

.field public n:Lv/VLinear;

.field public o:Lv/VText;

.field public p:Lv/VCheckBox;

.field public q:Lv/VLinear;

.field public r:Lv/VText;

.field public s:Lv/VCheckBox;

.field public t:Landroid/widget/TextView;

.field public u:Lcom/p1/mobile/android/app/Act;

.field public v:Ll/l4g0;

.field public w:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

.field public x:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/IceBreakQuestion;",
            ">;"
        }
    .end annotation
.end field

.field public y:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard$a;",
            ">;"
        }
    .end annotation
.end field

.field public final z:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Ll/pej0;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/core/newui/icebreak/a$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/newui/icebreak/a$a;-><init>(Lcom/p1/mobile/putong/core/newui/icebreak/a;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/icebreak/a;->z:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;

    .line 10
    .line 11
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/icebreak/a;->I(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic A(Lcom/p1/mobile/putong/core/newui/icebreak/a;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/icebreak/a;->M(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic C(Lcom/p1/mobile/putong/core/newui/icebreak/a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/icebreak/a;->K(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic D(Lcom/p1/mobile/putong/core/newui/icebreak/a;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/icebreak/a;->w:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    return-object p0
.end method

.method private G()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_add_like_question_to_chat"

    .line 2
    .line 3
    return-object p0
.end method

.method private I(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/bnl0;->D(Landroid/content/Context;)Landroid/app/Activity;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/icebreak/a;->u:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/icebreak/a;->E(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(Landroid/view/View;)V

    .line 19
    .line 20
    .line 21
    const/4 p1, 0x0

    .line 22
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCancelable(Z)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method private synthetic K(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic L(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/icebreak/a;->H()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const-string v0, "_"

    .line 12
    .line 13
    invoke-static {p1, v0}, Ll/jyb;->U(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    const-string v0, "chat_question_content"

    .line 18
    .line 19
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    filled-new-array {p1}, [Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const-string v0, "e_add_chat_question"

    .line 28
    .line 29
    const-string v1, "p_add_like_question_to_chat"

    .line 30
    .line 31
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 32
    .line 33
    .line 34
    invoke-static {}, Ll/ebm;->a()Ll/ebm;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p1}, Ll/ebm;->e()V

    .line 39
    .line 40
    .line 41
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 42
    .line 43
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/icebreak/a;->F()Ljava/util/List;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {p1, v0}, Ll/dkb;->sa(Ljava/util/List;)Lrx/c;

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 53
    .line 54
    .line 55
    :cond_0
    return-void
.end method

.method public static synthetic x(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/ebm;->a()Ll/ebm;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/ebm;->f()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic y(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/core/newui/icebreak/a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/icebreak/a;->L(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public E(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/pbm;->b(Lcom/p1/mobile/putong/core/newui/icebreak/a;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public F()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/icebreak/a;->y:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard$a;

    .line 23
    .line 24
    iget-object v2, v1, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard$a;->c:Lv/VCheckBox;

    .line 25
    .line 26
    invoke-virtual {v2}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-eqz v2, :cond_0

    .line 31
    .line 32
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard$a;->d:Lcom/p1/mobile/putong/core/data/IceBreakQuestion;

    .line 33
    .line 34
    if-eqz v1, :cond_0

    .line 35
    .line 36
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/IceBreakQuestion;->id:Ljava/lang/String;

    .line 37
    .line 38
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    return-object v0
.end method

.method public H()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/icebreak/a;->y:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard$a;

    .line 23
    .line 24
    iget-object v2, v1, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard$a;->c:Lv/VCheckBox;

    .line 25
    .line 26
    invoke-virtual {v2}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-eqz v2, :cond_0

    .line 31
    .line 32
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard$a;->d:Lcom/p1/mobile/putong/core/data/IceBreakQuestion;

    .line 33
    .line 34
    if-eqz v1, :cond_0

    .line 35
    .line 36
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/IceBreakQuestion;->content:Ljava/lang/String;

    .line 37
    .line 38
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    return-object v0
.end method

.method public J()V
    .locals 6

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard$a;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/icebreak/a;->k:Lv/VLinear;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/icebreak/a;->l:Lv/VText;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/icebreak/a;->m:Lv/VCheckBox;

    .line 8
    .line 9
    invoke-direct {v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard$a;-><init>(Landroid/view/View;Lv/VText;Lv/VCheckBox;)V

    .line 10
    .line 11
    .line 12
    new-instance v1, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard$a;

    .line 13
    .line 14
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/icebreak/a;->n:Lv/VLinear;

    .line 15
    .line 16
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/icebreak/a;->o:Lv/VText;

    .line 17
    .line 18
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/icebreak/a;->p:Lv/VCheckBox;

    .line 19
    .line 20
    invoke-direct {v1, v2, v3, v4}, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard$a;-><init>(Landroid/view/View;Lv/VText;Lv/VCheckBox;)V

    .line 21
    .line 22
    .line 23
    new-instance v2, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard$a;

    .line 24
    .line 25
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/icebreak/a;->q:Lv/VLinear;

    .line 26
    .line 27
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/icebreak/a;->r:Lv/VText;

    .line 28
    .line 29
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/icebreak/a;->s:Lv/VCheckBox;

    .line 30
    .line 31
    invoke-direct {v2, v3, v4, v5}, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard$a;-><init>(Landroid/view/View;Lv/VText;Lv/VCheckBox;)V

    .line 32
    .line 33
    .line 34
    filled-new-array {v0, v1, v2}, [Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard$a;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/icebreak/a;->y:Ljava/util/ArrayList;

    .line 43
    .line 44
    const/4 v0, 0x0

    .line 45
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/icebreak/a;->y:Ljava/util/ArrayList;

    .line 46
    .line 47
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-ge v0, v1, :cond_1

    .line 52
    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/icebreak/a;->x:Ljava/util/List;

    .line 54
    .line 55
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/icebreak/a;->y:Ljava/util/ArrayList;

    .line 60
    .line 61
    if-le v1, v0, :cond_0

    .line 62
    .line 63
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    check-cast v1, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard$a;

    .line 68
    .line 69
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/icebreak/a;->x:Ljava/util/List;

    .line 70
    .line 71
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    check-cast v2, Lcom/p1/mobile/putong/core/data/IceBreakQuestion;

    .line 76
    .line 77
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard$a;->c(Lcom/p1/mobile/putong/core/data/IceBreakQuestion;)V

    .line 78
    .line 79
    .line 80
    goto :goto_1

    .line 81
    :cond_0
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    check-cast v1, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard$a;

    .line 86
    .line 87
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/icebreak/IceBreakQuestionCard$a;->d()V

    .line 88
    .line 89
    .line 90
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/icebreak/a;->h:Landroid/widget/ImageView;

    .line 94
    .line 95
    new-instance v1, Ll/mbm;

    .line 96
    .line 97
    invoke-direct {v1, p0}, Ll/mbm;-><init>(Lcom/p1/mobile/putong/core/newui/icebreak/a;)V

    .line 98
    .line 99
    .line 100
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 101
    .line 102
    .line 103
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/icebreak/a;->g:Landroid/widget/LinearLayout;

    .line 104
    .line 105
    new-instance v1, Ll/nbm;

    .line 106
    .line 107
    invoke-direct {v1}, Ll/nbm;-><init>()V

    .line 108
    .line 109
    .line 110
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 111
    .line 112
    .line 113
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/icebreak/a;->t:Landroid/widget/TextView;

    .line 114
    .line 115
    new-instance v1, Ll/obm;

    .line 116
    .line 117
    invoke-direct {v1, p0}, Ll/obm;-><init>(Lcom/p1/mobile/putong/core/newui/icebreak/a;)V

    .line 118
    .line 119
    .line 120
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 121
    .line 122
    .line 123
    return-void
.end method

.method public final synthetic M(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/icebreak/a;->v:Ll/l4g0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public N(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/IceBreakQuestion;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/icebreak/a;->x:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public show()V
    .locals 3

    .line 1
    sget v0, Ll/vcc0;->E:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/widget/FrameLayout;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const/4 v2, -0x1

    .line 14
    iput v2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 17
    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 21
    .line 22
    .line 23
    invoke-static {v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/icebreak/a;->w:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 28
    .line 29
    const/4 v1, 0x3

    .line 30
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/icebreak/a;->w:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 34
    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/icebreak/a;->z:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setBottomSheetCallback(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/icebreak/a;->J()V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/icebreak/a;->v:Ll/l4g0;

    .line 44
    .line 45
    if-nez v0, :cond_0

    .line 46
    .line 47
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/icebreak/a;->G()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    const-class v1, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;

    .line 52
    .line 53
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-static {v0, v1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/icebreak/a;->v:Ll/l4g0;

    .line 62
    .line 63
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/icebreak/a;->v:Ll/l4g0;

    .line 64
    .line 65
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 66
    .line 67
    .line 68
    new-instance v0, Ll/kbm;

    .line 69
    .line 70
    invoke-direct {v0, p0}, Ll/kbm;-><init>(Lcom/p1/mobile/putong/core/newui/icebreak/a;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 74
    .line 75
    .line 76
    new-instance v0, Ll/lbm;

    .line 77
    .line 78
    invoke-direct {v0}, Ll/lbm;-><init>()V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 82
    .line 83
    .line 84
    invoke-super {p0}, Landroid/app/Dialog;->show()V

    .line 85
    .line 86
    .line 87
    return-void
.end method
