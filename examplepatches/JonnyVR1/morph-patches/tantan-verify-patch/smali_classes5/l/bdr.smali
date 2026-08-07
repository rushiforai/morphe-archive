.class public Ll/bdr;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a([ZLl/x20;Ll/tj3;)V
    .locals 0

    .line 1
    const/4 p2, 0x0

    .line 2
    aput-boolean p2, p0, p2

    .line 3
    .line 4
    invoke-interface {p1}, Ll/x20;->call()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic b([ZLl/x20;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    const/4 p2, 0x0

    .line 2
    aget-boolean p0, p0, p2

    .line 3
    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-interface {p1}, Ll/x20;->call()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public static synthetic c([ZLl/x20;Ll/tj3;)V
    .locals 1

    .line 1
    const/4 p2, 0x0

    .line 2
    const/4 v0, 0x1

    .line 3
    aput-boolean v0, p0, p2

    .line 4
    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-interface {p1}, Ll/x20;->call()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static synthetic d(Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 1
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/a5i0;->O0(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;Ll/y20;Landroid/app/Dialog;Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "input_method"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/view/inputmethod/InputMethodManager;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->getEditTextView()Lv/VEditText;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const/4 v0, 0x0

    .line 30
    invoke-virtual {p0, p1, v0}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 31
    .line 32
    .line 33
    :cond_0
    invoke-interface {p2, p4}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p3}, Landroid/app/Dialog;->dismiss()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public static synthetic f(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static g(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/x20;)V
    .locals 6

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/lqb;->X4()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x1

    .line 10
    new-array v2, v1, [Z

    .line 11
    .line 12
    const/4 v3, 0x0

    .line 13
    aput-boolean v1, v2, v3

    .line 14
    .line 15
    new-instance v1, Ll/tj3$a;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/tj3$a;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 18
    .line 19
    .line 20
    sget v3, Lcom/p1/mobile/putong/core/R$string;->j3:I

    .line 21
    .line 22
    invoke-virtual {p0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    invoke-virtual {v1, v3}, Ll/tj3$a;->B(Ljava/lang/String;)Ll/tj3$a;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    sget v3, Lcom/p1/mobile/putong/core/R$string;->Wp:I

    .line 31
    .line 32
    new-instance v4, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    const-string v5, " "

    .line 35
    .line 36
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {p0, v3, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    const-string v3, "#fe7e1d"

    .line 58
    .line 59
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    const/4 v4, 0x2

    .line 64
    invoke-static {v4}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 65
    .line 66
    .line 67
    move-result-object v4

    .line 68
    invoke-static {v0, v3, v4}, Ll/q8g0;->N(Ljava/lang/String;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {v1, v0}, Ll/tj3$a;->A(Ljava/lang/CharSequence;)Ll/tj3$a;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Xp:I

    .line 77
    .line 78
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    new-instance v3, Ll/ucr;

    .line 83
    .line 84
    invoke-direct {v3, v2, p1}, Ll/ucr;-><init>([ZLl/x20;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {v0, v1, v3}, Ll/tj3$a;->x(Ljava/lang/CharSequence;Ll/y20;)Ll/tj3$a;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    sget v0, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 92
    .line 93
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    new-instance v0, Ll/vcr;

    .line 98
    .line 99
    invoke-direct {v0, v2, p2}, Ll/vcr;-><init>([ZLl/x20;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p1, p0, v0}, Ll/tj3$a;->v(Ljava/lang/CharSequence;Ll/y20;)Ll/tj3$a;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-static {}, Ll/a5i0;->p0()Ll/a5i0;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-virtual {p1}, Ll/a5i0;->K1()Z

    .line 111
    .line 112
    .line 113
    move-result p1

    .line 114
    invoke-virtual {p0, p1}, Ll/tj3$a;->y(Z)Ll/tj3$a;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    sget p1, Lcom/p1/mobile/putong/core/R$string;->dm:I

    .line 119
    .line 120
    new-instance v0, Ll/wcr;

    .line 121
    .line 122
    invoke-direct {v0}, Ll/wcr;-><init>()V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p0, p1, v0}, Ll/tj3$a;->w(ILandroid/widget/CompoundButton$OnCheckedChangeListener;)Ll/tj3$a;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    new-instance p1, Ll/xcr;

    .line 130
    .line 131
    invoke-direct {p1, v2, p2}, Ll/xcr;-><init>([ZLl/x20;)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {p0, p1}, Ll/tj3$a;->z(Landroid/content/DialogInterface$OnDismissListener;)Ll/tj3$a;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    invoke-virtual {p0}, Ll/tj3$a;->s()Ll/tj3;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    invoke-virtual {p0}, Ll/tj3;->h()Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    sget p2, Ll/dbc0;->yq:I

    .line 147
    .line 148
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->E(I)Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    const-string p2, "https://fe-static.tancdn.com/v1/images/eyJpZCI6IkFKTk1TSzJaRkpMT0xLRVVVNFhGT01DTDQ3SVBMSDE0IiwidyI6OTMzLCJoIjo3NjgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo0MjM4NjgyMDAyMjMxMDQ3fQ.webp"

    .line 153
    .line 154
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->O(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;

    .line 155
    .line 156
    .line 157
    invoke-virtual {p0}, Ll/tj3;->o()V

    .line 158
    .line 159
    .line 160
    return-void
.end method

.method public static h(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/y20;Z)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/data/User;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    new-instance v0, Landroid/app/Dialog;

    .line 2
    .line 3
    sget v1, Ll/agc0;->z:I

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const-string v2, "p_letter_sentmessage_page"

    .line 17
    .line 18
    invoke-static {v2, v1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const/4 v2, 0x1

    .line 23
    invoke-virtual {v0, v2}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v2}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    sget v3, Ll/kec0;->qd:I

    .line 34
    .line 35
    const/4 v4, 0x0

    .line 36
    const/4 v5, 0x0

    .line 37
    invoke-virtual {v2, v3, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    check-cast v2, Landroid/widget/ScrollView;

    .line 42
    .line 43
    sget v3, Ll/adc0;->U6:I

    .line 44
    .line 45
    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    check-cast v3, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;

    .line 50
    .line 51
    new-instance v4, Ll/bdr$a;

    .line 52
    .line 53
    invoke-direct {v4, v2, v3}, Ll/bdr$a;-><init>(Landroid/widget/ScrollView;Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v3, v4}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 57
    .line 58
    .line 59
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v4

    .line 63
    if-eqz v4, :cond_0

    .line 64
    .line 65
    new-instance v4, Ll/ycr;

    .line 66
    .line 67
    invoke-direct {v4, p0, v3, p2, v0}, Ll/ycr;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;Ll/y20;Landroid/app/Dialog;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->setSendClickCallBack(Ll/y20;)V

    .line 71
    .line 72
    .line 73
    :cond_0
    invoke-virtual {v0, v2}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 77
    .line 78
    .line 79
    move-result-object p2

    .line 80
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    iget p0, p0, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 89
    .line 90
    iput p0, p2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 91
    .line 92
    invoke-virtual {v3, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    const/16 p2, 0x50

    .line 100
    .line 101
    invoke-virtual {p0, p2}, Landroid/view/Window;->setGravity(I)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    sget p2, Ll/agc0;->A:I

    .line 109
    .line 110
    invoke-virtual {p0, p2}, Landroid/view/Window;->setWindowAnimations(I)V

    .line 111
    .line 112
    .line 113
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->d:Ll/yy6;

    .line 114
    .line 115
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 116
    .line 117
    invoke-static {}, Ll/q8g0;->y()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v2

    .line 121
    invoke-virtual {p0, p2, v2}, Ll/yy6;->D(Lcom/p1/mobile/putong/data/Gender;Ljava/lang/String;)Ljava/util/List;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    invoke-virtual {v3, p0}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->setLetterWrapperLibraries(Ljava/util/List;)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {v3, p1, p3}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->C(Lcom/p1/mobile/putong/data/User;Z)V

    .line 129
    .line 130
    .line 131
    new-instance p0, Ll/zcr;

    .line 132
    .line 133
    invoke-direct {p0, v1}, Ll/zcr;-><init>(Ll/l4g0;)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {v0, p0}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    const/16 p1, 0x10

    .line 144
    .line 145
    invoke-virtual {p0, p1}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 149
    .line 150
    .line 151
    invoke-static {v1}, Ll/w1e;->f(Ll/l4g0;)V

    .line 152
    .line 153
    .line 154
    return-void
.end method

.method public static i(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Ll/kec0;->n6:I

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 13
    .line 14
    invoke-direct {v1, p0, v0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;-><init>(Landroid/app/Activity;Landroid/view/View;)V

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    invoke-virtual {v1, p0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->B(I)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    sget-object v0, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->LETTER_SEND_DONE:Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->z(Ll/c3m;)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->s()Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-static {}, Ll/llb0;->c()Ll/llb0;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0, p0}, Ll/llb0;->i(Ll/fqe0;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method
