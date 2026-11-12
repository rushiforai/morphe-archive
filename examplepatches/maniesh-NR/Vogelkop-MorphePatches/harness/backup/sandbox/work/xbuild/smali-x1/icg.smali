.class public final Licg;
.super Le1g;
.source "SourceFile"


# instance fields
.field public final e:Ly5g;

.field public final f:Luj;

.field public final g:Luj;

.field public final h:Lqte;

.field public final i:Z

.field public final j:Ljava/util/List;


# direct methods
.method public constructor <init>(Ly5g;Luj;Luj;Lqte;Z)V
    .registers 7

    sget-object v0, Ld9j;->a:[Ld9j;

    const/16 v0, 0xfa0

    invoke-direct {p0, v0}, Le1g;-><init>(I)V

    iput-object p1, p0, Licg;->e:Ly5g;

    iput-object p2, p0, Licg;->f:Luj;

    iput-object p3, p0, Licg;->g:Luj;

    iput-object p4, p0, Licg;->h:Lqte;

    iput-boolean p5, p0, Licg;->i:Z

    const/4 p5, 0x4

    new-array p5, p5, [Lex4;

    const/4 v0, 0x0

    aput-object p1, p5, v0

    const/4 p1, 0x1

    aput-object p2, p5, p1

    const/4 p1, 0x2

    aput-object p3, p5, p1

    const/4 p1, 0x3

    aput-object p4, p5, p1

    invoke-static {p5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Licg;->j:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final b(Lhx4;)Lix4;
    .registers 4

    iget-boolean v0, p0, Licg;->i:Z

    if-nez v0, :cond_11

    iget-object v0, p0, Licg;->h:Lqte;

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

    iget-object p0, p0, Licg;->j:Ljava/util/List;

    return-object p0
.end method

.method public final g(I)Lr6j;
    .registers 11

    new-instance v0, Lr6j;

    new-instance v2, Lx6j;

    new-instance v1, Lrag;

    const/16 v3, 0x12

    invoke-direct {v1, v3}, Lrag;-><init>(B)V

    const-class v3, Ld8j;

    invoke-direct {v2, v3, v1}, Lx6j;-><init>(Ljava/lang/Class;Lkotlin/jvm/functions/Function2;)V

    new-instance v7, Lo5f;

    const/16 v1, 0x1a

    invoke-direct {v7, p0, v1}, Lo5f;-><init>(Ljava/lang/Object;B)V

    const/16 v8, 0x60

    const v3, 0x7f141073

    const v4, 0x7f141074

    const v5, 0x7f080620

    const/4 v6, 0x0

    move v1, p1

    invoke-direct/range {v0 .. v8}, Lr6j;-><init>(ILx6j;IIIZLkotlin/jvm/functions/Function1;I)V

    return-object v0
.end method
