.class public final synthetic Lg9j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:La21;


# direct methods
.method public synthetic constructor <init>(La21;B)V
    .registers 3

    iput-byte p2, p0, Lg9j;->a:B

    iput-object p1, p0, Lg9j;->b:La21;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 5

    iget-byte v0, p0, Lg9j;->a:B

    const/4 v1, 0x1

    iget-object p0, p0, Lg9j;->b:La21;

    packed-switch v0, :pswitch_data_8c

    check-cast p1, Lix4;

    iget-object p0, p0, La21;->f:Ljava/lang/Object;

    check-cast p0, Lami;

    iget-object v0, p0, Lami;->g:Ljava/lang/Object;

    check-cast v0, Ljava/util/Set;

    check-cast v0, Ljava/lang/Iterable;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->m0(Ljava/lang/Iterable;)Ljava/util/LinkedHashSet;

    move-result-object v0

    iget-object v2, p1, Lix4;->a:Ljava/util/LinkedHashSet;

    invoke-interface {v0, v2}, Ljava/util/Set;->removeAll(Ljava/util/Collection;)Z

    iget-object p1, p1, Lix4;->b:Ljava/util/Set;

    check-cast p1, Ljava/util/Collection;

    invoke-interface {v0, p1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    iget-object p1, p0, Lami;->g:Ljava/lang/Object;

    check-cast p1, Ljava/util/Set;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_4b

    iput-object v0, p0, Lami;->g:Ljava/lang/Object;

    iget-object p1, p0, Lami;->c:Ljava/lang/Object;

    check-cast p1, Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lekc;

    invoke-virtual {p1}, Lekc;->h()Z

    move-result p1

    if-eqz p1, :cond_44

    invoke-virtual {p0}, Lami;->q()V

    goto :goto_4b

    :cond_44
    iget-object p0, p0, Lami;->h:Ljava/lang/Object;

    check-cast p0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    :cond_4b
    :goto_4b
    return-void

    :pswitch_4c
    check-cast p1, Lr6j;

    iget-object p0, p0, La21;->f:Ljava/lang/Object;

    check-cast p0, Lami;

    invoke-virtual {p0, p1}, Lami;->C(Lr6j;)V

    iget-object p1, p1, Lr6j;->j:Lo6j;

    iget-object p1, p1, Lo6j;->b:Ljava/util/List;

    check-cast p1, Ljava/lang/Iterable;

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_5f
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6f

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lr6j;

    invoke-virtual {p0, v0}, Lami;->C(Lr6j;)V

    goto :goto_5f

    :cond_6f
    iget-object p1, p0, Lami;->c:Ljava/lang/Object;

    check-cast p1, Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lekc;

    invoke-virtual {p1}, Lekc;->h()Z

    move-result p1

    if-eqz p1, :cond_83

    invoke-virtual {p0}, Lami;->q()V

    goto :goto_8a

    :cond_83
    iget-object p0, p0, Lami;->h:Ljava/lang/Object;

    check-cast p0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    :goto_8a
    return-void

    nop

    :pswitch_data_8c
    .packed-switch 0x0
        :pswitch_4c
    .end packed-switch
.end method
