.class public Ll/o0b0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Landroid/widget/PopupWindow;

.field public static b:J

.field public static c:Ll/x20;

.field public static final d:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/m0b0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/m0b0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/o0b0;->d:Ljava/lang/Runnable;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a()V
    .locals 0

    .line 1
    invoke-static {}, Ll/o0b0;->e()V

    return-void
.end method

.method public static synthetic b(Ljava/lang/String;Lcom/p1/mobile/putong/data/Picture$ImageUri;Lcom/p1/mobile/putong/data/User;)V
    .locals 7

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v0, v0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v0, v0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    invoke-static {}, Ll/o0b0;->g()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    new-instance v1, Ll/j0b0;

    .line 35
    .line 36
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object v0, v0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    move-object v2, v0

    .line 47
    check-cast v2, Landroid/app/Activity;

    .line 48
    .line 49
    const/16 v4, 0xa

    .line 50
    .line 51
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->onlineMatchLocked()Z

    .line 52
    .line 53
    .line 54
    move-result v6

    .line 55
    move-object v3, p0

    .line 56
    move-object v5, p1

    .line 57
    invoke-direct/range {v1 .. v6}, Ll/j0b0;-><init>(Landroid/app/Activity;Ljava/lang/String;ILcom/p1/mobile/putong/data/Picture$ImageUri;Z)V

    .line 58
    .line 59
    .line 60
    sget-object p0, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->PROFILE_SEND_MSG_DONE:Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;

    .line 61
    .line 62
    invoke-virtual {v1, p0}, Ll/fqe0;->x(Ll/c3m;)Ll/fqe0;

    .line 63
    .line 64
    .line 65
    invoke-static {}, Ll/llb0;->c()Ll/llb0;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p0, v1}, Ll/llb0;->i(Ll/fqe0;)V

    .line 70
    .line 71
    .line 72
    :cond_1
    :goto_0
    return-void
.end method

