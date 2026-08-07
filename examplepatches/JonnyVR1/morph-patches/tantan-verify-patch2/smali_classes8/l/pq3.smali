.class public Ll/pq3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# instance fields
.field public final a:Ljava/lang/String;

.field public b:Ll/kcg0;

.field public c:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "buzz_voice_view"

    .line 5
    .line 6
    iput-object v0, p0, Ll/pq3;->a:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Ll/pq3;->c:Z

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(Ll/pq3;Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzCallState;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pq3;->f(Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzCallState;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;Landroid/app/Activity;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    instance-of p2, p2, Landroid/view/ViewGroup;

    .line 13
    .line 14
    if-eqz p2, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    check-cast p2, Landroid/view/ViewGroup;

    .line 21
    .line 22
    invoke-virtual {p2, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 23
    .line 24
    .line 25
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->INSTANCE:Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->O()Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_2

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_2
    sget-object p0, Ll/k8w;->INSTANCE:Ll/k8w;

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Ll/k8w;->a(Landroid/content/Context;)Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    if-nez p0, :cond_3

    .line 41
    .line 42
    :goto_0
    return-void

    .line 43
    :cond_3
    sget-object p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/VoiceBuzzAct;->Companion:Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/VoiceBuzzAct$a;

    .line 44
    .line 45
    move-object p2, p1

    .line 46
    check-cast p2, Lcom/p1/mobile/android/app/Act;

    .line 47
    .line 48
    const-string v0, "voice_call"

    .line 49
    .line 50
    invoke-virtual {p0, p2, v0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/VoiceBuzzAct$a;->a(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Landroid/content/Intent;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p1, p0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public static synthetic c(Ll/pq3;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pq3;->d()V

    return-void
.end method


# virtual methods
.method public final d()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Landroid/app/Activity;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    :goto_0
    sget-object v0, Ll/k8w;->INSTANCE:Ll/k8w;

    .line 26
    .line 27
    invoke-virtual {v0, p0}, Ll/k8w;->a(Landroid/content/Context;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_1
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    check-cast p0, Landroid/view/ViewGroup;

    .line 43
    .line 44
    const-string v0, "buzz_voice_view"

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    instance-of v1, v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;

    .line 51
    .line 52
    if-eqz v1, :cond_2

    .line 53
    .line 54
    sget v1, Lcom/p1/mobile/putong/core/buzz/R$string;->z0:I

    .line 55
    .line 56
    invoke-static {v1}, Ll/o1j0;->w(I)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 60
    .line 61
    .line 62
    :cond_2
    :goto_1
    return-void
.end method

.method public e()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pq3;->b:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/pq3;->g()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic f(Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzCallState;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->INSTANCE:Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->O()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/pq3;->d()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final g()V
    .locals 1

    .line 1
    invoke-static {}, Ll/l51;->D()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/pq3;->d()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    new-instance v0, Ll/oq3;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/oq3;-><init>(Ll/pq3;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public h()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/pq3;->c:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/pq3;->j()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public i()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/pq3;->c:Z

    .line 3
    .line 4
    iget-object p0, p0, Ll/pq3;->b:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public j()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pq3;->b:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->INSTANCE:Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->y()Lrx/subjects/a;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/nq3;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/nq3;-><init>(Ll/pq3;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iput-object v0, p0, Ll/pq3;->b:Ll/kcg0;

    .line 34
    .line 35
    return-void
.end method

.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0
    .param p1    # Landroid/app/Activity;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .locals 0
    .param p1    # Landroid/app/Activity;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .locals 0
    .param p1    # Landroid/app/Activity;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .locals 5
    .param p1    # Landroid/app/Activity;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-boolean v0, p0, Ll/pq3;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_6

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->INSTANCE:Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->U()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    goto/16 :goto_1

    .line 14
    .line 15
    :cond_0
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Landroid/view/ViewGroup;

    .line 24
    .line 25
    const-string v2, "buzz_voice_view"

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    instance-of v4, p1, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/VoiceBuzzAct;

    .line 32
    .line 33
    if-nez v4, :cond_5

    .line 34
    .line 35
    instance-of v4, p1, Lcom/p1/mobile/putong/core/ui/lovebuzz/video/VideoBuzzAct;

    .line 36
    .line 37
    if-nez v4, :cond_5

    .line 38
    .line 39
    instance-of v4, p1, Lcom/p1/mobile/putong/core/ui/lovebuzz/memoji/MemojiBuzzAct;

    .line 40
    .line 41
    if-nez v4, :cond_5

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->O()Z

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    if-nez v4, :cond_5

    .line 48
    .line 49
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->U()Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_2

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_2
    new-instance v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;

    .line 64
    .line 65
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    invoke-direct {v0, v3}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;-><init>(Landroid/content/Context;)V

    .line 70
    .line 71
    .line 72
    new-instance v3, Ll/mq3;

    .line 73
    .line 74
    invoke-direct {v3, v0, p1}, Ll/mq3;-><init>(Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;Landroid/app/Activity;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0, v2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 81
    .line 82
    .line 83
    instance-of v2, p1, Lcom/p1/mobile/android/app/Act;

    .line 84
    .line 85
    if-eqz v2, :cond_3

    .line 86
    .line 87
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 88
    .line 89
    new-instance v2, Ll/pq3$a;

    .line 90
    .line 91
    invoke-direct {v2, p0, v0}, Ll/pq3$a;-><init>(Ll/pq3;Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p1, v2}, Lcom/p1/mobile/android/app/Act;->addSwipeBackListener(Ll/ujh0;)V

    .line 95
    .line 96
    .line 97
    :cond_3
    new-instance p0, Landroid/view/ViewGroup$LayoutParams;

    .line 98
    .line 99
    const/4 p1, -0x2

    .line 100
    invoke-direct {p0, p1, p1}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 101
    .line 102
    .line 103
    instance-of p1, v1, Landroid/widget/FrameLayout;

    .line 104
    .line 105
    if-eqz p1, :cond_4

    .line 106
    .line 107
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 108
    .line 109
    invoke-direct {p1, p0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    .line 110
    .line 111
    .line 112
    const p0, 0x800005

    .line 113
    .line 114
    .line 115
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 116
    .line 117
    sget p0, Ll/qa00;->G:I

    .line 118
    .line 119
    invoke-static {}, Ll/bnl0;->F0()I

    .line 120
    .line 121
    .line 122
    move-result v2

    .line 123
    add-int/2addr p0, v2

    .line 124
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 125
    .line 126
    move-object p0, p1

    .line 127
    :cond_4
    invoke-virtual {v1, v0, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 128
    .line 129
    .line 130
    return-void

    .line 131
    :cond_5
    :goto_0
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    move-result p0

    .line 135
    if-eqz p0, :cond_6

    .line 136
    .line 137
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 138
    .line 139
    .line 140
    :cond_6
    :goto_1
    return-void
.end method

.method public onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0
    .param p1    # Landroid/app/Activity;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .locals 0
    .param p1    # Landroid/app/Activity;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    return-void
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .locals 0
    .param p1    # Landroid/app/Activity;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    return-void
.end method
