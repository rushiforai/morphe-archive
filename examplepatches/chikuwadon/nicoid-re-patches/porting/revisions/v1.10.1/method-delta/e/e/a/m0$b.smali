.class public Le/e/a/m0$b;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/m0;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Landroid/text/Spanned;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Le/e/a/m0;


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 12

    new-instance v0, Ld/b/q/z;

    iget-object v1, p0, Le/e/a/m0$b;->d:Le/e/a/m0;

    .line 1
    iget-object v1, v1, Le/e/a/m0;->d:Landroid/app/Activity;

    .line 2
    invoke-direct {v0, v1, p1}, Ld/b/q/z;-><init>(Landroid/content/Context;Landroid/view/View;)V

    const/4 p1, 0x4

    new-array p1, p1, [Z

    fill-array-data p1, :array_c8

    iget-object v1, p0, Le/e/a/m0$b;->d:Le/e/a/m0;

    .line 3
    iget v1, v1, Le/e/a/m0;->e:I

    .line 4
    sget-boolean v2, Lcom/sauzask/nicoid/NicoidPopupViewService;->o0:Z

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_1f

    sget-boolean v2, Lcom/sauzask/nicoid/NicoidPopupViewService;->p0:Z

    if-nez v2, :cond_1f

    const/4 v2, 0x1

    goto :goto_20

    :cond_1f
    const/4 v2, 0x0

    :goto_20
    aput-boolean v2, p1, v1

    iget-object v1, p0, Le/e/a/m0$b;->d:Le/e/a/m0;

    .line 5
    iget v1, v1, Le/e/a/m0;->e:I

    const/4 v2, 0x2

    if-eq v1, v2, :cond_38

    .line 6
    sget-boolean v1, Lcom/sauzask/nicoid/NicoidPopupViewService;->o0:Z

    if-eqz v1, :cond_34

    sget-boolean v1, Lcom/sauzask/nicoid/NicoidPopupViewService;->p0:Z

    if-eqz v1, :cond_32

    goto :goto_34

    :cond_32
    const/4 v1, 0x0

    goto :goto_35

    :cond_34
    :goto_34
    const/4 v1, 0x1

    :goto_35
    aput-boolean v1, p1, v2

    goto :goto_3a

    :cond_38
    aput-boolean v3, p1, v2

    :goto_3a
    sget-boolean v1, Lcom/sauzask/nicoid/NicoidPopupViewService;->o0:Z

    const/4 v5, 0x3

    if-eqz v1, :cond_49

    sget-boolean v1, Lcom/sauzask/nicoid/NicoidPopupViewService;->p0:Z

    if-eqz v1, :cond_49

    aput-boolean v4, p1, v3

    aput-boolean v4, p1, v2

    aput-boolean v3, p1, v5

    :cond_49
    const/4 v1, 0x0

    aput-boolean v4, p1, v1

    const/4 v1, 0x1

    aput-boolean v4, p1, v1

    const/4 v1, 0x2

    aput-boolean v4, p1, v1

    const/4 v1, 0x3

    aput-boolean v4, p1, v1

    aget-boolean v1, p1, v3

    const/4 v6, 0x5

    if-eqz v1, :cond_6a

    .line 7
    iget-object v1, v0, Ld/b/q/z;->a:Ld/b/p/i/g;

    .line 8
    iget-object v7, p0, Le/e/a/m0$b;->d:Le/e/a/m0;

    .line 9
    iget-object v7, v7, Le/e/a/m0;->d:Landroid/app/Activity;

    const v8, 0x7f0f00d9

    .line 10
    invoke-virtual {v7, v8}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v1, v3, v6, v3, v7}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    :cond_6a
    aget-boolean v1, p1, v4

    if-eqz v1, :cond_7f

    .line 11
    iget-object v1, v0, Ld/b/q/z;->a:Ld/b/p/i/g;

    const/4 v7, 0x6

    .line 12
    iget-object v8, p0, Le/e/a/m0$b;->d:Le/e/a/m0;

    .line 13
    iget-object v8, v8, Le/e/a/m0;->d:Landroid/app/Activity;

    const v9, 0x7f0f00d8

    .line 14
    invoke-virtual {v8, v9}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v1, v3, v7, v4, v8}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    :cond_7f
    aget-boolean v1, p1, v5

    if-eqz v1, :cond_95

    .line 15
    iget-object v1, v0, Ld/b/q/z;->a:Ld/b/p/i/g;

    const/16 v4, 0x9

    .line 16
    iget-object v7, p0, Le/e/a/m0$b;->d:Le/e/a/m0;

    .line 17
    iget-object v7, v7, Le/e/a/m0;->d:Landroid/app/Activity;

    const v8, 0x7f0f00d4

    .line 18
    invoke-virtual {v7, v8}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v1, v3, v4, v5, v7}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    :cond_95
    aget-boolean p1, p1, v2

    if-eqz p1, :cond_aa

    .line 19
    iget-object p1, v0, Ld/b/q/z;->a:Ld/b/p/i/g;

    const/4 v1, 0x7

    .line 20
    iget-object v4, p0, Le/e/a/m0$b;->d:Le/e/a/m0;

    .line 21
    iget-object v4, v4, Le/e/a/m0;->d:Landroid/app/Activity;

    const v5, 0x7f0f00d7

    .line 22
    invoke-virtual {v4, v5}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {p1, v3, v1, v2, v4}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 23
    :cond_aa
    iget-object p1, v0, Ld/b/q/z;->a:Ld/b/p/i/g;

    const/16 v1, 0xa

    .line 24
    iget-object v2, p0, Le/e/a/m0$b;->d:Le/e/a/m0;

    .line 25
    iget-object v2, v2, Le/e/a/m0;->d:Landroid/app/Activity;

    const v4, 0x7f0f00d5

    .line 26
    invoke-virtual {v2, v4}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1, v3, v1, v6, v2}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    invoke-virtual {v0}, Ld/b/q/z;->a()V

    new-instance p1, Le/e/a/m0$b$a;

    invoke-direct {p1, p0}, Le/e/a/m0$b$a;-><init>(Le/e/a/m0$b;)V

    .line 27
    iput-object p1, v0, Ld/b/q/z;->c:Ld/b/q/z$b;

    return-void

    nop

    :array_c8
    .array-data 1
        0x1t
        0x1t
        0x1t
        0x1t
    .end array-data
.end method
