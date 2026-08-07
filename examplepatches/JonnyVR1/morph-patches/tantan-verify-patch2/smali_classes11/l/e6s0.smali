.class public final Ll/e6s0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vx5;


# annotations
.annotation build Landroidx/annotation/UiThread;
.end annotation


# instance fields
.field public final a:Landroid/app/Application;

.field public final b:Ll/bxs0;

.field public final c:Ll/tqr0;

.field public final d:Ll/eos0;

.field public final e:Ll/bou0;

.field public f:Landroid/app/Dialog;

.field public g:Lcom/google/android/gms/internal/consent_sdk/zzbr;

.field public final h:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public final i:Ljava/util/concurrent/atomic/AtomicReference;

.field public final j:Ljava/util/concurrent/atomic/AtomicReference;

.field public final k:Ljava/util/concurrent/atomic/AtomicReference;

.field public l:Z


# direct methods
.method public constructor <init>(Landroid/app/Application;Ll/hcr0;Ll/bxs0;Ll/tqr0;Ll/eos0;Ll/bou0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance p2, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 5
    .line 6
    invoke-direct {p2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p2, p0, Ll/e6s0;->h:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 10
    .line 11
    new-instance p2, Ljava/util/concurrent/atomic/AtomicReference;

    .line 12
    .line 13
    invoke-direct {p2}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p2, p0, Ll/e6s0;->i:Ljava/util/concurrent/atomic/AtomicReference;

    .line 17
    .line 18
    new-instance p2, Ljava/util/concurrent/atomic/AtomicReference;

    .line 19
    .line 20
    invoke-direct {p2}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object p2, p0, Ll/e6s0;->j:Ljava/util/concurrent/atomic/AtomicReference;

    .line 24
    .line 25
    new-instance p2, Ljava/util/concurrent/atomic/AtomicReference;

    .line 26
    .line 27
    invoke-direct {p2}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object p2, p0, Ll/e6s0;->k:Ljava/util/concurrent/atomic/AtomicReference;

    .line 31
    .line 32
    const/4 p2, 0x0

    .line 33
    iput-boolean p2, p0, Ll/e6s0;->l:Z

    .line 34
    .line 35
    iput-object p1, p0, Ll/e6s0;->a:Landroid/app/Application;

    .line 36
    .line 37
    iput-object p3, p0, Ll/e6s0;->b:Ll/bxs0;

    .line 38
    .line 39
    iput-object p4, p0, Ll/e6s0;->c:Ll/tqr0;

    .line 40
    .line 41
    iput-object p5, p0, Ll/e6s0;->d:Ll/eos0;

    .line 42
    .line 43
    iput-object p6, p0, Ll/e6s0;->e:Ll/bou0;

    .line 44
    .line 45
    return-void
.end method

.method public static bridge synthetic b(Ll/e6s0;)Landroid/app/Application;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e6s0;->a:Landroid/app/Application;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic c(Ll/e6s0;)Landroid/app/Dialog;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e6s0;->f:Landroid/app/Dialog;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic e(Ll/e6s0;)Ll/bxs0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e6s0;->b:Ll/bxs0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic f(Ll/e6s0;)Ljava/util/concurrent/atomic/AtomicReference;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e6s0;->k:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public final a(Landroid/app/Activity;Ll/vx5$a;)V
    .locals 4

    .line 1
    invoke-static {}, Ll/pot0;->a()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/e6s0;->h:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    const/4 v2, 0x1

    .line 8
    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v3, 0x3

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    new-instance p1, Lcom/google/android/gms/internal/consent_sdk/zzg;

    .line 16
    .line 17
    iget-boolean p0, p0, Ll/e6s0;->l:Z

    .line 18
    .line 19
    if-eq v2, p0, :cond_0

    .line 20
    .line 21
    const-string p0, "ConsentForm#show can only be invoked once."

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const-string p0, "Privacy options form is being loading. Please try again later."

    .line 25
    .line 26
    :goto_0
    invoke-direct {p1, v3, p0}, Lcom/google/android/gms/internal/consent_sdk/zzg;-><init>(ILjava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/google/android/gms/internal/consent_sdk/zzg;->zza()Ll/m1j;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-interface {p2, p0}, Ll/vx5$a;->a(Ll/m1j;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    iget-object v0, p0, Ll/e6s0;->g:Lcom/google/android/gms/internal/consent_sdk/zzbr;

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/google/android/gms/internal/consent_sdk/zzbr;->c()V

    .line 40
    .line 41
    .line 42
    new-instance v0, Ll/f2s0;

    .line 43
    .line 44
    invoke-direct {v0, p0, p1}, Ll/f2s0;-><init>(Ll/e6s0;Landroid/app/Activity;)V

    .line 45
    .line 46
    .line 47
    iget-object v2, p0, Ll/e6s0;->a:Landroid/app/Application;

    .line 48
    .line 49
    invoke-virtual {v2, v0}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 50
    .line 51
    .line 52
    iget-object v2, p0, Ll/e6s0;->k:Ljava/util/concurrent/atomic/AtomicReference;

    .line 53
    .line 54
    invoke-virtual {v2, v0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/e6s0;->b:Ll/bxs0;

    .line 58
    .line 59
    invoke-virtual {v0, p1}, Ll/bxs0;->a(Landroid/app/Activity;)V

    .line 60
    .line 61
    .line 62
    new-instance v0, Landroid/app/Dialog;

    .line 63
    .line 64
    const v2, 0x1030010

    .line 65
    .line 66
    .line 67
    invoke-direct {v0, p1, v2}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Ll/e6s0;->g:Lcom/google/android/gms/internal/consent_sdk/zzbr;

    .line 71
    .line 72
    invoke-virtual {v0, p1}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    if-nez p1, :cond_2

    .line 83
    .line 84
    new-instance p0, Lcom/google/android/gms/internal/consent_sdk/zzg;

    .line 85
    .line 86
    const-string p1, "Activity with null windows is passed in."

    .line 87
    .line 88
    invoke-direct {p0, v3, p1}, Lcom/google/android/gms/internal/consent_sdk/zzg;-><init>(ILjava/lang/String;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0}, Lcom/google/android/gms/internal/consent_sdk/zzg;->zza()Ll/m1j;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-interface {p2, p0}, Ll/vx5$a;->a(Ll/m1j;)V

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :cond_2
    const/4 v2, -0x1

    .line 100
    invoke-virtual {p1, v2, v2}, Landroid/view/Window;->setLayout(II)V

    .line 101
    .line 102
    .line 103
    new-instance v2, Landroid/graphics/drawable/ColorDrawable;

    .line 104
    .line 105
    invoke-direct {v2, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p1, v2}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 109
    .line 110
    .line 111
    const/high16 v2, 0x1000000

    .line 112
    .line 113
    invoke-virtual {p1, v2, v2}, Landroid/view/Window;->setFlags(II)V

    .line 114
    .line 115
    .line 116
    invoke-static {p1, v1}, Ll/nfq0;->b(Landroid/view/Window;Z)V

    .line 117
    .line 118
    .line 119
    iget-object p1, p0, Ll/e6s0;->j:Ljava/util/concurrent/atomic/AtomicReference;

    .line 120
    .line 121
    invoke-virtual {p1, p2}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 125
    .line 126
    .line 127
    iput-object v0, p0, Ll/e6s0;->f:Landroid/app/Dialog;

    .line 128
    .line 129
    iget-object p0, p0, Ll/e6s0;->g:Lcom/google/android/gms/internal/consent_sdk/zzbr;

    .line 130
    .line 131
    const-string p1, "UMP_messagePresented"

    .line 132
    .line 133
    const-string p2, ""

    .line 134
    .line 135
    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/internal/consent_sdk/zzbr;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    return-void
.end method

.method public final d()Lcom/google/android/gms/internal/consent_sdk/zzbr;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e6s0;->g:Lcom/google/android/gms/internal/consent_sdk/zzbr;

    .line 2
    .line 3
    return-object p0
.end method

.method public final g(Ll/sfk0$b;Ll/sfk0$a;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/e6s0;->e:Ll/bou0;

    .line 2
    .line 3
    check-cast v0, Ll/tvs0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/tvs0;->a()Lcom/google/android/gms/internal/consent_sdk/zzbr;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Ll/e6s0;->g:Lcom/google/android/gms/internal/consent_sdk/zzbr;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const/4 v2, 0x1

    .line 20
    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 21
    .line 22
    .line 23
    new-instance v1, Ll/urs0;

    .line 24
    .line 25
    const/4 v2, 0x0

    .line 26
    invoke-direct {v1, v0, v2}, Ll/urs0;-><init>(Lcom/google/android/gms/internal/consent_sdk/zzbr;Ll/dts0;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 30
    .line 31
    .line 32
    new-instance v0, Ll/m3s0;

    .line 33
    .line 34
    invoke-direct {v0, p1, p2, v2}, Ll/m3s0;-><init>(Ll/sfk0$b;Ll/sfk0$a;Ll/u4s0;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Ll/e6s0;->i:Ljava/util/concurrent/atomic/AtomicReference;

    .line 38
    .line 39
    invoke-virtual {p1, v0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    iget-object v1, p0, Ll/e6s0;->g:Lcom/google/android/gms/internal/consent_sdk/zzbr;

    .line 43
    .line 44
    iget-object p1, p0, Ll/e6s0;->d:Ll/eos0;

    .line 45
    .line 46
    invoke-virtual {p1}, Ll/eos0;->a()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-virtual {p1}, Ll/eos0;->b()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    const-string v5, "UTF-8"

    .line 55
    .line 56
    const/4 v6, 0x0

    .line 57
    const-string v4, "text/html"

    .line 58
    .line 59
    invoke-virtual/range {v1 .. v6}, Landroid/webkit/WebView;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    sget-object p1, Ll/pot0;->a:Landroid/os/Handler;

    .line 63
    .line 64
    new-instance p2, Ll/w0s0;

    .line 65
    .line 66
    invoke-direct {p2, p0}, Ll/w0s0;-><init>(Ll/e6s0;)V

    .line 67
    .line 68
    .line 69
    const-wide/16 v0, 0x2710

    .line 70
    .line 71
    invoke-virtual {p1, p2, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public final h(I)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/e6s0;->l()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/e6s0;->j:Ljava/util/concurrent/atomic/AtomicReference;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p1, v0}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Ll/vx5$a;

    .line 12
    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object p0, p0, Ll/e6s0;->c:Ll/tqr0;

    .line 17
    .line 18
    const/4 v1, 0x3

    .line 19
    invoke-virtual {p0, v1}, Ll/tqr0;->e(I)V

    .line 20
    .line 21
    .line 22
    invoke-interface {p1, v0}, Ll/vx5$a;->a(Ll/m1j;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final i(Lcom/google/android/gms/internal/consent_sdk/zzg;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/e6s0;->l()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/e6s0;->j:Ljava/util/concurrent/atomic/AtomicReference;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p0, v0}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ll/vx5$a;

    .line 12
    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/internal/consent_sdk/zzg;->zza()Ll/m1j;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-interface {p0, p1}, Ll/vx5$a;->a(Ll/m1j;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final j()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/e6s0;->i:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Ll/m3s0;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {v0, p0}, Ll/m3s0;->a(Ll/vx5;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final k(Lcom/google/android/gms/internal/consent_sdk/zzg;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/e6s0;->i:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Ll/m3s0;

    .line 9
    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/internal/consent_sdk/zzg;->zza()Ll/m1j;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1}, Ll/m3s0;->b(Ll/m1j;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final l()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/e6s0;->f:Landroid/app/Dialog;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 7
    .line 8
    .line 9
    iput-object v1, p0, Ll/e6s0;->f:Landroid/app/Dialog;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Ll/e6s0;->b:Ll/bxs0;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/bxs0;->a(Landroid/app/Activity;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/e6s0;->k:Ljava/util/concurrent/atomic/AtomicReference;

    .line 17
    .line 18
    invoke-virtual {p0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Ll/f2s0;

    .line 23
    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    invoke-static {p0}, Ll/f2s0;->a(Ll/f2s0;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    return-void
.end method