.method public static synthetic c()V
    .locals 2

    .line 1
    sget-object v0, Ll/o0b0;->a:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 7
    .line 8
    .line 9
    sput-object v1, Ll/o0b0;->a:Landroid/widget/PopupWindow;

    .line 10
    .line 11
    :cond_0
    sget-object v0, Ll/o0b0;->c:Ll/x20;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-interface {v0}, Ll/x20;->call()V

    .line 16
    .line 17
    .line 18
    sput-object v1, Ll/o0b0;->c:Ll/x20;

    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method public static synthetic d(ILcom/p1/mobile/putong/data/Picture$ImageUri;Lcom/p1/mobile/putong/data/User;)V
    .locals 7

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v0, v0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v0, v0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    invoke-static {}, Ll/o0b0;->g()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    new-instance v1, Ll/j0b0;

    .line 35
    .line 36
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object v0, v0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    move-object v2, v0

    .line 47
    check-cast v2, Landroid/app/Activity;

    .line 48
    .line 49
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iget-object v0, v0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 54
    .line 55
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    check-cast v0, Landroid/app/Activity;

    .line 60
    .line 61
    invoke-virtual {v0, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    const/16 v4, 0xa

    .line 66
    .line 67
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->onlineMatchLocked()Z

    .line 68
    .line 69
    .line 70
    move-result v6

    .line 71
    move-object v5, p1

    .line 72
    invoke-direct/range {v1 .. v6}, Ll/j0b0;-><init>(Landroid/app/Activity;Ljava/lang/String;ILcom/p1/mobile/putong/data/Picture$ImageUri;Z)V

    .line 73
    .line 74
    .line 75
    sget-object p0, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->PROFILE_SEND_MSG_DONE:Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;

    .line 76
    .line 77
    invoke-virtual {v1, p0}, Ll/fqe0;->x(Ll/c3m;)Ll/fqe0;

    .line 78
    .line 79
    .line 80
    invoke-static {}, Ll/llb0;->c()Ll/llb0;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-virtual {p0, v1}, Ll/llb0;->i(Ll/fqe0;)V

    .line 85
    .line 86
    .line 87
    :cond_1
    :goto_0
    return-void
.end method

.method public static e()V
    .locals 4

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sget-wide v2, Ll/o0b0;->b:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    const-wide/16 v2, 0xbb8

    .line 9
    .line 10
    cmp-long v0, v0, v2

    .line 11
    .line 12
    if-gez v0, :cond_0

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    sget-object v0, Ll/o0b0;->d:Ljava/lang/Runnable;

    .line 16
    .line 17
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 18
    .line 19
    .line 20
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static f()Landroid/widget/PopupWindow;
    .locals 1

    .line 1
    sget-object v0, Ll/o0b0;->a:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    return-object v0
.end method

.method public static g()Z
    .locals 1

    .line 1
    sget-object v0, Ll/o0b0;->a:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Ll/o0b0;->a:Landroid/widget/PopupWindow;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    return v0

    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    return v0
.end method

.method public static h(ILcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 10
    .line 11
    new-instance v2, Ll/l0b0;

    .line 12
    .line 13
    invoke-direct {v2, p0, v0, p1}, Ll/l0b0;-><init>(ILcom/p1/mobile/putong/data/Picture$ImageUri;Lcom/p1/mobile/putong/data/User;)V

    .line 14
    .line 15
    .line 16
    const-wide/16 p0, 0x1f4

    .line 17
    .line 18
    invoke-static {v1, v2, p0, p1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static i(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 10
    .line 11
    new-instance v2, Ll/k0b0;

    .line 12
    .line 13
    invoke-direct {v2, p0, v0, p1}, Ll/k0b0;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/data/Picture$ImageUri;Lcom/p1/mobile/putong/data/User;)V

    .line 14
    .line 15
    .line 16
    const-wide/16 p0, 0x1f4

    .line 17
    .line 18
    invoke-static {v1, v2, p0, p1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static j(Landroid/app/Activity;Ljava/lang/String;Ll/x20;Lcom/p1/mobile/putong/data/Picture$ImageUri;Z)V
    .locals 4

    .line 1
    sput-object p2, Ll/o0b0;->c:Ll/x20;

    .line 2
    .line 3
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    sput-wide v0, Ll/o0b0;->b:J

    .line 8
    .line 9
    new-instance p2, Landroid/widget/PopupWindow;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget v1, Ll/kec0;->x7:I

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const/4 v1, -0x2

    .line 23
    const/4 v2, 0x0

    .line 24
    invoke-direct {p2, v0, v1, v1, v2}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;IIZ)V

    .line 25
    .line 26
    .line 27
    sput-object p2, Ll/o0b0;->a:Landroid/widget/PopupWindow;

    .line 28
    .line 29
    invoke-virtual {p2}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    const/4 v0, 0x1

    .line 34
    invoke-static {p2, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 35
    .line 36
    .line 37
    invoke-static {p0}, Ll/o0b0;->k(Landroid/app/Activity;)Landroidx/appcompat/widget/Toolbar;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p2

    .line 45
    const/16 v0, 0x31

    .line 46
    .line 47
    if-eqz p2, :cond_1

    .line 48
    .line 49
    sget-object p2, Ll/o0b0;->a:Landroid/widget/PopupWindow;

    .line 50
    .line 51
    invoke-static {p0}, Ll/o0b0;->k(Landroid/app/Activity;)Landroidx/appcompat/widget/Toolbar;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-static {p0}, Ll/o0b0;->k(Landroid/app/Activity;)Landroidx/appcompat/widget/Toolbar;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    if-nez v3, :cond_0

    .line 64
    .line 65
    move v3, v2

    .line 66
    goto :goto_0

    .line 67
    :cond_0
    invoke-static {p0}, Ll/bnl0;->C(Landroid/content/Context;)I

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    neg-int v3, v3

    .line 72
    :goto_0
    invoke-virtual {p2, v1, v0, v2, v3}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 73
    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_1
    sget-object p2, Ll/o0b0;->a:Landroid/widget/PopupWindow;

    .line 77
    .line 78
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-virtual {p2, v1, v0, v2, v2}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 87
    .line 88
    .line 89
    :goto_1
    sget-object p2, Ll/o0b0;->a:Landroid/widget/PopupWindow;

    .line 90
    .line 91
    invoke-virtual {p2}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 92
    .line 93
    .line 94
    move-result-object p2

    .line 95
    sget v0, Ll/adc0;->f6:I

    .line 96
    .line 97
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 98
    .line 99
    .line 100
    move-result-object p2

    .line 101
    check-cast p2, Lv/VDraweeView;

    .line 102
    .line 103
    invoke-virtual {p2, v2}, Landroid/view/View;->setVisibility(I)V

    .line 104
    .line 105
    .line 106
    if-eqz p4, :cond_2

    .line 107
    .line 108
    sget-object p4, Ll/uqb0;->G:Ll/fsb0;

    .line 109
    .line 110
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p3

    .line 114
    const/4 v0, 0x4

    .line 115
    const/4 v1, 0x5

    .line 116
    invoke-virtual {p4, p2, p3, v0, v1}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 117
    .line 118
    .line 119
    goto :goto_2

    .line 120
    :cond_2
    sget-object p4, Ll/uqb0;->G:Ll/fsb0;

    .line 121
    .line 122
    invoke-virtual {p4, p2, p3}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 123
    .line 124
    .line 125
    :goto_2
    sget-object p2, Ll/o0b0;->a:Landroid/widget/PopupWindow;

    .line 126
    .line 127
    invoke-virtual {p2}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 128
    .line 129
    .line 130
    move-result-object p2

    .line 131
    sget p3, Ll/adc0;->je:I

    .line 132
    .line 133
    invoke-virtual {p2, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 134
    .line 135
    .line 136
    move-result-object p2

    .line 137
    check-cast p2, Lv/VText;

    .line 138
    .line 139
    sget-object p3, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 140
    .line 141
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {p2, v2}, Landroid/view/View;->setVisibility(I)V

    .line 145
    .line 146
    .line 147
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 148
    .line 149
    .line 150
    new-instance p1, Ll/n0b0;

    .line 151
    .line 152
    invoke-direct {p1}, Ll/n0b0;-><init>()V

    .line 153
    .line 154
    .line 155
    const-wide/16 p2, 0xbb8

    .line 156
    .line 157
    invoke-static {p0, p1, p2, p3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 158
    .line 159
    .line 160
    return-void
.end method

.method public static k(Landroid/app/Activity;)Landroidx/appcompat/widget/Toolbar;
    .locals 1

    .line 1
    sget v0, Ll/vcc0;->a:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroidx/appcompat/widget/Toolbar;

    .line 8
    .line 9
    return-object p0
.end method
