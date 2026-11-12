.class public final Lfd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw6f;


# static fields
.field public static final e:Ljf;


# instance fields
.field public final a:Lwhf;

.field public b:Lyk5;

.field public final c:Ljava/util/ArrayList;

.field public final d:Li7f;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Ljf;

    new-instance v1, Lve5;

    const/4 v2, 0x5

    invoke-direct {v1, v2}, Lve5;-><init>(B)V

    const/4 v4, 0x0

    const/16 v5, 0x36

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-direct/range {v0 .. v5}, Ljf;-><init>(Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;ZZI)V

    sput-object v0, Lfd;->e:Ljf;

    return-void
.end method

.method public constructor <init>(Lwhf;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfd;->a:Lwhf;

    new-instance v0, Lyk5;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-direct/range {v0 .. v5}, Lyk5;-><init>(ZZZZZ)V

    iput-object v0, p0, Lfd;->b:Lyk5;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lfd;->c:Ljava/util/ArrayList;

    new-instance p1, Li7f;

    invoke-direct {p1}, Li7f;-><init>()V

    iput-object p1, p0, Lfd;->d:Li7f;

    return-void
.end method


# virtual methods
.method public final F(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Led;

    iget-object p0, p0, Lfd;->d:Li7f;

    invoke-virtual {p0, p1}, Li7f;->b(Ljava/lang/Object;)Z

    invoke-interface {p1}, Led;->a()V

    return-void
.end method

.method public final H(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Led;

    iget-object p0, p0, Lfd;->d:Li7f;

    invoke-virtual {p0, p1}, Li7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final a(Lid;)V
    .registers 3

    iget-object v0, p0, Lfd;->c:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lfd;->c()V

    return-void
.end method

.method public final b(Lpc;)Z
    .registers 2

    invoke-virtual {p0, p1}, Lfd;->e(Lpc;)Ljf;

    move-result-object p0

    if-eqz p0, :cond_9

    iget-boolean p0, p0, Ljf;->f:Z

    return p0

    :cond_9
    const/4 p0, 0x0

    return p0
.end method

.method public final c()V
    .registers 2

    new-instance v0, Lg7f;

    iget-object p0, p0, Lfd;->d:Li7f;

    invoke-direct {v0, p0}, Lg7f;-><init>(Li7f;)V

    :goto_7
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_17

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Led;

    invoke-interface {p0}, Led;->a()V

    goto :goto_7

    :cond_17
    return-void
.end method

.method public final e(Lpc;)Ljf;
    .registers 11

    new-instance v0, Lr1i;

    iget-object v1, p0, Lfd;->c:Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Lr1i;-><init>(Ljava/util/List;)V

    invoke-virtual {v0}, Lr1i;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_b
    move-object v1, v0

    check-cast v1, Lq1i;

    iget-object v1, v1, Lq1i;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/ListIterator;

    invoke-interface {v1}, Ljava/util/ListIterator;->hasPrevious()Z

    move-result v2

    if-eqz v2, :cond_36

    invoke-interface {v1}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lid;

    iget-object v2, p0, Lfd;->b:Lyk5;

    invoke-interface {v1, v2, p1}, Lid;->a(Lyk5;Lpc;)Ljf;

    move-result-object v3

    if-eqz v3, :cond_b

    new-instance v4, Lg9;

    const/4 v0, 0x1

    invoke-direct {v4, p0, p1, v3, v0}, Lg9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    const/4 v7, 0x0

    const/16 v8, 0x3e

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static/range {v3 .. v8}, Ljf;->a(Ljf;Lg9;Lxc;Lpc;ZI)Ljf;

    move-result-object p0

    return-object p0

    :cond_36
    const/4 p0, 0x0

    return-object p0
.end method

.method public final f(Lpc;Lpc;)Ljf;
    .registers 9

    invoke-virtual {p0, p1}, Lfd;->e(Lpc;)Ljf;

    move-result-object v0

    if-eqz v0, :cond_17

    iget-object p0, v0, Ljf;->c:Lxc;

    if-nez p0, :cond_c

    iget-object p0, p1, Lpc;->a:Lxc;

    :cond_c
    move-object v2, p0

    const/4 v4, 0x0

    const/16 v5, 0x2b

    const/4 v1, 0x0

    move-object v3, p2

    invoke-static/range {v0 .. v5}, Ljf;->a(Ljf;Lg9;Lxc;Lpc;ZI)Ljf;

    move-result-object p0

    return-object p0

    :cond_17
    const/4 p0, 0x0

    return-object p0
.end method
