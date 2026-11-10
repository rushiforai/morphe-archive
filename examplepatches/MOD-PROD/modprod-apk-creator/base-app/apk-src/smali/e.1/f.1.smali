.class public final Le/f;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:Ljava/lang/Object;


# direct methods
.method public constructor <init>(I[Lv/g;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Le/f;->a:I

    iput-object p2, p0, Le/f;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 4

    const/4 v0, 0x0

    invoke-static {p1, v0}, Le/g;->i(Landroid/content/Context;I)I

    move-result v0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v1, Le/b;

    new-instance v2, Landroid/view/ContextThemeWrapper;

    invoke-static {p1, v0}, Le/g;->i(Landroid/content/Context;I)I

    move-result v3

    invoke-direct {v2, p1, v3}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    invoke-direct {v1, v2}, Le/b;-><init>(Landroid/view/ContextThemeWrapper;)V

    iput-object v1, p0, Le/f;->b:Ljava/lang/Object;

    iput v0, p0, Le/f;->a:I

    return-void
.end method


# virtual methods
.method public a()Le/g;
    .locals 10

    new-instance v0, Le/g;

    iget-object v1, p0, Le/f;->b:Ljava/lang/Object;

    check-cast v1, Le/b;

    iget-object v2, v1, Le/b;->a:Landroid/view/ContextThemeWrapper;

    iget v3, p0, Le/f;->a:I

    invoke-direct {v0, v2, v3}, Le/g;-><init>(Landroid/view/ContextThemeWrapper;I)V

    iget-object v2, v1, Le/b;->e:Landroid/view/View;

    iget-object v3, v0, Le/g;->f:Le/e;

    if-eqz v2, :cond_0

    iput-object v2, v3, Le/e;->n:Landroid/view/View;

    goto :goto_0

    :cond_0
    iget-object v2, v1, Le/b;->d:Ljava/lang/CharSequence;

    if-eqz v2, :cond_1

    iput-object v2, v3, Le/e;->d:Ljava/lang/CharSequence;

    iget-object v4, v3, Le/e;->l:Landroid/widget/TextView;

    if-eqz v4, :cond_1

    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_1
    iget-object v2, v1, Le/b;->c:Landroid/graphics/drawable/Drawable;

    if-eqz v2, :cond_2

    iput-object v2, v3, Le/e;->j:Landroid/graphics/drawable/Drawable;

    iget-object v4, v3, Le/e;->k:Landroid/widget/ImageView;

    if-eqz v4, :cond_2

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object v4, v3, Le/e;->k:Landroid/widget/ImageView;

    invoke-virtual {v4, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_2
    :goto_0
    iget-object v2, v1, Le/b;->g:Ljava/lang/Object;

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v2, :cond_7

    iget v2, v3, Le/e;->r:I

    iget-object v6, v1, Le/b;->b:Landroid/view/LayoutInflater;

    invoke-virtual {v6, v2, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroidx/appcompat/app/AlertController$RecycleListView;

    iget-boolean v6, v1, Le/b;->i:Z

    if-eqz v6, :cond_3

    iget v6, v3, Le/e;->s:I

    goto :goto_1

    :cond_3
    iget v6, v3, Le/e;->t:I

    :goto_1
    iget-object v7, v1, Le/b;->g:Ljava/lang/Object;

    if-eqz v7, :cond_4

    goto :goto_2

    :cond_4
    new-instance v7, Le/d;

    iget-object v8, v1, Le/b;->a:Landroid/view/ContextThemeWrapper;

    const v9, 0x1020014

    invoke-direct {v7, v8, v6, v9, v5}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;II[Ljava/lang/Object;)V

    :goto_2
    iput-object v7, v3, Le/e;->o:Landroid/widget/ListAdapter;

    iget v6, v1, Le/b;->j:I

    iput v6, v3, Le/e;->p:I

    iget-object v6, v1, Le/b;->h:Landroid/content/DialogInterface$OnClickListener;

    if-eqz v6, :cond_5

    new-instance v6, Le/a;

    invoke-direct {v6, v1, v3}, Le/a;-><init>(Le/b;Le/e;)V

    invoke-virtual {v2, v6}, Landroid/widget/AdapterView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    :cond_5
    iget-boolean v6, v1, Le/b;->i:Z

    if-eqz v6, :cond_6

    invoke-virtual {v2, v4}, Landroid/widget/AbsListView;->setChoiceMode(I)V

    :cond_6
    iput-object v2, v3, Le/e;->e:Landroidx/appcompat/app/AlertController$RecycleListView;

    :cond_7
    invoke-virtual {v0, v4}, Landroid/app/Dialog;->setCancelable(Z)V

    invoke-virtual {v0, v4}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    invoke-virtual {v0, v5}, Landroid/app/Dialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    invoke-virtual {v0, v5}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    iget-object v1, v1, Le/b;->f:Lh/o;

    if-eqz v1, :cond_8

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    :cond_8
    return-object v0
.end method
