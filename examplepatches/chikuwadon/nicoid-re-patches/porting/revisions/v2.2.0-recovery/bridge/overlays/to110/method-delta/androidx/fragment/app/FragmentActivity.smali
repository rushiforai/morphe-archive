.class public Landroidx/fragment/app/FragmentActivity;
.super Landroidx/activity/ComponentActivity;
.source ""

# interfaces
.implements Ld/h/d/a$b;
.implements Ld/h/d/a$c;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/fragment/app/FragmentActivity$a;
    }
.end annotation


# instance fields
.field public final g:Ld/k/a/e;

.field public final i:Ld/m/i;

.field public j:Z

.field public k:Z

.field public l:Z

.field public m:Z

.field public n:Z

.field public o:Z

.field public p:I

.field public q:Ld/e/i;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ld/e/i<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# virtual methods
.method public a(Landroidx/fragment/app/Fragment;Landroid/content/Intent;ILandroid/os/Bundle;)V
    .registers 9
    .param p2    # Landroid/content/Intent;
        .annotation build Landroid/annotation/SuppressLint;
            value = {
                "UnknownNullness"
            }
        .end annotation
    .end param

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/fragment/app/FragmentActivity;->o:Z

    const/4 v1, -0x1

    const/4 v2, 0x0

    const/4 v3, -0x1

    if-ne p3, v1, :cond_0

    :try_start_0
    invoke-static {p0, p2, v1, p4}, Ld/h/d/a;->a(Landroid/app/Activity;Landroid/content/Intent;ILandroid/os/Bundle;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iput-boolean v2, p0, Landroidx/fragment/app/FragmentActivity;->o:Z

    return-void

    :cond_0
    :try_start_1
    invoke-static {p3}, Landroidx/fragment/app/FragmentActivity;->b(I)V

    invoke-virtual {p0, p1}, Landroidx/fragment/app/FragmentActivity;->a(Landroidx/fragment/app/Fragment;)I

    move-result p1

    move v3, p1

    add-int/2addr p1, v0

    shl-int/lit8 p1, p1, 0x10

    const v0, 0xffff

    and-int/2addr p3, v0

    add-int/2addr p1, p3

    invoke-static {p0, p2, p1, p4}, Ld/h/d/a;->a(Landroid/app/Activity;Landroid/content/Intent;ILandroid/os/Bundle;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    iput-boolean v2, p0, Landroidx/fragment/app/FragmentActivity;->o:Z

    return-void

    :catchall_0
    move-exception p1

    iput-boolean v2, p0, Landroidx/fragment/app/FragmentActivity;->o:Z

    if-ltz v3, :cond_1

    iget-object v0, p0, Landroidx/fragment/app/FragmentActivity;->q:Ld/e/i;

    invoke-virtual {v0, v3}, Ld/e/i;->c(I)V

    :cond_1
    throw p1
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .registers 7

    iget-object v0, p0, Landroidx/fragment/app/FragmentActivity;->g:Ld/k/a/e;

    invoke-virtual {v0}, Ld/k/a/e;->a()V

    ushr-int/lit8 v0, p1, 0x10

    if-eqz v0, :cond_2

    add-int/lit8 v0, v0, -0x1

    iget-object v1, p0, Landroidx/fragment/app/FragmentActivity;->q:Ld/e/i;

    invoke-virtual {v1, v0}, Ld/e/i;->a(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iget-object v2, p0, Landroidx/fragment/app/FragmentActivity;->q:Ld/e/i;

    invoke-virtual {v2, v0}, Ld/e/i;->c(I)V

    const-string v0, "FragmentActivity"

    if-nez v1, :cond_0

    const-string p1, "Activity result delivered for unknown Fragment."

    invoke-static {v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    iget-object v2, p0, Landroidx/fragment/app/FragmentActivity;->g:Ld/k/a/e;

    .line 1
    iget-object v2, v2, Ld/k/a/e;->a:Ld/k/a/g;

    iget-object v2, v2, Ld/k/a/g;->e:Ld/k/a/i;

    invoke-virtual {v2, v1}, Ld/k/a/i;->b(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v2

    if-nez v2, :cond_1

    .line 2
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "Activity result no fragment exists for who: "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_1
    const v0, 0xffff

    and-int/2addr p1, v0

    invoke-virtual {v2, p1, p2, p3}, Landroidx/fragment/app/Fragment;->a(IILandroid/content/Intent;)V

    :goto_0
    return-void

    :cond_2
    invoke-static {}, Ld/h/d/a;->a()V

    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 9

    iget-object v0, p0, Landroidx/fragment/app/FragmentActivity;->g:Ld/k/a/e;

    .line 1
    iget-object v0, v0, Ld/k/a/e;->a:Ld/k/a/g;

    iget-object v1, v0, Ld/k/a/g;->e:Ld/k/a/i;

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v0, v2}, Ld/k/a/i;->a(Ld/k/a/g;Ld/k/a/d;Landroidx/fragment/app/Fragment;)V

    const/4 v0, 0x0

    if-eqz p1, :cond_3

    const-string v1, "android:support:fragments"

    .line 2
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    iget-object v2, p0, Landroidx/fragment/app/FragmentActivity;->g:Ld/k/a/e;

    .line 3
    iget-object v2, v2, Ld/k/a/e;->a:Ld/k/a/g;

    instance-of v3, v2, Ld/m/u;

    if-eqz v3, :cond_2

    iget-object v2, v2, Ld/k/a/g;->e:Ld/k/a/i;

    invoke-virtual {v2, v1}, Ld/k/a/i;->a(Landroid/os/Parcelable;)V

    const-string v1, "android:support:next_request_index"

    .line 4
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    if-ltz v1, :cond_1

    const v2, 0xfffe

    if-ge v1, v2, :cond_1

    iput v1, p0, Landroidx/fragment/app/FragmentActivity;->p:I

    const-string v1, "android:support:request_indicies"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    move-result-object v1

    const-string v2, "android:support:request_fragment_who"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    if-eqz v1, :cond_1

    if-eqz v2, :cond_1

    array-length v3, v1

    array-length v4, v2

    if-eq v3, v4, :cond_0

    goto :goto_1

    :cond_0
    array-length v4, v1

    const v5, 0xfffe

    if-gt v4, v5, :cond_1

    new-instance v3, Ld/e/i;

    invoke-direct {v3, v4}, Ld/e/i;-><init>(I)V

    iput-object v3, p0, Landroidx/fragment/app/FragmentActivity;->q:Ld/e/i;

    const/4 v3, 0x0

    :goto_0
    array-length v4, v1

    if-ge v3, v4, :cond_3

    iget-object v4, p0, Landroidx/fragment/app/FragmentActivity;->q:Ld/e/i;

    aget v5, v1, v3

    aget-object v6, v2, v3

    if-ltz v5, :cond_1

    const v4, 0xfffe

    if-ge v5, v4, :cond_1

    if-eqz v6, :cond_1

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_1

    iget-object v4, p0, Landroidx/fragment/app/FragmentActivity;->q:Ld/e/i;

    invoke-virtual {v4, v5}, Ld/e/i;->a(I)Ljava/lang/Object;

    move-result-object v4

    if-nez v4, :cond_1

    iget-object v4, p0, Landroidx/fragment/app/FragmentActivity;->q:Ld/e/i;

    invoke-virtual {v4, v5, v6}, Ld/e/i;->c(ILjava/lang/Object;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    const/4 v1, 0x0

    iput-object v1, p0, Landroidx/fragment/app/FragmentActivity;->q:Ld/e/i;

    iput v0, p0, Landroidx/fragment/app/FragmentActivity;->p:I

    const-string v1, "FragmentActivity"

    const-string v2, "Invalid requestCode mapping in savedInstanceState."

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 5
    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Your FragmentHostCallback must implement ViewModelStoreOwner to call restoreSaveState(). Call restoreAllState()  if you\'re still using retainNestedNonConfig()."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 6
    :cond_3
    :goto_2
    iget-object v1, p0, Landroidx/fragment/app/FragmentActivity;->q:Ld/e/i;

    if-nez v1, :cond_4

    new-instance v1, Ld/e/i;

    const/16 v2, 0xa

    .line 7
    invoke-direct {v1, v2}, Ld/e/i;-><init>(I)V

    .line 8
    iput-object v1, p0, Landroidx/fragment/app/FragmentActivity;->q:Ld/e/i;

    iput v0, p0, Landroidx/fragment/app/FragmentActivity;->p:I

    :cond_4
    invoke-super {p0, p1}, Landroidx/activity/ComponentActivity;->onCreate(Landroid/os/Bundle;)V

    iget-object p1, p0, Landroidx/fragment/app/FragmentActivity;->i:Ld/m/i;

    sget-object v0, Ld/m/e$a;->ON_CREATE:Ld/m/e$a;

    invoke-virtual {p1, v0}, Ld/m/i;->a(Ld/m/e$a;)V

    iget-object p1, p0, Landroidx/fragment/app/FragmentActivity;->g:Ld/k/a/e;

    .line 9
    iget-object p1, p1, Ld/k/a/e;->a:Ld/k/a/g;

    iget-object p1, p1, Ld/k/a/g;->e:Ld/k/a/i;

    invoke-virtual {p1}, Ld/k/a/i;->h()V

    return-void
.end method
