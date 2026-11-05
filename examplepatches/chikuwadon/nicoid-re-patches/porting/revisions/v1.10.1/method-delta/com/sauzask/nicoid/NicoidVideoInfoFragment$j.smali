.class public Lcom/sauzask/nicoid/NicoidVideoInfoFragment$j;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/sauzask/nicoid/NicoidVideoInfoFragment;


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .registers 7

    new-instance p1, Landroid/app/AlertDialog$Builder;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$j;->c:Lcom/sauzask/nicoid/NicoidVideoInfoFragment;

    .line 1
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->b0:Landroid/app/Activity;

    .line 2
    invoke-direct {p1, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$j;->c:Lcom/sauzask/nicoid/NicoidVideoInfoFragment;

    .line 3
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->b0:Landroid/app/Activity;

    const v1, 0x7f0f01ee

    .line 4
    invoke-virtual {v0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$j;->a:Ljava/lang/String;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$j;->c:Lcom/sauzask/nicoid/NicoidVideoInfoFragment;

    .line 5
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->b0:Landroid/app/Activity;

    const v2, 0x7f0f01f0

    .line 6
    invoke-virtual {v0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    new-instance v2, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$j$a;

    invoke-direct {v2, p0}, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$j$a;-><init>(Lcom/sauzask/nicoid/NicoidVideoInfoFragment$j;)V

    invoke-virtual {p1, v0, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    invoke-virtual {p1, v1}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    invoke-virtual {p1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v4, v1}, Landroid/view/Window;->setFlags(II)V

    invoke-static {p1}, Le/e/a/PlaybackSession;->showDialog(Landroid/app/AlertDialog;)V

    return v4
.end method
