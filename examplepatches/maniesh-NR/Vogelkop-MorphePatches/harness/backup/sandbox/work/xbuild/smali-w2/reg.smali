.class public final Lreg;
.super Lyf5;
.source "SourceFile"


# instance fields
.field public final a:Lgb3;


# direct methods
.method public constructor <init>(Lgb3;)V
    .registers 2

    invoke-direct {p0}, Lyf5;-><init>()V

    iput-object p1, p0, Lreg;->a:Lgb3;

    return-void
.end method


# virtual methods
.method public final content(Lwf5;Lih5;I)V
    .registers 22

    move-object/from16 v0, p0

    move-object/from16 v3, p1

    move/from16 v9, p3

    move-object/from16 v10, p2

    check-cast v10, Lvt9;

    const v1, -0x40021748

    invoke-virtual {v10, v1}, Lvt9;->Y(I)Lvt9;

    invoke-virtual {v10, v3}, Lvt9;->f(Ljava/lang/Object;)Z

    move-result v1

    const/4 v11, 0x4

    if-eqz v1, :cond_19

    move v1, v11

    goto :goto_1a

    :cond_19
    const/4 v1, 0x2

    :goto_1a
    or-int/2addr v1, v9

    invoke-virtual {v10, v0}, Lvt9;->f(Ljava/lang/Object;)Z

    move-result v2

    const/16 v12, 0x20

    if-eqz v2, :cond_25

    move v2, v12

    goto :goto_27

    :cond_25
    const/16 v2, 0x10

    :goto_27
    or-int v13, v1, v2

    and-int/lit8 v1, v13, 0x13

    const/16 v2, 0x12

    if-eq v1, v2, :cond_31

    const/4 v1, 0x1

    goto :goto_32

    :cond_31
    const/4 v1, 0x0

    :goto_32
    and-int/lit8 v2, v13, 0x1

    invoke-virtual {v10, v2, v1}, Lvt9;->N(IZ)Z

    move-result v1

    if-eqz v1, :cond_95

    and-int/lit8 v1, v13, 0xe

    if-eq v1, v11, :cond_40

    const/4 v2, 0x0

    goto :goto_41

    :cond_40
    const/4 v2, 0x1

    :goto_41
    invoke-virtual {v10}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v4

    sget-object v5, Lhh5;->a:Lzpa;

    if-nez v2, :cond_4e

    if-eq v4, v5, :cond_4e

    move v15, v1

    move-object v14, v5

    goto :goto_6b

    :cond_4e
    move v2, v1

    new-instance v1, Le6g;

    const/4 v7, 0x0

    const/4 v8, 0x2

    move v4, v2

    const/4 v2, 0x0

    move v6, v4

    const-class v4, Lwf5;

    move-object/from16 v16, v5

    const-string v5, "cancel"

    move/from16 v17, v6

    const-string v6, "cancel()V"

    move-object/from16 v14, v16

    move/from16 v15, v17

    invoke-direct/range {v1 .. v8}, Le6g;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-virtual {v10, v1}, Lvt9;->g0(Ljava/lang/Object;)V

    move-object v4, v1

    :goto_6b
    check-cast v4, Lmtb;

    check-cast v4, Lkotlin/jvm/functions/Function0;

    and-int/lit8 v13, v13, 0x70

    if-eq v13, v12, :cond_75

    const/4 v1, 0x0

    goto :goto_76

    :cond_75
    const/4 v1, 0x1

    :goto_76
    if-eq v15, v11, :cond_7a

    const/4 v15, 0x0

    goto :goto_7b

    :cond_7a
    const/4 v15, 0x1

    :goto_7b
    or-int/2addr v1, v15

    invoke-virtual {v10}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v2

    if-nez v1, :cond_84

    if-ne v2, v14, :cond_8e

    :cond_84
    new-instance v2, Ls4f;

    const/16 v1, 0x8

    invoke-direct {v2, v0, v3, v1}, Ls4f;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v10, v2}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_8e
    check-cast v2, Lkotlin/jvm/functions/Function0;

    const/4 v1, 0x0

    invoke-static {v4, v2, v10, v1}, Lcs5;->h(Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lih5;I)V

    goto :goto_98

    :cond_95
    invoke-virtual {v10}, Lvt9;->Q()V

    :goto_98
    invoke-virtual {v10}, Lvt9;->r()Lznh;

    move-result-object v1

    if-eqz v1, :cond_a7

    new-instance v2, Lhda;

    const/16 v4, 0x17

    invoke-direct {v2, v0, v3, v9, v4}, Lhda;-><init>(Ljava/lang/Object;Ljava/lang/Object;IB)V

    iput-object v2, v1, Lznh;->d:Lkotlin/jvm/functions/Function2;

    :cond_a7
    return-void
.end method
