.class public Ll/g1n;
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

.method public static synthetic a(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static b(Lcom/p1/mobile/android/app/Act;Ll/x20;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->newDialog()Ll/jl80$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/p1/mobile/putong/core/member/R$string;->f:I

    .line 6
    .line 7
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ll/jl80$a;->y0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget v1, Lcom/p1/mobile/putong/core/member/R$string;->e:I

    .line 16
    .line 17
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v0, p0}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    sget v0, Ll/gbc0;->q6:I

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Ll/jl80$a;->S(I)Ll/jl80$a;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    sget v0, Lcom/p1/mobile/putong/core/member/R$string;->E1:I

    .line 32
    .line 33
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    new-instance v1, Ll/bri0;

    .line 37
    .line 38
    invoke-direct {v1, p1}, Ll/bri0;-><init>(Ll/x20;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, v0, v1}, Ll/jl80$a;->a0(ILjava/lang/Runnable;)Ll/jl80$a;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    sget p1, Lcom/p1/mobile/putong/core/member/R$string;->T0:I

    .line 46
    .line 47
    const/4 v0, 0x0

    .line 48
    new-array v0, v0, [Ljava/lang/Object;

    .line 49
    .line 50
    invoke-virtual {p0, p1, v0}, Ll/jl80$a;->V(I[Ljava/lang/Object;)Ll/jl80$a;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0}, Ll/jl80$a;->O()Ll/jl80;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    const-string v0, "p_boost_confirm_use"

    .line 67
    .line 68
    invoke-static {v0, p1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    const-string v0, "tooltips_trigger_mode"

    .line 73
    .line 74
    const-string v1, "passive"

    .line 75
    .line 76
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    filled-new-array {v0}, [Ll/pf60;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-virtual {p1, v0}, Ll/l4g0;->p([Ll/pf60;)V

    .line 85
    .line 86
    .line 87
    invoke-static {p1}, Ll/w1e;->f(Ll/l4g0;)V

    .line 88
    .line 89
    .line 90
    new-instance v0, Ll/f1n;

    .line 91
    .line 92
    invoke-direct {v0, p1}, Ll/f1n;-><init>(Ll/l4g0;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p0, v0}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p0}, Ll/jl80;->show()V

    .line 99
    .line 100
    .line 101
    return-void
.end method
