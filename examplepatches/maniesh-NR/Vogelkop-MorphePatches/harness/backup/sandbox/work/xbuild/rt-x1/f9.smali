.class public final synthetic Lf9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 5

    .line 16
    iput-byte p4, p0, Lf9;->a:B

    iput-object p1, p0, Lf9;->b:Ljava/lang/Object;

    iput-object p2, p0, Lf9;->c:Ljava/lang/Object;

    iput-object p3, p0, Lf9;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/functions/Function1;Lafe;Lafe;)V
    .registers 5

    .line 17
    const/16 v0, 0xb

    iput-byte v0, p0, Lf9;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lf9;->c:Ljava/lang/Object;

    iput-object p2, p0, Lf9;->b:Ljava/lang/Object;

    iput-object p3, p0, Lf9;->d:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lmq5;Lvnm;Lunb;Lqpi;)V
    .registers 5

    .line 14
    const/16 p2, 0x18

    iput-byte p2, p0, Lf9;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lf9;->b:Ljava/lang/Object;

    iput-object p3, p0, Lf9;->c:Ljava/lang/Object;

    iput-object p4, p0, Lf9;->d:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lmqh;Lopi;Lmqh;Lsp6;)V
    .registers 5

    .line 15
    const/16 p4, 0x1a

    iput-byte p4, p0, Lf9;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lf9;->b:Ljava/lang/Object;

    iput-object p2, p0, Lf9;->c:Ljava/lang/Object;

    iput-object p3, p0, Lf9;->d:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lsf1;Lkotlin/jvm/functions/Function0;Lc61;)V
    .registers 5

    const/16 v0, 0x1c

    iput-byte v0, p0, Lf9;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lf9;->b:Ljava/lang/Object;

    iput-object p2, p0, Lf9;->d:Ljava/lang/Object;

    iput-object p3, p0, Lf9;->c:Ljava/lang/Object;

    return-void
.end method

