.class public final Lr6j;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:Lx6j;

.field public final c:Lq6j;

.field public final d:Lq6j;

.field public final e:I

.field public final f:Z

.field public final g:Z

.field public final h:Z

.field public final i:Ljava/util/List;

.field public final j:Lo6j;


# direct methods
.method public synthetic constructor <init>(ILx6j;IIIZLkotlin/jvm/functions/Function1;I)V
    .registers 19

    and-int/lit8 v0, p8, 0x20

    if-eqz v0, :cond_7

    const/4 v0, 0x1

    move v7, v0

    goto :goto_9

    :cond_7
    move/from16 v7, p6

    :goto_9
    const/4 v8, 0x1

    move-object v1, p0

    move v2, p1

    move-object v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move-object/from16 v9, p7

    .line 62
    invoke-direct/range {v1 .. v9}, Lr6j;-><init>(ILx6j;IIIZZLkotlin/jvm/functions/Function1;)V

    return-void
.end method

.method public constructor <init>(ILx6j;IIIZZLkotlin/jvm/functions/Function1;)V
    .registers 20

    .line 63
    new-instance v3, Lp6j;

    invoke-direct {v3, p3}, Lp6j;-><init>(I)V

    .line 64
    new-instance v4, Lp6j;

    invoke-direct {v4, p4}, Lp6j;-><init>(I)V

    .line 65
    sget-object v10, Ll08;->a:Ll08;

    const/4 v7, 0x1

    move-object v0, p0

    move v1, p1

    move-object v2, p2

    move/from16 v5, p5

    move/from16 v6, p6

    move/from16 v8, p7

    move-object/from16 v9, p8

    .line 66
    invoke-direct/range {v0 .. v10}, Lr6j;-><init>(ILx6j;Lq6j;Lq6j;IZZZLkotlin/jvm/functions/Function1;Ljava/util/List;)V

    return-void
.end method

.method public synthetic constructor <init>(ILx6j;Lp6j;Lm6j;IZLkotlin/jvm/functions/Function1;Ljava/util/List;I)V
    .registers 22

    move/from16 v0, p9

    and-int/lit16 v0, v0, 0x100

    if-eqz v0, :cond_9

    const/4 v0, 0x0

    move-object v10, v0

    goto :goto_b

    :cond_9
    move-object/from16 v10, p7

    :goto_b
    const/4 v8, 0x0

    const/4 v9, 0x1

    move-object v1, p0

    move v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object/from16 v5, p4

    move/from16 v6, p5

    move/from16 v7, p6

    move-object/from16 v11, p8

    .line 61
    invoke-direct/range {v1 .. v11}, Lr6j;-><init>(ILx6j;Lq6j;Lq6j;IZZZLkotlin/jvm/functions/Function1;Ljava/util/List;)V

    return-void
.end method

.method public constructor <init>(ILx6j;Lq6j;Lq6j;IZZZLkotlin/jvm/functions/Function1;Ljava/util/List;)V
    .registers 11

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lr6j;->a:I

    iput-object p2, p0, Lr6j;->b:Lx6j;

    iput-object p3, p0, Lr6j;->c:Lq6j;

    iput-object p4, p0, Lr6j;->d:Lq6j;

    iput p5, p0, Lr6j;->e:I

    iput-boolean p6, p0, Lr6j;->f:Z

    iput-boolean p7, p0, Lr6j;->g:Z

    iput-boolean p8, p0, Lr6j;->h:Z

    iput-object p10, p0, Lr6j;->i:Ljava/util/List;

    if-eqz p9, :cond_31

    new-instance p1, Ln6j;

    invoke-direct {p1, p0}, Ln6j;-><init>(Lr6j;)V

    invoke-interface {p9, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p2, Lo6j;

    iget-object p3, p1, Ln6j;->b:Ljava/util/LinkedHashSet;

    invoke-static {p3}, Lkotlin/collections/CollectionsKt;->n0(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object p3

    iget-object p1, p1, Ln6j;->c:Ljava/util/ArrayList;

    invoke-static {p1}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p1

    invoke-direct {p2, p1, p3}, Lo6j;-><init>(Ljava/util/List;Ljava/util/Set;)V

    goto :goto_3a

    :cond_31
    new-instance p2, Lo6j;

    sget-object p1, Lv08;->a:Lv08;

    sget-object p3, Ll08;->a:Ll08;

    invoke-direct {p2, p3, p1}, Lo6j;-><init>(Ljava/util/List;Ljava/util/Set;)V

    :goto_3a
    iput-object p2, p0, Lr6j;->j:Lo6j;

    return-void
.end method

.method public static synthetic b(Lr6j;ILx6j;IILkotlin/jvm/functions/Function1;I)Lr6j;
    .registers 14

    and-int/lit8 v0, p6, 0x8

    if-eqz v0, :cond_6

    iget p4, p0, Lr6j;->e:I

    :cond_6
    move v4, p4

    and-int/lit8 p4, p6, 0x10

    if-eqz p4, :cond_f

    iget-boolean p4, p0, Lr6j;->f:Z

    :goto_d
    move v5, p4

    goto :goto_11

    :cond_f
    const/4 p4, 0x1

    goto :goto_d

    :goto_11
    and-int/lit8 p6, p6, 0x20

    if-eqz p6, :cond_16

    const/4 p5, 0x0

    :cond_16
    move-object v0, p0

    move v1, p1

    move-object v2, p2

    move v3, p3

    move-object v6, p5

    invoke-virtual/range {v0 .. v6}, Lr6j;->a(ILx6j;IIZLkotlin/jvm/functions/Function1;)Lr6j;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final a(ILx6j;IIZLkotlin/jvm/functions/Function1;)Lr6j;
    .registers 17

    new-instance v3, Lp6j;

    invoke-direct {v3, p3}, Lp6j;-><init>(I)V

    sget-object v8, Ll08;->a:Ll08;

    new-instance v4, Lm6j;

    invoke-direct {v4, p0}, Lm6j;-><init>(Lr6j;)V

    new-instance v0, Lr6j;

    const/16 v9, 0xc0

    move v1, p1

    move-object v2, p2

    move v5, p4

    move v6, p5

    move-object/from16 v7, p6

    invoke-direct/range {v0 .. v9}, Lr6j;-><init>(ILx6j;Lp6j;Lm6j;IZLkotlin/jvm/functions/Function1;Ljava/util/List;I)V

    return-object v0
.end method
