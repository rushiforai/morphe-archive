.class public Lcom/p1/mobile/putong/core/ui/messages/chatheat/MessageSpecialNotifyAct;
.super Lcom/p1/mobile/putong/core/PutongCoreAct;
.source "SourceFile"


# instance fields
.field public d:Landroid/view/View;

.field public e:Lv/VSwitchButton;

.field public f:Ljava/lang/String;

.field public g:Lv/VText;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/PutongCoreAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/core/ui/messages/chatheat/MessageSpecialNotifyAct;Lcom/p1/mobile/putong/data/Gender;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/chatheat/MessageSpecialNotifyAct;->l2(Lcom/p1/mobile/putong/data/Gender;)V

    return-void
.end method

.method public static synthetic Z1(Lcom/p1/mobile/putong/core/ui/messages/chatheat/MessageSpecialNotifyAct;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/chatheat/MessageSpecialNotifyAct;->k2(Landroid/util/Pair;)V

    return-void
.end method

.method public static synthetic a2(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->og()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic b2(Lcom/p1/mobile/putong/core/ui/messages/chatheat/MessageSpecialNotifyAct;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/chatheat/MessageSpecialNotifyAct;->n2(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic c2(Lcom/p1/mobile/putong/core/ui/messages/chatheat/MessageSpecialNotifyAct;ZLcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/chatheat/MessageSpecialNotifyAct;->m2(ZLcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic d2(Lcom/p1/mobile/putong/core/ui/messages/chatheat/MessageSpecialNotifyAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/chatheat/MessageSpecialNotifyAct;->i2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e2(Lcom/p1/mobile/putong/core/data/ChatHeat;)Landroid/util/Pair;
    .locals 1

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    invoke-static {p0, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic g2(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Gender;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 2
    .line 3
    return-object p0
.end method

.method public static h2(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/ui/messages/chatheat/MessageSpecialNotifyAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "user_id_arg"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    return-object v0
.end method

.method private synthetic i2(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/chatheat/MessageSpecialNotifyAct;->e:Lv/VSwitchButton;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    xor-int/lit8 v0, v0, 0x1

    .line 8
    .line 9
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "is_special_remind_on"

    .line 14
    .line 15
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    filled-new-array {v0}, [Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "e_special_remind_switch"

    .line 24
    .line 25
    const-string v2, "p_special_remind_setting"

    .line 26
    .line 27
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 28
    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    invoke-virtual {p1, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/chatheat/MessageSpecialNotifyAct;->e:Lv/VSwitchButton;

    .line 35
    .line 36
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    xor-int/lit8 p1, p1, 0x1

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/chatheat/MessageSpecialNotifyAct;->o2(Z)V

    .line 43
    .line 44
    .line 45
    return-void
.end method


# virtual methods
.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    sget p2, Ll/qec0;->D2:I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/chatheat/MessageSpecialNotifyAct;->d:Landroid/view/View;

    .line 9
    .line 10
    sget p2, Ll/edc0;->Q4:I

    .line 11
    .line 12
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Lv/VText;

    .line 17
    .line 18
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/chatheat/MessageSpecialNotifyAct;->d:Landroid/view/View;

    .line 19
    .line 20
    sget v0, Ll/edc0;->n4:I

    .line 21
    .line 22
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    check-cast p2, Lv/VText;

    .line 27
    .line 28
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/chatheat/MessageSpecialNotifyAct;->g:Lv/VText;

    .line 29
    .line 30
    invoke-virtual {p1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    const/4 v0, 0x1

    .line 35
    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 36
    .line 37
    .line 38
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/chatheat/MessageSpecialNotifyAct;->d:Landroid/view/View;

    .line 39
    .line 40
    sget v0, Ll/edc0;->g4:I

    .line 41
    .line 42
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    check-cast p2, Lv/VSwitchButton;

    .line 47
    .line 48
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/chatheat/MessageSpecialNotifyAct;->e:Lv/VSwitchButton;

    .line 49
    .line 50
    new-instance p2, Ll/d600;

    .line 51
    .line 52
    invoke-direct {p2}, Ll/d600;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 56
    .line 57
    .line 58
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/chatheat/MessageSpecialNotifyAct;->d:Landroid/view/View;

    .line 59
    .line 60
    new-instance p2, Ll/e600;

    .line 61
    .line 62
    invoke-direct {p2, p0}, Ll/e600;-><init>(Lcom/p1/mobile/putong/core/ui/messages/chatheat/MessageSpecialNotifyAct;)V

    .line 63
    .line 64
    .line 65
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 66
    .line 67
    .line 68
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/chatheat/MessageSpecialNotifyAct;->d:Landroid/view/View;

    .line 69
    .line 70
    return-object p0
.end method

.method public initSubscription()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    const-string v0, "\u8bbe\u7f6e\u7279\u6b8a\u63d0\u793a"

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->setTitle(Ljava/lang/CharSequence;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "user_id_arg"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/chatheat/MessageSpecialNotifyAct;->f:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->M1:Ll/cn7;

    .line 34
    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/chatheat/MessageSpecialNotifyAct;->f:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ll/cn7;->s3(Ljava/lang/String;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Ll/f600;

    .line 42
    .line 43
    invoke-direct {v1}, Ll/f600;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    new-instance v1, Ll/g600;

    .line 55
    .line 56
    invoke-direct {v1, p0}, Ll/g600;-><init>(Lcom/p1/mobile/putong/core/ui/messages/chatheat/MessageSpecialNotifyAct;)V

    .line 57
    .line 58
    .line 59
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 64
    .line 65
    .line 66
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 67
    .line 68
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 69
    .line 70
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/chatheat/MessageSpecialNotifyAct;->f:Ljava/lang/String;

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    new-instance v1, Ll/h600;

    .line 77
    .line 78
    invoke-direct {v1}, Ll/h600;-><init>()V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    new-instance v1, Ll/i600;

    .line 94
    .line 95
    invoke-direct {v1, p0}, Ll/i600;-><init>(Lcom/p1/mobile/putong/core/ui/messages/chatheat/MessageSpecialNotifyAct;)V

    .line 96
    .line 97
    .line 98
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public final synthetic k2(Landroid/util/Pair;)V
    .locals 1

    .line 1
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/chatheat/MessageSpecialNotifyAct;->e:Lv/VSwitchButton;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast p1, Lcom/p1/mobile/putong/core/data/ChatHeat;

    .line 14
    .line 15
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/ChatHeat;->specialRemind:Z

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lv/VSwitchButton;->setChecked(Z)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    const/4 p1, 0x0

    .line 22
    invoke-virtual {p0, p1}, Lv/VSwitchButton;->setChecked(Z)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final synthetic l2(Lcom/p1/mobile/putong/data/Gender;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/chatheat/MessageSpecialNotifyAct;->g:Lv/VText;

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v1, "\u5f00\u542f\u540e\uff0c"

    .line 6
    .line 7
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const-string v1, "female"

    .line 11
    .line 12
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    const-string p1, "\u5979"

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const-string p1, "\u4ed6"

    .line 22
    .line 23
    :goto_0
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string p1, "\u7684\u804a\u5929\u6d88\u606f\u53ef\u4ee5\u8bbe\u7f6e\u7279\u522b\u63d0\u793a\u97f3\uff0c\u540c\u65f6\u5e26\u6709\u7279\u6b8a\u6807\u8bc6"

    .line 27
    .line 28
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final synthetic m2(ZLcom/p1/mobile/putong/data/Envelope;)V
    .locals 1

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/chatheat/MessageSpecialNotifyAct;->d:Landroid/view/View;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p2, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 5
    .line 6
    .line 7
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->M1:Ll/cn7;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/chatheat/MessageSpecialNotifyAct;->f:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p2, p0}, Ll/cn7;->o3(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->og()V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public final synthetic n2(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/chatheat/MessageSpecialNotifyAct;->d:Landroid/view/View;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final o2(Z)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->M1:Ll/cn7;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/chatheat/MessageSpecialNotifyAct;->f:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1, p1}, Ll/cn7;->B3(Ljava/lang/String;Z)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/j600;

    .line 16
    .line 17
    invoke-direct {v1, p0, p1}, Ll/j600;-><init>(Lcom/p1/mobile/putong/core/ui/messages/chatheat/MessageSpecialNotifyAct;Z)V

    .line 18
    .line 19
    .line 20
    new-instance p1, Ll/k600;

    .line 21
    .line 22
    invoke-direct {p1, p0}, Ll/k600;-><init>(Lcom/p1/mobile/putong/core/ui/messages/chatheat/MessageSpecialNotifyAct;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v1, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_special_remind_setting"

    .line 2
    .line 3
    return-object p0
.end method
