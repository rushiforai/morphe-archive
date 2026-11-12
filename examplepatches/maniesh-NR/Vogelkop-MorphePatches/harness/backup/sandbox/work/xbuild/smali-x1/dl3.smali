.class public final Ldl3;
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

    iput-byte p2, p0, Ldl3;->a:B

    iput-object p1, p0, Ldl3;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final A(Lal3;Lml3;)V
    .registers 5

    iget-byte v0, p0, Ldl3;->a:B

    iget-object v1, p0, Ldl3;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_40

    :pswitch_7
    return-void

    :pswitch_8
    invoke-interface {p1}, Lol3;->g()Z

    move-result p1

    if-nez p1, :cond_18

    check-cast v1, Lsom;

    const/4 p1, 0x1

    iput-boolean p1, v1, Lsom;->k:Z

    iget-object p1, v1, Lsom;->c:Li53;

    invoke-virtual {p1, p0}, Li53;->f(Lql3;)V

    :cond_18
    return-void

    :pswitch_19
    invoke-virtual {p0}, Ldl3;->b()V

    return-void

    :pswitch_1d
    check-cast v1, Lgn3;

    iget-object p0, v1, Lgn3;->t:Lim3;

    invoke-virtual {p0}, Lim3;->N0()V

    return-void

    :pswitch_25
    invoke-interface {p1}, Lol3;->g()Z

    move-result p0

    if-nez p0, :cond_3b

    check-cast v1, Leme;

    check-cast p1, Lpl3;

    iget-object p0, v1, Leme;->a:Ljava/lang/Object;

    check-cast p0, Lvnj;

    invoke-static {p1}, Leme;->q0(Lpl3;)Lknj;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2}, Lvnj;->f(Lknj;Lkotlin/jvm/functions/Function1;)Lifd;

    :cond_3b
    return-void

    :pswitch_3c
    invoke-virtual {p0, p2}, Ldl3;->n(Lml3;)V

    return-void

    :pswitch_data_40
    .packed-switch 0x0
        :pswitch_3c
        :pswitch_25
        :pswitch_1d
        :pswitch_7
        :pswitch_19
        :pswitch_8
    .end packed-switch
.end method

.method public final D(Ljava/util/Collection;Lml3;)V
    .registers 6

    iget-byte v0, p0, Ldl3;->a:B

    const/4 v1, 0x0

    iget-object v2, p0, Ldl3;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_8c

    return-void

    :pswitch_9
    invoke-virtual {p0}, Ldl3;->b()V

    return-void

    :pswitch_d
    check-cast v2, Lss7;

    iget-object p0, v2, Lss7;->B:Lml3;

    const/4 p2, 0x0

    if-eqz p0, :cond_1f

    move-object v0, p1

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1f

    iput-object p2, v2, Lss7;->B:Lml3;

    :cond_1f
    iget-object p0, v2, Lss7;->v:Lal3;

    if-eqz p0, :cond_2d

    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2d

    iput-object p2, v2, Lss7;->v:Lal3;

    :cond_2d
    return-void

    :pswitch_2e
    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p2

    :goto_34
    if-ge v1, p2, :cond_42

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    add-int/lit8 v1, v1, 0x1

    check-cast v0, Lal3;

    invoke-virtual {p0, v0}, Ldl3;->l(Lal3;)V

    goto :goto_34

    :cond_42
    check-cast v2, Lgn3;

    iget-object p0, v2, Lgn3;->t:Lim3;

    invoke-virtual {p0}, Lim3;->N0()V

    return-void

    :pswitch_4a
    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p0

    :goto_50
    if-ge v1, p0, :cond_71

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    add-int/lit8 v1, v1, 0x1

    check-cast p2, Lal3;

    invoke-interface {p2}, Lol3;->g()Z

    move-result v0

    if-nez v0, :cond_71

    move-object v0, v2

    check-cast v0, Leme;

    check-cast p2, Lpl3;

    iget-object v0, v0, Leme;->a:Ljava/lang/Object;

    check-cast v0, Lvnj;

    invoke-static {p2}, Leme;->q0(Lpl3;)Lknj;

    move-result-object p2

    invoke-virtual {v0, p2}, Lvnj;->j(Lknj;)V

    goto :goto_50

    :cond_71
    return-void

    :pswitch_72
    check-cast v2, Lfl3;

    iget-object v0, v2, Lfl3;->s:Ljl3;

    if-eqz v0, :cond_87

    iget-object v0, v0, Lll3;->a:Lal3;

    check-cast v0, Lml3;

    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_87

    invoke-virtual {v2}, Lfl3;->H0()Z

    :cond_87
    invoke-virtual {p0, p2}, Ldl3;->n(Lml3;)V

    return-void

    nop

    :pswitch_data_8c
    .packed-switch 0x0
        :pswitch_72
        :pswitch_4a
        :pswitch_2e
        :pswitch_d
        :pswitch_9
    .end packed-switch
.end method

