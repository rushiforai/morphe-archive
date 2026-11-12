.class public final Lcom/opera/android/favorites/d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lus8;


# instance fields
.field public final synthetic a:Lcom/opera/android/favorites/e;


# direct methods
.method public constructor <init>(Lcom/opera/android/favorites/e;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/opera/android/favorites/d;->a:Lcom/opera/android/favorites/e;

    return-void
.end method


# virtual methods
.method public final a(IJJJ)V
    .registers 10

    iget-object p0, p0, Lcom/opera/android/favorites/d;->a:Lcom/opera/android/favorites/e;

    invoke-virtual {p0, p4, p5}, Lcom/opera/android/favorites/e;->m(J)Ltq8;

    move-result-object p4

    invoke-virtual {p0, p6, p7}, Lcom/opera/android/favorites/e;->m(J)Ltq8;

    move-result-object p5

    if-eqz p4, :cond_89

    if-ne p4, p5, :cond_7b

    invoke-virtual {p4, p2, p3}, Ltq8;->v(J)Lhq8;

    move-result-object p2

    iget-object p0, p0, Lcom/opera/android/favorites/e;->g:Lcom/opera/android/favorites/b;

    if-ne p4, p0, :cond_34

    sget-object p0, Lcom/opera/android/favorites/FavoritesBridge;->a:Li7f;

    invoke-static {}, LJ/N;->M6CPNhwN()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/favorites/FavoritesBridge$Folder;

    invoke-static {}, LJ/N;->MucQ9eao()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/opera/android/favorites/FavoritesBridge$Folder;

    iget-wide p5, p3, Lcom/opera/android/favorites/FavoritesBridge$Favorite;->a:J

    invoke-static {p5, p6}, LJ/N;->Mvi8cy50(J)J

    move-result-wide p5

    iget-wide v0, p0, Lcom/opera/android/favorites/FavoritesBridge$Favorite;->a:J

    invoke-static {v0, v1, p5, p6}, LJ/N;->MeT67pAE(JJ)I

    move-result p0

    if-le p1, p0, :cond_34

    add-int/lit8 p1, p1, -0x1

    :cond_34
    if-eqz p2, :cond_89

    iget-object p0, p2, Lhq8;->b:Ltq8;

    const/4 p3, -0x1

    if-eq p0, p4, :cond_3d

    move p0, p3

    goto :goto_3f

    :cond_3d
    iget p0, p2, Lhq8;->c:I

    :goto_3f
    if-eq p0, p1, :cond_89

    const/4 p5, 0x0

    iput-object p5, p2, Lhq8;->b:Ltq8;

    iget-object p5, p4, Ltq8;->e:Ljava/util/ArrayList;

    invoke-virtual {p5, p2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    iget-object p5, p4, Ltq8;->g:Lj1d;

    invoke-virtual {p2}, Lhq8;->e()J

    move-result-wide p6

    invoke-virtual {p5, p6, p7}, Lj1d;->i(J)V

    iget p5, p2, Lhq8;->c:I

    invoke-virtual {p4, p5}, Ltq8;->C(I)V

    iput p3, p2, Lhq8;->c:I

    invoke-virtual {p4, p1, p2}, Ltq8;->x(ILhq8;)V

    iget-object p1, p4, Ltq8;->f:Ljava/util/HashSet;

    invoke-virtual {p1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_62
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_72

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lsq8;

    invoke-interface {p3, p0, p2}, Lsq8;->u(ILhq8;)V

    goto :goto_62

    :cond_72
    iget-object p0, p4, Lhq8;->b:Ltq8;

    if-eqz p0, :cond_89

    const/4 p1, 0x3

    invoke-virtual {p0, p1, p4}, Lhq8;->n(ILhq8;)V

    return-void

    :cond_7b
    if-eqz p5, :cond_89

    invoke-virtual {p4, p2, p3}, Ltq8;->v(J)Lhq8;

    move-result-object p0

    if-eqz p0, :cond_89

    invoke-virtual {p4, p0}, Ltq8;->A(Lhq8;)V

    invoke-virtual {p5, p1, p0}, Ltq8;->s(ILhq8;)V

    :cond_89
    return-void
.end method

.method public final b(JJI)V
    .registers 7

    iget-object p0, p0, Lcom/opera/android/favorites/d;->a:Lcom/opera/android/favorites/e;

    invoke-virtual {p0, p3, p4}, Lcom/opera/android/favorites/e;->m(J)Ltq8;

    move-result-object p3

    if-eqz p3, :cond_68

    invoke-virtual {p3, p1, p2}, Ltq8;->v(J)Lhq8;

    move-result-object p4

    if-nez p4, :cond_68

    sget-object p4, Lcom/opera/android/favorites/FavoritesBridge;->a:Li7f;

    invoke-static {p1, p2}, LJ/N;->MlC86rB6(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/opera/android/favorites/FavoritesBridge$Favorite;

    invoke-virtual {p0, p1}, Lcom/opera/android/favorites/e;->n(Lcom/opera/android/favorites/FavoritesBridge$Favorite;)Lhq8;

    move-result-object p1

    invoke-virtual {p3, p5, p1}, Ltq8;->s(ILhq8;)V

    instance-of p2, p1, Lcom/opera/android/favorites/h;

    if-nez p2, :cond_53

    iget-object p2, p0, Lcom/opera/android/favorites/e;->c:Lcul;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Lhq8;->j()Z

    move-result p4

    if-nez p4, :cond_53

    invoke-virtual {p1}, Lhq8;->c()Ljava/lang/String;

    move-result-object p4

    iget-object p5, p2, Lcul;->c:Ljava/util/HashMap;

    invoke-virtual {p5, p4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p5

    check-cast p5, Lbul;

    iget-object v0, p2, Lcul;->b:Ljava/util/ArrayList;

    invoke-virtual {v0, p4}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_53

    if-eqz p5, :cond_49

    iget-object p5, p5, Lbul;->b:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p5}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result p5

    goto :goto_4a

    :cond_49
    const/4 p5, 0x0

    :goto_4a
    invoke-virtual {p2, p5, p4}, Lcul;->a(ILjava/lang/String;)Z

    move-result p4

    if-eqz p4, :cond_53

    invoke-virtual {p2}, Lcul;->b()V

    :cond_53
    iget-object p2, p0, Lcom/opera/android/favorites/e;->g:Lcom/opera/android/favorites/b;

    if-ne p3, p2, :cond_68

    invoke-virtual {p1}, Lhq8;->j()Z

    move-result p2

    if-eqz p2, :cond_68

    iget-object p2, p0, Lcom/opera/android/favorites/e;->f:Lcom/opera/android/favorites/b;

    if-eq p1, p2, :cond_68

    iget-object p0, p0, Lcom/opera/android/favorites/e;->e:Lzzj;

    check-cast p1, Ltq8;

    invoke-virtual {p0, p1}, Lzzj;->b(Ltq8;)V

    :cond_68
    return-void
.end method

.method public final d(JJJ)V
    .registers 7

    iget-object p0, p0, Lcom/opera/android/favorites/d;->a:Lcom/opera/android/favorites/e;

    invoke-virtual {p0, p3, p4}, Lcom/opera/android/favorites/e;->m(J)Ltq8;

    move-result-object p0

    if-eqz p0, :cond_34

    invoke-virtual {p0, p1, p2}, Ltq8;->v(J)Lhq8;

    move-result-object p0

    const-wide/16 p1, 0x1

    and-long/2addr p1, p5

    const-wide/16 p3, 0x0

    cmp-long p1, p1, p3

    if-eqz p1, :cond_18

    invoke-virtual {p0}, Lhq8;->r()V

    :cond_18
    invoke-virtual {p0}, Lhq8;->j()Z

    move-result p1

    if-nez p1, :cond_29

    const-wide/16 p1, 0x2

    and-long/2addr p1, p5

    cmp-long p1, p1, p3

    if-eqz p1, :cond_29

    const/4 p1, 0x5

    invoke-virtual {p0, p1, p0}, Lhq8;->n(ILhq8;)V

    :cond_29
    const-wide/16 p1, 0x4

    and-long/2addr p5, p1

    cmp-long p1, p5, p3

    if-eqz p1, :cond_34

    const/4 p1, 0x7

    invoke-virtual {p0, p1, p0}, Lhq8;->n(ILhq8;)V

    :cond_34
    return-void
.end method

.method public final e(JJ)V
    .registers 6

    iget-object p0, p0, Lcom/opera/android/favorites/d;->a:Lcom/opera/android/favorites/e;

    invoke-virtual {p0, p3, p4}, Lcom/opera/android/favorites/e;->m(J)Ltq8;

    move-result-object p3

    if-eqz p3, :cond_4f

    invoke-virtual {p3, p1, p2}, Ltq8;->v(J)Lhq8;

    move-result-object p1

    if-eqz p1, :cond_4f

    instance-of p2, p1, Lcom/opera/android/favorites/h;

    if-nez p2, :cond_49

    iget-object p0, p0, Lcom/opera/android/favorites/e;->c:Lcul;

    iget-object p2, p0, Lcul;->c:Ljava/util/HashMap;

    invoke-virtual {p1}, Lhq8;->j()Z

    move-result p4

    if-nez p4, :cond_49

    invoke-virtual {p1}, Lhq8;->c()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p2, p4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_2c

    invoke-virtual {p2, p4}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Lcul;->d()V

    :cond_2c
    iget-boolean p2, p0, Lcul;->d:Z

    if-nez p2, :cond_3e

    iget-object p2, p0, Lcul;->e:Ljava/util/HashSet;

    if-nez p2, :cond_3b

    new-instance p2, Ljava/util/HashSet;

    invoke-direct {p2}, Ljava/util/HashSet;-><init>()V

    iput-object p2, p0, Lcul;->e:Ljava/util/HashSet;

    :cond_3b
    invoke-virtual {p2, p4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    :cond_3e
    iget-object p2, p0, Lcul;->b:Ljava/util/ArrayList;

    invoke-virtual {p2, p4}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_49

    invoke-virtual {p0}, Lcul;->e()V

    :cond_49
    invoke-virtual {p3, p1}, Ltq8;->A(Lhq8;)V

    invoke-virtual {p1}, Lhq8;->p()V

    :cond_4f
    return-void
.end method

.method public final f()V
    .registers 1

    return-void
.end method
