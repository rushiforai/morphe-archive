.class public abstract Lrof;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lhp7;

.field public static final b:Lhp7;

.field public static final c:Lhp7;

.field public static final d:Lk5i;

.field public static final e:Lk5i;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lkof;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lkof;-><init>(B)V

    new-instance v1, Lhp7;

    const/4 v2, 0x1

    invoke-direct {v1, v0, v2}, Lhp7;-><init>(Lkotlin/jvm/functions/Function0;B)V

    sput-object v1, Lrof;->a:Lhp7;

    new-instance v0, Lkof;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lkof;-><init>(B)V

    new-instance v1, Lhp7;

    invoke-direct {v1, v0, v2}, Lhp7;-><init>(Lkotlin/jvm/functions/Function0;B)V

    sput-object v1, Lrof;->b:Lhp7;

    new-instance v0, Lkof;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lkof;-><init>(B)V

    new-instance v1, Lhp7;

    invoke-direct {v1, v0, v2}, Lhp7;-><init>(Lkotlin/jvm/functions/Function0;B)V

    sput-object v1, Lrof;->c:Lhp7;

    new-instance v0, Lk5i;

    sget-wide v1, Lu95;->b:J

    new-instance v3, Lj5i;

    const v4, 0x3df9db23    # 0.122f

    invoke-direct {v3, v4, v4, v4, v4}, Lj5i;-><init>(FFFF)V

    invoke-direct {v0, v1, v2, v3}, Lk5i;-><init>(JLj5i;)V

    sput-object v0, Lrof;->d:Lk5i;

    new-instance v0, Lk5i;

    sget-wide v1, Lu95;->c:J

    new-instance v3, Lj5i;

    const v4, 0x3e4ccccd    # 0.2f

    invoke-direct {v3, v4, v4, v4, v4}, Lj5i;-><init>(FFFF)V

    invoke-direct {v0, v1, v2, v3}, Lk5i;-><init>(JLj5i;)V

    sput-object v0, Lrof;->e:Lk5i;

    return-void
.end method