.method public final a(Lcom/opera/android/bookmarks/b;Lcom/opera/android/bookmarks/c;Lcom/opera/android/bookmarks/c;)V
    .registers 4

    iget-byte p1, p0, Ldl3;->a:B

    packed-switch p1, :pswitch_data_a

    return-void

    :pswitch_6
    invoke-virtual {p0, p2}, Ldl3;->n(Lml3;)V

    return-void

    :pswitch_data_a
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final b()V
    .registers 2

    iget-object p0, p0, Ldl3;->b:Ljava/lang/Object;

    check-cast p0, Ltr8;

    iget-object v0, p0, Ltr8;->e:Lwnm;

    invoke-virtual {v0}, Lekc;->h()Z

    move-result v0

    if-eqz v0, :cond_d

    return-void

    :cond_d
    invoke-virtual {p0}, Ltr8;->a()V

    return-void
.end method

.method public final c()V
    .registers 1

    return-void
.end method

.method public final d(Ljava/util/Collection;Lml3;Lml3;)V
    .registers 4

    iget-byte p1, p0, Ldl3;->a:B

    packed-switch p1, :pswitch_data_a

    return-void

    :pswitch_6
    invoke-virtual {p0, p2}, Ldl3;->n(Lml3;)V

    return-void

    :pswitch_data_a
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final e(Lcom/opera/android/bookmarks/b;Lcom/opera/android/bookmarks/c;)V
    .registers 4

    iget-byte p2, p0, Ldl3;->a:B

    iget-object v0, p0, Ldl3;->b:Ljava/lang/Object;

    packed-switch p2, :pswitch_data_2e

    :pswitch_7
    return-void

    :pswitch_8
    invoke-virtual {p0}, Ldl3;->b()V

    return-void

    :pswitch_c
    invoke-interface {p1}, Lol3;->g()Z

    move-result p0

    if-eqz p0, :cond_17

    check-cast v0, Lgn3;

    invoke-virtual {v0}, Lgn3;->g()V

    :cond_17
    return-void

    :pswitch_18
    invoke-interface {p1}, Lol3;->g()Z

    move-result p0

    if-nez p0, :cond_2d

    check-cast v0, Leme;

    check-cast p1, Lpl3;

    iget-object p0, v0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Lvnj;

    invoke-static {p1}, Leme;->q0(Lpl3;)Lknj;

    move-result-object p1

    invoke-virtual {p0, p1}, Lvnj;->m(Lknj;)V

    :cond_2d
    return-void

    :pswitch_data_2e
    .packed-switch 0x1
        :pswitch_18
        :pswitch_c
        :pswitch_7
        :pswitch_8
    .end packed-switch
.end method

.method public final f(Lal3;Lml3;)V
    .registers 3

    return-void
.end method

.method public final g(Lcom/opera/android/bookmarks/b;Lcom/opera/android/bookmarks/c;Lcom/opera/android/bookmarks/c;)V
    .registers 4

    return-void
.end method

.method public final h(Lcom/opera/android/bookmarks/b;Lcom/opera/android/bookmarks/c;)V
    .registers 3

    return-void
.end method

.method public final i(Lcom/opera/android/bookmarks/b;Lcom/opera/android/bookmarks/c;)V
    .registers 3

    return-void
.end method

.method public final j(Ljava/util/Collection;Lml3;Lml3;)V
    .registers 4

    return-void
.end method

.method public final k(Ljava/util/Collection;Lml3;)V
    .registers 3

    return-void
.end method

