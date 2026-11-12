.class public Lvq3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lmej;
.implements Lsni;


# instance fields
.field public final a:Lz46;

.field public final b:Lh7f;

.field public c:Lhjm;

.field public d:Lsni;

.field public final e:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 75
    invoke-direct {p0, p1, v0, v1}, Lvq3;-><init>(Landroid/content/Context;IZ)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;IZ)V
    .registers 5

    new-instance v0, Lz46;

    invoke-direct {v0, p1, p2}, Lz46;-><init>(Landroid/content/Context;I)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Lh7f;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lvq3;->b:Lh7f;

    sget-object p1, Lhjm;->b:Lhjm;

    iput-object p1, p0, Lvq3;->c:Lhjm;

    iput-object v0, p0, Lvq3;->a:Lz46;

    invoke-static {v0}, Lu8n;->e(Landroid/app/Dialog;)V

    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    if-eqz p1, :cond_21

    invoke-static {p1}, Lp8f;->w(Landroid/view/Window;)V

    :cond_21
    invoke-virtual {v0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object p1

    sget-object p2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->B()Lqwe;

    move-result-object p1

    invoke-virtual {p1, v0}, Lqwe;->a(Landroid/app/Dialog;)V

    new-instance p1, Ljz0;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p2}, Ljz0;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, p1}, Landroid/app/Dialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    new-instance p1, Lk93;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lk93;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, p1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    iput-boolean p3, p0, Lvq3;->e:Z

    iput-object p0, v0, Lz46;->t:Lvq3;

    return-void
.end method


# virtual methods
.method public final Q(Lhjm;)V
    .registers 2

    iput-object p1, p0, Lvq3;->c:Lhjm;

    iget-object p0, p0, Lvq3;->a:Lz46;

    invoke-virtual {p0}, Lzp1;->dismiss()V

    return-void
.end method

.method public final U(Landroid/view/View;)V
    .registers 5

    iget-object v0, p0, Lvq3;->a:Lz46;

    invoke-virtual {v0, p1}, Lz46;->setContentView(Landroid/view/View;)V

    const p1, 0x7f0a02d2

    invoke-virtual {v0, p1}, Lzp1;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    invoke-virtual {p0, p1}, Lvq3;->a(Landroid/view/ViewGroup;)V

    iget-boolean p0, p0, Lvq3;->e:Z

    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    instance-of v2, v1, Landroid/view/ViewGroup;

    if-eqz v2, :cond_23

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1, p0}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    :cond_23
    if-eqz p0, :cond_32

    new-instance p0, Lzq3;

    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lzq3;-><init>(B)V

    invoke-virtual {p1, p0}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    const/4 p0, 0x1

    invoke-virtual {p1, p0}, Landroid/view/View;->setClipToOutline(Z)V

    :cond_32
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    return-void
.end method

.method public final Y(Z)V
    .registers 2

    iget-object p0, p0, Lvq3;->d:Lsni;

    if-eqz p0, :cond_7

    invoke-interface {p0, p1}, Lsni;->Y(Z)V

    :cond_7
    return-void
.end method

.method public a(Landroid/view/ViewGroup;)V
    .registers 2

    invoke-static {p1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->D(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    move-result-object p0

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->K:Z

    const/4 p1, 0x3

    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->M(I)V

    return-void
.end method

.method public final getContext()Landroid/content/Context;
    .registers 1

    iget-object p0, p0, Lvq3;->a:Lz46;

    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object p0

    return-object p0
.end method

.method public final getLifecycle()Ltcc;
    .registers 1

    iget-object p0, p0, Lvq3;->a:Lz46;

    invoke-virtual {p0}, Lce5;->a()Lqdc;

    move-result-object p0

    return-object p0
.end method

.method public final i(Ly6f;)V
    .registers 2

    iget-object p0, p0, Lvq3;->b:Lh7f;

    invoke-virtual {p0, p1}, Lh7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public final x(Lsni;)V
    .registers 2

    iput-object p1, p0, Lvq3;->d:Lsni;

    return-void
.end method
