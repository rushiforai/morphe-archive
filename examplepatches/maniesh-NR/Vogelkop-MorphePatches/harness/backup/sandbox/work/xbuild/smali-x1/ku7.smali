.class public final synthetic Lku7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Li3j;


# direct methods
.method public synthetic constructor <init>(Li3j;B)V
    .registers 3

    iput-byte p2, p0, Lku7;->a:B

    iput-object p1, p0, Lku7;->b:Li3j;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    iget-byte v0, p0, Lku7;->a:B

    iget-object p0, p0, Lku7;->b:Li3j;

    packed-switch v0, :pswitch_data_9e

    check-cast p1, Ljava/util/List;

    iget-object p0, p0, Li3j;->d:Ljava/lang/Object;

    check-cast p0, Lwf;

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_16

    sget-object p1, Ll08;->a:Ll08;

    goto :goto_5d

    :cond_16
    check-cast p1, Ljava/lang/Iterable;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_21
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5c

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb0a;

    if-eqz v1, :cond_57

    instance-of v2, v1, Lzz9;

    if-eqz v2, :cond_3d

    new-instance v2, Lmu7;

    check-cast v1, Lzz9;

    iget-object v1, v1, Lzz9;->a:Ljava/lang/String;

    invoke-direct {v2, v1}, Lmu7;-><init>(Ljava/lang/String;)V

    goto :goto_53

    :cond_3d
    instance-of v2, v1, La0a;

    if-eqz v2, :cond_57

    new-instance v2, Llu7;

    check-cast v1, La0a;

    iget-object v3, v1, La0a;->a:Ljava/lang/String;

    new-instance v4, Lnw0;

    iget-object v5, v1, La0a;->b:Ljava/io/File;

    iget-object v1, v1, La0a;->c:Lo29;

    invoke-direct {v4, v5, v1}, Lnw0;-><init>(Ljava/io/File;Lo29;)V

    invoke-direct {v2, v3, v4}, Llu7;-><init>(Ljava/lang/String;Lnw0;)V

    :goto_53
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_21

    :cond_57
    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    goto :goto_80

    :cond_5c
    move-object p1, v0

    :goto_5d
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Leme;

    invoke-direct {v0, p0}, Leme;-><init>(Ljava/lang/Object;)V

    iget-object p0, p0, Ldt1;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    new-instance v1, Lik;

    const/4 v2, 0x1

    invoke-direct {v1, p0, p1, v2}, Lik;-><init>(Ljava/util/ArrayList;Ljava/util/List;B)V

    invoke-static {v1, v2}, Luup;->k(Lk1g;Z)Lj87;

    move-result-object v1

    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    check-cast p1, Ljava/util/Collection;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {v1, v0}, Lj87;->a(Lsic;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_80
    return-object p0

    :pswitch_81
    check-cast p1, Ll0a;

    iget-object p1, p1, Ll0a;->c:Ll08;

    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    iget-object p1, p0, Li3j;->a:Ljava/lang/Object;

    check-cast p1, Landroidx/recyclerview/widget/RecyclerView;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, p0, Li3j;->b:Ljava/lang/Object;

    check-cast p0, Landroid/view/View;

    if-eqz p0, :cond_9a

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_9a
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_9e
    .packed-switch 0x0
        :pswitch_81
    .end packed-switch
.end method