.method public final l(Lal3;)V
    .registers 4

    iget-object p0, p0, Ldl3;->b:Ljava/lang/Object;

    check-cast p0, Lgn3;

    iget-object v0, p0, Lgn3;->a:Ljava/util/ArrayList;

    invoke-interface {p1}, Lol3;->g()Z

    move-result v1

    if-eqz v1, :cond_2e

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2e

    check-cast p1, Lml3;

    new-instance v1, Lym3;

    invoke-direct {v1, p1}, Lym3;-><init>(Lml3;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result p1

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ne p1, v1, :cond_29

    invoke-virtual {p0}, Lgn3;->d()V

    return-void

    :cond_29
    if-lez p1, :cond_2e

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    :cond_2e
    return-void
.end method

.method public final m()V
    .registers 5

    iget-byte v0, p0, Ldl3;->a:B

    iget-object p0, p0, Ldl3;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_82

    return-void

    :pswitch_8
    check-cast p0, Lss7;

    iget-object v0, p0, Lss7;->B:Lml3;

    const/4 v1, 0x0

    if-eqz v0, :cond_11

    iput-object v1, p0, Lss7;->B:Lml3;

    :cond_11
    iget-object v0, p0, Lss7;->v:Lal3;

    if-eqz v0, :cond_17

    iput-object v1, p0, Lss7;->v:Lal3;

    :cond_17
    return-void

    :pswitch_18
    check-cast p0, Lgn3;

    iget-object v0, p0, Lgn3;->a:Ljava/util/ArrayList;

    :goto_1c
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x2

    if-le v1, v2, :cond_28

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_1c

    :cond_28
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ne v0, v2, :cond_31

    invoke-virtual {p0}, Lgn3;->d()V

    :cond_31
    iget-object p0, p0, Lgn3;->t:Lim3;

    invoke-virtual {p0}, Lim3;->N0()V

    return-void

    :pswitch_37
    check-cast p0, Leme;

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Lvnj;

    sget-object v0, Lmnj;->a:Lmnj;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lvnj;->e:Ljava/util/ArrayList;

    new-instance v2, Ll51;

    invoke-direct {v2, v0}, Ll51;-><init>(Ljava/util/ArrayList;)V

    invoke-static {v1, v2}, Lo95;->v(Ljava/util/List;Lkotlin/jvm/functions/Function1;)V

    iget-object v2, p0, Lvnj;->g:Lfnj;

    if-eqz v2, :cond_59

    invoke-virtual {p0}, Lvnj;->c()V

    goto :goto_61

    :cond_59
    new-instance p0, Lrnj;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_61
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p0

    const/4 v1, 0x0

    :goto_66
    if-ge v1, p0, :cond_76

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Lkotlin/jvm/functions/Function1;

    sget-object v3, Lnnj;->a:Lnnj;

    invoke-interface {v2, v3}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_66

    :cond_76
    return-void

    :pswitch_77
    check-cast p0, Lfl3;

    iget-object v0, p0, Lfl3;->s:Ljl3;

    if-eqz v0, :cond_80

    invoke-virtual {p0}, Lfl3;->H0()Z

    :cond_80
    return-void

    nop

    :pswitch_data_82
    .packed-switch 0x0
        :pswitch_77
        :pswitch_37
        :pswitch_18
        :pswitch_8
    .end packed-switch
.end method

.method public final n(Lml3;)V
    .registers 3

    iget-object p0, p0, Ldl3;->b:Ljava/lang/Object;

    check-cast p0, Lfl3;

    iget-object v0, p0, Lfl3;->s:Ljl3;

    if-eqz v0, :cond_15

    iget-object v0, v0, Lll3;->a:Lal3;

    check-cast v0, Lml3;

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_15

    invoke-virtual {p0}, Lfl3;->J0()V

    :cond_15
    return-void
.end method

.method public final s(Lcom/opera/android/bookmarks/b;Lcom/opera/android/bookmarks/c;)V
    .registers 3

    return-void
.end method

.method public final y(Lcom/opera/android/bookmarks/b;Lcom/opera/android/bookmarks/c;)V
    .registers 5

    iget-byte v0, p0, Ldl3;->a:B

    iget-object v1, p0, Ldl3;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_60

    return-void

    :pswitch_8
    invoke-virtual {p0}, Ldl3;->b()V

    return-void

    :pswitch_c
    check-cast v1, Lss7;

    iget-object p0, v1, Lss7;->B:Lml3;

    const/4 p2, 0x0

    if-eqz p0, :cond_1b

    invoke-virtual {p1, p0}, Lcom/opera/android/bookmarks/b;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1b

    iput-object p2, v1, Lss7;->B:Lml3;

    :cond_1b
    iget-object p0, v1, Lss7;->v:Lal3;

    if-eqz p0, :cond_27

    invoke-virtual {p1, p0}, Lcom/opera/android/bookmarks/b;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_27

    iput-object p2, v1, Lss7;->v:Lal3;

    :cond_27
    return-void

    :pswitch_28
    invoke-virtual {p0, p1}, Ldl3;->l(Lal3;)V

    check-cast v1, Lgn3;

    iget-object p0, v1, Lgn3;->t:Lim3;

    invoke-virtual {p0}, Lim3;->N0()V

    return-void

    :pswitch_33
    invoke-interface {p1}, Lol3;->g()Z

    move-result p0

    if-nez p0, :cond_48

    check-cast v1, Leme;

    check-cast p1, Lpl3;

    iget-object p0, v1, Leme;->a:Ljava/lang/Object;

    check-cast p0, Lvnj;

    invoke-static {p1}, Leme;->q0(Lpl3;)Lknj;

    move-result-object p1

    invoke-virtual {p0, p1}, Lvnj;->j(Lknj;)V

    :cond_48
    return-void

    :pswitch_49
    check-cast v1, Lfl3;

    iget-object v0, v1, Lfl3;->s:Ljl3;

    if-eqz v0, :cond_5c

    iget-object v0, v0, Lll3;->a:Lal3;

    check-cast v0, Lml3;

    invoke-virtual {p1, v0}, Lcom/opera/android/bookmarks/b;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5c

    invoke-virtual {v1}, Lfl3;->H0()Z

    :cond_5c
    invoke-virtual {p0, p2}, Ldl3;->n(Lml3;)V

    return-void

    :pswitch_data_60
    .packed-switch 0x0
        :pswitch_49
        :pswitch_33
        :pswitch_28
        :pswitch_c
        :pswitch_8
    .end packed-switch
.end method
