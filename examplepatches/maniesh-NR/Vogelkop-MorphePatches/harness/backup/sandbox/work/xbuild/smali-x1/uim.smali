.class public abstract Luim;
.super Laq1;
.source "SourceFile"

# interfaces
.implements Lrim;


# instance fields
.field public final a:Lbxl;

.field public b:Ltim;

.field public c:Lhjm;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Laq1;-><init>()V

    new-instance v0, Lbxl;

    invoke-direct {v0, p0}, Lbxl;-><init>(Luim;)V

    iput-object v0, p0, Luim;->a:Lbxl;

    sget-object v0, Lhjm;->b:Lhjm;

    iput-object v0, p0, Luim;->c:Lhjm;

    return-void
.end method


# virtual methods
.method public g0(Landroid/os/Bundle;)Landroid/app/Dialog;
    .registers 2

    invoke-super {p0, p1}, Laq1;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;

    move-result-object p0

    return-object p0
.end method

.method public final h0()V
    .registers 2

    sget-object v0, Lhjm;->a:Lhjm;

    iput-object v0, p0, Luim;->c:Lhjm;

    invoke-virtual {p0}, Landroidx/fragment/app/i;->dismiss()V

    return-void
.end method

.method public final onCancel(Landroid/content/DialogInterface;)V
    .registers 2

    sget-object p1, Lhjm;->b:Lhjm;

    iput-object p1, p0, Luim;->c:Lhjm;

    return-void
.end method

.method public final onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .registers 4

    invoke-virtual {p0, p1}, Luim;->g0(Landroid/os/Bundle;)Landroid/app/Dialog;

    move-result-object p1

    invoke-static {p1}, Lu8n;->e(Landroid/app/Dialog;)V

    invoke-virtual {p1}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->B()Lqwe;

    move-result-object v0

    invoke-virtual {v0, p1}, Lqwe;->a(Landroid/app/Dialog;)V

    invoke-static {p1}, Lo0g;->N0(Landroid/app/Dialog;)V

    new-instance v0, Lsim;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1, v0}, Landroid/app/Dialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    sget-object v1, Lr5n;->a:Ljava/util/WeakHashMap;

    iget-object p0, p0, Luim;->a:Lbxl;

    invoke-static {v0, p0}, Lm5n;->a(Landroid/view/View;Lq5n;)V

    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p0

    invoke-static {p0}, Lq9n;->i(Landroid/view/View;)V

    return-object p1
.end method

.method public onDestroy()V
    .registers 3

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroy()V

    iget-object v0, p0, Luim;->b:Ltim;

    if-eqz v0, :cond_c

    iget-object v1, p0, Luim;->c:Lhjm;

    invoke-virtual {v0, v1}, Ld63;->finish(Lhjm;)V

    :cond_c
    invoke-virtual {p0}, Landroidx/fragment/app/i;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    if-eqz v0, :cond_25

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    sget-object v1, Lr5n;->a:Ljava/util/WeakHashMap;

    iget-object p0, p0, Luim;->a:Lbxl;

    invoke-static {v0, p0}, Lm5n;->e(Landroid/view/View;Lq5n;)V

    :cond_25
    return-void
.end method
