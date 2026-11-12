.class Lx00;
.super Lagc;
.source "SourceFile"


# static fields
.field public static final synthetic f:I


# instance fields
.field public e:Landroid/view/View$OnClickListener;


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 2

    iget-object p0, p0, Lx00;->e:Landroid/view/View$OnClickListener;

    if-eqz p0, :cond_7

    invoke-interface {p0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    :cond_7
    return-void
.end method
