.class public final Lnkg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lj6l;
.implements Lf7f;


# instance fields
.field public final a:Lode;

.field public b:Lk6l;

.field public final synthetic c:Lokg;


# direct methods
.method public constructor <init>(Lokg;Lode;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnkg;->c:Lokg;

    iput-object p2, p0, Lnkg;->a:Lode;

    invoke-virtual {p2}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lk6l;

    iget-object v0, p0, Lnkg;->b:Lk6l;

    if-eqz v0, :cond_14

    invoke-virtual {v0, p0}, Lk6l;->x(Lj6l;)V

    :cond_14
    iput-object p1, p0, Lnkg;->b:Lk6l;

    if-eqz p1, :cond_1b

    invoke-virtual {p1, p0}, Lk6l;->c(Lj6l;)V

    :cond_1b
    invoke-virtual {p2, p0}, Lekc;->k(Lf7f;)V

    return-void
.end method


# virtual methods
.method public final L(Lb2l;Z)V
    .registers 5

    move-object p2, p1

    check-cast p2, Ld7l;

    iget-object p2, p2, Ld7l;->j:Le7l;

    invoke-interface {p2}, Lb9l;->m()Z

    move-result p2

    if-eqz p2, :cond_21

    check-cast p1, Ld7l;

    iget-object p1, p1, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->getId()I

    move-result p1

    iget-object p0, p0, Lnkg;->c:Lokg;

    iget-object p2, p0, Lokg;->c:Llkg;

    new-instance v0, Lg00;

    const/4 v1, 0x6

    invoke-direct {v0, p0, p1, v1}, Lg00;-><init>(Ljava/lang/Object;IB)V

    const/4 p0, 0x0

    invoke-interface {p2, v0, p0}, Llkg;->h(Lod3;Z)V

    :cond_21
    return-void
.end method

.method public final d0(Ljava/lang/Object;)V
    .registers 3

    check-cast p1, Lk6l;

    iget-object v0, p0, Lnkg;->b:Lk6l;

    if-eqz v0, :cond_9

    invoke-virtual {v0, p0}, Lk6l;->x(Lj6l;)V

    :cond_9
    iput-object p1, p0, Lnkg;->b:Lk6l;

    if-eqz p1, :cond_10

    invoke-virtual {p1, p0}, Lk6l;->c(Lj6l;)V

    :cond_10
    return-void
.end method

.method public final onDestroy()V
    .registers 3

    iget-object p0, p0, Lnkg;->c:Lokg;

    iget-object v0, p0, Lokg;->c:Llkg;

    new-instance v1, Lmjg;

    invoke-direct {v1, p0}, Lmjg;-><init>(Lokg;)V

    const/4 p0, 0x0

    invoke-interface {v0, v1, p0}, Llkg;->h(Lod3;Z)V

    return-void
.end method
