.class public Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$b;
.super Landroid/widget/PopupWindow;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field public final a:Landroid/animation/Animator;

.field public final b:Landroid/animation/Animator;

.field public final c:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;)V
    .locals 3
    .param p1    # Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Landroid/widget/PopupWindow;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$b;->c:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 5
    .line 6
    new-instance v0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$PushBubbleFrame;

    .line 7
    .line 8
    invoke-static {p1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->e(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;)Landroid/app/Activity;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-direct {v0, v1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$PushBubbleFrame;-><init>(Landroid/content/Context;)V

    .line 13
    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-virtual {v0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 17
    .line 18
    .line 19
    invoke-static {p1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->n(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;)I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-lez v1, :cond_0

    .line 24
    .line 25
    invoke-static {p1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->n(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;)I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    invoke-static {p1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->n(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;)I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-nez v1, :cond_1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    sget v1, Ll/qa00;->h:I

    .line 41
    .line 42
    sget v2, Ll/qa00;->j:I

    .line 43
    .line 44
    invoke-virtual {v0, v1, v2, v1, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 45
    .line 46
    .line 47
    sget v1, Ll/abc0;->y:I

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 50
    .line 51
    .line 52
    :goto_0
    invoke-static {}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;->H()I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    invoke-virtual {v0, v1}, Landroid/view/View;->setMinimumWidth(I)V

    .line 57
    .line 58
    .line 59
    invoke-static {}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;->F()I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    invoke-virtual {v0, v1}, Landroid/view/View;->setMinimumHeight(I)V

    .line 64
    .line 65
    .line 66
    invoke-static {p1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->p(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;)Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$PushBubbleFrame;->s(Z)V

    .line 71
    .line 72
    .line 73
    new-instance v1, Lcom/p1/mobile/android/ui/pushbubble/a;

    .line 74
    .line 75
    invoke-direct {v1, p0, p1, v0}, Lcom/p1/mobile/android/ui/pushbubble/a;-><init>(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$b;Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$PushBubbleFrame;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$PushBubbleFrame;->p(Ll/x20;)V

    .line 79
    .line 80
    .line 81
    invoke-static {p1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->h(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;)Landroid/view/View;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    instance-of v2, v1, Landroid/view/ViewGroup;

    .line 90
    .line 91
    if-eqz v2, :cond_2

    .line 92
    .line 93
    check-cast v1, Landroid/view/ViewGroup;

    .line 94
    .line 95
    invoke-static {p1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->h(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;)Landroid/view/View;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 100
    .line 101
    .line 102
    :cond_2
    invoke-static {p1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->h(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;)Landroid/view/View;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    invoke-static {p1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->k(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;)Landroid/view/ViewGroup$LayoutParams;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 111
    .line 112
    .line 113
    invoke-static {p1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->o(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;)Ll/qcj;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    const/4 v2, 0x0

    .line 118
    if-nez v1, :cond_3

    .line 119
    .line 120
    move-object v1, v2

    .line 121
    goto :goto_1

    .line 122
    :cond_3
    invoke-static {p1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->o(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;)Ll/qcj;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    invoke-interface {v1, v0}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    check-cast v1, Landroid/animation/Animator;

    .line 131
    .line 132
    :goto_1
    iput-object v1, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$b;->a:Landroid/animation/Animator;

    .line 133
    .line 134
    invoke-static {p1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->j(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;)Ll/qcj;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    if-nez v1, :cond_4

    .line 139
    .line 140
    goto :goto_2

    .line 141
    :cond_4
    invoke-static {p1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->j(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;)Ll/qcj;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    invoke-interface {v1, v0}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    move-object v2, v1

    .line 150
    check-cast v2, Landroid/animation/Animator;

    .line 151
    .line 152
    :goto_2
    iput-object v2, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$b;->b:Landroid/animation/Animator;

    .line 153
    .line 154
    invoke-static {p1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->k(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;)Landroid/view/ViewGroup$LayoutParams;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    iget p1, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 159
    .line 160
    const/4 v1, -0x2

    .line 161
    const/4 v2, -0x1

    .line 162
    if-ne p1, v2, :cond_5

    .line 163
    .line 164
    invoke-virtual {p0, v2}, Landroid/widget/PopupWindow;->setWidth(I)V

    .line 165
    .line 166
    .line 167
    goto :goto_3

    .line 168
    :cond_5
    invoke-virtual {p0, v1}, Landroid/widget/PopupWindow;->setWidth(I)V

    .line 169
    .line 170
    .line 171
    :goto_3
    invoke-virtual {p0, v1}, Landroid/widget/PopupWindow;->setHeight(I)V

    .line 172
    .line 173
    .line 174
    invoke-virtual {p0, v0}, Landroid/widget/PopupWindow;->setContentView(Landroid/view/View;)V

    .line 175
    .line 176
    .line 177
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$b;Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$PushBubbleFrame;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$b;->f(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$PushBubbleFrame;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$b;->e()V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$b;)V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public d(Landroid/animation/Animator;)V
    .locals 1
    .param p1    # Landroid/animation/Animator;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-super {p0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    invoke-virtual {p1}, Landroid/animation/Animator;->isRunning()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    return-void

    .line 14
    :cond_1
    new-instance v0, Ll/spf0;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Ll/spf0;-><init>(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$b;)V

    .line 17
    .line 18
    .line 19
    invoke-static {p1, v0}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public dismiss()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$b;->b:Landroid/animation/Animator;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$b;->d(Landroid/animation/Animator;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic e()V
    .locals 0

    .line 1
    :try_start_0
    invoke-static {p0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$b;->c(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$b;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    :catch_0
    return-void
.end method

.method public final synthetic f(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$PushBubbleFrame;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->q(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;)Ll/qcj;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p2, 0x0

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    invoke-static {p1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->q(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;)Ll/qcj;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0, p2}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    check-cast p2, Landroid/animation/Animator;

    .line 18
    .line 19
    :goto_0
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$b;->d(Landroid/animation/Animator;)V

    .line 20
    .line 21
    .line 22
    invoke-static {p1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->r(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;)Ll/x20;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    if-eqz p0, :cond_1

    .line 31
    .line 32
    invoke-static {p1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->r(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;)Ll/x20;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-interface {p0}, Ll/x20;->call()V

    .line 37
    .line 38
    .line 39
    :cond_1
    return-void
.end method

.method public g()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$b;->a:Landroid/animation/Animator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/Animator;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$b;->c:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->e(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;)Landroid/app/Activity;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    if-eqz v0, :cond_3

    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    if-eqz v1, :cond_3

    .line 29
    .line 30
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v1}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    if-nez v1, :cond_1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$b;->a:Landroid/animation/Animator;

    .line 42
    .line 43
    if-eqz v1, :cond_2

    .line 44
    .line 45
    invoke-virtual {v1}, Landroid/animation/Animator;->start()V

    .line 46
    .line 47
    .line 48
    :cond_2
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    const/16 v1, 0x31

    .line 53
    .line 54
    const/4 v2, 0x0

    .line 55
    invoke-virtual {p0, v0, v1, v2, v2}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 56
    .line 57
    .line 58
    :cond_3
    :goto_0
    return-void
.end method
