.class public Lcom/sauzask/nicoid/NicoidVideoPlayerMenuFragment$a;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sauzask/nicoid/NicoidVideoPlayerMenuFragment;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:Landroid/app/AlertDialog;

.field public final synthetic b:Landroid/view/LayoutInflater;

.field public final synthetic c:Lcom/sauzask/nicoid/NicoidVideoPlayerMenuFragment;


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 8

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p2

    const/4 v0, 0x1

    if-eq p2, v0, :cond_9

    goto/16 :goto_a2

    :cond_9
    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidVideoPlayerMenuFragment$a;->b:Landroid/view/LayoutInflater;

    const v1, 0x7f0b0025

    const/4 v2, 0x0

    invoke-virtual {p2, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    check-cast p1, Landroid/widget/EditText;

    const v1, 0x7f080086

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    const v2, 0x7f050088

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setBackgroundResource(I)V

    invoke-virtual {p1}, Landroid/widget/EditText;->getHint()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setInputType(I)V

    invoke-virtual {v1}, Landroid/widget/EditText;->requestFocus()Z

    new-instance v2, Landroid/app/AlertDialog$Builder;

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidVideoPlayerMenuFragment$a;->c:Lcom/sauzask/nicoid/NicoidVideoPlayerMenuFragment;

    .line 1
    iget-object v3, v3, Lcom/sauzask/nicoid/NicoidVideoPlayerMenuFragment;->Z:Landroid/app/Activity;

    .line 2
    invoke-direct {v2, v3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    new-instance v3, Lcom/sauzask/nicoid/NicoidVideoPlayerMenuFragment$a$a;

    invoke-direct {v3, p0, p1, v1}, Lcom/sauzask/nicoid/NicoidVideoPlayerMenuFragment$a$a;-><init>(Lcom/sauzask/nicoid/NicoidVideoPlayerMenuFragment$a;Landroid/widget/EditText;Landroid/widget/EditText;)V

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    iget-object v3, p0, Lcom/sauzask/nicoid/NicoidVideoPlayerMenuFragment$a;->c:Lcom/sauzask/nicoid/NicoidVideoPlayerMenuFragment;

    .line 3
    iget-object v3, v3, Lcom/sauzask/nicoid/NicoidVideoPlayerMenuFragment;->Z:Landroid/app/Activity;

    const v4, 0x7f0f0052

    .line 4
    invoke-virtual {v3, v4}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Lcom/sauzask/nicoid/NicoidVideoPlayerMenuFragment$a$b;

    invoke-direct {v4, p0, p1, v1}, Lcom/sauzask/nicoid/NicoidVideoPlayerMenuFragment$a$b;-><init>(Lcom/sauzask/nicoid/NicoidVideoPlayerMenuFragment$a;Landroid/widget/EditText;Landroid/widget/EditText;)V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoPlayerMenuFragment$a;->c:Lcom/sauzask/nicoid/NicoidVideoPlayerMenuFragment;

    .line 5
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoPlayerMenuFragment;->Z:Landroid/app/Activity;

    const v1, 0x7f0f002d

    .line 6
    invoke-virtual {p1, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p1

    new-instance v1, Lcom/sauzask/nicoid/NicoidVideoPlayerMenuFragment$a$c;

    invoke-direct {v1, p0}, Lcom/sauzask/nicoid/NicoidVideoPlayerMenuFragment$a$c;-><init>(Lcom/sauzask/nicoid/NicoidVideoPlayerMenuFragment$a;)V

    invoke-virtual {v2, p1, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v2, p2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoPlayerMenuFragment$a;->a:Landroid/app/AlertDialog;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoPlayerMenuFragment$a;->a:Landroid/app/AlertDialog;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoPlayerMenuFragment$a;->a:Landroid/app/AlertDialog;

    invoke-virtual {p1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/4 v1, 0x5

    invoke-virtual {p1, v1}, Landroid/view/Window;->setSoftInputMode(I)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoPlayerMenuFragment$a;->a:Landroid/app/AlertDialog;

    invoke-virtual {p1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/4 v1, 0x2

    invoke-virtual {p1, p2, v1}, Landroid/view/Window;->setFlags(II)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoPlayerMenuFragment$a;->a:Landroid/app/AlertDialog;

    invoke-virtual {p1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/16 p2, 0x50

    invoke-virtual {p1, p2}, Landroid/view/Window;->setGravity(I)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoPlayerMenuFragment$a;->a:Landroid/app/AlertDialog;

    invoke-static {p1}, Le/e/a/PlaybackSession;->showDialog(Landroid/app/AlertDialog;)V

    :goto_a2
    return v0
.end method
