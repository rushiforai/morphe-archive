.class public Ll/bfx;
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
    new-instance v0, Ll/zex;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/zex;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/bfx;->d:Ljava/lang/Runnable;

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
    invoke-static {}, Ll/bfx;->d()V

    return-void
.end method

.method public static synthetic b()V
    .locals 2

    .line 1
    sget-object v0, Ll/bfx;->a:Landroid/widget/PopupWindow;

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
    sput-object v1, Ll/bfx;->a:Landroid/widget/PopupWindow;

    .line 10
    .line 11
    :cond_0
    sget-object v0, Ll/bfx;->c:Ll/x20;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-interface {v0}, Ll/x20;->call()V

    .line 16
    .line 17
    .line 18
    sput-object v1, Ll/bfx;->c:Ll/x20;

    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method public static synthetic c(ILcom/p1/mobile/putong/data/Picture$ImageUri;)V
    .locals 3

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
    new-instance v0, Ll/xex;

    .line 29
    .line 30
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iget-object v1, v1, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    check-cast v1, Landroid/app/Activity;

    .line 41
    .line 42
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    iget-object v2, v2, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 47
    .line 48
    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    check-cast v2, Landroid/app/Activity;

    .line 53
    .line 54
    invoke-virtual {v2, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    const/16 v2, 0xa

    .line 59
    .line 60
    invoke-direct {v0, v1, p0, v2, p1}, Ll/xex;-><init>(Landroid/app/Activity;Ljava/lang/String;ILcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 61
    .line 62
    .line 63
    sget-object p0, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->MATCH_SEND_MSG_DONE:Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;

    .line 64
    .line 65
    invoke-virtual {v0, p0}, Ll/fqe0;->x(Ll/c3m;)Ll/fqe0;

    .line 66
    .line 67
    .line 68
    invoke-static {}, Ll/llb0;->c()Ll/llb0;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {p0, v0}, Ll/llb0;->i(Ll/fqe0;)V

    .line 73
    .line 74
    .line 75
    :cond_1
    :goto_0
    return-void
.end method

.method public static d()V
    .locals 4

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sget-wide v2, Ll/bfx;->b:J

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
    sget-object v0, Ll/bfx;->d:Ljava/lang/Runnable;

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

.method public static e()Landroid/widget/PopupWindow;
    .locals 1

    .line 1
    sget-object v0, Ll/bfx;->a:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    return-object v0
.end method

.method public static f(ILcom/p1/mobile/putong/data/Picture$ImageUri;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    new-instance v1, Ll/yex;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/yex;-><init>(ILcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 6
    .line 7
    .line 8
    const-wide/16 p0, 0x1f4

    .line 9
    .line 10
    invoke-static {v0, v1, p0, p1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static g(Landroid/app/Activity;Ljava/lang/String;Ll/x20;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V
    .locals 5

    .line 1
    sput-object p2, Ll/bfx;->c:Ll/x20;

    .line 2
    .line 3
    sget-object p2, Ll/bfx;->a:Landroid/widget/PopupWindow;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p2, :cond_0

    .line 7
    .line 8
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 9
    .line 10
    .line 11
    move-result-wide v1

    .line 12
    sput-wide v1, Ll/bfx;->b:J

    .line 13
    .line 14
    new-instance p2, Landroid/widget/PopupWindow;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    sget v2, Ll/kec0;->o7:I

    .line 21
    .line 22
    const/4 v3, 0x0

    .line 23
    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-static {}, Ll/bnl0;->y0()I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    const/high16 v3, 0x42ac0000    # 86.0f

    .line 32
    .line 33
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    invoke-direct {p2, v1, v2, v3, v0}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;IIZ)V

    .line 38
    .line 39
    .line 40
    sput-object p2, Ll/bfx;->a:Landroid/widget/PopupWindow;

    .line 41
    .line 42
    :cond_0
    sget-object p2, Ll/bfx;->a:Landroid/widget/PopupWindow;

    .line 43
    .line 44
    invoke-virtual {p2}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    const/4 v1, 0x1

    .line 49
    invoke-static {p2, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 50
    .line 51
    .line 52
    invoke-static {p0}, Ll/bfx;->h(Landroid/app/Activity;)Landroidx/appcompat/widget/Toolbar;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result p2

    .line 60
    const v1, 0x800033

    .line 61
    .line 62
    .line 63
    if-eqz p2, :cond_2

    .line 64
    .line 65
    sget-object p2, Ll/bfx;->a:Landroid/widget/PopupWindow;

    .line 66
    .line 67
    invoke-static {p0}, Ll/bfx;->h(Landroid/app/Activity;)Landroidx/appcompat/widget/Toolbar;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    sget v3, Ll/qa00;->i:I

    .line 72
    .line 73
    invoke-static {p0}, Ll/bfx;->h(Landroid/app/Activity;)Landroidx/appcompat/widget/Toolbar;

    .line 74
    .line 75
    .line 76
    move-result-object v4

    .line 77
    invoke-virtual {v4}, Landroid/view/View;->getHeight()I

    .line 78
    .line 79
    .line 80
    move-result v4

    .line 81
    if-nez v4, :cond_1

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_1
    invoke-static {p0}, Ll/bnl0;->C(Landroid/content/Context;)I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    neg-int v0, v0

    .line 89
    :goto_0
    invoke-virtual {p2, v2, v1, v3, v0}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 90
    .line 91
    .line 92
    goto :goto_1

    .line 93
    :cond_2
    sget-object p2, Ll/bfx;->a:Landroid/widget/PopupWindow;

    .line 94
    .line 95
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    invoke-virtual {v2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    sget v3, Ll/qa00;->i:I

    .line 104
    .line 105
    invoke-virtual {p2, v2, v1, v3, v0}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 106
    .line 107
    .line 108
    :goto_1
    sget-object p2, Ll/bfx;->a:Landroid/widget/PopupWindow;

    .line 109
    .line 110
    invoke-virtual {p2}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 111
    .line 112
    .line 113
    move-result-object p2

    .line 114
    sget v0, Ll/adc0;->X7:I

    .line 115
    .line 116
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 117
    .line 118
    .line 119
    move-result-object p2

    .line 120
    check-cast p2, Lv/VDraweeView;

    .line 121
    .line 122
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 123
    .line 124
    sget v1, Ll/dbc0;->Mp:I

    .line 125
    .line 126
    const/4 v2, 0x2

    .line 127
    const/16 v3, 0x32

    .line 128
    .line 129
    invoke-virtual {v0, p2, v1, v2, v3}, Ll/fsb0;->K(Lcom/facebook/drawee/view/SimpleDraweeView;III)V

    .line 130
    .line 131
    .line 132
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 133
    .line 134
    sget-object v0, Ll/bfx;->a:Landroid/widget/PopupWindow;

    .line 135
    .line 136
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    sget v1, Ll/adc0;->O:I

    .line 141
    .line 142
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    check-cast v0, Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 147
    .line 148
    invoke-virtual {p2, v0, p3}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 149
    .line 150
    .line 151
    sget-object p2, Ll/bfx;->a:Landroid/widget/PopupWindow;

    .line 152
    .line 153
    invoke-virtual {p2}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 154
    .line 155
    .line 156
    move-result-object p2

    .line 157
    sget p3, Ll/adc0;->Sd:I

    .line 158
    .line 159
    invoke-virtual {p2, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 160
    .line 161
    .line 162
    move-result-object p2

    .line 163
    check-cast p2, Lv/VText;

    .line 164
    .line 165
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 166
    .line 167
    .line 168
    new-instance p1, Ll/afx;

    .line 169
    .line 170
    invoke-direct {p1}, Ll/afx;-><init>()V

    .line 171
    .line 172
    .line 173
    const-wide/16 p2, 0xbb8

    .line 174
    .line 175
    invoke-static {p0, p1, p2, p3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 176
    .line 177
    .line 178
    return-void
.end method

.method public static h(Landroid/app/Activity;)Landroidx/appcompat/widget/Toolbar;
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
