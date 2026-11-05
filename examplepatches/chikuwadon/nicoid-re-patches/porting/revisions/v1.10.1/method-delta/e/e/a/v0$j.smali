.class public final Le/e/a/v0$j;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/v0;->a(Landroid/content/Context;Ljava/lang/String;[I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/content/SharedPreferences;

.field public final synthetic b:Landroid/content/Context;

.field public final synthetic c:Landroid/widget/EditText;

.field public final synthetic d:Landroid/content/SharedPreferences$Editor;


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 5

    iget-object p1, p0, Le/e/a/v0$j;->a:Landroid/content/SharedPreferences;

    const-string v0, "search_Word"

    const-string v1, ""

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "\t"

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    array-length v0, p1

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1e

    const/4 v0, 0x0

    aget-object v0, p1, v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1e

    return-void

    :cond_1e
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Le/e/a/v0$j;->b:Landroid/content/Context;

    invoke-direct {v0, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    new-instance v2, Le/e/a/v0$j$c;

    invoke-direct {v2, p0, p1}, Le/e/a/v0$j$c;-><init>(Le/e/a/v0$j;[Ljava/lang/String;)V

    invoke-virtual {v0, p1, v2}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    iget-object v0, p0, Le/e/a/v0$j;->b:Landroid/content/Context;

    const v2, 0x7f0f020a

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    new-instance v2, Le/e/a/v0$j$b;

    invoke-direct {v2, p0}, Le/e/a/v0$j$b;-><init>(Le/e/a/v0$j;)V

    invoke-virtual {p1, v0, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    iget-object v0, p0, Le/e/a/v0$j;->b:Landroid/content/Context;

    const v2, 0x7f0f0036

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    new-instance v2, Le/e/a/v0$j$a;

    invoke-direct {v2, p0}, Le/e/a/v0$j$a;-><init>(Le/e/a/v0$j;)V

    invoke-virtual {p1, v0, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    invoke-virtual {p1, v1}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    invoke-static {p1}, Le/e/a/PlaybackSession;->showDialog(Landroid/app/AlertDialog;)V

    return-void
.end method
