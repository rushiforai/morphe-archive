.class public final Lcom/sauzask/nicoid/NicoidTopActivity$b;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sauzask/nicoid/NicoidTopActivity;->a(Landroid/content/Context;Landroid/widget/ListView;Z)Landroid/widget/ListView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/util/ArrayList;

.field public final synthetic b:Landroid/content/Context;


# direct methods
.method public static isSamePage(Landroid/content/Context;Landroid/content/Intent;)Z
    .registers 8

    const/4 v0, 0x0

    move-object v5, p1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v5}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v2

    if-eqz v2, :cond_48

    invoke-virtual {v2}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_48

    const-string v3, "com.sauzask.nicoid.NicoidVideoListActivity"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_47

    check-cast p0, Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    if-eqz p1, :cond_48

    const-string v1, "type"

    const/4 v2, -0x1

    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    invoke-virtual {v5, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    if-ne v3, v4, :cond_48

    const-string v1, "url"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_48

    :cond_47
    const/4 v0, 0x1

    :cond_48
    return v0
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    long-to-int p1, p4

    if-gez p1, :cond_4

    return-void

    :cond_4
    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidTopActivity$b;->a:Ljava/util/ArrayList;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/HashMap;

    const-string p3, "intent"

    invoke-virtual {p2, p3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/content/Intent;

    if-nez p2, :cond_b4

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidTopActivity$b;->a:Ljava/util/ArrayList;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/HashMap;

    const-string p2, "type"

    invoke-virtual {p1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    const/4 p2, 0x1

    const/4 p3, 0x4

    if-eq p1, p3, :cond_3a

    const/4 p3, 0x5

    if-eq p1, p3, :cond_40

    if-eq p1, p2, :cond_ad

    const/4 p3, 0x2

    if-eq p1, p3, :cond_53

    const/4 p2, 0x3

    if-eq p1, p2, :cond_46

    return-void

    :cond_3a
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidTopActivity$b;->b:Landroid/content/Context;

    invoke-static {p1}, Le/e/a/ModernDebug;->restart(Landroid/content/Context;)V

    return-void

    :cond_40
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidTopActivity$b;->b:Landroid/content/Context;

    invoke-static {p1}, Le/e/a/ModernDebug;->share(Landroid/content/Context;)V

    return-void

    :cond_46
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidTopActivity$b;->b:Landroid/content/Context;

    new-instance p2, Landroid/content/Intent;

    const-class p3, Lcom/sauzask/nicoid/NicoidChormecastSenderService;

    invoke-direct {p2, p1, p3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p1, p2}, Landroid/content/Context;->stopService(Landroid/content/Intent;)Z

    return-void

    :cond_53
    new-instance p1, Landroid/widget/EditText;

    iget-object p3, p0, Lcom/sauzask/nicoid/NicoidTopActivity$b;->b:Landroid/content/Context;

    invoke-direct {p1, p3}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    invoke-static {p3}, Le/e/a/DynamicTheme;->dialogFooterColor(Landroid/content/Context;)I

    move-result p4

    invoke-virtual {p1, p4}, Landroid/widget/EditText;->setBackgroundColor(I)V

    iget-object p3, p0, Lcom/sauzask/nicoid/NicoidTopActivity$b;->b:Landroid/content/Context;

    const p4, 0x7f0f01cb

    invoke-virtual {p3, p4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p3}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    invoke-virtual {p1, p2}, Landroid/widget/EditText;->setInputType(I)V

    invoke-virtual {p1}, Landroid/widget/EditText;->requestFocus()Z

    new-instance p3, Landroid/app/AlertDialog$Builder;

    iget-object p4, p0, Lcom/sauzask/nicoid/NicoidTopActivity$b;->b:Landroid/content/Context;

    invoke-direct {p3, p4}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object p4, p0, Lcom/sauzask/nicoid/NicoidTopActivity$b;->b:Landroid/content/Context;

    const p5, 0x7f0f01cd

    invoke-virtual {p4, p5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p4

    new-instance p5, Lcom/sauzask/nicoid/NicoidTopActivity$b$a;

    invoke-direct {p5, p0, p1}, Lcom/sauzask/nicoid/NicoidTopActivity$b$a;-><init>(Lcom/sauzask/nicoid/NicoidTopActivity$b;Landroid/widget/EditText;)V

    invoke-virtual {p3, p4, p5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    iget-object p4, p0, Lcom/sauzask/nicoid/NicoidTopActivity$b;->b:Landroid/content/Context;

    const p5, 0x7f0f01cc

    invoke-virtual {p4, p5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p4

    new-instance p5, Lcom/sauzask/nicoid/NicoidTopActivity$b$b;

    invoke-direct {p5, p0, p1}, Lcom/sauzask/nicoid/NicoidTopActivity$b$b;-><init>(Lcom/sauzask/nicoid/NicoidTopActivity$b;Landroid/widget/EditText;)V

    invoke-virtual {p3, p4, p5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {p3, p1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {p3}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    invoke-static {p1}, Le/e/a/PlaybackSession;->showDialog(Landroid/app/AlertDialog;)V

    invoke-static {p1}, Le/e/a/DynamicTheme;->compactDialogButtons(Landroid/app/AlertDialog;)V

    return-void

    :cond_ad
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidTopActivity$b;->b:Landroid/content/Context;

    const/4 p2, 0x0

    invoke-static {p1, p2, p2}, Le/e/a/v0;->a(Landroid/content/Context;Ljava/lang/String;[I)V

    return-void

    :cond_b4
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidTopActivity$b;->b:Landroid/content/Context;

    invoke-static {p1, p2}, Lcom/sauzask/nicoid/NicoidTopActivity$b;->isSamePage(Landroid/content/Context;Landroid/content/Intent;)Z

    move-result p3

    if-nez p3, :cond_bf

    invoke-static {p1, p2}, Le/e/a/CacheFolders;->startActivity(Landroid/content/Context;Landroid/content/Intent;)V

    :cond_bf
    return-void
.end method
