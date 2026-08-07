.class public Ll/oef;
.super Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;
.source "SourceFile"


# instance fields
.field public u:Lv/VLinear;

.field public v:Landroid/view/View;


# direct methods
.method public constructor <init>(Ll/t3m;Ll/ner;)V
    .locals 0
    .param p1    # Ll/t3m;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/c;-><init>(Ll/t3m;Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic S(Ll/oef;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/oef;->X(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic T(Landroid/view/View;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public static synthetic U(Lcom/p1/mobile/putong/core/data/Question;Lcom/p1/mobile/putong/data/Answer;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Answer;->question:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic V(Ll/oef;Lcom/p1/mobile/putong/core/data/Question;Lcom/p1/mobile/putong/data/Answer;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/oef;->Y(Lcom/p1/mobile/putong/core/data/Question;Lcom/p1/mobile/putong/data/Answer;Landroid/view/View;)V

    return-void
.end method

.method private synthetic X(Landroid/view/View;)V
    .locals 2

    .line 1
    const/4 p1, 0x0

    .line 2
    new-array p1, p1, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v0, "e_profile_add_my_question"

    .line 5
    .line 6
    const-string v1, "p_edit_profile_view"

    .line 7
    .line 8
    invoke-static {v0, v1, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->i()Lcom/p1/mobile/android/app/Frag;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance p1, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputMyQuestion;

    .line 16
    .line 17
    invoke-direct {p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputMyQuestion;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-static {p0, p1}, Ll/ljf;->c(Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method


# virtual methods
.method public W(Lcom/p1/mobile/putong/core/data/Question;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->f()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->answers:Ljava/util/List;

    .line 8
    .line 9
    new-instance v1, Ll/nef;

    .line 10
    .line 11
    invoke-direct {v1, p1}, Ll/nef;-><init>(Lcom/p1/mobile/putong/core/data/Question;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Lcom/p1/mobile/putong/data/Answer;

    .line 19
    .line 20
    if-eqz p1, :cond_2

    .line 21
    .line 22
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    iput-object p2, p1, Lcom/p1/mobile/putong/data/Answer;->value:Ljava/lang/String;

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->f()Lcom/p1/mobile/putong/data/User;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 36
    .line 37
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Profile;->answers:Ljava/util/List;

    .line 38
    .line 39
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    if-nez p2, :cond_1

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->f()Lcom/p1/mobile/putong/data/User;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 50
    .line 51
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Profile;->answers:Ljava/util/List;

    .line 52
    .line 53
    invoke-interface {p2, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->x()Ll/t3m;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-interface {p0}, Ll/t3m;->J3()V

    .line 61
    .line 62
    .line 63
    :cond_2
    return-void
.end method

.method public final synthetic Y(Lcom/p1/mobile/putong/core/data/Question;Lcom/p1/mobile/putong/data/Answer;Landroid/view/View;)V
    .locals 2

    .line 1
    new-instance p3, Ll/ekf;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->x()Ll/t3m;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ll/t3m;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Answer;->value:Ljava/lang/String;

    .line 12
    .line 13
    new-instance v1, Ll/mef;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/mef;-><init>(Ll/oef;)V

    .line 16
    .line 17
    .line 18
    invoke-direct {p3, v0, p1, p2, v1}, Ll/ekf;-><init>(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/Question;Ljava/lang/String;Ll/z20;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p3}, Ll/ekf;->show()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final Z(Lcom/p1/mobile/putong/data/Answer;Lcom/p1/mobile/putong/core/data/Question;Z)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->x()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->H2()Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/kec0;->B2:I

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-eqz p3, :cond_0

    .line 17
    .line 18
    sget p3, Ll/adc0;->w2:I

    .line 19
    .line 20
    invoke-virtual {v0, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object p3

    .line 24
    const/4 v1, 0x0

    .line 25
    invoke-static {p3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    :cond_0
    sget p3, Ll/adc0;->gb:I

    .line 29
    .line 30
    invoke-virtual {v0, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object p3

    .line 34
    check-cast p3, Landroid/widget/TextView;

    .line 35
    .line 36
    sget v1, Ll/adc0;->H:I

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    check-cast v1, Landroid/widget/TextView;

    .line 43
    .line 44
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Answer;->value:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 47
    .line 48
    .line 49
    if-nez p2, :cond_1

    .line 50
    .line 51
    const-string v1, ""

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/Question;->text:Ljava/lang/String;

    .line 55
    .line 56
    :goto_0
    invoke-virtual {p3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 57
    .line 58
    .line 59
    new-instance p3, Ll/kef;

    .line 60
    .line 61
    invoke-direct {p3}, Ll/kef;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, p3}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 65
    .line 66
    .line 67
    new-instance p3, Ll/lef;

    .line 68
    .line 69
    invoke-direct {p3, p0, p2, p1}, Ll/lef;-><init>(Ll/oef;Lcom/p1/mobile/putong/core/data/Question;Lcom/p1/mobile/putong/data/Answer;)V

    .line 70
    .line 71
    .line 72
    invoke-static {v0, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 73
    .line 74
    .line 75
    iget-object p1, p0, Ll/oef;->u:Lv/VLinear;

    .line 76
    .line 77
    sget p2, Ll/bnl0;->e:I

    .line 78
    .line 79
    sget p3, Ll/bnl0;->f:I

    .line 80
    .line 81
    invoke-virtual {p1, v0, p2, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    .line 82
    .line 83
    .line 84
    iget-object p0, p0, Ll/oef;->u:Lv/VLinear;

    .line 85
    .line 86
    const/4 p1, 0x1

    .line 87
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public a0(Lcom/p1/mobile/putong/data/User;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/oef;->u:Lv/VLinear;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/oef;->u:Lv/VLinear;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 13
    .line 14
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->answers:Ljava/util/List;

    .line 15
    .line 16
    move v0, v1

    .line 17
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-ge v0, v2, :cond_2

    .line 22
    .line 23
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    check-cast v2, Lcom/p1/mobile/putong/data/Answer;

    .line 28
    .line 29
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 30
    .line 31
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->d0:Ll/kua;

    .line 32
    .line 33
    iget-object v4, v2, Lcom/p1/mobile/putong/data/Answer;->question:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v3, v4}, Ll/kua;->o3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Question;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    if-eqz v3, :cond_1

    .line 40
    .line 41
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    const/4 v5, 0x1

    .line 46
    sub-int/2addr v4, v5

    .line 47
    if-ne v0, v4, :cond_0

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_0
    move v5, v1

    .line 51
    :goto_1
    invoke-virtual {p0, v2, v3, v5}, Ll/oef;->Z(Lcom/p1/mobile/putong/data/Answer;Lcom/p1/mobile/putong/core/data/Question;Z)V

    .line 52
    .line 53
    .line 54
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_2
    return-void
.end method

.method public m()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "\u6211\u7684\u95ee\u7b54"

    .line 2
    .line 3
    return-object p0
.end method

.method public n()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "question"

    .line 2
    .line 3
    return-object p0
.end method

.method public q(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->q(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/oef;->v:Landroid/view/View;

    .line 5
    .line 6
    new-instance v0, Ll/jef;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Ll/jef;-><init>(Ll/oef;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public y(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    sget v0, Ll/kec0;->C2:I

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    sget v0, Ll/adc0;->O1:I

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lv/VLinear;

    .line 23
    .line 24
    iput-object v0, p0, Ll/oef;->u:Lv/VLinear;

    .line 25
    .line 26
    sget v0, Ll/adc0;->v:I

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iput-object v0, p0, Ll/oef;->v:Landroid/view/View;

    .line 33
    .line 34
    return-object p1
.end method

.method public z()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->x()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/oef;->a0(Lcom/p1/mobile/putong/data/User;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
