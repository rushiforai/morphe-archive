.class public final Lcom/google/android/gms/internal/ads/w;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;
.implements Landroid/view/ViewTreeObserver$OnScrollChangedListener;
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# static fields
.field public static final p:J


# instance fields
.field public final a:Landroid/content/Context;

.field public b:Landroid/app/Application;

.field public final c:Landroid/view/WindowManager;

.field public final d:Landroid/os/PowerManager;

.field public final e:Landroid/app/KeyguardManager;

.field public f:Landroid/content/BroadcastReceiver;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public g:Ljava/lang/ref/WeakReference;

.field public final h:Ljava/lang/ref/WeakReference;

.field public i:Ll/t7s0;

.field public final j:Ll/z7t0;

.field public k:Z

.field public l:I

.field public final m:Ljava/util/HashSet;

.field public final n:Landroid/util/DisplayMetrics;

.field public final o:Landroid/graphics/Rect;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    sget-object v0, Ll/sgs0;->m1:Ll/dgs0;

    .line 2
    .line 3
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Long;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    sput-wide v0, Lcom/google/android/gms/internal/ads/w;->p:J

    .line 18
    .line 19
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/z7t0;

    .line 5
    .line 6
    sget-wide v1, Lcom/google/android/gms/internal/ads/w;->p:J

    .line 7
    .line 8
    invoke-direct {v0, v1, v2}, Ll/z7t0;-><init>(J)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/google/android/gms/internal/ads/w;->j:Ll/z7t0;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-boolean v0, p0, Lcom/google/android/gms/internal/ads/w;->k:Z

    .line 15
    .line 16
    const/4 v0, -0x1

    .line 17
    iput v0, p0, Lcom/google/android/gms/internal/ads/w;->l:I

    .line 18
    .line 19
    new-instance v0, Ljava/util/HashSet;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/google/android/gms/internal/ads/w;->m:Ljava/util/HashSet;

    .line 25
    .line 26
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iput-object v0, p0, Lcom/google/android/gms/internal/ads/w;->a:Landroid/content/Context;

    .line 31
    .line 32
    const-string v1, "window"

    .line 33
    .line 34
    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    check-cast v1, Landroid/view/WindowManager;

    .line 39
    .line 40
    iput-object v1, p0, Lcom/google/android/gms/internal/ads/w;->c:Landroid/view/WindowManager;

    .line 41
    .line 42
    const-string v2, "power"

    .line 43
    .line 44
    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    check-cast v2, Landroid/os/PowerManager;

    .line 49
    .line 50
    iput-object v2, p0, Lcom/google/android/gms/internal/ads/w;->d:Landroid/os/PowerManager;

    .line 51
    .line 52
    const-string v2, "keyguard"

    .line 53
    .line 54
    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    check-cast v2, Landroid/app/KeyguardManager;

    .line 59
    .line 60
    iput-object v2, p0, Lcom/google/android/gms/internal/ads/w;->e:Landroid/app/KeyguardManager;

    .line 61
    .line 62
    instance-of v2, v0, Landroid/app/Application;

    .line 63
    .line 64
    if-eqz v2, :cond_0

    .line 65
    .line 66
    check-cast v0, Landroid/app/Application;

    .line 67
    .line 68
    iput-object v0, p0, Lcom/google/android/gms/internal/ads/w;->b:Landroid/app/Application;

    .line 69
    .line 70
    new-instance v2, Ll/t7s0;

    .line 71
    .line 72
    invoke-direct {v2, v0, p0}, Ll/t7s0;-><init>(Landroid/app/Application;Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 73
    .line 74
    .line 75
    iput-object v2, p0, Lcom/google/android/gms/internal/ads/w;->i:Ll/t7s0;

    .line 76
    .line 77
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    iput-object p1, p0, Lcom/google/android/gms/internal/ads/w;->n:Landroid/util/DisplayMetrics;

    .line 86
    .line 87
    new-instance p1, Landroid/graphics/Rect;

    .line 88
    .line 89
    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    .line 90
    .line 91
    .line 92
    iput-object p1, p0, Lcom/google/android/gms/internal/ads/w;->o:Landroid/graphics/Rect;

    .line 93
    .line 94
    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-virtual {v0}, Landroid/view/Display;->getWidth()I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    iput v0, p1, Landroid/graphics/Rect;->right:I

    .line 103
    .line 104
    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-virtual {v0}, Landroid/view/Display;->getHeight()I

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    iput v0, p1, Landroid/graphics/Rect;->bottom:I

    .line 113
    .line 114
    iget-object p1, p0, Lcom/google/android/gms/internal/ads/w;->h:Ljava/lang/ref/WeakReference;

    .line 115
    .line 116
    if-eqz p1, :cond_1

    .line 117
    .line 118
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    check-cast p1, Landroid/view/View;

    .line 123
    .line 124
    goto :goto_0

    .line 125
    :cond_1
    const/4 p1, 0x0

    .line 126
    :goto_0
    if-eqz p1, :cond_2

    .line 127
    .line 128
    invoke-virtual {p1, p0}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/ads/w;->m(Landroid/view/View;)V

    .line 132
    .line 133
    .line 134
    :cond_2
    new-instance p1, Ljava/lang/ref/WeakReference;

    .line 135
    .line 136
    invoke-direct {p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 137
    .line 138
    .line 139
    iput-object p1, p0, Lcom/google/android/gms/internal/ads/w;->h:Ljava/lang/ref/WeakReference;

    .line 140
    .line 141
    if-eqz p2, :cond_4

    .line 142
    .line 143
    invoke-virtual {p2}, Landroid/view/View;->isAttachedToWindow()Z

    .line 144
    .line 145
    .line 146
    move-result p1

    .line 147
    if-eqz p1, :cond_3

    .line 148
    .line 149
    invoke-virtual {p0, p2}, Lcom/google/android/gms/internal/ads/w;->l(Landroid/view/View;)V

    .line 150
    .line 151
    .line 152
    :cond_3
    invoke-virtual {p2, p0}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 153
    .line 154
    .line 155
    :cond_4
    return-void
.end method

.method public static bridge synthetic b(Lcom/google/android/gms/internal/ads/w;I)V
    .locals 0

    .line 1
    const/4 p1, 0x3

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/ads/w;->j(I)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/graphics/Rect;)Landroid/graphics/Rect;
    .locals 4

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    iget v1, p1, Landroid/graphics/Rect;->left:I

    .line 4
    .line 5
    invoke-virtual {p0, v1}, Lcom/google/android/gms/internal/ads/w;->h(I)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget v2, p1, Landroid/graphics/Rect;->top:I

    .line 10
    .line 11
    invoke-virtual {p0, v2}, Lcom/google/android/gms/internal/ads/w;->h(I)I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    iget v3, p1, Landroid/graphics/Rect;->right:I

    .line 16
    .line 17
    invoke-virtual {p0, v3}, Lcom/google/android/gms/internal/ads/w;->h(I)I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/ads/w;->h(I)I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    invoke-direct {v0, v1, v2, v3, p0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 28
    .line 29
    .line 30
    return-object v0
.end method

.method public final c(Ll/y6s0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/ads/w;->m:Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x3

    .line 7
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/ads/w;->j(I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic d()V
    .locals 1

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/ads/w;->j(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final e(Ll/y6s0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/internal/ads/w;->m:Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final f()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/internal/ads/w;->j:Ll/z7t0;

    .line 2
    .line 3
    sget-wide v0, Lcom/google/android/gms/internal/ads/w;->p:J

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1}, Ll/z7t0;->a(J)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final g(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/internal/ads/w;->j:Ll/z7t0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/z7t0;->a(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final h(I)I
    .locals 0

    .line 1
    int-to-float p1, p1

    .line 2
    iget-object p0, p0, Lcom/google/android/gms/internal/ads/w;->n:Landroid/util/DisplayMetrics;

    .line 3
    .line 4
    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    .line 5
    .line 6
    div-float/2addr p1, p0

    .line 7
    float-to-int p0, p1

    .line 8
    return p0
.end method

.method public final i(Landroid/app/Activity;I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/ads/w;->h:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    if-eqz p1, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/google/android/gms/internal/ads/w;->h:Ljava/lang/ref/WeakReference;

    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/view/Window;->peekDecorView()Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Landroid/view/View;

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    if-eqz p1, :cond_1

    .line 27
    .line 28
    invoke-virtual {v0}, Landroid/view/View;->getRootView()Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p1}, Landroid/view/View;->getRootView()Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    if-ne v0, p1, :cond_1

    .line 37
    .line 38
    iput p2, p0, Lcom/google/android/gms/internal/ads/w;->l:I

    .line 39
    .line 40
    :cond_1
    :goto_0
    return-void
.end method

.method public final j(I)V
    .locals 34

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move/from16 v2, p1

    .line 4
    .line 5
    iget-object v0, v1, Lcom/google/android/gms/internal/ads/w;->m:Ljava/util/HashSet;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/util/HashSet;->isEmpty()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto/16 :goto_15

    .line 14
    .line 15
    :cond_0
    iget-object v0, v1, Lcom/google/android/gms/internal/ads/w;->h:Ljava/lang/ref/WeakReference;

    .line 16
    .line 17
    if-eqz v0, :cond_18

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    move-object v3, v0

    .line 24
    check-cast v3, Landroid/view/View;

    .line 25
    .line 26
    new-instance v4, Landroid/graphics/Rect;

    .line 27
    .line 28
    invoke-direct {v4}, Landroid/graphics/Rect;-><init>()V

    .line 29
    .line 30
    .line 31
    new-instance v5, Landroid/graphics/Rect;

    .line 32
    .line 33
    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    .line 34
    .line 35
    .line 36
    new-instance v6, Landroid/graphics/Rect;

    .line 37
    .line 38
    invoke-direct {v6}, Landroid/graphics/Rect;-><init>()V

    .line 39
    .line 40
    .line 41
    new-instance v7, Landroid/graphics/Rect;

    .line 42
    .line 43
    invoke-direct {v7}, Landroid/graphics/Rect;-><init>()V

    .line 44
    .line 45
    .line 46
    const/4 v0, 0x2

    .line 47
    new-array v8, v0, [I

    .line 48
    .line 49
    new-array v9, v0, [I

    .line 50
    .line 51
    const/4 v11, 0x1

    .line 52
    const/4 v12, 0x0

    .line 53
    if-eqz v3, :cond_2

    .line 54
    .line 55
    invoke-virtual {v3, v5}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    .line 56
    .line 57
    .line 58
    move-result v13

    .line 59
    invoke-virtual {v3, v6}, Landroid/view/View;->getLocalVisibleRect(Landroid/graphics/Rect;)Z

    .line 60
    .line 61
    .line 62
    move-result v14

    .line 63
    invoke-virtual {v3, v7}, Landroid/view/View;->getHitRect(Landroid/graphics/Rect;)V

    .line 64
    .line 65
    .line 66
    :try_start_0
    invoke-virtual {v3, v8}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v3, v9}, Landroid/view/View;->getLocationInWindow([I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 70
    .line 71
    .line 72
    goto :goto_0

    .line 73
    :catch_0
    move-exception v0

    .line 74
    const-string v15, "Failure getting view location."

    .line 75
    .line 76
    invoke-static {v15, v0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 77
    .line 78
    .line 79
    :goto_0
    sget-object v0, Ll/sgs0;->M4:Ll/dgs0;

    .line 80
    .line 81
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 82
    .line 83
    .line 84
    move-result-object v15

    .line 85
    invoke-virtual {v15, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    check-cast v0, Ljava/lang/Boolean;

    .line 90
    .line 91
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-eqz v0, :cond_1

    .line 96
    .line 97
    aget v0, v9, v12

    .line 98
    .line 99
    iput v0, v4, Landroid/graphics/Rect;->left:I

    .line 100
    .line 101
    aget v0, v9, v11

    .line 102
    .line 103
    iput v0, v4, Landroid/graphics/Rect;->top:I

    .line 104
    .line 105
    goto :goto_1

    .line 106
    :cond_1
    aget v0, v8, v12

    .line 107
    .line 108
    iput v0, v4, Landroid/graphics/Rect;->left:I

    .line 109
    .line 110
    aget v0, v8, v11

    .line 111
    .line 112
    iput v0, v4, Landroid/graphics/Rect;->top:I

    .line 113
    .line 114
    :goto_1
    iget v0, v4, Landroid/graphics/Rect;->left:I

    .line 115
    .line 116
    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    .line 117
    .line 118
    .line 119
    move-result v8

    .line 120
    add-int/2addr v0, v8

    .line 121
    iput v0, v4, Landroid/graphics/Rect;->right:I

    .line 122
    .line 123
    iget v0, v4, Landroid/graphics/Rect;->top:I

    .line 124
    .line 125
    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    .line 126
    .line 127
    .line 128
    move-result v8

    .line 129
    add-int/2addr v0, v8

    .line 130
    iput v0, v4, Landroid/graphics/Rect;->bottom:I

    .line 131
    .line 132
    move-object v8, v3

    .line 133
    goto :goto_2

    .line 134
    :cond_2
    move v13, v12

    .line 135
    move v14, v13

    .line 136
    const/4 v8, 0x0

    .line 137
    :goto_2
    sget-object v0, Ll/sgs0;->p1:Ll/dgs0;

    .line 138
    .line 139
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 140
    .line 141
    .line 142
    move-result-object v9

    .line 143
    invoke-virtual {v9, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    check-cast v0, Ljava/lang/Boolean;

    .line 148
    .line 149
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    if-eqz v0, :cond_5

    .line 154
    .line 155
    if-eqz v8, :cond_5

    .line 156
    .line 157
    :try_start_1
    new-instance v0, Ljava/util/ArrayList;

    .line 158
    .line 159
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 160
    .line 161
    .line 162
    invoke-virtual {v8}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 163
    .line 164
    .line 165
    move-result-object v9

    .line 166
    :goto_3
    instance-of v15, v9, Landroid/view/View;

    .line 167
    .line 168
    if-eqz v15, :cond_4

    .line 169
    .line 170
    move-object v15, v9

    .line 171
    check-cast v15, Landroid/view/View;

    .line 172
    .line 173
    new-instance v12, Landroid/graphics/Rect;

    .line 174
    .line 175
    invoke-direct {v12}, Landroid/graphics/Rect;-><init>()V

    .line 176
    .line 177
    .line 178
    invoke-virtual {v15}, Landroid/view/View;->isScrollContainer()Z

    .line 179
    .line 180
    .line 181
    move-result v16

    .line 182
    if-eqz v16, :cond_3

    .line 183
    .line 184
    invoke-virtual {v15, v12}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    .line 185
    .line 186
    .line 187
    move-result v15

    .line 188
    if-eqz v15, :cond_3

    .line 189
    .line 190
    invoke-virtual {v1, v12}, Lcom/google/android/gms/internal/ads/w;->a(Landroid/graphics/Rect;)Landroid/graphics/Rect;

    .line 191
    .line 192
    .line 193
    move-result-object v12

    .line 194
    invoke-interface {v0, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 195
    .line 196
    .line 197
    goto :goto_4

    .line 198
    :catch_1
    move-exception v0

    .line 199
    goto :goto_6

    .line 200
    :cond_3
    :goto_4
    invoke-interface {v9}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    .line 201
    .line 202
    .line 203
    move-result-object v9
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 204
    const/4 v12, 0x0

    .line 205
    goto :goto_3

    .line 206
    :cond_4
    :goto_5
    move-object/from16 v33, v0

    .line 207
    .line 208
    goto :goto_7

    .line 209
    :goto_6
    const-string v9, "PositionWatcher.getParentScrollViewRects"

    .line 210
    .line 211
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 212
    .line 213
    .line 214
    move-result-object v12

    .line 215
    invoke-virtual {v12, v0, v9}, Ll/ebt0;->w(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 216
    .line 217
    .line 218
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 219
    .line 220
    goto :goto_5

    .line 221
    :cond_5
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 222
    .line 223
    goto :goto_5

    .line 224
    :goto_7
    if-eqz v8, :cond_6

    .line 225
    .line 226
    invoke-virtual {v8}, Landroid/view/View;->getWindowVisibility()I

    .line 227
    .line 228
    .line 229
    move-result v9

    .line 230
    goto :goto_8

    .line 231
    :cond_6
    const/16 v9, 0x8

    .line 232
    .line 233
    :goto_8
    iget v12, v1, Lcom/google/android/gms/internal/ads/w;->l:I

    .line 234
    .line 235
    const/4 v15, -0x1

    .line 236
    if-eq v12, v15, :cond_7

    .line 237
    .line 238
    move v9, v12

    .line 239
    :cond_7
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 240
    .line 241
    .line 242
    invoke-static {v8}, Lcom/google/android/gms/ads/internal/util/b;->X(Landroid/view/View;)J

    .line 243
    .line 244
    .line 245
    move-result-wide v28

    .line 246
    sget-object v12, Ll/sgs0;->ca:Ll/dgs0;

    .line 247
    .line 248
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 249
    .line 250
    .line 251
    move-result-object v15

    .line 252
    invoke-virtual {v15, v12}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 253
    .line 254
    .line 255
    move-result-object v12

    .line 256
    check-cast v12, Ljava/lang/Boolean;

    .line 257
    .line 258
    invoke-virtual {v12}, Ljava/lang/Boolean;->booleanValue()Z

    .line 259
    .line 260
    .line 261
    move-result v12

    .line 262
    if-eqz v12, :cond_c

    .line 263
    .line 264
    if-eqz v3, :cond_9

    .line 265
    .line 266
    iget-object v3, v1, Lcom/google/android/gms/internal/ads/w;->d:Landroid/os/PowerManager;

    .line 267
    .line 268
    iget-object v12, v1, Lcom/google/android/gms/internal/ads/w;->e:Landroid/app/KeyguardManager;

    .line 269
    .line 270
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 271
    .line 272
    .line 273
    invoke-static {v8, v3, v12}, Lcom/google/android/gms/ads/internal/util/b;->r(Landroid/view/View;Landroid/os/PowerManager;Landroid/app/KeyguardManager;)Z

    .line 274
    .line 275
    .line 276
    move-result v3

    .line 277
    if-eqz v3, :cond_9

    .line 278
    .line 279
    if-eqz v13, :cond_b

    .line 280
    .line 281
    if-eqz v14, :cond_a

    .line 282
    .line 283
    sget-object v3, Ll/sgs0;->fa:Ll/dgs0;

    .line 284
    .line 285
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 286
    .line 287
    .line 288
    move-result-object v12

    .line 289
    invoke-virtual {v12, v3}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 290
    .line 291
    .line 292
    move-result-object v3

    .line 293
    check-cast v3, Ljava/lang/Integer;

    .line 294
    .line 295
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 296
    .line 297
    .line 298
    move-result v3

    .line 299
    int-to-long v12, v3

    .line 300
    cmp-long v3, v28, v12

    .line 301
    .line 302
    if-ltz v3, :cond_8

    .line 303
    .line 304
    if-nez v9, :cond_8

    .line 305
    .line 306
    :goto_9
    move v3, v11

    .line 307
    move v13, v3

    .line 308
    move v14, v13

    .line 309
    const/4 v9, 0x0

    .line 310
    goto :goto_a

    .line 311
    :cond_8
    move v13, v11

    .line 312
    move v14, v13

    .line 313
    :cond_9
    const/4 v3, 0x0

    .line 314
    goto :goto_a

    .line 315
    :cond_a
    move v13, v11

    .line 316
    const/4 v3, 0x0

    .line 317
    const/4 v14, 0x0

    .line 318
    goto :goto_a

    .line 319
    :cond_b
    const/4 v3, 0x0

    .line 320
    const/4 v13, 0x0

    .line 321
    goto :goto_a

    .line 322
    :cond_c
    if-eqz v3, :cond_9

    .line 323
    .line 324
    iget-object v3, v1, Lcom/google/android/gms/internal/ads/w;->d:Landroid/os/PowerManager;

    .line 325
    .line 326
    iget-object v12, v1, Lcom/google/android/gms/internal/ads/w;->e:Landroid/app/KeyguardManager;

    .line 327
    .line 328
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 329
    .line 330
    .line 331
    invoke-static {v8, v3, v12}, Lcom/google/android/gms/ads/internal/util/b;->r(Landroid/view/View;Landroid/os/PowerManager;Landroid/app/KeyguardManager;)Z

    .line 332
    .line 333
    .line 334
    move-result v3

    .line 335
    if-eqz v3, :cond_9

    .line 336
    .line 337
    if-eqz v13, :cond_b

    .line 338
    .line 339
    if-eqz v14, :cond_a

    .line 340
    .line 341
    if-nez v9, :cond_8

    .line 342
    .line 343
    goto :goto_9

    .line 344
    :goto_a
    sget-object v12, Ll/sgs0;->ha:Ll/dgs0;

    .line 345
    .line 346
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 347
    .line 348
    .line 349
    move-result-object v15

    .line 350
    invoke-virtual {v15, v12}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 351
    .line 352
    .line 353
    move-result-object v12

    .line 354
    check-cast v12, Ljava/lang/Boolean;

    .line 355
    .line 356
    invoke-virtual {v12}, Ljava/lang/Boolean;->booleanValue()Z

    .line 357
    .line 358
    .line 359
    move-result v12

    .line 360
    if-eqz v12, :cond_12

    .line 361
    .line 362
    iget-object v12, v1, Lcom/google/android/gms/internal/ads/w;->d:Landroid/os/PowerManager;

    .line 363
    .line 364
    iget-object v15, v1, Lcom/google/android/gms/internal/ads/w;->e:Landroid/app/KeyguardManager;

    .line 365
    .line 366
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 367
    .line 368
    .line 369
    invoke-static {v8, v12, v15}, Lcom/google/android/gms/ads/internal/util/b;->r(Landroid/view/View;Landroid/os/PowerManager;Landroid/app/KeyguardManager;)Z

    .line 370
    .line 371
    .line 372
    move-result v12

    .line 373
    if-eq v11, v12, :cond_d

    .line 374
    .line 375
    const/4 v12, 0x0

    .line 376
    goto :goto_b

    .line 377
    :cond_d
    const/16 v12, 0x40

    .line 378
    .line 379
    :goto_b
    if-eq v11, v13, :cond_e

    .line 380
    .line 381
    const/4 v15, 0x0

    .line 382
    goto :goto_c

    .line 383
    :cond_e
    const/16 v15, 0x8

    .line 384
    .line 385
    :goto_c
    if-eq v11, v14, :cond_f

    .line 386
    .line 387
    const/16 v16, 0x0

    .line 388
    .line 389
    goto :goto_d

    .line 390
    :cond_f
    const/16 v16, 0x10

    .line 391
    .line 392
    :goto_d
    if-nez v9, :cond_10

    .line 393
    .line 394
    const/16 v9, 0x80

    .line 395
    .line 396
    goto :goto_e

    .line 397
    :cond_10
    const/4 v9, 0x0

    .line 398
    :goto_e
    sget-object v0, Ll/sgs0;->fa:Ll/dgs0;

    .line 399
    .line 400
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 401
    .line 402
    .line 403
    move-result-object v11

    .line 404
    invoke-virtual {v11, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 405
    .line 406
    .line 407
    move-result-object v0

    .line 408
    check-cast v0, Ljava/lang/Integer;

    .line 409
    .line 410
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 411
    .line 412
    .line 413
    move-result v0

    .line 414
    int-to-long v10, v0

    .line 415
    cmp-long v0, v28, v10

    .line 416
    .line 417
    if-ltz v0, :cond_11

    .line 418
    .line 419
    const/16 v0, 0x20

    .line 420
    .line 421
    goto :goto_f

    .line 422
    :cond_11
    const/4 v0, 0x0

    .line 423
    :goto_f
    or-int v10, v12, v15

    .line 424
    .line 425
    or-int v10, v10, v16

    .line 426
    .line 427
    or-int/2addr v9, v10

    .line 428
    or-int/2addr v0, v9

    .line 429
    or-int/2addr v0, v3

    .line 430
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 431
    .line 432
    .line 433
    const/4 v9, 0x0

    .line 434
    invoke-static {v8, v0, v9}, Lcom/google/android/gms/ads/internal/util/b;->i(Landroid/view/View;ILandroid/view/MotionEvent;)V

    .line 435
    .line 436
    .line 437
    const/4 v9, 0x1

    .line 438
    goto :goto_10

    .line 439
    :cond_12
    move v9, v11

    .line 440
    :goto_10
    if-ne v2, v9, :cond_13

    .line 441
    .line 442
    iget-object v0, v1, Lcom/google/android/gms/internal/ads/w;->j:Ll/z7t0;

    .line 443
    .line 444
    invoke-virtual {v0}, Ll/z7t0;->b()Z

    .line 445
    .line 446
    .line 447
    move-result v0

    .line 448
    if-nez v0, :cond_13

    .line 449
    .line 450
    iget-boolean v0, v1, Lcom/google/android/gms/internal/ads/w;->k:Z

    .line 451
    .line 452
    if-eq v3, v0, :cond_18

    .line 453
    .line 454
    :cond_13
    if-nez v3, :cond_14

    .line 455
    .line 456
    iget-boolean v0, v1, Lcom/google/android/gms/internal/ads/w;->k:Z

    .line 457
    .line 458
    if-nez v0, :cond_14

    .line 459
    .line 460
    const/4 v9, 0x1

    .line 461
    if-eq v2, v9, :cond_18

    .line 462
    .line 463
    goto :goto_11

    .line 464
    :cond_14
    const/4 v9, 0x1

    .line 465
    :goto_11
    new-instance v16, Ll/x6s0;

    .line 466
    .line 467
    invoke-static {}, Ll/bxy0;->b()Lcom/google/android/gms/common/util/Clock;

    .line 468
    .line 469
    .line 470
    move-result-object v0

    .line 471
    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    .line 472
    .line 473
    .line 474
    move-result-wide v10

    .line 475
    iget-object v0, v1, Lcom/google/android/gms/internal/ads/w;->d:Landroid/os/PowerManager;

    .line 476
    .line 477
    invoke-virtual {v0}, Landroid/os/PowerManager;->isScreenOn()Z

    .line 478
    .line 479
    .line 480
    move-result v19

    .line 481
    if-eqz v8, :cond_15

    .line 482
    .line 483
    invoke-virtual {v8}, Landroid/view/View;->isAttachedToWindow()Z

    .line 484
    .line 485
    .line 486
    move-result v0

    .line 487
    if-eqz v0, :cond_15

    .line 488
    .line 489
    move/from16 v20, v9

    .line 490
    .line 491
    goto :goto_12

    .line 492
    :cond_15
    const/16 v20, 0x0

    .line 493
    .line 494
    :goto_12
    if-eqz v8, :cond_16

    .line 495
    .line 496
    invoke-virtual {v8}, Landroid/view/View;->getWindowVisibility()I

    .line 497
    .line 498
    .line 499
    move-result v0

    .line 500
    move/from16 v21, v0

    .line 501
    .line 502
    goto :goto_13

    .line 503
    :cond_16
    const/16 v21, 0x8

    .line 504
    .line 505
    :goto_13
    iget-object v0, v1, Lcom/google/android/gms/internal/ads/w;->o:Landroid/graphics/Rect;

    .line 506
    .line 507
    invoke-virtual {v1, v0}, Lcom/google/android/gms/internal/ads/w;->a(Landroid/graphics/Rect;)Landroid/graphics/Rect;

    .line 508
    .line 509
    .line 510
    move-result-object v22

    .line 511
    invoke-virtual {v1, v4}, Lcom/google/android/gms/internal/ads/w;->a(Landroid/graphics/Rect;)Landroid/graphics/Rect;

    .line 512
    .line 513
    .line 514
    move-result-object v23

    .line 515
    invoke-virtual {v1, v5}, Lcom/google/android/gms/internal/ads/w;->a(Landroid/graphics/Rect;)Landroid/graphics/Rect;

    .line 516
    .line 517
    .line 518
    move-result-object v24

    .line 519
    invoke-virtual {v1, v6}, Lcom/google/android/gms/internal/ads/w;->a(Landroid/graphics/Rect;)Landroid/graphics/Rect;

    .line 520
    .line 521
    .line 522
    move-result-object v26

    .line 523
    invoke-virtual {v1, v7}, Lcom/google/android/gms/internal/ads/w;->a(Landroid/graphics/Rect;)Landroid/graphics/Rect;

    .line 524
    .line 525
    .line 526
    move-result-object v30

    .line 527
    iget-object v0, v1, Lcom/google/android/gms/internal/ads/w;->n:Landroid/util/DisplayMetrics;

    .line 528
    .line 529
    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 530
    .line 531
    move/from16 v31, v0

    .line 532
    .line 533
    move/from16 v32, v3

    .line 534
    .line 535
    move-wide/from16 v17, v10

    .line 536
    .line 537
    move/from16 v25, v13

    .line 538
    .line 539
    move/from16 v27, v14

    .line 540
    .line 541
    invoke-direct/range {v16 .. v33}, Ll/x6s0;-><init>(JZZILandroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Rect;ZLandroid/graphics/Rect;ZJLandroid/graphics/Rect;FZLjava/util/List;)V

    .line 542
    .line 543
    .line 544
    move-object/from16 v0, v16

    .line 545
    .line 546
    move/from16 v11, v32

    .line 547
    .line 548
    iget-object v2, v1, Lcom/google/android/gms/internal/ads/w;->m:Ljava/util/HashSet;

    .line 549
    .line 550
    invoke-virtual {v2}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 551
    .line 552
    .line 553
    move-result-object v2

    .line 554
    :goto_14
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 555
    .line 556
    .line 557
    move-result v3

    .line 558
    if-eqz v3, :cond_17

    .line 559
    .line 560
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 561
    .line 562
    .line 563
    move-result-object v3

    .line 564
    check-cast v3, Ll/y6s0;

    .line 565
    .line 566
    invoke-interface {v3, v0}, Ll/y6s0;->U(Ll/x6s0;)V

    .line 567
    .line 568
    .line 569
    goto :goto_14

    .line 570
    :cond_17
    iput-boolean v11, v1, Lcom/google/android/gms/internal/ads/w;->k:Z

    .line 571
    .line 572
    :cond_18
    :goto_15
    return-void
.end method

.method public final k()V
    .locals 2

    .line 1
    sget-object v0, Lcom/google/android/gms/ads/internal/util/b;->l:Ll/ukw0;

    .line 2
    .line 3
    new-instance v1, Ll/w6s0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/w6s0;-><init>(Lcom/google/android/gms/internal/ads/w;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final l(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Landroid/view/ViewTreeObserver;->isAlive()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 12
    .line 13
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/google/android/gms/internal/ads/w;->g:Ljava/lang/ref/WeakReference;

    .line 17
    .line 18
    invoke-virtual {p1, p0}, Landroid/view/ViewTreeObserver;->addOnScrollChangedListener(Landroid/view/ViewTreeObserver$OnScrollChangedListener;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1, p0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object p1, p0, Lcom/google/android/gms/internal/ads/w;->f:Landroid/content/BroadcastReceiver;

    .line 25
    .line 26
    if-nez p1, :cond_1

    .line 27
    .line 28
    new-instance p1, Landroid/content/IntentFilter;

    .line 29
    .line 30
    invoke-direct {p1}, Landroid/content/IntentFilter;-><init>()V

    .line 31
    .line 32
    .line 33
    const-string v0, "android.intent.action.SCREEN_ON"

    .line 34
    .line 35
    invoke-virtual {p1, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    const-string v0, "android.intent.action.SCREEN_OFF"

    .line 39
    .line 40
    invoke-virtual {p1, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    const-string v0, "android.intent.action.USER_PRESENT"

    .line 44
    .line 45
    invoke-virtual {p1, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    new-instance v0, Lcom/google/android/gms/internal/ads/zzayo;

    .line 49
    .line 50
    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/ads/zzayo;-><init>(Lcom/google/android/gms/internal/ads/w;)V

    .line 51
    .line 52
    .line 53
    iput-object v0, p0, Lcom/google/android/gms/internal/ads/w;->f:Landroid/content/BroadcastReceiver;

    .line 54
    .line 55
    iget-object v0, p0, Lcom/google/android/gms/internal/ads/w;->a:Landroid/content/Context;

    .line 56
    .line 57
    invoke-static {}, Ll/bxy0;->x()Lcom/google/android/gms/ads/internal/util/a;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    iget-object v2, p0, Lcom/google/android/gms/internal/ads/w;->f:Landroid/content/BroadcastReceiver;

    .line 62
    .line 63
    invoke-virtual {v1, v0, v2, p1}, Lcom/google/android/gms/ads/internal/util/a;->c(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    .line 64
    .line 65
    .line 66
    :cond_1
    iget-object p1, p0, Lcom/google/android/gms/internal/ads/w;->b:Landroid/app/Application;

    .line 67
    .line 68
    if-eqz p1, :cond_2

    .line 69
    .line 70
    :try_start_0
    iget-object p0, p0, Lcom/google/android/gms/internal/ads/w;->i:Ll/t7s0;

    .line 71
    .line 72
    invoke-virtual {p1, p0}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :catch_0
    move-exception p0

    .line 77
    const-string p1, "Error registering activity lifecycle callbacks."

    .line 78
    .line 79
    invoke-static {p1, p0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 80
    .line 81
    .line 82
    :cond_2
    return-void
.end method

.method public final m(Landroid/view/View;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/internal/ads/w;->g:Ljava/lang/ref/WeakReference;

    .line 3
    .line 4
    if-eqz v1, :cond_1

    .line 5
    .line 6
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    check-cast v1, Landroid/view/ViewTreeObserver;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v1}, Landroid/view/ViewTreeObserver;->isAlive()Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-eqz v2, :cond_0

    .line 19
    .line 20
    invoke-virtual {v1, p0}, Landroid/view/ViewTreeObserver;->removeOnScrollChangedListener(Landroid/view/ViewTreeObserver$OnScrollChangedListener;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1, p0}, Landroid/view/ViewTreeObserver;->removeGlobalOnLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :catch_0
    move-exception v1

    .line 28
    goto :goto_1

    .line 29
    :cond_0
    :goto_0
    iput-object v0, p0, Lcom/google/android/gms/internal/ads/w;->g:Ljava/lang/ref/WeakReference;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    .line 31
    goto :goto_2

    .line 32
    :goto_1
    const-string v2, "Error while unregistering listeners from the last ViewTreeObserver."

    .line 33
    .line 34
    invoke-static {v2, v1}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    :goto_2
    :try_start_1
    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p1}, Landroid/view/ViewTreeObserver;->isAlive()Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eqz v1, :cond_2

    .line 46
    .line 47
    invoke-virtual {p1, p0}, Landroid/view/ViewTreeObserver;->removeOnScrollChangedListener(Landroid/view/ViewTreeObserver$OnScrollChangedListener;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1, p0}, Landroid/view/ViewTreeObserver;->removeGlobalOnLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 51
    .line 52
    .line 53
    goto :goto_3

    .line 54
    :catch_1
    move-exception p1

    .line 55
    const-string v1, "Error while unregistering listeners from the ViewTreeObserver."

    .line 56
    .line 57
    invoke-static {v1, p1}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 58
    .line 59
    .line 60
    :cond_2
    :goto_3
    iget-object p1, p0, Lcom/google/android/gms/internal/ads/w;->f:Landroid/content/BroadcastReceiver;

    .line 61
    .line 62
    if-eqz p1, :cond_3

    .line 63
    .line 64
    :try_start_2
    invoke-static {}, Ll/bxy0;->x()Lcom/google/android/gms/ads/internal/util/a;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    iget-object v1, p0, Lcom/google/android/gms/internal/ads/w;->a:Landroid/content/Context;

    .line 69
    .line 70
    iget-object v2, p0, Lcom/google/android/gms/internal/ads/w;->f:Landroid/content/BroadcastReceiver;

    .line 71
    .line 72
    invoke-virtual {p1, v1, v2}, Lcom/google/android/gms/ads/internal/util/a;->d(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V
    :try_end_2
    .catch Ljava/lang/IllegalStateException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 73
    .line 74
    .line 75
    goto :goto_6

    .line 76
    :catch_2
    move-exception p1

    .line 77
    goto :goto_4

    .line 78
    :catch_3
    move-exception p1

    .line 79
    goto :goto_5

    .line 80
    :goto_4
    const-string v1, "ActiveViewUnit.stopScreenStatusMonitoring"

    .line 81
    .line 82
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    invoke-virtual {v2, p1, v1}, Ll/ebt0;->w(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    goto :goto_6

    .line 90
    :goto_5
    const-string v1, "Failed trying to unregister the receiver"

    .line 91
    .line 92
    invoke-static {v1, p1}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 93
    .line 94
    .line 95
    :goto_6
    iput-object v0, p0, Lcom/google/android/gms/internal/ads/w;->f:Landroid/content/BroadcastReceiver;

    .line 96
    .line 97
    :cond_3
    iget-object p1, p0, Lcom/google/android/gms/internal/ads/w;->b:Landroid/app/Application;

    .line 98
    .line 99
    if-eqz p1, :cond_4

    .line 100
    .line 101
    :try_start_3
    iget-object p0, p0, Lcom/google/android/gms/internal/ads/w;->i:Ll/t7s0;

    .line 102
    .line 103
    invoke-virtual {p1, p0}, Landroid/app/Application;->unregisterActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_4

    .line 104
    .line 105
    .line 106
    goto :goto_7

    .line 107
    :catch_4
    move-exception p0

    .line 108
    const-string p1, "Error registering activity lifecycle callbacks."

    .line 109
    .line 110
    invoke-static {p1, p0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 111
    .line 112
    .line 113
    :cond_4
    :goto_7
    return-void
.end method

.method public final onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    const/4 p2, 0x0

    .line 2
    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/internal/ads/w;->i(Landroid/app/Activity;I)V

    .line 3
    .line 4
    .line 5
    const/4 p1, 0x3

    .line 6
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/ads/w;->j(I)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/w;->k()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final onActivityDestroyed(Landroid/app/Activity;)V
    .locals 0

    .line 1
    const/4 p1, 0x3

    .line 2
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/ads/w;->j(I)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/w;->k()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final onActivityPaused(Landroid/app/Activity;)V
    .locals 1

    .line 1
    const/4 v0, 0x4

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/ads/w;->i(Landroid/app/Activity;I)V

    .line 3
    .line 4
    .line 5
    const/4 p1, 0x3

    .line 6
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/ads/w;->j(I)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/w;->k()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final onActivityResumed(Landroid/app/Activity;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/ads/w;->i(Landroid/app/Activity;I)V

    .line 3
    .line 4
    .line 5
    const/4 p1, 0x3

    .line 6
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/ads/w;->j(I)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/w;->k()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    const/4 p1, 0x3

    .line 2
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/ads/w;->j(I)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/w;->k()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final onActivityStarted(Landroid/app/Activity;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/ads/w;->i(Landroid/app/Activity;I)V

    .line 3
    .line 4
    .line 5
    const/4 p1, 0x3

    .line 6
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/ads/w;->j(I)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/w;->k()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final onActivityStopped(Landroid/app/Activity;)V
    .locals 0

    .line 1
    const/4 p1, 0x3

    .line 2
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/ads/w;->j(I)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/w;->k()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final onGlobalLayout()V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/ads/w;->j(I)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/w;->k()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final onScrollChanged()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/ads/w;->j(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final onViewAttachedToWindow(Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    iput v0, p0, Lcom/google/android/gms/internal/ads/w;->l:I

    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/ads/w;->l(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    const/4 p1, 0x3

    .line 8
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/ads/w;->j(I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final onViewDetachedFromWindow(Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    iput v0, p0, Lcom/google/android/gms/internal/ads/w;->l:I

    .line 3
    .line 4
    const/4 v0, 0x3

    .line 5
    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/ads/w;->j(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/w;->k()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/ads/w;->m(Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
