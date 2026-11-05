.class public Le/e/a/g0;
.super Ljava/lang/Object;
.source ""


# static fields
.field public static n:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Le/e/a/h0;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public a:Landroid/content/Context;

.field public b:Lorg/apache/http/client/CookieStore;

.field public c:Ljava/util/concurrent/ExecutorService;

.field public d:Landroid/os/Handler;

.field public e:Z

.field public f:Le/e/a/v;

.field public g:Le/e/a/l3/f;

.field public h:Landroid/content/SharedPreferences;

.field public i:Landroid/content/SharedPreferences$Editor;

.field public j:Le/e/a/i0;

.field public k:Landroid/widget/ListView;

.field public l:Le/e/a/r;

.field public m:Landroid/widget/ListView;


# virtual methods
.method public a(Le/e/a/q;Le/e/a/h0;)V
    .registers 11

    :try_start_0
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Le/e/a/g0;->a:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    new-array v2, v1, [I

    const/4 v3, 0x0

    aput v3, v2, v3

    iget-object v4, p0, Le/e/a/g0;->a:Landroid/content/Context;

    const-string v5, "layout_inflater"

    invoke-virtual {v4, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/LayoutInflater;

    const v5, 0x7f0b002c

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v4

    const v5, 0x7f080086

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/EditText;

    invoke-virtual {v5, v1}, Landroid/widget/EditText;->setInputType(I)V

    if-eqz p2, :cond_32

    iget-object v1, p2, Le/e/a/h0;->b:Ljava/lang/String;

    invoke-virtual {v5, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    :cond_32
    new-instance v1, Landroid/widget/ArrayAdapter;

    iget-object v6, p0, Le/e/a/g0;->a:Landroid/content/Context;

    const v7, 0x1090008

    invoke-direct {v1, v6, v7}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I)V

    const v6, 0x1090009

    invoke-virtual {v1, v6}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    iget-object v6, p0, Le/e/a/g0;->a:Landroid/content/Context;

    const v7, 0x7f0f0038

    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    iget-object v6, p0, Le/e/a/g0;->a:Landroid/content/Context;

    const v7, 0x7f0f0037

    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    iget-object v6, p0, Le/e/a/g0;->a:Landroid/content/Context;

    const v7, 0x7f0f01d6

    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    const v6, 0x7f080187

    invoke-virtual {v4, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/Spinner;

    invoke-virtual {v6, v1}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    new-instance v1, Le/e/a/g0$a;

    invoke-direct {v1, p0, v2, p1, v5}, Le/e/a/g0$a;-><init>(Le/e/a/g0;[ILe/e/a/q;Landroid/widget/EditText;)V

    invoke-virtual {v6, v1}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    if-eqz p2, :cond_82

    iget p1, p2, Le/e/a/h0;->a:I

    invoke-virtual {v6, p1}, Landroid/widget/Spinner;->setSelection(I)V

    goto :goto_85

    :cond_82
    invoke-virtual {v6, v3}, Landroid/widget/Spinner;->setSelection(I)V

    :goto_85
    invoke-virtual {v0, v4}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    iget-object p1, p0, Le/e/a/g0;->a:Landroid/content/Context;

    const v1, 0x7f0f009e

    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    new-instance v1, Le/e/a/g0$b;

    invoke-direct {v1, p0, v5, p2, v2}, Le/e/a/g0$b;-><init>(Le/e/a/g0;Landroid/widget/EditText;Le/e/a/h0;[I)V

    invoke-virtual {v0, p1, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    iget-object p1, p0, Le/e/a/g0;->a:Landroid/content/Context;

    const p2, 0x7f0f002d

    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    new-instance p2, Le/e/a/g0$c;

    invoke-direct {p2, p0}, Le/e/a/g0$c;-><init>(Le/e/a/g0;)V

    invoke-virtual {v0, p1, p2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object p2

    const/4 v0, 0x2

    invoke-virtual {p2, v3, v0}, Landroid/view/Window;->setFlags(II)V

    invoke-virtual {p1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object p2

    invoke-virtual {p2, v0}, Landroid/view/Window;->setSoftInputMode(I)V

    invoke-static {p1}, Le/e/a/PlaybackSession;->showDialog(Landroid/app/AlertDialog;)V
    :try_end_c0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_c0} :catch_c1

    goto :goto_c5

    :catch_c1
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_c5
    return-void
.end method

.method public b(Le/e/a/h0;)V
    .registers 5

    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Le/e/a/g0;->a:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v1, p0, Le/e/a/g0;->a:Landroid/content/Context;

    const v2, 0x7f0f00a3

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Le/e/a/g0;->a:Landroid/content/Context;

    const v2, 0x7f0f00a1

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Le/e/a/g0$k;

    invoke-direct {v2, p0, p1}, Le/e/a/g0$k;-><init>(Le/e/a/g0;Le/e/a/h0;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    iget-object p1, p0, Le/e/a/g0;->a:Landroid/content/Context;

    const v1, 0x7f0f002d

    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    new-instance v1, Le/e/a/g0$l;

    invoke-direct {v1, p0}, Le/e/a/g0$l;-><init>(Le/e/a/g0;)V

    invoke-virtual {v0, p1, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    invoke-virtual {p1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Landroid/view/Window;->setFlags(II)V

    invoke-static {p1}, Le/e/a/PlaybackSession;->showDialog(Landroid/app/AlertDialog;)V

    return-void
.end method
