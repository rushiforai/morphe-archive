.class public final Lisj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lbtj;
.implements Lw6f;


# instance fields
.field public final a:Lesk;

.field public final b:Lesk;

.field public final c:Li7f;

.field public d:Lhsj;

.field public e:Lmim;

.field public f:Z


# direct methods
.method public constructor <init>(Lesk;Lesk;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Li7f;

    invoke-direct {v0}, Li7f;-><init>()V

    iput-object v0, p0, Lisj;->c:Li7f;

    iput-object p1, p0, Lisj;->a:Lesk;

    iput-object p2, p0, Lisj;->b:Lesk;

    return-void
.end method


# virtual methods
.method public final F(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Ln9l;

    iget-object p0, p0, Lisj;->c:Li7f;

    invoke-virtual {p0, p1}, Li7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public final H(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Ln9l;

    iget-object p0, p0, Lisj;->c:Li7f;

    invoke-virtual {p0, p1}, Li7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final I()V
    .registers 4

    iget-object v0, p0, Lisj;->d:Lhsj;

    if-eqz v0, :cond_2e

    iget-object v0, v0, Lhsj;->b:Lo93;

    const/4 v1, 0x3

    sget-object v2, Lhjm;->b:Lhjm;

    invoke-virtual {v0, v2, v1}, Lo93;->b(Lhjm;I)V

    const/4 v1, 0x0

    iput-object v1, p0, Lisj;->d:Lhsj;

    new-instance v1, Lg7f;

    iget-object p0, p0, Lisj;->c:Li7f;

    invoke-direct {v1, p0}, Lg7f;-><init>(Li7f;)V

    :cond_16
    :goto_16
    invoke-virtual {v1}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_2e

    invoke-virtual {v1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ln9l;

    iget-object v2, p0, Ln9l;->a:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_16

    invoke-virtual {p0}, Ln9l;->a()V

    goto :goto_16

    :cond_2e
    return-void
.end method

.method public final a(Lo93;)V
    .registers 6

    iget-object v0, p0, Lisj;->d:Lhsj;

    if-eqz v0, :cond_38

    iget-object v1, v0, Lhsj;->b:Lo93;

    if-ne v1, p1, :cond_38

    iget-object v0, v0, Lhsj;->a:Lgtj;

    invoke-virtual {v0}, Lgtj;->a()V

    const/4 v0, 0x0

    iput-object v0, p0, Lisj;->d:Lhsj;

    new-instance v1, Lg7f;

    iget-object v2, p0, Lisj;->c:Li7f;

    invoke-direct {v1, v2}, Lg7f;-><init>(Li7f;)V

    :cond_17
    :goto_17
    invoke-virtual {v1}, Lg7f;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2f

    invoke-virtual {v1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ln9l;

    iget-object v3, v2, Ln9l;->a:Ljava/util/ArrayList;

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_17

    invoke-virtual {v2}, Ln9l;->a()V

    goto :goto_17

    :cond_2f
    iget-object p1, p0, Lisj;->e:Lmim;

    if-eqz p1, :cond_38

    iput-object v0, p0, Lisj;->e:Lmim;

    invoke-virtual {p1}, Lmim;->run()V

    :cond_38
    return-void
.end method

.method public final b(Lo93;)Lhsj;
    .registers 8

    iget-object v0, p0, Lisj;->a:Lesk;

    invoke-interface {v0}, Lesk;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {p1, v0}, Lo93;->e(Landroid/view/View;)Lgtj;

    move-result-object v0

    new-instance v1, Lpt;

    const/4 v2, 0x1

    invoke-direct {v1, p1, v2}, Lpt;-><init>(Ljava/lang/Object;B)V

    iget-object v2, v0, Lgtj;->a:Lasj;

    invoke-virtual {v2, v1}, Lna3;->a(Lzrj;)V

    iget-object v1, v0, Lgtj;->a:Lasj;

    invoke-virtual {v1}, Lna3;->c()Landroid/view/View;

    move-result-object v2

    if-nez v2, :cond_44

    iget-object v2, p0, Lisj;->b:Lesk;

    invoke-interface {v2}, Lesk;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    iget-object v3, v0, Lgtj;->d:Lfsj;

    if-eqz v3, :cond_41

    iget-object v4, v3, Lfsj;->c:Landroid/view/View;

    invoke-static {v2, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_44

    iput-object v2, v3, Lfsj;->c:Landroid/view/View;

    iget-object v2, v3, Lfsj;->b:Lcom/google/android/material/snackbar/Snackbar$SnackbarLayout;

    new-instance v4, Lcsj;

    const/4 v5, 0x0

    invoke-direct {v4, v3, v5}, Lcsj;-><init>(Lfsj;B)V

    invoke-virtual {v2, v4}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    goto :goto_44

    :cond_41
    invoke-virtual {v1, v2}, Lna3;->f(Landroid/view/View;)V

    :cond_44
    :goto_44
    iget-boolean v2, p0, Lisj;->f:Z

    if-eqz v2, :cond_55

    iget-object v2, v0, Lgtj;->d:Lfsj;

    if-nez v2, :cond_55

    new-instance v2, Lfsj;

    iget-object v3, v0, Lgtj;->b:Landroid/view/View;

    invoke-direct {v2, v1, v3}, Lfsj;-><init>(Lasj;Landroid/view/View;)V

    iput-object v2, v0, Lgtj;->d:Lfsj;

    :cond_55
    new-instance v1, Lhsj;

    invoke-direct {v1, v0, p1}, Lhsj;-><init>(Lgtj;Lo93;)V

    iput-object v1, p0, Lisj;->d:Lhsj;

    new-instance v0, Lg7f;

    iget-object v1, p0, Lisj;->c:Li7f;

    invoke-direct {v0, v1}, Lg7f;-><init>(Li7f;)V

    :goto_63
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_78

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ln9l;

    iget-object v2, v1, Ln9l;->a:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v1}, Ln9l;->a()V

    goto :goto_63

    :cond_78
    iget-object p0, p0, Lisj;->d:Lhsj;

    return-object p0
.end method

.method public final z(Lo93;Lmim;)I
    .registers 4

    iget-object v0, p0, Lisj;->d:Lhsj;

    if-eqz v0, :cond_8

    iput-object p2, p0, Lisj;->e:Lmim;

    const/4 p0, 0x2

    return p0

    :cond_8
    invoke-virtual {p0, p1}, Lisj;->b(Lo93;)Lhsj;

    const/4 p0, 0x1

    return p0
.end method
