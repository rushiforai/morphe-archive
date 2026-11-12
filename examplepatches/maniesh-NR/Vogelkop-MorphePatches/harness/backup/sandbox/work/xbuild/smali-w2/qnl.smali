.class public final synthetic Lqnl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lkol;

.field public final synthetic c:Lkotlin/jvm/functions/Function0;


# direct methods
.method public synthetic constructor <init>(Lkol;Lkotlin/jvm/functions/Function0;B)V
    .registers 4

    iput-byte p3, p0, Lqnl;->a:B

    iput-object p1, p0, Lqnl;->b:Lkol;

    iput-object p2, p0, Lqnl;->c:Lkotlin/jvm/functions/Function0;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 22

    move-object/from16 v0, p0

    iget-byte v1, v0, Lqnl;->a:B

    iget-object v2, v0, Lqnl;->c:Lkotlin/jvm/functions/Function0;

    iget-object v0, v0, Lqnl;->b:Lkol;

    const/4 v3, 0x0

    packed-switch v1, :pswitch_data_f8

    move-object/from16 v1, p1

    check-cast v1, Landroid/graphics/Bitmap;

    if-eqz v1, :cond_9b

    iget-object v2, v0, Lkol;->a:Landroid/content/Context;

    invoke-virtual {v0}, Lkol;->a()Lcyj;

    move-result-object v4

    iget-object v5, v4, Lcyj;->f:Luxj;

    iget-object v4, v4, Lcyj;->b:Ly7h;

    iget-boolean v6, v5, Luxj;->b:Z

    iget-object v7, v5, Luxj;->f:Lixh;

    iget-object v8, v5, Luxj;->e:Ldxh;

    if-eqz v6, :cond_61

    invoke-virtual {v4, v2}, Ly7h;->k(Landroid/content/Context;)I

    move-result v10

    iget-object v3, v5, Luxj;->d:Ldxh;

    invoke-virtual {v3, v2}, Lcxh;->a(Landroid/content/Context;)I

    move-result v11

    invoke-virtual {v8, v2}, Lcxh;->a(Landroid/content/Context;)I

    move-result v12

    invoke-virtual {v7, v2}, Ly7h;->k(Landroid/content/Context;)I

    move-result v13

    new-instance v15, Luq8;

    invoke-static {v2}, Lgjf;->a(Landroid/content/Context;)Lgjf;

    move-result-object v3

    iget v4, v5, Luxj;->c:I

    invoke-direct {v15, v2, v3, v4, v1}, Luq8;-><init>(Landroid/content/Context;Lgjf;ILandroid/graphics/Bitmap;)V

    new-instance v3, Lfr;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    const/4 v6, 0x1

    invoke-direct {v3, v4, v1, v6}, Lfr;-><init>(IIB)V

    iget-object v1, v5, Luxj;->g:Ly7h;

    invoke-virtual {v1, v2}, Ly7h;->k(Landroid/content/Context;)I

    move-result v14

    new-instance v9, Lir;

    const/16 v17, 0x0

    const/16 v18, 0x80

    move-object/from16 v16, v3

    invoke-direct/range {v9 .. v18}, Lir;-><init>(IIIIILandroid/graphics/drawable/Drawable;Ler;Lgr;I)V

    goto :goto_95

    :cond_61
    new-instance v10, Lir;

    invoke-virtual {v4, v2}, Ly7h;->k(Landroid/content/Context;)I

    move-result v11

    invoke-virtual {v8, v2}, Lcxh;->a(Landroid/content/Context;)I

    move-result v13

    invoke-virtual {v7, v2}, Ly7h;->k(Landroid/content/Context;)I

    move-result v14

    new-instance v5, Lhq4;

    invoke-virtual {v4, v2}, Ly7h;->l(Landroid/content/Context;)F

    move-result v2

    const/16 v4, 0xe

    invoke-direct {v5, v2, v3, v4, v1}, Lhq4;-><init>(FIILandroid/graphics/Bitmap;)V

    new-instance v2, Lfr;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    invoke-direct {v2, v4, v1, v3}, Lfr;-><init>(IIB)V

    const/16 v18, 0x0

    const/16 v19, 0x90

    const/4 v12, 0x0

    const/4 v15, 0x0

    move-object/from16 v17, v2

    move-object/from16 v16, v5

    invoke-direct/range {v10 .. v19}, Lir;-><init>(IIIIILandroid/graphics/drawable/Drawable;Ler;Lgr;I)V

    move-object v9, v10

    :goto_95
    sget-object v1, Laol;->a:Laol;

    invoke-virtual {v0, v9, v1}, Lkol;->i(Landroid/graphics/drawable/Drawable;Lbwg;)V

    goto :goto_9e

    :cond_9b
    invoke-interface {v2}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    :goto_9e
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_a1
    move-object/from16 v1, p1

    check-cast v1, Lcoj;

    const/4 v4, 0x0

    iput-object v4, v0, Lkol;->h:Lynj;

    instance-of v5, v1, Lboj;

    if-eqz v5, :cond_dd

    sget-object v2, Lkol;->r:Landroid/graphics/drawable/ColorDrawable;

    iget-object v4, v0, Lkol;->a:Landroid/content/Context;

    check-cast v1, Lboj;

    iget-object v1, v1, Lboj;->a:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Lkol;->a()Lcyj;

    move-result-object v8

    new-instance v5, Lhq4;

    iget-object v2, v8, Lcyj;->b:Ly7h;

    invoke-virtual {v2, v4}, Ly7h;->l(Landroid/content/Context;)F

    move-result v2

    const/4 v6, 0x2

    invoke-direct {v5, v2, v3, v6, v1}, Lhq4;-><init>(FIILandroid/graphics/Bitmap;)V

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v6

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v7

    new-instance v9, Lqs7;

    const/16 v1, 0xf

    invoke-direct {v9, v1}, Lqs7;-><init>(B)V

    invoke-static/range {v4 .. v9}, Lxvg;->p(Landroid/content/Context;Landroid/graphics/drawable/Drawable;IILcyj;Lgr;)Lir;

    move-result-object v1

    sget-object v2, Lbol;->a:Lbol;

    invoke-virtual {v0, v1, v2}, Lkol;->i(Landroid/graphics/drawable/Drawable;Lbwg;)V

    goto :goto_f4

    :cond_dd
    sget-object v0, Lznj;->a:Lznj;

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_f1

    sget-object v0, Laoj;->a:Laoj;

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_f1

    invoke-static {}, Lh9o;->p()V

    goto :goto_f6

    :cond_f1
    invoke-interface {v2}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    :goto_f4
    sget-object v4, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_f6
    return-object v4

    nop

    :pswitch_data_f8
    .packed-switch 0x0
        :pswitch_a1
    .end packed-switch
.end method
