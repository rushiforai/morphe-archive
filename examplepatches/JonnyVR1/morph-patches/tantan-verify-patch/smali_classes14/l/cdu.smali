.class public Ll/cdu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/vcu;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/android/app/Act;

.field public b:Ll/vcu;

.field public c:Ll/jl80;

.field public d:Lcom/google/android/material/bottomsheet/BottomSheetDialog;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/cdu;->a:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/cdu;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cdu;->p()V

    return-void
.end method

.method public static synthetic b(Ll/cdu;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/cdu;->q()V

    return-void
.end method

.method public static synthetic c(Ll/cdu;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cdu;->n(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic d(Ll/cdu;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cdu;->k(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ll/cdu;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cdu;->m(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic f(Ll/cdu;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cdu;->l(Landroid/view/View;)V

    return-void
.end method

.method private synthetic q()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cdu;->b:Ll/vcu;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/vcu;->i0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cdu;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cdu;->c:Ll/jl80;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/g1e;->dismiss()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ll/cdu;->d:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public i(Ll/vcu;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cdu;->b:Ll/vcu;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/vcu;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/cdu;->i(Ll/vcu;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public final j(Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance v0, Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 9
    .line 10
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    sget v2, Ll/hgc0;->c:I

    .line 15
    .line 16
    invoke-direct {v0, v1, v2}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;-><init>(Landroid/content/Context;I)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/cdu;->d:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 20
    .line 21
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sget v1, Ll/xec0;->T0:I

    .line 30
    .line 31
    const/4 v2, 0x0

    .line 32
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    sget v1, Ll/ldc0;->V:I

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    check-cast v1, Landroid/widget/TextView;

    .line 43
    .line 44
    sget v2, Ll/ldc0;->J:I

    .line 45
    .line 46
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    check-cast v2, Landroid/widget/TextView;

    .line 51
    .line 52
    sget v3, Ll/ldc0;->G1:I

    .line 53
    .line 54
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    check-cast v3, Landroid/widget/TextView;

    .line 59
    .line 60
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    iget-object p1, p0, Ll/cdu;->d:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 64
    .line 65
    invoke-virtual {p1, v0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(Landroid/view/View;)V

    .line 66
    .line 67
    .line 68
    new-instance p1, Ll/wcu;

    .line 69
    .line 70
    invoke-direct {p1, p0}, Ll/wcu;-><init>(Ll/cdu;)V

    .line 71
    .line 72
    .line 73
    invoke-static {v2, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 74
    .line 75
    .line 76
    new-instance p1, Ll/xcu;

    .line 77
    .line 78
    invoke-direct {p1, p0}, Ll/xcu;-><init>(Ll/cdu;)V

    .line 79
    .line 80
    .line 81
    invoke-static {v3, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 82
    .line 83
    .line 84
    iget-object p1, p0, Ll/cdu;->d:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 85
    .line 86
    new-instance v0, Ll/ycu;

    .line 87
    .line 88
    invoke-direct {v0, p0}, Ll/ycu;-><init>(Ll/cdu;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p1, v0}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public final synthetic k(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cdu;->d:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic l(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/cdu;->d:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/app/Dialog;->dismiss()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/cdu;->b:Ll/vcu;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/vcu;->i0()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic m(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic n(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cdu;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic p()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cdu;->b:Ll/vcu;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/vcu;->h0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public s(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cdu;->d:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/cdu;->j(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ll/cdu;->d:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/app/Dialog;->show()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public u(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Ll/jl80$a;

    .line 2
    .line 3
    iget-object v1, p0, Ll/cdu;->a:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ll/cdu;->b:Ll/vcu;

    .line 9
    .line 10
    invoke-virtual {v1}, Ll/vcu;->f0()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-virtual {v0, v1}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v1, p0, Ll/cdu;->b:Ll/vcu;

    .line 19
    .line 20
    invoke-virtual {v1}, Ll/vcu;->f0()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    invoke-virtual {v0, v1}, Ll/jl80$a;->M(Z)Ll/jl80$a;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/zcu;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/zcu;-><init>(Ll/cdu;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ll/jl80$a;->n0(Landroid/content/DialogInterface$OnDismissListener;)Ll/jl80$a;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    sget v1, Ll/nbc0;->O0:I

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ll/jl80$a;->S(I)Ll/jl80$a;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    sget v1, Lcom/p1/mobile/putong/live/external/R$string;->c0:I

    .line 44
    .line 45
    const/4 v2, 0x0

    .line 46
    new-array v2, v2, [Ljava/lang/Object;

    .line 47
    .line 48
    invoke-virtual {v0, v1, v2}, Ll/jl80$a;->x0(I[Ljava/lang/Object;)Ll/jl80$a;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v0, p1}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    new-instance v0, Ll/adu;

    .line 57
    .line 58
    invoke-direct {v0, p0}, Ll/adu;-><init>(Ll/cdu;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p1, p3, v0}, Ll/jl80$a;->c0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    new-instance p3, Ll/bdu;

    .line 66
    .line 67
    invoke-direct {p3, p0}, Ll/bdu;-><init>(Ll/cdu;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p1, p2, p3}, Ll/jl80$a;->X(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    const p2, -0x181e3

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1, p2}, Ll/jl80$a;->Y(I)Ll/jl80$a;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-virtual {p1}, Ll/jl80$a;->r0()Ll/jl80;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    iput-object p1, p0, Ll/cdu;->c:Ll/jl80;

    .line 86
    .line 87
    return-void
.end method
