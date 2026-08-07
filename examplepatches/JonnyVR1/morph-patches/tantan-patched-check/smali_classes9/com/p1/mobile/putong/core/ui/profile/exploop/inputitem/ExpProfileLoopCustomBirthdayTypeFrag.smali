.class public Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;
.super Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;
.source "SourceFile"


# instance fields
.field public F:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

.field public G:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

.field public H:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

.field public I:Lv/VText;

.field public J:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;->J:Z

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic V4(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;->l5()V

    return-void
.end method

.method public static synthetic W4(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;->j5(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic X4(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;->k5(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic Y4(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;->f5()V

    return-void
.end method

.method public static bridge synthetic Z4(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;->d5()V

    return-void
.end method

.method public static bridge synthetic a5(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;->m5(I)V

    return-void
.end method

.method public static bridge synthetic b5(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;->n5(Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;)V

    return-void
.end method

.method public static bridge synthetic c5(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;->o5()V

    return-void
.end method

.method private d5()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Ll/x7c0;->i:I

    .line 6
    .line 7
    invoke-static {v0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;->I:Lv/VText;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private h5(Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    new-instance v2, Ll/khf;

    .line 25
    .line 26
    invoke-direct {v2, p0}, Ll/khf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;)V

    .line 27
    .line 28
    .line 29
    invoke-interface {v0, v1, p1, v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Xs(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;Ll/x20;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method private i5()Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;->P4()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;->P4()Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;->P4()Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    .line 32
    .line 33
    .line 34
    move-result-wide v0

    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;->g5()Ljava/util/Calendar;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 40
    .line 41
    .line 42
    move-result-wide v2

    .line 43
    long-to-double v2, v2

    .line 44
    cmpl-double p0, v0, v2

    .line 45
    .line 46
    if-eqz p0, :cond_0

    .line 47
    .line 48
    const/4 p0, 0x1

    .line 49
    return p0

    .line 50
    :cond_0
    const/4 p0, 0x0

    .line 51
    return p0
.end method

.method private synthetic j5(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;->f5()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic l5()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;->F:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;->F:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private m5(I)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, v0, :cond_0

    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;->I:Lv/VText;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Uo:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v0, 0x6

    .line 21
    if-ne p1, v0, :cond_1

    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;->I:Lv/VText;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sget v1, Lcom/p1/mobile/putong/core/R$string;->S3:I

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    const/4 v0, 0x2

    .line 40
    if-ne p1, v0, :cond_2

    .line 41
    .line 42
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;->I:Lv/VText;

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    sget v1, Lcom/p1/mobile/putong/core/R$string;->cp:I

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_2
    const/4 v0, 0x3

    .line 59
    if-ne p1, v0, :cond_3

    .line 60
    .line 61
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;->I:Lv/VText;

    .line 62
    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    sget v1, Lcom/p1/mobile/putong/core/R$string;->cp:I

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 74
    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_3
    const/4 v0, 0x4

    .line 78
    if-ne p1, v0, :cond_4

    .line 79
    .line 80
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;->I:Lv/VText;

    .line 81
    .line 82
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Wo:I

    .line 87
    .line 88
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 93
    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_4
    const/4 v0, 0x5

    .line 97
    if-ne p1, v0, :cond_5

    .line 98
    .line 99
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;->I:Lv/VText;

    .line 100
    .line 101
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Vo:I

    .line 106
    .line 107
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 112
    .line 113
    .line 114
    :cond_5
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;->I:Lv/VText;

    .line 115
    .line 116
    const/4 p1, 0x0

    .line 117
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 118
    .line 119
    .line 120
    return-void
.end method

.method private n5(Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroidx/appcompat/widget/AppCompatEditText;->getText()Landroid/text/Editable;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x1

    .line 16
    if-ne v0, v1, :cond_0

    .line 17
    .line 18
    const-string p0, ""

    .line 19
    .line 20
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-le v0, v1, :cond_1

    .line 29
    .line 30
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    sub-int/2addr v0, v1

    .line 35
    const/4 v1, 0x0

    .line 36
    invoke-interface {p0, v1, v0}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    .line 42
    .line 43
    :cond_1
    :goto_0
    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method private o5()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;->i5()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;->F:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->p()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;->G:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->p()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;->H:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->p()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    const/4 v0, 0x1

    .line 32
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;->R4(Z)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    const/4 v0, 0x0

    .line 37
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;->R4(Z)V

    .line 38
    .line 39
    .line 40
    return-void
.end method


# virtual methods
.method public T4(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;->A:Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;->saveUserInfo(Lcom/p1/mobile/putong/data/User;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;->g5()Ljava/util/Calendar;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    invoke-static {}, Lcom/p1/mobile/putong/data/Settings;->new_()Lcom/p1/mobile/putong/data/Settings;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 19
    .line 20
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 23
    .line 24
    .line 25
    move-result-wide v0

    .line 26
    long-to-double v0, v0

    .line 27
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 32
    .line 33
    return-void
.end method

.method public e5()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;->g5()Ljava/util/Calendar;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 10
    .line 11
    .line 12
    move-result-wide v1

    .line 13
    long-to-double v1, v1

    .line 14
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/api/d0;->P3(D)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/hhf;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/hhf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;)V

    .line 25
    .line 26
    .line 27
    new-instance v2, Ll/ihf;

    .line 28
    .line 29
    invoke-direct {v2, p0}, Ll/ihf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public f4()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final f5()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;->J:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;->M4()Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpProfileInfoLoopEditAct;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/ExpProfileInfoLoopEditAct;->b2()Ll/cjf;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Ll/cjf;->q0()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 8

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;->N4()Lcom/p1/mobile/putong/data/User;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->sn()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    const/16 v2, 0x17

    .line 25
    .line 26
    if-lt v1, v2, :cond_0

    .line 27
    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;->F:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 31
    .line 32
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->setNormalAge(I)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;->G:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 36
    .line 37
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->setNormalAge(I)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;->H:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 41
    .line 42
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->setNormalAge(I)V

    .line 43
    .line 44
    .line 45
    :cond_0
    sget-object v0, Ll/pzi0;->k:Ljava/text/SimpleDateFormat;

    .line 46
    .line 47
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 48
    .line 49
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    new-instance v1, Ljava/text/SimpleDateFormat;

    .line 56
    .line 57
    const-string v2, "MM"

    .line 58
    .line 59
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    invoke-direct {v1, v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 64
    .line 65
    .line 66
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 67
    .line 68
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 69
    .line 70
    invoke-virtual {v1, v2}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    sget-object v2, Ll/pzi0;->o:Ljava/text/SimpleDateFormat;

    .line 75
    .line 76
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 77
    .line 78
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 79
    .line 80
    invoke-virtual {v2, p1}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;->G:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 85
    .line 86
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 87
    .line 88
    .line 89
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;->H:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 90
    .line 91
    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 92
    .line 93
    .line 94
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    const/4 v3, 0x1

    .line 99
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 100
    .line 101
    .line 102
    move-result v4

    .line 103
    invoke-virtual {v2, v3, v4}, Ljava/util/Calendar;->set(II)V

    .line 104
    .line 105
    .line 106
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 107
    .line 108
    .line 109
    move-result v3

    .line 110
    const/4 v4, 0x2

    .line 111
    invoke-virtual {v2, v4, v3}, Ljava/util/Calendar;->set(II)V

    .line 112
    .line 113
    .line 114
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 115
    .line 116
    .line 117
    move-result v3

    .line 118
    const/4 v5, 0x5

    .line 119
    invoke-virtual {v2, v5, v3}, Ljava/util/Calendar;->set(II)V

    .line 120
    .line 121
    .line 122
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 123
    .line 124
    .line 125
    move-result-object v3

    .line 126
    sget-object v6, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 127
    .line 128
    invoke-virtual {v6}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 129
    .line 130
    .line 131
    move-result-wide v6

    .line 132
    invoke-virtual {v3, v6, v7}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 133
    .line 134
    .line 135
    invoke-static {v2, v3}, Ll/zab;->O(Ljava/util/Calendar;Ljava/util/Calendar;)I

    .line 136
    .line 137
    .line 138
    move-result v6

    .line 139
    const/16 v7, 0x64

    .line 140
    .line 141
    if-lt v6, v7, :cond_2

    .line 142
    .line 143
    if-ne v6, v7, :cond_1

    .line 144
    .line 145
    invoke-virtual {v2, v4}, Ljava/util/Calendar;->get(I)I

    .line 146
    .line 147
    .line 148
    move-result v6

    .line 149
    invoke-virtual {v3, v4}, Ljava/util/Calendar;->get(I)I

    .line 150
    .line 151
    .line 152
    move-result v4

    .line 153
    if-ne v6, v4, :cond_1

    .line 154
    .line 155
    invoke-virtual {v2, v5}, Ljava/util/Calendar;->get(I)I

    .line 156
    .line 157
    .line 158
    move-result v2

    .line 159
    invoke-virtual {v3, v5}, Ljava/util/Calendar;->get(I)I

    .line 160
    .line 161
    .line 162
    move-result v3

    .line 163
    if-ne v2, v3, :cond_1

    .line 164
    .line 165
    goto :goto_0

    .line 166
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;->F:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 167
    .line 168
    const-string v0, ""

    .line 169
    .line 170
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 171
    .line 172
    .line 173
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;->G:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 174
    .line 175
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 176
    .line 177
    .line 178
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;->H:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 179
    .line 180
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 181
    .line 182
    .line 183
    const/4 p1, 0x0

    .line 184
    const/4 v0, -0x1

    .line 185
    invoke-static {v0, p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->o(III)V

    .line 186
    .line 187
    .line 188
    goto :goto_1

    .line 189
    :cond_2
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;->F:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 190
    .line 191
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 192
    .line 193
    .line 194
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 195
    .line 196
    .line 197
    move-result v0

    .line 198
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 199
    .line 200
    .line 201
    move-result v1

    .line 202
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 203
    .line 204
    .line 205
    move-result p1

    .line 206
    invoke-static {v0, v1, p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->o(III)V

    .line 207
    .line 208
    .line 209
    :goto_1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;->o5()V

    .line 210
    .line 211
    .line 212
    new-instance p1, Ll/jhf;

    .line 213
    .line 214
    invoke-direct {p1, p0}, Ll/jhf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;)V

    .line 215
    .line 216
    .line 217
    const-wide/16 v0, 0x12c

    .line 218
    .line 219
    invoke-static {p0, p1, v0, v1}, Ll/l51;->I(Lcom/p1/mobile/android/app/Frag;Ljava/lang/Runnable;J)V

    .line 220
    .line 221
    .line 222
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;->F:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 223
    .line 224
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag$a;

    .line 225
    .line 226
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag$a;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;)V

    .line 227
    .line 228
    .line 229
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->setTextChangedListener(Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;)V

    .line 230
    .line 231
    .line 232
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;->G:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 233
    .line 234
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag$b;

    .line 235
    .line 236
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag$b;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;)V

    .line 237
    .line 238
    .line 239
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->setTextChangedListener(Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;)V

    .line 240
    .line 241
    .line 242
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;->H:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 243
    .line 244
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag$c;

    .line 245
    .line 246
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag$c;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;)V

    .line 247
    .line 248
    .line 249
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->setTextChangedListener(Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew$d;)V

    .line 250
    .line 251
    .line 252
    return-void
.end method

.method public g5()Ljava/util/Calendar;
    .locals 3

    .line 1
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Ll/pzi0;->o()J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;->F:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->getFinalNum()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    const/4 v2, 0x1

    .line 19
    invoke-virtual {v0, v2, v1}, Ljava/util/Calendar;->set(II)V

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;->G:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 23
    .line 24
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->getFinalNum()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    sub-int/2addr v1, v2

    .line 29
    const/4 v2, 0x2

    .line 30
    invoke-virtual {v0, v2, v1}, Ljava/util/Calendar;->set(II)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;->H:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->getFinalNum()I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    const/4 v1, 0x5

    .line 40
    invoke-virtual {v0, v1, p0}, Ljava/util/Calendar;->set(II)V

    .line 41
    .line 42
    .line 43
    const/16 p0, 0xb

    .line 44
    .line 45
    const/16 v1, 0x8

    .line 46
    .line 47
    invoke-virtual {v0, p0, v1}, Ljava/util/Calendar;->set(II)V

    .line 48
    .line 49
    .line 50
    const/16 p0, 0xc

    .line 51
    .line 52
    const/4 v1, 0x0

    .line 53
    invoke-virtual {v0, p0, v1}, Ljava/util/Calendar;->set(II)V

    .line 54
    .line 55
    .line 56
    const/16 p0, 0xd

    .line 57
    .line 58
    invoke-virtual {v0, p0, v1}, Ljava/util/Calendar;->set(II)V

    .line 59
    .line 60
    .line 61
    const/16 p0, 0xe

    .line 62
    .line 63
    invoke-virtual {v0, p0, v1}, Ljava/util/Calendar;->set(II)V

    .line 64
    .line 65
    .line 66
    return-object v0
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/kec0;->I2:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    sget p2, Ll/adc0;->l2:I

    .line 9
    .line 10
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    check-cast p2, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 15
    .line 16
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;->F:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 17
    .line 18
    sget p2, Ll/adc0;->k2:I

    .line 19
    .line 20
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    check-cast p2, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 25
    .line 26
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;->G:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 27
    .line 28
    sget p2, Ll/adc0;->j2:I

    .line 29
    .line 30
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    check-cast p2, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 35
    .line 36
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;->H:Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;

    .line 37
    .line 38
    sget p2, Ll/adc0;->m2:I

    .line 39
    .line 40
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    check-cast p2, Lv/VText;

    .line 45
    .line 46
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;->I:Lv/VText;

    .line 47
    .line 48
    return-object p1
.end method

.method public final synthetic k5(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;->h5(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Frag;->onDestroy()V

    .line 2
    .line 3
    .line 4
    const/4 p0, -0x1

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-static {p0, v0, p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/DateEditTextNew;->o(III)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public x3()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;->J:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomBirthdayTypeFrag;->e5()V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    return p0
.end method
