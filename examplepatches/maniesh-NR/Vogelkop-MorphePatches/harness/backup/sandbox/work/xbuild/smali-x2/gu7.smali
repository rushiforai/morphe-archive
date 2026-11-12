.class public final synthetic Lgu7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lhu7;

.field public final synthetic c:Ldu7;


# direct methods
.method public synthetic constructor <init>(Lhu7;Ldu7;B)V
    .registers 4

    iput-byte p3, p0, Lgu7;->a:B

    iput-object p1, p0, Lgu7;->b:Lhu7;

    iput-object p2, p0, Lgu7;->c:Ldu7;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 5

    iget-byte p1, p0, Lgu7;->a:B

    iget-object v0, p0, Lgu7;->c:Ldu7;

    iget-object p0, p0, Lgu7;->b:Lhu7;

    packed-switch p1, :pswitch_data_88

    iget-object p0, p0, Lhu7;->c:Lx77;

    iget-object p1, v0, Ldu7;->k:Ljava/lang/String;

    iget-object v0, p0, Lx77;->d:Ljava/lang/Object;

    check-cast v0, Llv7;

    invoke-virtual {v0}, Llv7;->invoke()Ljava/lang/Object;

    iget-object p0, p0, Lx77;->c:Ljava/lang/Object;

    check-cast p0, Lwjh;

    iget-object v0, p0, Lwjh;->e:Ljava/lang/Object;

    check-cast v0, Lhd;

    iget-object p0, p0, Lwjh;->b:Ljava/lang/Object;

    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    iget-object v0, v0, Lhd;->g:Ljava/lang/Object;

    check-cast v0, Lqde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_32
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Ljx1;

    invoke-interface {v2}, Ljx1;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_32

    goto :goto_4b

    :cond_4a
    const/4 v1, 0x0

    :goto_4b
    check-cast v1, Ljx1;

    if-eqz v1, :cond_7e

    instance-of p1, v1, Lvx1;

    if-eqz p1, :cond_77

    check-cast v1, Lvx1;

    iget-object p1, v1, Lvx1;->b:Lwxe;

    instance-of v0, p1, Lqx1;

    if-eqz v0, :cond_7e

    check-cast p1, Lqx1;

    iget-object v0, p1, Lqx1;->m:Ljava/io/File;

    invoke-static {v0}, Lw7d;->x(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object p1, p1, Lqx1;->n:Ljava/lang/String;

    invoke-virtual {v1, v0, p1}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    const/4 p1, 0x1

    invoke-virtual {v1, p1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {p0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_7e

    :cond_77
    instance-of p0, v1, Lfz1;

    if-nez p0, :cond_7e

    invoke-static {}, Lh9o;->p()V

    :cond_7e
    :goto_7e
    return-void

    :pswitch_7f
    iget-object p0, p0, Lhu7;->c:Lx77;

    iget-object p1, v0, Ldu7;->k:Ljava/lang/String;

    invoke-virtual {p0, p1}, Lx77;->m(Ljava/lang/String;)V

    return-void

    nop

    :pswitch_data_88
    .packed-switch 0x0
        :pswitch_7f
    .end packed-switch
.end method
