.class public final Lh/b;
.super Li/w0;
.source "SourceFile"


# instance fields
.field public final synthetic j:I

.field public final synthetic k:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroidx/appcompat/view/menu/ActionMenuItemView;)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lh/b;->j:I

    iput-object p1, p0, Lh/b;->k:Landroid/view/View;

    invoke-direct {p0, p1}, Li/w0;-><init>(Landroid/view/View;)V

    return-void
.end method

.method public constructor <init>(Li/k;Li/k;)V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Lh/b;->j:I

    iput-object p1, p0, Lh/b;->k:Landroid/view/View;

    invoke-direct {p0, p2}, Li/w0;-><init>(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final b()Lh/D;
    .locals 1

    iget v0, p0, Lh/b;->j:I

    packed-switch v0, :pswitch_data_0

    iget-object v0, p0, Lh/b;->k:Landroid/view/View;

    check-cast v0, Li/k;

    iget-object v0, v0, Li/k;->d:Li/l;

    iget-object v0, v0, Li/l;->s:Li/h;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Lh/x;->a()Lh/v;

    move-result-object v0

    :goto_0
    return-object v0

    :pswitch_0
    iget-object v0, p0, Lh/b;->k:Landroid/view/View;

    check-cast v0, Landroidx/appcompat/view/menu/ActionMenuItemView;

    iget-object v0, v0, Landroidx/appcompat/view/menu/ActionMenuItemView;->m:Lh/c;

    if-eqz v0, :cond_1

    check-cast v0, Li/i;

    iget-object v0, v0, Li/i;->a:Li/l;

    iget-object v0, v0, Li/l;->t:Li/h;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lh/x;->a()Lh/v;

    move-result-object v0

    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    :goto_1
    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final c()Z
    .locals 2

    iget v0, p0, Lh/b;->j:I

    packed-switch v0, :pswitch_data_0

    iget-object v0, p0, Lh/b;->k:Landroid/view/View;

    check-cast v0, Li/k;

    iget-object v0, v0, Li/k;->d:Li/l;

    invoke-virtual {v0}, Li/l;->l()Z

    const/4 v0, 0x1

    return v0

    :pswitch_0
    iget-object v0, p0, Lh/b;->k:Landroid/view/View;

    check-cast v0, Landroidx/appcompat/view/menu/ActionMenuItemView;

    iget-object v1, v0, Landroidx/appcompat/view/menu/ActionMenuItemView;->k:Lh/m;

    if-eqz v1, :cond_0

    iget-object v0, v0, Landroidx/appcompat/view/menu/ActionMenuItemView;->h:Lh/p;

    invoke-interface {v1, v0}, Lh/m;->b(Lh/p;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lh/b;->b()Lh/D;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lh/D;->a()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public d()Z
    .locals 2

    iget v0, p0, Lh/b;->j:I

    packed-switch v0, :pswitch_data_0

    invoke-super {p0}, Li/w0;->d()Z

    move-result v0

    return v0

    :pswitch_0
    iget-object v0, p0, Lh/b;->k:Landroid/view/View;

    check-cast v0, Li/k;

    iget-object v0, v0, Li/k;->d:Li/l;

    iget-object v1, v0, Li/l;->u:Li/j;

    if-eqz v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Li/l;->f()Z

    const/4 v0, 0x1

    :goto_0
    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
