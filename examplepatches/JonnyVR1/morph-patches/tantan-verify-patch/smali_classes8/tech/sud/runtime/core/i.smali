.class Ltech/sud/runtime/core/i;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ltech/sud/runtime/core/i$a;
    }
.end annotation


# instance fields
.field private a:Landroid/view/View;

.field private b:Z

.field private c:I

.field private d:I

.field private e:I

.field private f:I

.field private final g:Landroid/view/Window;

.field private final h:Landroid/view/View;

.field private i:Z

.field private j:I

.field private final k:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final l:Ltech/sud/runtime/core/g;

.field private m:Ltech/sud/runtime/component/e/d;

.field private final n:Ltech/sud/runtime/core/i$a;

.field private final o:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# direct methods
.method public constructor <init>(Ltech/sud/runtime/core/g;Landroid/content/Context;Ltech/sud/runtime/core/i$a;)V
    .locals 2

    .line 1
    invoke-direct {p0, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ltech/sud/runtime/core/i;->b:Z

    .line 6
    .line 7
    iput v0, p0, Ltech/sud/runtime/core/i;->c:I

    .line 8
    .line 9
    iput v0, p0, Ltech/sud/runtime/core/i;->d:I

    .line 10
    .line 11
    iput v0, p0, Ltech/sud/runtime/core/i;->e:I

    .line 12
    .line 13
    iput v0, p0, Ltech/sud/runtime/core/i;->f:I

    .line 14
    .line 15
    iput v0, p0, Ltech/sud/runtime/core/i;->j:I

    .line 16
    .line 17
    new-instance v1, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 18
    .line 19
    invoke-direct {v1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 20
    .line 21
    .line 22
    iput-object v1, p0, Ltech/sud/runtime/core/i;->k:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 23
    .line 24
    new-instance v0, Ltech/sud/runtime/core/i$2;

    .line 25
    .line 26
    invoke-direct {v0, p0}, Ltech/sud/runtime/core/i$2;-><init>(Ltech/sud/runtime/core/i;)V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Ltech/sud/runtime/core/i;->o:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 30
    .line 31
    iput-object p1, p0, Ltech/sud/runtime/core/i;->l:Ltech/sud/runtime/core/g;

    .line 32
    .line 33
    invoke-static {p2}, Ltech/sud/runtime/component/h/c;->a(Landroid/content/Context;)Landroid/app/Activity;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iput-object p1, p0, Ltech/sud/runtime/core/i;->g:Landroid/view/Window;

    .line 42
    .line 43
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    iput-object p1, p0, Ltech/sud/runtime/core/i;->h:Landroid/view/View;

    .line 48
    .line 49
    iput-object p3, p0, Ltech/sud/runtime/core/i;->n:Ltech/sud/runtime/core/i$a;

    .line 50
    .line 51
    return-void
.end method

.method public static synthetic a(Ltech/sud/runtime/core/i;I)I
    .locals 0

    .line 19
    iput p1, p0, Ltech/sud/runtime/core/i;->c:I

    return p1
.end method

.method public static synthetic a(Ltech/sud/runtime/core/i;)Z
    .locals 0

    .line 16
    invoke-direct {p0}, Ltech/sud/runtime/core/i;->c()Z

    move-result p0

    return p0
.end method

.method public static synthetic a(Ltech/sud/runtime/core/i;Z)Z
    .locals 0

    .line 17
    iput-boolean p1, p0, Ltech/sud/runtime/core/i;->i:Z

    return p1
.end method

.method public static synthetic b(Ltech/sud/runtime/core/i;)I
    .locals 0

    .line 15
    iget p0, p0, Ltech/sud/runtime/core/i;->e:I

    return p0
.end method

.method public static synthetic b(Ltech/sud/runtime/core/i;I)I
    .locals 0

    .line 11
    iput p1, p0, Ltech/sud/runtime/core/i;->d:I

    return p1
.end method

.method public static synthetic b(Ltech/sud/runtime/core/i;Z)V
    .locals 0

    .line 12
    invoke-direct {p0, p1}, Ltech/sud/runtime/core/i;->b(Z)V

    return-void
.end method

.method private b(Z)V
    .locals 0

    .line 13
    iput-boolean p1, p0, Ltech/sud/runtime/core/i;->b:Z

    .line 14
    invoke-virtual {p0}, Ltech/sud/runtime/core/i;->b()V

    return-void
.end method

.method public static synthetic c(Ltech/sud/runtime/core/i;)I
    .locals 0

    .line 26
    iget p0, p0, Ltech/sud/runtime/core/i;->c:I

    return p0
.end method

.method public static synthetic c(Ltech/sud/runtime/core/i;I)I
    .locals 0

    .line 25
    iput p1, p0, Ltech/sud/runtime/core/i;->j:I

    return p1
.end method

.method private c()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/core/i;->k:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-boolean v1, p0, Ltech/sud/runtime/core/i;->b:Z

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ltech/sud/runtime/core/i;->m:Ltech/sud/runtime/component/e/d;

    .line 12
    .line 13
    invoke-virtual {p0}, Ltech/sud/runtime/component/e/d;->c()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public static synthetic d(Ltech/sud/runtime/core/i;)I
    .locals 0

    .line 26
    iget p0, p0, Ltech/sud/runtime/core/i;->f:I

    return p0
.end method

.method private d()V
    .locals 2

    .line 1
    iget v0, p0, Ltech/sud/runtime/core/i;->e:I

    .line 2
    .line 3
    iget v1, p0, Ltech/sud/runtime/core/i;->c:I

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget v0, p0, Ltech/sud/runtime/core/i;->f:I

    .line 8
    .line 9
    iget v1, p0, Ltech/sud/runtime/core/i;->d:I

    .line 10
    .line 11
    if-eq v0, v1, :cond_1

    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Ltech/sud/runtime/core/i;->a:Landroid/view/View;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    new-instance v0, Ltech/sud/runtime/core/i$1;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Ltech/sud/runtime/core/i$1;-><init>(Ltech/sud/runtime/core/i;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 23
    .line 24
    .line 25
    :cond_1
    return-void
.end method

.method public static synthetic e(Ltech/sud/runtime/core/i;)I
    .locals 0

    .line 1
    iget p0, p0, Ltech/sud/runtime/core/i;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic f(Ltech/sud/runtime/core/i;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/core/i;->a:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic g(Ltech/sud/runtime/core/i;)Landroid/view/Window;
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/core/i;->g:Landroid/view/Window;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic h(Ltech/sud/runtime/core/i;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/core/i;->h:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic i(Ltech/sud/runtime/core/i;)I
    .locals 0

    .line 1
    iget p0, p0, Ltech/sud/runtime/core/i;->j:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic j(Ltech/sud/runtime/core/i;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltech/sud/runtime/core/i;->i:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic k(Ltech/sud/runtime/core/i;)Ltech/sud/runtime/component/e/d;
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/core/i;->m:Ltech/sud/runtime/component/e/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic l(Ltech/sud/runtime/core/i;)Ltech/sud/runtime/core/i$a;
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/core/i;->n:Ltech/sud/runtime/core/i$a;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 20
    iget-object v0, p0, Ltech/sud/runtime/core/i;->a:Landroid/view/View;

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    const/4 v0, 0x0

    .line 21
    iput-object v0, p0, Ltech/sud/runtime/core/i;->a:Landroid/view/View;

    return-void
.end method

.method public a(Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltech/sud/runtime/core/i;->a:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iget-object p0, p0, Ltech/sud/runtime/core/i;->o:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 11
    .line 12
    invoke-virtual {p1, p0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public a(Ltech/sud/runtime/component/e/d;)V
    .locals 0

    .line 18
    iput-object p1, p0, Ltech/sud/runtime/core/i;->m:Ltech/sud/runtime/component/e/d;

    return-void
.end method

.method public a(Z)V
    .locals 0

    .line 22
    iget-object p0, p0, Ltech/sud/runtime/core/i;->k:Ljava/util/concurrent/atomic/AtomicInteger;

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, -0x1

    :goto_0
    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicInteger;->addAndGet(I)I

    return-void
.end method

.method public b()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ltech/sud/runtime/core/i;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Ltech/sud/runtime/core/i;->d()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public onSizeChanged(IIII)V
    .locals 0

    .line 1
    iput p1, p0, Ltech/sud/runtime/core/i;->e:I

    .line 2
    .line 3
    iput p2, p0, Ltech/sud/runtime/core/i;->f:I

    .line 4
    .line 5
    invoke-virtual {p0}, Ltech/sud/runtime/core/i;->b()V

    .line 6
    .line 7
    .line 8
    return-void
.end method
