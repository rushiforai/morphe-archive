.class public final Ln6j;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lr6j;

.field public final b:Ljava/util/LinkedHashSet;

.field public final c:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(Lr6j;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ln6j;->a:Lr6j;

    new-instance p1, Ljava/util/LinkedHashSet;

    invoke-direct {p1}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object p1, p0, Ln6j;->b:Ljava/util/LinkedHashSet;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Ln6j;->c:Ljava/util/ArrayList;

    return-void
.end method

.method public static c(Ln6j;IIIILjava/util/List;I)V
    .registers 14

    and-int/lit8 v0, p6, 0x8

    if-eqz v0, :cond_8

    iget-object p4, p0, Ln6j;->a:Lr6j;

    iget p4, p4, Lr6j;->e:I

    :cond_8
    move v4, p4

    iget-object p4, p0, Ln6j;->a:Lr6j;

    iget-boolean v5, p4, Lr6j;->f:Z

    and-int/lit8 p6, p6, 0x20

    if-eqz p6, :cond_13

    sget-object p5, Ll08;->a:Ll08;

    :cond_13
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lp6j;

    invoke-direct {v2, p2}, Lp6j;-><init>(I)V

    filled-new-array {p3}, [I

    move-result-object v3

    check-cast p5, Ljava/lang/Iterable;

    new-instance v6, Ljava/util/ArrayList;

    const/16 p2, 0xa

    invoke-static {p5, p2}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result p2

    invoke-direct {v6, p2}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_30
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_49

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/Number;

    invoke-virtual {p3}, Ljava/lang/Number;->intValue()I

    move-result p3

    new-instance p4, Lp6j;

    invoke-direct {p4, p3}, Lp6j;-><init>(I)V

    invoke-virtual {v6, p4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_30

    :cond_49
    move-object v0, p0

    move v1, p1

    invoke-virtual/range {v0 .. v6}, Ln6j;->b(ILp6j;[IIZLjava/util/ArrayList;)V

    return-void
.end method

.method public static d(Ln6j;II[ILjava/util/List;I)V
    .registers 13

    and-int/lit8 v0, p5, 0x4

    if-eqz v0, :cond_7

    const/4 p3, 0x0

    new-array p3, p3, [I

    :cond_7
    move-object v3, p3

    and-int/lit8 p3, p5, 0x8

    if-eqz p3, :cond_12

    iget-object p3, p0, Ln6j;->a:Lr6j;

    iget p3, p3, Lr6j;->e:I

    :goto_10
    move v4, p3

    goto :goto_16

    :cond_12
    const p3, 0x7f080631

    goto :goto_10

    :goto_16
    iget-object p3, p0, Ln6j;->a:Lr6j;

    iget-boolean v5, p3, Lr6j;->f:Z

    and-int/lit8 p5, p5, 0x20

    if-eqz p5, :cond_20

    sget-object p4, Ll08;->a:Ll08;

    :cond_20
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lp6j;

    invoke-direct {v2, p2}, Lp6j;-><init>(I)V

    check-cast p4, Ljava/lang/Iterable;

    new-instance v6, Ljava/util/ArrayList;

    const/16 p2, 0xa

    invoke-static {p4, p2}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result p2

    invoke-direct {v6, p2}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_39
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_52

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/Number;

    invoke-virtual {p3}, Ljava/lang/Number;->intValue()I

    move-result p3

    new-instance p4, Lp6j;

    invoke-direct {p4, p3}, Lp6j;-><init>(I)V

    invoke-virtual {v6, p4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_39

    :cond_52
    move-object v0, p0

    move v1, p1

    invoke-virtual/range {v0 .. v6}, Ln6j;->b(ILp6j;[IIZLjava/util/ArrayList;)V

    return-void
.end method


# virtual methods
.method public final a(I)V
    .registers 2

    iget-object p0, p0, Ln6j;->b:Ljava/util/LinkedHashSet;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {p0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final b(ILp6j;[IIZLjava/util/ArrayList;)V
    .registers 17

    new-instance v0, Lr6j;

    iget-object v1, p0, Ln6j;->a:Lr6j;

    iget v2, v1, Lr6j;->a:I

    add-int/2addr v2, p1

    iget-object p1, v1, Lr6j;->b:Lx6j;

    iget-object v3, p1, Lx6j;->a:Ljava/lang/Class;

    iget-object p1, p1, Lx6j;->c:Lkotlin/jvm/functions/Function2;

    move v4, v2

    new-instance v2, Lx6j;

    invoke-direct {v2, v3, p3, p1}, Lx6j;-><init>(Ljava/lang/Class;[ILkotlin/jvm/functions/Function2;)V

    move p1, v4

    new-instance v4, Lm6j;

    invoke-direct {v4, v1}, Lm6j;-><init>(Lr6j;)V

    const/4 v7, 0x0

    const/16 v9, 0x1c0

    move v1, p1

    move-object v3, p2

    move v5, p4

    move v6, p5

    move-object/from16 v8, p6

    invoke-direct/range {v0 .. v9}, Lr6j;-><init>(ILx6j;Lp6j;Lm6j;IZLkotlin/jvm/functions/Function1;Ljava/util/List;I)V

    iget-object p2, p0, Ln6j;->b:Ljava/util/LinkedHashSet;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {p2, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object p0, p0, Ln6j;->c:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method
