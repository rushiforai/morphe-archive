.class public Ll/mxg;
.super Landroid/app/Dialog;
.source "SourceFile"


# instance fields
.field public a:Lv/VText;

.field public b:Lv/VText;

.field public c:Lv/VButton;

.field public d:Lv/VButton;

.field public e:Ljava/lang/Runnable;

.field public f:Ljava/lang/Runnable;

.field public g:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 103
    sget v0, Ll/fgc0;->a:I

    invoke-direct {p0, p1, v0}, Ll/mxg;-><init>(Landroid/content/Context;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 2
    .line 3
    .line 4
    sget p2, Ll/tec0;->k0:I

    .line 5
    .line 6
    invoke-virtual {p0, p2}, Landroid/app/Dialog;->setContentView(I)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-virtual {p2}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    const/4 v0, -0x1

    .line 18
    iput v0, p2, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 19
    .line 20
    const/4 v0, -0x2

    .line 21
    iput v0, p2, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 22
    .line 23
    const/16 v0, 0x11

    .line 24
    .line 25
    iput v0, p2, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0, p2}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 32
    .line 33
    .line 34
    sget p2, Ll/hdc0;->J:I

    .line 35
    .line 36
    invoke-virtual {p0, p2}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    check-cast p2, Lv/VText;

    .line 41
    .line 42
    iput-object p2, p0, Ll/mxg;->a:Lv/VText;

    .line 43
    .line 44
    sget p2, Ll/hdc0;->I:I

    .line 45
    .line 46
    invoke-virtual {p0, p2}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    check-cast p2, Lv/VText;

    .line 51
    .line 52
    iput-object p2, p0, Ll/mxg;->b:Lv/VText;

    .line 53
    .line 54
    sget p2, Ll/hdc0;->l:I

    .line 55
    .line 56
    invoke-virtual {p0, p2}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    check-cast p2, Lv/VButton;

    .line 61
    .line 62
    iput-object p2, p0, Ll/mxg;->c:Lv/VButton;

    .line 63
    .line 64
    sget p2, Ll/hdc0;->m:I

    .line 65
    .line 66
    invoke-virtual {p0, p2}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    check-cast p2, Lv/VButton;

    .line 71
    .line 72
    iput-object p2, p0, Ll/mxg;->d:Lv/VButton;

    .line 73
    .line 74
    iget-object p2, p0, Ll/mxg;->c:Lv/VButton;

    .line 75
    .line 76
    new-instance v0, Ll/kxg;

    .line 77
    .line 78
    invoke-direct {v0, p0}, Ll/kxg;-><init>(Ll/mxg;)V

    .line 79
    .line 80
    .line 81
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 82
    .line 83
    .line 84
    iget-object p2, p0, Ll/mxg;->d:Lv/VButton;

    .line 85
    .line 86
    new-instance v0, Ll/lxg;

    .line 87
    .line 88
    invoke-direct {v0, p0}, Ll/lxg;-><init>(Ll/mxg;)V

    .line 89
    .line 90
    .line 91
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 92
    .line 93
    .line 94
    instance-of p2, p1, Lcom/p1/mobile/android/app/Act;

    .line 95
    .line 96
    if-eqz p2, :cond_0

    .line 97
    .line 98
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 99
    .line 100
    iput-object p1, p0, Ll/mxg;->g:Lcom/p1/mobile/android/app/Act;

    .line 101
    .line 102
    :cond_0
    return-void
.end method

.method public static synthetic a(Ll/mxg;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mxg;->e(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/mxg;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mxg;->f(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public c(Z)Ll/mxg;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 2
    .line 3
    .line 4
    return-object p0
.end method

.method public d(I)Ll/mxg;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mxg;->b:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public final synthetic e(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/mxg;->e:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/mxg;->e:Ljava/lang/Runnable;

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic f(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/mxg;->f:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/mxg;->f:Ljava/lang/Runnable;

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public g(I)Ll/mxg;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mxg;->c:Lv/VButton;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/mxg;->c:Lv/VButton;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 10
    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    iput-object p1, p0, Ll/mxg;->e:Ljava/lang/Runnable;

    .line 14
    .line 15
    return-object p0
.end method

.method public h(ILjava/lang/Runnable;)Ll/mxg;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mxg;->c:Lv/VButton;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/mxg;->c:Lv/VButton;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 10
    .line 11
    .line 12
    iput-object p2, p0, Ll/mxg;->e:Ljava/lang/Runnable;

    .line 13
    .line 14
    return-object p0
.end method

.method public i(ILjava/lang/Runnable;)Ll/mxg;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mxg;->d:Lv/VButton;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/mxg;->d:Lv/VButton;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 10
    .line 11
    .line 12
    iput-object p2, p0, Ll/mxg;->f:Ljava/lang/Runnable;

    .line 13
    .line 14
    return-object p0
.end method

.method public j(I)Ll/mxg;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mxg;->a:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/mxg;->a:Lv/VText;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 10
    .line 11
    .line 12
    return-object p0
.end method

.method public show()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->show()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
