.method public a(ILjava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;)V
    .registers 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/ArrayList<",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;",
            "Ljava/util/ArrayList<",
            "Le/e/a/x1;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Le/e/a/i2;->b:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    new-instance v1, Le/e/a/x0;

    iget-object v2, p0, Le/e/a/i2;->b:Landroid/app/Activity;

    const/4 v3, 0x0

    invoke-direct {v1, v2, p2, v3}, Le/e/a/x0;-><init>(Landroid/content/Context;Ljava/util/ArrayList;I)V

    new-instance v2, Landroid/widget/ListView;

    iget-object v3, p0, Le/e/a/i2;->b:Landroid/app/Activity;

    invoke-direct {v2, v3}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    const/4 v3, -0x1

    invoke-virtual {v2, v3}, Landroid/widget/ListView;->setBackgroundColor(I)V

    invoke-virtual {v2, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    invoke-static {v0}, Le/e/a/v0;->a(Landroid/app/AlertDialog$Builder;)Landroid/app/AlertDialog;

    move-result-object v10

    new-instance v0, Le/e/a/i2$c;

    move-object v4, v0

    move-object v5, p0

    move v6, p1

    move-object v7, p3

    move-object v8, p2

    move-object v9, p4

    invoke-direct/range {v4 .. v10}, Le/e/a/i2$c;-><init>(Le/e/a/i2;ILjava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;Landroid/app/AlertDialog;)V

    invoke-virtual {v2, v0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    return-void
.end method
