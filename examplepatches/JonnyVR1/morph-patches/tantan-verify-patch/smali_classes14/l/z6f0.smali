.class public Ll/z6f0;
.super Ll/jbf0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jbf0<",
        "Ll/u6f0;",
        "Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/ShortCutLoginOptActivity;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Lv/navigationbar/VNavigationBar;

.field public d:Lv/VButton;

.field public e:Landroid/widget/TextView;

.field public f:Landroid/widget/LinearLayout;

.field public g:Lv/VCheckBox;

.field public h:Lv/VText;

.field public final i:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/ShortCutLoginOptActivity;

.field public j:Ll/u6f0;

.field public k:Ljava/lang/Runnable;

.field public l:Z

.field public m:Landroid/os/Handler;

.field public n:Ll/x20;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/ShortCutLoginOptActivity;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/jbf0;-><init>(Lcom/p1/mobile/putong/app/PutongAct;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/z6f0;->l:Z

    .line 6
    .line 7
    new-instance v0, Ll/z6f0$a;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/z6f0$a;-><init>(Ll/z6f0;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/z6f0;->m:Landroid/os/Handler;

    .line 13
    .line 14
    new-instance v0, Ll/z6f0$b;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Ll/z6f0$b;-><init>(Ll/z6f0;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/z6f0;->n:Ll/x20;

    .line 20
    .line 21
    iput-object p1, p0, Ll/z6f0;->i:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/ShortCutLoginOptActivity;

    .line 22
    .line 23
    return-void
.end method

.method public static synthetic j(Ll/z6f0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/z6f0;->x(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k(Ll/z6f0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/z6f0;->u(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l(Ll/z6f0;Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/z6f0;->v(Landroid/widget/CompoundButton;Z)V

    return-void
.end method

.method public static synthetic m(Ll/z6f0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/z6f0;->w(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic n(Ll/z6f0;)Ll/u6f0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z6f0;->j:Ll/u6f0;

    return-object p0
.end method

.method private synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z6f0;->j:Ll/u6f0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/u6f0;->B1()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic w(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z6f0;->j:Ll/u6f0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/u6f0;->C1()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic x(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/z6f0;->g:Lv/VCheckBox;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    xor-int/lit8 v0, v0, 0x1

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/z6f0;->z()V

    .line 13
    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public A3(Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-object p1, p0, Ll/z6f0;->c:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    iget-object v0, p0, Ll/z6f0;->i:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/ShortCutLoginOptActivity;

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Lv/navigationbar/VNavigationBar;->setLeftIconAsBack(Landroid/app/Activity;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/z6f0;->i:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/ShortCutLoginOptActivity;

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->alwaysHideInput()V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Ll/z6f0;->i:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/ShortCutLoginOptActivity;

    .line 14
    .line 15
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    const/4 v0, 0x1

    .line 20
    invoke-virtual {p1, v0}, Ll/c30;->w(Z)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ll/z6f0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Ll/z6f0;->d:Lv/VButton;

    .line 31
    .line 32
    new-instance v0, Ll/v6f0;

    .line 33
    .line 34
    invoke-direct {v0, p0}, Ll/v6f0;-><init>(Ll/z6f0;)V

    .line 35
    .line 36
    .line 37
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Ll/z6f0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->pageId()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    const-string v0, "agreement_entrance"

    .line 49
    .line 50
    const-string v1, "one_click_login"

    .line 51
    .line 52
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    filled-new-array {v0}, [Ll/pf60;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    const-string v1, "e_sign_in_agreement"

    .line 61
    .line 62
    invoke-static {v1, p1, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Ll/z6f0;->g:Lv/VCheckBox;

    .line 66
    .line 67
    new-instance v0, Ll/w6f0;

    .line 68
    .line 69
    invoke-direct {v0, p0}, Ll/w6f0;-><init>(Ll/z6f0;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p1, v0}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 73
    .line 74
    .line 75
    iget-object p1, p0, Ll/z6f0;->e:Landroid/widget/TextView;

    .line 76
    .line 77
    new-instance v0, Ll/x6f0;

    .line 78
    .line 79
    invoke-direct {v0, p0}, Ll/x6f0;-><init>(Ll/z6f0;)V

    .line 80
    .line 81
    .line 82
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 83
    .line 84
    .line 85
    invoke-static {}, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;->d()Ll/pf60;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    iget-object v0, p0, Ll/z6f0;->h:Lv/VText;

    .line 90
    .line 91
    new-instance v1, Ll/y6f0;

    .line 92
    .line 93
    invoke-direct {v1, p0}, Ll/y6f0;-><init>(Ll/z6f0;)V

    .line 94
    .line 95
    .line 96
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 97
    .line 98
    .line 99
    iget-object v0, p0, Ll/z6f0;->h:Lv/VText;

    .line 100
    .line 101
    iget-object v1, p0, Ll/z6f0;->i:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/ShortCutLoginOptActivity;

    .line 102
    .line 103
    new-instance v2, Ljava/lang/StringBuilder;

    .line 104
    .line 105
    const-string v3, "\u6211\u5df2\u9605\u8bfb\u5e76\u540c\u610f "

    .line 106
    .line 107
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    iget-object v3, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 111
    .line 112
    check-cast v3, Ljava/lang/String;

    .line 113
    .line 114
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    const-string v3, " \u5e76\u6388\u6743\u63a2\u63a2\u83b7\u53d6\u672c\u673a\u53f7\u7801"

    .line 118
    .line 119
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v2

    .line 126
    iget-object v3, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 127
    .line 128
    check-cast v3, Ljava/lang/String;

    .line 129
    .line 130
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 131
    .line 132
    check-cast p1, Ljava/lang/String;

    .line 133
    .line 134
    filled-new-array {v3, p1}, [Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    invoke-static {v1, v2, p1}, Ll/q8g0;->B(Landroid/app/Activity;Ljava/lang/String;[Ljava/lang/String;)Landroid/text/SpannableStringBuilder;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 143
    .line 144
    .line 145
    iget-object p0, p0, Ll/z6f0;->h:Lv/VText;

    .line 146
    .line 147
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 152
    .line 153
    .line 154
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z6f0;->i:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/ShortCutLoginOptActivity;

    .line 2
    .line 3
    return-object p0
.end method

.method public a()Lcom/p1/mobile/putong/app/PutongAct;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z6f0;->i:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/ShortCutLoginOptActivity;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/z6f0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic b(Ll/ibf0;)V
    .locals 0

    .line 1
    check-cast p1, Ll/u6f0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/z6f0;->q(Ll/u6f0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/u6f0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/z6f0;->q(Ll/u6f0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/z6f0;->p(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public p(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/a7f0;->b(Ll/z6f0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public q(Ll/u6f0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/z6f0;->j:Ll/u6f0;

    .line 2
    .line 3
    return-void
.end method

.method public s(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z6f0;->d:Lv/VButton;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/view/View;->setClickable(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic v(Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/z6f0;->z()V

    .line 4
    .line 5
    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/z6f0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->pageId()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const-string p1, "agreement_entrance"

    .line 15
    .line 16
    const-string p2, "one_click_login"

    .line 17
    .line 18
    invoke-static {p1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    filled-new-array {p1}, [Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    const-string p2, "e_sign_in_agreement"

    .line 27
    .line 28
    invoke-static {p2, p0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public y(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/z6f0;->d:Lv/VButton;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {p1}, Ll/dy;->p0(Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string p1, " \u4e00\u952e\u767b\u5f55"

    .line 16
    .line 17
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Ll/z6f0;->d:Lv/VButton;

    .line 28
    .line 29
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Ll/z6f0;->e:Landroid/widget/TextView;

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public z()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/z6f0;->l:Z

    .line 3
    .line 4
    iget-object p0, p0, Ll/z6f0;->k:Ljava/lang/Runnable;

    .line 5
    .line 6
    invoke-static {p0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
