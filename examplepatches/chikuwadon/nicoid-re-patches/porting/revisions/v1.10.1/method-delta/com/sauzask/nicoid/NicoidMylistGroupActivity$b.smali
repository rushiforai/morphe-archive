.class public Lcom/sauzask/nicoid/NicoidMylistGroupActivity$b;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/widget/AdapterView$OnItemLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sauzask/nicoid/NicoidMylistGroupActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/sauzask/nicoid/NicoidMylistGroupActivity;


# virtual methods
.method public onItemLongClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)Z
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)Z"
        }
    .end annotation

    long-to-int p1, p4

    iget-object p3, p0, Lcom/sauzask/nicoid/NicoidMylistGroupActivity$b;->a:Lcom/sauzask/nicoid/NicoidMylistGroupActivity;

    .line 1
    iget-object p4, p3, Lcom/sauzask/nicoid/NicoidMylistGroupActivity;->G:Landroid/view/View;

    const/4 p5, 0x1

    if-eq p2, p4, :cond_67

    if-gez p1, :cond_b

    goto :goto_67

    .line 2
    :cond_b
    new-instance p2, Landroid/app/AlertDialog$Builder;

    .line 3
    iget-object p3, p3, Lcom/sauzask/nicoid/NicoidMylistGroupActivity;->B:Landroid/app/Activity;

    .line 4
    invoke-direct {p2, p3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object p3, p0, Lcom/sauzask/nicoid/NicoidMylistGroupActivity$b;->a:Lcom/sauzask/nicoid/NicoidMylistGroupActivity;

    const p4, 0x7f0f009a

    invoke-virtual {p3, p4}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p3

    new-array p4, p5, [Ljava/lang/Object;

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidMylistGroupActivity$b;->a:Lcom/sauzask/nicoid/NicoidMylistGroupActivity;

    .line 5
    iget-object v1, v1, Lcom/sauzask/nicoid/NicoidMylistGroupActivity;->z:Ljava/util/ArrayList;

    .line 6
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    const-string v2, "title"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, p4, v0

    invoke-static {p3, p4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    iget-object p3, p0, Lcom/sauzask/nicoid/NicoidMylistGroupActivity$b;->a:Lcom/sauzask/nicoid/NicoidMylistGroupActivity;

    const p4, 0x7f0f0050

    invoke-virtual {p3, p4}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p3

    new-instance p4, Lcom/sauzask/nicoid/NicoidMylistGroupActivity$b$a;

    invoke-direct {p4, p0, p1}, Lcom/sauzask/nicoid/NicoidMylistGroupActivity$b$a;-><init>(Lcom/sauzask/nicoid/NicoidMylistGroupActivity$b;I)V

    invoke-virtual {p2, p3, p4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidMylistGroupActivity$b;->a:Lcom/sauzask/nicoid/NicoidMylistGroupActivity;

    const p3, 0x7f0f002d

    invoke-virtual {p1, p3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p1

    new-instance p3, Lcom/sauzask/nicoid/NicoidMylistGroupActivity$b$b;

    invoke-direct {p3, p0}, Lcom/sauzask/nicoid/NicoidMylistGroupActivity$b$b;-><init>(Lcom/sauzask/nicoid/NicoidMylistGroupActivity$b;)V

    invoke-virtual {p2, p1, p3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {p2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    invoke-virtual {p1, p5}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    invoke-static {p1}, Le/e/a/PlaybackSession;->showDialog(Landroid/app/AlertDialog;)V

    :cond_67
    :goto_67
    return p5
.end method
