.class public final Ls3i;
.super Lk24;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0007\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0004"
    }
    d2 = {
        "Ls3i;",
        "Lk24;",
        "<init>",
        "()V",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final f:Lzyk;

.field public g:Lj7i;


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Lk24;-><init>()V

    new-instance v0, Lyse;

    const/16 v1, 0x9

    invoke-direct {v0, p0, v1}, Lyse;-><init>(Landroidx/fragment/app/Fragment;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, p0, Ls3i;->f:Lzyk;

    return-void
.end method


# virtual methods
.method public final n0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 6

    const v0, 0x7f0d0369

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const/4 p2, 0x0

    if-eqz p1, :cond_38

    check-cast p1, Landroid/widget/FrameLayout;

    iget-object p0, p0, Ls3i;->g:Lj7i;

    if-eqz p0, :cond_32

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    new-instance v0, Lch5;

    invoke-direct {v0, p2}, Lch5;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Ld4;->m()V

    new-instance p2, Ll7i;

    invoke-direct {p2, p0, v1}, Ll7i;-><init>(Lj7i;B)V

    new-instance p0, Lue5;

    const v1, 0x4eb70229

    const/4 v2, 0x1

    invoke-direct {p0, v1, p2, v2}, Lue5;-><init>(ILjava/lang/Object;Z)V

    invoke-virtual {v0, p0}, Lch5;->o(Lkotlin/jvm/functions/Function2;)V

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    return-object p1

    :cond_32
    const-string p0, "Required value was null."

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-object p2

    :cond_38
    const-string p0, "rootView"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-object p2
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .registers 12

    invoke-super {p0, p1}, Lryl;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireArguments()Landroid/os/Bundle;

    move-result-object p1

    invoke-static {p1}, Lp37;->E(Landroid/os/Bundle;)Ln37;

    move-result-object p1

    check-cast p1, Ln3i;

    iget-object v0, p0, Ls3i;->f:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lt3i;

    iget-object v1, v1, Lt3i;->b:Ly3i;

    iget-object p1, p1, Ln3i;->a:Lp4i;

    new-instance v2, Le6g;

    const/4 v8, 0x0

    const/16 v9, 0x8

    const/4 v3, 0x0

    const-class v5, Ls3i;

    const-string v6, "close"

    const-string v7, "close()V"

    move-object v4, p0

    invoke-direct/range {v2 .. v9}, Le6g;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-interface {v1, v4, p1, v2}, Ly3i;->c(Ls3i;Lp4i;Le6g;)Lj7i;

    move-result-object p0

    iput-object p0, v4, Ls3i;->g:Lj7i;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lt3i;

    iget-object p0, p0, Lt3i;->c:Lru9;

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    iget-object p1, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast p1, Landroid/content/SharedPreferences$Editor;

    const-string v0, "rewards.has_opened_ui"

    const/4 v1, 0x1

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    return-void
.end method

.method public final onDestroy()V
    .registers 2

    invoke-super {p0}, Lryl;->onDestroy()V

    const/4 v0, 0x0

    iput-object v0, p0, Ls3i;->g:Lj7i;

    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 4

    invoke-super {p0, p1, p2}, Lk24;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    new-instance p0, Lj9h;

    const/16 p2, 0x13

    invoke-direct {p0, p2}, Lj9h;-><init>(B)V

    sget-object p2, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-static {p1, p0}, Lh5n;->c(Landroid/view/View;Lbcf;)V

    new-instance p0, Ltm9;

    const/4 p2, 0x1

    invoke-direct {p0, p1, p2}, Ltm9;-><init>(Landroid/view/View;B)V

    invoke-virtual {p1, p0}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    new-instance p0, Ldxh;

    const p2, 0x7f0408f8

    invoke-direct {p0, p2}, Ldxh;-><init>(I)V

    new-instance p2, Ldxh;

    const v0, 0x7f040741

    invoke-direct {p2, v0}, Ldxh;-><init>(I)V

    invoke-static {p1, p0, p2}, Lcgh;->h(Landroid/view/View;Ldxh;Ldxh;)V

    return-void
.end method

.method public final setArguments(Landroid/os/Bundle;)V
    .registers 3

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    if-eqz p1, :cond_2a

    invoke-static {p1}, Lp37;->E(Landroid/os/Bundle;)Ln37;

    move-result-object p1

    check-cast p1, Ln3i;

    iget-object p1, p1, Ln3i;->a:Lp4i;

    iget-object v0, p1, Lp4i;->b:Ljava/lang/String;

    if-eqz v0, :cond_2a

    invoke-static {v0}, Lbwg;->H(Ljava/lang/String;)Lgpm;

    move-result-object v0

    if-nez v0, :cond_19

    const/4 v0, 0x0

    goto :goto_1d

    :cond_19
    invoke-static {v0}, Lqs7;->A(Lgpm;)Lek6;

    move-result-object v0

    :goto_1d
    if-eqz v0, :cond_2a

    iget-object p0, p0, Ls3i;->g:Lj7i;

    if-eqz p0, :cond_2a

    iget-boolean p1, p1, Lp4i;->c:Z

    check-cast p0, Lt7i;

    invoke-virtual {p0, v0, p1}, Lt7i;->e(Lek6;Z)V

    :cond_2a
    return-void
.end method
