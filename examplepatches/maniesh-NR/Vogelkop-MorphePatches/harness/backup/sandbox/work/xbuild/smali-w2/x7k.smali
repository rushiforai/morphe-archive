.class public final Lx7k;
.super Ld1g;
.source "SourceFile"


# instance fields
.field public final f:Lqte;

.field public final g:Lqte;

.field public final h:Ljava/util/List;


# direct methods
.method public constructor <init>(Lb8k;Lqte;Lqte;)V
    .registers 5

    iget-object p1, p1, Lb8k;->n:Lh42;

    sget-object v0, Ld9j;->a:[Ld9j;

    const/16 v0, 0x1770

    invoke-direct {p0, p1, v0}, Ld1g;-><init>(Lekc;I)V

    iput-object p2, p0, Lx7k;->f:Lqte;

    iput-object p3, p0, Lx7k;->g:Lqte;

    const/4 p1, 0x2

    new-array p1, p1, [Lcx4;

    const/4 v0, 0x0

    aput-object p2, p1, v0

    const/4 p2, 0x1

    aput-object p3, p1, p2

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lx7k;->h:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final a(Lhx4;Ljava/lang/Object;)Lix4;
    .registers 5

    check-cast p2, Lz7k;

    iget-object v0, p2, Lz7k;->l:Lyt8;

    iget-boolean v0, v0, Lyt8;->a:Z

    if-nez v0, :cond_e

    sget-object v0, Lw7k;->a:[Lw7k;

    const/4 v0, 0x3

    invoke-virtual {p1, v0}, Lhx4;->b(I)V

    :cond_e
    iget-object v0, p2, Lz7k;->g:Lyt8;

    iget-boolean v0, v0, Lyt8;->a:Z

    if-nez v0, :cond_1a

    sget-object v0, Lw7k;->a:[Lw7k;

    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Lhx4;->b(I)V

    :cond_1a
    iget-object v0, p2, Lz7k;->h:Lyt8;

    iget-boolean v0, v0, Lyt8;->a:Z

    if-nez v0, :cond_26

    sget-object v0, Lw7k;->a:[Lw7k;

    const/4 v0, 0x5

    invoke-virtual {p1, v0}, Lhx4;->b(I)V

    :cond_26
    iget-object v0, p2, Lz7k;->i:Lyt8;

    iget-boolean v0, v0, Lyt8;->a:Z

    if-nez v0, :cond_33

    sget-object v0, Lw7k;->a:[Lw7k;

    const/16 v0, 0xb

    invoke-virtual {p1, v0}, Lhx4;->b(I)V

    :cond_33
    iget-object v0, p2, Lz7k;->e:Lrsi;

    iget-boolean v0, v0, Lrsi;->a:Z

    if-nez v0, :cond_40

    sget-object v0, Lw7k;->a:[Lw7k;

    const/16 v0, 0xd

    invoke-virtual {p1, v0}, Lhx4;->b(I)V

    :cond_40
    iget-object v0, p2, Lz7k;->f:Lrsi;

    iget-boolean v0, v0, Lrsi;->a:Z

    if-nez v0, :cond_4d

    sget-object v0, Lw7k;->a:[Lw7k;

    const/16 v0, 0xe

    invoke-virtual {p1, v0}, Lhx4;->b(I)V

    :cond_4d
    iget-object v0, p2, Lz7k;->j:Lyt8;

    iget-boolean v0, v0, Lyt8;->a:Z

    if-nez v0, :cond_60

    iget-object v0, p0, Lx7k;->g:Lqte;

    iget-char v0, v0, Lv6j;->a:C

    iget-object v1, p1, Lhx4;->c:Ljava/util/LinkedHashSet;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    :cond_60
    iget-object v0, p2, Lz7k;->b:Lyt8;

    iget-boolean v0, v0, Lyt8;->a:Z

    if-nez v0, :cond_6d

    sget-object v0, Lw7k;->a:[Lw7k;

    const/16 v0, 0x9

    invoke-virtual {p1, v0}, Lhx4;->b(I)V

    :cond_6d
    iget-object v0, p2, Lz7k;->c:Lyt8;

    iget-boolean v0, v0, Lyt8;->a:Z

    if-nez v0, :cond_7a

    sget-object v0, Lw7k;->a:[Lw7k;

    const/16 v0, 0xa

    invoke-virtual {p1, v0}, Lhx4;->b(I)V

    :cond_7a
    invoke-super {p0, p1, p2}, Ld1g;->a(Lhx4;Ljava/lang/Object;)Lix4;

    move-result-object p0

    return-object p0
.end method

.method public final d()Ljava/util/List;
    .registers 1

    iget-object p0, p0, Lx7k;->h:Ljava/util/List;

    return-object p0
.end method

.method public final g(ILjava/lang/Object;)Lr6j;
    .registers 12

    check-cast p2, Lz7k;

    new-instance v0, Lr6j;

    new-instance v2, Lx6j;

    new-instance p2, Lvoj;

    const/16 v1, 0x10

    invoke-direct {p2, v1}, Lvoj;-><init>(B)V

    const-class v1, Ld8j;

    invoke-direct {v2, v1, p2}, Lx6j;-><init>(Ljava/lang/Class;Lkotlin/jvm/functions/Function2;)V

    new-instance v7, Ln6k;

    const/4 p2, 0x2

    invoke-direct {v7, p0, p2}, Ln6k;-><init>(Ljava/lang/Object;B)V

    const/16 v8, 0x40

    const v3, 0x7f1410aa

    const v4, 0x7f1410ab

    const v5, 0x7f080570

    const/4 v6, 0x1

    move v1, p1

    invoke-direct/range {v0 .. v8}, Lr6j;-><init>(ILx6j;IIIZLkotlin/jvm/functions/Function1;I)V

    return-object v0
.end method
