.class public Ld/m/p;
.super Landroid/app/Fragment;
.source ""


# direct methods
.method public static a(Landroid/app/Activity;)V
    .registers 4

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-lt v0, v1, :cond_0

    invoke-static {p0}, Ld/m/LifecycleCallbacks235;->register(Landroid/app/Activity;)V

    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p0

    const-string v0, "androidx.lifecycle.LifecycleDispatcher.report_fragment_tag"

    invoke-virtual {p0, v0}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v1

    if-nez v1, :cond_1

    invoke-virtual {p0}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v1

    new-instance v2, Ld/m/p;

    invoke-direct {v2}, Ld/m/p;-><init>()V

    invoke-virtual {v1, v2, v0}, Landroid/app/FragmentTransaction;->add(Landroid/app/Fragment;Ljava/lang/String;)Landroid/app/FragmentTransaction;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/FragmentTransaction;->commit()I

    invoke-virtual {p0}, Landroid/app/FragmentManager;->executePendingTransactions()Z

    :cond_1
    return-void
.end method

.method public static dispatch235(Landroid/app/Activity;Ld/m/e$a;)V
    .registers 4

    move-object v0, p0

    instance-of v1, v0, Ld/m/j;

    if-eqz v1, :cond_0

    check-cast v0, Ld/m/j;

    invoke-interface {v0}, Ld/m/j;->b()Ld/m/i;

    move-result-object v0

    invoke-virtual {v0, p1}, Ld/m/i;->a(Ld/m/e$a;)V

    return-void

    :cond_0
    instance-of v1, v0, Ld/m/h;

    if-eqz v1, :cond_1

    check-cast v0, Ld/m/h;

    invoke-interface {v0}, Ld/m/h;->b()Ld/m/e;

    move-result-object v0

    instance-of v1, v0, Ld/m/i;

    if-eqz v1, :cond_1

    check-cast v0, Ld/m/i;

    invoke-virtual {v0, p1}, Ld/m/i;->a(Ld/m/e$a;)V

    :cond_1
    return-void
.end method


# virtual methods
.method public final a(Ld/m/e$a;)V
    .registers 4

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-ge v0, v1, :cond_0

    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0, p1}, Ld/m/p;->dispatch235(Landroid/app/Activity;Ld/m/e$a;)V

    :cond_0
    return-void
.end method
