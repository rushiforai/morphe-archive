.class public Ll/dem0;
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
    iput-boolean v0, p0, Ll/dem0;->b:Z

    .line 6
    .line 7
    return-void
.end method

.method public static bridge synthetic a(Ll/dem0;)Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dem0;->c:Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;

    return-object p0
.end method

.method public static bridge synthetic b(Ll/dem0;)Ll/uam;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dem0;->a:Ll/uam;

    return-object p0
.end method

.method public static bridge synthetic c(Ll/dem0;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dem0;->g(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public d()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/dem0;->e()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/dem0;->a:Ll/uam;

    .line 6
    .line 7
    return-void
.end method

.method public e()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dem0;->a:Ll/uam;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-boolean v0, p0, Ll/dem0;->b:Z

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
    iput-boolean v0, p0, Ll/dem0;->b:Z

    .line 23
    .line 24
    :cond_2
    :goto_0
    return-void
.end method

.method public f()Ll/uam;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dem0;->a:Ll/uam;

    .line 2
    .line 3
    return-object p0
.end method

.method public final g(Landroid/content/Context;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dem0;->c:Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;

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
    iput-object v0, p0, Ll/dem0;->c:Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;

    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public h()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dem0;->a:Ll/uam;

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

.method public i(Landroid/view/View$OnClickListener;Ll/pcj;Ll/x20;)Z
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
    iget-boolean v0, p0, Ll/dem0;->b:Z

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
    iget-object v3, p0, Ll/dem0;->a:Ll/uam;

    .line 11
    .line 12
    if-nez v3, :cond_1

    .line 13
    .line 14
    sget v3, Ll/yec0;->X6:I

    .line 15
    .line 16
    const/4 v4, 0x0

    .line 17
    invoke-static {v2, v3, v4}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/virtual/VVirtualVoiceWindowView;

    .line 22
    .line 23
    iput-object v3, p0, Ll/dem0;->a:Ll/uam;

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catch_0
    move-exception p0

    .line 27
    move v1, v0

    .line 28
    goto/16 :goto_1

    .line 29
    .line 30
    :cond_1
    check-cast v3, Landroid/view/View;

    .line 31
    .line 32
    invoke-virtual {v3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    if-eqz v4, :cond_2

    .line 41
    .line 42
    check-cast v3, Landroid/view/ViewGroup;

    .line 43
    .line 44
    iget-object v4, p0, Ll/dem0;->a:Ll/uam;

    .line 45
    .line 46
    check-cast v4, Landroid/view/View;

    .line 47
    .line 48
    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 49
    .line 50
    .line 51
    :cond_2
    :goto_0
    invoke-static {}, Ll/sdj;->b()Ll/sdj$a;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    invoke-virtual {v3, v2}, Ll/sdj$a;->s(Landroid/content/Context;)Ll/sdj$a;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    iget-object v3, p0, Ll/dem0;->a:Ll/uam;

    .line 60
    .line 61
    check-cast v3, Landroid/view/View;

    .line 62
    .line 63
    invoke-virtual {v2, v3}, Ll/vdj$a;->i(Landroid/view/View;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    check-cast v2, Ll/sdj$a;

    .line 68
    .line 69
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    .line 70
    .line 71
    const/high16 v4, 0x42960000    # 75.0f

    .line 72
    .line 73
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 74
    .line 75
    .line 76
    move-result v4

    .line 77
    const/high16 v5, 0x42980000    # 76.0f

    .line 78
    .line 79
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 80
    .line 81
    .line 82
    move-result v5

    .line 83
    invoke-direct {v3, v4, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v2, v3}, Ll/vdj$a;->j(Landroid/widget/FrameLayout$LayoutParams;)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    check-cast v2, Ll/sdj$a;

    .line 91
    .line 92
    sget-object v3, Lcom/p1/mobile/putong/floatview/assist/FxGravity;->RIGHT_OR_TOP:Lcom/p1/mobile/putong/floatview/assist/FxGravity;

    .line 93
    .line 94
    invoke-virtual {v2, v3}, Ll/vdj$a;->h(Lcom/p1/mobile/putong/floatview/assist/FxGravity;)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    check-cast v2, Ll/sdj$a;

    .line 99
    .line 100
    const/high16 v3, 0x42300000    # 44.0f

    .line 101
    .line 102
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 103
    .line 104
    .line 105
    move-result v3

    .line 106
    int-to-float v3, v3

    .line 107
    const/high16 v4, 0x42600000    # 56.0f

    .line 108
    .line 109
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 110
    .line 111
    .line 112
    move-result v4

    .line 113
    int-to-float v4, v4

    .line 114
    const/4 v5, 0x0

    .line 115
    invoke-virtual {v2, v3, v5, v4, v5}, Ll/vdj$a;->e(FFFF)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    check-cast v2, Ll/sdj$a;

    .line 120
    .line 121
    invoke-virtual {v2, p1}, Ll/vdj$a;->l(Landroid/view/View$OnClickListener;)Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    check-cast p1, Ll/sdj$a;

    .line 126
    .line 127
    new-instance v2, Ll/dem0$b;

    .line 128
    .line 129
    invoke-direct {v2, p0}, Ll/dem0$b;-><init>(Ll/dem0;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {p1, v2}, Ll/vdj$a;->p(Ll/nul;)Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    check-cast p1, Ll/sdj$a;

    .line 137
    .line 138
    new-instance v2, Ll/dem0$a;

    .line 139
    .line 140
    invoke-direct {v2, p0, p3, p2}, Ll/dem0$a;-><init>(Ll/dem0;Ll/x20;Ll/pcj;)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {p1, v2}, Ll/vdj$a;->o(Ll/mul;)Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    check-cast p1, Ll/sdj$a;

    .line 148
    .line 149
    invoke-virtual {p1, v1}, Ll/vdj$a;->g(Z)Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    check-cast p1, Ll/sdj$a;

    .line 154
    .line 155
    const-string p2, "virtual_voice_window_view"

    .line 156
    .line 157
    invoke-virtual {p1, p2}, Ll/sdj$a;->t(Ljava/lang/String;)Ll/sdj$a;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    invoke-virtual {p1}, Ll/vdj$a;->d()Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    check-cast p1, Ll/sdj$a;

    .line 166
    .line 167
    invoke-virtual {p1}, Ll/sdj$a;->q()Ll/sdj;

    .line 168
    .line 169
    .line 170
    move-result-object p1

    .line 171
    invoke-static {p1}, Ll/yti;->f(Ll/sdj;)Ll/jul;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 172
    .line 173
    .line 174
    :try_start_1
    iput-boolean v1, p0, Ll/dem0;->b:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 175
    .line 176
    return v1

    .line 177
    :catch_1
    move-exception p0

    .line 178
    :goto_1
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 179
    .line 180
    .line 181
    return v1
.end method
