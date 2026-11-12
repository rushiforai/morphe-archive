.class public final Lltc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lpke;


# instance fields
.field public final a:Lqke;

.field public final b:Lhwf;

.field public final c:Lorm;


# direct methods
.method public constructor <init>(Lqke;Lhwf;Lnw3;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lltc;->a:Lqke;

    invoke-virtual {p1, p0}, Lqke;->W(Lpke;)V

    iput-object p2, p0, Lltc;->b:Lhwf;

    invoke-virtual {p3}, Lnw3;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorm;

    iput-object p1, p0, Lltc;->c:Lorm;

    return-void
.end method


# virtual methods
.method public final w(Lb2l;Loke;JZ)V
    .registers 13

    if-eqz p5, :cond_91

    iget-boolean p5, p2, Loke;->c:Z

    if-nez p5, :cond_91

    check-cast p1, Ld7l;

    iget-object p1, p1, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object p1

    iget-object p5, p0, Lltc;->b:Lhwf;

    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p1}, Lwqm;->i(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, -0x1

    if-nez v0, :cond_36

    invoke-virtual {p5}, Lno7;->i()Ljava/lang/Object;

    move-result-object p5

    check-cast p5, Lgwf;

    iget-object v0, p5, Lgwf;->b:Lnd7;

    if-eqz v0, :cond_36

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p1, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    iget-object v0, p5, Lgwf;->b:Lnd7;

    invoke-virtual {v0, p1}, Lnd7;->a(Ljava/lang/String;)I

    move-result p1

    if-ne p1, v1, :cond_38

    :cond_36
    move p1, v1

    goto :goto_3c

    :cond_38
    iget-object p5, p5, Lgwf;->a:[I

    aget p1, p5, p1

    :goto_3c
    iget-wide v2, p2, Loke;->a:J

    sub-long/2addr p3, v2

    iget-boolean p2, p2, Loke;->b:Z

    iget-object p0, p0, Lltc;->c:Lorm;

    check-cast p0, Lx5f;

    iget-boolean p5, p0, Lx5f;->h:Z

    if-eqz p5, :cond_91

    iget-object p5, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    new-instance v2, Lvl0;

    const/16 v3, 0x98b

    const/4 v4, 0x3

    invoke-direct {v2, v3, v1, v4}, Ljf0;-><init>(III)V

    const/4 v3, 0x1

    if-eq p1, v1, :cond_5f

    const/4 v1, 0x0

    int-to-long v5, p1

    invoke-virtual {v2, v1, v3, v5, v6}, Ljf0;->p(IIJ)V

    :cond_5f
    invoke-virtual {v2, v3, v3, p2}, Ljf0;->r(IIZ)V

    const/4 p1, 0x2

    invoke-virtual {v2, p1, v3, p3, p4}, Ljf0;->p(IIJ)V

    invoke-virtual {v0, p5}, Lx56;->A(Lzpa;)Luc0;

    move-result-object p1

    invoke-virtual {p1, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/List;

    if-eqz p2, :cond_7e

    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result p3

    if-nez p3, :cond_7e

    new-instance p3, Lhf0;

    invoke-direct {p3, p1, v4, p2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_8b

    :cond_7e
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p1, v4, v3, p2}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance p3, Lhf0;

    invoke-direct {p3, p1, v4, p2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_8b
    invoke-virtual {p3, v2}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    :cond_91
    return-void
.end method
