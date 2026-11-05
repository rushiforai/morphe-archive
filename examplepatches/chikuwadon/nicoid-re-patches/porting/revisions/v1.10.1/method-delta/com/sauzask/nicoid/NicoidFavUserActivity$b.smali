.class public Lcom/sauzask/nicoid/NicoidFavUserActivity$b;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/widget/AdapterView$OnItemLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sauzask/nicoid/NicoidFavUserActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/sauzask/nicoid/NicoidFavUserActivity;


# virtual methods
.method public onItemLongClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)Z
    .registers 11
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

    move p3, p1

    iget-object p4, p0, Lcom/sauzask/nicoid/NicoidFavUserActivity$b;->a:Lcom/sauzask/nicoid/NicoidFavUserActivity;

    .line 1
    iget-object p5, p4, Lcom/sauzask/nicoid/NicoidFavUserActivity;->O:Landroid/view/View;

    const/4 v0, 0x0

    if-eq p2, p5, :cond_8c

    if-gez p1, :cond_d

    goto/16 :goto_8c

    .line 2
    :cond_d
    iget-object p2, p4, Lcom/sauzask/nicoid/NicoidFavUserActivity;->z:Ljava/util/ArrayList;

    .line 3
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/HashMap;

    const-string p4, "mainurl"

    invoke-virtual {p2, p4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    const-string p4, "^.*?user/([0-9]+).*?$"

    const-string p5, "$1"

    invoke-virtual {p2, p4, p5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    new-instance p4, Landroid/app/AlertDialog$Builder;

    iget-object p5, p0, Lcom/sauzask/nicoid/NicoidFavUserActivity$b;->a:Lcom/sauzask/nicoid/NicoidFavUserActivity;

    .line 4
    iget-object p5, p5, Lcom/sauzask/nicoid/NicoidFavUserActivity;->B:Landroid/app/Activity;

    .line 5
    invoke-direct {p4, p5}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object p5, p0, Lcom/sauzask/nicoid/NicoidFavUserActivity$b;->a:Lcom/sauzask/nicoid/NicoidFavUserActivity;

    .line 6
    iget-object v1, p5, Lcom/sauzask/nicoid/NicoidFavUserActivity;->B:Landroid/app/Activity;

    const v2, 0x7f0f01e8

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Object;

    .line 7
    iget-object p5, p5, Lcom/sauzask/nicoid/NicoidFavUserActivity;->z:Ljava/util/ArrayList;

    .line 8
    invoke-virtual {p5, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/HashMap;

    const-string p5, "title"

    invoke-virtual {p1, p5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    aput-object p1, v4, v0

    invoke-virtual {v1, v2, v4}, Landroid/app/Activity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    new-array p5, v0, [Ljava/lang/Object;

    invoke-static {p1, p5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p4, p1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidFavUserActivity$b;->a:Lcom/sauzask/nicoid/NicoidFavUserActivity;

    .line 9
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidFavUserActivity;->B:Landroid/app/Activity;

    const p5, 0x7f0f022d

    .line 10
    invoke-virtual {p1, p5}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p1

    new-instance p5, Lcom/sauzask/nicoid/NicoidFavUserActivity$b$a;

    invoke-direct {p5, p0, p2, p3}, Lcom/sauzask/nicoid/NicoidFavUserActivity$b$a;-><init>(Lcom/sauzask/nicoid/NicoidFavUserActivity$b;Ljava/lang/String;I)V

    invoke-virtual {p4, p1, p5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidFavUserActivity$b;->a:Lcom/sauzask/nicoid/NicoidFavUserActivity;

    .line 11
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidFavUserActivity;->B:Landroid/app/Activity;

    const p2, 0x7f0f00b3

    .line 12
    invoke-virtual {p1, p2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p1

    new-instance p2, Lcom/sauzask/nicoid/NicoidFavUserActivity$b$b;

    invoke-direct {p2, p0}, Lcom/sauzask/nicoid/NicoidFavUserActivity$b$b;-><init>(Lcom/sauzask/nicoid/NicoidFavUserActivity$b;)V

    invoke-virtual {p4, p1, p2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {p4}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    invoke-virtual {p1, v3}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    invoke-static {p1}, Le/e/a/PlaybackSession;->showDialog(Landroid/app/AlertDialog;)V

    return v3

    :cond_8c
    :goto_8c
    return v0
.end method
