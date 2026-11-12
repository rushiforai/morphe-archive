.class public Lsfn;
.super Lblj;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lblj;-><init>()V

    return-void
.end method


# virtual methods
.method public final l0()V
    .registers 6

    iget-object v0, p0, Lblj;->i:Lps5;

    const v1, 0x7f1413fb

    invoke-virtual {p0, v1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3, v3, v1}, Lbud;->a(IIILjava/lang/CharSequence;)Lqtd;

    iget-object v0, p0, Lblj;->i:Lps5;

    const v1, 0x7f1413fc

    invoke-virtual {p0, v1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v2, v2, v3, v1}, Lbud;->a(IIILjava/lang/CharSequence;)Lqtd;

    iget-object v0, p0, Lblj;->i:Lps5;

    const v1, 0x7f1413fd

    invoke-virtual {p0, v1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v4, 0x2

    invoke-virtual {v0, v2, v4, v3, v1}, Lbud;->a(IIILjava/lang/CharSequence;)Lqtd;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->R()Lydn;

    move-result-object v0

    iget-object v0, v0, Lydn;->c:Lgfn;

    invoke-interface {v0}, Lgfn;->getProtocol()I

    move-result v0

    iget-object p0, p0, Lblj;->i:Lps5;

    invoke-virtual {p0, v0}, Lbud;->findItem(I)Landroid/view/MenuItem;

    move-result-object p0

    if-eqz p0, :cond_48

    invoke-interface {p0, v2}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    :cond_48
    return-void
.end method

.method public final m0(I)V
    .registers 3

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p0

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->R()Lydn;

    move-result-object p0

    iget-object v0, p0, Lydn;->c:Lgfn;

    invoke-interface {v0, p1}, Lgfn;->c(I)Lgfn;

    move-result-object p1

    invoke-interface {p1}, Lgfn;->d()V

    iget-object p1, p0, Lydn;->d:Lvdn;

    iget-boolean p1, p1, Lvdn;->a:Z

    if-eqz p1, :cond_22

    invoke-virtual {p0}, Lydn;->f()V

    :cond_22
    return-void
.end method
