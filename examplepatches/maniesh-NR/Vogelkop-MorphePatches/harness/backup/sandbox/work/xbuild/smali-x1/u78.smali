.class public final Lu78;
.super Ll7n;
.source "SourceFile"


# static fields
.field public static final o:Ln78;


# instance fields
.field public final b:Lgq6;

.field public final c:Lbpd;

.field public final d:Lne5;

.field public final e:Ljq6;

.field public final f:Lqe6;

.field public final g:Liq6;

.field public final h:Lnak;

.field public final i:Lnak;

.field public final j:Lnak;

.field public final k:Lnak;

.field public final l:Lnak;

.field public final m:Lplh;

.field public final n:Lrlh;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ln78;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lu78;->o:Ln78;

    return-void
.end method

.method public constructor <init>(Lgq6;Lbpd;Lne5;Ljq6;Lqe6;Liq6;)V
    .registers 27

    move-object/from16 v0, p0

    invoke-direct {v0}, Ll7n;-><init>()V

    move-object/from16 v1, p1

    iput-object v1, v0, Lu78;->b:Lgq6;

    move-object/from16 v2, p2

    iput-object v2, v0, Lu78;->c:Lbpd;

    move-object/from16 v2, p3

    iput-object v2, v0, Lu78;->d:Lne5;

    move-object/from16 v2, p4

    iput-object v2, v0, Lu78;->e:Ljq6;

    move-object/from16 v2, p5

    iput-object v2, v0, Lu78;->f:Lqe6;

    move-object/from16 v2, p6

    iput-object v2, v0, Lu78;->g:Liq6;

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-static {v2}, Lz4o;->f(Ljava/lang/Object;)Lnak;

    move-result-object v3

    iput-object v3, v0, Lu78;->h:Lnak;

    new-instance v4, Lh78;

    invoke-direct {v4}, Lh78;-><init>()V

    invoke-static {v4}, Lz4o;->f(Ljava/lang/Object;)Lnak;

    move-result-object v4

    iput-object v4, v0, Lu78;->i:Lnak;

    invoke-static {v2}, Lz4o;->f(Ljava/lang/Object;)Lnak;

    move-result-object v2

    iput-object v2, v0, Lu78;->j:Lnak;

    sget-object v5, Lx88;->a:Lx88;

    invoke-static {v5}, Lz4o;->f(Ljava/lang/Object;)Lnak;

    move-result-object v5

    iput-object v5, v0, Lu78;->k:Lnak;

    const/4 v6, 0x0

    invoke-static {v6}, Lz4o;->f(Ljava/lang/Object;)Lnak;

    move-result-object v7

    iput-object v7, v0, Lu78;->l:Lnak;

    invoke-virtual {v1}, Lgq6;->a()Lf99;

    move-result-object v1

    new-instance v8, Lzp6;

    const/4 v9, 0x7

    invoke-direct {v8, v9, v6, v0}, Lzp6;-><init>(BLmt5;Ljava/lang/Object;)V

    invoke-static {v1, v8}, Lma9;->b(Lf99;Lcr9;)Lbs4;

    move-result-object v1

    invoke-static {v0}, Lp7n;->a(Ll7n;)Lf65;

    move-result-object v8

    sget-object v9, Laej;->b:Lauj;

    const/4 v10, 0x1

    invoke-static {v1, v8, v9, v10}, La26;->l0(Lf99;Lnx5;Lbej;I)Lplh;

    move-result-object v1

    iput-object v1, v0, Lu78;->m:Lplh;

    new-instance v8, Lkm4;

    const/4 v9, 0x3

    const/4 v11, 0x5

    invoke-direct {v8, v9, v6, v11}, Lkm4;-><init>(ILmt5;B)V

    new-instance v6, Lya9;

    const/4 v12, 0x0

    invoke-direct {v6, v7, v1, v8, v12}, Lya9;-><init>(Lf99;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v13, Ls78;

    const-string v18, "resolveUiState(Lcom/opera/android/esim/ui/EsimActivityToolbarState;ZLcom/opera/android/esim/ui/EsimErrorType;ZLcom/opera/android/esim/ui/OnboardingType;)Lcom/opera/android/esim/ui/EsimActivityUiState;"

    const/16 v19, 0x4

    const/4 v14, 0x6

    sget-object v15, Lu78;->o:Ln78;

    const-class v16, Ln78;

    const-string v17, "resolveUiState"

    invoke-direct/range {v13 .. v19}, Lkr;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    new-array v1, v11, [Lf99;

    aput-object v4, v1, v12

    aput-object v2, v1, v10

    const/4 v2, 0x2

    aput-object v5, v1, v2

    aput-object v3, v1, v9

    const/4 v2, 0x4

    aput-object v6, v1, v2

    new-instance v2, Lcw;

    const/16 v3, 0x9

    invoke-direct {v2, v1, v13, v3}, Lcw;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v0}, Lp7n;->a(Ll7n;)Lf65;

    move-result-object v1

    new-instance v3, Li78;

    new-instance v4, Lh78;

    invoke-direct {v4}, Lh78;-><init>()V

    sget-object v5, Ll78;->a:Ll78;

    invoke-direct {v3, v4, v5, v10}, Li78;-><init>(Lh78;Lm78;Z)V

    sget-object v4, Laej;->a:Lftj;

    invoke-static {v2, v1, v4, v3}, La26;->o0(Lf99;Lnx5;Lbej;Ljava/lang/Object;)Lrlh;

    move-result-object v1

    iput-object v1, v0, Lu78;->n:Lrlh;

    return-void
.end method


# virtual methods
.method public final f(Lnt5;)Ljava/lang/Object;
    .registers 9

    instance-of v0, p1, Lo78;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lo78;

    iget v1, v0, Lo78;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lo78;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lo78;

    invoke-direct {v0, p0, p1}, Lo78;-><init>(Lu78;Lnt5;)V

    :goto_18
    iget-object p1, v0, Lo78;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lo78;->v:I

    const/4 v3, 0x0

    const/4 v4, 0x3

    const/4 v5, 0x2

    const/4 v6, 0x1

    if-eqz v2, :cond_3c

    if-eq v2, v6, :cond_38

    if-eq v2, v5, :cond_34

    if-ne v2, v4, :cond_2e

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_77

    :cond_2e
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_34
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_5e

    :cond_38
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_49

    :cond_3c
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iput v6, v0, Lo78;->v:I

    iget-object p1, p0, Lu78;->f:Lqe6;

    invoke-virtual {p1, v0}, Lqe6;->O(Lnt5;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, v1, :cond_76

    :goto_49
    sget-object v2, Lea8;->b:Lea8;

    if-eq p1, v2, :cond_50

    sget-object p0, Lo88;->a:Lo88;

    return-object p0

    :cond_50
    iget-object p1, p0, Lu78;->g:Liq6;

    iget-object p1, p1, Liq6;->a:Lip6;

    iget-object p1, p1, Lip6;->d:Lf99;

    iput v5, v0, Lo78;->v:I

    invoke-static {p1, v0}, Lcs5;->E(Lf99;Lmt5;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, v1, :cond_76

    :goto_5e
    check-cast p1, Lga8;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_6e

    if-eq p1, v6, :cond_92

    if-eq p1, v5, :cond_6e

    invoke-static {}, Lh9o;->p()V

    return-object v3

    :cond_6e
    iput v4, v0, Lo78;->v:I

    invoke-virtual {p0, v0}, Lu78;->g(Lnt5;)Ljava/lang/Enum;

    move-result-object p1

    if-ne p1, v1, :cond_77

    :cond_76
    return-object v1

    :cond_77
    :goto_77
    check-cast p1, Ldef;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    if-eqz p0, :cond_92

    if-eq p0, v6, :cond_8f

    if-eq p0, v5, :cond_8c

    if-ne p0, v4, :cond_88

    sget-object p0, Lq88;->a:Lq88;

    return-object p0

    :cond_88
    invoke-static {}, Lh9o;->p()V

    return-object v3

    :cond_8c
    sget-object p0, Ln88;->a:Ln88;

    return-object p0

    :cond_8f
    sget-object p0, Lp88;->a:Lp88;

    return-object p0

    :cond_92
    sget-object p0, Lr88;->a:Lr88;

    return-object p0
.end method

.method public final g(Lnt5;)Ljava/lang/Enum;
    .registers 9

    instance-of v0, p1, Lp78;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lp78;

    iget v1, v0, Lp78;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lp78;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lp78;

    invoke-direct {v0, p0, p1}, Lp78;-><init>(Lu78;Lnt5;)V

    :goto_18
    iget-object p1, v0, Lp78;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lp78;->v:I

    const/4 v3, 0x0

    const/4 v4, 0x2

    const/4 v5, 0x1

    if-eqz v2, :cond_35

    if-eq v2, v5, :cond_31

    if-ne v2, v4, :cond_2b

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_62

    :cond_2b
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_31
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_42

    :cond_35
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iput v5, v0, Lp78;->v:I

    iget-object p1, p0, Lu78;->m:Lplh;

    invoke-static {p1, v0}, Lcs5;->E(Lf99;Lmt5;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, v1, :cond_61

    :goto_42
    check-cast p1, Ldef;

    sget-object v2, Ldef;->b:Ldef;

    if-eq p1, v2, :cond_49

    return-object p1

    :cond_49
    sget-object p1, Lpn7;->b:Lon7;

    const/16 p1, 0x64

    sget-object v2, Lun7;->d:Lun7;

    invoke-static {p1, v2}, Lcs5;->x0(ILun7;)J

    move-result-wide v5

    new-instance p1, Lq78;

    const/4 v2, 0x0

    invoke-direct {p1, p0, v3, v2}, Lq78;-><init>(Lu78;Lmt5;B)V

    iput v4, v0, Lp78;->v:I

    invoke-static {v5, v6, p1, v0}, Luyg;->x(JLkotlin/jvm/functions/Function2;Lnt5;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v1, :cond_62

    :cond_61
    return-object v1

    :cond_62
    :goto_62
    check-cast p1, Ldef;

    if-nez p1, :cond_69

    sget-object p0, Ldef;->b:Ldef;

    return-object p0

    :cond_69
    return-object p1
.end method

.method public final h(Ls88;Lnt5;)Ljava/lang/Object;
    .registers 7

    instance-of v0, p2, Lr78;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lr78;

    iget v1, v0, Lr78;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lr78;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lr78;

    invoke-direct {v0, p0, p2}, Lr78;-><init>(Lu78;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lr78;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lr78;->v:I

    const/4 v3, 0x1

    if-eqz v2, :cond_2e

    if-ne v2, v3, :cond_27

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_3c

    :cond_27
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_2e
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    if-nez p1, :cond_3f

    iput v3, v0, Lr78;->v:I

    invoke-virtual {p0, v0}, Lu78;->f(Lnt5;)Ljava/lang/Object;

    move-result-object p2

    if-ne p2, v1, :cond_3c

    return-object v1

    :cond_3c
    :goto_3c
    move-object p1, p2

    check-cast p1, Ls88;

    :cond_3f
    iget-object p2, p0, Lu78;->l:Lnak;

    invoke-virtual {p2}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Ls88;

    invoke-virtual {p2, v0, p1}, Lnak;->h(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_3f

    return-object p1
.end method

.method public final i(Z)V
    .registers 5

    :cond_0
    iget-object v0, p0, Lu78;->j:Lnak;

    invoke-virtual {v0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lnak;->h(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void
.end method
