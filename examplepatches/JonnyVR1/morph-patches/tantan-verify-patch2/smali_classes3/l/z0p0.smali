.class public Ll/z0p0;
.super Landroid/widget/PopupWindow;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/TextView;

.field public b:Landroid/widget/TextView;

.field public c:Landroid/widget/TextView;

.field public d:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/x20;Ll/x20;Ll/x20;)V
    .locals 2
    .param p2    # Ll/x20;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ll/x20;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Ll/x20;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 v0, -0x2

    .line 2
    invoke-direct {p0, v0, v0}, Landroid/widget/PopupWindow;-><init>(II)V

    .line 3
    .line 4
    .line 5
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    sget v0, Ll/yec0;->qa:I

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    sget v0, Ll/mdc0;->V1:I

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Landroid/widget/TextView;

    .line 23
    .line 24
    iput-object v0, p0, Ll/z0p0;->a:Landroid/widget/TextView;

    .line 25
    .line 26
    sget v0, Ll/mdc0;->c5:I

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Landroid/widget/TextView;

    .line 33
    .line 34
    iput-object v0, p0, Ll/z0p0;->b:Landroid/widget/TextView;

    .line 35
    .line 36
    sget v0, Ll/mdc0;->S0:I

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Landroid/widget/ImageView;

    .line 43
    .line 44
    iput-object v0, p0, Ll/z0p0;->d:Landroid/widget/ImageView;

    .line 45
    .line 46
    sget v0, Ll/mdc0;->R0:I

    .line 47
    .line 48
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    check-cast v0, Landroid/widget/TextView;

    .line 53
    .line 54
    iput-object v0, p0, Ll/z0p0;->c:Landroid/widget/TextView;

    .line 55
    .line 56
    invoke-virtual {p0, p1}, Landroid/widget/PopupWindow;->setContentView(Landroid/view/View;)V

    .line 57
    .line 58
    .line 59
    const/4 p1, 0x1

    .line 60
    invoke-virtual {p0, p1}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    .line 61
    .line 62
    .line 63
    iget-object p1, p0, Ll/z0p0;->a:Landroid/widget/TextView;

    .line 64
    .line 65
    new-instance v0, Ll/w0p0;

    .line 66
    .line 67
    invoke-direct {v0, p0, p2}, Ll/w0p0;-><init>(Ll/z0p0;Ll/x20;)V

    .line 68
    .line 69
    .line 70
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 71
    .line 72
    .line 73
    iget-object p1, p0, Ll/z0p0;->b:Landroid/widget/TextView;

    .line 74
    .line 75
    new-instance p2, Ll/x0p0;

    .line 76
    .line 77
    invoke-direct {p2, p0, p3}, Ll/x0p0;-><init>(Ll/z0p0;Ll/x20;)V

    .line 78
    .line 79
    .line 80
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 81
    .line 82
    .line 83
    iget-object p1, p0, Ll/z0p0;->c:Landroid/widget/TextView;

    .line 84
    .line 85
    new-instance p2, Ll/y0p0;

    .line 86
    .line 87
    invoke-direct {p2, p0, p4}, Ll/y0p0;-><init>(Ll/z0p0;Ll/x20;)V

    .line 88
    .line 89
    .line 90
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public static synthetic a(Ll/z0p0;Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/z0p0;->e(Ll/x20;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/z0p0;Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/z0p0;->d(Ll/x20;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/z0p0;Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/z0p0;->f(Ll/x20;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final synthetic d(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p1}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic e(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p1}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic f(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p1}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public g(Landroid/view/View;Z)V
    .locals 2

    .line 1
    const/high16 v0, 0x41f00000    # 30.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    neg-int v0, v0

    .line 8
    const/high16 v1, 0x41200000    # 10.0f

    .line 9
    .line 10
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    neg-int v1, v1

    .line 15
    invoke-super {p0, p1, v0, v1}, Landroid/widget/PopupWindow;->showAsDropDown(Landroid/view/View;II)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/z0p0;->b:Landroid/widget/TextView;

    .line 19
    .line 20
    invoke-static {p0, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    return-void
.end method
