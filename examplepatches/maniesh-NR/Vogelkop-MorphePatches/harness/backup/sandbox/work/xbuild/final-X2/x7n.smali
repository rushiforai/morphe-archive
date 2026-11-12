.class public abstract Lx7n;
.super Ll7n;
.source "SourceFile"


# instance fields
.field public final b:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ll7n;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lx7n;->b:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final f(Ljava/lang/Object;)V
    .registers 22

    move-object/from16 v0, p0

    iget-object v0, v0, Lx7n;->b:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    move v3, v2

    :goto_a
    if-ge v3, v1, :cond_f5

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    check-cast v4, Ltwa;

    iget-object v4, v4, Ltwa;->a:Lywa;

    move-object/from16 v5, p1

    check-cast v5, Lixa;

    sget-object v6, Lywa;->g:[Lxtb;

    instance-of v6, v5, Lgxa;

    if-eqz v6, :cond_2c

    iget-object v4, v4, Lywa;->d:Lzyk;

    invoke-virtual {v4}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lbz0;

    invoke-virtual {v4}, Landroid/app/Dialog;->show()V

    goto :goto_a

    :cond_2c
    instance-of v6, v5, Lexa;

    if-eqz v6, :cond_42

    invoke-virtual {v4}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v4

    check-cast v5, Lexa;

    iget-object v5, v5, Lexa;->a:Landroid/content/Intent;

    if-eqz v5, :cond_3e

    const/4 v6, -0x1

    invoke-virtual {v4, v6, v5}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    :cond_3e
    invoke-virtual {v4}, Landroid/app/Activity;->finish()V

    goto :goto_a

    :cond_42
    instance-of v6, v5, Lfxa;

    if-eqz v6, :cond_5e

    invoke-virtual {v4}, Lywa;->h0()Lora;

    move-result-object v4

    iget-object v4, v4, Lora;->e:Lcom/opera/hype/image/editor/EditImage;

    iget-object v4, v4, Lcom/opera/hype/image/editor/EditImage;->b:Lean;

    iget-object v5, v4, Lean;->a:Lydb;

    iget-object v4, v5, Lydb;->p:Landroid/graphics/PointF;

    iget v7, v4, Landroid/graphics/PointF;->x:F

    iget v8, v4, Landroid/graphics/PointF;->y:F

    const/high16 v6, 0x3f800000    # 1.0f

    const-wide/16 v9, 0xc8

    invoke-virtual/range {v5 .. v10}, Lydb;->p(FFFJ)V

    goto :goto_a

    :cond_5e
    instance-of v6, v5, Lhxa;

    if-eqz v6, :cond_7a

    check-cast v5, Lhxa;

    iget-object v5, v5, Lhxa;->a:Landroid/graphics/PointF;

    iput-object v5, v4, Lywa;->b:Landroid/graphics/PointF;

    iget-object v5, v4, Lywa;->f:Lzyk;

    invoke-virtual {v5}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lhy7;

    invoke-virtual {v4}, Landroidx/fragment/app/Fragment;->getParentFragmentManager()Landroidx/fragment/app/w;

    move-result-object v4

    const-string v6, "hy7"

    invoke-virtual {v5, v4, v6}, Landroidx/fragment/app/i;->show(Landroidx/fragment/app/w;Ljava/lang/String;)V

    goto :goto_a

    :cond_7a
    instance-of v6, v5, Ldxa;

    if-eqz v6, :cond_f2

    invoke-virtual {v4}, Lywa;->h0()Lora;

    move-result-object v4

    iget-object v4, v4, Lora;->e:Lcom/opera/hype/image/editor/EditImage;

    check-cast v5, Ldxa;

    iget-object v6, v5, Ldxa;->a:Landroid/graphics/PointF;

    iget-boolean v5, v5, Ldxa;->b:Z

    const v7, 0x3ecccccd    # 0.4f

    if-nez v6, :cond_96

    new-instance v6, Landroid/graphics/PointF;

    const/high16 v8, 0x3f000000    # 0.5f

    invoke-direct {v6, v8, v7}, Landroid/graphics/PointF;-><init>(FF)V

    :cond_96
    move-object v9, v6

    invoke-virtual {v4}, Lcom/opera/hype/image/editor/EditImage;->g()Lbt7;

    move-result-object v6

    iget v12, v6, Lbt7;->a:I

    if-eqz v5, :cond_aa

    new-instance v6, Landroid/graphics/PointF;

    const v8, 0x3e99999a    # 0.3f

    invoke-direct {v6, v7, v8}, Landroid/graphics/PointF;-><init>(FF)V

    move v13, v2

    move-object v14, v6

    goto :goto_b3

    :cond_aa
    invoke-virtual {v4}, Lcom/opera/hype/image/editor/EditImage;->g()Lbt7;

    move-result-object v6

    iget-boolean v6, v6, Lbt7;->b:Z

    const/4 v7, 0x0

    move v13, v6

    move-object v14, v7

    :goto_b3
    invoke-virtual {v4}, Lcom/opera/hype/image/editor/EditImage;->g()Lbt7;

    move-result-object v6

    iget v15, v6, Lbt7;->c:I

    invoke-virtual {v4}, Lcom/opera/hype/image/editor/EditImage;->g()Lbt7;

    move-result-object v6

    iget-object v6, v6, Lbt7;->d:Lnil;

    invoke-virtual {v4}, Lcom/opera/hype/image/editor/EditImage;->g()Lbt7;

    move-result-object v7

    iget-boolean v7, v7, Lbt7;->e:Z

    invoke-virtual {v4}, Lcom/opera/hype/image/editor/EditImage;->g()Lbt7;

    move-result-object v8

    iget v8, v8, Lbt7;->f:I

    move/from16 v18, v7

    new-instance v7, Loel;

    const/high16 v10, 0x3f800000    # 1.0f

    const/4 v11, 0x0

    move/from16 v19, v8

    const-string v8, ""

    move/from16 v16, v5

    move-object/from16 v17, v6

    invoke-direct/range {v7 .. v19}, Loel;-><init>(Ljava/lang/String;Landroid/graphics/PointF;FFIZLandroid/graphics/PointF;IZLnil;ZI)V

    invoke-virtual {v4, v7}, Lcom/opera/hype/image/editor/EditImage;->b(Lba3;)Lbfl;

    move-result-object v5

    new-instance v6, Lcv2;

    const/16 v8, 0x1a

    invoke-direct {v6, v7, v5, v8}, Lcv2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v7, v6}, Lfya;->d(Lkotlin/jvm/functions/Function1;)V

    xor-int/lit8 v6, v16, 0x1

    invoke-virtual {v4, v5, v6}, Lcom/opera/hype/image/editor/EditImage;->a(Lbfl;Z)V

    goto/16 :goto_a

    :cond_f2
    invoke-static {}, Lh9o;->p()V

    :cond_f5
    return-void
.end method
