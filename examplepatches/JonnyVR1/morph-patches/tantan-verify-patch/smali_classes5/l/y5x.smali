.class public Ll/y5x;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/android/app/Act;Ll/jl80;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p2, "e_guide_mode_switching"

    .line 2
    .line 3
    const-string v0, "p_marriage_guide_pop"

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-string p2, "explore"

    .line 9
    .line 10
    invoke-static {p0, p2}, Lcom/p1/mobile/putong/core/ui/marry/audit/MarryInfoAuditStatusAct;->a2(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    invoke-static {p2}, Lcom/p1/mobile/putong/core/ui/marry/audit/MarryInfoAuditStatusAct;->d2(Landroid/content/Intent;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/app/Dialog;->isShowing()Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_0

    .line 25
    .line 26
    invoke-virtual {p1}, Ll/g1e;->dismiss()V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public static synthetic b(Ll/jl80;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/app/Dialog;->isShowing()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic c(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static d(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Ll/kec0;->za:I

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    sget v1, Ll/adc0;->Zc:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Lv/VText;

    .line 25
    .line 26
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    new-instance p1, Ll/jl80$a;

    .line 30
    .line 31
    invoke-direct {p1, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, v0}, Ll/jl80$a;->R(Landroid/view/View;)Ll/jl80$a;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    const/4 v1, 0x1

    .line 39
    invoke-virtual {p1, v1}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1}, Ll/jl80$a;->O()Ll/jl80;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    const-class v1, Ll/g6e;

    .line 48
    .line 49
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    const-string v2, "p_marriage_guide_pop"

    .line 54
    .line 55
    invoke-static {v2, v1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-static {v1}, Ll/w1e;->f(Ll/l4g0;)V

    .line 60
    .line 61
    .line 62
    sget v2, Ll/adc0;->a:I

    .line 63
    .line 64
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    new-instance v3, Ll/v5x;

    .line 69
    .line 70
    invoke-direct {v3, p0, p1}, Ll/v5x;-><init>(Lcom/p1/mobile/android/app/Act;Ll/jl80;)V

    .line 71
    .line 72
    .line 73
    invoke-static {v2, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 74
    .line 75
    .line 76
    sget p0, Ll/adc0;->Q0:I

    .line 77
    .line 78
    invoke-virtual {v0, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    new-instance v0, Ll/w5x;

    .line 83
    .line 84
    invoke-direct {v0, p1}, Ll/w5x;-><init>(Ll/jl80;)V

    .line 85
    .line 86
    .line 87
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 88
    .line 89
    .line 90
    new-instance p0, Ll/x5x;

    .line 91
    .line 92
    invoke-direct {p0, v1}, Ll/x5x;-><init>(Ll/l4g0;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p1, p0}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 96
    .line 97
    .line 98
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 99
    .line 100
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 101
    .line 102
    iget-object p0, p0, Ll/dkb;->I4:Ll/jxd0;

    .line 103
    .line 104
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 105
    .line 106
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    invoke-virtual {p1}, Ll/jl80;->show()V

    .line 110
    .line 111
    .line 112
    return-void
.end method
