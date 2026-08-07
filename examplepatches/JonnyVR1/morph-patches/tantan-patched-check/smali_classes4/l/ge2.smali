.class public Ll/ge2;
.super Ll/gf2;
.source "SourceFile"


# instance fields
.field public l:Lv/VText;

.field public m:Lv/VText;

.field public final n:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/gf2;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "p_bar_activity_popup"

    .line 5
    .line 6
    iput-object p1, p0, Ll/ge2;->n:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic F(Ll/ge2;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ge2;->K(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic G(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic H(Ll/ge2;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ge2;->J(Landroid/view/View;)V

    return-void
.end method

.method private synthetic J(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/gf2;->dismiss()V

    .line 2
    .line 3
    .line 4
    const-string p1, "e_bar_activity_enter"

    .line 5
    .line 6
    const-string v0, "p_bar_activity_popup"

    .line 7
    .line 8
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/gf2;->j:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    invoke-static {p0}, Ll/xd2;->b(Lcom/p1/mobile/android/app/Act;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private synthetic K(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/gf2;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public I(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/he2;->b(Ll/ge2;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Landroidx/appcompat/app/a;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Dialog;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p0, p1, v0}, Ll/ge2;->I(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Ll/nu0;->setContentView(Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 18
    .line 19
    .line 20
    const-class p1, Ll/ge2;

    .line 21
    .line 22
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    const-string v0, "p_bar_activity_popup"

    .line 27
    .line 28
    invoke-static {v0, p1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_0

    .line 41
    .line 42
    sget v1, Ll/dbc0;->T0:I

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawableResource(I)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-static {}, Ll/qa00;->c()Landroid/util/DisplayMetrics;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    iget v2, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 56
    .line 57
    sget v3, Ll/qa00;->F:I

    .line 58
    .line 59
    sub-int/2addr v2, v3

    .line 60
    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 61
    .line 62
    mul-int/lit16 v2, v2, 0x5b2

    .line 63
    .line 64
    div-int/lit16 v2, v2, 0x3a5

    .line 65
    .line 66
    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 69
    .line 70
    .line 71
    :cond_0
    iget-object v0, p0, Ll/ge2;->l:Lv/VText;

    .line 72
    .line 73
    new-instance v1, Ll/de2;

    .line 74
    .line 75
    invoke-direct {v1, p0}, Ll/de2;-><init>(Ll/ge2;)V

    .line 76
    .line 77
    .line 78
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Ll/ge2;->m:Lv/VText;

    .line 82
    .line 83
    new-instance v1, Ll/ee2;

    .line 84
    .line 85
    invoke-direct {v1, p0}, Ll/ee2;-><init>(Ll/ge2;)V

    .line 86
    .line 87
    .line 88
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 89
    .line 90
    .line 91
    invoke-static {p1}, Ll/w1e;->f(Ll/l4g0;)V

    .line 92
    .line 93
    .line 94
    new-instance v0, Ll/fe2;

    .line 95
    .line 96
    invoke-direct {v0, p1}, Ll/fe2;-><init>(Ll/l4g0;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0, v0}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 100
    .line 101
    .line 102
    return-void
.end method
