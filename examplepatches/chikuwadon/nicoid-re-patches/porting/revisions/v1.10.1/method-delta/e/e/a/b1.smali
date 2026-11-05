.class public Le/e/a/b1;
.super Ljava/lang/Object;
.source ""


# instance fields
.field public a:Landroid/os/Handler;

.field public b:Landroid/app/Activity;

.field public c:Le/e/a/l3/l;

.field public d:Lorg/apache/http/client/CookieStore;

.field public e:Z

.field public f:Z


# virtual methods
.method public final a(Ljava/util/ArrayList;Ljava/lang/String;)V
    .registers 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Le/e/a/b1;->b:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v1, p0, Le/e/a/b1;->b:Landroid/app/Activity;

    const-string v2, "layout_inflater"

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/LayoutInflater;

    const/4 v2, 0x0

    const v3, 0x7f0b002b

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    const/4 v3, 0x2

    new-array v4, v3, [Ljava/lang/String;

    const-string v5, ""

    aput-object v5, v4, v2

    const/4 v6, 0x1

    aput-object v5, v4, v6

    new-instance v7, Landroid/widget/ArrayAdapter;

    iget-object v8, p0, Le/e/a/b1;->b:Landroid/app/Activity;

    const v9, 0x1090008

    invoke-direct {v7, v8, v9}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I)V

    const v8, 0x1090009

    invoke-virtual {v7, v8}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_38
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_78

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/HashMap;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "title"

    invoke-virtual {v9, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v11, "isPublic"

    invoke-virtual {v9, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Boolean;

    invoke-virtual {v9}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v9

    if-eqz v9, :cond_6c

    iget-object v9, p0, Le/e/a/b1;->b:Landroid/app/Activity;

    const v11, 0x7f0f01e3

    invoke-virtual {v9, v11}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v9

    goto :goto_6d

    :cond_6c
    move-object v9, v5

    :goto_6d
    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    goto :goto_38

    :cond_78
    const v8, 0x7f080187

    invoke-virtual {v1, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/Spinner;

    invoke-virtual {v8, v7}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    new-instance v7, Le/e/a/b1$d;

    invoke-direct {v7, p0, v4, p1}, Le/e/a/b1$d;-><init>(Le/e/a/b1;[Ljava/lang/String;Ljava/util/ArrayList;)V

    invoke-virtual {v8, v7}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    invoke-virtual {v8, v2}, Landroid/widget/Spinner;->setSelection(I)V

    const p1, 0x7f080086

    invoke-virtual {v1, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    invoke-virtual {p1, v5}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    iget-object v5, p0, Le/e/a/b1;->b:Landroid/app/Activity;

    const v7, 0x7f0f01e2

    invoke-virtual {v5, v7}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Le/e/a/b1;->b:Landroid/app/Activity;

    const v5, 0x7f0f01de

    invoke-virtual {v1, v5}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v5, Le/e/a/b1$e;

    invoke-direct {v5, p0, v4, p2, p1}, Le/e/a/b1$e;-><init>(Le/e/a/b1;[Ljava/lang/String;Ljava/lang/String;Landroid/widget/EditText;)V

    invoke-virtual {v0, v1, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    iget-object p1, p0, Le/e/a/b1;->b:Landroid/app/Activity;

    const p2, 0x7f0f002d

    invoke-virtual {p1, p2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p1

    new-instance p2, Le/e/a/b1$f;

    invoke-direct {p2, p0}, Le/e/a/b1$f;-><init>(Le/e/a/b1;)V

    invoke-virtual {v0, p1, p2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    invoke-virtual {p1, v6}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    invoke-virtual {p1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object p2

    invoke-virtual {p2, v3}, Landroid/view/Window;->setSoftInputMode(I)V

    invoke-virtual {p1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object p2

    invoke-virtual {p2, v2, v3}, Landroid/view/Window;->setFlags(II)V

    invoke-static {p1}, Le/e/a/PlaybackSession;->showDialog(Landroid/app/AlertDialog;)V

    return-void
.end method
