.class public final synthetic Lnu7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lou7;

.field public final synthetic c:Llu7;


# direct methods
.method public synthetic constructor <init>(Lou7;Llu7;B)V
    .registers 4

    iput-byte p3, p0, Lnu7;->a:B

    iput-object p1, p0, Lnu7;->b:Lou7;

    iput-object p2, p0, Lnu7;->c:Llu7;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 5

    iget-byte p1, p0, Lnu7;->a:B

    iget-object v0, p0, Lnu7;->c:Llu7;

    iget-object p0, p0, Lnu7;->b:Lou7;

    packed-switch p1, :pswitch_data_80

    iget-object p0, p0, Lou7;->c:Lua7;

    iget-object p1, v0, Llu7;->a:Ljava/lang/String;

    iget-object v0, p0, Lua7;->d:Ljava/lang/Object;

    check-cast v0, Llv7;

    invoke-virtual {v0}, Llv7;->invoke()Ljava/lang/Object;

    iget-object p0, p0, Lua7;->c:Ljava/lang/Object;

    check-cast p0, Li3j;

    iget-object v0, p0, Li3j;->c:Ljava/lang/Object;

    check-cast v0, Ltah;

    iget-object p0, p0, Li3j;->a:Ljava/lang/Object;

    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    iget-object v0, v0, Ltah;->h:Ljava/lang/Object;

    check-cast v0, Lpde;

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

    check-cast v2, Lb0a;

    invoke-interface {v2}, Lb0a;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_32

    goto :goto_4b

    :cond_4a
    const/4 v1, 0x0

    :goto_4b
    check-cast v1, Lb0a;

    if-eqz v1, :cond_76

    instance-of p1, v1, Lzz9;

    if-nez p1, :cond_76

    instance-of p1, v1, La0a;

    if-eqz p1, :cond_73

    check-cast v1, La0a;

    iget-object p1, v1, La0a;->b:Ljava/io/File;

    invoke-static {p1}, Lw7d;->x(Ljava/io/File;)Landroid/net/Uri;

    move-result-object p1

    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object v1, v1, La0a;->d:Ljava/lang/String;

    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    const/4 p1, 0x1

    invoke-virtual {v0, p1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_76

    :cond_73
    invoke-static {}, Lh9o;->p()V

    :cond_76
    :goto_76
    return-void

    :pswitch_77
    iget-object p0, p0, Lou7;->c:Lua7;

    iget-object p1, v0, Llu7;->a:Ljava/lang/String;

    invoke-virtual {p0, p1}, Lua7;->L(Ljava/lang/String;)V

    return-void

    nop

    :pswitch_data_80
    .packed-switch 0x0
        :pswitch_77
    .end packed-switch
.end method
