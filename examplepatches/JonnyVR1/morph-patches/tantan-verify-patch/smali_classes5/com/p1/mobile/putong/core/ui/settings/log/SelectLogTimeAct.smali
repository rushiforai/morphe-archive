.class public Lcom/p1/mobile/putong/core/ui/settings/log/SelectLogTimeAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# instance fields
.field public c:Lv/navigationbar/VNavigationBar;

.field public d:Lv/VText;

.field public e:Lv/VButton;

.field public f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/util/Calendar;",
            ">;"
        }
    .end annotation
.end field

.field public g:Ljava/util/Calendar;


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

.method public static synthetic X1(Lcom/p1/mobile/putong/core/ui/settings/log/SelectLogTimeAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/log/SelectLogTimeAct;->e2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/core/ui/settings/log/SelectLogTimeAct;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/log/SelectLogTimeAct;->d2(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic Z1(Lcom/p1/mobile/putong/core/ui/settings/log/SelectLogTimeAct;Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;III)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/settings/log/SelectLogTimeAct;->i2(Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;III)V

    return-void
.end method

.method public static synthetic a2(Lcom/p1/mobile/putong/core/ui/settings/log/SelectLogTimeAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/log/SelectLogTimeAct;->g2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b2(Lcom/p1/mobile/putong/core/ui/settings/log/SelectLogTimeAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/log/SelectLogTimeAct;->h2(Landroid/view/View;)V

    return-void
.end method

.method private d2(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/log/SelectLogTimeAct;->c:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    const-string v0, "\u4e0a\u4f20\u65e5\u5fd7"

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/log/SelectLogTimeAct;->c:Lv/navigationbar/VNavigationBar;

    .line 9
    .line 10
    new-instance v0, Ll/jle0;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/jle0;-><init>(Lcom/p1/mobile/putong/core/ui/settings/log/SelectLogTimeAct;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, v0}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Ll/p3k0;->f()Ljava/util/List;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/log/SelectLogTimeAct;->f:Ljava/util/List;

    .line 23
    .line 24
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_0

    .line 29
    .line 30
    const-string p0, "\u6ca1\u6709\u53ef\u4ee5\u4e0a\u4f20\u7684\u65e5\u5fd7\u6587\u4ef6"

    .line 31
    .line 32
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/settings/log/SelectLogTimeAct;->r()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method private synthetic g2(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/log/SelectLogTimeAct;->k2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic h2(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/log/SelectLogTimeAct;->g:Ljava/util/Calendar;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/log/UploadLogAct;->c2(Landroid/content/Context;Ljava/util/Calendar;)Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private r()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/log/SelectLogTimeAct;->f:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x1

    .line 8
    sub-int/2addr v1, v2

    .line 9
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ljava/util/Calendar;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/log/SelectLogTimeAct;->g:Ljava/util/Calendar;

    .line 16
    .line 17
    invoke-virtual {v0, v2}, Ljava/util/Calendar;->get(I)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    const/4 v3, 0x2

    .line 22
    invoke-virtual {v0, v3}, Ljava/util/Calendar;->get(I)I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    add-int/2addr v3, v2

    .line 27
    const/4 v2, 0x5

    .line 28
    invoke-virtual {v0, v2}, Ljava/util/Calendar;->get(I)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    invoke-virtual {p0, v1, v3, v0}, Lcom/p1/mobile/putong/core/ui/settings/log/SelectLogTimeAct;->l2(III)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/log/SelectLogTimeAct;->d:Lv/VText;

    .line 36
    .line 37
    new-instance v1, Ll/kle0;

    .line 38
    .line 39
    invoke-direct {v1, p0}, Ll/kle0;-><init>(Lcom/p1/mobile/putong/core/ui/settings/log/SelectLogTimeAct;)V

    .line 40
    .line 41
    .line 42
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/log/SelectLogTimeAct;->e:Lv/VButton;

    .line 46
    .line 47
    new-instance v1, Ll/lle0;

    .line 48
    .line 49
    invoke-direct {v1, p0}, Ll/lle0;-><init>(Lcom/p1/mobile/putong/core/ui/settings/log/SelectLogTimeAct;)V

    .line 50
    .line 51
    .line 52
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method


# virtual methods
.method public c2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/nle0;->b(Lcom/p1/mobile/putong/core/ui/settings/log/SelectLogTimeAct;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic e2(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic i2(Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;III)V
    .locals 0

    .line 1
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1, p2, p3, p4}, Ljava/util/Calendar;->set(III)V

    .line 6
    .line 7
    .line 8
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/log/SelectLogTimeAct;->g:Ljava/util/Calendar;

    .line 9
    .line 10
    add-int/lit8 p3, p3, 0x1

    .line 11
    .line 12
    invoke-virtual {p0, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/settings/log/SelectLogTimeAct;->l2(III)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/settings/log/SelectLogTimeAct;->c2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public initSubscription()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ile0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/ile0;-><init>(Lcom/p1/mobile/putong/core/ui/settings/log/SelectLogTimeAct;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final k2()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/log/SelectLogTimeAct;->f:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x1

    .line 8
    sub-int/2addr v1, v2

    .line 9
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ljava/util/Calendar;

    .line 14
    .line 15
    invoke-virtual {v0, v2}, Ljava/util/Calendar;->get(I)I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    const/4 v3, 0x2

    .line 20
    invoke-virtual {v0, v3}, Ljava/util/Calendar;->get(I)I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    const/4 v4, 0x5

    .line 25
    invoke-virtual {v0, v4}, Ljava/util/Calendar;->get(I)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    new-instance v4, Ll/mle0;

    .line 30
    .line 31
    invoke-direct {v4, p0}, Ll/mle0;-><init>(Lcom/p1/mobile/putong/core/ui/settings/log/SelectLogTimeAct;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v4, v1, v3, v0, v2}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->h4(Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$d;IIIZ)Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const/4 v1, 0x0

    .line 39
    invoke-virtual {v0, v1}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->o4(Z)V

    .line 40
    .line 41
    .line 42
    iget-object v2, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 43
    .line 44
    sget v3, Lcom/p1/mobile/putong/core/R$string;->T:I

    .line 45
    .line 46
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-virtual {v0, v2}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->l4(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    iget-object v2, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 54
    .line 55
    sget v3, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 56
    .line 57
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-virtual {v0, v2}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->j4(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/log/SelectLogTimeAct;->f:Ljava/util/List;

    .line 65
    .line 66
    new-array v1, v1, [Ljava/util/Calendar;

    .line 67
    .line 68
    invoke-interface {v2, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    check-cast v1, [Ljava/util/Calendar;

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;->m4([Ljava/util/Calendar;)V

    .line 75
    .line 76
    .line 77
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 78
    .line 79
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    const-string v1, "select_log_date"

    .line 84
    .line 85
    invoke-virtual {v0, p0, v1}, Landroidx/fragment/app/DialogFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public final l2(III)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/log/SelectLogTimeAct;->d:Lv/VText;

    .line 2
    .line 3
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object p3

    .line 19
    filled-new-array {p1, p2, p3}, [Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const-string p2, "\u9009\u62e9\u65f6\u95f4\uff1a%d.%d.%d"

    .line 24
    .line 25
    invoke-static {v0, p2, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method