.method public static final a(Lue5;Lih5;I)V
    .registers 10

    move-object v3, p1

    check-cast v3, Lvt9;

    const p1, 0xf99a4cb

    invoke-virtual {v3, p1}, Lvt9;->Y(I)Lvt9;

    and-int/lit8 p1, p2, 0x3

    const/4 v0, 0x2

    const/4 v6, 0x0

    if-eq p1, v0, :cond_11

    const/4 p1, 0x1

    goto :goto_12

    :cond_11
    move p1, v6

    :goto_12
    and-int/lit8 v0, p2, 0x1

    invoke-virtual {v3, v0, p1}, Lvt9;->N(IZ)Z

    move-result p1

    if-eqz p1, :cond_f4

    sget-object p1, Lcab;->a:Lhp7;

    invoke-virtual {v3, p1}, Lvt9;->j(Lg7h;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    sget-object v0, Lrof;->a:Lhp7;

    if-eqz p1, :cond_52

    const p1, 0x68b1a8e6

    invoke-virtual {v3, p1}, Lvt9;->W(I)V

    invoke-virtual {v3, v0}, Lvt9;->j(Lg7h;)Ljava/lang/Object;

    move-result-object p1

    move-object v0, p1

    check-cast v0, Lnof;

    const/16 v4, 0x180

    const/4 v5, 0x2

    const/4 v1, 0x0

    move-object v2, p0

    invoke-static/range {v0 .. v5}, Lrof;->c(Lnof;ZLue5;Lih5;II)V

    invoke-virtual {v3, v6}, Lvt9;->p(Z)V

    invoke-virtual {v3}, Lvt9;->r()Lznh;

    move-result-object p0

    if-eqz p0, :cond_107

    new-instance p1, Lbg5;

    const/16 v0, 0xa

    invoke-direct {p1, v2, p2, v0}, Lbg5;-><init>(Lue5;IB)V

    iput-object p1, p0, Lznh;->d:Lkotlin/jvm/functions/Function2;

    return-void

    :cond_52
    move-object v2, p0

    const p0, 0x68b4b977

    invoke-virtual {v3, p0}, Lvt9;->W(I)V

    invoke-virtual {v3, v6}, Lvt9;->p(Z)V

    sget-object p0, Lj41;->b:Lhp7;

    invoke-virtual {v3, p0}, Lvt9;->j(Lg7h;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/Context;

    invoke-virtual {v3, p0}, Lvt9;->f(Ljava/lang/Object;)Z

    move-result p1

    invoke-virtual {v3}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v1

    if-nez p1, :cond_72

    sget-object p1, Lhh5;->a:Lzpa;

    if-ne v1, p1, :cond_82

    :cond_72
    move-object p1, p0

    :goto_73
    instance-of v1, p1, Landroid/content/ContextWrapper;

    if-eqz v1, :cond_eb

    instance-of v1, p1, Lhjf;

    if-eqz v1, :cond_e4

    check-cast p1, Lhjf;

    iget-object v1, p1, Lhjf;->b:Lsof;

    invoke-virtual {v3, v1}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_82
    check-cast v1, Lsof;

    iget-object p0, v1, Lsof;->e:Lnak;

    invoke-static {p0, v3}, Ldyg;->h(Llak;Lih5;)Lafe;

    move-result-object p0

    invoke-interface {p0}, Liak;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Loof;

    iget-object p1, p1, Loof;->a:Lnof;

    invoke-virtual {v0, p1}, Lhp7;->a(Ljava/lang/Object;)Lk7h;

    move-result-object p1

    invoke-interface {p0}, Liak;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Loof;

    iget-boolean v0, v0, Loof;->b:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sget-object v1, Lrof;->b:Lhp7;

    invoke-virtual {v1, v0}, Lhp7;->a(Ljava/lang/Object;)Lk7h;

    move-result-object v0

    invoke-interface {p0}, Liak;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Loof;

    iget-boolean v1, v1, Loof;->c:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    sget-object v4, Lrof;->c:Lhp7;

    invoke-virtual {v4, v1}, Lhp7;->a(Ljava/lang/Object;)Lk7h;

    move-result-object v1

    sget-object v4, Lbpf;->a:Lhp7;

    invoke-interface {p0}, Liak;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Loof;

    iget-boolean v5, v5, Loof;->d:Z

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    invoke-virtual {v4, v5}, Lhp7;->a(Ljava/lang/Object;)Lk7h;

    move-result-object v4

    filled-new-array {p1, v0, v1, v4}, [Lk7h;

    move-result-object p1

    new-instance v0, Lhda;

    const/16 v1, 0x15

    invoke-direct {v0, v2, p0, v1}, Lhda;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    const p0, -0x60d5675

    invoke-static {p0, v0, v3}, Lgyg;->P(ILbr9;Lih5;)Lue5;

    move-result-object p0

    const/16 v0, 0x30

    invoke-static {p1, p0, v3, v0}, Lkfo;->d([Lk7h;Lkotlin/jvm/functions/Function2;Lih5;I)V

    goto :goto_f8

    :cond_e4
    check-cast p1, Landroid/content/ContextWrapper;

    invoke-virtual {p1}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object p1

    goto :goto_73

    :cond_eb
    invoke-static {p0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    const-string p0, ""

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-void

    :cond_f4
    move-object v2, p0

    invoke-virtual {v3}, Lvt9;->Q()V

    :goto_f8
    invoke-virtual {v3}, Lvt9;->r()Lznh;

    move-result-object p0

    if-eqz p0, :cond_107

    new-instance p1, Lbg5;

    const/16 v0, 0xb

    invoke-direct {p1, v2, p2, v0}, Lbg5;-><init>(Lue5;IB)V

    iput-object p1, p0, Lznh;->d:Lkotlin/jvm/functions/Function2;

    :cond_107
    return-void
.end method

.method public static final b(Lnof;ZLue5;Lih5;I)V
    .registers 41

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v3, p4

    move-object/from16 v4, p3

    check-cast v4, Lvt9;

    const v5, -0x52dc2173

    invoke-virtual {v4, v5}, Lvt9;->Y(I)Lvt9;

    if-nez v0, :cond_16

    const/4 v5, -0x1

    goto :goto_1a

    :cond_16
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v5

    :goto_1a
    invoke-virtual {v4, v5}, Lvt9;->d(I)Z

    move-result v5

    if-eqz v5, :cond_22

    const/4 v5, 0x4

    goto :goto_23

    :cond_22
    const/4 v5, 0x2

    :goto_23
    or-int/2addr v5, v3

    invoke-virtual {v4, v1}, Lvt9;->g(Z)Z

    move-result v6

    const/16 v7, 0x20

    if-eqz v6, :cond_2e

    move v6, v7

    goto :goto_30

    :cond_2e
    const/16 v6, 0x10

    :goto_30
    or-int/2addr v5, v6

    invoke-virtual {v4, v2}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3a

    const/16 v6, 0x800

    goto :goto_3c

    :cond_3a
    const/16 v6, 0x400

    :goto_3c
    or-int/2addr v5, v6

    and-int/lit16 v6, v5, 0x493

    const/16 v8, 0x492

    const/4 v10, 0x1

    if-eq v6, v8, :cond_46

    move v6, v10

    goto :goto_47

    :cond_46
    const/4 v6, 0x0

    :goto_47
    and-int/lit8 v8, v5, 0x1

    invoke-virtual {v4, v8, v6}, Lvt9;->N(IZ)Z

    move-result v6

    if-eqz v6, :cond_1c1

    invoke-virtual {v4}, Lvt9;->S()V

    and-int/lit8 v6, v3, 0x1

    if-eqz v6, :cond_5f

    invoke-virtual {v4}, Lvt9;->x()Z

    move-result v6

    if-nez v6, :cond_5f

    invoke-virtual {v4}, Lvt9;->Q()V

    :cond_5f
    invoke-virtual {v4}, Lvt9;->q()V

    new-instance v6, Lakf;

    if-eqz v1, :cond_8f

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v8

    packed-switch v8, :pswitch_data_1d2

    invoke-static {}, Lh9o;->p()V

    return-void

    :pswitch_71
    sget-object v8, Ljen;->a:Lkk3;

    goto :goto_b7

    :pswitch_74
    sget-object v8, Lb4a;->a:Lkk3;

    goto :goto_b7

    :pswitch_77
    sget-object v8, La4a;->a:Lkk3;

    goto :goto_b7

    :pswitch_7a
    sget-object v8, Lfqh;->a:Lkk3;

    goto :goto_b7

    :pswitch_7d
    sget-object v8, Llk3;->a:Lkk3;

    goto :goto_b7

    :pswitch_80
    sget-object v8, Lvwb;->a:Lkk3;

    goto :goto_b7

    :pswitch_83
    sget-object v8, Lfdl;->a:Lkk3;

    goto :goto_b7

    :pswitch_86
    sget-object v8, Lgbh;->a:Lkk3;

    goto :goto_b7

    :pswitch_89
    sget-object v8, Lasf;->a:Lkk3;

    goto :goto_b7

    :pswitch_8c
    sget-object v8, Liff;->a:Lkk3;

    goto :goto_b7

    :cond_8f
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v8

    packed-switch v8, :pswitch_data_1ea

    invoke-static {}, Lh9o;->p()V

    return-void

    :pswitch_9a
    sget-object v8, Ljen;->b:Lkk3;

    goto :goto_b7

    :pswitch_9d
    sget-object v8, Lb4a;->b:Lkk3;

    goto :goto_b7

    :pswitch_a0
    sget-object v8, La4a;->b:Lkk3;

    goto :goto_b7

    :pswitch_a3
    sget-object v8, Lfqh;->b:Lkk3;

    goto :goto_b7

    :pswitch_a6
    sget-object v8, Llk3;->b:Lkk3;

    goto :goto_b7

    :pswitch_a9
    sget-object v8, Lvwb;->b:Lkk3;

    goto :goto_b7

    :pswitch_ac
    sget-object v8, Lfdl;->b:Lkk3;

    goto :goto_b7

    :pswitch_af
    sget-object v8, Lgbh;->b:Lkk3;

    goto :goto_b7

    :pswitch_b2
    sget-object v8, Lasf;->b:Lkk3;

    goto :goto_b7

    :pswitch_b5
    sget-object v8, Liff;->b:Lkk3;

    :goto_b7
    if-nez v1, :cond_c0

    sget-object v11, Lv5b;->b:Lhp2;

    sget-object v12, Lct8;->b:Lbt8;

    sget v13, Lds3;->a:I

    goto :goto_c6

    :cond_c0
    sget-object v11, Lv5b;->a:Lhp2;

    sget-object v12, Lct8;->a:Lbt8;

    sget v13, Lds3;->a:I

    :goto_c6
    invoke-direct {v6, v8, v11, v12}, Lakf;-><init>(Ls7;Lt7;Lat8;)V

    sget-object v11, Ltpf;->a:Lhp7;

    invoke-static {v4}, Lw0h;->g(Lih5;)Lm1o;

    move-result-object v11

    iget-object v11, v11, Lm1o;->a:La4o;

    iget v12, v11, La4o;->a:I

    iget v13, v11, La4o;->b:I

    if-ge v13, v12, :cond_d9

    move v14, v10

    goto :goto_da

    :cond_d9
    const/4 v14, 0x0

    :goto_da
    invoke-virtual {v4, v11}, Lvt9;->f(Ljava/lang/Object;)Z

    move-result v11

    invoke-virtual {v4}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v15

    sget-object v9, Lhh5;->a:Lzpa;

    if-nez v11, :cond_e8

    if-ne v15, v9, :cond_110

    :cond_e8
    new-instance v15, Lspf;

    const/16 v11, 0x348

    if-lt v12, v11, :cond_f1

    sget-object v11, Luga;->c:Luga;

    goto :goto_fa

    :cond_f1
    const/16 v11, 0x258

    if-lt v12, v11, :cond_f8

    sget-object v11, Luga;->b:Luga;

    goto :goto_fa

    :cond_f8
    sget-object v11, Luga;->a:Luga;

    :goto_fa
    const/16 v12, 0x384

    if-lt v13, v12, :cond_101

    sget-object v12, Ll2n;->c:Ll2n;

    goto :goto_10a

    :cond_101
    const/16 v12, 0x1e0

    if-lt v13, v12, :cond_108

    sget-object v12, Ll2n;->b:Ll2n;

    goto :goto_10a

    :cond_108
    sget-object v12, Ll2n;->a:Ll2n;

    :goto_10a
    invoke-direct {v15, v11, v12, v14}, Lspf;-><init>(Luga;Ll2n;Z)V

    invoke-virtual {v4, v15}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_110
    check-cast v15, Lspf;

    and-int/lit8 v11, v5, 0x70

    const/16 v12, 0x30

    xor-int/2addr v11, v12

    if-le v11, v7, :cond_11f

    invoke-virtual {v4, v1}, Lvt9;->g(Z)Z

    move-result v11

    if-nez v11, :cond_122

    :cond_11f
    and-int/2addr v5, v12

    if-ne v5, v7, :cond_124

    :cond_122
    move v5, v10

    goto :goto_125

    :cond_124
    const/4 v5, 0x0

    :goto_125
    invoke-virtual {v4}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v7

    if-nez v5, :cond_12d

    if-ne v7, v9, :cond_139

    :cond_12d
    if-nez v1, :cond_133

    sget-object v5, Lrof;->d:Lk5i;

    :goto_131
    move-object v7, v5

    goto :goto_136

    :cond_133
    sget-object v5, Lrof;->e:Lk5i;

    goto :goto_131

    :goto_136
    invoke-virtual {v4, v7}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_139
    check-cast v7, Lk5i;

    sget-object v5, Lnlf;->a:Lhp7;

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v5

    packed-switch v5, :pswitch_data_202

    invoke-static {}, Lh9o;->p()V

    return-void

    :pswitch_148
    move v9, v10

    goto :goto_14b

    :pswitch_14a
    const/4 v9, 0x0

    :goto_14b
    new-instance v16, Lrwj;

    invoke-interface {v8}, Ls7;->j()J

    move-result-wide v17

    if-eqz v9, :cond_158

    sget-object v5, Lbgl;->c:Lbgl;

    :goto_155
    move-object/from16 v33, v5

    goto :goto_15a

    :cond_158
    const/4 v5, 0x0

    goto :goto_155

    :goto_15a
    const/16 v34, 0x0

    const v35, 0xeffe

    const-wide/16 v19, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const-wide/16 v26, 0x0

    const/16 v28, 0x0

    const/16 v29, 0x0

    const/16 v30, 0x0

    const-wide/16 v31, 0x0

    invoke-direct/range {v16 .. v35}, Lrwj;-><init>(JJLki9;Lgi9;Lhi9;Llh9;Ljava/lang/String;JLua3;Lvil;Lawc;JLbgl;Ljaj;I)V

    move-object/from16 v5, v16

    sget-object v8, Lbkf;->a:Lhp7;

    invoke-virtual {v8, v6}, Lhp7;->a(Ljava/lang/Object;)Lk7h;

    move-result-object v6

    sget-object v8, Ltpf;->a:Lhp7;

    invoke-virtual {v8, v15}, Lhp7;->a(Ljava/lang/Object;)Lk7h;

    move-result-object v8

    sget-object v9, Ln5i;->a:Lhp7;

    invoke-virtual {v9, v7}, Lhp7;->a(Ljava/lang/Object;)Lk7h;

    move-result-object v7

    sget-object v9, Lnlf;->a:Lhp7;

    invoke-virtual {v9, v5}, Lhp7;->a(Ljava/lang/Object;)Lk7h;

    move-result-object v5

    sget-object v9, Lbpf;->d:Lhp7;

    sget-object v10, Lbpf;->a:Lhp7;

    invoke-virtual {v4, v10}, Lvt9;->j(Lg7h;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Boolean;

    invoke-virtual {v10}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v10

    if-eqz v10, :cond_1a5

    sget-object v10, Lbpf;->c:Lapf;

    goto :goto_1a7

    :cond_1a5
    sget-object v10, Lbpf;->b:Lapf;

    :goto_1a7
    invoke-virtual {v9, v10}, Lhp7;->a(Ljava/lang/Object;)Lk7h;

    move-result-object v9

    filled-new-array {v6, v8, v7, v5, v9}, [Lk7h;

    move-result-object v5

    new-instance v6, Lbg5;

    const/16 v7, 0x9

    invoke-direct {v6, v2, v7}, Lbg5;-><init>(Lue5;B)V

    const v7, 0x361181cd

    invoke-static {v7, v6, v4}, Lgyg;->P(ILbr9;Lih5;)Lue5;

    move-result-object v6

    invoke-static {v5, v6, v4, v12}, Lkfo;->d([Lk7h;Lkotlin/jvm/functions/Function2;Lih5;I)V

    goto :goto_1c4

    :cond_1c1
    invoke-virtual {v4}, Lvt9;->Q()V

    :goto_1c4
    invoke-virtual {v4}, Lvt9;->r()Lznh;

    move-result-object v4

    if-eqz v4, :cond_1d1

    new-instance v5, Lqof;

    invoke-direct {v5, v0, v1, v2, v3}, Lqof;-><init>(Lnof;ZLue5;I)V

    iput-object v5, v4, Lznh;->d:Lkotlin/jvm/functions/Function2;

    :cond_1d1
    return-void

    :pswitch_data_1d2
    .packed-switch 0x0
        :pswitch_8c
        :pswitch_89
        :pswitch_86
        :pswitch_83
        :pswitch_80
        :pswitch_7d
        :pswitch_7a
        :pswitch_77
        :pswitch_74
        :pswitch_71
    .end packed-switch

    :pswitch_data_1ea
    .packed-switch 0x0
        :pswitch_b5
        :pswitch_b2
        :pswitch_af
        :pswitch_ac
        :pswitch_a9
        :pswitch_a6
        :pswitch_a3
        :pswitch_a0
        :pswitch_9d
        :pswitch_9a
    .end packed-switch

    :pswitch_data_202
    .packed-switch 0x0
        :pswitch_14a
        :pswitch_14a
        :pswitch_14a
        :pswitch_14a
        :pswitch_148
        :pswitch_14a
        :pswitch_14a
        :pswitch_14a
        :pswitch_14a
        :pswitch_14a
    .end packed-switch
.end method

.method public static final c(Lnof;ZLue5;Lih5;II)V
    .registers 15

    check-cast p3, Lvt9;

    const v0, -0x6a9a0297

    invoke-virtual {p3, v0}, Lvt9;->Y(I)Lvt9;

    and-int/lit8 v0, p4, 0x6

    if-nez v0, :cond_1f

    if-nez p0, :cond_10

    const/4 v0, -0x1

    goto :goto_14

    :cond_10
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    :goto_14
    invoke-virtual {p3, v0}, Lvt9;->d(I)Z

    move-result v0

    if-eqz v0, :cond_1c

    const/4 v0, 0x4

    goto :goto_1d

    :cond_1c
    const/4 v0, 0x2

    :goto_1d
    or-int/2addr v0, p4

    goto :goto_20

    :cond_1f
    move v0, p4

    :goto_20
    and-int/lit8 v1, p4, 0x30

    if-nez v1, :cond_34

    and-int/lit8 v1, p5, 0x2

    if-nez v1, :cond_31

    invoke-virtual {p3, p1}, Lvt9;->g(Z)Z

    move-result v1

    if-eqz v1, :cond_31

    const/16 v1, 0x20

    goto :goto_33

    :cond_31
    const/16 v1, 0x10

    :goto_33
    or-int/2addr v0, v1

    :cond_34
    and-int/lit16 v1, v0, 0x93

    const/16 v2, 0x92

    const/4 v3, 0x1

    if-eq v1, v2, :cond_3d

    move v1, v3

    goto :goto_3e

    :cond_3d
    const/4 v1, 0x0

    :goto_3e
    and-int/2addr v0, v3

    invoke-virtual {p3, v0, v1}, Lvt9;->N(IZ)Z

    move-result v0

    if-eqz v0, :cond_8e

    invoke-virtual {p3}, Lvt9;->S()V

    and-int/lit8 v0, p4, 0x1

    sget-object v1, Lrof;->b:Lhp7;

    if-eqz v0, :cond_58

    invoke-virtual {p3}, Lvt9;->x()Z

    move-result v0

    if-nez v0, :cond_58

    invoke-virtual {p3}, Lvt9;->Q()V

    goto :goto_66

    :cond_58
    and-int/lit8 v0, p5, 0x2

    if-eqz v0, :cond_66

    invoke-virtual {p3, v1}, Lvt9;->j(Lg7h;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    :cond_66
    :goto_66
    invoke-virtual {p3}, Lvt9;->q()V

    sget-object v0, Lrof;->a:Lhp7;

    invoke-virtual {v0, p0}, Lhp7;->a(Ljava/lang/Object;)Lk7h;

    move-result-object v0

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v1, v2}, Lhp7;->a(Ljava/lang/Object;)Lk7h;

    move-result-object v1

    filled-new-array {v0, v1}, [Lk7h;

    move-result-object v0

    new-instance v1, Lqof;

    invoke-direct {v1, p0, p1, p2}, Lqof;-><init>(Lnof;ZLue5;)V

    const v2, 0x2cae0a9

    invoke-static {v2, v1, p3}, Lgyg;->P(ILbr9;Lih5;)Lue5;

    move-result-object v1

    const/16 v2, 0x30

    invoke-static {v0, v1, p3, v2}, Lkfo;->d([Lk7h;Lkotlin/jvm/functions/Function2;Lih5;I)V

    :goto_8c
    move v5, p1

    goto :goto_92

    :cond_8e
    invoke-virtual {p3}, Lvt9;->Q()V

    goto :goto_8c

    :goto_92
    invoke-virtual {p3}, Lvt9;->r()Lznh;

    move-result-object p1

    if-eqz p1, :cond_a3

    new-instance v3, Lpy5;

    move-object v4, p0

    move-object v6, p2

    move v7, p4

    move v8, p5

    invoke-direct/range {v3 .. v8}, Lpy5;-><init>(Lnof;ZLue5;II)V

    iput-object v3, p1, Lznh;->d:Lkotlin/jvm/functions/Function2;

    :cond_a3
    return-void
.end method
