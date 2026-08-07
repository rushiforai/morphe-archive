.class public Ll/g0c;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final g:Landroid/os/Handler;


# instance fields
.field public a:Landroid/widget/LinearLayout;

.field public b:Landroid/widget/TextView;

.field public c:Landroid/widget/LinearLayout;

.field public d:Landroid/view/ViewGroup;

.field public e:I

.field public f:Ll/q1j0$b;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Landroid/os/Handler;

    .line 2
    .line 3
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    new-instance v2, Ll/g0c$a;

    .line 8
    .line 9
    invoke-direct {v2}, Ll/g0c$a;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-direct {v0, v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    .line 13
    .line 14
    .line 15
    sput-object v0, Ll/g0c;->g:Landroid/os/Handler;

    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/g0c$b;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/g0c$b;-><init>(Ll/g0c;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/g0c;->f:Ll/q1j0$b;

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic a(Ll/g0c;)Landroid/widget/LinearLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g0c;->a:Landroid/widget/LinearLayout;

    return-object p0
.end method

.method public static bridge synthetic b(Ll/g0c;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g0c;->f()V

    return-void
.end method

.method public static bridge synthetic c(Ll/g0c;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g0c;->k()V

    return-void
.end method

.method public static d(Landroid/view/View;)Landroid/view/ViewGroup;
    .locals 3
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    move-object v1, v0

    .line 3
    :cond_0
    instance-of v2, p0, Landroid/widget/FrameLayout;

    .line 4
    .line 5
    if-eqz v2, :cond_2

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getId()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const v2, 0x1020002

    .line 12
    .line 13
    .line 14
    if-ne v1, v2, :cond_1

    .line 15
    .line 16
    check-cast p0, Landroid/view/ViewGroup;

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_1
    move-object v1, p0

    .line 20
    check-cast v1, Landroid/view/ViewGroup;

    .line 21
    .line 22
    :cond_2
    if-eqz p0, :cond_4

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    instance-of v2, p0, Landroid/view/View;

    .line 29
    .line 30
    if-eqz v2, :cond_3

    .line 31
    .line 32
    check-cast p0, Landroid/view/View;

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_3
    move-object p0, v0

    .line 36
    :cond_4
    :goto_0
    if-nez p0, :cond_0

    .line 37
    .line 38
    return-object v1
.end method

.method public static g(Landroid/view/View;Ljava/lang/CharSequence;ILjava/lang/Integer;)Ll/g0c;
    .locals 3
    .param p0    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/CharSequence;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/Integer;
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    const/16 v0, 0xdac

    .line 2
    .line 3
    if-le p2, v0, :cond_0

    .line 4
    .line 5
    move p2, v0

    .line 6
    :cond_0
    invoke-static {p0}, Ll/g0c;->d(Landroid/view/View;)Landroid/view/ViewGroup;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    if-eqz p0, :cond_2

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget v1, Ll/gec0;->x:I

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Landroid/widget/LinearLayout;

    .line 28
    .line 29
    new-instance v1, Ll/g0c;

    .line 30
    .line 31
    invoke-direct {v1}, Ll/g0c;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object v0, v1, Ll/g0c;->a:Landroid/widget/LinearLayout;

    .line 35
    .line 36
    iput-object p0, v1, Ll/g0c;->d:Landroid/view/ViewGroup;

    .line 37
    .line 38
    sget p0, Ll/vcc0;->V0:I

    .line 39
    .line 40
    invoke-virtual {v0, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    check-cast p0, Landroid/widget/TextView;

    .line 45
    .line 46
    iput-object p0, v1, Ll/g0c;->b:Landroid/widget/TextView;

    .line 47
    .line 48
    sget p0, Ll/vcc0;->U0:I

    .line 49
    .line 50
    invoke-virtual {v0, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    check-cast p0, Landroid/widget/LinearLayout;

    .line 55
    .line 56
    iput-object p0, v1, Ll/g0c;->c:Landroid/widget/LinearLayout;

    .line 57
    .line 58
    invoke-virtual {v1, p1}, Ll/g0c;->i(Ljava/lang/CharSequence;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v1, p2}, Ll/g0c;->h(I)Ll/g0c;

    .line 62
    .line 63
    .line 64
    if-eqz p3, :cond_1

    .line 65
    .line 66
    iget-object p0, v1, Ll/g0c;->c:Landroid/widget/LinearLayout;

    .line 67
    .line 68
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    instance-of p1, p0, Landroid/graphics/drawable/GradientDrawable;

    .line 77
    .line 78
    if-eqz p1, :cond_1

    .line 79
    .line 80
    move-object p1, p0

    .line 81
    check-cast p1, Landroid/graphics/drawable/GradientDrawable;

    .line 82
    .line 83
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    .line 84
    .line 85
    .line 86
    move-result p2

    .line 87
    invoke-virtual {p1, p2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 88
    .line 89
    .line 90
    iget-object p1, v1, Ll/g0c;->c:Landroid/widget/LinearLayout;

    .line 91
    .line 92
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 93
    .line 94
    .line 95
    :cond_1
    return-object v1

    .line 96
    :cond_2
    const-string p0, "No suitable parent found from the given view. Please provide a valid view."

    .line 97
    .line 98
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    const/4 p0, 0x0

    .line 102
    return-object p0
.end method


# virtual methods
.method public e()I
    .locals 0

    .line 1
    iget p0, p0, Ll/g0c;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public final f()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/g0c;->a:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/g0c;->a:Landroid/widget/LinearLayout;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget v1, Ll/u7c0;->a:I

    .line 16
    .line 17
    invoke-static {v0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/g0c$c;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/g0c$c;-><init>(Ll/g0c;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Ll/g0c;->a:Landroid/widget/LinearLayout;

    .line 30
    .line 31
    invoke-virtual {v1, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 32
    .line 33
    .line 34
    invoke-static {}, Ll/q1j0;->b()Ll/q1j0;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget-object p0, p0, Ll/g0c;->f:Ll/q1j0$b;

    .line 39
    .line 40
    invoke-virtual {v0, p0}, Ll/q1j0;->f(Ll/q1j0$b;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method public h(I)Ll/g0c;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iput p1, p0, Ll/g0c;->e:I

    .line 2
    .line 3
    return-object p0
.end method

.method public final i(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g0c;->b:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public j()V
    .locals 2

    .line 1
    invoke-static {}, Ll/q1j0;->b()Ll/q1j0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/g0c;->e()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget-object p0, p0, Ll/g0c;->f:Ll/q1j0$b;

    .line 10
    .line 11
    invoke-virtual {v0, v1, p0}, Ll/q1j0;->i(ILl/q1j0$b;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final k()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/g0c;->d:Landroid/view/ViewGroup;

    .line 2
    .line 3
    iget-object v1, p0, Ll/g0c;->a:Landroid/widget/LinearLayout;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/g0c;->a:Landroid/widget/LinearLayout;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 15
    .line 16
    const/16 v1, 0x11

    .line 17
    .line 18
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 19
    .line 20
    iget-object v1, p0, Ll/g0c;->a:Landroid/widget/LinearLayout;

    .line 21
    .line 22
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/g0c;->a:Landroid/widget/LinearLayout;

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/g0c;->a:Landroid/widget/LinearLayout;

    .line 32
    .line 33
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    sget v1, Ll/u7c0;->b:I

    .line 38
    .line 39
    invoke-static {v0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iget-object v1, p0, Ll/g0c;->a:Landroid/widget/LinearLayout;

    .line 44
    .line 45
    invoke-virtual {v1, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 46
    .line 47
    .line 48
    invoke-static {}, Ll/q1j0;->b()Ll/q1j0;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iget-object p0, p0, Ll/g0c;->f:Ll/q1j0$b;

    .line 53
    .line 54
    invoke-virtual {v0, p0}, Ll/q1j0;->g(Ll/q1j0$b;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method
