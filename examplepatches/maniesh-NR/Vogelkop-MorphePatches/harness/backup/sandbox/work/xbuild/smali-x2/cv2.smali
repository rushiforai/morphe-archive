.class public final synthetic Lcv2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lh07;Lcd5;Lqjl;)V
    .registers 4

    .line 12
    const/16 p3, 0x16

    iput-byte p3, p0, Lcv2;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcv2;->b:Ljava/lang/Object;

    iput-object p2, p0, Lcv2;->c:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 13
    iput-byte p3, p0, Lcv2;->a:B

    iput-object p1, p0, Lcv2;->b:Ljava/lang/Object;

    iput-object p2, p0, Lcv2;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ly11;Lfk7;Lfsf;)V
    .registers 4

    const/16 p2, 0x19

    iput-byte p2, p0, Lcv2;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcv2;->b:Ljava/lang/Object;

    iput-object p3, p0, Lcv2;->c:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 22

    move-object/from16 v0, p0

    iget-byte v1, v0, Lcv2;->a:B

    const/4 v2, 0x4

    const/4 v3, 0x2

    const/high16 v4, 0x3f800000    # 1.0f

    const/4 v5, 0x1

    const/4 v6, 0x3

    const/4 v7, 0x0

    const/4 v8, 0x0

    iget-object v9, v0, Lcv2;->c:Ljava/lang/Object;

    iget-object v0, v0, Lcv2;->b:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_4d0

    check-cast v0, Lev7;

    check-cast v9, Li1;

    move-object/from16 v1, p1

    check-cast v1, Landroid/content/Context;

    iget v2, v9, Li1;->b:I

    iget-object v3, v9, Li1;->d:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    iget-object v4, v9, Li1;->e:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    new-instance v5, Lsu;

    const/16 v6, 0x15

    invoke-direct {v5, v0, v3, v4, v6}, Lsu;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v1, v2, v4, v3, v5}, Lqbe;->v(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Lcom/opera/api/Callback;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_32
    check-cast v0, Landroid/graphics/PointF;

    check-cast v9, Lht7;

    move-object/from16 v1, p1

    check-cast v1, Li97;

    iget-object v2, v9, Lht7;->a:Lbfl;

    iget-object v2, v2, Lbfl;->e:Lcom/opera/hype/image/editor/TextBoxFrame;

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v3

    neg-int v3, v3

    int-to-float v3, v3

    invoke-virtual {v2}, Landroid/view/View;->getScaleX()F

    move-result v5

    mul-float/2addr v5, v3

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v5, v3

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v6

    neg-int v6, v6

    int-to-float v6, v6

    invoke-virtual {v2}, Landroid/view/View;->getScaleY()F

    move-result v7

    mul-float/2addr v7, v6

    div-float/2addr v7, v3

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {v2}, Landroid/view/View;->getScaleX()F

    move-result v8

    sub-float/2addr v8, v4

    mul-float/2addr v8, v6

    div-float/2addr v8, v3

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {v2}, Landroid/view/View;->getScaleY()F

    move-result v9

    sub-float/2addr v9, v4

    mul-float/2addr v9, v6

    div-float/2addr v9, v3

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup$MarginLayoutParams;

    iget v4, v3, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    int-to-float v4, v4

    invoke-virtual {v2}, Landroid/view/View;->getTranslationX()F

    move-result v6

    add-float/2addr v6, v4

    sub-float/2addr v6, v5

    sub-float/2addr v6, v8

    iget v3, v3, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    int-to-float v3, v3

    invoke-virtual {v2}, Landroid/view/View;->getTranslationY()F

    move-result v2

    add-float/2addr v2, v3

    sub-float/2addr v2, v7

    sub-float/2addr v2, v9

    invoke-virtual {v1, v6, v2}, Li97;->b(FF)Landroid/graphics/PointF;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_94
    check-cast v0, Lcom/opera/hype/image/editor/EditImage;

    check-cast v9, Landroid/graphics/Canvas;

    move-object/from16 v1, p1

    check-cast v1, Li97;

    iget-object v2, v0, Lcom/opera/hype/image/editor/EditImage;->f:Lkk7;

    iget-object v3, v0, Lcom/opera/hype/image/editor/EditImage;->h:Llxl;

    iput-object v1, v2, Lkk7;->b:Li97;

    iget-object v1, v0, Lcom/opera/hype/image/editor/EditImage;->i:Lat7;

    sget-object v4, Lat7;->b:Lat7;

    if-ne v1, v4, :cond_c7

    iget-object v1, v3, Llxl;->c:Landroid/graphics/Path;

    iget-object v0, v0, Lcom/opera/hype/image/editor/EditImage;->n:Lo8g;

    iget-object v3, v0, Lo8g;->c:Lv6g;

    invoke-virtual {v3, v2}, Lbb5;->f(Lkk7;)Landroid/graphics/Paint;

    move-result-object v2

    iget-object v0, v0, Lo8g;->b:Lfz2;

    sget-object v3, Lo8g;->d:[Lxtb;

    aget-object v3, v3, v7

    iget-object v0, v0, La7f;->b:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {v9, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    goto :goto_e9

    :cond_c7
    sget-object v4, Lat7;->e:Lat7;

    if-ne v1, v4, :cond_e9

    iget-object v1, v3, Llxl;->c:Landroid/graphics/Path;

    iget-object v0, v0, Lcom/opera/hype/image/editor/EditImage;->q:Li76;

    iget-object v3, v0, Li76;->c:Lf76;

    invoke-virtual {v3, v2}, Lf76;->f(Lkk7;)Landroid/graphics/Paint;

    move-result-object v2

    iget-object v0, v0, Li76;->b:Lfz2;

    sget-object v3, Li76;->d:[Lxtb;

    aget-object v3, v3, v7

    iget-object v0, v0, La7f;->b:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {v9, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    :cond_e9
    :goto_e9
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_ec
    check-cast v0, Loel;

    check-cast v9, Lbfl;

    move-object/from16 v1, p1

    check-cast v1, Lcya;

    sget-object v1, Lcom/opera/hype/image/editor/EditImage;->s:[Lxtb;

    iget-object v1, v9, Lbfl;->f:Lcom/opera/hype/image/editor/TextBoxEditText;

    invoke-virtual {v0, v1}, Loel;->h(Lcom/opera/hype/image/editor/TextBoxEditText;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_fe
    check-cast v0, Ly11;

    check-cast v9, Lfsf;

    move-object/from16 v1, p1

    check-cast v1, Lyi7;

    iget-wide v1, v1, Lyi7;->a:J

    invoke-static {v1, v2, v4}, Ly8f;->f(JF)J

    move-result-wide v1

    sget-object v3, Lek7;->a:Ldk7;

    sget-object v3, Lfsf;->a:Lfsf;

    if-ne v9, v3, :cond_11e

    const-wide v3, 0xffffffffL

    and-long/2addr v1, v3

    :goto_118
    long-to-int v1, v1

    invoke-static {v1}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v1

    goto :goto_122

    :cond_11e
    const/16 v3, 0x20

    shr-long/2addr v1, v3

    goto :goto_118

    :goto_122
    iget-byte v2, v0, Ly11;->a:B

    packed-switch v2, :pswitch_data_50e

    iget-object v0, v0, Ly11;->b:Ljava/lang/Object;

    check-cast v0, Lqn6;

    iget-object v0, v0, Lqn6;->a:Lgb1;

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v0, v1}, Lgb1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_144

    :pswitch_135
    iget-object v0, v0, Ly11;->b:Ljava/lang/Object;

    check-cast v0, La21;

    iget-object v2, v0, La21;->m:Ljava/lang/Object;

    check-cast v2, Lw11;

    invoke-virtual {v0, v1}, La21;->i(F)F

    move-result v0

    invoke-static {v2, v0}, Lw11;->a(Lw11;F)V

    :goto_144
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_147
    check-cast v0, Lokhttp3/internal/cache/DiskLruCache;

    check-cast v9, Lokhttp3/internal/cache/DiskLruCache$Editor;

    move-object/from16 v1, p1

    check-cast v1, Ljava/io/IOException;

    invoke-static {v0, v9, v1}, Lokhttp3/internal/cache/DiskLruCache$Editor;->a(Lokhttp3/internal/cache/DiskLruCache;Lokhttp3/internal/cache/DiskLruCache$Editor;Ljava/io/IOException;)Lkotlin/Unit;

    move-result-object v0

    return-object v0

    :pswitch_154
    check-cast v0, Lc2h;

    check-cast v9, Lmg6;

    move-object/from16 v1, p1

    check-cast v1, Lggb;

    iget-object v1, v1, Lggb;->h:Lrr1;

    iget-object v0, v0, Lc2h;->a:Ljava/lang/String;

    sget-object v2, Lvlb;->a:Lvlb;

    new-instance v2, Lw2e;

    new-instance v4, Lgbb;

    const/16 v5, 0xd

    invoke-direct {v4, v5}, Lgbb;-><init>(B)V

    invoke-direct {v2, v1, v0, v4, v3}, Lw2e;-><init>(Ln1;Ljava/lang/String;Lkotlin/jvm/functions/Function1;B)V

    invoke-static {v2}, Lsgb;->c0(Lzfh;)Lxd6;

    move-result-object v0

    iget-object v1, v9, Lmg6;->b:Lab7;

    invoke-interface {v1}, Lab7;->b()Ldx5;

    move-result-object v1

    new-instance v2, Lsd9;

    invoke-direct {v2, v0, v1, v7}, Lsd9;-><init>(Lxd6;Ldx5;B)V

    new-instance v0, Ldf6;

    invoke-direct {v0, v2, v9, v6}, Ldf6;-><init>(Lsd9;Lmg6;B)V

    return-object v0

    :pswitch_183
    check-cast v0, Lh07;

    check-cast v9, Lcd5;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Throwable;

    if-eqz v1, :cond_19b

    instance-of v0, v1, Ljava/util/concurrent/CancellationException;

    if-eqz v0, :cond_197

    check-cast v1, Ljava/util/concurrent/CancellationException;

    invoke-virtual {v9, v1}, Lxob;->k(Ljava/util/concurrent/CancellationException;)V

    goto :goto_1a6

    :cond_197
    invoke-virtual {v9, v1}, Lcd5;->B0(Ljava/lang/Throwable;)Z

    goto :goto_1a6

    :cond_19b
    invoke-interface {v0}, Lh07;->m()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lr0i;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {v9, v0}, Lxob;->j0(Ljava/lang/Object;)Z

    :goto_1a6
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_1a9
    check-cast v0, Ll94;

    check-cast v9, Lcd5;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Throwable;

    if-eqz v1, :cond_1bf

    instance-of v2, v1, Ljava/util/concurrent/CancellationException;

    if-eqz v2, :cond_1bb

    invoke-virtual {v0}, Ll94;->c()V

    goto :goto_1c6

    :cond_1bb
    invoke-virtual {v0, v1}, Ll94;->d(Ljava/lang/Throwable;)Z

    goto :goto_1c6

    :cond_1bf
    invoke-virtual {v9}, Lxob;->R()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ll94;->b(Ljava/lang/Object;)Z

    :goto_1c6
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_1c9
    check-cast v0, Lh07;

    check-cast v9, Lbd5;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Throwable;

    if-eqz v1, :cond_1e3

    instance-of v0, v1, Ljava/util/concurrent/CancellationException;

    if-eqz v0, :cond_1dd

    check-cast v1, Ljava/util/concurrent/CancellationException;

    invoke-interface {v9, v1}, Lunb;->k(Ljava/util/concurrent/CancellationException;)V

    goto :goto_1ec

    :cond_1dd
    check-cast v9, Lcd5;

    invoke-virtual {v9, v1}, Lcd5;->B0(Ljava/lang/Throwable;)Z

    goto :goto_1ec

    :cond_1e3
    invoke-interface {v0}, Lh07;->m()Ljava/lang/Object;

    move-result-object v0

    check-cast v9, Lcd5;

    invoke-virtual {v9, v0}, Lxob;->j0(Ljava/lang/Object;)Z

    :goto_1ec
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_1ef
    check-cast v0, Lgbc;

    move-object v11, v9

    check-cast v11, Ldz3;

    move-object/from16 v10, p1

    check-cast v10, Lo3c;

    invoke-virtual {v10}, Lo3c;->a()V

    iget-object v1, v0, Lgbc;->s:Lt0g;

    invoke-virtual {v1}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_217

    iget-object v0, v0, Lgbc;->t:Lt0g;

    invoke-virtual {v0}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_224

    :cond_217
    const/16 v17, 0x0

    const/16 v18, 0x7e

    const-wide/16 v12, 0x0

    const-wide/16 v14, 0x0

    const/16 v16, 0x0

    invoke-static/range {v10 .. v18}, Lmk7;->E0(Lmk7;Ldz3;JJFLnk7;I)V

    :cond_224
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_227
    check-cast v0, Lqt5;

    check-cast v9, Lor2;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iget-object v2, v0, Lqt5;->d:Ljava/lang/Object;

    check-cast v2, Ls2;

    iget-object v3, v9, Lor2;->c:Landroid/view/View;

    iget-object v0, v0, Lqt5;->e:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v2, v3, v0}, Ls2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_247
    check-cast v0, Lrn9;

    check-cast v9, Lxg5;

    move-object/from16 v1, p1

    check-cast v1, Lvb7;

    iget-object v1, v0, Lrn9;->c:Ljava/lang/Object;

    check-cast v1, Lk24;

    invoke-virtual {v1, v9}, Lryl;->j0(Lbtj;)V

    new-instance v1, Lci;

    const/4 v2, 0x6

    invoke-direct {v1, v0, v2}, Lci;-><init>(Ljava/lang/Object;B)V

    return-object v1

    :pswitch_25d
    check-cast v0, Lafe;

    check-cast v9, Lkotlin/jvm/functions/Function1;

    move-object/from16 v1, p1

    check-cast v1, Ly8f;

    invoke-interface {v0}, Liak;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnjl;

    if-eqz v0, :cond_27c

    iget-wide v1, v1, Ly8f;->a:J

    iget-object v0, v0, Lnjl;->b:Lxbe;

    invoke-virtual {v0, v1, v2}, Lxbe;->g(J)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {v9, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_27c
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_27f
    check-cast v0, Lsf1;

    check-cast v9, Lc61;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const-string v2, "URL"

    invoke-virtual {v0, v1, v1, v2}, Lsf1;->b(IILjava/lang/String;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->firstOrNull(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lrf1;

    if-eqz v0, :cond_2a0

    iget-object v0, v0, Lrf1;->a:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v9, v0}, Lc61;->c(Ljava/lang/String;)Lul8;

    :cond_2a0
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_2a3
    check-cast v0, Ldl4;

    check-cast v9, Ljava/lang/String;

    move-object/from16 v1, p1

    check-cast v1, Ltq2;

    sget-object v2, Ltq2;->a:Ltq2;

    if-ne v1, v2, :cond_2ba

    iget-object v0, v0, Ldl4;->l:Lcom/opera/android/undo/UndoBar;

    if-eqz v0, :cond_2ba

    invoke-static {v9}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/opera/android/undo/UndoBar;->c(Ljava/util/List;)V

    :cond_2ba
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_2bd
    check-cast v0, Ld5o;

    check-cast v9, Ljava/util/ArrayList;

    move-object/from16 v1, p1

    check-cast v1, Lz37;

    iput-object v1, v0, Ld5o;->b:Ljava/lang/Object;

    iput-object v8, v0, Ld5o;->c:Ljava/lang/Object;

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_2cd
    if-ge v7, v0, :cond_2db

    invoke-virtual {v9, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v7, v7, 0x1

    check-cast v2, Lkotlin/jvm/functions/Function1;

    invoke-interface {v2, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2cd

    :cond_2db
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_2de
    check-cast v0, Landroid/view/View;

    check-cast v9, Lbp3;

    move-object/from16 v1, p1

    check-cast v1, Lrjf;

    sget-object v2, Lrjf;->d:Lrjf;

    if-eq v1, v2, :cond_2f1

    sget-object v0, Lrjf;->c:Lrjf;

    if-eq v1, v0, :cond_2f4

    iput-boolean v7, v9, Lbp3;->b:Z

    goto :goto_308

    :cond_2f1
    invoke-virtual {v0}, Landroid/view/View;->performClick()Z

    :cond_2f4
    iget-object v0, v9, Lbp3;->d:Ljava/lang/Object;

    check-cast v0, Lc9l;

    iget-object v0, v0, Lc9l;->b:Lr9l;

    iget-object v0, v0, Lr9l;->p:Li03;

    new-instance v1, Lfv2;

    const/16 v2, 0x17

    invoke-direct {v1, v9, v2}, Lfv2;-><init>(Ljava/lang/Object;B)V

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postOnAnimationDelayed(Ljava/lang/Runnable;J)V

    :goto_308
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_30b
    check-cast v0, Lbp3;

    check-cast v9, Lf9;

    move-object/from16 v1, p1

    check-cast v1, Lrjf;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    if-eqz v1, :cond_336

    if-eq v1, v5, :cond_333

    if-eq v1, v3, :cond_330

    if-eq v1, v6, :cond_32e

    if-eq v1, v2, :cond_32b

    const/4 v2, 0x5

    if-ne v1, v2, :cond_327

    sget-object v1, Lvz3;->e:Lvz3;

    goto :goto_338

    :cond_327
    invoke-static {}, Lh9o;->p()V

    goto :goto_341

    :cond_32b
    sget-object v1, Lvz3;->d:Lvz3;

    goto :goto_338

    :cond_32e
    move-object v1, v8

    goto :goto_338

    :cond_330
    sget-object v1, Lvz3;->c:Lvz3;

    goto :goto_338

    :cond_333
    sget-object v1, Lvz3;->b:Lvz3;

    goto :goto_338

    :cond_336
    sget-object v1, Lvz3;->a:Lvz3;

    :goto_338
    if-eqz v1, :cond_33f

    iput-object v8, v0, Lbp3;->i:Ljava/lang/Object;

    invoke-virtual {v9, v1}, Lf9;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_33f
    sget-object v8, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_341
    return-object v8

    :pswitch_342
    check-cast v0, Ljava/lang/String;

    check-cast v9, Lxy3;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_35b

    if-eqz v0, :cond_360

    new-instance v1, La62;

    invoke-direct {v1, v0}, La62;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v1}, Ls62;->k(Lz5i;)V

    goto :goto_360

    :cond_35b
    sget-object v0, Lc62;->x:Lc62;

    invoke-virtual {v9, v0}, Ls62;->k(Lz5i;)V

    :cond_360
    :goto_360
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_363
    check-cast v0, Lwth;

    check-cast v9, Ljq5;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Throwable;

    iget-object v0, v0, Lwth;->b:Ljava/lang/Object;

    check-cast v0, Ldfe;

    invoke-virtual {v0, v9}, Ldfe;->k(Ljava/lang/Object;)Z

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_375
    check-cast v0, Lltf;

    move-object v3, v9

    check-cast v3, Lnvj;

    move-object/from16 v1, p1

    check-cast v1, Lo3c;

    invoke-virtual {v1}, Lo3c;->a()V

    iget-object v2, v0, Lltf;->k:Ld91;

    const/4 v5, 0x0

    const/16 v6, 0x3c

    const/4 v4, 0x0

    invoke-static/range {v1 .. v6}, Lmk7;->m0(Lmk7;Ld91;Ldz3;FLnk7;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_38d
    move-object v2, v0

    check-cast v2, Ld91;

    move-object v3, v9

    check-cast v3, Lnvj;

    move-object/from16 v1, p1

    check-cast v1, Lo3c;

    invoke-virtual {v1}, Lo3c;->a()V

    const/4 v5, 0x0

    const/16 v6, 0x3c

    const/4 v4, 0x0

    invoke-static/range {v1 .. v6}, Lmk7;->m0(Lmk7;Ld91;Ldz3;FLnk7;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_3a4
    check-cast v0, Llj3;

    check-cast v9, Ljava/lang/String;

    move-object/from16 v1, p1

    check-cast v1, Lpzh;

    iget-boolean v2, v1, Lpzh;->q:Z

    if-nez v2, :cond_3c5

    sget-object v0, Lt0i;->b:Lp0i;

    new-instance v0, Ljava/io/IOException;

    iget v1, v1, Lpzh;->d:I

    const-string v2, "Request failed with error code: "

    invoke-static {v1, v2}, Lsko;->i(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    new-instance v1, Lq0i;

    invoke-direct {v1, v0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    goto :goto_3fe

    :cond_3c5
    iget-object v1, v1, Lpzh;->g:Lvzh;

    invoke-virtual {v1}, Lvzh;->byteStream()Ljava/io/InputStream;

    move-result-object v1

    :try_start_3cb
    sget-object v2, Lt0i;->b:Lp0i;

    iget-object v0, v0, Llj3;->c:Luu1;

    invoke-virtual {v0}, Luu1;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    invoke-static {v1, v9, v0}, Llj3;->b(Ljava/io/InputStream;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object v0

    new-instance v2, Lt0i;

    invoke-direct {v2, v0}, Lt0i;-><init>(Ljava/lang/Object;)V
    :try_end_3de
    .catchall {:try_start_3cb .. :try_end_3de} :catchall_3ee

    if-eqz v1, :cond_3e6

    :try_start_3e0
    invoke-interface {v1}, Ljava/io/Closeable;->close()V
    :try_end_3e3
    .catchall {:try_start_3e0 .. :try_end_3e3} :catchall_3e4

    goto :goto_3e6

    :catchall_3e4
    move-exception v0

    move-object v8, v0

    :cond_3e6
    :goto_3e6
    move-object/from16 v19, v8

    move-object v8, v2

    move-object/from16 v2, v19

    goto :goto_3fa

    :goto_3ec
    move-object v2, v0

    goto :goto_3f0

    :catchall_3ee
    move-exception v0

    goto :goto_3ec

    :goto_3f0
    if-eqz v1, :cond_3fa

    :try_start_3f2
    invoke-interface {v1}, Ljava/io/Closeable;->close()V
    :try_end_3f5
    .catchall {:try_start_3f2 .. :try_end_3f5} :catchall_3f6

    goto :goto_3fa

    :catchall_3f6
    move-exception v0

    invoke-static {v2, v0}, Lwf8;->a(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    :cond_3fa
    :goto_3fa
    if-nez v2, :cond_404

    iget-object v1, v8, Lt0i;->a:Ljava/lang/Object;

    :goto_3fe
    new-instance v0, Lt0i;

    invoke-direct {v0, v1}, Lt0i;-><init>(Ljava/lang/Object;)V

    return-object v0

    :cond_404
    throw v2

    :pswitch_405
    check-cast v0, Lmi3;

    check-cast v9, Ldj3;

    move-object/from16 v1, p1

    check-cast v1, Losk;

    iget-object v2, v0, Lmi3;->b:Lesg;

    :try_start_40f
    iget-object v0, v2, Lesg;->b:Ljava/lang/Object;

    check-cast v0, Lnb2;

    invoke-virtual {v0, v1, v9}, Lkfo;->Q(Losk;Ljava/lang/Object;)V
    :try_end_416
    .catch Landroid/database/SQLException; {:try_start_40f .. :try_end_416} :catch_417

    goto :goto_43e

    :catch_417
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_441

    const-string v4, "unique"

    invoke-static {v3, v4, v5}, Lkotlin/text/StringsKt;->E(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Z

    move-result v4

    if-nez v4, :cond_437

    const-string v4, "2067"

    invoke-static {v3, v4, v7}, Lkotlin/text/StringsKt;->E(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Z

    move-result v4

    if-nez v4, :cond_437

    const-string v4, "1555"

    invoke-static {v3, v4, v7}, Lkotlin/text/StringsKt;->E(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Z

    move-result v3

    if-nez v3, :cond_437

    throw v0

    :cond_437
    iget-object v0, v2, Lesg;->c:Ljava/lang/Object;

    check-cast v0, Lli3;

    invoke-virtual {v0, v1, v9}, Lz4o;->X(Losk;Ljava/lang/Object;)V

    :goto_43e
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :cond_441
    throw v0

    :pswitch_442
    check-cast v0, Lifg;

    check-cast v9, Lki3;

    move-object/from16 v1, p1

    check-cast v1, Lp1d;

    iget-object v3, v9, Lki3;->o:Lkotlin/jvm/functions/Function1;

    invoke-static {v1, v0, v3, v2}, Lp1d;->p(Lp1d;Lifg;Lkotlin/jvm/functions/Function1;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_452
    check-cast v0, Lnx5;

    check-cast v9, Lztl;

    move-object/from16 v1, p1

    check-cast v1, Lqg9;

    new-instance v2, Lr3;

    const/4 v3, 0x7

    invoke-direct {v2, v1, v9, v8, v3}, Lr3;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    invoke-static {v0, v8, v8, v2, v6}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_466
    check-cast v0, Lmz2;

    check-cast v9, Lqf5;

    move-object/from16 v1, p1

    check-cast v1, Lvb7;

    iget-object v1, v0, Lmz2;->a:Lxje;

    if-eqz v1, :cond_478

    iget-object v2, v9, Lqf5;->b:Llz2;

    invoke-static {v1, v2}, Lxje;->a(Lxje;Lzje;)V

    goto :goto_481

    :cond_478
    iget-object v1, v0, Lmz2;->b:Lkcf;

    if-eqz v1, :cond_487

    iget-object v2, v9, Lqf5;->a:Lxt2;

    invoke-virtual {v1, v2}, Lkcf;->b(Lgcf;)V

    :goto_481
    new-instance v8, Lrz2;

    invoke-direct {v8, v0, v9, v7}, Lrz2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    goto :goto_48c

    :cond_487
    const-string v0, "Unreachable"

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    :goto_48c
    return-object v8

    :pswitch_48d
    check-cast v0, Lbw2;

    check-cast v9, Lcw2;

    move-object/from16 v1, p1

    check-cast v1, Lxsh;

    iget-object v1, v0, Lbw2;->o:Linl;

    if-eqz v1, :cond_49c

    invoke-virtual {v1}, Linl;->b()V

    :cond_49c
    iput-object v8, v0, Lbw2;->o:Linl;

    iget-object v0, v9, Lcw2;->c:Lcd5;

    if-eqz v0, :cond_4a7

    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lxob;->j0(Ljava/lang/Object;)Z

    :cond_4a7
    iput-object v8, v9, Lcw2;->c:Lcd5;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_4ac
    check-cast v0, Lor2;

    check-cast v9, Lev2;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iget-object v0, v0, Lor2;->e:Ljava/lang/Object;

    check-cast v0, Lor2;

    iget-object v0, v0, Lor2;->f:Ljava/lang/Object;

    check-cast v0, Landroid/widget/TextView;

    if-eqz v1, :cond_4c7

    iget-object v1, v9, Lev2;->v:Ls3g;

    iget-object v1, v1, Ls3g;->e:Ljava/lang/String;

    goto :goto_4c9

    :cond_4c7
    const-string v1, "********"

    :goto_4c9
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    nop

    :pswitch_data_4d0
    .packed-switch 0x0
        :pswitch_4ac
        :pswitch_48d
        :pswitch_466
        :pswitch_452
        :pswitch_442
        :pswitch_405
        :pswitch_3a4
        :pswitch_38d
        :pswitch_375
        :pswitch_363
        :pswitch_342
        :pswitch_30b
        :pswitch_2de
        :pswitch_2bd
        :pswitch_2a3
        :pswitch_27f
        :pswitch_25d
        :pswitch_247
        :pswitch_227
        :pswitch_1ef
        :pswitch_1c9
        :pswitch_1a9
        :pswitch_183
        :pswitch_154
        :pswitch_147
        :pswitch_fe
        :pswitch_ec
        :pswitch_94
        :pswitch_32
    .end packed-switch

    :pswitch_data_50e
    .packed-switch 0x0
        :pswitch_135
    .end packed-switch
.end method
