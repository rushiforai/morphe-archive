.class public final Lr4i;
.super Luq3;
.source "SourceFile"


# instance fields
.field public final a:Lgjm;

.field public final b:Lgw3;

.field public c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;

.field public final e:Lx4i;

.field public final f:Lr2i;

.field public final g:Lorm;

.field public final h:Lua7;

.field public i:Lpt1;

.field public j:J

.field public k:Lt0i;


# direct methods
.method public constructor <init>(Lgjm;Lx4i;Lr2i;Lgw3;Lekc;Lorm;)V
    .registers 8

    sget-object v0, Ls4i;->a:Ls4i;

    sget-object v0, Ls4i;->b:Ls4i;

    invoke-direct {p0}, Luq3;-><init>()V

    iput-object p1, p0, Lr4i;->a:Lgjm;

    iput-object p4, p0, Lr4i;->b:Lgw3;

    iput-object v0, p0, Lr4i;->c:Ljava/lang/Object;

    iput-object p2, p0, Lr4i;->e:Lx4i;

    iput-object p3, p0, Lr4i;->f:Lr2i;

    iput-object p6, p0, Lr4i;->g:Lorm;

    new-instance p2, Lua7;

    invoke-direct {p2, p0, p1}, Lua7;-><init>(Landroidx/fragment/app/Fragment;Lgjm;)V

    iput-object p2, p0, Lr4i;->h:Lua7;

    new-instance p1, Lrmg;

    const/16 p2, 0x19

    invoke-direct {p1, p0, p2}, Lrmg;-><init>(Ljava/lang/Object;B)V

    new-instance p2, Liwa;

    const/16 p3, 0x1d

    invoke-direct {p2, p1, p3}, Liwa;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p5, p0, p2}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method


# virtual methods
.method public final g0(Landroid/content/DialogInterface;)V
    .registers 3

    invoke-super {p0, p1}, Landroidx/fragment/app/i;->onDismiss(Landroid/content/DialogInterface;)V

    iget-object p1, p0, Lr4i;->c:Ljava/lang/Object;

    iget-object v0, p0, Lr4i;->d:Ljava/lang/Object;

    if-eqz v0, :cond_a

    return-void

    :cond_a
    iput-object p1, p0, Lr4i;->d:Ljava/lang/Object;

    iget-object v0, p0, Lr4i;->h:Lua7;

    invoke-virtual {v0}, Lua7;->p()Ln37;

    move-result-object v0

    check-cast v0, Lt4i;

    const-class v0, Lt4i;

    iget-object p0, p0, Lr4i;->a:Lgjm;

    invoke-virtual {p0, v0, p1}, Lgjm;->h(Ljava/lang/Class;Ljava/lang/Object;)V

    return-void
.end method

