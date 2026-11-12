.class public final Lbzg;
.super Le1g;
.source "SourceFile"


# instance fields
.field public final e:Lxk;

.field public final f:Ly5g;

.field public final g:Lxoj;

.field public final h:Lq9;

.field public final i:Lq9;

.field public final j:Luj;

.field public final k:Lxoj;

.field public final l:Z

.field public final m:Ljava/util/List;


# direct methods
.method public constructor <init>(Lxk;Ly5g;Lxoj;Lq9;Lq9;Luj;Lxoj;Z)V
    .registers 10

    sget-object v0, Ld9j;->a:[Ld9j;

    const/16 v0, 0x2af8

    invoke-direct {p0, v0}, Le1g;-><init>(I)V

    iput-object p1, p0, Lbzg;->e:Lxk;

    iput-object p2, p0, Lbzg;->f:Ly5g;

    iput-object p3, p0, Lbzg;->g:Lxoj;

    iput-object p4, p0, Lbzg;->h:Lq9;

    iput-object p5, p0, Lbzg;->i:Lq9;

    iput-object p6, p0, Lbzg;->j:Luj;

    iput-object p7, p0, Lbzg;->k:Lxoj;

    iput-boolean p8, p0, Lbzg;->l:Z

    const/4 p8, 0x7

    new-array p8, p8, [Lex4;

    const/4 v0, 0x0

    aput-object p1, p8, v0

    const/4 p1, 0x1

    aput-object p2, p8, p1

    const/4 p1, 0x2

    aput-object p3, p8, p1

    const/4 p1, 0x3

    aput-object p4, p8, p1

    const/4 p1, 0x4

    aput-object p5, p8, p1

    const/4 p1, 0x5

    aput-object p6, p8, p1

    const/4 p1, 0x6

    aput-object p7, p8, p1

    invoke-static {p8}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lbzg;->m:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final b(Lhx4;)Lix4;
    .registers 4

    iget-boolean v0, p0, Lbzg;->l:Z

    if-nez v0, :cond_11

    iget-object v0, p0, Lbzg;->k:Lxoj;

    iget-char v0, v0, Lv6j;->a:C

    iget-object v1, p1, Lhx4;->c:Ljava/util/LinkedHashSet;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    :cond_11
    invoke-super {p0, p1}, Le1g;->b(Lhx4;)Lix4;

    move-result-object p0

    return-object p0
.end method

.method public final d()Ljava/util/List;
    .registers 1

    iget-object p0, p0, Lbzg;->m:Ljava/util/List;

    return-object p0
.end method

.method public final g(I)Lr6j;
    .registers 11

    new-instance v0, Lr6j;

    new-instance v2, Lx6j;

    new-instance v1, Lrag;

    const/16 v3, 0x13

    invoke-direct {v1, v3}, Lrag;-><init>(B)V

    const-class v3, Ld8j;

    invoke-direct {v2, v3, v1}, Lx6j;-><init>(Ljava/lang/Class;Lkotlin/jvm/functions/Function2;)V

    new-instance v7, Lrmg;

    const/4 v1, 0x2

    invoke-direct {v7, p0, v1}, Lrmg;-><init>(Ljava/lang/Object;B)V

    const/16 v8, 0x60

    const v3, 0x7f141081

    const v4, 0x7f141082

    const v5, 0x7f0805bd

    const/4 v6, 0x0

    move v1, p1

    invoke-direct/range {v0 .. v8}, Lr6j;-><init>(ILx6j;IIIZLkotlin/jvm/functions/Function1;I)V

    return-object v0
.end method
