.class public Le/e/a/d2;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/sauzask/nicoid/NicoidVideoListFragment;


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 4

    new-instance p1, Le/e/a/CacheFile;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Le/e/a/d2;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 1
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    .line 2
    invoke-static {v0}, Le/e/a/o;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "/nicoid/"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v0, "history.json"

    invoke-direct {p1, p2, v0}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result p2

    if-eqz p2, :cond_3a

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    move-result p1

    if-eqz p1, :cond_3a

    iget-object p1, p0, Le/e/a/d2;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 3
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoListFragment;->a0:Ljava/util/ArrayList;

    .line 4
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    iget-object p1, p0, Le/e/a/d2;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 5
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoListFragment;->p0:Le/e/a/b0;

    .line 6
    invoke-virtual {p1}, Le/e/a/b0;->notifyDataSetChanged()V

    :cond_3a
    return-void
.end method
