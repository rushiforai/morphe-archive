.class public Le/e/a/b0$a;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/b0;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:I

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Le/e/a/b0;


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 13

    new-instance v0, Ld/b/q/z;

    iget-object v1, p0, Le/e/a/b0$a;->e:Le/e/a/b0;

    .line 1
    iget-object v1, v1, Le/e/a/b0;->d:Landroid/app/Activity;

    .line 2
    invoke-direct {v0, v1, p1}, Ld/b/q/z;-><init>(Landroid/content/Context;Landroid/view/View;)V

    const/4 p1, 0x4

    new-array v1, p1, [Z

    fill-array-data v1, :array_f4

    iget-object v2, p0, Le/e/a/b0$a;->e:Le/e/a/b0;

    .line 3
    iget v2, v2, Le/e/a/b0;->f:I

    .line 4
    sget-boolean v3, Lcom/sauzask/nicoid/NicoidPopupViewService;->o0:Z

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eqz v3, :cond_1f

    sget-boolean v3, Lcom/sauzask/nicoid/NicoidPopupViewService;->p0:Z

    if-nez v3, :cond_1f

    const/4 v3, 0x1

    goto :goto_20

    :cond_1f
    const/4 v3, 0x0

    :goto_20
    aput-boolean v3, v1, v2

    iget-object v2, p0, Le/e/a/b0$a;->e:Le/e/a/b0;

    .line 5
    iget v2, v2, Le/e/a/b0;->f:I

    const/4 v3, 0x2

    if-eq v2, v3, :cond_38

    .line 6
    sget-boolean v2, Lcom/sauzask/nicoid/NicoidPopupViewService;->o0:Z

    if-eqz v2, :cond_34

    sget-boolean v2, Lcom/sauzask/nicoid/NicoidPopupViewService;->p0:Z

    if-eqz v2, :cond_32

    goto :goto_34

    :cond_32
    const/4 v2, 0x0

    goto :goto_35

    :cond_34
    :goto_34
    const/4 v2, 0x1

    :goto_35
    aput-boolean v2, v1, v3

    goto :goto_3a

    :cond_38
    aput-boolean v4, v1, v3

    :goto_3a
    sget-boolean v2, Lcom/sauzask/nicoid/NicoidPopupViewService;->o0:Z

    const/4 v6, 0x3

    if-eqz v2, :cond_4b

    sget-boolean v2, Lcom/sauzask/nicoid/NicoidPopupViewService;->p0:Z

    if-eqz v2, :cond_4b

    aput-boolean v5, v1, v4

    aput-boolean v5, v1, v5

    aput-boolean v5, v1, v3

    aput-boolean v4, v1, v6

    :cond_4b
    const/4 v2, 0x0

    aput-boolean v5, v1, v2

    const/4 v2, 0x1

    aput-boolean v5, v1, v2

    const/4 v2, 0x2

    aput-boolean v5, v1, v2

    const/4 v2, 0x3

    aput-boolean v5, v1, v2

    aget-boolean v2, v1, v4

    const/4 v7, 0x5

    if-eqz v2, :cond_6c

    .line 7
    iget-object v2, v0, Ld/b/q/z;->a:Ld/b/p/i/g;

    .line 8
    iget-object v8, p0, Le/e/a/b0$a;->e:Le/e/a/b0;

    .line 9
    iget-object v8, v8, Le/e/a/b0;->d:Landroid/app/Activity;

    const v9, 0x7f0f00d9

    .line 10
    invoke-virtual {v8, v9}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v2, v4, v7, v4, v8}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    :cond_6c
    aget-boolean v2, v1, v5

    const/4 v8, 0x6

    if-eqz v2, :cond_81

    .line 11
    iget-object v2, v0, Ld/b/q/z;->a:Ld/b/p/i/g;

    .line 12
    iget-object v9, p0, Le/e/a/b0$a;->e:Le/e/a/b0;

    .line 13
    iget-object v9, v9, Le/e/a/b0;->d:Landroid/app/Activity;

    const v10, 0x7f0f00d8

    .line 14
    invoke-virtual {v9, v10}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v2, v4, v8, v5, v9}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    :cond_81
    aget-boolean v2, v1, v6

    const/16 v5, 0x9

    if-eqz v2, :cond_97

    iget-object v2, p0, Le/e/a/b0$a;->e:Le/e/a/b0;

    .line 15
    .line 16
    iget-object v9, v0, Ld/b/q/z;->a:Ld/b/p/i/g;

    .line 17
    iget-object v2, v2, Le/e/a/b0;->d:Landroid/app/Activity;

    const v10, 0x7f0f00d4

    .line 18
    invoke-virtual {v2, v10}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v9, v4, v5, v6, v2}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    :cond_97
    aget-boolean v1, v1, v3

    if-eqz v1, :cond_ac

    iget-object v1, p0, Le/e/a/b0$a;->e:Le/e/a/b0;

    .line 19
    .line 20
    iget-object v2, v0, Ld/b/q/z;->a:Ld/b/p/i/g;

    const/4 v6, 0x7

    .line 21
    iget-object v1, v1, Le/e/a/b0;->d:Landroid/app/Activity;

    const v9, 0x7f0f00d7

    .line 22
    invoke-virtual {v1, v9}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v2, v4, v6, v3, v1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    :cond_ac
    iget-object v1, p0, Le/e/a/b0$a;->e:Le/e/a/b0;

    .line 23
    iget-boolean v2, v1, Le/e/a/b0;->k:Z

    if-eqz v2, :cond_d6

    .line 24
    iget-object v2, v1, Le/e/a/b0;->l:Le/e/a/b1;

    if-eqz v2, :cond_d6

    .line 25
    iget-object v2, v0, Ld/b/q/z;->a:Ld/b/p/i/g;

    const/16 v3, 0x8

    .line 26
    iget-object v1, v1, Le/e/a/b0;->d:Landroid/app/Activity;

    const v6, 0x7f0f00ce

    .line 27
    invoke-virtual {v1, v6}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v2, v4, v3, p1, v1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 28
    iget-object p1, v0, Ld/b/q/z;->a:Ld/b/p/i/g;

    .line 29
    iget-object v1, p0, Le/e/a/b0$a;->e:Le/e/a/b0;

    .line 30
    iget-object v1, v1, Le/e/a/b0;->d:Landroid/app/Activity;

    const v2, 0x7f0f00d3

    .line 31
    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v4, v5, v7, v1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 32
    :cond_d6
    iget-object p1, v0, Ld/b/q/z;->a:Ld/b/p/i/g;

    const/16 v1, 0xa

    .line 33
    iget-object v2, p0, Le/e/a/b0$a;->e:Le/e/a/b0;

    .line 34
    iget-object v2, v2, Le/e/a/b0;->d:Landroid/app/Activity;

    const v3, 0x7f0f00d5

    .line 35
    invoke-virtual {v2, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1, v4, v1, v8, v2}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    invoke-virtual {v0}, Ld/b/q/z;->a()V

    new-instance p1, Le/e/a/b0$a$a;

    invoke-direct {p1, p0}, Le/e/a/b0$a$a;-><init>(Le/e/a/b0$a;)V

    .line 36
    iput-object p1, v0, Ld/b/q/z;->c:Ld/b/q/z$b;

    return-void

    nop

    :array_f4
    .array-data 1
        0x1t
        0x1t
        0x1t
        0x1t
    .end array-data
.end method
