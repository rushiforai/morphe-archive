.class public Ll/c1i0;
.super Ll/g1e;
.source "SourceFile"


# instance fields
.field public j:Landroid/widget/TextView;

.field public k:Landroid/widget/TextView;

.field public l:Landroid/widget/TextView;

.field public m:Landroid/widget/TextView;

.field public final n:Ljava/lang/String;

.field public final o:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    sget v1, Ll/agc0;->p:I

    .line 3
    .line 4
    invoke-direct {p0, p1, v0, v1}, Ll/g1e;-><init>(Landroid/content/Context;ZI)V

    .line 5
    .line 6
    .line 7
    iput-object p2, p0, Ll/c1i0;->n:Ljava/lang/String;

    .line 8
    .line 9
    iput-object p1, p0, Ll/c1i0;->o:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic E(Ll/c1i0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/c1i0;->J(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic F(Ll/c1i0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/c1i0;->I(Landroid/view/View;)V

    return-void
.end method

.method private H()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/c1i0;->n:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "from_heartbeat"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const-string v1, "\u53bb\u804a\u5929"

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/c1i0;->k:Landroid/widget/TextView;

    .line 14
    .line 15
    const-string v2, "\u606d\u559c\u4f60\u6210\u529f\u6dfb\u52a0\u4e86\u6807\u7b7e\uff0c\u5df2\u5f00\u542f\u672c\u6b21\u5fc3\u52a8\u4fe1\u53f7\uff01"

    .line 16
    .line 17
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/c1i0;->l:Landroid/widget/TextView;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget-object v0, p0, Ll/c1i0;->n:Ljava/lang/String;

    .line 27
    .line 28
    const-string v2, "from_card_tag_guide"

    .line 29
    .line 30
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    iget-object v0, p0, Ll/c1i0;->k:Landroid/widget/TextView;

    .line 37
    .line 38
    const-string v1, "\u606d\u559c\u4f60\u6210\u529f\u6dfb\u52a0\u4e86\u6807\u7b7e\uff0c\u5c06\u4f1a\u52a0\u5927\u66dd\u5149\u4e3a\u4f60\u5bfb\u627e\u66f4\u5408\u9002\u7684\u4eba\uff01"

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/c1i0;->l:Landroid/widget/TextView;

    .line 44
    .line 45
    const-string v1, "\u7ee7\u7eed\u5212\u5361"

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    iget-object v0, p0, Ll/c1i0;->n:Ljava/lang/String;

    .line 52
    .line 53
    const-string v2, "from_message_tag_guide"

    .line 54
    .line 55
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_2

    .line 60
    .line 61
    iget-object v0, p0, Ll/c1i0;->k:Landroid/widget/TextView;

    .line 62
    .line 63
    const-string v2, "\u606d\u559c\u4f60\u6210\u529f\u6dfb\u52a0\u4e86\u6807\u7b7e\uff0c\u5feb\u548c\u5bf9\u65b9\u804a\u804a\u5427\uff5e"

    .line 64
    .line 65
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Ll/c1i0;->l:Landroid/widget/TextView;

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 71
    .line 72
    .line 73
    :cond_2
    :goto_0
    iget-object v0, p0, Ll/c1i0;->l:Landroid/widget/TextView;

    .line 74
    .line 75
    new-instance v1, Ll/a1i0;

    .line 76
    .line 77
    invoke-direct {v1, p0}, Ll/a1i0;-><init>(Ll/c1i0;)V

    .line 78
    .line 79
    .line 80
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Ll/c1i0;->m:Landroid/widget/TextView;

    .line 84
    .line 85
    new-instance v1, Ll/b1i0;

    .line 86
    .line 87
    invoke-direct {v1, p0}, Ll/b1i0;-><init>(Ll/c1i0;)V

    .line 88
    .line 89
    .line 90
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method private synthetic I(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/c1i0;->n:Ljava/lang/String;

    .line 5
    .line 6
    const-string p1, "from_card_tag_guide"

    .line 7
    .line 8
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x2

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p0, 0x1

    .line 17
    :goto_0
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string p1, "click_options"

    .line 22
    .line 23
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    filled-new-array {p0}, [Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string p1, "e_tag_confirmation"

    .line 32
    .line 33
    const-string v0, "p_love_signal_guide_tag"

    .line 34
    .line 35
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method private synthetic J(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/gj40;->o()Ll/gj40;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Ll/c1i0;->o:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    const-string v1, "e_card_add_tag"

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-virtual {p1, v0, v1, v2}, Ll/gj40;->C(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x3

    .line 17
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string p1, "click_options"

    .line 22
    .line 23
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    filled-new-array {p0}, [Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string p1, "e_tag_confirmation"

    .line 32
    .line 33
    const-string v0, "p_love_signal_guide_tag"

    .line 34
    .line 35
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method


# virtual methods
.method public G(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/d1i0;->b(Ll/c1i0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroidx/appcompat/app/a;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/c1i0;->o:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p0, p1, v0}, Ll/c1i0;->G(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Ll/nu0;->setContentView(Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    invoke-direct {p0}, Ll/c1i0;->H()V

    .line 19
    .line 20
    .line 21
    const/4 p1, 0x0

    .line 22
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public show()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/g1e;->show()V

    .line 2
    .line 3
    .line 4
    const-string p0, "e_tag_confirmation"

    .line 5
    .line 6
    const-string v0, "p_love_signal_guide_tag"

    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
