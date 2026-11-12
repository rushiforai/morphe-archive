.class public final Lu6p;
.super Lozb;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic i:B

.field public final synthetic j:Lo7p;


# direct methods
.method public synthetic constructor <init>(Lo7p;B)V
    .registers 3

    iput-byte p2, p0, Lu6p;->i:B

    iput-object p1, p0, Lu6p;->j:Lo7p;

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lozb;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7

    iget-byte v0, p0, Lu6p;->i:B

    const/4 v1, 0x0

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_13e

    check-cast p1, Lbap;

    iget-object p0, p0, Lu6p;->j:Lo7p;

    iget-object p1, p0, Lo7p;->n:Lne5;

    if-eqz p1, :cond_12

    invoke-virtual {p1}, Lne5;->o()V

    :cond_12
    iput-object v1, p0, Lo7p;->n:Lne5;

    iget-object p1, p0, Lpxo;->g:Lsxo;

    if-eqz p1, :cond_25

    iget-object v0, p1, Lsxo;->a:Luio;

    if-eqz v0, :cond_1f

    invoke-virtual {v0}, Luio;->c()V

    :cond_1f
    iput-object v1, p1, Lsxo;->a:Luio;

    iput-object v1, p1, Lsxo;->b:Lzy9;

    iput-object v1, p1, Lsxo;->c:Lqe6;

    :cond_25
    iput-object v1, p0, Lpxo;->g:Lsxo;

    iget-object p1, p0, Lpxo;->d:Lvoo;

    check-cast p1, Ly2p;

    if-eqz p1, :cond_47

    iget-object v0, p1, Ly2p;->D:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lsro;

    if-eqz v0, :cond_3a

    invoke-virtual {v0}, Lsro;->d()V

    :cond_3a
    iget-object p1, p1, Ly2p;->E:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lsro;

    if-eqz p1, :cond_47

    invoke-virtual {p1}, Lsro;->d()V

    :cond_47
    iget-object p1, p0, Lo7p;->o:Lny3;

    if-eqz p1, :cond_4e

    invoke-virtual {p1}, Lny3;->b()V

    :cond_4e
    iget-object p1, p0, Lo7p;->m:Ligi;

    if-eqz p1, :cond_6d

    invoke-virtual {p1}, Ligi;->a()Ljava/util/LinkedHashSet;

    move-result-object p1

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_5a
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6d

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    goto :goto_5a

    :cond_6d
    iput-object v1, p0, Lo7p;->m:Ligi;

    iget-object p1, p0, Lo7p;->l:Landroid/view/View;

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {p1, v0}, Lkotlin/collections/CollectionsKt;->I(Ljava/lang/Iterable;Ljava/util/AbstractCollection;)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p1

    move v3, v2

    :goto_82
    if-ge v3, p1, :cond_96

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    check-cast v4, Landroid/view/View;

    invoke-virtual {v4, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v4, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    invoke-static {v4}, Lxgh;->g(Landroid/view/View;)V

    goto :goto_82

    :cond_96
    iput-object v1, p0, Lo7p;->l:Landroid/view/View;

    iget-object p1, p0, Lo7p;->k:Liko;

    if-eqz p1, :cond_ab

    iget-object p1, p1, Liko;->a:Landroid/widget/FrameLayout;

    sget v0, Liko;->b:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lkko;

    if-eqz p1, :cond_ab

    invoke-static {p1}, Lxgh;->g(Landroid/view/View;)V

    :cond_ab
    iput-object v1, p0, Lo7p;->k:Liko;

    iget-object p1, p0, Lpxo;->f:Landroid/view/ViewGroup;

    if-eqz p1, :cond_b7

    invoke-virtual {p1, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p1, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    :cond_b7
    iput-object v1, p0, Lpxo;->f:Landroid/view/ViewGroup;

    iput-object v1, p0, Lo7p;->p:Ljkp;

    iget-object p0, p0, Lpxo;->h:Lne5;

    if-eqz p0, :cond_ef

    iget-object p1, p0, Lne5;->b:Ljava/lang/Object;

    check-cast p1, Ljava/util/WeakHashMap;

    invoke-virtual {p1}, Ljava/util/WeakHashMap;->clear()V

    iget-object p1, p0, Lne5;->c:Ljava/lang/Object;

    check-cast p1, Ljava/util/WeakHashMap;

    invoke-virtual {p1}, Ljava/util/WeakHashMap;->clear()V

    iget-object p1, p0, Lne5;->d:Ljava/lang/Object;

    check-cast p1, Ljava/util/WeakHashMap;

    invoke-virtual {p1}, Ljava/util/WeakHashMap;->clear()V

    iget-object p1, p0, Lne5;->a:Ljava/lang/Object;

    check-cast p1, Ltuj;

    iget-object v0, p1, Ltuj;->g:Ljava/lang/Object;

    check-cast v0, Ljava/util/WeakHashMap;

    invoke-virtual {v0}, Ljava/util/WeakHashMap;->clear()V

    iget-object v0, p1, Ltuj;->k:Ljava/lang/Object;

    check-cast v0, Landroid/os/Handler;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeMessages(I)V

    iput-boolean v2, p1, Ltuj;->c:Z

    iget-object p0, p0, Lne5;->e:Ljava/lang/Object;

    check-cast p0, Landroid/os/Handler;

    invoke-virtual {p0, v2}, Landroid/os/Handler;->removeMessages(I)V

    :cond_ef
    return-object v1

    :pswitch_f0
    check-cast p1, Ljava/lang/Throwable;

    if-eqz p1, :cond_f6

    const/16 v2, 0x3e9

    :cond_f6
    iget-object p0, p0, Lu6p;->j:Lo7p;

    iget-object p0, p0, Lpxo;->i:Lp7p;

    if-eqz p0, :cond_ff

    invoke-virtual {p0, v2}, Lp7p;->a(I)V

    :cond_ff
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_102
    check-cast p1, Ljava/lang/String;

    iget-object p0, p0, Lu6p;->j:Lo7p;

    const-string v0, "media"

    invoke-virtual {p0, v0, p1}, Lo7p;->h(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_10e
    check-cast p1, Lbap;

    iget-object p0, p0, Lu6p;->j:Lo7p;

    iget-object p1, p0, Lo7p;->o:Lny3;

    if-eqz p1, :cond_138

    iget-boolean v0, p1, Lny3;->a:Z

    if-nez v0, :cond_138

    invoke-virtual {p1}, Lny3;->b()V

    iget-object v0, p1, Lny3;->h:Ljava/lang/Object;

    check-cast v0, Llzo;

    if-eqz v0, :cond_126

    invoke-virtual {v0}, Llzo;->a()V

    :cond_126
    iput-object v1, p1, Lny3;->h:Ljava/lang/Object;

    iget-object v0, p1, Lny3;->i:Ljava/lang/Object;

    check-cast v0, Lne5;

    if-eqz v0, :cond_131

    invoke-virtual {v0}, Lne5;->o()V

    :cond_131
    iput-object v1, p1, Lny3;->i:Ljava/lang/Object;

    iput-object v1, p1, Lny3;->g:Ljava/lang/Object;

    const/4 v0, 0x1

    iput-boolean v0, p1, Lny3;->a:Z

    :cond_138
    iput-object v1, p0, Lo7p;->o:Lny3;

    invoke-static {p0}, Lo7p;->g(Lo7p;)V

    return-object v1

    :pswitch_data_13e
    .packed-switch 0x0
        :pswitch_10e
        :pswitch_102
        :pswitch_f0
    .end packed-switch
.end method
