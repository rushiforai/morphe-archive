.class public final synthetic Lhef;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ljava/util/List;

.field public final synthetic c:Lnx5;

.field public final synthetic d:Lu6c;

.field public final synthetic e:Lndf;

.field public final synthetic f:Lagm;

.field public final synthetic g:Ljava/util/Map;

.field public final synthetic h:Lfef;

.field public final synthetic i:Lafe;


# direct methods
.method public synthetic constructor <init>(ILjava/util/List;Lnx5;Lu6c;Lndf;Lagm;Ljava/util/Map;Lfef;Lafe;)V
    .registers 10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lhef;->a:I

    iput-object p2, p0, Lhef;->b:Ljava/util/List;

    iput-object p3, p0, Lhef;->c:Lnx5;

    iput-object p4, p0, Lhef;->d:Lu6c;

    iput-object p5, p0, Lhef;->e:Lndf;

    iput-object p6, p0, Lhef;->f:Lagm;

    iput-object p7, p0, Lhef;->g:Ljava/util/Map;

    iput-object p8, p0, Lhef;->h:Lfef;

    iput-object p9, p0, Lhef;->i:Lafe;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 13

    check-cast p1, Lh6c;

    new-instance v0, Lw5f;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Lw5f;-><init>(B)V

    new-instance v2, Lief;

    iget-object v3, p0, Lhef;->b:Ljava/util/List;

    iget-object v4, p0, Lhef;->c:Lnx5;

    iget-object v5, p0, Lhef;->d:Lu6c;

    iget-object v6, p0, Lhef;->e:Lndf;

    iget-object v7, p0, Lhef;->f:Lagm;

    iget-object v8, p0, Lhef;->g:Ljava/util/Map;

    iget-object v9, p0, Lhef;->h:Lfef;

    iget-object v10, p0, Lhef;->i:Lafe;

    invoke-direct/range {v2 .. v10}, Lief;-><init>(Ljava/util/List;Lnx5;Lu6c;Lndf;Lagm;Ljava/util/Map;Lfef;Lafe;)V

    new-instance v1, Lue5;

    const v3, 0xd918e51

    const/4 v4, 0x1

    invoke-direct {v1, v3, v2, v4}, Lue5;-><init>(ILjava/lang/Object;Z)V

    iget p0, p0, Lhef;->a:I

    invoke-static {p1, p0, v0, v1}, Lh6c;->Q(Lh6c;ILkotlin/jvm/functions/Function1;Lue5;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
