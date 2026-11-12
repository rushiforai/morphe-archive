.class public final synthetic Ln66;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lq5n;
.implements Lbcf;


# instance fields
.field public final synthetic a:Lo66;


# direct methods
.method public synthetic constructor <init>(Lo66;)V
    .registers 2

    iput-object p1, p0, Ln66;->a:Lo66;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final l0(Landroid/view/View;Lg3o;)Lg3o;
    .registers 9

    iget-object p1, p2, Lg3o;->a:Ld3o;

    iget-object p0, p0, Ln66;->a:Lo66;

    iget v0, p0, Lo66;->r:I

    and-int/lit8 v0, v0, 0x4

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_16

    invoke-virtual {p1}, Ld3o;->l()Lr9b;

    move-result-object v0

    iget v0, v0, Lr9b;->b:I

    if-eqz v0, :cond_16

    move v0, v2

    goto :goto_17

    :cond_16
    move v0, v1

    :goto_17
    iget v3, p0, Lo66;->r:I

    and-int/lit8 v3, v3, 0x8

    if-eqz v3, :cond_27

    invoke-virtual {p1}, Ld3o;->l()Lr9b;

    move-result-object v3

    iget v3, v3, Lr9b;->d:I

    if-eqz v3, :cond_27

    move v3, v2

    goto :goto_28

    :cond_27
    move v3, v1

    :goto_28
    iget v4, p0, Lo66;->r:I

    and-int/2addr v4, v2

    if-eqz v4, :cond_37

    invoke-virtual {p1}, Ld3o;->l()Lr9b;

    move-result-object v4

    iget v4, v4, Lr9b;->a:I

    if-eqz v4, :cond_37

    move v4, v2

    goto :goto_38

    :cond_37
    move v4, v1

    :goto_38
    iget v5, p0, Lo66;->r:I

    and-int/lit8 v5, v5, 0x2

    if-eqz v5, :cond_48

    invoke-virtual {p1}, Ld3o;->l()Lr9b;

    move-result-object v5

    iget v5, v5, Lr9b;->c:I

    if-eqz v5, :cond_48

    move v5, v2

    goto :goto_49

    :cond_48
    move v5, v1

    :goto_49
    if-nez v0, :cond_57

    if-eqz v3, :cond_6e

    iget v0, p0, Lo66;->n:I

    invoke-virtual {p1}, Ld3o;->l()Lr9b;

    move-result-object v3

    iget v3, v3, Lr9b;->d:I

    sub-int/2addr v0, v3

    goto :goto_60

    :cond_57
    iget v0, p0, Lo66;->n:I

    invoke-virtual {p1}, Ld3o;->l()Lr9b;

    move-result-object v3

    iget v3, v3, Lr9b;->b:I

    add-int/2addr v0, v3

    :goto_60
    iget-object v3, p0, Lo66;->f:Ll56;

    invoke-virtual {v3}, Landroidx/appcompat/widget/ListPopupWindow;->j()I

    move-result v3

    if-eq v0, v3, :cond_6e

    iget-object v1, p0, Lo66;->f:Ll56;

    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/ListPopupWindow;->g(I)V

    move v1, v2

    :cond_6e
    if-nez v4, :cond_7c

    if-eqz v5, :cond_8e

    iget v0, p0, Lo66;->p:I

    invoke-virtual {p1}, Ld3o;->l()Lr9b;

    move-result-object p1

    iget p1, p1, Lr9b;->c:I

    sub-int/2addr v0, p1

    goto :goto_85

    :cond_7c
    iget v0, p0, Lo66;->p:I

    invoke-virtual {p1}, Ld3o;->l()Lr9b;

    move-result-object p1

    iget p1, p1, Lr9b;->a:I

    add-int/2addr v0, p1

    :goto_85
    iget-object p1, p0, Lo66;->f:Ll56;

    iget v3, p1, Landroidx/appcompat/widget/ListPopupWindow;->f:I

    if-eq v0, v3, :cond_8e

    iput v0, p1, Landroidx/appcompat/widget/ListPopupWindow;->f:I

    goto :goto_8f

    :cond_8e
    move v2, v1

    :goto_8f
    if-eqz v2, :cond_96

    iget-object p0, p0, Lo66;->f:Ll56;

    invoke-virtual {p0}, Ll56;->show()V

    :cond_96
    return-object p2
.end method

.method public final onUnhandledKeyEvent(Landroid/view/View;Landroid/view/KeyEvent;)Z
    .registers 4

    iget-object p0, p0, Ln66;->a:Lo66;

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    invoke-virtual {p0, p1, v0, p2}, Lo66;->onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method
