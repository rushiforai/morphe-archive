.class public Ll/sm;
.super Ll/w1e;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/w1e;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic A(Lv/VText;Lcom/p1/mobile/android/app/Act;Ljava/lang/Long;)V
    .locals 4

    .line 1
    const-wide/16 v0, 0x3c

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 4
    .line 5
    .line 6
    move-result-wide v2

    .line 7
    sub-long/2addr v0, v2

    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    cmp-long p2, v0, v2

    .line 11
    .line 12
    if-lez p2, :cond_0

    .line 13
    .line 14
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sget v1, Lcom/p1/mobile/putong/account/R$string;->k4:I

    .line 23
    .line 24
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    filled-new-array {v0, p1}, [Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    const-string v0, "%d%s"

    .line 33
    .line 34
    invoke-static {p2, v0, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public static synthetic B(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic C(Ll/pej0;Ll/x20;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-interface {p1}, Ll/x20;->call()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public static synthetic D(Lcom/p1/mobile/android/app/Act;Lv/VEditText;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic E(Lv/VEditText;Lv/VEditText;Lv/VButton;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-nez p0, :cond_0

    .line 36
    .line 37
    sget p0, Ll/bbc0;->K1:I

    .line 38
    .line 39
    invoke-virtual {p2, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_0
    sget p0, Ll/bbc0;->t1:I

    .line 44
    .line 45
    invoke-virtual {p2, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public static synthetic F(Lcom/p1/mobile/android/app/Act;Ll/pej0;Ll/x20;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    const-string p0, "bind_phone_obs"

    .line 5
    .line 6
    invoke-static {p0}, Ll/l51;->K(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    invoke-static {p1}, Ll/sm;->d0(Ll/pej0;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Ll/pej0;->dismiss()V

    .line 13
    .line 14
    .line 15
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    invoke-interface {p2}, Ll/x20;->call()V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public static synthetic G(Ll/pej0;Ll/x20;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p2, "e_force_bindphone_identified_cancel"

    .line 2
    .line 3
    const-string v0, "p_force_bindphone_identified_popup"

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 9
    .line 10
    .line 11
    invoke-interface {p1}, Ll/x20;->call()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic H(Lv/VEditText;Lv/VText;Lcom/p1/mobile/android/app/Act;Lv/VEditText;Lcom/p1/mobile/account_core/reponse_data/RiskVerification;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    invoke-virtual {p1, p0}, Landroid/view/View;->setEnabled(Z)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, p0}, Landroid/view/View;->setClickable(Z)V

    .line 9
    .line 10
    .line 11
    sget p0, Lcom/p1/mobile/putong/account/R$string;->A3:I

    .line 12
    .line 13
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(I)V

    .line 14
    .line 15
    .line 16
    const-string p0, "bind_phone_obs"

    .line 17
    .line 18
    const/16 p4, 0x3c

    .line 19
    .line 20
    invoke-static {p0, p4}, Ll/l51;->N(Ljava/lang/String;I)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p2, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    new-instance p4, Ll/jm;

    .line 29
    .line 30
    invoke-direct {p4, p1, p2}, Ll/jm;-><init>(Lv/VText;Lcom/p1/mobile/android/app/Act;)V

    .line 31
    .line 32
    .line 33
    new-instance p2, Ll/km;

    .line 34
    .line 35
    invoke-direct {p2}, Ll/km;-><init>()V

    .line 36
    .line 37
    .line 38
    new-instance v0, Ll/lm;

    .line 39
    .line 40
    invoke-direct {v0, p1, p3}, Ll/lm;-><init>(Lv/VText;Lv/VEditText;)V

    .line 41
    .line 42
    .line 43
    invoke-static {p4, p2, v0}, Ll/psd0;->I(Ll/y20;Ll/y20;Ll/x20;)Lcom/p1/mobile/android/rx/a;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public static synthetic I(Lv/VText;Lv/VEditText;Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setClickable(Z)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 6
    .line 7
    .line 8
    sget v1, Lcom/p1/mobile/putong/account/R$string;->r3:I

    .line 9
    .line 10
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    const/4 p1, 0x0

    .line 28
    invoke-static {p0, p1}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    invoke-static {p0, v0}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    :goto_0
    instance-of p0, p3, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 36
    .line 37
    if-eqz p0, :cond_1

    .line 38
    .line 39
    move-object p1, p3

    .line 40
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 41
    .line 42
    iget p1, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 43
    .line 44
    const v0, 0x6263b

    .line 45
    .line 46
    .line 47
    if-ne p1, v0, :cond_1

    .line 48
    .line 49
    sget-object p0, Ll/olj;->INSTANCE:Ll/olj;

    .line 50
    .line 51
    invoke-virtual {p0, p2}, Ll/olj;->c(Lcom/p1/mobile/android/app/Act;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_1
    if-eqz p0, :cond_4

    .line 56
    .line 57
    move-object p0, p3

    .line 58
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 59
    .line 60
    iget p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 61
    .line 62
    const p1, 0x9c40

    .line 63
    .line 64
    .line 65
    if-ne p0, p1, :cond_2

    .line 66
    .line 67
    invoke-static {p3}, Ll/bsj0;->G(Ljava/lang/Throwable;)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_2
    invoke-static {p0}, Ll/bsj0;->l(I)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    if-nez p0, :cond_3

    .line 76
    .line 77
    invoke-static {p3}, Ll/bsj0;->G(Ljava/lang/Throwable;)V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_3
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :cond_4
    invoke-static {p3}, Ll/bsj0;->G(Ljava/lang/Throwable;)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public static synthetic J(Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic K(Ll/y20;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string p2, "+"

    .line 4
    .line 5
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object p2, Ll/nsb;->d:Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    check-cast p2, Ll/nsb;

    .line 15
    .line 16
    iget p2, p2, Ll/nsb;->b:I

    .line 17
    .line 18
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    sput-object p1, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->h:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    if-eqz p2, :cond_0

    .line 32
    .line 33
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public static synthetic L(Lcom/p1/mobile/android/app/Act;Lv/VText;Landroid/view/View;)V
    .locals 0

    .line 1
    new-instance p2, Ll/hm;

    .line 2
    .line 3
    invoke-direct {p2, p1}, Ll/hm;-><init>(Lv/VText;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, p2}, Ll/sm;->a0(Lcom/p1/mobile/android/app/Act;Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic M(Ll/y20;Ljava/util/List;Ljava/util/List;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-ge p5, p1, :cond_0

    .line 12
    .line 13
    invoke-interface {p2, p5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {p1}, Lcom/p1/mobile/putong/data/BloodType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/BloodType;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public static synthetic N(Lcom/p1/mobile/android/app/Dialog;Ll/y20;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    invoke-interface {p1, p2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic O(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/pej0;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p3, "e_force_bindphone_unidentified_cancel"

    .line 2
    .line 3
    const-string v0, "p_force_bindphone_unidentified_popup"

    .line 4
    .line 5
    invoke-static {p3, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/app/Activity;->getLocalClassName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p3

    .line 12
    invoke-static {p3}, Ll/l51;->B(Ljava/lang/String;)Z

    .line 13
    .line 14
    .line 15
    move-result p3

    .line 16
    if-eqz p3, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/app/Activity;->getLocalClassName()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {p0}, Ll/l51;->K(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    invoke-interface {p1}, Ll/x20;->call()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p2}, Ll/pej0;->dismiss()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static synthetic P(Lv/VEditText;Lv/VText;Lv/VText;Lv/VEditText;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 3

    .line 1
    const-string p5, "e_force_bindphone_unidentified_getcode"

    .line 2
    .line 3
    const-string v0, "p_force_bindphone_unidentified_popup"

    .line 4
    .line 5
    invoke-static {p5, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0}, Ll/bsj0;->M(Landroid/widget/TextView;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p5

    .line 12
    invoke-static {p1}, Ll/bsj0;->I(Landroid/widget/TextView;)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/16 v1, 0x56

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    if-ne v0, v1, :cond_0

    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    move v0, v2

    .line 24
    :goto_0
    invoke-static {p5, v0}, Ll/e070;->n1(Ljava/lang/String;Z)Z

    .line 25
    .line 26
    .line 27
    move-result p5

    .line 28
    if-nez p5, :cond_1

    .line 29
    .line 30
    const-string p0, "\u8bf7\u8f93\u5165\u6b63\u786e\u624b\u673a\u53f7"

    .line 31
    .line 32
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    new-instance p5, Lcom/p1/mobile/putong/data/VerifyData;

    .line 37
    .line 38
    invoke-direct {p5}, Lcom/p1/mobile/putong/data/VerifyData;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-static {}, Ll/q8g0;->y()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iput-object v0, p5, Lcom/p1/mobile/putong/data/VerifyData;->language:Ljava/lang/String;

    .line 46
    .line 47
    const-string v0, "bind_mobile"

    .line 48
    .line 49
    invoke-static {v0}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iput-object v0, p5, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 54
    .line 55
    const/4 v0, 0x6

    .line 56
    iput v0, p5, Lcom/p1/mobile/putong/data/VerifyData;->codeLength:I

    .line 57
    .line 58
    invoke-static {p1}, Ll/bsj0;->I(Landroid/widget/TextView;)I

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    iput p1, p5, Lcom/p1/mobile/putong/data/VerifyData;->countryCode:I

    .line 63
    .line 64
    invoke-static {p0}, Ll/bsj0;->M(Landroid/widget/TextView;)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    iput-object p1, p5, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

    .line 69
    .line 70
    invoke-static {p2, v2}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p2, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 74
    .line 75
    .line 76
    const-string p1, "..."

    .line 77
    .line 78
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 79
    .line 80
    .line 81
    sget-object p1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 82
    .line 83
    invoke-virtual {p1, p5}, Lcom/p1/mobile/putong/account/api/a;->b2(Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    new-instance p5, Ll/zl;

    .line 88
    .line 89
    invoke-direct {p5, p3, p2, p4, p0}, Ll/zl;-><init>(Lv/VEditText;Lv/VText;Lcom/p1/mobile/android/app/Act;Lv/VEditText;)V

    .line 90
    .line 91
    .line 92
    new-instance p3, Ll/am;

    .line 93
    .line 94
    invoke-direct {p3, p2, p0, p4}, Ll/am;-><init>(Lv/VText;Lv/VEditText;Lcom/p1/mobile/android/app/Act;)V

    .line 95
    .line 96
    .line 97
    invoke-static {p5, p3, v2}, Ll/psd0;->K(Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public static synthetic Q(Ll/y20;IILandroid/content/Intent;)Z
    .locals 0

    .line 1
    const/4 p1, -0x1

    .line 2
    if-ne p2, p1, :cond_0

    .line 3
    .line 4
    const-string p1, "ccode"

    .line 5
    .line 6
    invoke-virtual {p3, p1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    .line 7
    .line 8
    .line 9
    move-result p2

    .line 10
    if-eqz p2, :cond_0

    .line 11
    .line 12
    const/16 p2, 0x56

    .line 13
    .line 14
    invoke-virtual {p3, p1, p2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    new-instance p2, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    const-string p3, "+"

    .line 21
    .line 22
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    const/4 p0, 0x1

    .line 36
    return p0

    .line 37
    :cond_0
    const/4 p0, 0x0

    .line 38
    return p0
.end method

.method public static synthetic R(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic S(Ll/x20;Ll/pej0;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    const-string p2, "e_login_user_agreement_popup_confirm"

    .line 8
    .line 9
    const-string v0, "p_login_user_agreement_popup"

    .line 10
    .line 11
    invoke-static {p2, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-interface {p0}, Ll/x20;->call()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1}, Ll/pej0;->dismiss()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public static synthetic T(Ll/pej0;Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p1, "cancel_back"

    .line 2
    .line 3
    const-string v0, "cancle"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    filled-new-array {p1}, [Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const-string v0, "e_login_user_agreement_popup_cancel"

    .line 14
    .line 15
    const-string v1, "p_login_user_agreement_popup"

    .line 16
    .line 17
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic U(Landroid/view/Window;)V
    .locals 1

    .line 1
    sget v0, Ll/yfc0;->c:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/Window;->setWindowAnimations(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic V(Landroid/view/Window;)V
    .locals 1

    .line 1
    sget v0, Ll/yfc0;->c:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/Window;->setWindowAnimations(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic W(Ll/x20;Ll/pej0;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p2, "e_force_bindphone_identified_choose_other"

    .line 2
    .line 3
    const-string v0, "p_force_bindphone_identified_popup"

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p0}, Ll/x20;->call()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Ll/pej0;->dismiss()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic X(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic Y(Ll/y20;Lcom/p1/mobile/android/app/Act;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/util/Date;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p5}, Ljava/util/Date;->getTime()J

    .line 2
    .line 3
    .line 4
    move-result-wide p2

    .line 5
    long-to-double p2, p2

    .line 6
    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    invoke-interface {p0, p2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    sget-object p0, Ll/uqb0;->c0:Ll/bn5;

    .line 14
    .line 15
    invoke-interface {p0}, Ll/bn5;->signedIn_()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const-string p0, "account"

    .line 22
    .line 23
    sget-object p2, Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;->p9:Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;

    .line 24
    .line 25
    invoke-static {p1, p0, p2}, Lcom/tantanapp/common/utils/NullChecker;->c(Ljava/lang/Object;Ljava/lang/String;Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->instanceofPersonalDetailsAct(Lcom/p1/mobile/android/app/Act;)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-eqz p0, :cond_0

    .line 40
    .line 41
    const-string p0, "e_edit_basic_info_calendar"

    .line 42
    .line 43
    const-string p1, "p_edit_basic_info_view"

    .line 44
    .line 45
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    :cond_0
    const/4 p0, 0x0

    .line 49
    return-object p0
.end method

.method public static synthetic Z(Lv/VText;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a0(Lcom/p1/mobile/android/app/Act;Ll/y20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/CCodeChooseAct;->Z1(Lcom/p1/mobile/android/app/Act;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/im;

    .line 6
    .line 7
    invoke-direct {v1, p1}, Ll/im;-><init>(Ll/y20;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Act;->startActivityForResult(Landroid/content/Intent;Lcom/p1/mobile/android/app/a$a;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static b0(Lcom/p1/mobile/android/app/Act;Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, v0}, Ll/sm;->c0(Lcom/p1/mobile/android/app/Act;Ll/y20;Ll/l4g0;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static c0(Lcom/p1/mobile/android/app/Act;Ll/y20;Ll/l4g0;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;",
            "Ll/l4g0;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Ll/w1e;->f(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    new-instance v1, Ll/sm$e;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Ll/sm$e;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->p(Landroid/widget/ListAdapter;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    new-instance v0, Ll/yk;

    .line 18
    .line 19
    invoke-direct {v0, p1}, Ll/yk;-><init>(Ll/y20;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Dialog$e;->g0(Lcom/p1/mobile/android/app/Dialog$g;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const/4 p1, 0x1

    .line 27
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->W(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    new-instance p1, Ll/jl;

    .line 32
    .line 33
    invoke-direct {p1, p2}, Ll/jl;-><init>(Ll/l4g0;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->V(Landroid/content/DialogInterface$OnDismissListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public static d0(Ll/pej0;)V
    .locals 3
    .param p0    # Ll/pej0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    :try_start_0
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v1, "input_method"

    .line 10
    .line 11
    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Landroid/view/inputmethod/InputMethodManager;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    const/4 v1, 0x2

    .line 30
    invoke-virtual {v0, v1}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Landroid/view/Window;->getCurrentFocus()Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    const/4 v2, 0x0

    .line 42
    if-eqz v1, :cond_0

    .line 43
    .line 44
    invoke-virtual {v0}, Landroid/view/Window;->getCurrentFocus()Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {p0, v0, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_0
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {v0}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {p0, v0, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 65
    .line 66
    .line 67
    :cond_1
    return-void

    .line 68
    :catch_0
    move-exception p0

    .line 69
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public static varargs e0(Landroid/app/Activity;Ljava/lang/String;[Ljava/lang/String;)Landroid/text/SpannableStringBuilder;
    .locals 7

    .line 1
    new-instance v0, Landroid/text/SpannableStringBuilder;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    array-length v2, p2

    .line 8
    if-ge v1, v2, :cond_0

    .line 9
    .line 10
    aget-object v2, p2, v1

    .line 11
    .line 12
    add-int/lit8 v3, v1, 0x1

    .line 13
    .line 14
    aget-object v3, p2, v3

    .line 15
    .line 16
    new-instance v4, Ll/sm$h;

    .line 17
    .line 18
    invoke-direct {v4, p0, v2, v3}, Ll/sm$h;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    move-result v5

    .line 29
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 30
    .line 31
    .line 32
    move-result v6

    .line 33
    add-int/2addr v5, v6

    .line 34
    const/16 v6, 0x21

    .line 35
    .line 36
    invoke-virtual {v0, v4, v3, v5, v6}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 37
    .line 38
    .line 39
    new-instance v3, Landroid/text/style/StyleSpan;

    .line 40
    .line 41
    const/4 v4, 0x1

    .line 42
    invoke-direct {v3, v4}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 50
    .line 51
    .line 52
    move-result v5

    .line 53
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    add-int/2addr v5, v2

    .line 58
    invoke-virtual {v0, v3, v4, v5, v6}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 59
    .line 60
    .line 61
    add-int/lit8 v1, v1, 0x2

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_0
    return-object v0
.end method

.method public static f0(Lcom/p1/mobile/android/app/Act;Ll/pcj;Ll/y20;Ll/y20;Ll/y20;Ll/x20;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/pcj<",
            "Ljava/lang/Double;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/Double;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/Double;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;",
            "Ll/x20;",
            ")V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/Date;

    .line 2
    .line 3
    invoke-interface {p1}, Ll/pcj;->call()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ljava/lang/Double;

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    .line 10
    .line 11
    .line 12
    move-result-wide v1

    .line 13
    double-to-long v1, v1

    .line 14
    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    .line 15
    .line 16
    .line 17
    new-instance p1, Ll/r03;

    .line 18
    .line 19
    invoke-direct {p1, p0}, Ll/r03;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 20
    .line 21
    .line 22
    new-instance v1, Ll/el;

    .line 23
    .line 24
    invoke-direct {v1, p0, p4, p3}, Ll/el;-><init>(Lcom/p1/mobile/android/app/Act;Ll/y20;Ll/y20;)V

    .line 25
    .line 26
    .line 27
    new-instance p3, Ll/fl;

    .line 28
    .line 29
    invoke-direct {p3, p2, p0}, Ll/fl;-><init>(Ll/y20;Lcom/p1/mobile/android/app/Act;)V

    .line 30
    .line 31
    .line 32
    new-instance p0, Ll/gl;

    .line 33
    .line 34
    invoke-direct {p0, p5}, Ll/gl;-><init>(Ll/x20;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1, v0, v1, p3, p0}, Ll/r03;->m(Ljava/util/Date;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function4;Lkotlin/jvm/functions/Function0;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public static synthetic g(Ll/y20;Ljava/util/List;Ljava/util/List;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-ge p5, p1, :cond_0

    .line 12
    .line 13
    invoke-interface {p2, p5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {p1}, Lcom/p1/mobile/putong/data/QualificationType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/QualificationType;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public static g0(Lcom/p1/mobile/android/app/Act;Ll/y20;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/BloodType;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 2
    .line 3
    new-instance v1, Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    sget v3, Lcom/p1/mobile/putong/account/R$string;->D:I

    .line 13
    .line 14
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    sget v3, Lcom/p1/mobile/putong/account/R$string;->F:I

    .line 26
    .line 27
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    sget v3, Lcom/p1/mobile/putong/account/R$string;->G:I

    .line 39
    .line 40
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    sget v3, Lcom/p1/mobile/putong/account/R$string;->E:I

    .line 52
    .line 53
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    sget v2, Lcom/p1/mobile/putong/account/R$string;->H:I

    .line 65
    .line 66
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    const-string v0, "AB"

    .line 74
    .line 75
    const-string v2, "UNKNOWN"

    .line 76
    .line 77
    const-string v3, "A"

    .line 78
    .line 79
    const-string v4, "B"

    .line 80
    .line 81
    const-string v5, "O"

    .line 82
    .line 83
    filled-new-array {v3, v4, v5, v0, v2}, [Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    sget v2, Lcom/p1/mobile/putong/account/R$string;->C:I

    .line 96
    .line 97
    invoke-virtual {p0, v2}, Lcom/p1/mobile/android/app/Dialog$e;->E0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->e0(Ljava/util/List;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    new-instance v2, Ll/mm;

    .line 106
    .line 107
    invoke-direct {v2, p1, v1, v0}, Ll/mm;-><init>(Ll/y20;Ljava/util/List;Ljava/util/List;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p0, v2}, Lcom/p1/mobile/android/app/Dialog$e;->g0(Lcom/p1/mobile/android/app/Dialog$g;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    sget p1, Lcom/p1/mobile/putong/account/R$string;->b:I

    .line 115
    .line 116
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->k0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    new-instance p1, Ll/nm;

    .line 121
    .line 122
    invoke-direct {p1}, Ll/nm;-><init>()V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->V(Landroid/content/DialogInterface$OnDismissListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 130
    .line 131
    .line 132
    return-void
.end method

.method public static synthetic h(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static h0(Lcom/p1/mobile/android/app/Act;Ll/y20;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/QualificationType;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 2
    .line 3
    new-instance v1, Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    sget v3, Lcom/p1/mobile/putong/account/R$string;->O2:I

    .line 13
    .line 14
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    sget v3, Lcom/p1/mobile/putong/account/R$string;->Q2:I

    .line 26
    .line 27
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    sget v3, Lcom/p1/mobile/putong/account/R$string;->N2:I

    .line 39
    .line 40
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    sget v3, Lcom/p1/mobile/putong/account/R$string;->R2:I

    .line 52
    .line 53
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    sget v3, Lcom/p1/mobile/putong/account/R$string;->L2:I

    .line 65
    .line 66
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    sget v3, Lcom/p1/mobile/putong/account/R$string;->P2:I

    .line 78
    .line 79
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    sget v2, Lcom/p1/mobile/putong/account/R$string;->M2:I

    .line 91
    .line 92
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    const-string v7, "MASTER"

    .line 100
    .line 101
    const-string v8, "DOCTOR"

    .line 102
    .line 103
    const-string v2, "LOWER_PRIMARY"

    .line 104
    .line 105
    const-string v3, "UPPER_PRIMARY"

    .line 106
    .line 107
    const-string v4, "HIGH_SCHOOL"

    .line 108
    .line 109
    const-string v5, "VOCATIONAL_SCHOOL"

    .line 110
    .line 111
    const-string v6, "BACHELOR"

    .line 112
    .line 113
    filled-new-array/range {v2 .. v8}, [Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    sget v2, Lcom/p1/mobile/putong/account/R$string;->K2:I

    .line 126
    .line 127
    invoke-virtual {p0, v2}, Lcom/p1/mobile/android/app/Dialog$e;->E0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->e0(Ljava/util/List;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    new-instance v2, Ll/ul;

    .line 136
    .line 137
    invoke-direct {v2, p1, v1, v0}, Ll/ul;-><init>(Ll/y20;Ljava/util/List;Ljava/util/List;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {p0, v2}, Lcom/p1/mobile/android/app/Dialog$e;->g0(Lcom/p1/mobile/android/app/Dialog$g;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    sget p1, Lcom/p1/mobile/putong/account/R$string;->b:I

    .line 145
    .line 146
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->k0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    new-instance p1, Ll/fm;

    .line 151
    .line 152
    invoke-direct {p1}, Ll/fm;-><init>()V

    .line 153
    .line 154
    .line 155
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->V(Landroid/content/DialogInterface$OnDismissListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 160
    .line 161
    .line 162
    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/data/MobileRespInfo;)Lrx/c;
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/data/MobileRespInfo;->token:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/data/MobileRespInfo;->accessCode:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/p1/mobile/putong/data/MobileRespInfo;->openId:Ljava/lang/String;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/MobileRespInfo;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 10
    .line 11
    invoke-virtual {v0, v1, v2, v3, p0}, Lcom/p1/mobile/putong/account/api/a;->Q1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/SignInGrantType;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static i0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ll/x20;Ll/x20;Ll/x20;)Ll/pej0;
    .locals 21

    .line 1
    move-object/from16 v3, p0

    .line 2
    .line 3
    const-class v0, Lcom/p1/mobile/android/app/Dialog;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "p_force_bindphone_unidentified_popup"

    .line 10
    .line 11
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "signup_way"

    .line 16
    .line 17
    move-object/from16 v2, p1

    .line 18
    .line 19
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    const-string v2, "verified"

    .line 24
    .line 25
    move-object/from16 v4, p2

    .line 26
    .line 27
    invoke-static {v4, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v4

    .line 31
    if-eqz v4, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const-string v2, ""

    .line 35
    .line 36
    :goto_0
    const-string v4, "page_display_fromwhich"

    .line 37
    .line 38
    invoke-static {v4, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    filled-new-array {v1, v2}, [Ll/pf60;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v0, v1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 47
    .line 48
    .line 49
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 50
    .line 51
    .line 52
    new-instance v5, Ll/pej0;

    .line 53
    .line 54
    invoke-direct {v5, v3}, Ll/pej0;-><init>(Landroid/content/Context;)V

    .line 55
    .line 56
    .line 57
    const/4 v9, 0x0

    .line 58
    invoke-virtual {v5, v9}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCanceledOnTouchOutside(Z)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v5, v9}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCancelable(Z)V

    .line 62
    .line 63
    .line 64
    sget v1, Ll/hec0;->a:I

    .line 65
    .line 66
    invoke-virtual {v5, v1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(I)V

    .line 67
    .line 68
    .line 69
    const-string v10, "bind_phone_obs"

    .line 70
    .line 71
    invoke-static {v10}, Ll/l51;->K(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v5}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    if-eqz v2, :cond_1

    .line 83
    .line 84
    const v2, 0x1020002

    .line 85
    .line 86
    .line 87
    invoke-virtual {v1, v2}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    sget v4, Ll/wcc0;->o:I

    .line 92
    .line 93
    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    check-cast v2, Landroid/widget/FrameLayout;

    .line 98
    .line 99
    sget v4, Ll/bbc0;->a0:I

    .line 100
    .line 101
    invoke-virtual {v2, v4}, Landroid/view/View;->setBackgroundResource(I)V

    .line 102
    .line 103
    .line 104
    :cond_1
    new-instance v2, Ll/il;

    .line 105
    .line 106
    invoke-direct {v2, v1}, Ll/il;-><init>(Landroid/view/Window;)V

    .line 107
    .line 108
    .line 109
    invoke-static {v2}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 110
    .line 111
    .line 112
    sget v1, Ll/wcc0;->g:I

    .line 113
    .line 114
    invoke-virtual {v5, v1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    move-object v2, v1

    .line 119
    check-cast v2, Lv/VText;

    .line 120
    .line 121
    sget v1, Ll/wcc0;->j0:I

    .line 122
    .line 123
    invoke-virtual {v5, v1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    check-cast v1, Lv/VEditText;

    .line 128
    .line 129
    sget v4, Ll/wcc0;->i:I

    .line 130
    .line 131
    invoke-virtual {v5, v4}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 132
    .line 133
    .line 134
    move-result-object v4

    .line 135
    check-cast v4, Lv/VEditText;

    .line 136
    .line 137
    sget v6, Ll/wcc0;->t:I

    .line 138
    .line 139
    invoke-virtual {v5, v6}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 140
    .line 141
    .line 142
    move-result-object v6

    .line 143
    move-object v11, v6

    .line 144
    check-cast v11, Lv/VText;

    .line 145
    .line 146
    sget v6, Ll/wcc0;->z:I

    .line 147
    .line 148
    invoke-virtual {v5, v6}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 149
    .line 150
    .line 151
    move-result-object v6

    .line 152
    check-cast v6, Lv/VText;

    .line 153
    .line 154
    const/4 v7, 0x3

    .line 155
    invoke-static {v7}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 156
    .line 157
    .line 158
    move-result-object v8

    .line 159
    const/4 v12, 0x1

    .line 160
    invoke-virtual {v6, v8, v12}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 161
    .line 162
    .line 163
    new-instance v13, Ll/kl;

    .line 164
    .line 165
    invoke-direct {v13, v3, v1}, Ll/kl;-><init>(Lcom/p1/mobile/android/app/Act;Lv/VEditText;)V

    .line 166
    .line 167
    .line 168
    sget v6, Ll/wcc0;->a:I

    .line 169
    .line 170
    invoke-virtual {v5, v6}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 171
    .line 172
    .line 173
    move-result-object v6

    .line 174
    move-object v8, v6

    .line 175
    check-cast v8, Lv/VButton;

    .line 176
    .line 177
    sget v6, Ll/bbc0;->t1:I

    .line 178
    .line 179
    invoke-virtual {v8, v6}, Landroid/view/View;->setBackgroundResource(I)V

    .line 180
    .line 181
    .line 182
    invoke-virtual {v1}, Lv/VEditText;->h()Lrx/c;

    .line 183
    .line 184
    .line 185
    move-result-object v6

    .line 186
    new-instance v14, Ll/ll;

    .line 187
    .line 188
    invoke-direct {v14, v1, v11, v8, v4}, Ll/ll;-><init>(Lv/VEditText;Lv/VText;Lv/VButton;Lv/VEditText;)V

    .line 189
    .line 190
    .line 191
    invoke-static {v14}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 192
    .line 193
    .line 194
    move-result-object v14

    .line 195
    invoke-virtual {v6, v14}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 196
    .line 197
    .line 198
    invoke-virtual {v4}, Lv/VEditText;->h()Lrx/c;

    .line 199
    .line 200
    .line 201
    move-result-object v6

    .line 202
    new-instance v14, Ll/ml;

    .line 203
    .line 204
    invoke-direct {v14, v1, v4, v8}, Ll/ml;-><init>(Lv/VEditText;Lv/VEditText;Lv/VButton;)V

    .line 205
    .line 206
    .line 207
    invoke-static {v14}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 208
    .line 209
    .line 210
    move-result-object v14

    .line 211
    invoke-virtual {v6, v14}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 212
    .line 213
    .line 214
    invoke-static {v7}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 215
    .line 216
    .line 217
    move-result-object v6

    .line 218
    invoke-virtual {v8, v6, v12}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 219
    .line 220
    .line 221
    new-instance v6, Ll/sm$a;

    .line 222
    .line 223
    invoke-direct {v6, v3, v13, v0}, Ll/sm$a;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;Ll/l4g0;)V

    .line 224
    .line 225
    .line 226
    invoke-virtual {v5, v6}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 227
    .line 228
    .line 229
    new-instance v0, Ll/nl;

    .line 230
    .line 231
    move-object v6, v4

    .line 232
    move-object v4, v2

    .line 233
    move-object v2, v6

    .line 234
    move-object/from16 v7, p3

    .line 235
    .line 236
    move-object/from16 v6, p4

    .line 237
    .line 238
    invoke-direct/range {v0 .. v8}, Ll/nl;-><init>(Lv/VEditText;Lv/VEditText;Lcom/p1/mobile/android/app/Act;Lv/VText;Ll/pej0;Ll/x20;Ll/x20;Lv/VButton;)V

    .line 239
    .line 240
    .line 241
    move-object v6, v4

    .line 242
    move-object v4, v2

    .line 243
    move-object v2, v6

    .line 244
    move-object v6, v5

    .line 245
    invoke-static {v8, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 246
    .line 247
    .line 248
    sget v0, Ll/wcc0;->h0:I

    .line 249
    .line 250
    invoke-virtual {v6, v0}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 251
    .line 252
    .line 253
    move-result-object v0

    .line 254
    check-cast v0, Lv/VText;

    .line 255
    .line 256
    invoke-static {}, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;->d()Ll/pf60;

    .line 257
    .line 258
    .line 259
    move-result-object v5

    .line 260
    invoke-static {}, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;->e()Lcom/p1/mobile/putong/api/mobile/ChinaMobileController$MobileType;

    .line 261
    .line 262
    .line 263
    move-result-object v7

    .line 264
    sget-object v8, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController$MobileType;->unknown:Lcom/p1/mobile/putong/api/mobile/ChinaMobileController$MobileType;

    .line 265
    .line 266
    if-ne v7, v8, :cond_2

    .line 267
    .line 268
    invoke-static {}, Ll/zwk;->j()Ljava/lang/String;

    .line 269
    .line 270
    .line 271
    move-result-object v5

    .line 272
    const-string v7, "\u300a\u9690\u79c1\u7b56\u7565\u300b"

    .line 273
    .line 274
    invoke-static {}, Ll/zwk;->i()Ljava/lang/String;

    .line 275
    .line 276
    .line 277
    move-result-object v8

    .line 278
    const-string v14, "\u300a\u7528\u6237\u534f\u8bae\u300b"

    .line 279
    .line 280
    filled-new-array {v14, v5, v7, v8}, [Ljava/lang/String;

    .line 281
    .line 282
    .line 283
    move-result-object v5

    .line 284
    const-string v7, "\u6839\u636e\u56fd\u5bb6\u5b9e\u540d\u8981\u6c42\uff0c\u9605\u8bfb\u5e76\u540c\u610f\u5b8c\u6210\u624b\u673a\u53f7\u7ed1\u5b9a\uff0c\u300a\u7528\u6237\u534f\u8bae\u300b\u3001\u300a\u9690\u79c1\u7b56\u7565\u300b"

    .line 285
    .line 286
    invoke-static {v3, v7, v5}, Ll/q8g0;->B(Landroid/app/Activity;Ljava/lang/String;[Ljava/lang/String;)Landroid/text/SpannableStringBuilder;

    .line 287
    .line 288
    .line 289
    move-result-object v5

    .line 290
    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 291
    .line 292
    .line 293
    goto :goto_1

    .line 294
    :cond_2
    new-instance v7, Ljava/lang/StringBuilder;

    .line 295
    .line 296
    const-string v8, "\u6839\u636e\u56fd\u5bb6\u5b9e\u540d\u8981\u6c42\uff0c\u9605\u8bfb\u5e76\u540c\u610f\u5b8c\u6210\u624b\u673a\u53f7\u7ed1\u5b9a\uff0c\u300a"

    .line 297
    .line 298
    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 299
    .line 300
    .line 301
    iget-object v8, v5, Ll/pf60;->a:Ljava/lang/Object;

    .line 302
    .line 303
    check-cast v8, Ljava/lang/String;

    .line 304
    .line 305
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 306
    .line 307
    .line 308
    const-string v8, "\u300b\u3001\u300a\u7528\u6237\u534f\u8bae\u300b\u3001\u300a\u9690\u79c1\u7b56\u7565\u300b"

    .line 309
    .line 310
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 311
    .line 312
    .line 313
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 314
    .line 315
    .line 316
    move-result-object v7

    .line 317
    new-instance v8, Ljava/lang/StringBuilder;

    .line 318
    .line 319
    const-string v14, "\u300a"

    .line 320
    .line 321
    invoke-direct {v8, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 322
    .line 323
    .line 324
    iget-object v14, v5, Ll/pf60;->a:Ljava/lang/Object;

    .line 325
    .line 326
    check-cast v14, Ljava/lang/String;

    .line 327
    .line 328
    invoke-virtual {v8, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 329
    .line 330
    .line 331
    const-string v14, "\u300b"

    .line 332
    .line 333
    invoke-virtual {v8, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 334
    .line 335
    .line 336
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 337
    .line 338
    .line 339
    move-result-object v15

    .line 340
    iget-object v5, v5, Ll/pf60;->b:Ljava/lang/Object;

    .line 341
    .line 342
    move-object/from16 v16, v5

    .line 343
    .line 344
    check-cast v16, Ljava/lang/String;

    .line 345
    .line 346
    invoke-static {}, Ll/zwk;->j()Ljava/lang/String;

    .line 347
    .line 348
    .line 349
    move-result-object v18

    .line 350
    const-string v19, "\u300a\u9690\u79c1\u7b56\u7565\u300b"

    .line 351
    .line 352
    invoke-static {}, Ll/zwk;->i()Ljava/lang/String;

    .line 353
    .line 354
    .line 355
    move-result-object v20

    .line 356
    const-string v17, "\u300a\u7528\u6237\u534f\u8bae\u300b"

    .line 357
    .line 358
    filled-new-array/range {v15 .. v20}, [Ljava/lang/String;

    .line 359
    .line 360
    .line 361
    move-result-object v5

    .line 362
    invoke-static {v3, v7, v5}, Ll/q8g0;->B(Landroid/app/Activity;Ljava/lang/String;[Ljava/lang/String;)Landroid/text/SpannableStringBuilder;

    .line 363
    .line 364
    .line 365
    move-result-object v5

    .line 366
    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 367
    .line 368
    .line 369
    :goto_1
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    .line 370
    .line 371
    .line 372
    move-result-object v5

    .line 373
    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 374
    .line 375
    .line 376
    sget v0, Ll/wcc0;->w:I

    .line 377
    .line 378
    invoke-virtual {v6, v0}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 379
    .line 380
    .line 381
    move-result-object v0

    .line 382
    check-cast v0, Lv/VImage;

    .line 383
    .line 384
    new-instance v5, Ll/ol;

    .line 385
    .line 386
    move-object/from16 v7, p5

    .line 387
    .line 388
    invoke-direct {v5, v3, v7, v6}, Ll/ol;-><init>(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/pej0;)V

    .line 389
    .line 390
    .line 391
    invoke-static {v0, v5}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 392
    .line 393
    .line 394
    new-instance v0, Ljava/lang/StringBuilder;

    .line 395
    .line 396
    const-string v5, "+"

    .line 397
    .line 398
    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 399
    .line 400
    .line 401
    sget-object v5, Ll/nsb;->d:Ljava/util/ArrayList;

    .line 402
    .line 403
    invoke-virtual {v5, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 404
    .line 405
    .line 406
    move-result-object v5

    .line 407
    check-cast v5, Ll/nsb;

    .line 408
    .line 409
    iget v5, v5, Ll/nsb;->b:I

    .line 410
    .line 411
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 412
    .line 413
    .line 414
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 415
    .line 416
    .line 417
    move-result-object v0

    .line 418
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 419
    .line 420
    .line 421
    new-instance v0, Ll/pl;

    .line 422
    .line 423
    invoke-direct {v0, v3, v2}, Ll/pl;-><init>(Lcom/p1/mobile/android/app/Act;Lv/VText;)V

    .line 424
    .line 425
    .line 426
    invoke-static {v2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 427
    .line 428
    .line 429
    new-instance v0, Ll/ql;

    .line 430
    .line 431
    move-object v5, v3

    .line 432
    move-object v3, v11

    .line 433
    invoke-direct/range {v0 .. v5}, Ll/ql;-><init>(Lv/VEditText;Lv/VText;Lv/VText;Lv/VEditText;Lcom/p1/mobile/android/app/Act;)V

    .line 434
    .line 435
    .line 436
    move-object v2, v0

    .line 437
    move-object v0, v3

    .line 438
    move-object v3, v5

    .line 439
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 440
    .line 441
    .line 442
    new-instance v2, Ll/rl;

    .line 443
    .line 444
    invoke-direct {v2, v1, v3, v13}, Ll/rl;-><init>(Lv/VEditText;Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V

    .line 445
    .line 446
    .line 447
    invoke-virtual {v6, v2}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 448
    .line 449
    .line 450
    invoke-static {v10}, Ll/l51;->B(Ljava/lang/String;)Z

    .line 451
    .line 452
    .line 453
    move-result v2

    .line 454
    if-nez v2, :cond_4

    .line 455
    .line 456
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 457
    .line 458
    .line 459
    move-result-object v1

    .line 460
    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    .line 461
    .line 462
    .line 463
    move-result v1

    .line 464
    if-lez v1, :cond_3

    .line 465
    .line 466
    move v9, v12

    .line 467
    :cond_3
    invoke-static {v0, v9}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 468
    .line 469
    .line 470
    :cond_4
    invoke-virtual {v6}, Landroid/app/Dialog;->show()V

    .line 471
    .line 472
    .line 473
    return-object v6
.end method

.method public static synthetic j(Lcom/p1/mobile/android/app/Act;Ll/x20;Lv/VButton;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    instance-of p0, p3, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 5
    .line 6
    if-eqz p0, :cond_2

    .line 7
    .line 8
    move-object p0, p3

    .line 9
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 10
    .line 11
    iget p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 12
    .line 13
    const v0, 0x9c40

    .line 14
    .line 15
    .line 16
    if-ne p0, v0, :cond_0

    .line 17
    .line 18
    invoke-static {p3}, Ll/bsj0;->G(Ljava/lang/Throwable;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-static {p0}, Ll/bsj0;->l(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    if-nez p0, :cond_1

    .line 27
    .line 28
    invoke-interface {p1}, Ll/x20;->call()V

    .line 29
    .line 30
    .line 31
    invoke-static {p3}, Ll/bsj0;->G(Ljava/lang/Throwable;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    sget p0, Ll/qa00;->j:I

    .line 39
    .line 40
    invoke-static {p2, p0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_2
    invoke-static {p3}, Ll/bsj0;->G(Ljava/lang/Throwable;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public static j0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ll/x20;Ll/x20;Ll/x20;Ll/x20;)Ll/pej0;
    .locals 7

    .line 1
    const-class v0, Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "p_force_bindphone_identified_popup"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "signup_way"

    .line 14
    .line 15
    invoke-static {v1, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    filled-new-array {p1}, [Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {v0, p1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 27
    .line 28
    .line 29
    new-instance p1, Ll/pej0;

    .line 30
    .line 31
    invoke-direct {p1, p0}, Ll/pej0;-><init>(Landroid/content/Context;)V

    .line 32
    .line 33
    .line 34
    const/4 v1, 0x0

    .line 35
    invoke-virtual {p1, v1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCanceledOnTouchOutside(Z)V

    .line 36
    .line 37
    .line 38
    sget v2, Ll/hec0;->b:I

    .line 39
    .line 40
    invoke-virtual {p1, v2}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(I)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1, v1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCancelable(Z)V

    .line 44
    .line 45
    .line 46
    new-instance v1, Ll/sm$i;

    .line 47
    .line 48
    invoke-direct {v1, v0}, Ll/sm$i;-><init>(Ll/l4g0;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p1, v1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    if-eqz v1, :cond_0

    .line 63
    .line 64
    const v1, 0x1020002

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0, v1}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    sget v2, Ll/wcc0;->o:I

    .line 72
    .line 73
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    check-cast v1, Landroid/widget/FrameLayout;

    .line 78
    .line 79
    sget v2, Ll/bbc0;->a0:I

    .line 80
    .line 81
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 82
    .line 83
    .line 84
    :cond_0
    new-instance v1, Ll/sl;

    .line 85
    .line 86
    invoke-direct {v1, v0}, Ll/sl;-><init>(Landroid/view/Window;)V

    .line 87
    .line 88
    .line 89
    invoke-static {v1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 90
    .line 91
    .line 92
    sget v0, Ll/wcc0;->z:I

    .line 93
    .line 94
    invoke-virtual {p1, v0}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    check-cast v0, Lv/VText;

    .line 99
    .line 100
    const/4 v1, 0x3

    .line 101
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    const/4 v3, 0x1

    .line 106
    invoke-virtual {v0, v2, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 107
    .line 108
    .line 109
    sget v0, Ll/wcc0;->y:I

    .line 110
    .line 111
    invoke-virtual {p1, v0}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    check-cast v0, Lv/VText;

    .line 116
    .line 117
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 118
    .line 119
    .line 120
    move-result-object v2

    .line 121
    invoke-virtual {v0, v2, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 122
    .line 123
    .line 124
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 125
    .line 126
    .line 127
    move-result v2

    .line 128
    if-nez v2, :cond_1

    .line 129
    .line 130
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 131
    .line 132
    .line 133
    :cond_1
    sget p2, Ll/wcc0;->x:I

    .line 134
    .line 135
    invoke-virtual {p1, p2}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 136
    .line 137
    .line 138
    move-result-object p2

    .line 139
    check-cast p2, Lv/VText;

    .line 140
    .line 141
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    invoke-virtual {p2, v0, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 146
    .line 147
    .line 148
    new-instance v0, Ll/tl;

    .line 149
    .line 150
    invoke-direct {v0, p6, p1}, Ll/tl;-><init>(Ll/x20;Ll/pej0;)V

    .line 151
    .line 152
    .line 153
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 154
    .line 155
    .line 156
    sget p2, Ll/wcc0;->a:I

    .line 157
    .line 158
    invoke-virtual {p1, p2}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 159
    .line 160
    .line 161
    move-result-object p2

    .line 162
    check-cast p2, Lv/VButton;

    .line 163
    .line 164
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 165
    .line 166
    .line 167
    move-result-object p6

    .line 168
    invoke-virtual {p2, p6, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 169
    .line 170
    .line 171
    new-instance p6, Ll/vl;

    .line 172
    .line 173
    invoke-direct {p6, p0, p5, p1, p4}, Ll/vl;-><init>(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/pej0;Ll/x20;)V

    .line 174
    .line 175
    .line 176
    invoke-static {p2, p6}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 177
    .line 178
    .line 179
    sget p2, Ll/wcc0;->h0:I

    .line 180
    .line 181
    invoke-virtual {p1, p2}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 182
    .line 183
    .line 184
    move-result-object p2

    .line 185
    check-cast p2, Lv/VText;

    .line 186
    .line 187
    invoke-static {}, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;->d()Ll/pf60;

    .line 188
    .line 189
    .line 190
    move-result-object p4

    .line 191
    new-instance p5, Ljava/lang/StringBuilder;

    .line 192
    .line 193
    const-string p6, "\u6839\u636e\u56fd\u5bb6\u5b9e\u540d\u8981\u6c42\uff0c\u9605\u8bfb\u5e76\u540c\u610f\u5b8c\u6210\u624b\u673a\u53f7\u7ed1\u5b9a\uff0c\u300a"

    .line 194
    .line 195
    invoke-direct {p5, p6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 196
    .line 197
    .line 198
    iget-object p6, p4, Ll/pf60;->a:Ljava/lang/Object;

    .line 199
    .line 200
    check-cast p6, Ljava/lang/String;

    .line 201
    .line 202
    invoke-virtual {p5, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    const-string p6, "\u300b\u3001\u300a\u7528\u6237\u534f\u8bae\u300b\u3001\u300a\u9690\u79c1\u7b56\u7565\u300b"

    .line 206
    .line 207
    invoke-virtual {p5, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 208
    .line 209
    .line 210
    invoke-virtual {p5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 211
    .line 212
    .line 213
    move-result-object p5

    .line 214
    new-instance p6, Ljava/lang/StringBuilder;

    .line 215
    .line 216
    const-string v0, "\u300a"

    .line 217
    .line 218
    invoke-direct {p6, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 219
    .line 220
    .line 221
    iget-object v0, p4, Ll/pf60;->a:Ljava/lang/Object;

    .line 222
    .line 223
    check-cast v0, Ljava/lang/String;

    .line 224
    .line 225
    invoke-virtual {p6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 226
    .line 227
    .line 228
    const-string v0, "\u300b"

    .line 229
    .line 230
    invoke-virtual {p6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 231
    .line 232
    .line 233
    invoke-virtual {p6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 234
    .line 235
    .line 236
    move-result-object v1

    .line 237
    iget-object p4, p4, Ll/pf60;->b:Ljava/lang/Object;

    .line 238
    .line 239
    move-object v2, p4

    .line 240
    check-cast v2, Ljava/lang/String;

    .line 241
    .line 242
    invoke-static {}, Ll/zwk;->j()Ljava/lang/String;

    .line 243
    .line 244
    .line 245
    move-result-object v4

    .line 246
    const-string v5, "\u300a\u9690\u79c1\u7b56\u7565\u300b"

    .line 247
    .line 248
    invoke-static {}, Ll/zwk;->i()Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object v6

    .line 252
    const-string v3, "\u300a\u7528\u6237\u534f\u8bae\u300b"

    .line 253
    .line 254
    filled-new-array/range {v1 .. v6}, [Ljava/lang/String;

    .line 255
    .line 256
    .line 257
    move-result-object p4

    .line 258
    invoke-static {p0, p5, p4}, Ll/q8g0;->B(Landroid/app/Activity;Ljava/lang/String;[Ljava/lang/String;)Landroid/text/SpannableStringBuilder;

    .line 259
    .line 260
    .line 261
    move-result-object p0

    .line 262
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 263
    .line 264
    .line 265
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    .line 266
    .line 267
    .line 268
    move-result-object p0

    .line 269
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 270
    .line 271
    .line 272
    sget p0, Ll/wcc0;->w:I

    .line 273
    .line 274
    invoke-virtual {p1, p0}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 275
    .line 276
    .line 277
    move-result-object p0

    .line 278
    check-cast p0, Lv/VImage;

    .line 279
    .line 280
    new-instance p2, Ll/wl;

    .line 281
    .line 282
    invoke-direct {p2, p1, p3}, Ll/wl;-><init>(Ll/pej0;Ll/x20;)V

    .line 283
    .line 284
    .line 285
    invoke-static {p0, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 286
    .line 287
    .line 288
    invoke-virtual {p1}, Landroid/app/Dialog;->show()V

    .line 289
    .line 290
    .line 291
    return-object p1
.end method

.method public static synthetic k(Lv/VEditText;Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;Landroid/content/DialogInterface;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ll/jyb;->L(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const-wide/16 v0, 0xc8

    .line 16
    .line 17
    invoke-virtual {p1, p2, v0, v1}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public static k0(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/x20;)Ll/pej0;
    .locals 5

    .line 1
    const-class v0, Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "p_login_user_agreement_popup"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 14
    .line 15
    .line 16
    new-instance v1, Ll/pej0;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/pej0;-><init>(Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    sget v2, Ll/hec0;->B:I

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(I)V

    .line 24
    .line 25
    .line 26
    const/4 v2, 0x0

    .line 27
    invoke-virtual {v1, v2}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCanceledOnTouchOutside(Z)V

    .line 28
    .line 29
    .line 30
    new-instance v2, Ll/sm$f;

    .line 31
    .line 32
    invoke-direct {v2, v0, p2}, Ll/sm$f;-><init>(Ll/l4g0;Ll/x20;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1, v2}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 36
    .line 37
    .line 38
    new-instance p2, Ll/sm$g;

    .line 39
    .line 40
    invoke-direct {p2}, Ll/sm$g;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v1, p2}, Landroid/app/Dialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_0

    .line 55
    .line 56
    const v0, 0x1020002

    .line 57
    .line 58
    .line 59
    invoke-virtual {p2, v0}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    sget v2, Ll/wcc0;->o:I

    .line 64
    .line 65
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    check-cast v0, Landroid/widget/FrameLayout;

    .line 70
    .line 71
    sget v2, Ll/bbc0;->a0:I

    .line 72
    .line 73
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 74
    .line 75
    .line 76
    :cond_0
    new-instance v0, Ll/zk;

    .line 77
    .line 78
    invoke-direct {v0, p2}, Ll/zk;-><init>(Landroid/view/Window;)V

    .line 79
    .line 80
    .line 81
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 82
    .line 83
    .line 84
    sget p2, Ll/wcc0;->z:I

    .line 85
    .line 86
    invoke-virtual {v1, p2}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 87
    .line 88
    .line 89
    move-result-object p2

    .line 90
    check-cast p2, Lv/VText;

    .line 91
    .line 92
    const/4 v0, 0x3

    .line 93
    invoke-static {v0}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    const/4 v3, 0x1

    .line 98
    invoke-virtual {p2, v2, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 99
    .line 100
    .line 101
    sget v2, Ll/wcc0;->a:I

    .line 102
    .line 103
    invoke-virtual {v1, v2}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    check-cast v2, Lv/VButton;

    .line 108
    .line 109
    invoke-static {v0}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-virtual {v2, v0, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 114
    .line 115
    .line 116
    new-instance v0, Ll/al;

    .line 117
    .line 118
    invoke-direct {v0, p1, v1}, Ll/al;-><init>(Ll/x20;Ll/pej0;)V

    .line 119
    .line 120
    .line 121
    invoke-static {v2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 122
    .line 123
    .line 124
    sget p1, Ll/wcc0;->g0:I

    .line 125
    .line 126
    invoke-virtual {v1, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    check-cast p1, Lv/VText;

    .line 131
    .line 132
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->p()Z

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    if-eqz v0, :cond_1

    .line 137
    .line 138
    sget v0, Lcom/p1/mobile/putong/account/R$string;->a1:I

    .line 139
    .line 140
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(I)V

    .line 141
    .line 142
    .line 143
    sget p2, Lcom/p1/mobile/putong/account/R$string;->Z0:I

    .line 144
    .line 145
    invoke-virtual {v2, p2}, Landroid/widget/TextView;->setText(I)V

    .line 146
    .line 147
    .line 148
    const-string p2, "#66000000"

    .line 149
    .line 150
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 151
    .line 152
    .line 153
    move-result v0

    .line 154
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 155
    .line 156
    .line 157
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 158
    .line 159
    .line 160
    move-result p2

    .line 161
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setLinkTextColor(I)V

    .line 162
    .line 163
    .line 164
    new-instance p2, Ljava/lang/StringBuilder;

    .line 165
    .line 166
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 167
    .line 168
    .line 169
    sget v0, Lcom/p1/mobile/putong/account/R$string;->r0:I

    .line 170
    .line 171
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    const-string v0, " "

    .line 179
    .line 180
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    sget v2, Lcom/p1/mobile/putong/account/R$string;->s0:I

    .line 184
    .line 185
    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object v2

    .line 189
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 193
    .line 194
    .line 195
    sget v0, Lcom/p1/mobile/putong/account/R$string;->I2:I

    .line 196
    .line 197
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 202
    .line 203
    .line 204
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object p2

    .line 208
    sget v0, Lcom/p1/mobile/putong/account/R$string;->r0:I

    .line 209
    .line 210
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 211
    .line 212
    .line 213
    move-result-object v0

    .line 214
    invoke-static {}, Ll/zwk;->j()Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object v2

    .line 218
    sget v3, Lcom/p1/mobile/putong/account/R$string;->I2:I

    .line 219
    .line 220
    invoke-virtual {p0, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object v3

    .line 224
    invoke-static {}, Ll/zwk;->i()Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object v4

    .line 228
    filled-new-array {v0, v2, v3, v4}, [Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object v0

    .line 232
    invoke-static {p0, p2, v0}, Ll/sm;->e0(Landroid/app/Activity;Ljava/lang/String;[Ljava/lang/String;)Landroid/text/SpannableStringBuilder;

    .line 233
    .line 234
    .line 235
    move-result-object p0

    .line 236
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 237
    .line 238
    .line 239
    goto :goto_0

    .line 240
    :cond_1
    invoke-static {}, Ll/zwk;->j()Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    move-result-object p2

    .line 244
    const-string v0, "\u300a\u9690\u79c1\u7b56\u7565\u300b"

    .line 245
    .line 246
    invoke-static {}, Ll/zwk;->i()Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object v2

    .line 250
    const-string v3, "\u300a\u7528\u6237\u534f\u8bae\u300b"

    .line 251
    .line 252
    filled-new-array {v3, p2, v0, v2}, [Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    move-result-object p2

    .line 256
    const-string v0, "\u300a\u7528\u6237\u534f\u8bae\u300b\u548c\u300a\u9690\u79c1\u7b56\u7565\u300b"

    .line 257
    .line 258
    invoke-static {p0, v0, p2}, Ll/q8g0;->B(Landroid/app/Activity;Ljava/lang/String;[Ljava/lang/String;)Landroid/text/SpannableStringBuilder;

    .line 259
    .line 260
    .line 261
    move-result-object p0

    .line 262
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 263
    .line 264
    .line 265
    :goto_0
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    .line 266
    .line 267
    .line 268
    move-result-object p0

    .line 269
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 270
    .line 271
    .line 272
    sget p0, Ll/wcc0;->w:I

    .line 273
    .line 274
    invoke-virtual {v1, p0}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 275
    .line 276
    .line 277
    move-result-object p0

    .line 278
    check-cast p0, Lv/VImage;

    .line 279
    .line 280
    new-instance p1, Ll/bl;

    .line 281
    .line 282
    invoke-direct {p1, v1}, Ll/bl;-><init>(Ll/pej0;)V

    .line 283
    .line 284
    .line 285
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 286
    .line 287
    .line 288
    invoke-virtual {v1}, Landroid/app/Dialog;->show()V

    .line 289
    .line 290
    .line 291
    return-object v1
.end method

.method public static synthetic l(Ll/x20;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return-object p0
.end method

.method public static l0(Lcom/p1/mobile/android/app/Act;ZZZLl/x20;Ll/x20;Ll/y20;)Ll/pej0;
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "ZZZ",
            "Ll/x20;",
            "Ll/x20;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)",
            "Ll/pej0;"
        }
    .end annotation

    .line 1
    const-class v0, Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "p_other_signin_popup"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 14
    .line 15
    .line 16
    new-instance v2, Ll/pej0;

    .line 17
    .line 18
    invoke-direct {v2, p0}, Ll/pej0;-><init>(Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    const/4 v3, 0x1

    .line 22
    invoke-virtual {v2, v3}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCanceledOnTouchOutside(Z)V

    .line 23
    .line 24
    .line 25
    sget v4, Ll/hec0;->L:I

    .line 26
    .line 27
    invoke-virtual {v2, v4}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(I)V

    .line 28
    .line 29
    .line 30
    new-instance v4, Ll/sm$b;

    .line 31
    .line 32
    invoke-direct {v4}, Ll/sm$b;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v2, v4}, Landroid/app/Dialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v2}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v5

    .line 46
    if-eqz v5, :cond_0

    .line 47
    .line 48
    const v5, 0x1020002

    .line 49
    .line 50
    .line 51
    invoke-virtual {v4, v5}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object v5

    .line 55
    sget v6, Ll/wcc0;->o:I

    .line 56
    .line 57
    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object v5

    .line 61
    check-cast v5, Landroid/widget/FrameLayout;

    .line 62
    .line 63
    sget v6, Ll/bbc0;->a0:I

    .line 64
    .line 65
    invoke-virtual {v5, v6}, Landroid/view/View;->setBackgroundResource(I)V

    .line 66
    .line 67
    .line 68
    :cond_0
    new-instance v5, Ll/cl;

    .line 69
    .line 70
    invoke-direct {v5, v4}, Ll/cl;-><init>(Landroid/view/Window;)V

    .line 71
    .line 72
    .line 73
    invoke-static {v5}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 74
    .line 75
    .line 76
    sget v4, Ll/wcc0;->M:I

    .line 77
    .line 78
    invoke-virtual {v2, v4}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 79
    .line 80
    .line 81
    move-result-object v4

    .line 82
    check-cast v4, Lv/VRecyclerView;

    .line 83
    .line 84
    new-instance v5, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 85
    .line 86
    invoke-direct {v5, p0}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 87
    .line 88
    .line 89
    const/4 v6, 0x0

    .line 90
    invoke-virtual {v5, v6}, Landroidx/recyclerview/widget/LinearLayoutManager;->setOrientation(I)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v4, v5}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 94
    .line 95
    .line 96
    new-instance v5, Ljava/util/ArrayList;

    .line 97
    .line 98
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 99
    .line 100
    .line 101
    new-instance v6, Ll/zx;

    .line 102
    .line 103
    invoke-direct {v6, p0}, Ll/zx;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 104
    .line 105
    .line 106
    const-string v7, "display_signin_way"

    .line 107
    .line 108
    const-string v8, "e_other_signin_way"

    .line 109
    .line 110
    if-eqz p2, :cond_1

    .line 111
    .line 112
    const-string v9, "wechat"

    .line 113
    .line 114
    invoke-static {v7, v9}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 115
    .line 116
    .line 117
    move-result-object v9

    .line 118
    filled-new-array {v9}, [Ll/pf60;

    .line 119
    .line 120
    .line 121
    move-result-object v9

    .line 122
    invoke-static {v8, v1, v9}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 123
    .line 124
    .line 125
    new-instance v9, Lcom/p1/mobile/putong/account/data/AccountShareItemBean;

    .line 126
    .line 127
    const-string v10, "\u5fae\u4fe1"

    .line 128
    .line 129
    sget v11, Ll/bbc0;->X:I

    .line 130
    .line 131
    move-object/from16 v12, p4

    .line 132
    .line 133
    invoke-direct {v9, v10, v11, v12}, Lcom/p1/mobile/putong/account/data/AccountShareItemBean;-><init>(Ljava/lang/String;ILl/x20;)V

    .line 134
    .line 135
    .line 136
    invoke-interface {v5, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 137
    .line 138
    .line 139
    :cond_1
    if-eqz p3, :cond_2

    .line 140
    .line 141
    const-string v9, "qq"

    .line 142
    .line 143
    invoke-static {v7, v9}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 144
    .line 145
    .line 146
    move-result-object v7

    .line 147
    filled-new-array {v7}, [Ll/pf60;

    .line 148
    .line 149
    .line 150
    move-result-object v7

    .line 151
    invoke-static {v8, v1, v7}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 152
    .line 153
    .line 154
    new-instance v1, Lcom/p1/mobile/putong/account/data/AccountShareItemBean;

    .line 155
    .line 156
    const-string v7, "QQ"

    .line 157
    .line 158
    sget v8, Ll/bbc0;->W:I

    .line 159
    .line 160
    move-object/from16 v9, p5

    .line 161
    .line 162
    invoke-direct {v1, v7, v8, v9}, Lcom/p1/mobile/putong/account/data/AccountShareItemBean;-><init>(Ljava/lang/String;ILl/x20;)V

    .line 163
    .line 164
    .line 165
    invoke-interface {v5, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 166
    .line 167
    .line 168
    :cond_2
    invoke-virtual {v4, v6}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {v6, v5}, Ll/zx;->C(Ljava/util/List;)V

    .line 172
    .line 173
    .line 174
    new-instance v1, Ll/sm$c;

    .line 175
    .line 176
    invoke-direct {v1, v5}, Ll/sm$c;-><init>(Ljava/util/List;)V

    .line 177
    .line 178
    .line 179
    invoke-virtual {v6, v1}, Ll/zx;->D(Ll/zx$b;)V

    .line 180
    .line 181
    .line 182
    sget v1, Ll/wcc0;->K:I

    .line 183
    .line 184
    invoke-virtual {v2, v1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 185
    .line 186
    .line 187
    move-result-object v1

    .line 188
    check-cast v1, Lv/VCheckBox;

    .line 189
    .line 190
    new-instance v4, Ll/dl;

    .line 191
    .line 192
    move-object/from16 v5, p6

    .line 193
    .line 194
    invoke-direct {v4, v5, v1}, Ll/dl;-><init>(Ll/y20;Lv/VCheckBox;)V

    .line 195
    .line 196
    .line 197
    invoke-static {v1, v4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 198
    .line 199
    .line 200
    sget v4, Ll/wcc0;->L:I

    .line 201
    .line 202
    invoke-virtual {v2, v4}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 203
    .line 204
    .line 205
    move-result-object v4

    .line 206
    check-cast v4, Lv/VText;

    .line 207
    .line 208
    if-eqz p1, :cond_3

    .line 209
    .line 210
    invoke-virtual {v1, v3}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 211
    .line 212
    .line 213
    :cond_3
    sget p1, Lcom/p1/mobile/putong/account/R$string;->O3:I

    .line 214
    .line 215
    sget v1, Lcom/p1/mobile/putong/account/R$string;->r0:I

    .line 216
    .line 217
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object v1

    .line 221
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 222
    .line 223
    .line 224
    move-result-object v1

    .line 225
    const-string v3, " %s "

    .line 226
    .line 227
    invoke-static {v3, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 228
    .line 229
    .line 230
    move-result-object v1

    .line 231
    sget v3, Lcom/p1/mobile/putong/account/R$string;->I2:I

    .line 232
    .line 233
    invoke-virtual {p0, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 234
    .line 235
    .line 236
    move-result-object v3

    .line 237
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 238
    .line 239
    .line 240
    move-result-object v3

    .line 241
    const-string v5, " %s"

    .line 242
    .line 243
    invoke-static {v5, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 244
    .line 245
    .line 246
    move-result-object v3

    .line 247
    filled-new-array {v1, v3}, [Ljava/lang/Object;

    .line 248
    .line 249
    .line 250
    move-result-object v1

    .line 251
    invoke-virtual {p0, p1, v1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 252
    .line 253
    .line 254
    move-result-object p1

    .line 255
    sget v1, Lcom/p1/mobile/putong/account/R$string;->r0:I

    .line 256
    .line 257
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 258
    .line 259
    .line 260
    move-result-object v1

    .line 261
    invoke-static {}, Ll/zwk;->j()Ljava/lang/String;

    .line 262
    .line 263
    .line 264
    move-result-object v3

    .line 265
    sget v5, Lcom/p1/mobile/putong/account/R$string;->I2:I

    .line 266
    .line 267
    invoke-virtual {p0, v5}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 268
    .line 269
    .line 270
    move-result-object v5

    .line 271
    invoke-static {}, Ll/zwk;->i()Ljava/lang/String;

    .line 272
    .line 273
    .line 274
    move-result-object v6

    .line 275
    filled-new-array {v1, v3, v5, v6}, [Ljava/lang/String;

    .line 276
    .line 277
    .line 278
    move-result-object v1

    .line 279
    invoke-static {p0, p1, v1}, Ll/q8g0;->B(Landroid/app/Activity;Ljava/lang/String;[Ljava/lang/String;)Landroid/text/SpannableStringBuilder;

    .line 280
    .line 281
    .line 282
    move-result-object p0

    .line 283
    invoke-virtual {v4, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 284
    .line 285
    .line 286
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    .line 287
    .line 288
    .line 289
    move-result-object p0

    .line 290
    invoke-virtual {v4, p0}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 291
    .line 292
    .line 293
    new-instance p0, Ll/sm$d;

    .line 294
    .line 295
    invoke-direct {p0, v0}, Ll/sm$d;-><init>(Ll/l4g0;)V

    .line 296
    .line 297
    .line 298
    invoke-virtual {v2, p0}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 299
    .line 300
    .line 301
    invoke-virtual {v2}, Landroid/app/Dialog;->show()V

    .line 302
    .line 303
    .line 304
    return-object v2
.end method

.method public static synthetic m(Ll/y20;Lv/VCheckBox;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public static m0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->G0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0, p3}, Lcom/p1/mobile/android/app/Dialog$e;->u0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const/4 p1, 0x1

    .line 18
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public static synthetic n(Lcom/p1/mobile/android/app/Dialog;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static n0(Lcom/p1/mobile/android/app/Act;Ll/y20;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/y20<",
            "Landroid/util/Pair<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

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
    const-class v0, Lcom/p1/mobile/android/app/Dialog;

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "p_intl_captcha_popup"

    .line 21
    .line 22
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    const/4 v2, 0x0

    .line 34
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    sget v2, Ll/hec0;->e0:I

    .line 39
    .line 40
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->M(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    new-instance v2, Ll/om;

    .line 45
    .line 46
    invoke-direct {v2, v0}, Ll/om;-><init>(Ll/l4g0;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->V(Landroid/content/DialogInterface$OnDismissListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->u()Lcom/p1/mobile/android/app/Dialog$e;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog;->P()Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    check-cast v1, Lcom/p1/mobile/putong/account/ui/accountnew/VCodeCaptchaView;

    .line 69
    .line 70
    iget-object v2, v1, Lcom/p1/mobile/putong/account/ui/accountnew/VCodeCaptchaView;->d:Lv/VImage;

    .line 71
    .line 72
    new-instance v3, Ll/pm;

    .line 73
    .line 74
    invoke-direct {v3, v0}, Ll/pm;-><init>(Lcom/p1/mobile/android/app/Dialog;)V

    .line 75
    .line 76
    .line 77
    invoke-static {v2, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 78
    .line 79
    .line 80
    sget-object v2, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 81
    .line 82
    invoke-virtual {v2}, Lcom/p1/mobile/putong/account/api/a;->W0()Lrx/c;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    invoke-virtual {p0, v2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    new-instance v3, Ll/qm;

    .line 91
    .line 92
    invoke-direct {v3, v1, p0, v0, p1}, Ll/qm;-><init>(Lcom/p1/mobile/putong/account/ui/accountnew/VCodeCaptchaView;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/android/app/Dialog;Ll/y20;)V

    .line 93
    .line 94
    .line 95
    new-instance p0, Ll/rm;

    .line 96
    .line 97
    invoke-direct {p0, v0}, Ll/rm;-><init>(Lcom/p1/mobile/android/app/Dialog;)V

    .line 98
    .line 99
    .line 100
    invoke-static {v3, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    invoke-virtual {v2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 105
    .line 106
    .line 107
    :cond_1
    :goto_0
    return-void
.end method

.method public static synthetic o(Lv/VEditText;Lv/VText;Lv/VButton;Lv/VEditText;Ljava/lang/CharSequence;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 2
    .line 3
    .line 4
    move-result-object p4

    .line 5
    invoke-virtual {p4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p4

    .line 9
    invoke-virtual {p4}, Ljava/lang/String;->isEmpty()Z

    .line 10
    .line 11
    .line 12
    move-result p4

    .line 13
    const/4 v0, 0x0

    .line 14
    if-nez p4, :cond_0

    .line 15
    .line 16
    const-string p4, "bind_phone_obs"

    .line 17
    .line 18
    invoke-static {p4}, Ll/l51;->B(Ljava/lang/String;)Z

    .line 19
    .line 20
    .line 21
    move-result p4

    .line 22
    if-nez p4, :cond_0

    .line 23
    .line 24
    const/4 p4, 0x1

    .line 25
    invoke-static {p1, p4}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    invoke-static {p1, v0}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    :goto_0
    sget p1, Ll/qa00;->q:I

    .line 33
    .line 34
    invoke-static {p2, p1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 35
    .line 36
    .line 37
    const-string p1, "p_force_bindphone_unidentified_popup"

    .line 38
    .line 39
    new-array p4, v0, [Ll/pf60;

    .line 40
    .line 41
    const-string v0, "e_force_bindphone_unidentified_input"

    .line 42
    .line 43
    invoke-static {v0, p1, p4}, Ll/i4g0;->v(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    if-nez p0, :cond_1

    .line 63
    .line 64
    invoke-virtual {p3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    .line 77
    .line 78
    .line 79
    move-result p0

    .line 80
    if-nez p0, :cond_1

    .line 81
    .line 82
    sget p0, Ll/bbc0;->K1:I

    .line 83
    .line 84
    invoke-virtual {p2, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :cond_1
    sget p0, Ll/bbc0;->t1:I

    .line 89
    .line 90
    invoke-virtual {p2, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public static synthetic p(Ll/x20;Lcom/p1/mobile/putong/data/MobileRespInfo;)V
    .locals 0

    .line 1
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/MobileRespInfo;->failed:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const-string p1, "\u624b\u673a\u7ed1\u5b9a\u5931\u8d25"

    .line 6
    .line 7
    invoke-static {p1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {p0}, Ll/x20;->call()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public static synthetic q(Landroid/view/Window;)V
    .locals 1

    .line 1
    sget v0, Ll/yfc0;->c:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/Window;->setWindowAnimations(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic r(Lv/VEditText;Lv/VEditText;Lcom/p1/mobile/android/app/Act;Lv/VText;Ll/pej0;Ll/x20;Ll/x20;Lv/VButton;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p8, "e_force_bindphone_unidentified_confirm"

    .line 2
    .line 3
    const-string v0, "p_force_bindphone_unidentified_popup"

    .line 4
    .line 5
    invoke-static {p8, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 9
    .line 10
    .line 11
    move-result-object p8

    .line 12
    invoke-static {p8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result p8

    .line 16
    if-eqz p8, :cond_0

    .line 17
    .line 18
    const-string p0, "\u8bf7\u8f93\u5165\u624b\u673a\u53f7"

    .line 19
    .line 20
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 25
    .line 26
    .line 27
    move-result-object p8

    .line 28
    invoke-static {p8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result p8

    .line 32
    if-eqz p8, :cond_1

    .line 33
    .line 34
    const-string p0, "\u8bf7\u8f93\u5165\u77ed\u4fe1\u9a8c\u8bc1\u7801"

    .line 35
    .line 36
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    sget p8, Lcom/p1/mobile/putong/account/R$string;->j0:I

    .line 41
    .line 42
    invoke-virtual {p2, p8}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 43
    .line 44
    .line 45
    new-instance p8, Lcom/p1/mobile/putong/data/VerifyData;

    .line 46
    .line 47
    invoke-direct {p8}, Lcom/p1/mobile/putong/data/VerifyData;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-static {p1}, Ll/bsj0;->I(Landroid/widget/TextView;)I

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    iput p1, p8, Lcom/p1/mobile/putong/data/VerifyData;->code:I

    .line 55
    .line 56
    const-string p1, "bind_mobile"

    .line 57
    .line 58
    invoke-static {p1}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    iput-object v0, p8, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 63
    .line 64
    const/4 v0, 0x6

    .line 65
    iput v0, p8, Lcom/p1/mobile/putong/data/VerifyData;->codeLength:I

    .line 66
    .line 67
    invoke-static {p3}, Ll/bsj0;->I(Landroid/widget/TextView;)I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    iput v0, p8, Lcom/p1/mobile/putong/data/VerifyData;->countryCode:I

    .line 72
    .line 73
    invoke-static {p0}, Ll/bsj0;->M(Landroid/widget/TextView;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    iput-object v0, p8, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

    .line 78
    .line 79
    invoke-static {p1}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    iput-object p1, p8, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 84
    .line 85
    invoke-static {p3}, Ll/bsj0;->I(Landroid/widget/TextView;)I

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    iput p1, p8, Lcom/p1/mobile/putong/data/VerifyData;->countryCode:I

    .line 90
    .line 91
    invoke-static {p0}, Ll/bsj0;->M(Landroid/widget/TextView;)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    iput-object p0, p8, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

    .line 96
    .line 97
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 98
    .line 99
    invoke-virtual {p0, p8}, Lcom/p1/mobile/putong/account/api/a;->B2(Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    new-instance p1, Ll/xl;

    .line 104
    .line 105
    invoke-direct {p1, p2, p4, p5}, Ll/xl;-><init>(Lcom/p1/mobile/android/app/Act;Ll/pej0;Ll/x20;)V

    .line 106
    .line 107
    .line 108
    new-instance p3, Ll/yl;

    .line 109
    .line 110
    invoke-direct {p3, p2, p6, p7}, Ll/yl;-><init>(Lcom/p1/mobile/android/app/Act;Ll/x20;Lv/VButton;)V

    .line 111
    .line 112
    .line 113
    const/4 p2, 0x0

    .line 114
    invoke-static {p1, p3, p2}, Ll/psd0;->K(Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 119
    .line 120
    .line 121
    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/android/app/Act;Ll/y20;Ll/y20;Ljava/util/Date;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-static {}, Ll/bsj0;->V()Ljava/util/Date;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p3, v0}, Ljava/util/Date;->compareTo(Ljava/util/Date;)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lez v0, :cond_1

    .line 10
    .line 11
    sget-object p2, Ll/p1j0;->INSTANCE:Ll/p1j0;

    .line 12
    .line 13
    sget p3, Lcom/p1/mobile/putong/account/R$string;->j3:I

    .line 14
    .line 15
    invoke-virtual {p0, p3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p3

    .line 19
    sget v0, Ll/bbc0;->Y:I

    .line 20
    .line 21
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p2, p0, p3, v0}, Ll/p1j0;->b(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 26
    .line 27
    .line 28
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-eqz p0, :cond_0

    .line 33
    .line 34
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 35
    .line 36
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 40
    .line 41
    return-object p0

    .line 42
    :cond_1
    invoke-static {}, Ll/bsj0;->N()Ljava/util/Date;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {p3, v0}, Ljava/util/Date;->compareTo(Ljava/util/Date;)I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-gez v0, :cond_3

    .line 51
    .line 52
    sget-object p2, Ll/p1j0;->INSTANCE:Ll/p1j0;

    .line 53
    .line 54
    sget p3, Lcom/p1/mobile/putong/account/R$string;->i3:I

    .line 55
    .line 56
    invoke-virtual {p0, p3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p3

    .line 60
    sget v0, Ll/bbc0;->Y:I

    .line 61
    .line 62
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {p2, p0, p3, v0}, Ll/p1j0;->b(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 67
    .line 68
    .line 69
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    if-eqz p0, :cond_2

    .line 74
    .line 75
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 76
    .line 77
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 78
    .line 79
    .line 80
    :cond_2
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 81
    .line 82
    return-object p0

    .line 83
    :cond_3
    invoke-virtual {p3}, Ljava/util/Date;->getTime()J

    .line 84
    .line 85
    .line 86
    move-result-wide p0

    .line 87
    long-to-double p0, p0

    .line 88
    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-interface {p2, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 93
    .line 94
    .line 95
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 96
    .line 97
    return-object p0
.end method

.method public static synthetic t(Lcom/p1/mobile/putong/data/MobileRespInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/MobileRespInfo;->failed:Z

    .line 2
    .line 3
    xor-int/lit8 p0, p0, 0x1

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic u(Ll/x20;Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 5
    .line 6
    .line 7
    instance-of p0, p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    move-object p0, p2

    .line 12
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 13
    .line 14
    iget p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 15
    .line 16
    const p1, 0x9c4b

    .line 17
    .line 18
    .line 19
    if-ne p0, p1, :cond_0

    .line 20
    .line 21
    invoke-static {p2}, Ll/bsj0;->G(Ljava/lang/Throwable;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public static synthetic v(Lv/VText;Lv/VEditText;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 3
    .line 4
    .line 5
    sget v1, Lcom/p1/mobile/putong/account/R$string;->r3:I

    .line 6
    .line 7
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 8
    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-static {p0, v1}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    invoke-static {p0, v1}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    invoke-static {p0, v0}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public static synthetic w(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/pej0;Ll/x20;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p4, "e_force_bindphone_identified_confirm"

    .line 2
    .line 3
    const-string v0, "p_force_bindphone_identified_popup"

    .line 4
    .line 5
    invoke-static {p4, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;->b()Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;

    .line 9
    .line 10
    .line 11
    move-result-object p4

    .line 12
    const/16 v0, 0x1388

    .line 13
    .line 14
    invoke-virtual {p4, v0}, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;->h(I)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p4

    .line 18
    new-instance v0, Ll/bm;

    .line 19
    .line 20
    invoke-direct {v0, p1}, Ll/bm;-><init>(Ll/x20;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p4, v0}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p4

    .line 27
    new-instance v0, Ll/cm;

    .line 28
    .line 29
    invoke-direct {v0}, Ll/cm;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p4, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p4

    .line 36
    new-instance v0, Ll/dm;

    .line 37
    .line 38
    invoke-direct {v0}, Ll/dm;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p4, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object p4

    .line 45
    const/4 v0, 0x0

    .line 46
    invoke-virtual {p0, p4, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;Z)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object p4

    .line 50
    new-instance v0, Ll/em;

    .line 51
    .line 52
    invoke-direct {v0, p2, p3}, Ll/em;-><init>(Ll/pej0;Ll/x20;)V

    .line 53
    .line 54
    .line 55
    new-instance p3, Ll/gm;

    .line 56
    .line 57
    invoke-direct {p3, p1, p0}, Ll/gm;-><init>(Ll/x20;Lcom/p1/mobile/android/app/Act;)V

    .line 58
    .line 59
    .line 60
    invoke-static {v0, p3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p4, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 65
    .line 66
    .line 67
    invoke-virtual {p2}, Ll/pej0;->dismiss()V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public static synthetic x(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic y(Landroid/view/Window;)V
    .locals 1

    .line 1
    sget v0, Ll/yfc0;->c:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/Window;->setWindowAnimations(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/account/ui/accountnew/VCodeCaptchaView;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/android/app/Dialog;Ll/y20;Lcom/p1/mobile/putong/account/data/CaptchaData;)V
    .locals 1

    .line 1
    new-instance v0, Ll/hl;

    .line 2
    .line 3
    invoke-direct {v0, p2, p3}, Ll/hl;-><init>(Lcom/p1/mobile/android/app/Dialog;Ll/y20;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1, p4, v0}, Lcom/p1/mobile/putong/account/ui/accountnew/VCodeCaptchaView;->w0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/account/data/CaptchaData;Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