.method private final a(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 15

    iget-object v0, p0, Lf9;->b:Ljava/lang/Object;

    check-cast v0, Lgbc;

    iget-object v1, p0, Lf9;->c:Ljava/lang/Object;

    check-cast v1, Lmil;

    iget-wide v1, v1, Lmil;->b:J

    iget-object p0, p0, Lf9;->d:Ljava/lang/Object;

    check-cast p0, Li9f;

    check-cast p1, Lmk7;

    invoke-virtual {v0}, Lgbc;->d()Lojl;

    move-result-object v3

    if-eqz v3, :cond_166

    invoke-interface {p1}, Lmk7;->s0()Ld5o;

    move-result-object p1

    invoke-virtual {p1}, Ld5o;->A()Lsh4;

    move-result-object v5

    iget-object p1, v0, Lgbc;->A:Lt0g;

    invoke-virtual {p1}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lxjl;

    iget-wide v6, p1, Lxjl;->a:J

    iget-object p1, v0, Lgbc;->B:Lt0g;

    invoke-virtual {p1}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lxjl;

    iget-wide v8, p1, Lxjl;->a:J

    iget-object p1, v3, Lojl;->a:Lnjl;

    iget-object v3, p1, Lnjl;->a:Lmjl;

    iget-object v4, p1, Lnjl;->b:Lxbe;

    iget-object v10, v0, Lgbc;->y:Lzg;

    iget-wide v11, v0, Lgbc;->z:J

    invoke-static {v6, v7}, Lxjl;->c(J)Z

    move-result v0

    if-nez v0, :cond_5f

    invoke-virtual {v10, v11, v12}, Lzg;->D(J)V

    invoke-static {v6, v7}, Lxjl;->f(J)I

    move-result v0

    invoke-interface {p0, v0}, Li9f;->i(I)I

    move-result v0

    invoke-static {v6, v7}, Lxjl;->e(J)I

    move-result v1

    invoke-interface {p0, v1}, Li9f;->i(I)I

    move-result p0

    if-eq v0, p0, :cond_c9

    invoke-virtual {p1, v0, p0}, Lnjl;->i(II)Ld91;

    move-result-object p0

    invoke-interface {v5, p0, v10}, Lsh4;->q(Ld91;Lzg;)V

    goto :goto_c9

    :cond_5f
    invoke-static {v8, v9}, Lxjl;->c(J)Z

    move-result v0

    if-nez v0, :cond_a7

    iget-object v0, v3, Lmjl;->b:Likl;

    invoke-virtual {v0}, Likl;->b()J

    move-result-wide v0

    new-instance v2, Lu95;

    invoke-direct {v2, v0, v1}, Lu95;-><init>(J)V

    const-wide/16 v6, 0x10

    cmp-long v0, v0, v6

    if-nez v0, :cond_77

    const/4 v2, 0x0

    :cond_77
    if-eqz v2, :cond_7c

    iget-wide v0, v2, Lu95;->a:J

    goto :goto_7e

    :cond_7c
    sget-wide v0, Lu95;->b:J

    :goto_7e
    invoke-static {v0, v1}, Lu95;->c(J)F

    move-result v2

    const v6, 0x3e4ccccd    # 0.2f

    mul-float/2addr v2, v6

    invoke-static {v0, v1, v2}, Lu95;->b(JF)J

    move-result-wide v0

    invoke-virtual {v10, v0, v1}, Lzg;->D(J)V

    invoke-static {v8, v9}, Lxjl;->f(J)I

    move-result v0

    invoke-interface {p0, v0}, Li9f;->i(I)I

    move-result v0

    invoke-static {v8, v9}, Lxjl;->e(J)I

    move-result v1

    invoke-interface {p0, v1}, Li9f;->i(I)I

    move-result p0

    if-eq v0, p0, :cond_c9

    invoke-virtual {p1, v0, p0}, Lnjl;->i(II)Ld91;

    move-result-object p0

    invoke-interface {v5, p0, v10}, Lsh4;->q(Ld91;Lzg;)V

    goto :goto_c9

    :cond_a7
    invoke-static {v1, v2}, Lxjl;->c(J)Z

    move-result v0

    if-nez v0, :cond_c9

    invoke-virtual {v10, v11, v12}, Lzg;->D(J)V

    invoke-static {v1, v2}, Lxjl;->f(J)I

    move-result v0

    invoke-interface {p0, v0}, Li9f;->i(I)I

    move-result v0

    invoke-static {v1, v2}, Lxjl;->e(J)I

    move-result v1

    invoke-interface {p0, v1}, Li9f;->i(I)I

    move-result p0

    if-eq v0, p0, :cond_c9

    invoke-virtual {p1, v0, p0}, Lnjl;->i(II)Ld91;

    move-result-object p0

    invoke-interface {v5, p0, v10}, Lsh4;->q(Ld91;Lzg;)V

    :cond_c9
    :goto_c9
    iget-wide p0, p1, Lnjl;->c:J

    const/16 v0, 0x20

    shr-long v1, p0, v0

    long-to-int v1, v1

    int-to-float v1, v1

    iget v2, v4, Lxbe;->d:F

    cmpg-float v1, v1, v2

    const/4 v2, 0x1

    const/4 v6, 0x0

    const-wide v7, 0xffffffffL

    if-ltz v1, :cond_ee

    iget-boolean v1, v4, Lxbe;->c:Z

    if-nez v1, :cond_ee

    and-long v9, p0, v7

    long-to-int v1, v9

    int-to-float v1, v1

    iget v9, v4, Lxbe;->e:F

    cmpg-float v1, v1, v9

    if-ltz v1, :cond_ee

    move v1, v6

    goto :goto_ef

    :cond_ee
    move v1, v2

    :goto_ef
    if-eqz v1, :cond_f6

    iget v1, v3, Lmjl;->f:I

    const/4 v9, 0x3

    if-ne v1, v9, :cond_f7

    :cond_f6
    move v2, v6

    :cond_f7
    if-eqz v2, :cond_119

    shr-long v9, p0, v0

    long-to-int v1, v9

    int-to-float v1, v1

    and-long/2addr p0, v7

    long-to-int p0, p0

    int-to-float p0, p0

    invoke-static {v1}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result p1

    int-to-long v9, p1

    invoke-static {p0}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result p0

    int-to-long p0, p0

    shl-long/2addr v9, v0

    and-long/2addr p0, v7

    or-long/2addr v9, p0

    const-wide/16 p0, 0x0

    invoke-static {p0, p1, v9, v10}, Lbwg;->a(JJ)Lvoh;

    move-result-object p0

    invoke-interface {v5}, Lsh4;->j()V

    invoke-static {v5, p0}, Lsh4;->r(Lsh4;Lvoh;)V

    :cond_119
    iget-object p0, v3, Lmjl;->b:Likl;

    iget-object p0, p0, Likl;->a:Lrwj;

    iget-object p1, p0, Lrwj;->m:Lbgl;

    iget-object v0, p0, Lrwj;->a:Lpil;

    if-nez p1, :cond_125

    sget-object p1, Lbgl;->b:Lbgl;

    :cond_125
    move-object v9, p1

    iget-object p1, p0, Lrwj;->n:Ljaj;

    if-nez p1, :cond_12c

    sget-object p1, Ljaj;->d:Ljaj;

    :cond_12c
    move-object v8, p1

    iget-object p0, p0, Lrwj;->p:Lnk7;

    if-nez p0, :cond_133

    sget-object p0, La39;->a:La39;

    :cond_133
    move-object v10, p0

    :try_start_134
    invoke-interface {v0}, Lpil;->c()Ldz3;

    move-result-object v6

    sget-object p0, Loil;->a:Loil;

    if-eqz v6, :cond_14b

    if-eq v0, p0, :cond_144

    invoke-interface {v0}, Lpil;->b()F

    move-result p0

    :goto_142
    move v7, p0

    goto :goto_147

    :cond_144
    const/high16 p0, 0x3f800000    # 1.0f

    goto :goto_142

    :goto_147
    invoke-static/range {v4 .. v10}, Lxbe;->j(Lxbe;Lsh4;Ldz3;FLjaj;Lbgl;Lnk7;)V

    goto :goto_158

    :cond_14b
    if-eq v0, p0, :cond_152

    invoke-interface {v0}, Lpil;->a()J

    move-result-wide p0

    goto :goto_154

    :cond_152
    sget-wide p0, Lu95;->b:J

    :goto_154
    move-wide v6, p0

    invoke-static/range {v4 .. v10}, Lxbe;->i(Lxbe;Lsh4;JLjaj;Lbgl;Lnk7;)V
    :try_end_158
    .catchall {:try_start_134 .. :try_end_158} :catchall_15e

    :goto_158
    if-eqz v2, :cond_166

    invoke-interface {v5}, Lsh4;->f()V

    goto :goto_166

    :catchall_15e
    move-exception v0

    move-object p0, v0

    if-eqz v2, :cond_165

    invoke-interface {v5}, Lsh4;->f()V

    :cond_165
    throw p0

    :cond_166
    :goto_166
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method private final b(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6

    iget-object v0, p0, Lf9;->b:Ljava/lang/Object;

    check-cast v0, Lmqh;

    iget-object v1, p0, Lf9;->c:Ljava/lang/Object;

    check-cast v1, Lopi;

    iget-object p0, p0, Lf9;->d:Ljava/lang/Object;

    check-cast p0, Lmqh;

    check-cast p1, Lve1;

    iget-object v2, p1, Lve1;->e:Lt0g;

    invoke-virtual {v2}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->floatValue()F

    move-result v2

    iget v3, v0, Lmqh;->a:F

    sub-float/2addr v2, v3

    invoke-virtual {v1, v2}, Lopi;->a(F)F

    move-result v1

    iget-object v3, p1, Lve1;->e:Lt0g;

    invoke-virtual {v3}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->floatValue()F

    move-result v3

    iput v3, v0, Lmqh;->a:F

    iget-object v0, p1, Lve1;->a:Lj8m;

    iget-object v0, v0, Lj8m;->b:Lkotlin/jvm/functions/Function1;

    iget-object v3, p1, Lve1;->f:Lif1;

    invoke-interface {v0, v3}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    move-result v0

    iput v0, p0, Lmqh;->a:F

    sub-float/2addr v2, v1

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result p0

    const/high16 v0, 0x3f000000    # 0.5f

    cmpl-float p0, p0, v0

    if-lez p0, :cond_4f

    invoke-virtual {p1}, Lve1;->a()V

    :cond_4f
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method private final c(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 15

    iget-object v0, p0, Lf9;->b:Ljava/lang/Object;

    check-cast v0, Lkfl;

    iget-object v1, p0, Lf9;->c:Ljava/lang/Object;

    check-cast v1, Landroid/content/Context;

    iget-object p0, p0, Lf9;->d:Ljava/lang/Object;

    check-cast p0, Lxfl;

    check-cast p1, Lrs5;

    iget-object v0, v0, Lkfl;->a:Ljava/util/List;

    move-object v2, v0

    check-cast v2, Ljava/util/Collection;

    invoke-interface {v2}, Ljava/util/Collection;->size()I

    move-result v2

    const/4 v3, 0x0

    move v4, v3

    :goto_19
    if-ge v4, v2, :cond_b8

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljfl;

    instance-of v6, v5, Lsfl;

    const/4 v7, 0x6

    const/4 v8, 0x0

    const/4 v9, 0x1

    if-eqz v6, :cond_4e

    new-instance v6, Lwhf;

    check-cast v5, Lsfl;

    const/16 v10, 0x12

    invoke-direct {v6, v5, v10}, Lwhf;-><init>(Ljava/lang/Object;B)V

    iget v10, v5, Lsfl;->c:I

    if-eqz v10, :cond_43

    new-instance v8, Lkx4;

    invoke-direct {v8, v5, v9}, Lkx4;-><init>(Ljava/lang/Object;B)V

    new-instance v10, Lue5;

    const v11, -0x731428a5

    invoke-direct {v10, v11, v8, v9}, Lue5;-><init>(ILjava/lang/Object;Z)V

    move-object v8, v10

    :cond_43
    new-instance v9, Lgb3;

    const/16 v10, 0x15

    invoke-direct {v9, v5, p0, v10}, Lgb3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p1, v6, v8, v9, v7}, Lrs5;->b(Lrs5;Lkotlin/jvm/functions/Function2;Lue5;Lkotlin/jvm/functions/Function0;I)V

    goto :goto_b4

    :cond_4e
    instance-of v6, v5, Lyfl;

    if-eqz v6, :cond_a9

    check-cast v5, Lyfl;

    if-eqz v1, :cond_b4

    iget v6, v5, Lyfl;->c:I

    iget-object v10, v5, Lyfl;->b:Landroid/view/textclassifier/TextClassification;

    iget-object v5, v5, Lyfl;->d:Landroid/graphics/drawable/Drawable;

    if-gez v6, :cond_7e

    new-instance v6, Lnqi;

    const/16 v11, 0xd

    invoke-direct {v6, v10, v11}, Lnqi;-><init>(Ljava/lang/Object;B)V

    if-eqz v5, :cond_75

    new-instance v8, Lrfl;

    invoke-direct {v8, v5, v3}, Lrfl;-><init>(Landroid/graphics/drawable/Drawable;B)V

    new-instance v5, Lue5;

    const v12, -0x42f30a7b

    invoke-direct {v5, v12, v8, v9}, Lue5;-><init>(ILjava/lang/Object;Z)V

    move-object v8, v5

    :cond_75
    new-instance v5, Leek;

    invoke-direct {v5, v1, v10, v11}, Leek;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p1, v6, v8, v5, v7}, Lrs5;->b(Lrs5;Lkotlin/jvm/functions/Function2;Lue5;Lkotlin/jvm/functions/Function0;I)V

    goto :goto_b4

    :cond_7e
    invoke-virtual {v10}, Landroid/view/textclassifier/TextClassification;->getActions()Ljava/util/List;

    move-result-object v10

    invoke-interface {v10, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/app/RemoteAction;

    new-instance v10, Lnqi;

    const/16 v11, 0xe

    invoke-direct {v10, v6, v11}, Lnqi;-><init>(Ljava/lang/Object;B)V

    if-eqz v5, :cond_9f

    new-instance v8, Lrfl;

    invoke-direct {v8, v5, v9}, Lrfl;-><init>(Landroid/graphics/drawable/Drawable;B)V

    new-instance v5, Lue5;

    const v11, 0x41eeb29c

    invoke-direct {v5, v11, v8, v9}, Lue5;-><init>(ILjava/lang/Object;Z)V

    move-object v8, v5

    :cond_9f
    new-instance v5, Lp7l;

    const/4 v9, 0x3

    invoke-direct {v5, v6, v9}, Lp7l;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1, v10, v8, v5, v7}, Lrs5;->b(Lrs5;Lkotlin/jvm/functions/Function2;Lue5;Lkotlin/jvm/functions/Function0;I)V

    goto :goto_b4

    :cond_a9
    instance-of v5, v5, Lwfl;

    if-eqz v5, :cond_b4

    iget-object v5, p1, Lrs5;->a:Lpuj;

    sget-object v6, Lf03;->d:Lue5;

    invoke-virtual {v5, v6}, Lpuj;->add(Ljava/lang/Object;)Z

    :cond_b4
    :goto_b4
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_19

    :cond_b8
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 27

    move-object/from16 v0, p0

    iget-byte v1, v0, Lf9;->a:B

    const-string v2, ""

    const/16 v3, 0x8

    const/4 v4, 0x3

    const/4 v5, 0x2

    const/4 v6, 0x0

    const/4 v7, 0x1

    iget-object v8, v0, Lf9;->c:Ljava/lang/Object;

    iget-object v9, v0, Lf9;->d:Ljava/lang/Object;

    iget-object v10, v0, Lf9;->b:Ljava/lang/Object;

    const/4 v11, 0x0

    packed-switch v1, :pswitch_data_bba

    check-cast v10, Lvfd;

    check-cast v8, Lzj7;

    check-cast v9, Lifg;

    move-object/from16 v0, p1

    check-cast v0, Lp1d;

    invoke-interface {v10}, Lshb;->F()Z

    move-result v1

    iget-object v2, v8, Lzj7;->o:La21;

    if-eqz v1, :cond_3b

    invoke-virtual {v2}, La21;->h()Lx9d;

    move-result-object v1

    iget-object v2, v8, Lzj7;->o:La21;

    iget-object v2, v2, La21;->j:Ljava/lang/Object;

    check-cast v2, Li37;

    invoke-virtual {v2}, Li37;->getValue()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Lx9d;->d(Ljava/lang/Object;)F

    move-result v1

    goto :goto_3f

    :cond_3b
    invoke-virtual {v2}, La21;->l()F

    move-result v1

    :goto_3f
    iget-object v2, v8, Lzj7;->q:Lfsf;

    sget-object v3, Lfsf;->b:Lfsf;

    const/4 v4, 0x0

    if-ne v2, v3, :cond_48

    move v3, v1

    goto :goto_49

    :cond_48
    move v3, v4

    :goto_49
    sget-object v5, Lfsf;->a:Lfsf;

    if-eq v2, v5, :cond_4e

    move v1, v4

    :cond_4e
    iput-boolean v7, v0, Lp1d;->a:Z

    invoke-static {v3}, Lzed;->b(F)I

    move-result v2

    invoke-static {v1}, Lzed;->b(F)I

    move-result v1

    invoke-static {v0, v9, v2, v1}, Lp1d;->f(Lp1d;Lifg;II)V

    iput-boolean v6, v0, Lp1d;->a:Z

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_60
    check-cast v10, Lsf1;

    check-cast v9, Lkotlin/jvm/functions/Function0;

    check-cast v8, Lc61;

    move-object/from16 v0, p1

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const-string v1, "URL"

    invoke-virtual {v10, v0, v0, v1}, Lsf1;->b(IILjava/lang/String;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->firstOrNull(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lrf1;

    if-eqz v0, :cond_86

    invoke-interface {v9}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    iget-object v0, v0, Lrf1;->a:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v8, v0}, Lc61;->c(Ljava/lang/String;)Lul8;

    :cond_86
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_89
    invoke-direct/range {p0 .. p1}, Lf9;->c(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :pswitch_8e
    invoke-direct/range {p0 .. p1}, Lf9;->b(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :pswitch_93
    invoke-direct/range {p0 .. p1}, Lf9;->a(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :pswitch_98
    check-cast v10, Lmq5;

    check-cast v8, Lunb;

    check-cast v9, Lqpi;

    move-object/from16 v0, p1

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    iget-boolean v1, v10, Lmq5;->q:Z

    if-eqz v1, :cond_ad

    const/high16 v1, 0x3f800000    # 1.0f

    goto :goto_af

    :cond_ad
    const/high16 v1, -0x40800000    # -1.0f

    :goto_af
    mul-float v2, v1, v0

    iget-object v3, v10, Lmq5;->p:Lspi;

    invoke-virtual {v3, v2}, Lspi;->i(F)J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Lspi;->f(J)J

    move-result-wide v4

    iget-object v2, v9, Lqpi;->a:Lspi;

    iget-object v6, v2, Lspi;->k:Ltoi;

    invoke-virtual {v2, v6, v4, v5, v7}, Lspi;->d(Ltoi;JI)J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Lspi;->f(J)J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Lspi;->h(J)F

    move-result v2

    mul-float/2addr v2, v1

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v3

    cmpg-float v1, v1, v3

    if-gez v1, :cond_fa

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "Scroll animation cancelled because scroll was not consumed ("

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, " < "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v0, ")"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v11}, Lna2;->a(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/util/concurrent/CancellationException;

    move-result-object v0

    invoke-interface {v8, v0}, Lunb;->k(Ljava/util/concurrent/CancellationException;)V

    :cond_fa
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_fd
    check-cast v10, Lhk5;

    check-cast v8, Lik5;

    move-object v13, v9

    check-cast v13, Ljava/lang/String;

    move-object/from16 v0, p1

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iget-object v1, v10, Lhk5;->c:Ljava/lang/Object;

    check-cast v1, Llh4;

    if-eqz v1, :cond_506

    if-eqz v0, :cond_4f5

    iget-object v0, v8, Lik5;->b:Llpe;

    iget-object v0, v0, Llpe;->A:Lls4;

    sget-object v1, Lcs4;->e:Lcs4;

    invoke-virtual {v0, v1}, Lls4;->b(Lcs4;)[B

    move-result-object v0

    if-eqz v0, :cond_13a

    array-length v1, v0

    if-nez v1, :cond_125

    move v1, v7

    goto :goto_126

    :cond_125
    move v1, v6

    :goto_126
    xor-int/2addr v1, v7

    if-ne v1, v7, :cond_13a

    :try_start_129
    sget-object v1, Lt0i;->b:Lp0i;

    invoke-static {v0}, Lxk5;->g([B)Lxk5;

    move-result-object v0
    :try_end_12f
    .catchall {:try_start_129 .. :try_end_12f} :catchall_130

    goto :goto_13d

    :catchall_130
    move-exception v0

    sget-object v1, Lt0i;->b:Lp0i;

    new-instance v1, Lq0i;

    invoke-direct {v1, v0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object v0, v1

    goto :goto_13d

    :cond_13a
    sget-object v0, Lt0i;->b:Lp0i;

    move-object v0, v11

    :goto_13d
    invoke-static {v0}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v1

    sget-object v2, Li1g;->b:Li1g;

    if-nez v1, :cond_4eb

    check-cast v0, Lxk5;

    if-nez v0, :cond_156

    sget-object v0, Lxle;->c:Lxle;

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    new-instance v1, Lrw7;

    invoke-direct {v1, v0}, Lrw7;-><init>(Ljava/lang/Object;)V

    goto/16 :goto_500

    :cond_156
    iget-object v1, v8, Lik5;->c:Lfch;

    invoke-virtual {v0}, Lxk5;->b()I

    move-result v3

    iget-object v1, v1, Lfch;->a:Lhcb;

    invoke-interface {v1}, Lhcb;->getAsInt()I

    move-result v1

    if-le v3, v1, :cond_178

    new-instance v1, Ld5b;

    invoke-virtual {v0}, Lxk5;->b()I

    move-result v0

    invoke-direct {v1, v0}, Ld5b;-><init>(I)V

    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    new-instance v1, Lrw7;

    invoke-direct {v1, v0}, Lrw7;-><init>(Ljava/lang/Object;)V

    goto/16 :goto_500

    :cond_178
    invoke-virtual {v0}, Lxk5;->e()Ljava/util/Map;

    move-result-object v1

    new-instance v3, Ljava/util/LinkedHashMap;

    invoke-direct {v3, v1}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    const-string v4, "supported_news_locales"

    invoke-interface {v3, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    if-eqz v5, :cond_1b7

    invoke-static {v5}, Lddh;->x(Ljava/lang/String;)Ltw7;

    move-result-object v5

    instance-of v7, v5, Lrw7;

    if-eqz v7, :cond_1a7

    check-cast v5, Lrw7;

    iget-object v5, v5, Lrw7;->a:Ljava/lang/Object;

    check-cast v5, Lz5j;

    new-instance v7, Lrw7;

    invoke-direct {v7, v5}, Lrw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1b7

    :cond_1a7
    instance-of v7, v5, Lsw7;

    if-eqz v7, :cond_1b2

    check-cast v5, Lsw7;

    iget-object v5, v5, Lsw7;->a:Ljava/lang/Object;

    check-cast v5, Ledh;

    goto :goto_1b8

    :cond_1b2
    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_508

    :cond_1b7
    :goto_1b7
    move-object v5, v11

    :goto_1b8
    const-string v7, "enabled_news_categories"

    invoke-interface {v3, v7}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    if-eqz v8, :cond_1e9

    invoke-static {v8}, Ljym;->r(Ljava/lang/String;)Ltw7;

    move-result-object v8

    instance-of v9, v8, Lrw7;

    if-eqz v9, :cond_1d9

    check-cast v8, Lrw7;

    iget-object v8, v8, Lrw7;->a:Ljava/lang/Object;

    check-cast v8, Lz5j;

    new-instance v9, Lrw7;

    invoke-direct {v9, v8}, Lrw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v1, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1e9

    :cond_1d9
    instance-of v9, v8, Lsw7;

    if-eqz v9, :cond_1e4

    check-cast v8, Lsw7;

    iget-object v8, v8, Lsw7;->a:Ljava/lang/Object;

    check-cast v8, Ladh;

    goto :goto_1ea

    :cond_1e4
    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_508

    :cond_1e9
    :goto_1e9
    move-object v8, v11

    :goto_1ea
    if-nez v5, :cond_1ee

    if-eqz v8, :cond_20b

    :cond_1ee
    new-instance v9, Ls5j;

    if-eqz v5, :cond_1f6

    iget-object v5, v5, Ledh;->a:Ljava/util/List;

    if-nez v5, :cond_1f8

    :cond_1f6
    sget-object v5, Ll08;->a:Ll08;

    :cond_1f8
    if-eqz v8, :cond_1fe

    iget-object v8, v8, Ladh;->a:Ljava/util/List;

    if-nez v8, :cond_200

    :cond_1fe
    sget-object v8, Ll08;->a:Ll08;

    :cond_200
    invoke-direct {v9, v5, v8}, Ls5j;-><init>(Ljava/util/List;Ljava/util/List;)V

    new-instance v5, Lsw7;

    invoke-direct {v5, v9}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_20b
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_218
    :goto_218
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_45c

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/Map$Entry;

    invoke-interface {v8}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    invoke-interface {v8}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/String;->hashCode()I

    move-result v12

    sparse-switch v12, :sswitch_data_bf8

    goto/16 :goto_3e1

    :sswitch_239
    const-string v12, "live_scores_enabled"

    invoke-virtual {v9, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_3e1

    invoke-static {v8}, Lkotlin/text/StringsKt;->l0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    const-string v9, "1"

    invoke-static {v8, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_259

    sget-object v8, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    new-instance v9, Lsw7;

    invoke-direct {v9, v8}, Lsw7;-><init>(Ljava/lang/Object;)V

    goto :goto_26e

    :cond_259
    const-string v9, "0"

    invoke-static {v8, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_269

    sget-object v8, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    new-instance v9, Lsw7;

    invoke-direct {v9, v8}, Lsw7;-><init>(Ljava/lang/Object;)V

    goto :goto_26e

    :cond_269
    new-instance v9, Lrw7;

    invoke-direct {v9, v2}, Lrw7;-><init>(Ljava/lang/Object;)V

    :goto_26e
    instance-of v8, v9, Lrw7;

    if-eqz v8, :cond_283

    check-cast v9, Lrw7;

    iget-object v8, v9, Lrw7;->a:Ljava/lang/Object;

    check-cast v8, Li1g;

    new-instance v8, Lz5j;

    invoke-direct {v8, v12}, Lz5j;-><init>(Ljava/lang/String;)V

    new-instance v9, Lrw7;

    invoke-direct {v9, v8}, Lrw7;-><init>(Ljava/lang/Object;)V

    goto :goto_287

    :cond_283
    instance-of v8, v9, Lsw7;

    if-eqz v8, :cond_2ab

    :goto_287
    instance-of v8, v9, Lrw7;

    if-nez v8, :cond_3f0

    instance-of v8, v9, Lsw7;

    if-eqz v8, :cond_2a6

    check-cast v9, Lsw7;

    iget-object v8, v9, Lsw7;->a:Ljava/lang/Object;

    check-cast v8, Ljava/lang/Boolean;

    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v8

    new-instance v9, Lbdh;

    invoke-direct {v9, v8}, Lbdh;-><init>(Z)V

    new-instance v8, Lsw7;

    invoke-direct {v8, v9}, Lsw7;-><init>(Ljava/lang/Object;)V

    :goto_2a3
    move-object v9, v8

    goto/16 :goto_3f0

    :cond_2a6
    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_508

    :cond_2ab
    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_508

    :sswitch_2b0
    const-string v12, "reader_mode"

    invoke-virtual {v9, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_3e1

    invoke-static {v8}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_2c4

    new-instance v8, Lrw7;

    invoke-direct {v8, v2}, Lrw7;-><init>(Ljava/lang/Object;)V

    goto :goto_2d2

    :cond_2c4
    invoke-static {v8}, Lkotlin/text/StringsKt;->l0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    new-instance v9, Lsw7;

    invoke-direct {v9, v8}, Lsw7;-><init>(Ljava/lang/Object;)V

    move-object v8, v9

    :goto_2d2
    instance-of v9, v8, Lrw7;

    if-eqz v9, :cond_2e7

    check-cast v8, Lrw7;

    iget-object v8, v8, Lrw7;->a:Ljava/lang/Object;

    check-cast v8, Li1g;

    new-instance v8, Lz5j;

    invoke-direct {v8, v12}, Lz5j;-><init>(Ljava/lang/String;)V

    new-instance v9, Lrw7;

    invoke-direct {v9, v8}, Lrw7;-><init>(Ljava/lang/Object;)V

    goto :goto_2ec

    :cond_2e7
    instance-of v9, v8, Lsw7;

    if-eqz v9, :cond_30a

    move-object v9, v8

    :goto_2ec
    instance-of v8, v9, Lrw7;

    if-nez v8, :cond_3f0

    instance-of v8, v9, Lsw7;

    if-eqz v8, :cond_305

    check-cast v9, Lsw7;

    iget-object v8, v9, Lsw7;->a:Ljava/lang/Object;

    check-cast v8, Ljava/lang/String;

    new-instance v9, Lcdh;

    invoke-direct {v9, v8}, Lcdh;-><init>(Ljava/lang/String;)V

    new-instance v8, Lsw7;

    invoke-direct {v8, v9}, Lsw7;-><init>(Ljava/lang/Object;)V

    goto :goto_2a3

    :cond_305
    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_508

    :cond_30a
    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_508

    :sswitch_30f
    const-string v12, "theme"

    invoke-virtual {v9, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_3e1

    invoke-static {v8}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_323

    new-instance v8, Lrw7;

    invoke-direct {v8, v2}, Lrw7;-><init>(Ljava/lang/Object;)V

    goto :goto_331

    :cond_323
    invoke-static {v8}, Lkotlin/text/StringsKt;->l0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    new-instance v9, Lsw7;

    invoke-direct {v9, v8}, Lsw7;-><init>(Ljava/lang/Object;)V

    move-object v8, v9

    :goto_331
    instance-of v9, v8, Lrw7;

    if-eqz v9, :cond_346

    check-cast v8, Lrw7;

    iget-object v8, v8, Lrw7;->a:Ljava/lang/Object;

    check-cast v8, Li1g;

    new-instance v8, Lz5j;

    invoke-direct {v8, v12}, Lz5j;-><init>(Ljava/lang/String;)V

    new-instance v9, Lrw7;

    invoke-direct {v9, v8}, Lrw7;-><init>(Ljava/lang/Object;)V

    goto :goto_34b

    :cond_346
    instance-of v9, v8, Lsw7;

    if-eqz v9, :cond_36a

    move-object v9, v8

    :goto_34b
    instance-of v8, v9, Lrw7;

    if-nez v8, :cond_3f0

    instance-of v8, v9, Lsw7;

    if-eqz v8, :cond_365

    check-cast v9, Lsw7;

    iget-object v8, v9, Lsw7;->a:Ljava/lang/Object;

    check-cast v8, Ljava/lang/String;

    new-instance v9, Lfdh;

    invoke-direct {v9, v8}, Lfdh;-><init>(Ljava/lang/String;)V

    new-instance v8, Lsw7;

    invoke-direct {v8, v9}, Lsw7;-><init>(Ljava/lang/Object;)V

    goto/16 :goto_2a3

    :cond_365
    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_508

    :cond_36a
    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_508

    :sswitch_36f
    invoke-virtual {v9, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_3e1

    invoke-static {v8}, Lddh;->x(Ljava/lang/String;)Ltw7;

    move-result-object v9

    goto/16 :goto_3f0

    :sswitch_37b
    const-string v12, "theme_accent"

    invoke-virtual {v9, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_3e1

    invoke-static {v8}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_38f

    new-instance v8, Lrw7;

    invoke-direct {v8, v2}, Lrw7;-><init>(Ljava/lang/Object;)V

    goto :goto_39d

    :cond_38f
    invoke-static {v8}, Lkotlin/text/StringsKt;->l0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    new-instance v9, Lsw7;

    invoke-direct {v9, v8}, Lsw7;-><init>(Ljava/lang/Object;)V

    move-object v8, v9

    :goto_39d
    instance-of v9, v8, Lrw7;

    if-eqz v9, :cond_3b2

    check-cast v8, Lrw7;

    iget-object v8, v8, Lrw7;->a:Ljava/lang/Object;

    check-cast v8, Li1g;

    new-instance v8, Lz5j;

    invoke-direct {v8, v12}, Lz5j;-><init>(Ljava/lang/String;)V

    new-instance v9, Lrw7;

    invoke-direct {v9, v8}, Lrw7;-><init>(Ljava/lang/Object;)V

    goto :goto_3b7

    :cond_3b2
    instance-of v9, v8, Lsw7;

    if-eqz v9, :cond_3d6

    move-object v9, v8

    :goto_3b7
    instance-of v8, v9, Lrw7;

    if-nez v8, :cond_3f0

    instance-of v8, v9, Lsw7;

    if-eqz v8, :cond_3d1

    check-cast v9, Lsw7;

    iget-object v8, v9, Lsw7;->a:Ljava/lang/Object;

    check-cast v8, Ljava/lang/String;

    new-instance v9, Lgdh;

    invoke-direct {v9, v8}, Lgdh;-><init>(Ljava/lang/String;)V

    new-instance v8, Lsw7;

    invoke-direct {v8, v9}, Lsw7;-><init>(Ljava/lang/Object;)V

    goto/16 :goto_2a3

    :cond_3d1
    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_508

    :cond_3d6
    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_508

    :sswitch_3db
    invoke-virtual {v9, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_3ec

    :cond_3e1
    :goto_3e1
    new-instance v8, Limm;

    invoke-direct {v8, v9}, Limm;-><init>(Ljava/lang/String;)V

    new-instance v9, Lrw7;

    invoke-direct {v9, v8}, Lrw7;-><init>(Ljava/lang/Object;)V

    goto :goto_3f0

    :cond_3ec
    invoke-static {v8}, Ljym;->r(Ljava/lang/String;)Ltw7;

    move-result-object v9

    :cond_3f0
    :goto_3f0
    instance-of v8, v9, Lrw7;

    if-nez v8, :cond_44b

    instance-of v8, v9, Lsw7;

    if-eqz v8, :cond_457

    check-cast v9, Lsw7;

    iget-object v8, v9, Lsw7;->a:Ljava/lang/Object;

    check-cast v8, Lhdh;

    if-eqz v8, :cond_452

    instance-of v9, v8, Lbdh;

    if-eqz v9, :cond_40e

    new-instance v9, Lr5j;

    check-cast v8, Lbdh;

    iget-boolean v8, v8, Lbdh;->a:Z

    invoke-direct {v9, v8}, Lr5j;-><init>(Z)V

    goto :goto_441

    :cond_40e
    instance-of v9, v8, Lfdh;

    if-eqz v9, :cond_41c

    new-instance v9, Lw5j;

    check-cast v8, Lfdh;

    iget-object v8, v8, Lfdh;->a:Ljava/lang/String;

    invoke-direct {v9, v8}, Lw5j;-><init>(Ljava/lang/String;)V

    goto :goto_441

    :cond_41c
    instance-of v9, v8, Lgdh;

    if-eqz v9, :cond_42a

    new-instance v9, Lx5j;

    check-cast v8, Lgdh;

    iget-object v8, v8, Lgdh;->a:Ljava/lang/String;

    invoke-direct {v9, v8}, Lx5j;-><init>(Ljava/lang/String;)V

    goto :goto_441

    :cond_42a
    instance-of v9, v8, Lcdh;

    if-eqz v9, :cond_438

    new-instance v9, Lv5j;

    check-cast v8, Lcdh;

    iget-object v8, v8, Lcdh;->a:Ljava/lang/String;

    invoke-direct {v9, v8}, Lv5j;-><init>(Ljava/lang/String;)V

    goto :goto_441

    :cond_438
    instance-of v9, v8, Ladh;

    if-nez v9, :cond_440

    instance-of v8, v8, Ledh;

    if-eqz v8, :cond_452

    :cond_440
    move-object v9, v11

    :goto_441
    if-eqz v9, :cond_44a

    new-instance v8, Lsw7;

    invoke-direct {v8, v9}, Lsw7;-><init>(Ljava/lang/Object;)V

    move-object v9, v8

    goto :goto_44b

    :cond_44a
    move-object v9, v11

    :cond_44b
    :goto_44b
    if-eqz v9, :cond_218

    invoke-virtual {v5, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_218

    :cond_452
    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_508

    :cond_457
    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_508

    :cond_45c
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    move v4, v6

    :cond_469
    :goto_469
    if-ge v4, v3, :cond_491

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    check-cast v5, Ltw7;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    instance-of v7, v5, Lrw7;

    if-eqz v7, :cond_47f

    check-cast v5, Lrw7;

    iget-object v5, v5, Lrw7;->a:Ljava/lang/Object;

    goto :goto_484

    :cond_47f
    instance-of v5, v5, Lsw7;

    if-eqz v5, :cond_48c

    move-object v5, v11

    :goto_484
    check-cast v5, Lp58;

    if-eqz v5, :cond_469

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_469

    :cond_48c
    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_508

    :cond_491
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_4b1

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    move v4, v6

    :cond_49c
    if-ge v4, v3, :cond_4b1

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    check-cast v5, Lp58;

    iget-boolean v5, v5, Lp58;->a:Z

    if-eqz v5, :cond_49c

    new-instance v0, Lrw7;

    invoke-direct {v0, v2}, Lrw7;-><init>(Ljava/lang/Object;)V

    :goto_4af
    move-object v1, v0

    goto :goto_500

    :cond_4b1
    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    :cond_4ba
    :goto_4ba
    if-ge v6, v2, :cond_4d0

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v6, v6, 0x1

    check-cast v3, Ltw7;

    invoke-virtual {v3}, Ltw7;->a()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ly5j;

    if-eqz v3, :cond_4ba

    invoke-virtual {v14, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4ba

    :cond_4d0
    invoke-virtual {v0}, Lxk5;->f()Lffb;

    move-result-object v15

    invoke-virtual {v0}, Lxk5;->a()Lffb;

    move-result-object v16

    invoke-virtual {v0}, Lxk5;->d()Z

    move-result v17

    invoke-virtual {v0}, Lxk5;->c()Z

    move-result v18

    new-instance v12, Lvj5;

    invoke-direct/range {v12 .. v18}, Lvj5;-><init>(Ljava/lang/String;Ljava/util/ArrayList;Lffb;Lffb;ZZ)V

    new-instance v0, Lsw7;

    invoke-direct {v0, v12}, Lsw7;-><init>(Ljava/lang/Object;)V

    goto :goto_4af

    :cond_4eb
    invoke-static {v2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    new-instance v1, Lrw7;

    invoke-direct {v1, v0}, Lrw7;-><init>(Ljava/lang/Object;)V

    goto :goto_500

    :cond_4f5
    sget-object v0, Lxle;->b:Lxle;

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    new-instance v1, Lrw7;

    invoke-direct {v1, v0}, Lrw7;-><init>(Ljava/lang/Object;)V

    :goto_500
    invoke-virtual {v10, v1}, Lhk5;->run(Ljava/lang/Object;)V

    sget-object v11, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_508

    :cond_506
    sget-object v11, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_508
    return-object v11

    :pswitch_509
    check-cast v10, Lr65;

    check-cast v8, Lcom/usercentrics/sdk/UsercentricsReadyStatus;

    check-cast v9, Lcom/usercentrics/sdk/UsercentricsOptions;

    move-object/from16 v0, p1

    check-cast v0, Lfwm;

    invoke-virtual {v10, v8, v9, v11}, Lr65;->i(Lcom/usercentrics/sdk/UsercentricsReadyStatus;Lcom/usercentrics/sdk/UsercentricsOptions;Lfwm;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_519
    check-cast v10, Ljava/lang/String;

    check-cast v8, Lr65;

    check-cast v9, Lcom/usercentrics/sdk/UsercentricsOptions;

    move-object/from16 v0, p1

    check-cast v0, Lcom/usercentrics/sdk/UsercentricsReadyStatus;

    invoke-static {}, Lr9h;->p()Luwm;

    move-result-object v1

    new-instance v2, Lhv;

    invoke-direct {v2, v8, v0, v9, v3}, Lhv;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v3, Lf9;

    const/16 v4, 0x16

    invoke-direct {v3, v8, v0, v9, v4}, Lf9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1, v10, v2, v3}, Luwm;->b(Ljava/lang/String;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_539
    check-cast v10, Lv25;

    check-cast v8, Ls25;

    check-cast v9, Liu2;

    move-object/from16 v0, p1

    check-cast v0, Ljava/lang/Long;

    iget-wide v1, v10, Lv25;->f:J

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    add-long/2addr v3, v1

    iput-wide v3, v10, Lv25;->f:J

    invoke-virtual {v10, v8, v9}, Lv25;->e(Ls25;Liu2;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_552
    check-cast v10, Lkwb;

    check-cast v8, Ljava/util/HashSet;

    check-cast v9, Luji;

    move-object/from16 v0, p1

    check-cast v0, Lvb7;

    iget-object v0, v10, Lkwb;->a:Ljava/util/HashSet;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_562
    :goto_562
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_578

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v8, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_562

    invoke-virtual {v9, v1}, Luji;->a(Ljava/lang/Object;)V

    goto :goto_562

    :cond_578
    iput-object v8, v10, Lkwb;->a:Ljava/util/HashSet;

    new-instance v0, Lt91;

    invoke-direct {v0, v7}, Lt91;-><init>(B)V

    return-object v0

    :pswitch_580
    check-cast v10, Ljava/util/HashMap;

    check-cast v8, Lhu4;

    check-cast v9, Lvr9;

    move-object/from16 v0, p1

    check-cast v0, Ljava/util/List;

    check-cast v0, Ljava/lang/Iterable;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_595
    :goto_595
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5ac

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Lnu4;

    iget-object v3, v3, Lnu4;->c:Llu4;

    sget-object v4, Llu4;->a:Llu4;

    if-eq v3, v4, :cond_595

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_595

    :cond_5ac
    invoke-virtual {v10, v8, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v9}, Lvr9;->run()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_5b5
    check-cast v10, Luz3;

    check-cast v9, Lf9;

    move-object/from16 v0, p1

    check-cast v0, Lvz3;

    sget-object v1, Lvz3;->a:Lvz3;

    if-ne v0, v1, :cond_5c4

    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_5c4
    invoke-virtual {v9, v0}, Lf9;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_5ca
    check-cast v10, Lzg;

    check-cast v8, Ltz3;

    check-cast v9, Luz3;

    move-object/from16 v0, p1

    check-cast v0, Lvz3;

    iget-object v1, v10, Lzg;->b:Ljava/lang/Object;

    check-cast v1, Loji;

    iget-object v2, v8, Ltz3;->a:Lbp3;

    iget-boolean v3, v8, Ltz3;->e:Z

    iget-object v12, v2, Lbp3;->f:Ljava/lang/Object;

    check-cast v12, Ld4l;

    iget-object v12, v12, Ld4l;->b:Lg4l;

    iget-object v12, v12, Lg4l;->o:La4l;

    invoke-virtual {v12}, Ljava/lang/Enum;->ordinal()I

    move-result v12

    if-eqz v12, :cond_5fd

    if-eq v12, v7, :cond_5fa

    if-eq v12, v5, :cond_5f7

    if-ne v12, v4, :cond_5f2

    move-object v12, v11

    goto :goto_5ff

    :cond_5f2
    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_6be

    :cond_5f7
    sget-object v12, Lzr0;->c:Lzr0;

    goto :goto_5ff

    :cond_5fa
    sget-object v12, Lzr0;->d:Lzr0;

    goto :goto_5ff

    :cond_5fd
    sget-object v12, Lzr0;->b:Lzr0;

    :goto_5ff
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v13

    const/4 v14, 0x4

    if-eqz v13, :cond_61e

    if-eq v13, v7, :cond_61b

    if-eq v13, v5, :cond_618

    if-eq v13, v4, :cond_615

    if-ne v13, v14, :cond_610

    move-object v13, v11

    goto :goto_620

    :cond_610
    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_6be

    :cond_615
    sget-object v13, Lkf0;->d:Lkf0;

    goto :goto_620

    :cond_618
    sget-object v13, Lkf0;->e:Lkf0;

    goto :goto_620

    :cond_61b
    sget-object v13, Lkf0;->b:Lkf0;

    goto :goto_620

    :cond_61e
    sget-object v13, Lkf0;->c:Lkf0;

    :goto_620
    if-eqz v12, :cond_66d

    if-eqz v13, :cond_66d

    iget-object v1, v1, Loji;->a:Ljava/lang/Object;

    check-cast v1, Lnw3;

    invoke-virtual {v1}, Lnw3;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorm;

    invoke-virtual {v9}, Ljava/lang/Enum;->ordinal()I

    move-result v15

    if-eqz v15, :cond_64d

    if-eq v15, v7, :cond_64a

    if-eq v15, v5, :cond_647

    if-eq v15, v4, :cond_644

    if-ne v15, v14, :cond_63f

    sget-object v15, Las0;->g:Las0;

    goto :goto_64f

    :cond_63f
    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_6be

    :cond_644
    sget-object v15, Las0;->e:Las0;

    goto :goto_64f

    :cond_647
    sget-object v15, Las0;->d:Las0;

    goto :goto_64f

    :cond_64a
    sget-object v15, Las0;->c:Las0;

    goto :goto_64f

    :cond_64d
    sget-object v15, Las0;->b:Las0;

    :goto_64f
    check-cast v1, Lx5f;

    iget-boolean v11, v1, Lx5f;->h:Z

    if-eqz v11, :cond_66d

    iget-object v11, v1, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v6

    new-instance v14, Lck0;

    invoke-direct {v14, v11, v6}, Lck0;-><init>(Lzpa;Lx56;)V

    new-instance v11, Lyo7;

    const/16 v4, 0x14

    invoke-direct {v11, v12, v15, v13, v4}, Lyo7;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v14, v11}, Lck0;->b(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v1, v6}, Lx5f;->U0(Lx56;)V

    :cond_66d
    sget-object v1, Lvz3;->c:Lvz3;

    if-eq v0, v1, :cond_683

    iget v4, v10, Lzg;->a:I

    add-int/2addr v4, v7

    iput v4, v10, Lzg;->a:I

    iput-object v9, v10, Lzg;->d:Ljava/lang/Object;

    sget-object v4, Lvz3;->e:Lvz3;

    if-eq v0, v4, :cond_683

    iget-object v4, v10, Lzg;->c:Ljava/lang/Object;

    check-cast v4, Lj1k;

    invoke-virtual {v4}, Lj1k;->invoke()Ljava/lang/Object;

    :cond_683
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v4

    if-eqz v4, :cond_6b8

    if-eq v4, v7, :cond_69c

    if-eq v4, v5, :cond_69c

    const/4 v5, 0x3

    if-eq v4, v5, :cond_698

    const/4 v0, 0x4

    if-eq v4, v0, :cond_6b8

    invoke-static {}, Lh9o;->p()V

    const/4 v11, 0x0

    goto :goto_6be

    :cond_698
    invoke-virtual {v8, v3}, Ltz3;->a(Z)V

    goto :goto_6bc

    :cond_69c
    if-ne v0, v1, :cond_6a0

    move v6, v7

    goto :goto_6a1

    :cond_6a0
    const/4 v6, 0x0

    :goto_6a1
    if-eqz v3, :cond_6a9

    if-nez v6, :cond_6a9

    invoke-virtual {v8, v7}, Ltz3;->a(Z)V

    goto :goto_6bc

    :cond_6a9
    new-instance v0, Lsz3;

    invoke-direct {v0, v8, v6}, Lsz3;-><init>(Ltz3;Z)V

    iput-object v0, v2, Lbp3;->j:Ljava/lang/Object;

    iget-object v0, v2, Lbp3;->g:Ljava/lang/Object;

    check-cast v0, Ld4l;

    invoke-virtual {v0}, Ld4l;->invoke()Ljava/lang/Object;

    goto :goto_6bc

    :cond_6b8
    const/4 v1, 0x0

    invoke-virtual {v8, v1}, Ltz3;->b(Z)V

    :goto_6bc
    sget-object v11, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_6be
    return-object v11

    :pswitch_6bf
    check-cast v10, Llj3;

    check-cast v8, Landroid/net/Uri;

    check-cast v9, Ljava/lang/String;

    move-object/from16 v0, p1

    check-cast v0, Lkotlin/Unit;

    new-instance v0, Lfvh;

    invoke-direct {v0}, Lfvh;-><init>()V

    invoke-virtual {v8}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1, v9}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lfvh;->h(Ljava/lang/String;)V

    const-string v1, "Content-Type"

    const-string v2, "application/octet-stream"

    invoke-virtual {v0, v1, v2}, Lfvh;->a(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v1, Lkvh;

    invoke-direct {v1, v0}, Lkvh;-><init>(Lfvh;)V

    iget-object v0, v10, Llj3;->d:Lt9f;

    invoke-virtual {v0, v1}, Lt9f;->c(Lkvh;)Lokhttp3/internal/connection/RealCall;

    move-result-object v2

    new-instance v3, Lcv2;

    const/4 v0, 0x6

    invoke-direct {v3, v10, v9, v0}, Lcv2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v4, Lf32;

    const/16 v0, 0x19

    invoke-direct {v4, v0}, Lf32;-><init>(B)V

    sget-object v0, Lpn7;->b:Lon7;

    const/16 v0, 0x78

    sget-object v1, Lun7;->e:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v6

    const/16 v8, 0x60

    const/4 v5, 0x3

    invoke-static/range {v2 .. v8}, Lvtp;->R(Lokhttp3/internal/connection/RealCall;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;IJI)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lt0i;

    iget-object v0, v0, Lt0i;->a:Ljava/lang/Object;

    invoke-static {v0}, Lybh;->y(Ljava/lang/Object;)V

    check-cast v0, Ljava/io/File;

    return-object v0

    :pswitch_71b
    check-cast v10, Ljava/lang/String;

    check-cast v8, Lmi3;

    check-cast v9, Lsj3;

    move-object/from16 v0, p1

    check-cast v0, Losk;

    const-string v1, "DELETE FROM active_block_lists WHERE name = ? AND kind = ?"

    invoke-virtual {v0, v1}, Losk;->h(Ljava/lang/String;)Lwsk;

    move-result-object v1

    :try_start_72b
    invoke-virtual {v1, v7, v10}, Lwsk;->h(ILjava/lang/String;)V

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v9}, Lmi3;->a(Lsj3;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v5, v0}, Lwsk;->h(ILjava/lang/String;)V

    invoke-virtual {v1}, Lwsk;->n()Z
    :try_end_73b
    .catchall {:try_start_72b .. :try_end_73b} :catchall_741

    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :catchall_741
    move-exception v0

    invoke-interface {v1}, Ljava/lang/AutoCloseable;->close()V

    throw v0

    :pswitch_746
    check-cast v10, Lmi3;

    check-cast v8, Ljava/util/ArrayList;

    check-cast v9, Ljava/util/Set;

    move-object/from16 v0, p1

    check-cast v0, Losk;

    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, v10, Lmi3;->a:Ly5i;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_75a
    if-ge v2, v1, :cond_76f

    invoke-virtual {v8, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Ldj3;

    new-instance v4, Lcv2;

    const/4 v5, 0x5

    invoke-direct {v4, v10, v3, v5}, Lcv2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    const/4 v3, 0x0

    invoke-static {v0, v3, v7, v4}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    goto :goto_75a

    :cond_76f
    check-cast v9, Ljava/lang/Iterable;

    invoke-interface {v9}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_775
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_795

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lkotlin/Pair;

    iget-object v3, v2, Lkotlin/Pair;->a:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    iget-object v2, v2, Lkotlin/Pair;->b:Ljava/lang/Object;

    check-cast v2, Lsj3;

    new-instance v4, Lf9;

    const/16 v5, 0xe

    invoke-direct {v4, v3, v10, v2, v5}, Lf9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    const/4 v3, 0x0

    invoke-static {v0, v3, v7, v4}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    goto :goto_775

    :cond_795
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_798
    check-cast v10, Ljava/lang/String;

    check-cast v8, Lnx5;

    check-cast v9, Lztl;

    move-object/from16 v0, p1

    check-cast v0, Lq0j;

    new-instance v1, Lgb3;

    invoke-direct {v1, v8, v9, v5}, Lgb3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    sget-object v2, Lo0j;->a:[Lxtb;

    sget-object v2, Le0j;->c:Lp0j;

    new-instance v3, Lc8;

    invoke-direct {v3, v10, v1}, Lc8;-><init>(Ljava/lang/String;Lbr9;)V

    invoke-interface {v0, v2, v3}, Lq0j;->b(Lp0j;Ljava/lang/Object;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_7b6
    check-cast v8, Lkotlin/jvm/functions/Function1;

    check-cast v10, Lafe;

    check-cast v9, Lafe;

    move-object/from16 v0, p1

    check-cast v0, Lmil;

    invoke-interface {v10, v0}, Lafe;->setValue(Ljava/lang/Object;)V

    invoke-interface {v9}, Liak;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iget-object v2, v0, Lmil;->a:Lsf1;

    iget-object v2, v2, Lsf1;->b:Ljava/lang/String;

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    iget-object v0, v0, Lmil;->a:Lsf1;

    iget-object v2, v0, Lsf1;->b:Ljava/lang/String;

    invoke-interface {v9, v2}, Lafe;->setValue(Ljava/lang/Object;)V

    if-nez v1, :cond_7df

    iget-object v0, v0, Lsf1;->b:Ljava/lang/String;

    invoke-interface {v8, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_7df
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_7e2
    check-cast v10, Lhu2;

    check-cast v8, Lw3g;

    check-cast v9, Lgv;

    move-object/from16 v0, p1

    check-cast v0, Lpkj;

    sget-object v1, Lpkj;->a:Lpkj;

    if-ne v0, v1, :cond_819

    iget-object v0, v10, Lhu2;->f:Lzg7;

    iget-object v0, v0, Lzg7;->m:Lati;

    check-cast v0, Lghf;

    iget-object v0, v0, Lghf;->b:Ljava/lang/Object;

    check-cast v0, Lx5g;

    iget-object v1, v0, Lx5g;->e:La4g;

    if-eqz v1, :cond_80c

    iget-object v2, v1, La4g;->a:Ljava/util/List;

    invoke-static {v2, v8}, Lw3g;->a(Ljava/util/List;Lw3g;)I

    move-result v3

    iget-wide v4, v1, La4g;->b:J

    invoke-static {v4, v5, v3}, LJ/N;->MvKxovNE(JI)V

    invoke-interface {v2, v3}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    :cond_80c
    iget-object v0, v0, Lx5g;->d:Lw4g;

    iget-object v0, v0, Lw4g;->a:Lvnj;

    invoke-static {v8}, Lw4g;->a(Lw3g;)Lknj;

    move-result-object v1

    invoke-virtual {v0, v1}, Lvnj;->j(Lknj;)V

    move v6, v7

    goto :goto_81a

    :cond_819
    const/4 v6, 0x0

    :goto_81a
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v9, v0}, Lgv;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_824
    check-cast v10, Lpqh;

    check-cast v8, Lt42;

    check-cast v9, Lvsn;

    move-object/from16 v0, p1

    check-cast v0, Lju4;

    iget-object v1, v10, Lpqh;->a:Ljava/lang/Object;

    if-eqz v1, :cond_840

    iget-object v1, v8, Lx22;->l:Lmrn;

    invoke-virtual {v1, v2}, Lmrn;->i(Ljava/lang/String;)V

    iget-object v1, v9, Lvsn;->c:Ls62;

    invoke-virtual {v1}, Ls62;->e()Liy1;

    move-result-object v1

    invoke-virtual {v1}, Liy1;->b()V

    :cond_840
    iput-object v0, v10, Lpqh;->a:Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_845
    check-cast v10, Ll32;

    move-object v2, v8

    check-cast v2, Ljava/lang/String;

    move-object v3, v9

    check-cast v3, Ljava/lang/String;

    move-object/from16 v0, p1

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iget-object v1, v10, Ll32;->e:Li7f;

    if-eqz v0, :cond_87b

    new-instance v6, Lg7f;

    invoke-direct {v6, v1}, Lg7f;-><init>(Li7f;)V

    :goto_85e
    invoke-virtual {v6}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_8a5

    invoke-virtual {v6}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lsz1;

    iget-object v1, v0, Lsz1;->a:Ltz1;

    iget-object v7, v1, Ltz1;->e:Lnx5;

    new-instance v0, Ls3;

    const/16 v5, 0x9

    const/4 v4, 0x0

    invoke-direct/range {v0 .. v5}, Ls3;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    const/4 v5, 0x3

    invoke-static {v7, v4, v4, v0, v5}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    goto :goto_85e

    :cond_87b
    new-instance v0, Lg7f;

    invoke-direct {v0, v1}, Lg7f;-><init>(Li7f;)V

    :goto_880
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_8a5

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lsz1;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v3, Lfbb;->a:Ls55;

    invoke-virtual {v3}, Ls55;->a()Lebb;

    move-result-object v3

    new-instance v4, Lr62;

    iget-object v1, v1, Lsz1;->a:Ltz1;

    iget-object v5, v1, Ltz1;->h:Lode;

    new-instance v6, Lsu;

    const/4 v8, 0x3

    invoke-direct {v6, v3, v1, v2, v8}, Lsu;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v4, v5, v6, v7}, Lr62;-><init>(Lekc;Lcom/opera/api/Callback;B)V

    goto :goto_880

    :cond_8a5
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_8a8
    check-cast v10, Lb22;

    check-cast v8, Lm02;

    check-cast v9, Lq2;

    move-object/from16 v0, p1

    check-cast v0, Lz42;

    iget-object v1, v10, Lx22;->l:Lmrn;

    invoke-virtual {v1, v2}, Lmrn;->i(Ljava/lang/String;)V

    invoke-static {}, Lkotlin/collections/a;->b()Lehc;

    move-result-object v2

    iget-object v4, v0, Lz42;->a:Ljava/util/ArrayList;

    iget-boolean v5, v0, Lz42;->c:Z

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v6

    const/4 v7, 0x0

    :goto_8c4
    if-ge v7, v6, :cond_8f9

    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    add-int/lit8 v7, v7, 0x1

    check-cast v10, Lh52;

    new-instance v18, Le52;

    iget-object v11, v10, Lh52;->a:Ljava/lang/String;

    iget-object v12, v10, Lh52;->f:Ljava/lang/String;

    iget-object v13, v10, Lh52;->g:Ljava/lang/String;

    iget-object v14, v10, Lh52;->h:Ljava/lang/String;

    iget-object v15, v10, Lh52;->i:Ljava/lang/String;

    iget-object v10, v10, Lh52;->j:Lz92;

    if-eqz v10, :cond_8ed

    iget-object v10, v10, Lz92;->a:Ljava/lang/String;

    move-object/from16 v24, v10

    :goto_8e2
    move-object/from16 v19, v11

    move-object/from16 v20, v12

    move-object/from16 v21, v13

    move-object/from16 v22, v14

    move-object/from16 v23, v15

    goto :goto_8f0

    :cond_8ed
    const/16 v24, 0x0

    goto :goto_8e2

    :goto_8f0
    invoke-direct/range {v18 .. v24}, Le52;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v10, v18

    invoke-virtual {v2, v10}, Lehc;->add(Ljava/lang/Object;)Z

    goto :goto_8c4

    :cond_8f9
    iget-object v0, v0, Lz42;->b:Lfz1;

    if-eqz v0, :cond_90b

    new-instance v4, Lf52;

    iget-object v6, v0, Lfz1;->a:Ljava/lang/String;

    iget-object v7, v0, Lfz1;->b:Ljava/lang/String;

    iget-object v0, v0, Lfz1;->c:Landroid/net/Uri;

    invoke-direct {v4, v0, v6, v7}, Lf52;-><init>(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v4}, Lehc;->add(Ljava/lang/Object;)Z

    :cond_90b
    if-eqz v5, :cond_917

    new-instance v0, Ld52;

    const-string v4, "deep_think_state"

    invoke-direct {v0, v4}, Ld52;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Lehc;->add(Ljava/lang/Object;)Z

    :cond_917
    invoke-static {v2}, Lkotlin/collections/a;->a(Lehc;)Lehc;

    move-result-object v0

    invoke-virtual {v0}, Lehc;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_9eb

    new-instance v2, Lq02;

    invoke-direct {v2, v9, v3}, Lq02;-><init>(Ljava/lang/Object;B)V

    invoke-static {}, Lkotlin/collections/a;->b()Lehc;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v0, v4}, Lehc;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v0

    :goto_92f
    move-object v4, v0

    check-cast v4, Lmea;

    invoke-virtual {v4}, Lmea;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_9bf

    invoke-virtual {v4}, Lmea;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lc52;

    if-eqz v4, :cond_9ba

    iget-object v6, v4, Lc52;->a:Lb52;

    iget-byte v6, v6, Lb52;->a:B

    instance-of v7, v4, Le52;

    const-string v9, "id"

    const-string v10, "type"

    if-eqz v7, :cond_978

    new-instance v7, Lorb;

    invoke-direct {v7}, Lorb;-><init>()V

    invoke-virtual {v7, v6, v10}, Lorb;->n(ILjava/lang/String;)V

    check-cast v4, Le52;

    iget-object v6, v4, Le52;->b:Ljava/lang/String;

    invoke-virtual {v7, v6, v9}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v6, "name"

    iget-object v9, v4, Le52;->c:Ljava/lang/String;

    invoke-virtual {v7, v9, v6}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v6, "mimeType"

    iget-object v9, v4, Le52;->e:Ljava/lang/String;

    invoke-virtual {v7, v9, v6}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v6, "shodanId"

    iget-object v9, v4, Le52;->d:Ljava/lang/String;

    invoke-virtual {v7, v9, v6}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v6, "thumbnailUrl"

    iget-object v4, v4, Le52;->f:Ljava/lang/String;

    invoke-virtual {v7, v4, v6}, Lorb;->s(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_9b5

    :cond_978
    instance-of v7, v4, Lf52;

    if-eqz v7, :cond_9a2

    new-instance v7, Lorb;

    invoke-direct {v7}, Lorb;-><init>()V

    invoke-virtual {v7, v6, v10}, Lorb;->n(ILjava/lang/String;)V

    check-cast v4, Lf52;

    iget-object v6, v4, Lf52;->b:Ljava/lang/String;

    invoke-virtual {v7, v6, v9}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v6, "text"

    iget-object v9, v4, Lf52;->c:Ljava/lang/String;

    invoke-virtual {v7, v9, v6}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v4, v4, Lf52;->d:Landroid/net/Uri;

    if-eqz v4, :cond_99b

    invoke-virtual {v4}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_99c

    :cond_99b
    const/4 v4, 0x0

    :goto_99c
    const-string v6, "pageUrl"

    invoke-virtual {v7, v4, v6}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_9b5

    :cond_9a2
    instance-of v7, v4, Ld52;

    if-eqz v7, :cond_9ba

    new-instance v7, Lorb;

    invoke-direct {v7}, Lorb;-><init>()V

    invoke-virtual {v7, v6, v10}, Lorb;->n(ILjava/lang/String;)V

    check-cast v4, Ld52;

    iget-object v4, v4, Ld52;->b:Ljava/lang/String;

    invoke-virtual {v7, v4, v9}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :goto_9b5
    invoke-virtual {v3, v7}, Lehc;->add(Ljava/lang/Object;)Z

    goto/16 :goto_92f

    :cond_9ba
    invoke-static {}, Lh9o;->p()V

    const/4 v11, 0x0

    goto :goto_9f2

    :cond_9bf
    invoke-static {v3}, Lkotlin/collections/a;->a(Lehc;)Lehc;

    move-result-object v0

    new-instance v3, Lorg/json/JSONArray;

    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    const/4 v4, 0x0

    invoke-virtual {v0, v4}, Lehc;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v0

    :goto_9cd
    move-object v4, v0

    check-cast v4, Lmea;

    invoke-virtual {v4}, Lmea;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_9e2

    invoke-virtual {v4}, Lmea;->next()Ljava/lang/Object;

    move-result-object v4

    invoke-static {v4}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_9cd

    :cond_9e2
    invoke-virtual {v3}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v3, "OFA.INITIALLY_SUBMITTED_FILES"

    invoke-virtual {v8, v3, v0, v2}, Lf12;->g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V

    :cond_9eb
    iget-object v0, v1, Lmrn;->r:Lcom/opera/android/custom_views/StylingImageCheckableWithText;

    invoke-virtual {v0, v5}, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->u(Z)V

    sget-object v11, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_9f2
    return-object v11

    :pswitch_9f3
    check-cast v10, Liy1;

    check-cast v8, Ljava/lang/String;

    check-cast v9, Ljava/io/File;

    move-object/from16 v0, p1

    check-cast v0, Lt12;

    iget-object v1, v10, Liy1;->m:Lqde;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Iterable;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_a09
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_a21

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Ljx1;

    invoke-interface {v3}, Ljx1;->getId()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v8}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_a09

    goto :goto_a22

    :cond_a21
    const/4 v2, 0x0

    :goto_a22
    if-eqz v2, :cond_a5b

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    if-eqz v0, :cond_a46

    if-eq v0, v7, :cond_a3e

    if-eq v0, v5, :cond_a36

    const/4 v5, 0x3

    if-eq v0, v5, :cond_a36

    invoke-static {}, Lh9o;->p()V

    const/4 v11, 0x0

    goto :goto_a5d

    :cond_a36
    const v0, 0x7f140800

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    goto :goto_a47

    :cond_a3e
    const v0, 0x7f1401d4

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    goto :goto_a47

    :cond_a46
    const/4 v11, 0x0

    :goto_a47
    if-eqz v11, :cond_a56

    invoke-virtual {v10, v8, v7}, Liy1;->g(Ljava/lang/String;Z)V

    iget-object v0, v10, Liy1;->h:Lgy1;

    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-interface {v0, v1}, Lgy1;->o(I)V

    goto :goto_a5b

    :cond_a56
    const-string v0, "image/webp"

    invoke-virtual {v10, v9, v8, v0}, Liy1;->i(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)V

    :cond_a5b
    :goto_a5b
    sget-object v11, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_a5d
    return-object v11

    :pswitch_a5e
    check-cast v10, Lat1;

    iget-object v0, v10, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    check-cast v8, Ld7j;

    check-cast v9, Landroid/content/Context;

    move-object/from16 v1, p1

    check-cast v1, Lkt1;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    if-eqz v1, :cond_a97

    if-eq v1, v7, :cond_a88

    if-ne v1, v5, :cond_a83

    sget-object v1, Lvb0;->d:Lvb0;

    iput-object v1, v10, Lat1;->t:Lvb0;

    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->e()Ld7j;

    move-result-object v0

    iget-boolean v1, v10, Lat1;->q:Z

    const/4 v3, 0x0

    invoke-virtual {v10, v0, v3, v1}, Lat1;->k(Ld7j;ZZ)V

    goto :goto_aa5

    :cond_a83
    invoke-static {}, Lh9o;->p()V

    const/4 v11, 0x0

    goto :goto_aa7

    :cond_a88
    const/4 v3, 0x0

    sget-object v1, Lvb0;->c:Lvb0;

    iput-object v1, v10, Lat1;->t:Lvb0;

    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->e()Ld7j;

    move-result-object v0

    iget-boolean v1, v10, Lat1;->q:Z

    invoke-virtual {v10, v0, v3, v1}, Lat1;->k(Ld7j;ZZ)V

    goto :goto_aa5

    :cond_a97
    iput-boolean v7, v10, Lat1;->r:Z

    iput-object v8, v10, Lat1;->s:Ld7j;

    iget-object v0, v10, Lat1;->g:Lyl6;

    invoke-static {v9}, Loi;->d(Landroid/content/Context;)Loi;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lyl6;->e(Loi;Ljava/lang/Runnable;)V

    :goto_aa5
    sget-object v11, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_aa7
    return-object v11

    :pswitch_aa8
    check-cast v10, Lat1;

    check-cast v8, Landroid/content/Context;

    check-cast v9, Lqs1;

    move-object/from16 v0, p1

    check-cast v0, Let1;

    sget-object v1, Let1;->a:Let1;

    if-ne v0, v1, :cond_aba

    invoke-virtual {v10, v8, v9}, Lat1;->h(Landroid/content/Context;Lqs1;)V

    goto :goto_ac6

    :cond_aba
    iget-object v0, v10, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->e()Ld7j;

    move-result-object v0

    iget-boolean v1, v10, Lat1;->q:Z

    const/4 v3, 0x0

    invoke-virtual {v10, v0, v3, v1}, Lat1;->k(Ld7j;ZZ)V

    :goto_ac6
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_ac9
    check-cast v10, Lmqh;

    check-cast v8, Ltul;

    check-cast v9, Lmqh;

    move-object/from16 v0, p1

    check-cast v0, Lve1;

    iget-object v1, v0, Lve1;->e:Lt0g;

    invoke-virtual {v1}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->floatValue()F

    move-result v1

    iget v2, v10, Lmqh;->a:F

    sub-float/2addr v1, v2

    iget-object v2, v8, Ltul;->c:Lp0g;

    invoke-virtual {v2}, Lp0g;->h()F

    move-result v2

    add-float v3, v2, v1

    invoke-virtual {v8, v3}, Ltul;->b(F)V

    iget-object v3, v8, Ltul;->c:Lp0g;

    invoke-virtual {v3}, Lp0g;->h()F

    move-result v3

    sub-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    iget-object v3, v0, Lve1;->e:Lt0g;

    invoke-virtual {v3}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->floatValue()F

    move-result v3

    iput v3, v10, Lmqh;->a:F

    iget-object v3, v0, Lve1;->a:Lj8m;

    iget-object v3, v3, Lj8m;->b:Lkotlin/jvm/functions/Function1;

    iget-object v4, v0, Lve1;->f:Lif1;

    invoke-interface {v3, v4}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->floatValue()F

    move-result v3

    iput v3, v9, Lmqh;->a:F

    sub-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    const/high16 v2, 0x3f000000    # 0.5f

    cmpl-float v1, v1, v2

    if-lez v1, :cond_b26

    invoke-virtual {v0}, Lve1;->a()V

    :cond_b26
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_b29
    check-cast v10, Lcd1;

    check-cast v8, Lxe1;

    check-cast v9, Llqh;

    move-object/from16 v0, p1

    check-cast v0, Lve1;

    iget-object v1, v10, Lcd1;->c:Lxe1;

    invoke-static {v0, v1}, Lmfh;->x(Lve1;Lxe1;)V

    iget-object v1, v0, Lve1;->e:Lt0g;

    invoke-virtual {v1}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v10, v2}, Lcd1;->b(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v1

    invoke-static {v2, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_b5d

    iget-object v1, v10, Lcd1;->c:Lxe1;

    iget-object v1, v1, Lxe1;->b:Lt0g;

    invoke-virtual {v1, v2}, Lt0g;->setValue(Ljava/lang/Object;)V

    iget-object v1, v8, Lxe1;->b:Lt0g;

    invoke-virtual {v1, v2}, Lt0g;->setValue(Ljava/lang/Object;)V

    invoke-virtual {v0}, Lve1;->a()V

    iput-boolean v7, v9, Llqh;->a:Z

    :cond_b5d
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_b60
    move-object v2, v11

    check-cast v10, Lc6n;

    check-cast v8, Lm3c;

    check-cast v9, Lc6n;

    move-object/from16 v0, p1

    check-cast v0, Lmk7;

    invoke-interface {v0}, Lmk7;->s0()Ld5o;

    move-result-object v0

    invoke-virtual {v0}, Ld5o;->A()Lsh4;

    move-result-object v0

    iget-object v1, v10, Lc6n;->b:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-eq v1, v3, :cond_b99

    iput-boolean v7, v10, Lc6n;->y:Z

    iget-object v1, v8, Lm3c;->n:Lv31;

    if-eqz v1, :cond_b83

    move-object v11, v1

    goto :goto_b84

    :cond_b83
    move-object v11, v2

    :goto_b84
    if-eqz v11, :cond_b96

    sget-object v1, Lb31;->a:Landroid/graphics/Canvas;

    check-cast v0, La31;

    iget-object v0, v0, La31;->a:Landroid/graphics/Canvas;

    invoke-virtual {v11}, Lv31;->g()Lnc1;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v9, v0}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    :cond_b96
    const/4 v3, 0x0

    iput-boolean v3, v10, Lc6n;->y:Z

    :cond_b99
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_b9c
    move v3, v6

    check-cast v10, Lndc;

    check-cast v8, Lkotlin/jvm/functions/Function1;

    check-cast v9, Lkotlin/jvm/functions/Function0;

    move-object/from16 v0, p1

    check-cast v0, Lvb7;

    new-instance v0, Lh9;

    invoke-direct {v0, v8, v3}, Lh9;-><init>(Ljava/lang/Object;B)V

    invoke-interface {v10}, Lndc;->getLifecycle()Ltcc;

    move-result-object v1

    invoke-virtual {v1, v0}, Ltcc;->a(Lmdc;)V

    new-instance v1, Li9;

    invoke-direct {v1, v9, v10, v0, v3}, Li9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object v1

    nop

    :pswitch_data_bba
    .packed-switch 0x0
        :pswitch_b9c
        :pswitch_b60
        :pswitch_b29
        :pswitch_ac9
        :pswitch_aa8
        :pswitch_a5e
        :pswitch_9f3
        :pswitch_8a8
        :pswitch_845
        :pswitch_824
        :pswitch_7e2
        :pswitch_7b6
        :pswitch_798
        :pswitch_746
        :pswitch_71b
        :pswitch_6bf
        :pswitch_5ca
        :pswitch_5b5
        :pswitch_580
        :pswitch_552
        :pswitch_539
        :pswitch_519
        :pswitch_509
        :pswitch_fd
        :pswitch_98
        :pswitch_93
        :pswitch_8e
        :pswitch_89
        :pswitch_60
    .end packed-switch

    :sswitch_data_bf8
    .sparse-switch
        -0x5780a1f6 -> :sswitch_3db
        -0x3c0d2800 -> :sswitch_37b
        -0x1aae7422 -> :sswitch_36f
        0x69375c9 -> :sswitch_30f
        0x17809b9f -> :sswitch_2b0
        0x687e5cd6 -> :sswitch_239
    .end sparse-switch
.end method
