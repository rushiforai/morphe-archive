.class public Le/e/a/v0$j$b;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/v0$j;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Le/e/a/v0$j;


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 4

    new-instance p1, Landroid/app/AlertDialog$Builder;

    iget-object p2, p0, Le/e/a/v0$j$b;->a:Le/e/a/v0$j;

    iget-object p2, p2, Le/e/a/v0$j;->b:Landroid/content/Context;

    invoke-direct {p1, p2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object p2, p0, Le/e/a/v0$j$b;->a:Le/e/a/v0$j;

    iget-object p2, p2, Le/e/a/v0$j;->b:Landroid/content/Context;

    const v0, 0x7f0f0209

    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    iget-object p2, p0, Le/e/a/v0$j$b;->a:Le/e/a/v0$j;

    iget-object p2, p2, Le/e/a/v0$j;->b:Landroid/content/Context;

    const v0, 0x7f0f022d

    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    new-instance v0, Le/e/a/v0$j$b$b;

    invoke-direct {v0, p0}, Le/e/a/v0$j$b$b;-><init>(Le/e/a/v0$j$b;)V

    invoke-virtual {p1, p2, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    iget-object p2, p0, Le/e/a/v0$j$b;->a:Le/e/a/v0$j;

    iget-object p2, p2, Le/e/a/v0$j;->b:Landroid/content/Context;

    const v0, 0x7f0f00b3

    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    new-instance v0, Le/e/a/v0$j$b$a;

    invoke-direct {v0, p0}, Le/e/a/v0$j$b$a;-><init>(Le/e/a/v0$j$b;)V

    invoke-virtual {p1, p2, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    invoke-static {p1}, Le/e/a/PlaybackSession;->showDialog(Landroid/app/AlertDialog;)V

    return-void
.end method
