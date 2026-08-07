.class public Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/AutoVDraweeView;

.field public b:Landroid/widget/TextView;

.field public c:Landroid/widget/EditText;

.field public d:Lv/AutoVDraweeView;

.field public e:Landroid/widget/TextView;

.field public f:Landroid/widget/TextView;

.field public g:Landroid/view/View;

.field public h:Landroid/view/View;

.field public i:Landroid/animation/ValueAnimator;

.field public j:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;FI)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->k(FI)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;ILandroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->i(ILandroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;ILcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditAct;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->h(ILcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditAct;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditAct;Ljava/lang/String;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p2, ""

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->o2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;FI)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->j(FI)V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->g:Landroid/view/View;

    return-object p0
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;)Landroid/widget/TextView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->e:Landroid/widget/TextView;

    return-object p0
.end method


# virtual methods
.method public final synthetic h(ILcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditAct;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p4, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->g:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p4}, Landroid/view/View;->isSelected()Z

    .line 4
    .line 5
    .line 6
    move-result p4

    .line 7
    const-string v0, "button_type"

    .line 8
    .line 9
    const-string v1, "p_write_letter"

    .line 10
    .line 11
    const-string v2, "e_send_letter"

    .line 12
    .line 13
    if-nez p4, :cond_0

    .line 14
    .line 15
    new-instance p0, Ll/pf60;

    .line 16
    .line 17
    const-string p2, "grey"

    .line 18
    .line 19
    invoke-direct {p0, v0, p2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    filled-new-array {p0}, [Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {v2, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 27
    .line 28
    .line 29
    new-instance p0, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    const-string p2, "\u5927\u4e8e"

    .line 32
    .line 33
    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string p1, "\u4e2a\u5b57\u624d\u53ef\u4ee5\u53d1\u9001"

    .line 40
    .line 41
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_0
    new-instance p1, Ll/pf60;

    .line 53
    .line 54
    const-string p4, "bright"

    .line 55
    .line 56
    invoke-direct {p1, v0, p4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    filled-new-array {p1}, [Ll/pf60;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-static {v2, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 64
    .line 65
    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->c:Landroid/widget/EditText;

    .line 67
    .line 68
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {p2, p3, p0}, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditAct;->q2(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public final synthetic i(ILandroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    check-cast p2, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->o(FI)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic j(FI)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->o(FI)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic k(FI)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->o(FI)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final l(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/16 v0, 0x8

    .line 6
    .line 7
    if-le p0, v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    invoke-virtual {p1, p0, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const-string p1, "..."

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string v0, "\uff08   "

    .line 23
    .line 24
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string p1, "   \uff09"

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method

.method public m(Ljava/lang/Boolean;Ljava/lang/Integer;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->j:Z

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    const/high16 v2, 0x3f800000    # 1.0f

    .line 9
    .line 10
    if-eqz p1, :cond_1

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    invoke-virtual {p0, v2, p1}, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->o(FI)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    const/4 p1, 0x1

    .line 23
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->j:Z

    .line 24
    .line 25
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    invoke-virtual {p0, v1, v2, p1}, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->p(FFI)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    if-eqz v0, :cond_2

    .line 34
    .line 35
    const/4 p1, 0x0

    .line 36
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->j:Z

    .line 37
    .line 38
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 39
    .line 40
    .line 41
    move-result p2

    .line 42
    invoke-virtual {p0, v2, v1, p2}, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->p(FFI)V

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->e:Landroid/widget/TextView;

    .line 46
    .line 47
    invoke-static {p0, p1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 48
    .line 49
    .line 50
    :cond_2
    return-void
.end method

.method public n(Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditAct;Ljava/lang/String;ILjava/lang/String;)V
    .locals 3

    .line 1
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->c:Landroid/widget/EditText;

    .line 8
    .line 9
    invoke-virtual {v0, p4}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object p4, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->c:Landroid/widget/EditText;

    .line 13
    .line 14
    new-instance v0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout$a;

    .line 15
    .line 16
    invoke-direct {v0, p0, p3}, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout$a;-><init>(Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;I)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p4, v0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 20
    .line 21
    .line 22
    sget-object p4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object p4, p4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 25
    .line 26
    invoke-virtual {p4, p2}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 27
    .line 28
    .line 29
    move-result-object p4

    .line 30
    if-eqz p4, :cond_2

    .line 31
    .line 32
    if-nez p1, :cond_1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->b:Landroid/widget/TextView;

    .line 36
    .line 37
    new-instance v1, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    const-string v2, "To "

    .line 40
    .line 41
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    iget-object v2, p4, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->l(Ljava/lang/String;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->f:Landroid/widget/TextView;

    .line 61
    .line 62
    new-instance v1, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    const-string v2, "By "

    .line 65
    .line 66
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 70
    .line 71
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 72
    .line 73
    invoke-virtual {v2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 78
    .line 79
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->l(Ljava/lang/String;)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->a:Lv/AutoVDraweeView;

    .line 94
    .line 95
    invoke-virtual {p4}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 100
    .line 101
    invoke-virtual {v0, v1}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    new-instance v0, Ll/pf60;

    .line 105
    .line 106
    const-string v1, "button_type"

    .line 107
    .line 108
    const-string v2, "grey"

    .line 109
    .line 110
    invoke-direct {v0, v1, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 111
    .line 112
    .line 113
    filled-new-array {v0}, [Ll/pf60;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    const-string v1, "e_send_letter"

    .line 118
    .line 119
    const-string v2, "p_write_letter"

    .line 120
    .line 121
    invoke-static {v1, v2, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 122
    .line 123
    .line 124
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->a:Lv/AutoVDraweeView;

    .line 125
    .line 126
    new-instance v1, Ll/rcw;

    .line 127
    .line 128
    invoke-direct {v1, p1, p2}, Ll/rcw;-><init>(Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditAct;Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 132
    .line 133
    .line 134
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->g:Landroid/view/View;

    .line 135
    .line 136
    new-instance v0, Ll/scw;

    .line 137
    .line 138
    invoke-direct {v0, p0, p3, p1, p4}, Ll/scw;-><init>(Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;ILcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditAct;Lcom/p1/mobile/putong/data/User;)V

    .line 139
    .line 140
    .line 141
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 142
    .line 143
    .line 144
    :cond_2
    :goto_0
    return-void
.end method

.method public final o(FI)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->b:Landroid/widget/TextView;

    .line 2
    .line 3
    const/high16 v1, 0x42ec0000    # 118.0f

    .line 4
    .line 5
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    neg-int v1, v1

    .line 10
    int-to-float v1, v1

    .line 11
    mul-float/2addr v1, p1

    .line 12
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->a:Lv/AutoVDraweeView;

    .line 16
    .line 17
    invoke-static {}, Ll/bnl0;->y0()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    int-to-float v1, v1

    .line 22
    const/high16 v2, 0x40000000    # 2.0f

    .line 23
    .line 24
    div-float/2addr v1, v2

    .line 25
    const/high16 v2, 0x428c0000    # 70.0f

    .line 26
    .line 27
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    int-to-float v2, v2

    .line 32
    sub-float/2addr v1, v2

    .line 33
    mul-float/2addr v1, p1

    .line 34
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationX(F)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->a:Lv/AutoVDraweeView;

    .line 38
    .line 39
    const/high16 v1, 0x3e800000    # 0.25f

    .line 40
    .line 41
    mul-float/2addr v1, p1

    .line 42
    const/high16 v2, 0x3f800000    # 1.0f

    .line 43
    .line 44
    sub-float/2addr v2, v1

    .line 45
    invoke-virtual {v0, v2}, Landroid/view/View;->setScaleX(F)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->a:Lv/AutoVDraweeView;

    .line 49
    .line 50
    invoke-virtual {v0, v2}, Landroid/view/View;->setScaleY(F)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->a:Lv/AutoVDraweeView;

    .line 54
    .line 55
    const/high16 v1, 0x41500000    # 13.0f

    .line 56
    .line 57
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    neg-int v1, v1

    .line 62
    int-to-float v1, v1

    .line 63
    mul-float/2addr v1, p1

    .line 64
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->h:Landroid/view/View;

    .line 68
    .line 69
    const/high16 v1, 0x429a0000    # 77.0f

    .line 70
    .line 71
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    int-to-float v1, v1

    .line 76
    mul-float/2addr v1, p1

    .line 77
    float-to-int v1, v1

    .line 78
    neg-int v1, v1

    .line 79
    invoke-static {v0, v1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 80
    .line 81
    .line 82
    const/high16 v0, 0x43660000    # 230.0f

    .line 83
    .line 84
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    sub-int/2addr p2, v0

    .line 89
    int-to-float p2, p2

    .line 90
    mul-float/2addr p1, p2

    .line 91
    float-to-int p1, p1

    .line 92
    const/4 p2, 0x0

    .line 93
    invoke-static {p2, p1}, Ljava/lang/Math;->max(II)I

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->e:Landroid/widget/TextView;

    .line 98
    .line 99
    invoke-static {p0, p1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/adc0;->we:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->h:Landroid/view/View;

    .line 11
    .line 12
    sget v0, Ll/adc0;->V:I

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lv/AutoVDraweeView;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->a:Lv/AutoVDraweeView;

    .line 21
    .line 22
    sget v0, Ll/adc0;->ob:I

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Landroid/widget/TextView;

    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->b:Landroid/widget/TextView;

    .line 31
    .line 32
    sget v0, Ll/adc0;->o3:I

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Landroid/widget/EditText;

    .line 39
    .line 40
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->c:Landroid/widget/EditText;

    .line 41
    .line 42
    sget v0, Ll/adc0;->v0:I

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    check-cast v0, Lv/AutoVDraweeView;

    .line 49
    .line 50
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->d:Lv/AutoVDraweeView;

    .line 51
    .line 52
    sget v0, Ll/adc0;->Wd:I

    .line 53
    .line 54
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    check-cast v0, Landroid/widget/TextView;

    .line 59
    .line 60
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->e:Landroid/widget/TextView;

    .line 61
    .line 62
    sget v0, Ll/adc0;->fc:I

    .line 63
    .line 64
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    check-cast v0, Landroid/widget/TextView;

    .line 69
    .line 70
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->f:Landroid/widget/TextView;

    .line 71
    .line 72
    sget v0, Ll/adc0;->ad:I

    .line 73
    .line 74
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->g:Landroid/view/View;

    .line 79
    .line 80
    invoke-static {}, Ll/bnl0;->y0()I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    int-to-float v0, v0

    .line 85
    const/high16 v1, 0x43200000    # 160.0f

    .line 86
    .line 87
    mul-float/2addr v0, v1

    .line 88
    const v1, 0x43bb8000    # 375.0f

    .line 89
    .line 90
    .line 91
    div-float/2addr v0, v1

    .line 92
    float-to-int v0, v0

    .line 93
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->d:Lv/AutoVDraweeView;

    .line 94
    .line 95
    invoke-static {v1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 96
    .line 97
    .line 98
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->d:Lv/AutoVDraweeView;

    .line 99
    .line 100
    const-string v0, "https://auto.tancdn.com/v1/images/eyJpZCI6IlE3NUtTRVJQQk9USEFZNFRZRk1NSDRVQk01VFlHRTE0IiwidyI6MTEyNSwiaCI6NjAwLCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MTIxMzAwMzcwMzE0OTQzNzI2MDh9.png"

    .line 101
    .line 102
    const/4 v1, 0x1

    .line 103
    invoke-virtual {p0, v0, v1}, Lv/AutoVDraweeView;->x(Ljava/lang/String;I)V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public final p(FFI)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->i:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->i:Landroid/animation/ValueAnimator;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 14
    .line 15
    .line 16
    :cond_0
    const/4 v0, 0x2

    .line 17
    new-array v0, v0, [F

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    aput p1, v0, v1

    .line 21
    .line 22
    const/4 p1, 0x1

    .line 23
    aput p2, v0, p1

    .line 24
    .line 25
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->i:Landroid/animation/ValueAnimator;

    .line 30
    .line 31
    const-wide/16 v0, 0xc8

    .line 32
    .line 33
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->i:Landroid/animation/ValueAnimator;

    .line 37
    .line 38
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->removeAllUpdateListeners()V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->i:Landroid/animation/ValueAnimator;

    .line 42
    .line 43
    invoke-virtual {p1}, Landroid/animation/Animator;->removeAllListeners()V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->i:Landroid/animation/ValueAnimator;

    .line 47
    .line 48
    new-instance v0, Ll/tcw;

    .line 49
    .line 50
    invoke-direct {v0, p0, p3}, Ll/tcw;-><init>(Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;I)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->i:Landroid/animation/ValueAnimator;

    .line 57
    .line 58
    new-instance v0, Ll/ucw;

    .line 59
    .line 60
    invoke-direct {v0, p0, p2, p3}, Ll/ucw;-><init>(Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;FI)V

    .line 61
    .line 62
    .line 63
    new-instance v1, Ll/vcw;

    .line 64
    .line 65
    invoke-direct {v1, p0, p2, p3}, Ll/vcw;-><init>(Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;FI)V

    .line 66
    .line 67
    .line 68
    invoke-static {p1, v0, v1}, Ll/gt0;->g(Landroid/animation/Animator;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 69
    .line 70
    .line 71
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->i:Landroid/animation/ValueAnimator;

    .line 72
    .line 73
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 74
    .line 75
    .line 76
    return-void
.end method
