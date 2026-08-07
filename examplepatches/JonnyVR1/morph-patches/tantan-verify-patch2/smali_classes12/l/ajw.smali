.class public Ll/ajw;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/ajw$b;
    }
.end annotation


# instance fields
.field private a:Landroid/view/Window;

.field private b:Landroid/view/View;

.field private c:I

.field private d:Landroid/widget/FrameLayout$LayoutParams;

.field private e:I

.field private f:Z


# direct methods
.method private constructor <init>(Landroid/app/Activity;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/ajw;->f:Z

    .line 6
    .line 7
    const v0, 0x1020002

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Landroid/widget/FrameLayout;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p0, Ll/ajw;->b:Landroid/view/View;

    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iput-object p1, p0, Ll/ajw;->a:Landroid/view/Window;

    .line 37
    .line 38
    iget-object p1, p0, Ll/ajw;->b:Landroid/view/View;

    .line 39
    .line 40
    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    new-instance v0, Ll/ajw$a;

    .line 45
    .line 46
    invoke-direct {v0, p0}, Ll/ajw$a;-><init>(Ll/ajw;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1, v0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Ll/ajw;->b:Landroid/view/View;

    .line 53
    .line 54
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 59
    .line 60
    iput-object p1, p0, Ll/ajw;->d:Landroid/widget/FrameLayout$LayoutParams;

    .line 61
    .line 62
    :cond_1
    :goto_0
    return-void
.end method

.method public static synthetic a(Ll/ajw;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ajw;->b:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Ll/ajw;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ajw;->f:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic c(Ll/ajw;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/ajw;->f:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic d(Ll/ajw;I)I
    .locals 0

    .line 1
    iput p1, p0, Ll/ajw;->e:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic e(Ll/ajw;)Ll/ajw$b;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return-object p0
.end method

.method public static synthetic f(Ll/ajw;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ajw;->j()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static g(Landroid/app/Activity;Ll/ajw$b;)Ll/ajw;
    .locals 1

    .line 1
    :try_start_0
    new-instance p1, Ll/ajw;

    .line 2
    .line 3
    invoke-direct {p1, p0}, Ll/ajw;-><init>(Landroid/app/Activity;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 4
    .line 5
    .line 6
    return-object p1

    .line 7
    :catchall_0
    move-exception p0

    .line 8
    const-string p1, "MKAndroidBug5497Workaround"

    .line 9
    .line 10
    const-string v0, ""

    .line 11
    .line 12
    invoke-static {p1, v0, p0}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 13
    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return-object p0
.end method

.method private h()I
    .locals 3

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/ajw;->b:Landroid/view/View;

    .line 7
    .line 8
    invoke-virtual {v1, v0}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Ll/ajw;->a:Landroid/view/Window;

    .line 12
    .line 13
    invoke-static {v1}, Ll/ajw;->i(Landroid/view/Window;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    iget v2, v0, Landroid/graphics/Rect;->bottom:I

    .line 18
    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    iget v0, v0, Landroid/graphics/Rect;->top:I

    .line 22
    .line 23
    sub-int/2addr v2, v0

    .line 24
    iget-object p0, p0, Ll/ajw;->b:Landroid/view/View;

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-static {p0}, Ll/q4g0;->c(Landroid/content/Context;)I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    add-int/2addr v2, p0

    .line 35
    return v2

    .line 36
    :cond_0
    iget p0, v0, Landroid/graphics/Rect;->top:I

    .line 37
    .line 38
    sub-int/2addr v2, p0

    .line 39
    return v2
.end method

.method private static i(Landroid/view/Window;)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_2

    .line 3
    .line 4
    :try_start_0
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    if-eqz v1, :cond_2

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/Window;->getStatusBarColor()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    const/4 v2, 0x1

    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    move v1, v2

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    move v1, v0

    .line 20
    :goto_0
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Landroid/view/View;->getSystemUiVisibility()I

    .line 25
    .line 26
    .line 27
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    and-int/lit16 p0, p0, 0x400

    .line 29
    .line 30
    if-eqz p0, :cond_1

    .line 31
    .line 32
    move p0, v2

    .line 33
    goto :goto_1

    .line 34
    :cond_1
    move p0, v0

    .line 35
    :goto_1
    if-eqz v1, :cond_2

    .line 36
    .line 37
    if-eqz p0, :cond_2

    .line 38
    .line 39
    return v2

    .line 40
    :catch_0
    :cond_2
    return v0
.end method

.method private j()V
    .locals 5

    .line 1
    invoke-direct {p0}, Ll/ajw;->h()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Ll/ajw;->c:I

    .line 6
    .line 7
    if-eq v0, v1, :cond_1

    .line 8
    .line 9
    iget-object v1, p0, Ll/ajw;->b:Landroid/view/View;

    .line 10
    .line 11
    invoke-virtual {v1}, Landroid/view/View;->getRootView()Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    sub-int v2, v1, v0

    .line 20
    .line 21
    div-int/lit8 v3, v1, 0x4

    .line 22
    .line 23
    iget-object v4, p0, Ll/ajw;->d:Landroid/widget/FrameLayout$LayoutParams;

    .line 24
    .line 25
    if-le v2, v3, :cond_0

    .line 26
    .line 27
    sub-int/2addr v1, v2

    .line 28
    iput v1, v4, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    iget v1, p0, Ll/ajw;->e:I

    .line 32
    .line 33
    iput v1, v4, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 34
    .line 35
    :goto_0
    iget-object v1, p0, Ll/ajw;->b:Landroid/view/View;

    .line 36
    .line 37
    invoke-virtual {v1}, Landroid/view/View;->requestLayout()V

    .line 38
    .line 39
    .line 40
    iput v0, p0, Ll/ajw;->c:I

    .line 41
    .line 42
    :cond_1
    return-void
.end method
