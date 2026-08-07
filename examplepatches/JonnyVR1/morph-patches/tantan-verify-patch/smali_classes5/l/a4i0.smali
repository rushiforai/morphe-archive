.class public Ll/a4i0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/a4i0$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/z3i0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroidx/cardview/widget/CardView;

.field public b:Lv/VText;

.field public c:Lv/VText_AutoFit;

.field public d:Landroidx/cardview/widget/CardView;

.field public e:Ll/z3i0;

.field public f:Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinCheckstandFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinCheckstandFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/a4i0;->f:Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinCheckstandFrag;

    .line 5
    .line 6
    return-void
.end method

.method public static bridge synthetic a(Ll/a4i0;Landroidx/cardview/widget/CardView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/a4i0;->a:Landroidx/cardview/widget/CardView;

    return-void
.end method

.method public static bridge synthetic b(Ll/a4i0;Lv/VText_AutoFit;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/a4i0;->c:Lv/VText_AutoFit;

    return-void
.end method

.method public static bridge synthetic c(Ll/a4i0;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/a4i0;->b:Lv/VText;

    return-void
.end method

.method public static bridge synthetic d(Ll/a4i0;Landroidx/cardview/widget/CardView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/a4i0;->d:Landroidx/cardview/widget/CardView;

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/a4i0;->f:Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinCheckstandFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/a4i0;->f:Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinCheckstandFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/a4i0$a;->a(Ll/a4i0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public f(Ll/z3i0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/a4i0;->e:Ll/z3i0;

    .line 2
    .line 3
    return-void
.end method

.method public i(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a4i0;->c:Lv/VText_AutoFit;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/z3i0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/a4i0;->f(Ll/z3i0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/a4i0;->e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a4i0;->c:Lv/VText_AutoFit;

    .line 2
    .line 3
    int-to-float p1, p1

    .line 4
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public r()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/a4i0;->b:Lv/VText;

    .line 2
    .line 3
    iget-object v1, p0, Ll/a4i0;->f:Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinCheckstandFrag;

    .line 4
    .line 5
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->W1:I

    .line 6
    .line 7
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Frag;->x4(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget-object p0, p0, Ll/a4i0;->f:Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinCheckstandFrag;

    .line 12
    .line 13
    invoke-static {}, Ll/l9n;->e()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    invoke-virtual {p0, v2}, Lcom/p1/mobile/android/app/Frag;->x4(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    filled-new-array {v1, p0}, [Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string v1, "%s (%s)"

    .line 26
    .line 27
    invoke-static {v1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method
