.class public final Lru1;
.super Ld1g;
.source "SourceFile"


# instance fields
.field public final f:Loxe;

.field public final g:Lq9;

.field public final h:Luj;

.field public final i:Ljava/util/List;


# direct methods
.method public constructor <init>(Lyu1;Loxe;Lq9;Luj;)V
    .registers 6

    iget-object p1, p1, Lyu1;->g:Lv9j;

    sget-object v0, Ld9j;->a:[Ld9j;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Ld1g;-><init>(Lekc;I)V

    iput-object p2, p0, Lru1;->f:Loxe;

    iput-object p3, p0, Lru1;->g:Lq9;

    iput-object p4, p0, Lru1;->h:Luj;

    const/4 p1, 0x3

    new-array p1, p1, [Ldx4;

    aput-object p2, p1, v0

    const/4 p2, 0x1

    aput-object p3, p1, p2

    const/4 p2, 0x2

    aput-object p4, p1, p2

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lru1;->i:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final a(Lhx4;Ljava/lang/Object;)Lix4;
    .registers 4

    check-cast p2, Ltu1;

    iget-object v0, p2, Ltu1;->d:Lp37;

    instance-of v0, v0, Lc4c;

    if-nez v0, :cond_16

    sget-object v0, Lqu1;->a:[Lqu1;

    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Lhx4;->b(I)V

    const/4 v0, 0x5

    invoke-virtual {p1, v0}, Lhx4;->b(I)V

    const/4 v0, 0x6

    invoke-virtual {p1, v0}, Lhx4;->b(I)V

    :cond_16
    iget-boolean v0, p2, Ltu1;->e:Z

    if-nez v0, :cond_21

    sget-object v0, Lqu1;->a:[Lqu1;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Lhx4;->b(I)V

    :cond_21
    iget-object v0, p2, Ltu1;->f:Lns1;

    iget-boolean v0, v0, Lns1;->a:Z

    if-nez v0, :cond_2e

    sget-object v0, Lqu1;->a:[Lqu1;

    const/16 v0, 0x9

    invoke-virtual {p1, v0}, Lhx4;->b(I)V

    :cond_2e
    invoke-super {p0, p1, p2}, Ld1g;->a(Lhx4;Ljava/lang/Object;)Lix4;

    move-result-object p0

    return-object p0
.end method

.method public final d()Ljava/util/List;
    .registers 1

    iget-object p0, p0, Lru1;->i:Ljava/util/List;

    return-object p0
.end method
