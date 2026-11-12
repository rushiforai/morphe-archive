.class public final Llxa;
.super Lx7n;
.source "SourceFile"


# static fields
.field public static final v:Ljuh;


# instance fields
.field public final c:Landroid/content/Context;

.field public final d:Lqie;

.field public final e:Landroid/net/Uri;

.field public final f:Ljava/util/List;

.field public final g:Lra5;

.field public final h:Loam;

.field public final i:Li16;

.field public final j:Lmcj;

.field public final k:Ld7h;

.field public final l:Lnak;

.field public final m:Lnak;

.field public final n:Lnak;

.field public final o:Z

.field public final p:Lnak;

.field public final q:Landroid/net/Uri;

.field public final r:Lluf;

.field public final s:Lzba;

.field public final t:Ldya;

.field public u:Ld3k;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Ljuh;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljuh;-><init>(Landroid/graphics/Bitmap;)V

    sput-object v0, Llxa;->v:Ljuh;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lqie;Landroid/net/Uri;Ljava/util/List;Lra5;Loam;Lgki;)V
    .registers 27

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    move-object/from16 v3, p7

    invoke-direct {v0}, Lx7n;-><init>()V

    move-object/from16 v4, p1

    iput-object v4, v0, Llxa;->c:Landroid/content/Context;

    move-object/from16 v4, p2

    iput-object v4, v0, Llxa;->d:Lqie;

    iput-object v1, v0, Llxa;->e:Landroid/net/Uri;

    iput-object v2, v0, Llxa;->f:Ljava/util/List;

    move-object/from16 v4, p5

    iput-object v4, v0, Llxa;->g:Lra5;

    move-object/from16 v4, p6

    iput-object v4, v0, Llxa;->h:Loam;

    sget-object v4, Lcxa;->a:Lcxa;

    invoke-static {v4}, Lz4o;->f(Ljava/lang/Object;)Lnak;

    move-result-object v4

    iput-object v4, v0, Llxa;->l:Lnak;

    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-static {v4}, Lz4o;->f(Ljava/lang/Object;)Lnak;

    move-result-object v4

    iput-object v4, v0, Llxa;->m:Lnak;

    const/4 v5, 0x0

    invoke-static {v5}, Lz4o;->f(Ljava/lang/Object;)Lnak;

    move-result-object v6

    iput-object v6, v0, Llxa;->n:Lnak;

    sget-object v7, Llxa;->v:Ljuh;

    invoke-static {v7}, Lz4o;->f(Ljava/lang/Object;)Lnak;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v7

    const/4 v8, 0x0

    const/4 v9, 0x1

    if-ne v7, v9, :cond_45

    move v7, v9

    goto :goto_46

    :cond_45
    move v7, v8

    :goto_46
    iput-boolean v7, v0, Llxa;->o:Z

    const-string v10, "properties"

    invoke-virtual {v3, v10}, Lgki;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ls5h;

    if-nez v10, :cond_67

    new-instance v11, Ls5h;

    sget-object v10, Ln8g;->c:La36;

    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v12, Ln8g;->d:Ln8g;

    sget-object v15, Lnil;->b:Lnil;

    const/16 v16, 0x0

    const/4 v13, 0x1

    const/4 v14, 0x0

    const/16 v17, 0x0

    invoke-direct/range {v11 .. v17}, Ls5h;-><init>(Ln8g;ZILnil;ZLn8g;)V

    move-object v10, v11

    :cond_67
    invoke-static {v10}, Lz4o;->f(Ljava/lang/Object;)Lnak;

    move-result-object v10

    iput-object v10, v0, Llxa;->p:Lnak;

    const-string v11, "output"

    invoke-virtual {v3, v11}, Lgki;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/net/Uri;

    if-nez v11, :cond_79

    sget-object v11, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    :cond_79
    iput-object v11, v0, Llxa;->q:Landroid/net/Uri;

    const-string v11, "output-properties"

    invoke-virtual {v3, v11}, Lgki;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lluf;

    if-nez v11, :cond_96

    new-instance v12, Lluf;

    sget-object v13, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const-string v16, ""

    sget-object v18, Lqnn;->a:Lqnn;

    const/16 v14, 0x64

    const/4 v15, 0x0

    move-object/from16 v17, v16

    invoke-direct/range {v12 .. v18}, Lluf;-><init>(Landroid/graphics/Bitmap$CompressFormat;ILandroid/graphics/Point;Ljava/lang/String;Ljava/lang/String;Lqnn;)V

    move-object v11, v12

    :cond_96
    iput-object v11, v0, Llxa;->r:Lluf;

    const-string v11, "history"

    invoke-virtual {v3, v11}, Lgki;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lzba;

    if-nez v12, :cond_a7

    new-instance v12, Lzba;

    invoke-direct {v12}, Lzba;-><init>()V

    :cond_a7
    iput-object v12, v0, Llxa;->s:Lzba;

    invoke-virtual {v3, v12, v11}, Lgki;->b(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v11, "model"

    invoke-virtual {v3, v11}, Lgki;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ldya;

    if-nez v13, :cond_bb

    new-instance v13, Ldya;

    invoke-direct {v13, v1}, Ldya;-><init>(Landroid/net/Uri;)V

    :cond_bb
    iput-object v13, v0, Llxa;->t:Ldya;

    invoke-virtual {v3, v13, v11}, Lgki;->b(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "tool"

    invoke-virtual {v3, v1}, Lgki;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    if-eqz v1, :cond_cf

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    goto :goto_d0

    :cond_cf
    const/4 v1, -0x1

    :goto_d0
    if-gez v1, :cond_dd

    if-eqz v7, :cond_db

    invoke-interface {v2, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnsl;

    goto :goto_e5

    :cond_db
    move-object v1, v5

    goto :goto_e5

    :cond_dd
    sget-object v11, Lnsl;->l:Lh58;

    invoke-virtual {v11, v1}, Lh58;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnsl;

    :goto_e5
    invoke-virtual {v6, v1}, Lnak;->j(Ljava/lang/Object;)V

    new-instance v1, Lkxa;

    invoke-direct {v1, v3, v5, v9}, Lkxa;-><init>(Lgki;Lmt5;B)V

    new-instance v11, Lz99;

    const/4 v14, 0x2

    invoke-direct {v11, v6, v1, v14}, Lz99;-><init>(Lf99;Lkotlin/jvm/functions/Function2;B)V

    invoke-static {v0}, Lp7n;->a(Ll7n;)Lf65;

    move-result-object v1

    invoke-static {v11, v1}, Lj14;->Y(Lf99;Lnx5;)Ld3k;

    new-instance v1, Lkxa;

    invoke-direct {v1, v3, v5, v8}, Lkxa;-><init>(Lgki;Lmt5;B)V

    new-instance v3, Lz99;

    invoke-direct {v3, v10, v1, v14}, Lz99;-><init>(Lf99;Lkotlin/jvm/functions/Function2;B)V

    invoke-static {v0}, Lp7n;->a(Ll7n;)Lf65;

    move-result-object v1

    invoke-static {v3, v1}, Lj14;->Y(Lf99;Lnx5;)Ld3k;

    new-instance v1, Li16;

    invoke-static {v0}, Lp7n;->a(Ll7n;)Lf65;

    move-result-object v3

    sget-object v5, Ljea;->a:[Ljea;

    invoke-direct {v1, v12, v4, v3}, Li16;-><init>(Lzba;Lnak;Lf65;)V

    iput-object v1, v0, Llxa;->i:Li16;

    new-instance v1, Lmcj;

    invoke-direct {v1, v6, v4, v2, v7}, Lmcj;-><init>(Lnak;Lnak;Ljava/util/List;Z)V

    iput-object v1, v0, Llxa;->j:Lmcj;

    new-instance v1, Ld7h;

    invoke-direct {v1, v6, v4, v2, v10}, Ld7h;-><init>(Lnak;Lnak;Ljava/util/List;Lnak;)V

    iput-object v1, v0, Llxa;->k:Ld7h;

    new-instance v1, Lxm5;

    invoke-direct {v1, v0}, Lxm5;-><init>(Ljava/lang/Object;)V

    iget-object v2, v12, Lzba;->b:Lnrl;

    iput-object v1, v2, Lnrl;->b:Ljava/lang/Object;

    new-instance v1, Lit7;

    invoke-direct {v1, v0, v9}, Lit7;-><init>(Ljava/lang/Object;B)V

    iget-object v2, v13, Ldya;->c:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0}, Llxa;->h()V

    return-void
.end method


# virtual methods
.method public final g()V
    .registers 4

    iget-object v0, p0, Llxa;->n:Lnak;

    invoke-virtual {v0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v1, :cond_11

    iget-boolean v1, p0, Llxa;->o:Z

    if-nez v1, :cond_11

    invoke-virtual {v0, v2}, Lnak;->j(Ljava/lang/Object;)V

    return-void

    :cond_11
    iget-object v0, p0, Llxa;->s:Lzba;

    iget v0, v0, Lzba;->c:I

    if-ltz v0, :cond_1d

    sget-object v0, Lgxa;->a:Lgxa;

    invoke-virtual {p0, v0}, Lx7n;->f(Ljava/lang/Object;)V

    return-void

    :cond_1d
    new-instance v0, Lexa;

    invoke-direct {v0, v2}, Lexa;-><init>(Landroid/content/Intent;)V

    invoke-virtual {p0, v0}, Lx7n;->f(Ljava/lang/Object;)V

    return-void
.end method

.method public final h()V
    .registers 9

    iget-object v0, p0, Llxa;->l:Lnak;

    invoke-virtual {v0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v1

    sget-object v2, Lcxa;->c:Lcxa;

    if-ne v1, v2, :cond_b

    return-void

    :cond_b
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iget-object v2, p0, Llxa;->t:Ldya;

    iget-object v3, v2, Ldya;->d:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v5, 0x0

    :cond_19
    :goto_19
    if-ge v5, v4, :cond_29

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v5, v5, 0x1

    instance-of v7, v6, Lf76;

    if-eqz v7, :cond_19

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_19

    :cond_29
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    const/4 v4, 0x0

    if-nez v3, :cond_78

    new-instance v3, Li97;

    iget-object v2, v2, Ldya;->b:Landroid/graphics/PointF;

    const/4 v5, 0x5

    invoke-direct {v3, v2, v5}, Li97;-><init>(Landroid/graphics/PointF;I)V

    new-instance v2, Landroid/graphics/RectF;

    invoke-direct {v2}, Landroid/graphics/RectF;-><init>()V

    new-instance v5, Lfjh;

    iget-object p0, p0, Llxa;->c:Landroid/content/Context;

    invoke-direct {v5, v1, v3, p0, v4}, Lfjh;-><init>(Ljava/util/ArrayList;Li97;Landroid/content/Context;Lmt5;)V

    new-instance v1, Ld82;

    const/4 v6, 0x3

    invoke-direct {v1, v5, v6}, Ld82;-><init>(Ljava/lang/Object;B)V

    invoke-static {v1, v2}, Lrm5;->Y(Ld82;Landroid/graphics/RectF;)V

    iget-object v1, v3, Li97;->b:Landroid/graphics/PointF;

    iget v3, v1, Landroid/graphics/PointF;->x:F

    iget v1, v1, Landroid/graphics/PointF;->y:F

    const/4 v5, 0x0

    invoke-virtual {v2, v5, v5, v3, v1}, Landroid/graphics/RectF;->intersect(FFFF)Z

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    const/4 v1, 0x1

    const/high16 v3, 0x42000000    # 32.0f

    invoke-static {v1, v3, p0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p0

    float-to-int p0, p0

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v1

    int-to-float p0, p0

    cmpl-float v1, v1, p0

    if-ltz v1, :cond_7b

    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v1

    cmpl-float p0, v1, p0

    if-ltz p0, :cond_7b

    :cond_78
    sget-object p0, Lcxa;->a:Lcxa;

    goto :goto_7d

    :cond_7b
    sget-object p0, Lcxa;->b:Lcxa;

    :goto_7d
    invoke-virtual {v0, v4, p0}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    return-void
.end method