.method public final h0(J)V
    .registers 6

    iget-object v0, p0, Lr4i;->i:Lpt1;

    if-nez v0, :cond_5

    const/4 v0, 0x0

    :cond_5
    iget-object v0, v0, Lpt1;->e:Ljava/lang/Object;

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p0

    const/4 v2, 0x1

    invoke-static {p0, p1, p2, v2}, Lupj;->o(Landroid/content/Context;JZ)Landroid/text/SpannableString;

    move-result-object p0

    new-array p1, v2, [Ljava/lang/CharSequence;

    const/4 p2, 0x0

    aput-object p0, p1, p2

    const p0, 0x7f140ecd

    invoke-static {v1, p0, p1}, Lphj;->X(Landroid/content/Context;I[Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .registers 13

    new-instance p1, Ltq3;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f150198

    invoke-direct {p1, v0, v1}, Ltq3;-><init>(Landroid/content/Context;I)V

    const v0, 0x7f0d036a

    invoke-virtual {p1, v0}, Ltq3;->setContentView(I)V

    iget-object v0, p1, Ltq3;->g:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    if-nez v0, :cond_19

    invoke-virtual {p1}, Ltq3;->f()V

    :cond_19
    iget-object v0, p1, Ltq3;->g:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->M(I)V

    iget-object v0, p1, Ltq3;->g:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    if-nez v0, :cond_26

    invoke-virtual {p1}, Ltq3;->f()V

    :cond_26
    iget-object v0, p1, Ltq3;->g:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->K:Z

    const v0, 0x7f0a0a49

    invoke-virtual {p1, v0}, Landroid/app/Dialog;->requireViewById(I)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f0a014a

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v5, v2

    check-cast v5, Landroid/widget/TextView;

    if-eqz v5, :cond_7d

    const v1, 0x7f0a06b5

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v6, v2

    check-cast v6, Landroid/widget/TextView;

    if-eqz v6, :cond_7d

    const v1, 0x7f0a097d

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    if-eqz v7, :cond_7d

    move-object v4, v0

    check-cast v4, Landroidx/constraintlayout/widget/ConstraintLayout;

    const v1, 0x7f0a06c5

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v8, v2

    check-cast v8, Landroid/widget/TextView;

    if-eqz v8, :cond_7d

    const v1, 0x7f0a0c55

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v9, v2

    check-cast v9, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    if-eqz v9, :cond_7d

    new-instance v3, Lpt1;

    const/16 v10, 0x10

    invoke-direct/range {v3 .. v10}, Lpt1;-><init>(Landroid/view/ViewGroup;Landroid/view/View;Ljava/lang/Object;Landroid/view/View;Landroid/view/View;Landroid/view/View;B)V

    iput-object v3, p0, Lr4i;->i:Lpt1;

    iget-object p0, p0, Lr4i;->b:Lgw3;

    invoke-virtual {p0, p1}, Lgw3;->a(Landroid/app/Dialog;)V

    return-object p1

    :cond_7d
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final onDismiss(Landroid/content/DialogInterface;)V
    .registers 10

    invoke-virtual {p0, p1}, Lr4i;->g0(Landroid/content/DialogInterface;)V

    iget-object p1, p0, Lr4i;->k:Lt0i;

    const/16 v0, 0x17

    sget-object v1, Llo0;->c:Llo0;

    sget-object v2, Llo0;->b:Llo0;

    const/4 v3, 0x1

    iget-object v4, p0, Lr4i;->g:Lorm;

    iget-object v5, p0, Lr4i;->h:Lua7;

    if-eqz p1, :cond_50

    invoke-virtual {v5}, Lua7;->p()Ln37;

    move-result-object p0

    check-cast p0, Lt4i;

    iget-object p0, p0, Lt4i;->b:Lq4i;

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    if-eqz p0, :cond_28

    if-ne p0, v3, :cond_24

    move-object v1, v2

    goto :goto_28

    :cond_24
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_28
    :goto_28
    iget-object p0, p1, Lt0i;->a:Ljava/lang/Object;

    instance-of p0, p0, Lq0i;

    if-nez p0, :cond_31

    sget-object p0, Lno0;->b:Lno0;

    goto :goto_33

    :cond_31
    sget-object p0, Lno0;->c:Lno0;

    :goto_33
    check-cast v4, Lx5f;

    iget-boolean p1, v4, Lx5f;->h:Z

    if-eqz p1, :cond_94

    iget-object p1, v4, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v2

    new-instance v3, Lck0;

    invoke-direct {v3, p1, v2}, Lck0;-><init>(Lzpa;Lx56;)V

    new-instance p1, Ljkc;

    invoke-direct {p1, v1, p0, v0}, Ljkc;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v3, p1}, Lck0;->b(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v4, v2}, Lx5f;->U0(Lx56;)V

    return-void

    :cond_50
    iget-wide p0, p0, Lr4i;->j:J

    invoke-virtual {v5}, Lua7;->p()Ln37;

    move-result-object v6

    check-cast v6, Lt4i;

    iget-object v6, v6, Lt4i;->a:Lk15;

    iget-wide v6, v6, Lk15;->b:J

    cmp-long p0, p0, v6

    if-gez p0, :cond_94

    invoke-virtual {v5}, Lua7;->p()Ln37;

    move-result-object p0

    check-cast p0, Lt4i;

    iget-object p0, p0, Lt4i;->b:Lq4i;

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    if-eqz p0, :cond_76

    if-ne p0, v3, :cond_72

    move-object v1, v2

    goto :goto_76

    :cond_72
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_76
    :goto_76
    check-cast v4, Lx5f;

    iget-boolean p0, v4, Lx5f;->h:Z

    if-eqz p0, :cond_94

    iget-object p0, v4, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p1

    new-instance v2, Lck0;

    invoke-direct {v2, p0, p1}, Lck0;-><init>(Lzpa;Lx56;)V

    new-instance p0, Ljkc;

    sget-object v3, Lno0;->d:Lno0;

    invoke-direct {p0, v1, v3, v0}, Ljkc;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v2, p0}, Lck0;->b(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v4, p1}, Lx5f;->U0(Lx56;)V

    :cond_94
    return-void
.end method
