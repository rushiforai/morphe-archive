.class public Ll/smp0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/uam;

.field public b:Z

.field public c:Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/smp0;->b:Z

    .line 6
    .line 7
    return-void
.end method

.method public static bridge synthetic a(Ll/smp0;)Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/smp0;->c:Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;

    return-object p0
.end method

.method public static bridge synthetic b(Ll/smp0;)Ll/uam;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/smp0;->a:Ll/uam;

    return-object p0
.end method

.method public static bridge synthetic c(Ll/smp0;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/smp0;->g(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public d()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/smp0;->e()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/smp0;->a:Ll/uam;

    .line 6
    .line 7
    return-void
.end method

.method public e()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/smp0;->a:Ll/uam;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-boolean v0, p0, Ll/smp0;->b:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string v0, "virtual_voice_window_view"

    .line 11
    .line 12
    invoke-static {v0}, Ll/yti;->c(Ljava/lang/String;)Ll/jul;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-interface {v0}, Ll/lul;->cancel()V

    .line 19
    .line 20
    .line 21
    :cond_1
    const/4 v0, 0x0

    .line 22
    iput-boolean v0, p0, Ll/smp0;->b:Z

    .line 23
    .line 24
    :cond_2
    :goto_0
    return-void
.end method

.method public f()Ll/uam;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/smp0;->a:Ll/uam;

    .line 2
    .line 3
    return-object p0
.end method

.method public final g(Landroid/content/Context;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/smp0;->c:Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/smp0;->c:Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;

    .line 11
    .line 12
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Wf:I

    .line 13
    .line 14
    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;->setExitText(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final h(Landroid/content/Context;Landroid/view/View$OnClickListener;Ll/pcj;Ll/x20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/view/View$OnClickListener;",
            "Ll/pcj<",
            "Ljava/lang/Boolean;",
            ">;",
            "Ll/x20;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object p4, p0, Ll/smp0;->a:Ll/uam;

    .line 2
    .line 3
    if-eqz p4, :cond_1

    .line 4
    .line 5
    check-cast p4, Landroid/view/View;

    .line 6
    .line 7
    invoke-virtual {p4}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    if-eqz p2, :cond_0

    .line 16
    .line 17
    check-cast p1, Landroid/view/ViewGroup;

    .line 18
    .line 19
    iget-object p0, p0, Ll/smp0;->a:Ll/uam;

    .line 20
    .line 21
    check-cast p0, Landroid/view/View;

    .line 22
    .line 23
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void

    .line 27
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->q()Z

    .line 28
    .line 29
    .line 30
    move-result p4

    .line 31
    const/4 v0, 0x0

    .line 32
    if-eqz p4, :cond_2

    .line 33
    .line 34
    sget p4, Ll/yec0;->r7:I

    .line 35
    .line 36
    invoke-static {p1, p4, v0}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VirtualVoiceWindowView;

    .line 41
    .line 42
    iput-object p1, p0, Ll/smp0;->a:Ll/uam;

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_2
    sget p4, Ll/yec0;->sb:I

    .line 46
    .line 47
    invoke-static {p1, p4, v0}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/VoiceWindowView;

    .line 52
    .line 53
    iput-object p1, p0, Ll/smp0;->a:Ll/uam;

    .line 54
    .line 55
    :goto_0
    iget-object p1, p0, Ll/smp0;->a:Ll/uam;

    .line 56
    .line 57
    invoke-interface {p1}, Ll/uam;->init()V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Ll/smp0;->a:Ll/uam;

    .line 61
    .line 62
    invoke-interface {p1, p2}, Ll/uam;->b(Landroid/view/View$OnClickListener;)V

    .line 63
    .line 64
    .line 65
    iget-object p0, p0, Ll/smp0;->a:Ll/uam;

    .line 66
    .line 67
    invoke-interface {p0, p3}, Ll/uam;->setShowExitAreaFunc(Ll/pcj;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public i()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/smp0;->a:Ll/uam;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public j(Landroid/view/View$OnClickListener;Ll/pcj;Ll/x20;)Z
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View$OnClickListener;",
            "Ll/pcj<",
            "Ljava/lang/Boolean;",
            ">;",
            "Ll/x20;",
            ")Z"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/smp0;->b:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    const/4 v0, 0x0

    .line 8
    :try_start_0
    sget-object v2, Ll/zrv;->e:Landroid/app/Application;

    .line 9
    .line 10
    invoke-virtual {p0, v2, p1, p2, p3}, Ll/smp0;->h(Landroid/content/Context;Landroid/view/View$OnClickListener;Ll/pcj;Ll/x20;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ll/sdj;->b()Ll/sdj$a;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-virtual {v3, v2}, Ll/sdj$a;->s(Landroid/content/Context;)Ll/sdj$a;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    iget-object v3, p0, Ll/smp0;->a:Ll/uam;

    .line 22
    .line 23
    check-cast v3, Landroid/view/View;

    .line 24
    .line 25
    invoke-virtual {v2, v3}, Ll/vdj$a;->i(Landroid/view/View;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Ll/sdj$a;

    .line 30
    .line 31
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    .line 32
    .line 33
    const/high16 v4, 0x42960000    # 75.0f

    .line 34
    .line 35
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    const/high16 v5, 0x42980000    # 76.0f

    .line 40
    .line 41
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 42
    .line 43
    .line 44
    move-result v5

    .line 45
    invoke-direct {v3, v4, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v2, v3}, Ll/vdj$a;->j(Landroid/widget/FrameLayout$LayoutParams;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    check-cast v2, Ll/sdj$a;

    .line 53
    .line 54
    sget-object v3, Lcom/p1/mobile/putong/floatview/assist/FxGravity;->RIGHT_OR_TOP:Lcom/p1/mobile/putong/floatview/assist/FxGravity;

    .line 55
    .line 56
    invoke-virtual {v2, v3}, Ll/vdj$a;->h(Lcom/p1/mobile/putong/floatview/assist/FxGravity;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    check-cast v2, Ll/sdj$a;

    .line 61
    .line 62
    const/high16 v3, 0x42300000    # 44.0f

    .line 63
    .line 64
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 65
    .line 66
    .line 67
    move-result v3

    .line 68
    int-to-float v3, v3

    .line 69
    const/high16 v4, 0x42600000    # 56.0f

    .line 70
    .line 71
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 72
    .line 73
    .line 74
    move-result v4

    .line 75
    int-to-float v4, v4

    .line 76
    const/4 v5, 0x0

    .line 77
    invoke-virtual {v2, v3, v5, v4, v5}, Ll/vdj$a;->e(FFFF)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    check-cast v2, Ll/sdj$a;

    .line 82
    .line 83
    invoke-virtual {v2, p1}, Ll/vdj$a;->l(Landroid/view/View$OnClickListener;)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    check-cast p1, Ll/sdj$a;

    .line 88
    .line 89
    new-instance v2, Ll/smp0$b;

    .line 90
    .line 91
    invoke-direct {v2, p0}, Ll/smp0$b;-><init>(Ll/smp0;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p1, v2}, Ll/vdj$a;->p(Ll/nul;)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    check-cast p1, Ll/sdj$a;

    .line 99
    .line 100
    new-instance v2, Ll/smp0$a;

    .line 101
    .line 102
    invoke-direct {v2, p0, p3, p2}, Ll/smp0$a;-><init>(Ll/smp0;Ll/x20;Ll/pcj;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p1, v2}, Ll/vdj$a;->o(Ll/mul;)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    check-cast p1, Ll/sdj$a;

    .line 110
    .line 111
    invoke-virtual {p1, v1}, Ll/vdj$a;->g(Z)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    check-cast p1, Ll/sdj$a;

    .line 116
    .line 117
    const-string p2, "virtual_voice_window_view"

    .line 118
    .line 119
    invoke-virtual {p1, p2}, Ll/sdj$a;->t(Ljava/lang/String;)Ll/sdj$a;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    invoke-virtual {p1}, Ll/vdj$a;->d()Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    check-cast p1, Ll/sdj$a;

    .line 128
    .line 129
    invoke-virtual {p1}, Ll/sdj$a;->q()Ll/sdj;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    invoke-static {p1}, Ll/yti;->f(Ll/sdj;)Ll/jul;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 134
    .line 135
    .line 136
    :try_start_1
    iput-boolean v1, p0, Ll/smp0;->b:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 137
    .line 138
    return v1

    .line 139
    :catch_0
    move-exception p0

    .line 140
    goto :goto_0

    .line 141
    :catch_1
    move-exception p0

    .line 142
    move v1, v0

    .line 143
    :goto_0
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 144
    .line 145
    .line 146
    return v1
.end method
