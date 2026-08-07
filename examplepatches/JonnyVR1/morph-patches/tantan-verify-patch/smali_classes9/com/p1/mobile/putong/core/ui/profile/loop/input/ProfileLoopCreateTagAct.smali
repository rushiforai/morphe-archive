.class public Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# instance fields
.field public c:Lv/navigationbar/VNavigationBar;

.field public d:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

.field public e:Lv/VButton;

.field public f:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->h2(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->e2(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic Z1(Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->i2()V

    return-void
.end method

.method public static synthetic a2(Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->g2(Landroid/view/View;)V

    return-void
.end method

.method public static c2(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;Landroid/content/Context;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;

    .line 4
    .line 5
    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p1, "loop_create_tag_info"

    .line 9
    .line 10
    invoke-virtual {v0, p1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    return-object v0
.end method

.method private synthetic e2(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->r()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic g2(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->d2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic i2()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->d:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->e:Lv/VEditText;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->d:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

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
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->e:Lv/VButton;

    .line 2
    .line 3
    new-instance v1, Ll/dna0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/dna0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->f:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->f:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 21
    .line 22
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->couldInputEmpty:Z

    .line 23
    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->d:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->getInputValue()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->e:Lv/VButton;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->e:Lv/VButton;

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->e:Lv/VButton;

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    sget v3, Ll/kbc0;->r1:I

    .line 55
    .line 56
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 61
    .line 62
    .line 63
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->c:Lv/navigationbar/VNavigationBar;

    .line 64
    .line 65
    invoke-virtual {v0, p0}, Lv/navigationbar/VNavigationBar;->setLeftIconAsBack(Landroid/app/Activity;)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->d:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 69
    .line 70
    new-instance v2, Ll/ena0;

    .line 71
    .line 72
    invoke-direct {v2, p0}, Ll/ena0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->setInputTextChangeListener(Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView$b;)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->d:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 79
    .line 80
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->f:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 81
    .line 82
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->c(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->d:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 86
    .line 87
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->a:Landroid/widget/TextView;

    .line 88
    .line 89
    const/4 v2, 0x1

    .line 90
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->d:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 94
    .line 95
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->a:Landroid/widget/TextView;

    .line 96
    .line 97
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->f:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 98
    .line 99
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->title:Ljava/lang/String;

    .line 100
    .line 101
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->d:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 105
    .line 106
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->d:Landroid/widget/TextView;

    .line 107
    .line 108
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    if-nez v0, :cond_1

    .line 113
    .line 114
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->d:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 115
    .line 116
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->c:Landroid/widget/RelativeLayout;

    .line 117
    .line 118
    const/high16 v2, 0x43480000    # 200.0f

    .line 119
    .line 120
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 121
    .line 122
    .line 123
    move-result v2

    .line 124
    invoke-static {v0, v2}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 125
    .line 126
    .line 127
    :cond_1
    new-instance v0, Ll/fna0;

    .line 128
    .line 129
    invoke-direct {v0, p0}, Ll/fna0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;)V

    .line 130
    .line 131
    .line 132
    const-wide/16 v2, 0x12c

    .line 133
    .line 134
    invoke-static {p0, v0, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 135
    .line 136
    .line 137
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->d:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 138
    .line 139
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->h:Lv/VLinear;

    .line 140
    .line 141
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 142
    .line 143
    .line 144
    return-void
.end method


# virtual methods
.method public b2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/gna0;->b(Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final d2()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->d:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->getInputValue()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/cqa0;->b(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 14
    .line 15
    sget v0, Lcom/p1/mobile/putong/core/profile/R$string;->k0:I

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_2

    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->f:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 32
    .line 33
    iget-boolean v1, v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->couldInputEmpty:Z

    .line 34
    .line 35
    if-eqz v1, :cond_1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    return-void

    .line 39
    :cond_2
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->k2()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 43
    .line 44
    .line 45
    new-instance v1, Landroid/content/Intent;

    .line 46
    .line 47
    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 48
    .line 49
    .line 50
    const-string v2, "loop_result_key"

    .line 51
    .line 52
    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 53
    .line 54
    .line 55
    const-string v0, "loop_create_tag_info"

    .line 56
    .line 57
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->f:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 58
    .line 59
    invoke-virtual {v1, v0, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 60
    .line 61
    .line 62
    const/4 v0, -0x1

    .line 63
    invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public final synthetic h2(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->e:Lv/VButton;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_3

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->f:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x1

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->f:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 25
    .line 26
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->couldInputEmpty:Z

    .line 27
    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->e:Lv/VButton;

    .line 31
    .line 32
    invoke-virtual {p1, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->e:Lv/VButton;

    .line 36
    .line 37
    invoke-virtual {p1, v1}, Landroid/view/View;->setClickable(Z)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->e:Lv/VButton;

    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    sget p2, Ll/kbc0;->f:I

    .line 47
    .line 48
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    if-nez p1, :cond_2

    .line 65
    .line 66
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    if-nez p1, :cond_1

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->e:Lv/VButton;

    .line 74
    .line 75
    invoke-virtual {p1, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->e:Lv/VButton;

    .line 79
    .line 80
    invoke-virtual {p1, v1}, Landroid/view/View;->setClickable(Z)V

    .line 81
    .line 82
    .line 83
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->e:Lv/VButton;

    .line 84
    .line 85
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    sget p2, Ll/kbc0;->f:I

    .line 90
    .line 91
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->e:Lv/VButton;

    .line 100
    .line 101
    const/4 p2, 0x0

    .line 102
    invoke-virtual {p1, p2}, Landroid/view/View;->setEnabled(Z)V

    .line 103
    .line 104
    .line 105
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->e:Lv/VButton;

    .line 106
    .line 107
    invoke-virtual {p1, p2}, Landroid/view/View;->setClickable(Z)V

    .line 108
    .line 109
    .line 110
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->e:Lv/VButton;

    .line 111
    .line 112
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    sget p2, Ll/kbc0;->r1:I

    .line 117
    .line 118
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 123
    .line 124
    .line 125
    :cond_3
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->b2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public initDataOnCreate()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "loop_create_tag_info"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->f:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 14
    .line 15
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initDataOnCreate()V

    .line 16
    .line 17
    .line 18
    new-instance v0, Ll/cna0;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Ll/cna0;-><init>(Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final k2()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->f:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_3

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->f:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->loopInputType:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_3

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->f:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->loopInputType:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 22
    .line 23
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->QUESTION_EDIT:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 24
    .line 25
    if-eq v0, v1, :cond_1

    .line 26
    .line 27
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->QUESTION_CHOICE:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 28
    .line 29
    if-ne v0, v1, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->HANGOUTS:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 33
    .line 34
    if-ne v0, v1, :cond_2

    .line 35
    .line 36
    const-string v0, "e_edit_hangouts_save"

    .line 37
    .line 38
    const-string v1, "p_edit_hangouts_view"

    .line 39
    .line 40
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_1
    :goto_0
    const-string v0, "e_my_question_edit_answer_save"

    .line 45
    .line 46
    const-string v1, "p_my_question_edit_answer"

    .line 47
    .line 48
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    :cond_2
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->f:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 52
    .line 53
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->isHarmonyTest:Z

    .line 54
    .line 55
    if-eqz v0, :cond_3

    .line 56
    .line 57
    const-string v0, "e_profile_test_question_finish"

    .line 58
    .line 59
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->pageId()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-static {v0, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    :cond_3
    return-void
.end method

.method public onBackPressed()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->f:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_5

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->f:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->loopInputType:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_5

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->f:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->loopInputType:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 22
    .line 23
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->INDUSTRY:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 24
    .line 25
    if-ne v0, v1, :cond_0

    .line 26
    .line 27
    const-string p0, "p_edit_custom_industry_view"

    .line 28
    .line 29
    return-object p0

    .line 30
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->DEPARTMENT:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 31
    .line 32
    if-ne v0, v1, :cond_1

    .line 33
    .line 34
    const-string p0, "p_edit_custom_work_area_view"

    .line 35
    .line 36
    return-object p0

    .line 37
    :cond_1
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->HOMETOWN:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 38
    .line 39
    if-ne v0, v1, :cond_2

    .line 40
    .line 41
    const-string p0, "p_edit_custom_hometown_view"

    .line 42
    .line 43
    return-object p0

    .line 44
    :cond_2
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->QUESTION_EDIT:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 45
    .line 46
    const-string v2, "p_my_question_edit_answer"

    .line 47
    .line 48
    if-ne v0, v1, :cond_3

    .line 49
    .line 50
    return-object v2

    .line 51
    :cond_3
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->QUESTION_CHOICE:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 52
    .line 53
    if-ne v0, v1, :cond_4

    .line 54
    .line 55
    return-object v2

    .line 56
    :cond_4
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->HANGOUTS:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 57
    .line 58
    if-ne v0, v1, :cond_5

    .line 59
    .line 60
    const-string p0, "p_edit_hangouts_view"

    .line 61
    .line 62
    return-object p0

    .line 63
    :cond_5
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->pageId()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    return-object p0
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->preCreateView(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/c30;->m()V

    .line 20
    .line 21
    .line 22
    return-void
.end method
