.class public final Lzq6;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Ler9;


# instance fields
.field public synthetic t:Ljava/util/List;

.field public synthetic u:Lgxc;

.field public synthetic v:Lcel;

.field public synthetic w:Lyxc;


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7

    iget-object v0, p0, Lzq6;->t:Ljava/util/List;

    check-cast v0, Ljava/util/List;

    iget-object v1, p0, Lzq6;->u:Lgxc;

    iget-object v2, p0, Lzq6;->v:Lcel;

    iget-object p0, p0, Lzq6;->w:Lyxc;

    sget-object v3, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p1, Lvq6;

    if-nez v1, :cond_1a

    new-instance v1, Lftj;

    const/4 v3, 0x7

    invoke-direct {v1, v3}, Lftj;-><init>(B)V

    goto :goto_24

    :cond_1a
    new-instance v3, Lpq4;

    iget-object v4, v1, Lgxc;->a:Ljava/lang/String;

    iget-object v1, v1, Lgxc;->b:Ljava/lang/String;

    invoke-direct {v3, v4, v1}, Lpq4;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object v1, v3

    :goto_24
    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_35

    if-ne v2, v4, :cond_31

    sget-object v2, Lwla;->d:Lwla;

    goto :goto_37

    :cond_31
    invoke-static {}, Lh9o;->p()V

    return-object v3

    :cond_35
    sget-object v2, Lwla;->c:Lwla;

    :goto_37
    if-eqz p0, :cond_4c

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    if-eqz p0, :cond_49

    if-ne p0, v4, :cond_45

    sget-object p0, Lola;->d:Lola;

    :goto_43
    move-object v3, p0

    goto :goto_4c

    :cond_45
    invoke-static {}, Lh9o;->p()V

    return-object v3

    :cond_49
    sget-object p0, Lola;->c:Lola;

    goto :goto_43

    :cond_4c
    :goto_4c
    invoke-direct {p1, v0, v1, v2, v3}, Lvq6;-><init>(Ljava/util/List;Lcum;Lwla;Lola;)V

    return-object p1
.end method

.method public final m(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7

    check-cast p1, Ljava/util/List;

    check-cast p2, Lgxc;

    check-cast p3, Lcel;

    check-cast p4, Lyxc;

    check-cast p5, Lmt5;

    new-instance p0, Lzq6;

    const/4 v0, 0x5

    invoke-direct {p0, v0, p5}, Lkuk;-><init>(ILmt5;)V

    check-cast p1, Ljava/util/List;

    iput-object p1, p0, Lzq6;->t:Ljava/util/List;

    iput-object p2, p0, Lzq6;->u:Lgxc;

    iput-object p3, p0, Lzq6;->v:Lcel;

    iput-object p4, p0, Lzq6;->w:Lyxc;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lzq6;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
