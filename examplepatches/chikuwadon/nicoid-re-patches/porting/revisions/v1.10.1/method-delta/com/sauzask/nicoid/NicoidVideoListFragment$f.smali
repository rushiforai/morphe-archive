.class public Lcom/sauzask/nicoid/NicoidVideoListFragment$f;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/widget/AdapterView$OnItemLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sauzask/nicoid/NicoidVideoListFragment;->b(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/sauzask/nicoid/NicoidVideoListFragment;


# virtual methods
.method public onItemLongClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)Z
    .registers 14
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

    iget-object p3, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$f;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 1
    iget-object p4, p3, Lcom/sauzask/nicoid/NicoidVideoListFragment;->z0:Landroid/view/View;

    const/4 p5, 0x0

    if-eq p2, p4, :cond_1a6

    if-gez p1, :cond_c

    goto/16 :goto_1a6

    .line 2
    :cond_c
    iget p4, p3, Lcom/sauzask/nicoid/NicoidVideoListFragment;->h0:I

    const/4 v0, 0x4

    const v1, 0x7f0f00b3

    const v2, 0x7f0f022d

    const-string v3, "title"

    const v4, 0x7f0f0206

    const/4 v5, 0x1

    if-ne p4, v0, :cond_67

    .line 3
    new-instance p2, Landroid/app/AlertDialog$Builder;

    .line 4
    iget-object p3, p3, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    .line 5
    invoke-direct {p2, p3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object p3, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$f;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 6
    iget-object p3, p3, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    .line 7
    invoke-virtual {p3, v4}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p3

    new-array p4, v5, [Ljava/lang/Object;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$f;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 8
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->a0:Ljava/util/ArrayList;

    .line 9
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/x1;

    invoke-virtual {v0, v3}, Le/e/a/x1;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    aput-object v0, p4, p5

    invoke-static {p3, p4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    iget-object p3, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$f;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 10
    iget-object p3, p3, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    .line 11
    invoke-virtual {p3, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p3

    new-instance p4, Lcom/sauzask/nicoid/NicoidVideoListFragment$f$a;

    invoke-direct {p4, p0, p1}, Lcom/sauzask/nicoid/NicoidVideoListFragment$f$a;-><init>(Lcom/sauzask/nicoid/NicoidVideoListFragment$f;I)V

    invoke-virtual {p2, p3, p4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$f;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 12
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    .line 13
    invoke-virtual {p1, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p1

    new-instance p3, Lcom/sauzask/nicoid/NicoidVideoListFragment$f$b;

    invoke-direct {p3, p0}, Lcom/sauzask/nicoid/NicoidVideoListFragment$f$b;-><init>(Lcom/sauzask/nicoid/NicoidVideoListFragment$f;)V

    goto :goto_b4

    .line 14
    :cond_67
    iget p4, p3, Lcom/sauzask/nicoid/NicoidVideoListFragment;->g0:I

    if-ne p4, v5, :cond_bc

    .line 15
    new-instance p2, Landroid/app/AlertDialog$Builder;

    .line 16
    iget-object p3, p3, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    .line 17
    invoke-direct {p2, p3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object p3, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$f;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 18
    iget-object p3, p3, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    .line 19
    invoke-virtual {p3, v4}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p3

    new-array p4, v5, [Ljava/lang/Object;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$f;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 20
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->a0:Ljava/util/ArrayList;

    .line 21
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/x1;

    invoke-virtual {v0, v3}, Le/e/a/x1;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    aput-object v0, p4, p5

    invoke-static {p3, p4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    iget-object p3, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$f;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 22
    iget-object p3, p3, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    .line 23
    invoke-virtual {p3, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p3

    new-instance p4, Lcom/sauzask/nicoid/NicoidVideoListFragment$f$c;

    invoke-direct {p4, p0, p1}, Lcom/sauzask/nicoid/NicoidVideoListFragment$f$c;-><init>(Lcom/sauzask/nicoid/NicoidVideoListFragment$f;I)V

    invoke-virtual {p2, p3, p4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$f;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 24
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    .line 25
    invoke-virtual {p1, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p1

    new-instance p3, Lcom/sauzask/nicoid/NicoidVideoListFragment$f$d;

    invoke-direct {p3, p0}, Lcom/sauzask/nicoid/NicoidVideoListFragment$f$d;-><init>(Lcom/sauzask/nicoid/NicoidVideoListFragment$f;)V

    :goto_b4
    invoke-virtual {p2, p1, p3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-static {p2}, Le/e/a/v0;->a(Landroid/app/AlertDialog$Builder;)Landroid/app/AlertDialog;

    goto/16 :goto_1a5

    :cond_bc
    const/16 v0, 0x8

    if-eq p4, v0, :cond_163

    const/4 v0, 0x5

    if-eq p4, v0, :cond_163

    const/16 v0, 0x9

    if-ne p4, v0, :cond_c9

    goto/16 :goto_163

    :cond_c9
    const/4 p2, 0x7

    if-ne p4, p2, :cond_ce

    goto/16 :goto_1a5

    :cond_ce
    const/16 p2, 0x8

    if-ne p4, p2, :cond_1a5

    .line 26
    iget-object p2, p3, Lcom/sauzask/nicoid/NicoidVideoListFragment;->a0:Ljava/util/ArrayList;

    .line 27
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Le/e/a/x1;

    const-string p3, "videoid"

    invoke-virtual {p2, p3}, Le/e/a/x1;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    new-instance p3, Landroid/app/AlertDialog$Builder;

    iget-object p4, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$f;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 28
    iget-object p4, p4, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    .line 29
    invoke-direct {p3, p4}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    new-instance p4, Landroid/widget/CheckBox;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$f;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 30
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    .line 31
    invoke-direct {p4, v0}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$f;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 32
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    const v6, 0x7f0f0207

    .line 33
    invoke-virtual {v0, v6}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p4, v0}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p4, p5}, Landroid/widget/CheckBox;->setChecked(Z)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$f;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 34
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    .line 35
    invoke-virtual {v0, v4}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    new-array v4, v5, [Ljava/lang/Object;

    iget-object v6, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$f;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 36
    iget-object v6, v6, Lcom/sauzask/nicoid/NicoidVideoListFragment;->a0:Ljava/util/ArrayList;

    .line 37
    invoke-virtual {v6, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Le/e/a/x1;

    invoke-virtual {v6, v3}, Le/e/a/x1;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v4, p5

    invoke-static {v0, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$f;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 38
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    .line 39
    invoke-static {p2, v0}, Le/e/a/o;->a(Ljava/lang/String;Landroid/content/Context;)[J

    move-result-object v0

    aget-wide v3, v0, p5

    const-wide/16 v6, 0x0

    cmp-long p5, v3, v6

    if-lez p5, :cond_13f

    invoke-virtual {p3, p4}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    :cond_13f
    iget-object p5, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$f;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 40
    iget-object p5, p5, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    .line 41
    invoke-virtual {p5, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p5

    new-instance v0, Lcom/sauzask/nicoid/NicoidVideoListFragment$f$e;

    invoke-direct {v0, p0, p2, p4, p1}, Lcom/sauzask/nicoid/NicoidVideoListFragment$f$e;-><init>(Lcom/sauzask/nicoid/NicoidVideoListFragment$f;Ljava/lang/String;Landroid/widget/CheckBox;I)V

    invoke-virtual {p3, p5, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$f;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 42
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    .line 43
    invoke-virtual {p1, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p1

    new-instance p2, Lcom/sauzask/nicoid/NicoidVideoListFragment$f$f;

    invoke-direct {p2, p0}, Lcom/sauzask/nicoid/NicoidVideoListFragment$f$f;-><init>(Lcom/sauzask/nicoid/NicoidVideoListFragment$f;)V

    invoke-virtual {p3, p1, p2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-static {p3}, Le/e/a/v0;->a(Landroid/app/AlertDialog$Builder;)Landroid/app/AlertDialog;

    goto :goto_1a5

    :cond_163
    :goto_163
    iget-object p3, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$f;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 44
    iget-boolean p4, p3, Lcom/sauzask/nicoid/NicoidVideoListFragment;->k0:Z

    if-nez p4, :cond_1a5

    .line 45
    invoke-virtual {p3}, Lcom/sauzask/nicoid/NicoidVideoListFragment;->Y()V

    iget-object p3, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$f;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 46
    iget-object p3, p3, Lcom/sauzask/nicoid/NicoidVideoListFragment;->a0:Ljava/util/ArrayList;

    .line 47
    invoke-virtual {p3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Le/e/a/x1;

    const-string p3, "isselect"

    invoke-virtual {p1, p3}, Le/e/a/x1;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Ljava/lang/Boolean;

    if-eqz p4, :cond_193

    invoke-virtual {p4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p4

    if-nez p4, :cond_187

    goto :goto_193

    :cond_187
    invoke-static {p5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p4

    invoke-virtual {p1, p3, p4}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {p5}, Landroid/graphics/Color;->alpha(I)I

    move-result p1

    goto :goto_19d

    :cond_193
    :goto_193
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p4

    invoke-virtual {p1, p3, p4}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const p1, 0x6631c7b1

    :goto_19d
    invoke-virtual {p2, p1}, Landroid/view/View;->setBackgroundColor(I)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$f;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    invoke-virtual {p1}, Lcom/sauzask/nicoid/NicoidVideoListFragment;->updateSelectionCount()V

    :cond_1a5
    :goto_1a5
    return v5

    :cond_1a6
    :goto_1a6
    return p5
.end method
