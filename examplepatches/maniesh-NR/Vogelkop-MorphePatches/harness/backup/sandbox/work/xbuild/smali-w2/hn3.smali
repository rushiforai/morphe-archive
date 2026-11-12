.class public final Lhn3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lql3;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lhn3;->a:B

    iput-object p1, p0, Lhn3;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final b(Lcom/opera/android/bookmarks/b;Lcom/opera/android/bookmarks/c;)V
    .registers 3

    return-void
.end method

.method private final c(Lcom/opera/android/bookmarks/b;Lcom/opera/android/bookmarks/c;)V
    .registers 3

    return-void
.end method

.method private final f(Lcom/opera/android/bookmarks/b;Lcom/opera/android/bookmarks/c;Lcom/opera/android/bookmarks/c;)V
    .registers 4

    return-void
.end method

.method private final g(Ljava/util/Collection;Lml3;Lml3;)V
    .registers 4

    return-void
.end method


# virtual methods
.method public final A(Lal3;Lml3;)V
    .registers 3

    iget-byte p2, p0, Lhn3;->a:B

    iget-object p0, p0, Lhn3;->b:Ljava/lang/Object;

    packed-switch p2, :pswitch_data_28

    check-cast p0, Lin3;

    invoke-virtual {p0}, Lin3;->a()V

    return-void

    :pswitch_d
    check-cast p0, Lne5;

    iget-object p2, p0, Lne5;->b:Ljava/lang/Object;

    check-cast p2, Ljava/util/ArrayList;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object p2, p0, Lne5;->c:Ljava/lang/Object;

    check-cast p2, Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Lne5;->t(Lal3;Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_27

    iget-object p0, p0, Lne5;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_27
    return-void

    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method

.method public final D(Ljava/util/Collection;Lml3;)V
    .registers 3

    iget-byte p2, p0, Lhn3;->a:B

    iget-object p0, p0, Lhn3;->b:Ljava/lang/Object;

    packed-switch p2, :pswitch_data_24

    check-cast p0, Lin3;

    iget-object p2, p0, Lin3;->b:Ljava/util/ArrayList;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    invoke-virtual {p0}, Lin3;->a()V

    return-void

    :pswitch_12
    check-cast p0, Lne5;

    iget-object p2, p0, Lne5;->b:Ljava/lang/Object;

    check-cast p2, Ljava/util/ArrayList;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    iget-object p0, p0, Lne5;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    return-void

    nop

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_12
    .end packed-switch
.end method

.method public final a(Lcom/opera/android/bookmarks/b;Lcom/opera/android/bookmarks/c;Lcom/opera/android/bookmarks/c;)V
    .registers 4

    iget-byte p2, p0, Lhn3;->a:B

    packed-switch p2, :pswitch_data_10

    return-void

    :pswitch_6
    iget-object p0, p0, Lhn3;->b:Ljava/lang/Object;

    check-cast p0, Lne5;

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2}, Lne5;->U(Lal3;Z)V

    return-void

    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final d(Ljava/util/Collection;Lml3;Lml3;)V
    .registers 4

    iget-byte p2, p0, Lhn3;->a:B

    packed-switch p2, :pswitch_data_22

    return-void

    :pswitch_6
    check-cast p1, Ljava/lang/Iterable;

    iget-object p0, p0, Lhn3;->b:Ljava/lang/Object;

    check-cast p0, Lne5;

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_10
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_21

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lal3;

    const/4 p3, 0x0

    invoke-virtual {p0, p2, p3}, Lne5;->U(Lal3;Z)V

    goto :goto_10

    :cond_21
    return-void

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final e(Lcom/opera/android/bookmarks/b;Lcom/opera/android/bookmarks/c;)V
    .registers 3

    iget-byte p2, p0, Lhn3;->a:B

    iget-object p0, p0, Lhn3;->b:Ljava/lang/Object;

    packed-switch p2, :pswitch_data_14

    check-cast p0, Lin3;

    invoke-virtual {p0}, Lin3;->a()V

    return-void

    :pswitch_d
    check-cast p0, Lne5;

    const/4 p2, 0x1

    invoke-virtual {p0, p1, p2}, Lne5;->U(Lal3;Z)V

    return-void

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method

.method public final m()V
    .registers 2

    iget-byte v0, p0, Lhn3;->a:B

    iget-object p0, p0, Lhn3;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_24

    check-cast p0, Lin3;

    iget-object v0, p0, Lin3;->b:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    invoke-virtual {p0}, Lin3;->a()V

    return-void

    :pswitch_12
    check-cast p0, Lne5;

    iget-object v0, p0, Lne5;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget-object p0, p0, Lne5;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    return-void

    nop

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_12
    .end packed-switch
.end method

.method public final s(Lcom/opera/android/bookmarks/b;Lcom/opera/android/bookmarks/c;)V
    .registers 3

    iget-byte p0, p0, Lhn3;->a:B

    return-void
.end method

.method public final y(Lcom/opera/android/bookmarks/b;Lcom/opera/android/bookmarks/c;)V
    .registers 3

    iget-byte p2, p0, Lhn3;->a:B

    iget-object p0, p0, Lhn3;->b:Ljava/lang/Object;

    packed-switch p2, :pswitch_data_24

    check-cast p0, Lin3;

    iget-object p2, p0, Lin3;->b:Ljava/util/ArrayList;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lin3;->a()V

    return-void

    :pswitch_12
    check-cast p0, Lne5;

    iget-object p2, p0, Lne5;->b:Ljava/lang/Object;

    check-cast p2, Ljava/util/ArrayList;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    iget-object p0, p0, Lne5;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    return-void

    nop

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_12
    .end packed-switch
.end method
