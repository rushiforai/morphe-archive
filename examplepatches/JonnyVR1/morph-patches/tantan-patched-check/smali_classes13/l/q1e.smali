.class public Ll/q1e;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:[Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ll/qcj<",
            "Ll/q1e;",
            "Lcom/p1/mobile/android/app/Dialog;",
            ">;"
        }
    .end annotation
.end field

.field public b:[Ljava/lang/Object;

.field public c:Lcom/p1/mobile/android/app/Dialog;

.field public d:I

.field public e:Ll/x20;

.field public f:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public g:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/Stack;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/q1e;->f:Ljava/util/Stack;

    .line 10
    .line 11
    const-wide/16 v0, 0x0

    .line 12
    .line 13
    iput-wide v0, p0, Ll/q1e;->g:J

    .line 14
    .line 15
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/android/app/Dialog;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Ll/q1e;Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/q1e;->m(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic c(Ll/q1e;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/q1e;->l()V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/android/app/Dialog;FLandroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Landroid/view/Window;->setDimAmount(F)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final e(I)Lcom/p1/mobile/android/app/Dialog;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/q1e;->a:[Ll/qcj;

    .line 2
    .line 3
    aget-object p1, v0, p1

    .line 4
    .line 5
    invoke-interface {p1, p0}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/p1/mobile/android/app/Dialog;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog;->I(Z)Lcom/p1/mobile/android/app/Dialog;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public final varargs f(IILl/x20;[Ljava/lang/Object;)V
    .locals 3

    .line 1
    iput p1, p0, Ll/q1e;->d:I

    .line 2
    .line 3
    iput-object p4, p0, Ll/q1e;->b:[Ljava/lang/Object;

    .line 4
    .line 5
    iget-object p4, p0, Ll/q1e;->c:Lcom/p1/mobile/android/app/Dialog;

    .line 6
    .line 7
    invoke-virtual {p4}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget v0, v0, Landroid/view/WindowManager$LayoutParams;->dimAmount:F

    .line 16
    .line 17
    invoke-virtual {p4}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v1, p2}, Landroid/view/Window;->setWindowAnimations(I)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ll/q1e;->e(I)Lcom/p1/mobile/android/app/Dialog;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iput-object p1, p0, Ll/q1e;->c:Lcom/p1/mobile/android/app/Dialog;

    .line 29
    .line 30
    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p1, p2}, Landroid/view/Window;->setWindowAnimations(I)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Ll/q1e;->c:Lcom/p1/mobile/android/app/Dialog;

    .line 38
    .line 39
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 40
    .line 41
    .line 42
    if-eqz p3, :cond_0

    .line 43
    .line 44
    invoke-interface {p3}, Ll/x20;->call()V

    .line 45
    .line 46
    .line 47
    :cond_0
    iget-object p1, p0, Ll/q1e;->c:Lcom/p1/mobile/android/app/Dialog;

    .line 48
    .line 49
    invoke-virtual {p1}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    new-instance p2, Ll/o1e;

    .line 54
    .line 55
    invoke-direct {p2, p0}, Ll/o1e;-><init>(Ll/q1e;)V

    .line 56
    .line 57
    .line 58
    const-wide/16 v1, 0xc8

    .line 59
    .line 60
    invoke-static {p1, p2, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 61
    .line 62
    .line 63
    const/4 p1, 0x2

    .line 64
    new-array p1, p1, [F

    .line 65
    .line 66
    fill-array-data p1, :array_0

    .line 67
    .line 68
    .line 69
    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-virtual {p1, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    new-instance p2, Ll/p1e;

    .line 78
    .line 79
    invoke-direct {p2, p4, v0}, Ll/p1e;-><init>(Lcom/p1/mobile/android/app/Dialog;F)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0, p4}, Ll/q1e;->n(Lcom/p1/mobile/android/app/Dialog;)V

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    nop

    .line 93
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public g()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/q1e;->c:Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {v0, v1}, Landroid/view/Window;->setWindowAnimations(I)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/q1e;->c:Lcom/p1/mobile/android/app/Dialog;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ll/q1e;->n(Lcom/p1/mobile/android/app/Dialog;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final varargs h(I[Ljava/lang/Object;)V
    .locals 2

    .line 1
    :cond_0
    :goto_0
    iget-object v0, p0, Ll/q1e;->f:Ljava/util/Stack;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/Stack;->empty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/q1e;->f:Ljava/util/Stack;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ljava/lang/Integer;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-ne p1, v0, :cond_0

    .line 22
    .line 23
    sget v0, Ll/tgc0;->d:I

    .line 24
    .line 25
    iget-object v1, p0, Ll/q1e;->e:Ll/x20;

    .line 26
    .line 27
    invoke-virtual {p0, p1, v0, v1, p2}, Ll/q1e;->f(IILl/x20;[Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    return-void
.end method

.method public final varargs i([Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/q1e;->f:Ljava/util/Stack;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/q1e;->g()V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object v0, p0, Ll/q1e;->f:Ljava/util/Stack;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->size()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    add-int/lit8 v1, v1, -0x1

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/util/AbstractList;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Ljava/lang/Integer;

    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    invoke-virtual {p0, v0, p1}, Ll/q1e;->h(I[Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public varargs j(ILl/x20;[Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget v0, p0, Ll/q1e;->d:I

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v1, p0, Ll/q1e;->f:Ljava/util/Stack;

    .line 7
    .line 8
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v1, v0}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    sget v0, Ll/tgc0;->c:I

    .line 16
    .line 17
    invoke-virtual {p0, p1, v0, p2, p3}, Ll/q1e;->f(IILl/x20;[Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Ll/q1e;->c:Lcom/p1/mobile/android/app/Dialog;

    .line 21
    .line 22
    new-instance p2, Ll/m1e;

    .line 23
    .line 24
    invoke-direct {p2, p0}, Ll/m1e;-><init>(Ll/q1e;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, p2}, Landroid/app/Dialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public varargs k(I[Ljava/lang/Object;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0, p2}, Ll/q1e;->j(ILl/x20;[Ljava/lang/Object;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic l()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/q1e;->c:Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, v0}, Landroid/view/Window;->setWindowAnimations(I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic m(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .locals 2

    .line 1
    const/4 p1, 0x4

    .line 2
    if-ne p2, p1, :cond_2

    .line 3
    .line 4
    iget-wide p1, p0, Ll/q1e;->g:J

    .line 5
    .line 6
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getDownTime()J

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    cmp-long p1, p1, v0

    .line 11
    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    iget-object p1, p0, Ll/q1e;->c:Lcom/p1/mobile/android/app/Dialog;

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Dialog;->X()Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    const-string v0, "NEGATIVE"

    .line 27
    .line 28
    if-ne p2, v0, :cond_0

    .line 29
    .line 30
    iget-object p2, p0, Ll/q1e;->c:Lcom/p1/mobile/android/app/Dialog;

    .line 31
    .line 32
    invoke-virtual {p2, p1}, Lcom/p1/mobile/android/app/Dialog;->onClick(Landroid/view/View;)V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    iget-object p1, p0, Ll/q1e;->c:Lcom/p1/mobile/android/app/Dialog;

    .line 37
    .line 38
    invoke-virtual {p1}, Landroid/app/Dialog;->cancel()V

    .line 39
    .line 40
    .line 41
    :cond_1
    :goto_0
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getDownTime()J

    .line 42
    .line 43
    .line 44
    move-result-wide p1

    .line 45
    iput-wide p1, p0, Ll/q1e;->g:J

    .line 46
    .line 47
    const/4 p0, 0x1

    .line 48
    return p0

    .line 49
    :cond_2
    const/4 p0, 0x0

    .line 50
    return p0
.end method

.method public final n(Lcom/p1/mobile/android/app/Dialog;)V
    .locals 0

    .line 1
    new-instance p0, Ll/n1e;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/n1e;-><init>(Lcom/p1/mobile/android/app/Dialog;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final varargs o([Ll/qcj;)Ll/q1e;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ll/qcj<",
            "Ll/q1e;",
            "Lcom/p1/mobile/android/app/Dialog;",
            ">;)",
            "Ll/q1e;"
        }
    .end annotation

    .annotation runtime Ljava/lang/SafeVarargs;
    .end annotation

    .line 1
    iput-object p1, p0, Ll/q1e;->a:[Ll/qcj;

    .line 2
    .line 3
    return-object p0
.end method

.method public final p(Ll/x20;)Ll/q1e;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/q1e;->e:Ll/x20;

    .line 2
    .line 3
    return-object p0
.end method

.method public q()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/q1e;->e(I)Lcom/p1/mobile/android/app/Dialog;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    iput-object v1, p0, Ll/q1e;->c:Lcom/p1/mobile/android/app/Dialog;

    .line 7
    .line 8
    iput v0, p0, Ll/q1e;->d:I

    .line 9
    .line 10
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 11
    .line 12
    .line 13
    return-void
.end method
