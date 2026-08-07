.class public Ll/ad0;
.super Ll/lbl0;
.source "SourceFile"


# static fields
.field public static a:Ll/jxd0;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ll/jxd0;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "video_chat_agreement"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ll/mbs;->o0()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 22
    .line 23
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 24
    .line 25
    .line 26
    sput-object v0, Ll/ad0;->a:Ll/jxd0;

    .line 27
    .line 28
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/lbl0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/android/app/Act;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/it0;->D(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic l(Ll/ad0;Ll/jl80;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/ad0;->r(Ll/jl80;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic m(Ll/ad0;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ad0;->s(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic n(Ll/ad0;Ll/jl80;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/ad0;->q(Ll/jl80;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/lbl0;->a(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/ad0;->a:Ll/jxd0;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Ljava/lang/Boolean;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ll/lbl0;->e(Lcom/p1/mobile/android/app/Act;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-virtual {p0, p1}, Ll/ad0;->o(Lcom/p1/mobile/android/app/Act;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public f()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "AgreementChecker"

    .line 2
    .line 3
    return-object p0
.end method

.method public final o(Lcom/p1/mobile/android/app/Act;)V
    .locals 4

    .line 1
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Ll/xec0;->J1:I

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
    new-instance v1, Ll/jl80$a;

    .line 13
    .line 14
    invoke-direct {v1, p1}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1, v0}, Ll/jl80$a;->R(Landroid/view/View;)Ll/jl80$a;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v1}, Ll/jl80$a;->O()Ll/jl80;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const/4 v2, 0x0

    .line 26
    invoke-virtual {v1, v2}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 27
    .line 28
    .line 29
    new-instance v2, Ll/wc0;

    .line 30
    .line 31
    invoke-direct {v2, p1}, Ll/wc0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1, v2}, Landroid/app/Dialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1}, Ll/jl80;->show()V

    .line 38
    .line 39
    .line 40
    sget v2, Ll/ldc0;->I:I

    .line 41
    .line 42
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    new-instance v3, Ll/xc0;

    .line 47
    .line 48
    invoke-direct {v3, p0, v1, p1}, Ll/xc0;-><init>(Ll/ad0;Ll/jl80;Lcom/p1/mobile/android/app/Act;)V

    .line 49
    .line 50
    .line 51
    invoke-static {v2, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 52
    .line 53
    .line 54
    sget v2, Ll/ldc0;->A:I

    .line 55
    .line 56
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    new-instance v3, Ll/yc0;

    .line 61
    .line 62
    invoke-direct {v3, p0, v1, p1}, Ll/yc0;-><init>(Ll/ad0;Ll/jl80;Lcom/p1/mobile/android/app/Act;)V

    .line 63
    .line 64
    .line 65
    invoke-static {v2, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 66
    .line 67
    .line 68
    sget v1, Ll/ldc0;->f:I

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    new-instance v1, Ll/zc0;

    .line 75
    .line 76
    invoke-direct {v1, p0, p1}, Ll/zc0;-><init>(Ll/ad0;Lcom/p1/mobile/android/app/Act;)V

    .line 77
    .line 78
    .line 79
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public final p(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    new-instance p0, Ll/sej0;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/sej0;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/efv;->k()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p0, p1}, Ll/sej0;->j(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic q(Ll/jl80;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 1

    .line 1
    sget-object p3, Ll/ad0;->a:Ll/jxd0;

    .line 2
    .line 3
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {p3, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Ll/g1e;->dismiss()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p2}, Ll/lbl0;->e(Lcom/p1/mobile/android/app/Act;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic r(Ll/jl80;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    const-string p1, "cancel"

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/lbl0;->b(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    invoke-static {p2}, Ll/it0;->D(Lcom/p1/mobile/android/app/Act;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic s(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ad0;->p(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
