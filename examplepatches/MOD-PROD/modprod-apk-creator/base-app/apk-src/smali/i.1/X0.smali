.class public final Li/X0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Li/o;
.implements Lh/l;


# instance fields
.field public final synthetic a:Landroidx/appcompat/widget/Toolbar;


# direct methods
.method public synthetic constructor <init>(Landroidx/appcompat/widget/Toolbar;)V
    .locals 0

    iput-object p1, p0, Li/X0;->a:Landroidx/appcompat/widget/Toolbar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public g(Lh/n;)V
    .locals 1

    iget-object p1, p0, Li/X0;->a:Landroidx/appcompat/widget/Toolbar;

    iget-object v0, p1, Landroidx/appcompat/widget/Toolbar;->a:Landroidx/appcompat/widget/ActionMenuView;

    iget-object v0, v0, Landroidx/appcompat/widget/ActionMenuView;->t:Li/l;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Li/l;->h()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object p1, p1, Landroidx/appcompat/widget/Toolbar;->G:LC/h;

    invoke-virtual {p1}, LC/h;->p()V

    return-void
.end method

.method public h(Lh/n;Landroid/view/MenuItem;)Z
    .locals 0

    iget-object p1, p0, Li/X0;->a:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 p1, 0x0

    return p1
.end method
