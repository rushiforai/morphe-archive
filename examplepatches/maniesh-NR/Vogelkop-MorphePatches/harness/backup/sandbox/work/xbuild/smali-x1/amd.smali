.class public final Lamd;
.super Lgph;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final a:Landroid/view/View;

.field public final synthetic b:Li4d;


# direct methods
.method public constructor <init>(Li4d;Landroid/view/View;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lamd;->b:Li4d;

    iput-object p2, p0, Lamd;->a:Landroid/view/View;

    iget-object p1, p1, Li4d;->b:Ljava/lang/Object;

    check-cast p1, Lzld;

    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/d;->registerAdapterDataObserver(Lgph;)V

    invoke-virtual {p0}, Lamd;->run()V

    return-void
.end method


# virtual methods
.method public final b()V
    .registers 2

    iget-object v0, p0, Lamd;->a:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final f(II)V
    .registers 3

    iget-object p1, p0, Lamd;->a:Landroid/view/View;

    invoke-virtual {p1, p0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final h(II)V
    .registers 3

    iget-object p1, p0, Lamd;->a:Landroid/view/View;

    invoke-virtual {p1, p0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final run()V
    .registers 3

    iget-object v0, p0, Lamd;->b:Li4d;

    iget-object v0, v0, Li4d;->b:Ljava/lang/Object;

    check-cast v0, Lzld;

    iget-object v0, v0, Lzld;->h:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_11

    const/4 v0, 0x4

    goto :goto_12

    :cond_11
    const/4 v0, 0x0

    :goto_12
    iget-object p0, p0, Lamd;->a:Landroid/view/View;

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method
