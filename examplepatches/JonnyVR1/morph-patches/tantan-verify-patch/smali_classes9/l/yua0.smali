.class public Ll/yua0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/vua0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

.field public b:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

.field public c:Ll/vua0;

.field public d:Landroid/content/Context;

.field public e:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopTextInputFrag;

.field public f:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

.field public g:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

.field public h:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopTextInputFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/yua0;->d:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Ll/yua0;->e:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopTextInputFrag;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Ll/yua0;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/yua0;->m(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic b(Ll/yua0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/yua0;->n()V

    return-void
.end method

.method private synthetic n()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/yua0;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->e:Lv/VEditText;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 6
    .line 7
    .line 8
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object p0, p0, Ll/yua0;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->e:Lv/VEditText;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private r()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/yua0;->e:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopTextInputFrag;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->W4()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/yua0;->b:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->m()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Ll/yua0;->b:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 15
    .line 16
    iget-object v1, p0, Ll/yua0;->e:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopTextInputFrag;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->l(Ll/bqa0;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ll/yua0;->l()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->b2()Lcom/p1/mobile/putong/core/ui/profile/loop/a;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v1, p0, Ll/yua0;->e:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopTextInputFrag;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->W0(Ll/bqa0;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/yua0;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 35
    .line 36
    iget-object v1, p0, Ll/yua0;->h:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->setFrom(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/yua0;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 42
    .line 43
    new-instance v1, Ll/wua0;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Ll/wua0;-><init>(Ll/yua0;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->setInputTextChangeListener(Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView$b;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/yua0;->d:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/zua0;->b(Ll/yua0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d(Ll/vua0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/yua0;->c:Ll/vua0;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/yua0;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->e:Lv/VEditText;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-nez p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public f(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)Z
    .locals 3

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/yua0;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->e:Lv/VEditText;

    .line 12
    .line 13
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->ob(Ljava/lang/String;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    const/4 v2, 0x0

    .line 34
    if-nez v1, :cond_0

    .line 35
    .line 36
    iget-object p0, p0, Ll/yua0;->f:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->pageId:Ljava/lang/String;

    .line 39
    .line 40
    const-string p1, "about_me_finish_failed_reason"

    .line 41
    .line 42
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    filled-new-array {p1}, [Ll/pf60;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    const-string v0, "e_profile_unsuccessful"

    .line 51
    .line 52
    invoke-static {v0, p0, p1}, Ll/i4g0;->B(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 53
    .line 54
    .line 55
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 56
    .line 57
    sget p1, Lcom/p1/mobile/putong/core/profile/R$string;->k0:I

    .line 58
    .line 59
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    return v2

    .line 67
    :cond_0
    iget-object v0, p0, Ll/yua0;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 68
    .line 69
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->g:Landroid/widget/TextView;

    .line 70
    .line 71
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 72
    .line 73
    .line 74
    sget-object v0, Ll/bsj0;->j:Ll/qcj;

    .line 75
    .line 76
    iget-object v1, p0, Ll/yua0;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 77
    .line 78
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->e:Lv/VEditText;

    .line 79
    .line 80
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-interface {v0, v1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    check-cast v0, Ljava/lang/String;

    .line 89
    .line 90
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    if-nez v0, :cond_1

    .line 95
    .line 96
    sget p0, Lcom/p1/mobile/putong/core/profile/R$string;->U2:I

    .line 97
    .line 98
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 99
    .line 100
    .line 101
    return v2

    .line 102
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->NICKNAME:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 103
    .line 104
    const/4 v1, 0x1

    .line 105
    if-ne p1, v0, :cond_2

    .line 106
    .line 107
    iget-object p1, p0, Ll/yua0;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 108
    .line 109
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->e:Lv/VEditText;

    .line 110
    .line 111
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    invoke-static {p1}, Ll/bsj0;->L(Ljava/lang/String;)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    if-nez v0, :cond_2

    .line 128
    .line 129
    iget-object v0, p0, Ll/yua0;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 130
    .line 131
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->g:Landroid/widget/TextView;

    .line 132
    .line 133
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 134
    .line 135
    .line 136
    iget-object p0, p0, Ll/yua0;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 137
    .line 138
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->g:Landroid/widget/TextView;

    .line 139
    .line 140
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 141
    .line 142
    .line 143
    return v2

    .line 144
    :cond_2
    return v1
.end method

.method public final i()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/yua0;->l()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->b2()Lcom/p1/mobile/putong/core/ui/profile/loop/a;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->u0()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Ll/yua0;->f:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 14
    .line 15
    sget-object v2, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->ABOUT_ME:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 16
    .line 17
    const/4 v3, 0x0

    .line 18
    if-ne v1, v2, :cond_0

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-nez v1, :cond_a

    .line 27
    .line 28
    iget-object v1, p0, Ll/yua0;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 29
    .line 30
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->e:Lv/VEditText;

    .line 31
    .line 32
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 33
    .line 34
    .line 35
    goto/16 :goto_0

    .line 36
    .line 37
    :cond_0
    sget-object v2, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->COMPANY:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 38
    .line 39
    if-ne v1, v2, :cond_1

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 42
    .line 43
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 44
    .line 45
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Work;->company:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-nez v1, :cond_a

    .line 52
    .line 53
    iget-object v1, p0, Ll/yua0;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 54
    .line 55
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->e:Lv/VEditText;

    .line 56
    .line 57
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 58
    .line 59
    .line 60
    goto/16 :goto_0

    .line 61
    .line 62
    :cond_1
    sget-object v2, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->MAJOR:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 63
    .line 64
    if-ne v1, v2, :cond_2

    .line 65
    .line 66
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 67
    .line 68
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 69
    .line 70
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Studies;->major:Ljava/lang/String;

    .line 71
    .line 72
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    if-nez v1, :cond_a

    .line 77
    .line 78
    iget-object v1, p0, Ll/yua0;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 79
    .line 80
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->e:Lv/VEditText;

    .line 81
    .line 82
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 83
    .line 84
    .line 85
    goto/16 :goto_0

    .line 86
    .line 87
    :cond_2
    sget-object v2, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->SCHOOL:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 88
    .line 89
    if-ne v1, v2, :cond_3

    .line 90
    .line 91
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 92
    .line 93
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 94
    .line 95
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 96
    .line 97
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    if-nez v1, :cond_a

    .line 102
    .line 103
    iget-object v1, p0, Ll/yua0;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 104
    .line 105
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->e:Lv/VEditText;

    .line 106
    .line 107
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 108
    .line 109
    .line 110
    goto/16 :goto_0

    .line 111
    .line 112
    :cond_3
    sget-object v2, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->NICKNAME:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 113
    .line 114
    if-ne v1, v2, :cond_4

    .line 115
    .line 116
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 117
    .line 118
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 119
    .line 120
    .line 121
    move-result v1

    .line 122
    if-nez v1, :cond_a

    .line 123
    .line 124
    iget-object v1, p0, Ll/yua0;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 125
    .line 126
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->e:Lv/VEditText;

    .line 127
    .line 128
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 129
    .line 130
    .line 131
    goto/16 :goto_0

    .line 132
    .line 133
    :cond_4
    sget-object v2, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->SIGNATURE:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 134
    .line 135
    if-ne v1, v2, :cond_5

    .line 136
    .line 137
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 138
    .line 139
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    if-nez v1, :cond_a

    .line 144
    .line 145
    iget-object v1, p0, Ll/yua0;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 146
    .line 147
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->e:Lv/VEditText;

    .line 148
    .line 149
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 150
    .line 151
    .line 152
    goto/16 :goto_0

    .line 153
    .line 154
    :cond_5
    sget-object v2, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->FAMILY:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 155
    .line 156
    if-ne v1, v2, :cond_6

    .line 157
    .line 158
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 159
    .line 160
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 161
    .line 162
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->mate:Lcom/p1/mobile/putong/data/ProfileMate;

    .line 163
    .line 164
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ProfileMate;->familyBackground:Ljava/util/List;

    .line 165
    .line 166
    invoke-static {v0}, Ll/dhx;->a(Ljava/util/List;)Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 171
    .line 172
    .line 173
    move-result v1

    .line 174
    if-nez v1, :cond_a

    .line 175
    .line 176
    iget-object v1, p0, Ll/yua0;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 177
    .line 178
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->e:Lv/VEditText;

    .line 179
    .line 180
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 181
    .line 182
    .line 183
    goto/16 :goto_0

    .line 184
    .line 185
    :cond_6
    sget-object v2, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->LOVE:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 186
    .line 187
    if-ne v1, v2, :cond_7

    .line 188
    .line 189
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 190
    .line 191
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 192
    .line 193
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->mate:Lcom/p1/mobile/putong/data/ProfileMate;

    .line 194
    .line 195
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ProfileMate;->loveView:Ljava/util/List;

    .line 196
    .line 197
    invoke-static {v0}, Ll/dhx;->a(Ljava/util/List;)Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 202
    .line 203
    .line 204
    move-result v1

    .line 205
    if-nez v1, :cond_a

    .line 206
    .line 207
    iget-object v1, p0, Ll/yua0;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 208
    .line 209
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->e:Lv/VEditText;

    .line 210
    .line 211
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 212
    .line 213
    .line 214
    goto :goto_0

    .line 215
    :cond_7
    sget-object v2, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->HALF:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 216
    .line 217
    if-ne v1, v2, :cond_8

    .line 218
    .line 219
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 220
    .line 221
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 222
    .line 223
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->mate:Lcom/p1/mobile/putong/data/ProfileMate;

    .line 224
    .line 225
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ProfileMate;->idealPartner:Ljava/util/List;

    .line 226
    .line 227
    invoke-static {v0}, Ll/dhx;->a(Ljava/util/List;)Ljava/lang/String;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 232
    .line 233
    .line 234
    move-result v1

    .line 235
    if-nez v1, :cond_a

    .line 236
    .line 237
    iget-object v1, p0, Ll/yua0;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 238
    .line 239
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->e:Lv/VEditText;

    .line 240
    .line 241
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 242
    .line 243
    .line 244
    goto :goto_0

    .line 245
    :cond_8
    sget-object v2, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->INTEREST:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 246
    .line 247
    if-ne v1, v2, :cond_9

    .line 248
    .line 249
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 250
    .line 251
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 252
    .line 253
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->mate:Lcom/p1/mobile/putong/data/ProfileMate;

    .line 254
    .line 255
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ProfileMate;->hobbies:Ljava/util/List;

    .line 256
    .line 257
    invoke-static {v0}, Ll/dhx;->a(Ljava/util/List;)Ljava/lang/String;

    .line 258
    .line 259
    .line 260
    move-result-object v0

    .line 261
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 262
    .line 263
    .line 264
    move-result v1

    .line 265
    if-nez v1, :cond_a

    .line 266
    .line 267
    iget-object v1, p0, Ll/yua0;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 268
    .line 269
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->e:Lv/VEditText;

    .line 270
    .line 271
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 272
    .line 273
    .line 274
    goto :goto_0

    .line 275
    :cond_9
    sget-object v2, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->DO_NOT_WISH:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 276
    .line 277
    if-ne v1, v2, :cond_a

    .line 278
    .line 279
    invoke-static {v0}, Ll/tr90;->r(Lcom/p1/mobile/putong/data/User;)Z

    .line 280
    .line 281
    .line 282
    move-result v1

    .line 283
    if-eqz v1, :cond_a

    .line 284
    .line 285
    iget-object v1, p0, Ll/yua0;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 286
    .line 287
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->e:Lv/VEditText;

    .line 288
    .line 289
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 290
    .line 291
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 292
    .line 293
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 294
    .line 295
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->unideal:Ljava/util/List;

    .line 296
    .line 297
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 298
    .line 299
    .line 300
    move-result-object v0

    .line 301
    check-cast v0, Ljava/lang/CharSequence;

    .line 302
    .line 303
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 304
    .line 305
    .line 306
    :cond_a
    :goto_0
    iget-object v0, p0, Ll/yua0;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 307
    .line 308
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->e:Lv/VEditText;

    .line 309
    .line 310
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 311
    .line 312
    .line 313
    move-result-object v0

    .line 314
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 315
    .line 316
    .line 317
    move-result-object v0

    .line 318
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 319
    .line 320
    .line 321
    move-result v1

    .line 322
    if-eqz v1, :cond_d

    .line 323
    .line 324
    iget-object v1, p0, Ll/yua0;->g:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 325
    .line 326
    iget-boolean v1, v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->couldInputEmpty:Z

    .line 327
    .line 328
    if-eqz v1, :cond_b

    .line 329
    .line 330
    goto :goto_1

    .line 331
    :cond_b
    iget-object v0, p0, Ll/yua0;->e:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopTextInputFrag;

    .line 332
    .line 333
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->W4()Z

    .line 334
    .line 335
    .line 336
    move-result v0

    .line 337
    iget-object v1, p0, Ll/yua0;->b:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 338
    .line 339
    if-eqz v0, :cond_c

    .line 340
    .line 341
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->m()V

    .line 342
    .line 343
    .line 344
    iget-object v0, p0, Ll/yua0;->b:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 345
    .line 346
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->c:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 347
    .line 348
    invoke-virtual {v0, v3}, Landroid/view/View;->setEnabled(Z)V

    .line 349
    .line 350
    .line 351
    goto :goto_2

    .line 352
    :cond_c
    iget-object v0, v1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->b:Lv/VButton;

    .line 353
    .line 354
    invoke-virtual {v0, v3}, Landroid/view/View;->setEnabled(Z)V

    .line 355
    .line 356
    .line 357
    iget-object v0, p0, Ll/yua0;->b:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 358
    .line 359
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->b:Lv/VButton;

    .line 360
    .line 361
    invoke-virtual {v0, v3}, Landroid/view/View;->setClickable(Z)V

    .line 362
    .line 363
    .line 364
    iget-object v0, p0, Ll/yua0;->b:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 365
    .line 366
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->b:Lv/VButton;

    .line 367
    .line 368
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 369
    .line 370
    .line 371
    move-result-object v1

    .line 372
    sget v2, Ll/kbc0;->r1:I

    .line 373
    .line 374
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 375
    .line 376
    .line 377
    move-result-object v1

    .line 378
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 379
    .line 380
    .line 381
    goto :goto_2

    .line 382
    :cond_d
    :goto_1
    iget-object v1, p0, Ll/yua0;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 383
    .line 384
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->e:Lv/VEditText;

    .line 385
    .line 386
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 387
    .line 388
    .line 389
    move-result v0

    .line 390
    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setSelection(I)V

    .line 391
    .line 392
    .line 393
    :goto_2
    invoke-static {}, Ll/xra;->f()Z

    .line 394
    .line 395
    .line 396
    move-result v0

    .line 397
    if-eqz v0, :cond_f

    .line 398
    .line 399
    iget-object v0, p0, Ll/yua0;->e:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopTextInputFrag;

    .line 400
    .line 401
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->U4()Z

    .line 402
    .line 403
    .line 404
    move-result v0

    .line 405
    if-eqz v0, :cond_f

    .line 406
    .line 407
    iget-object v0, p0, Ll/yua0;->e:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopTextInputFrag;

    .line 408
    .line 409
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->z:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 410
    .line 411
    invoke-static {v0}, Ll/tr90;->m(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)Ljava/lang/String;

    .line 412
    .line 413
    .line 414
    move-result-object v0

    .line 415
    iget-object v1, p0, Ll/yua0;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 416
    .line 417
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->a:Landroid/widget/TextView;

    .line 418
    .line 419
    invoke-static {v1, v3}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 420
    .line 421
    .line 422
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 423
    .line 424
    .line 425
    move-result v1

    .line 426
    iget-object v2, p0, Ll/yua0;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 427
    .line 428
    if-nez v1, :cond_e

    .line 429
    .line 430
    iget-object v1, v2, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->b:Landroid/widget/TextView;

    .line 431
    .line 432
    const/4 v2, 0x1

    .line 433
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 434
    .line 435
    .line 436
    iget-object v1, p0, Ll/yua0;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 437
    .line 438
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->b:Landroid/widget/TextView;

    .line 439
    .line 440
    const/high16 v2, 0x41400000    # 12.0f

    .line 441
    .line 442
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 443
    .line 444
    .line 445
    move-result v2

    .line 446
    invoke-static {v1, v2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 447
    .line 448
    .line 449
    iget-object v1, p0, Ll/yua0;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 450
    .line 451
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->b:Landroid/widget/TextView;

    .line 452
    .line 453
    const/high16 v2, 0x41a00000    # 20.0f

    .line 454
    .line 455
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 456
    .line 457
    .line 458
    move-result v2

    .line 459
    invoke-static {v1, v2}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 460
    .line 461
    .line 462
    iget-object v1, p0, Ll/yua0;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 463
    .line 464
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->b:Landroid/widget/TextView;

    .line 465
    .line 466
    const/high16 v2, 0x41700000    # 15.0f

    .line 467
    .line 468
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 469
    .line 470
    .line 471
    iget-object v1, p0, Ll/yua0;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 472
    .line 473
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->b:Landroid/widget/TextView;

    .line 474
    .line 475
    const-string v2, "#a9a9a9"

    .line 476
    .line 477
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 478
    .line 479
    .line 480
    move-result v2

    .line 481
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 482
    .line 483
    .line 484
    iget-object p0, p0, Ll/yua0;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 485
    .line 486
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->b:Landroid/widget/TextView;

    .line 487
    .line 488
    const-string v1, "\u9884\u8ba1\u7b26\u5408%s\u4eba\u7684\u7406\u60f3\u578b"

    .line 489
    .line 490
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 491
    .line 492
    .line 493
    move-result-object v0

    .line 494
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 495
    .line 496
    .line 497
    move-result-object v0

    .line 498
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 499
    .line 500
    .line 501
    return-void

    .line 502
    :cond_e
    iget-object p0, v2, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->a:Landroid/widget/TextView;

    .line 503
    .line 504
    const/high16 v0, 0x42000000    # 32.0f

    .line 505
    .line 506
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 507
    .line 508
    .line 509
    move-result v0

    .line 510
    invoke-static {p0, v0}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 511
    .line 512
    .line 513
    :cond_f
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/vua0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/yua0;->d(Ll/vua0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/yua0;->c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0}, Ll/yua0;->r()V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method

.method public j(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/yua0;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->e:Lv/VEditText;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Ll/jyb;->k(Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object p0, p0, Ll/yua0;->f:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 22
    .line 23
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->ABOUT_ME:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 24
    .line 25
    if-ne p0, v1, :cond_0

    .line 26
    .line 27
    iput-object v0, p1, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->COMPANY:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 31
    .line 32
    if-ne p0, v1, :cond_1

    .line 33
    .line 34
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 37
    .line 38
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Work;->company:Ljava/lang/String;

    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->MAJOR:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 42
    .line 43
    if-ne p0, v1, :cond_2

    .line 44
    .line 45
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 48
    .line 49
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Studies;->major:Ljava/lang/String;

    .line 50
    .line 51
    return-void

    .line 52
    :cond_2
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->SCHOOL:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 53
    .line 54
    if-ne p0, v1, :cond_3

    .line 55
    .line 56
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 59
    .line 60
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 61
    .line 62
    return-void

    .line 63
    :cond_3
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->NICKNAME:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 64
    .line 65
    if-ne p0, v1, :cond_4

    .line 66
    .line 67
    iput-object v0, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 68
    .line 69
    return-void

    .line 70
    :cond_4
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->SIGNATURE:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 71
    .line 72
    if-ne p0, v1, :cond_5

    .line 73
    .line 74
    iput-object v0, p1, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 75
    .line 76
    return-void

    .line 77
    :cond_5
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->FAMILY:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 78
    .line 79
    if-ne p0, v1, :cond_6

    .line 80
    .line 81
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 82
    .line 83
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 84
    .line 85
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->mate:Lcom/p1/mobile/putong/data/ProfileMate;

    .line 86
    .line 87
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileMate;->familyBackground:Ljava/util/List;

    .line 88
    .line 89
    invoke-static {p0, v0}, Ll/dhx;->b(Ljava/util/List;Ljava/lang/String;)Ljava/util/List;

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :cond_6
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->HALF:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 94
    .line 95
    if-ne p0, v1, :cond_7

    .line 96
    .line 97
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 98
    .line 99
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 100
    .line 101
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->mate:Lcom/p1/mobile/putong/data/ProfileMate;

    .line 102
    .line 103
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileMate;->idealPartner:Ljava/util/List;

    .line 104
    .line 105
    invoke-static {p0, v0}, Ll/dhx;->b(Ljava/util/List;Ljava/lang/String;)Ljava/util/List;

    .line 106
    .line 107
    .line 108
    return-void

    .line 109
    :cond_7
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->INTEREST:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 110
    .line 111
    if-ne p0, v1, :cond_8

    .line 112
    .line 113
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 114
    .line 115
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 116
    .line 117
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->mate:Lcom/p1/mobile/putong/data/ProfileMate;

    .line 118
    .line 119
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileMate;->hobbies:Ljava/util/List;

    .line 120
    .line 121
    invoke-static {p0, v0}, Ll/dhx;->b(Ljava/util/List;Ljava/lang/String;)Ljava/util/List;

    .line 122
    .line 123
    .line 124
    return-void

    .line 125
    :cond_8
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->LOVE:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 126
    .line 127
    if-ne p0, v1, :cond_9

    .line 128
    .line 129
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 130
    .line 131
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 132
    .line 133
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->mate:Lcom/p1/mobile/putong/data/ProfileMate;

    .line 134
    .line 135
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileMate;->loveView:Ljava/util/List;

    .line 136
    .line 137
    invoke-static {p0, v0}, Ll/dhx;->b(Ljava/util/List;Ljava/lang/String;)Ljava/util/List;

    .line 138
    .line 139
    .line 140
    return-void

    .line 141
    :cond_9
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->DO_NOT_WISH:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 142
    .line 143
    if-ne p0, v1, :cond_a

    .line 144
    .line 145
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 146
    .line 147
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 148
    .line 149
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 150
    .line 151
    filled-new-array {v0}, [Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object p1

    .line 155
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 156
    .line 157
    .line 158
    move-result-object p1

    .line 159
    iput-object p1, p0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->unideal:Ljava/util/List;

    .line 160
    .line 161
    :cond_a
    return-void
.end method

.method public k()Landroid/os/Bundle;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yua0;->e:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopTextInputFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public l()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yua0;->d:Landroid/content/Context;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 4
    .line 5
    return-object p0
.end method

.method public final synthetic m(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p2, :cond_6

    .line 7
    .line 8
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    if-eqz p2, :cond_0

    .line 13
    .line 14
    iget-object p2, p0, Ll/yua0;->g:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 15
    .line 16
    iget-boolean p2, p2, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->couldInputEmpty:Z

    .line 17
    .line 18
    if-nez p2, :cond_0

    .line 19
    .line 20
    goto/16 :goto_1

    .line 21
    .line 22
    :cond_0
    iget-object p2, p0, Ll/yua0;->f:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 23
    .line 24
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->NICKNAME:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 25
    .line 26
    const/4 v2, 0x1

    .line 27
    if-ne p2, v1, :cond_2

    .line 28
    .line 29
    invoke-static {p1}, Ll/bsj0;->L(Ljava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    iget-object p2, p0, Ll/yua0;->b:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 38
    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    iget-object p1, p2, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->b:Lv/VButton;

    .line 42
    .line 43
    invoke-virtual {p1, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Ll/yua0;->b:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 47
    .line 48
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->b:Lv/VButton;

    .line 49
    .line 50
    invoke-virtual {p1, v2}, Landroid/view/View;->setClickable(Z)V

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Ll/yua0;->b:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 54
    .line 55
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->b:Lv/VButton;

    .line 56
    .line 57
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    sget v0, Ll/kbc0;->f:I

    .line 62
    .line 63
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 68
    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :cond_1
    iget-object p1, p2, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->b:Lv/VButton;

    .line 73
    .line 74
    invoke-virtual {p1, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 75
    .line 76
    .line 77
    iget-object p1, p0, Ll/yua0;->b:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 78
    .line 79
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->b:Lv/VButton;

    .line 80
    .line 81
    invoke-virtual {p1, v0}, Landroid/view/View;->setClickable(Z)V

    .line 82
    .line 83
    .line 84
    iget-object p1, p0, Ll/yua0;->b:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 85
    .line 86
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->b:Lv/VButton;

    .line 87
    .line 88
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 89
    .line 90
    .line 91
    move-result-object p2

    .line 92
    sget v0, Ll/kbc0;->r1:I

    .line 93
    .line 94
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 95
    .line 96
    .line 97
    move-result-object p2

    .line 98
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 99
    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_2
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 107
    .line 108
    .line 109
    move-result p1

    .line 110
    if-eqz p1, :cond_4

    .line 111
    .line 112
    iget-object p1, p0, Ll/yua0;->g:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 113
    .line 114
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->couldInputEmpty:Z

    .line 115
    .line 116
    if-eqz p1, :cond_3

    .line 117
    .line 118
    invoke-virtual {p0}, Ll/yua0;->l()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->b2()Lcom/p1/mobile/putong/core/ui/profile/loop/a;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->getFrom()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    const-string p2, "from_filter_purpose_dialog"

    .line 131
    .line 132
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 133
    .line 134
    .line 135
    move-result p1

    .line 136
    if-eqz p1, :cond_4

    .line 137
    .line 138
    :cond_3
    iget-object p1, p0, Ll/yua0;->b:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 139
    .line 140
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->b:Lv/VButton;

    .line 141
    .line 142
    invoke-virtual {p1, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 143
    .line 144
    .line 145
    iget-object p1, p0, Ll/yua0;->b:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 146
    .line 147
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->b:Lv/VButton;

    .line 148
    .line 149
    invoke-virtual {p1, v0}, Landroid/view/View;->setClickable(Z)V

    .line 150
    .line 151
    .line 152
    iget-object p1, p0, Ll/yua0;->b:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 153
    .line 154
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->b:Lv/VButton;

    .line 155
    .line 156
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 157
    .line 158
    .line 159
    move-result-object p2

    .line 160
    sget v0, Ll/kbc0;->r1:I

    .line 161
    .line 162
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 163
    .line 164
    .line 165
    move-result-object p2

    .line 166
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 167
    .line 168
    .line 169
    goto :goto_0

    .line 170
    :cond_4
    iget-object p1, p0, Ll/yua0;->b:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 171
    .line 172
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->b:Lv/VButton;

    .line 173
    .line 174
    invoke-virtual {p1, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 175
    .line 176
    .line 177
    iget-object p1, p0, Ll/yua0;->b:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 178
    .line 179
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->b:Lv/VButton;

    .line 180
    .line 181
    invoke-virtual {p1, v2}, Landroid/view/View;->setClickable(Z)V

    .line 182
    .line 183
    .line 184
    iget-object p1, p0, Ll/yua0;->b:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 185
    .line 186
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->b:Lv/VButton;

    .line 187
    .line 188
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 189
    .line 190
    .line 191
    move-result-object p2

    .line 192
    sget v0, Ll/kbc0;->f:I

    .line 193
    .line 194
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 195
    .line 196
    .line 197
    move-result-object p2

    .line 198
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 199
    .line 200
    .line 201
    :goto_0
    iget-object p1, p0, Ll/yua0;->e:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopTextInputFrag;

    .line 202
    .line 203
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->z:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 204
    .line 205
    if-ne p1, v1, :cond_5

    .line 206
    .line 207
    iget-object p1, p0, Ll/yua0;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 208
    .line 209
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->e:Lv/VEditText;

    .line 210
    .line 211
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 212
    .line 213
    .line 214
    move-result-object p1

    .line 215
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object p1

    .line 219
    invoke-static {p1}, Ll/bsj0;->L(Ljava/lang/String;)Ljava/lang/String;

    .line 220
    .line 221
    .line 222
    move-result-object p1

    .line 223
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 224
    .line 225
    .line 226
    move-result p2

    .line 227
    if-nez p2, :cond_5

    .line 228
    .line 229
    iget-object p2, p0, Ll/yua0;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 230
    .line 231
    iget-object p2, p2, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->g:Landroid/widget/TextView;

    .line 232
    .line 233
    invoke-static {p2, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 234
    .line 235
    .line 236
    iget-object p0, p0, Ll/yua0;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 237
    .line 238
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->g:Landroid/widget/TextView;

    .line 239
    .line 240
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 241
    .line 242
    .line 243
    :cond_5
    return-void

    .line 244
    :cond_6
    :goto_1
    iget-object p1, p0, Ll/yua0;->e:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopTextInputFrag;

    .line 245
    .line 246
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->W4()Z

    .line 247
    .line 248
    .line 249
    move-result p1

    .line 250
    iget-object p2, p0, Ll/yua0;->b:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 251
    .line 252
    if-eqz p1, :cond_7

    .line 253
    .line 254
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->m()V

    .line 255
    .line 256
    .line 257
    iget-object p0, p0, Ll/yua0;->b:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 258
    .line 259
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->c:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 260
    .line 261
    invoke-virtual {p0, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 262
    .line 263
    .line 264
    return-void

    .line 265
    :cond_7
    iget-object p1, p2, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->b:Lv/VButton;

    .line 266
    .line 267
    invoke-virtual {p1, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 268
    .line 269
    .line 270
    iget-object p1, p0, Ll/yua0;->b:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 271
    .line 272
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->b:Lv/VButton;

    .line 273
    .line 274
    invoke-virtual {p1, v0}, Landroid/view/View;->setClickable(Z)V

    .line 275
    .line 276
    .line 277
    iget-object p1, p0, Ll/yua0;->b:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 278
    .line 279
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->b:Lv/VButton;

    .line 280
    .line 281
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 282
    .line 283
    .line 284
    move-result-object p0

    .line 285
    sget p2, Ll/kbc0;->r1:I

    .line 286
    .line 287
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 288
    .line 289
    .line 290
    move-result-object p0

    .line 291
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 292
    .line 293
    .line 294
    return-void
.end method

.method public p(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V
    .locals 4

    .line 1
    iput-object p1, p0, Ll/yua0;->f:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/yua0;->l()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->b2()Lcom/p1/mobile/putong/core/ui/profile/loop/a;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->u0()Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-static {p1, v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->o(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Lcom/p1/mobile/putong/data/User;Landroid/content/Context;)Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Ll/yua0;->g:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 24
    .line 25
    const/4 v1, 0x1

    .line 26
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->showTitle:Z

    .line 27
    .line 28
    iget-object v0, p0, Ll/yua0;->e:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopTextInputFrag;

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->V4()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    const/4 v1, 0x0

    .line 35
    if-nez v0, :cond_0

    .line 36
    .line 37
    iget-object v0, p0, Ll/yua0;->e:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopTextInputFrag;

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->W4()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    :cond_0
    iget-object v0, p0, Ll/yua0;->g:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 46
    .line 47
    const-string v2, "\u4ecb\u7ecd\u4e00\u4e0b\u4f60\u7684\u6027\u683c\u7279\u70b9\u3001\u5174\u8da3\u7231\u597d\u3001\u7406\u60f3\u578b\u7b49\uff0c\u8ba9\u5bf9\u65b9\u66f4\u4e86\u89e3\u4f60"

    .line 48
    .line 49
    invoke-virtual {v0, v2, v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->setSubTitle(Ljava/lang/String;Z)Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ll/yua0;->g:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 53
    .line 54
    const-string v2, "\u6dfb\u52a0\u81ea\u6211\u4ecb\u7ecd"

    .line 55
    .line 56
    iput-object v2, v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->editHint:Ljava/lang/String;

    .line 57
    .line 58
    iget-object v0, p0, Ll/yua0;->e:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopTextInputFrag;

    .line 59
    .line 60
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->W4()Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-eqz v0, :cond_1

    .line 65
    .line 66
    iget-object v0, p0, Ll/yua0;->g:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 67
    .line 68
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->couldInputEmpty:Z

    .line 69
    .line 70
    :cond_1
    iget-object v0, p0, Ll/yua0;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 71
    .line 72
    iget-object v2, p0, Ll/yua0;->g:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 73
    .line 74
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->c(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Ll/yua0;->e:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopTextInputFrag;

    .line 78
    .line 79
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->V4()Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-nez v0, :cond_2

    .line 84
    .line 85
    iget-object v0, p0, Ll/yua0;->e:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopTextInputFrag;

    .line 86
    .line 87
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->W4()Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-eqz v0, :cond_3

    .line 92
    .line 93
    :cond_2
    iget-object v0, p0, Ll/yua0;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 94
    .line 95
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->b:Landroid/widget/TextView;

    .line 96
    .line 97
    const-string v2, "#999999"

    .line 98
    .line 99
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 100
    .line 101
    .line 102
    move-result v2

    .line 103
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Ll/yua0;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 107
    .line 108
    sget v2, Ll/qa00;->j:I

    .line 109
    .line 110
    sget v3, Ll/qa00;->o:I

    .line 111
    .line 112
    invoke-virtual {v0, v2, v3}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->f(II)V

    .line 113
    .line 114
    .line 115
    iget-object v0, p0, Ll/yua0;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 116
    .line 117
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->c:Landroid/widget/RelativeLayout;

    .line 118
    .line 119
    sget v2, Ll/kbc0;->t1:I

    .line 120
    .line 121
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 122
    .line 123
    .line 124
    iget-object v0, p0, Ll/yua0;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 125
    .line 126
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->e:Lv/VEditText;

    .line 127
    .line 128
    new-instance v2, Ll/yua0$a;

    .line 129
    .line 130
    invoke-direct {v2, p0}, Ll/yua0$a;-><init>(Ll/yua0;)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 134
    .line 135
    .line 136
    :cond_3
    iget-object v0, p0, Ll/yua0;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 137
    .line 138
    invoke-virtual {p0}, Ll/yua0;->l()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 139
    .line 140
    .line 141
    move-result-object v2

    .line 142
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->b2()Lcom/p1/mobile/putong/core/ui/profile/loop/a;

    .line 143
    .line 144
    .line 145
    move-result-object v2

    .line 146
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->u0()Lcom/p1/mobile/putong/data/User;

    .line 147
    .line 148
    .line 149
    move-result-object v2

    .line 150
    invoke-virtual {v0, v2, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->e(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V

    .line 151
    .line 152
    .line 153
    iget-object p1, p0, Ll/yua0;->g:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 154
    .line 155
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->defaultContent:Ljava/lang/String;

    .line 156
    .line 157
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 158
    .line 159
    .line 160
    move-result p1

    .line 161
    if-eqz p1, :cond_5

    .line 162
    .line 163
    iget-object p1, p0, Ll/yua0;->g:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 164
    .line 165
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->couldInputEmpty:Z

    .line 166
    .line 167
    if-nez p1, :cond_5

    .line 168
    .line 169
    iget-object p1, p0, Ll/yua0;->e:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopTextInputFrag;

    .line 170
    .line 171
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->W4()Z

    .line 172
    .line 173
    .line 174
    move-result p1

    .line 175
    iget-object v0, p0, Ll/yua0;->b:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 176
    .line 177
    if-eqz p1, :cond_4

    .line 178
    .line 179
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->m()V

    .line 180
    .line 181
    .line 182
    iget-object p1, p0, Ll/yua0;->b:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 183
    .line 184
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->c:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 185
    .line 186
    invoke-virtual {p1, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 187
    .line 188
    .line 189
    goto :goto_0

    .line 190
    :cond_4
    iget-object p1, v0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->b:Lv/VButton;

    .line 191
    .line 192
    invoke-virtual {p1, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 193
    .line 194
    .line 195
    iget-object p1, p0, Ll/yua0;->b:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 196
    .line 197
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->b:Lv/VButton;

    .line 198
    .line 199
    invoke-virtual {p1, v1}, Landroid/view/View;->setClickable(Z)V

    .line 200
    .line 201
    .line 202
    iget-object p1, p0, Ll/yua0;->b:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 203
    .line 204
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;->b:Lv/VButton;

    .line 205
    .line 206
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    sget v1, Ll/kbc0;->r1:I

    .line 211
    .line 212
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 217
    .line 218
    .line 219
    :cond_5
    :goto_0
    iget-object p1, p0, Ll/yua0;->e:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopTextInputFrag;

    .line 220
    .line 221
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->W4()Z

    .line 222
    .line 223
    .line 224
    move-result p1

    .line 225
    if-nez p1, :cond_6

    .line 226
    .line 227
    iget-object p1, p0, Ll/yua0;->e:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopTextInputFrag;

    .line 228
    .line 229
    new-instance v0, Ll/xua0;

    .line 230
    .line 231
    invoke-direct {v0, p0}, Ll/xua0;-><init>(Ll/yua0;)V

    .line 232
    .line 233
    .line 234
    const-wide/16 v1, 0x12c

    .line 235
    .line 236
    invoke-static {p1, v0, v1, v2}, Ll/l51;->I(Lcom/p1/mobile/android/app/Frag;Ljava/lang/Runnable;J)V

    .line 237
    .line 238
    .line 239
    :cond_6
    invoke-virtual {p0}, Ll/yua0;->i()V

    .line 240
    .line 241
    .line 242
    return-void
.end method

.method public q()V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/yua0;->f:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->INDUSTRY:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 4
    .line 5
    if-eq p0, v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->DEPARTMENT:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 8
    .line 9
    if-eq p0, v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->pageId:Ljava/lang/String;

    .line 12
    .line 13
    const-string v1, "specific_edit_page_name"

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->pageName:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    filled-new-array {p0}, [Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string v1, "e_edit_specific_profile_next"

    .line 26
    .line 27
    invoke-static {v1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method
