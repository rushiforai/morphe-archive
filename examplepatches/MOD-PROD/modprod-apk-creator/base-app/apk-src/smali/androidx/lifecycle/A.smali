.class public Landroidx/lifecycle/A;
.super Landroid/app/Fragment;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/lifecycle/A$a;
    }
.end annotation


# static fields
.field public static final synthetic b:I


# instance fields
.field public a:LC/j;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroidx/lifecycle/k;)V
    .locals 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-ge v0, v1, :cond_0

    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const-string v1, "activity"

    invoke-static {v0, v1}, Lb0/c;->d(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v0, p1}, Landroidx/lifecycle/y;->a(Landroid/app/Activity;Landroidx/lifecycle/k;)V

    :cond_0
    return-void
.end method

.method public final onActivityCreated(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Landroid/app/Fragment;->onActivityCreated(Landroid/os/Bundle;)V

    sget-object p1, Landroidx/lifecycle/k;->ON_CREATE:Landroidx/lifecycle/k;

    invoke-virtual {p0, p1}, Landroidx/lifecycle/A;->a(Landroidx/lifecycle/k;)V

    return-void
.end method

.method public final onDestroy()V
    .locals 1

    invoke-super {p0}, Landroid/app/Fragment;->onDestroy()V

    sget-object v0, Landroidx/lifecycle/k;->ON_DESTROY:Landroidx/lifecycle/k;

    invoke-virtual {p0, v0}, Landroidx/lifecycle/A;->a(Landroidx/lifecycle/k;)V

    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/lifecycle/A;->a:LC/j;

    return-void
.end method

.method public final onPause()V
    .locals 1

    invoke-super {p0}, Landroid/app/Fragment;->onPause()V

    sget-object v0, Landroidx/lifecycle/k;->ON_PAUSE:Landroidx/lifecycle/k;

    invoke-virtual {p0, v0}, Landroidx/lifecycle/A;->a(Landroidx/lifecycle/k;)V

    return-void
.end method

.method public final onResume()V
    .locals 1

    invoke-super {p0}, Landroid/app/Fragment;->onResume()V

    iget-object v0, p0, Landroidx/lifecycle/A;->a:LC/j;

    if-eqz v0, :cond_0

    iget-object v0, v0, LC/j;->b:Ljava/lang/Object;

    check-cast v0, Landroidx/lifecycle/x;

    invoke-virtual {v0}, Landroidx/lifecycle/x;->b()V

    :cond_0
    sget-object v0, Landroidx/lifecycle/k;->ON_RESUME:Landroidx/lifecycle/k;

    invoke-virtual {p0, v0}, Landroidx/lifecycle/A;->a(Landroidx/lifecycle/k;)V

    return-void
.end method

.method public final onStart()V
    .locals 3

    invoke-super {p0}, Landroid/app/Fragment;->onStart()V

    iget-object v0, p0, Landroidx/lifecycle/A;->a:LC/j;

    if-eqz v0, :cond_0

    iget-object v0, v0, LC/j;->b:Ljava/lang/Object;

    check-cast v0, Landroidx/lifecycle/x;

    iget v1, v0, Landroidx/lifecycle/x;->a:I

    const/4 v2, 0x1

    add-int/2addr v1, v2

    iput v1, v0, Landroidx/lifecycle/x;->a:I

    if-ne v1, v2, :cond_0

    iget-boolean v1, v0, Landroidx/lifecycle/x;->d:Z

    if-eqz v1, :cond_0

    iget-object v1, v0, Landroidx/lifecycle/x;->f:Landroidx/lifecycle/s;

    sget-object v2, Landroidx/lifecycle/k;->ON_START:Landroidx/lifecycle/k;

    invoke-virtual {v1, v2}, Landroidx/lifecycle/s;->d(Landroidx/lifecycle/k;)V

    const/4 v1, 0x0

    iput-boolean v1, v0, Landroidx/lifecycle/x;->d:Z

    :cond_0
    sget-object v0, Landroidx/lifecycle/k;->ON_START:Landroidx/lifecycle/k;

    invoke-virtual {p0, v0}, Landroidx/lifecycle/A;->a(Landroidx/lifecycle/k;)V

    return-void
.end method

.method public final onStop()V
    .locals 1

    invoke-super {p0}, Landroid/app/Fragment;->onStop()V

    sget-object v0, Landroidx/lifecycle/k;->ON_STOP:Landroidx/lifecycle/k;

    invoke-virtual {p0, v0}, Landroidx/lifecycle/A;->a(Landroidx/lifecycle/k;)V

    return-void
.end method
