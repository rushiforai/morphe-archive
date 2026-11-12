.class public final synthetic Ltw0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:I

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;

.field public final synthetic e:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;IB)V
    .registers 6

    .line 15
    iput-byte p5, p0, Ltw0;->a:B

    iput-object p1, p0, Ltw0;->c:Ljava/lang/Object;

    iput-object p2, p0, Ltw0;->d:Ljava/lang/Object;

    iput-object p3, p0, Ltw0;->e:Ljava/lang/Object;

    iput p4, p0, Ltw0;->b:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Llol;Lzw0;Landroid/content/Context;ILjava/lang/String;)V
    .registers 6

    const/4 p2, 0x0

    iput-byte p2, p0, Ltw0;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ltw0;->c:Ljava/lang/Object;

    iput-object p3, p0, Ltw0;->d:Ljava/lang/Object;

    iput p4, p0, Ltw0;->b:I

    iput-object p5, p0, Ltw0;->e:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 21

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-byte v2, v0, Ltw0;->a:B

    const/4 v3, 0x1

    const/4 v4, 0x0

    iget v5, v0, Ltw0;->b:I

    iget-object v6, v0, Ltw0;->e:Ljava/lang/Object;

    iget-object v7, v0, Ltw0;->d:Ljava/lang/Object;

    iget-object v8, v0, Ltw0;->c:Ljava/lang/Object;

    const/4 v9, 0x0

    packed-switch v2, :pswitch_data_150

    check-cast v8, Lqga;

    check-cast v7, Lvfd;

    check-cast v6, Lifg;

    move-object v10, v1

    check-cast v10, Lp1d;

    iget v11, v8, Lqga;->c:I

    iget-object v0, v8, Lqga;->b:Lvhl;

    iget-object v12, v8, Lqga;->d:Lj2m;

    iget-object v1, v8, Lqga;->e:Lkotlin/jvm/functions/Function0;

    invoke-interface {v1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lojl;

    if-eqz v1, :cond_2f

    iget-object v9, v1, Lojl;->a:Lnjl;

    :cond_2f
    move-object v13, v9

    invoke-interface {v7}, Lshb;->getLayoutDirection()Ld2c;

    move-result-object v1

    sget-object v2, Ld2c;->b:Ld2c;

    if-ne v1, v2, :cond_3a

    move v14, v3

    goto :goto_3b

    :cond_3a
    move v14, v4

    :goto_3b
    iget v15, v6, Lifg;->a:I

    invoke-static/range {v10 .. v15}, Llah;->n(Lp1d;ILj2m;Lnjl;ZI)Lvoh;

    move-result-object v1

    sget-object v2, Lfsf;->b:Lfsf;

    iget v3, v6, Lifg;->a:I

    invoke-virtual {v0, v2, v1, v5, v3}, Lvhl;->a(Lfsf;Lvoh;II)V

    iget-object v0, v0, Lvhl;->a:Lp0g;

    invoke-virtual {v0}, Lp0g;->h()F

    move-result v0

    neg-float v0, v0

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    invoke-static {v10, v6, v0, v4}, Lp1d;->h(Lp1d;Lifg;II)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_59
    check-cast v8, Li37;

    check-cast v7, Ldcb;

    check-cast v6, Lzde;

    if-eq v1, v8, :cond_80

    instance-of v0, v1, Lvak;

    if-eqz v0, :cond_7d

    iget v0, v7, Ldcb;->a:I

    sub-int/2addr v0, v5

    invoke-virtual {v6, v1}, Lzde;->d(Ljava/lang/Object;)I

    move-result v2

    if-ltz v2, :cond_73

    iget-object v3, v6, Lzde;->c:[I

    aget v2, v3, v2

    goto :goto_76

    :cond_73
    const v2, 0x7fffffff

    :goto_76
    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-virtual {v6, v0, v1}, Lzde;->g(ILjava/lang/Object;)V

    :cond_7d
    sget-object v9, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_85

    :cond_80
    const-string v0, "A derived state calculation cannot read itself"

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    :goto_85
    return-object v9

    :pswitch_86
    check-cast v8, Ln02;

    move-object v2, v7

    check-cast v2, Lwth;

    check-cast v6, Ljava/util/List;

    move-object v0, v1

    check-cast v0, Ltw7;

    instance-of v1, v0, Lrw7;

    if-eqz v1, :cond_bf

    check-cast v0, Lrw7;

    iget-object v0, v0, Lrw7;->a:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Throwable;

    add-int/lit8 v4, v5, 0x1

    if-ltz v4, :cond_ba

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v0

    if-ge v4, v0, :cond_ba

    invoke-interface {v6, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v9

    new-instance v0, Ltw0;

    const/4 v5, 0x1

    move-object v3, v6

    move-object v1, v8

    invoke-direct/range {v0 .. v5}, Ltw0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;IB)V

    invoke-virtual {v2, v9, v10, v0}, Lwth;->y(JLkotlin/jvm/functions/Function1;)V

    goto :goto_fa

    :cond_ba
    move-object v1, v8

    invoke-virtual {v1, v9}, Ln02;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_fa

    :cond_bf
    move-object v1, v8

    instance-of v4, v0, Lsw7;

    if-eqz v4, :cond_fd

    check-cast v0, Lsw7;

    iget-object v0, v0, Lsw7;->a:Ljava/lang/Object;

    check-cast v0, Lsfb;

    if-eqz v0, :cond_d8

    iget-object v4, v0, Lsfb;->h:Ljava/util/ArrayList;

    invoke-interface {v4}, Ljava/util/Collection;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_d8

    invoke-virtual {v1, v0}, Ln02;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_fa

    :cond_d8
    add-int/lit8 v4, v5, 0x1

    if-ltz v4, :cond_f7

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v0

    if-ge v4, v0, :cond_f7

    invoke-interface {v6, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v7

    new-instance v0, Ltw0;

    const/4 v5, 0x1

    move-object v3, v6

    invoke-direct/range {v0 .. v5}, Ltw0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;IB)V

    invoke-virtual {v2, v7, v8, v0}, Lwth;->y(JLkotlin/jvm/functions/Function1;)V

    goto :goto_fa

    :cond_f7
    invoke-virtual {v1, v9}, Ln02;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_fa
    sget-object v9, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_100

    :cond_fd
    invoke-static {}, Lh9o;->p()V

    :goto_100
    return-object v9

    :pswitch_101
    check-cast v8, Llol;

    move-object v11, v7

    check-cast v11, Landroid/content/Context;

    move-object v12, v6

    check-cast v12, Ljava/lang/String;

    check-cast v1, Lxw0;

    instance-of v2, v1, Lvw0;

    if-nez v2, :cond_14a

    instance-of v2, v1, Lww0;

    if-nez v2, :cond_14a

    sget-object v2, Luw0;->a:Luw0;

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_146

    sget-object v1, Lna5;->b:Lna5;

    invoke-virtual {v1, v11, v12}, Lna5;->g(Landroid/content/Context;Ljava/lang/String;)Loa5;

    move-result-object v1

    new-instance v10, Lzmj;

    invoke-static {v12}, Lr9h;->t(Ljava/lang/String;)Lanj;

    move-result-object v13

    sget-object v14, Lumj;->a:Lumj;

    new-instance v2, Loa5;

    iget v3, v1, Loa5;->a:I

    invoke-direct {v2, v3, v4}, Loa5;-><init>(II)V

    const/16 v18, 0x1

    iget v15, v0, Ltw0;->b:I

    move/from16 v16, v15

    move-object/from16 v17, v2

    invoke-direct/range {v10 .. v18}, Lzmj;-><init>(Landroid/content/Context;Ljava/lang/String;Lanj;Lumj;IILoa5;Z)V

    new-instance v0, Lvw0;

    iget v1, v1, Loa5;->b:I

    invoke-direct {v0, v10, v1, v9}, Lvw0;-><init>(Landroid/graphics/drawable/Drawable;ILjava/lang/Integer;)V

    invoke-virtual {v8, v0}, Llol;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_14d

    :cond_146
    invoke-static {}, Lh9o;->p()V

    goto :goto_14f

    :cond_14a
    invoke-virtual {v8, v1}, Llol;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_14d
    sget-object v9, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_14f
    return-object v9

    :pswitch_data_150
    .packed-switch 0x0
        :pswitch_101
        :pswitch_86
        :pswitch_59
    .end packed-switch
.end method
