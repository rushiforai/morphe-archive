.class public Ll/zsb;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static b:Ll/zsb;


# instance fields
.field public a:Lcom/p1/mobile/putong/data/User;


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

.method public static synthetic a(Ll/zsb;Ll/l4g0;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/zsb;->i(Ll/l4g0;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 3

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->K0:Ll/cza;

    .line 4
    .line 5
    invoke-static {}, Ll/a5i0;->I1()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x1

    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-virtual {p0, v2, v0, v1}, Ll/cza;->O3(Ll/x20;ZZ)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic c(Ll/zsb;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;Ll/y20;Landroid/app/Dialog;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/zsb;->h(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;Ll/y20;Landroid/app/Dialog;Ljava/lang/String;)V

    return-void
.end method

.method public static f()Ll/zsb;
    .locals 2

    .line 1
    sget-object v0, Ll/zsb;->b:Ll/zsb;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/zsb;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/zsb;->b:Ll/zsb;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/zsb;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/zsb;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/zsb;->b:Ll/zsb;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/zsb;->b:Ll/zsb;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public d(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/zsb;->n(Z)V

    .line 3
    .line 4
    .line 5
    invoke-static {}, Ll/a5i0;->f0()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 12
    .line 13
    const-string v2, "spotLight"

    .line 14
    .line 15
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v1, v2}, Ll/joa;->x4(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lcom/p1/mobile/putong/core/data/UserPrivilege;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    const/4 v2, 0x0

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/UserPrivilege;->content:Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 27
    .line 28
    iget v1, v1, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->remaining:I

    .line 29
    .line 30
    if-lez v1, :cond_0

    .line 31
    .line 32
    sget-object p0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_SPOTLIGHT:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 33
    .line 34
    const/4 v0, 0x1

    .line 35
    invoke-static {p1, v2, v2, p0, v0}, Ll/b83;->o(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    if-lez p0, :cond_1

    .line 40
    .line 41
    sget-object p0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_SPOTLIGHT:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 42
    .line 43
    invoke-static {p1, v2, v2, p0, v0}, Ll/b83;->o(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    new-instance p0, Ll/xsb;

    .line 48
    .line 49
    invoke-direct {p0}, Ll/xsb;-><init>()V

    .line 50
    .line 51
    .line 52
    const-string v0, "p_messages_view,e_messages_spotlight,click"

    .line 53
    .line 54
    invoke-static {p1, v0, p0}, Lcom/p1/mobile/putong/core/ui/purchase/c;->d1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public e()Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zsb;->a:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    return-object p0
.end method

.method public final g(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;)V
    .locals 0

    .line 1
    const-string p0, "input_method"

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/view/inputmethod/InputMethodManager;

    .line 8
    .line 9
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->getEditTextView()Lv/VEditText;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    if-eqz p2, :cond_0

    .line 18
    .line 19
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    if-eqz p2, :cond_0

    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const/4 p2, 0x0

    .line 30
    invoke-virtual {p0, p1, p2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public final synthetic h(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;Ll/y20;Landroid/app/Dialog;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/zsb;->g(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 11
    .line 12
    invoke-interface {p3, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    invoke-virtual {p4}, Landroid/app/Dialog;->dismiss()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic i(Ll/l4g0;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2, p3}, Ll/zsb;->g(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public j()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->K0:Ll/cza;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/cza;->R3()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ll/zsb;->a:Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    sput-object v0, Ll/zsb;->b:Ll/zsb;

    .line 12
    .line 13
    return-void
.end method

.method public k(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zsb;->a:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    return-void
.end method

.method public l(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/zsb;->n(Z)V

    .line 3
    .line 4
    .line 5
    invoke-static {p1}, Ll/u73;->C(Lcom/p1/mobile/android/app/Act;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public m(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/y20;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/data/User;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v5, Landroid/app/Dialog;

    .line 2
    .line 3
    sget v0, Ll/agc0;->z:I

    .line 4
    .line 5
    invoke-direct {v5, p1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const-string v1, "p_spotlight_chat_popup"

    .line 17
    .line 18
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 19
    .line 20
    .line 21
    move-result-object v6

    .line 22
    const/4 v7, 0x1

    .line 23
    invoke-virtual {v5, v7}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v5, v7}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    sget v1, Ll/kec0;->qd:I

    .line 34
    .line 35
    const/4 v2, 0x0

    .line 36
    const/4 v8, 0x0

    .line 37
    invoke-virtual {v0, v1, v2, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    move-object v9, v0

    .line 42
    check-cast v9, Landroid/widget/ScrollView;

    .line 43
    .line 44
    sget v0, Ll/adc0;->U6:I

    .line 45
    .line 46
    invoke-virtual {v9, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    move-object v3, v0

    .line 51
    check-cast v3, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;

    .line 52
    .line 53
    const-string v0, "spotlight_messages"

    .line 54
    .line 55
    invoke-virtual {v3, v0}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->setFrom(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    new-instance v0, Ll/zsb$a;

    .line 59
    .line 60
    invoke-direct {v0, p0, v9, v3}, Ll/zsb$a;-><init>(Ll/zsb;Landroid/widget/ScrollView;Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v3, v0}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 64
    .line 65
    .line 66
    new-instance v0, Ll/usb;

    .line 67
    .line 68
    move-object v1, p0

    .line 69
    move-object v2, p1

    .line 70
    move-object v4, p3

    .line 71
    invoke-direct/range {v0 .. v5}, Ll/usb;-><init>(Ll/zsb;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;Ll/y20;Landroid/app/Dialog;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v3, v0}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->setSendClickCallBack(Ll/y20;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v5, v9}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-virtual {v2}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    iget p1, p1, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 93
    .line 94
    iput p1, p0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 95
    .line 96
    invoke-virtual {v3, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v5}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    const/16 p1, 0x50

    .line 104
    .line 105
    invoke-virtual {p0, p1}, Landroid/view/Window;->setGravity(I)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v5}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    sget p1, Ll/agc0;->A:I

    .line 113
    .line 114
    invoke-virtual {p0, p1}, Landroid/view/Window;->setWindowAnimations(I)V

    .line 115
    .line 116
    .line 117
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->d:Ll/yy6;

    .line 118
    .line 119
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 120
    .line 121
    invoke-static {}, Ll/q8g0;->y()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p3

    .line 125
    invoke-virtual {p0, p1, p3, v7}, Ll/yy6;->C(Lcom/p1/mobile/putong/data/Gender;Ljava/lang/String;Z)Ljava/util/List;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-virtual {v3, p0}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->setLetterWrapperLibraries(Ljava/util/List;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {v3, p2, v8}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->C(Lcom/p1/mobile/putong/data/User;Z)V

    .line 133
    .line 134
    .line 135
    new-instance p0, Ll/vsb;

    .line 136
    .line 137
    invoke-direct {p0, v5}, Ll/vsb;-><init>(Landroid/app/Dialog;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {v3, p0}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;->setCloseClick(Ll/x20;)V

    .line 141
    .line 142
    .line 143
    new-instance p0, Ll/wsb;

    .line 144
    .line 145
    invoke-direct {p0, v1, v6, v2, v3}, Ll/wsb;-><init>(Ll/zsb;Ll/l4g0;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/vip/widget/LetterSendPanel;)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {v5, p0}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 149
    .line 150
    .line 151
    invoke-virtual {v5}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    const/16 p1, 0x10

    .line 156
    .line 157
    invoke-virtual {p0, p1}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {v5}, Landroid/app/Dialog;->show()V

    .line 161
    .line 162
    .line 163
    invoke-static {v6}, Ll/w1e;->f(Ll/l4g0;)V

    .line 164
    .line 165
    .line 166
    return-void
.end method

.method public n(Z)V
    .locals 1

    .line 1
    const-string p0, "p_messages_view"

    .line 2
    .line 3
    const-string v0, "e_messages_spotlight"

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-static {v0, p0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-static {v0, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
