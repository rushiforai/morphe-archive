.class public Ll/jbt;
.super Landroidx/appcompat/app/a;
.source "SourceFile"


# instance fields
.field public b:I

.field public c:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;ILandroid/view/View;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Landroidx/appcompat/app/a;-><init>(Landroid/content/Context;I)V

    .line 2
    .line 3
    .line 4
    sget p2, Ll/ggc0;->c:I

    .line 5
    .line 6
    iput p2, p0, Ll/jbt;->b:I

    .line 7
    .line 8
    check-cast p1, Landroid/app/Activity;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setOwnerActivity(Landroid/app/Activity;)V

    .line 11
    .line 12
    .line 13
    const p1, 0x10100dd

    .line 14
    .line 15
    .line 16
    filled-new-array {p1}, [I

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    invoke-virtual {p2, p1}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    const/4 p2, 0x0

    .line 29
    invoke-virtual {p1, p2, p2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p3, p2}, Landroid/view/View;->setFitsSystemWindows(Z)V

    .line 37
    .line 38
    .line 39
    iput-object p3, p0, Ll/jbt;->c:Landroid/view/View;

    .line 40
    .line 41
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/view/View;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 42
    sget v0, Ll/ggc0;->d:I

    invoke-direct {p0, p1, v0, p2}, Ll/jbt;-><init>(Landroid/content/Context;ILandroid/view/View;)V

    return-void
.end method

.method public static synthetic t(Ll/jbt;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/jbt;->v()V

    return-void
.end method

.method private synthetic v()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->onBackPressed()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public dismiss()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->dismiss()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/nu0;->getDelegate()Landroidx/appcompat/app/b;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    sget v0, Ll/jdc0;->F0:I

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/b;->g(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onBackPressed()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/ibt;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/ibt;-><init>(Ll/jbt;)V

    .line 8
    .line 9
    .line 10
    const-wide/16 v2, 0x32

    .line 11
    .line 12
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public onStart()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->onStart()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    const/16 v2, 0x50

    .line 13
    .line 14
    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 15
    .line 16
    const/4 v2, -0x1

    .line 17
    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 18
    .line 19
    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 20
    .line 21
    iget v2, p0, Ll/jbt;->b:I

    .line 22
    .line 23
    invoke-virtual {v0, v2}, Landroid/view/Window;->setWindowAnimations(I)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 27
    .line 28
    .line 29
    const/high16 v1, 0x4000000

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    .line 32
    .line 33
    .line 34
    const/high16 v1, 0x20000

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    const/16 v2, 0x400

    .line 44
    .line 45
    invoke-virtual {v1, v2}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 46
    .line 47
    .line 48
    const/high16 v1, -0x80000000

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 51
    .line 52
    .line 53
    const/4 v1, 0x0

    .line 54
    invoke-virtual {v0, v1}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/jbt;->c:Landroid/view/View;

    .line 58
    .line 59
    invoke-virtual {p0, v0}, Ll/nu0;->setContentView(Landroid/view/View;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public u()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jbt;->c:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method
