.class public Lj5m;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Lkze;

.field public final e:Lumi;

.field public final f:S

.field public final g:Lq65;

.field public final h:Ljava/util/ArrayList;

.field public final i:Loji;

.field public j:Ljava/lang/Runnable;

.field public final synthetic k:Lvz5;


# direct methods
.method public constructor <init>(Lvz5;ILjava/lang/String;Ljava/lang/String;Loji;IJ)V
    .registers 12

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lj5m;->k:Lvz5;

    new-instance v0, Lb5m;

    invoke-direct {v0, p6}, Lb5m;-><init>(I)V

    iget-object p1, p1, Lvz5;->h:Ljava/lang/Object;

    check-cast p1, Lumi;

    new-instance p6, Lld9;

    const/16 v1, 0x10

    invoke-direct {p6, p0, v1}, Lld9;-><init>(Ljava/lang/Object;B)V

    new-instance v1, Lq65;

    const/4 v2, 0x4

    invoke-direct {v1, p6, v2}, Lq65;-><init>(Ljava/lang/Object;B)V

    iput-object v1, p0, Lj5m;->g:Lq65;

    new-instance p6, Ljava/util/ArrayList;

    invoke-direct {p6}, Ljava/util/ArrayList;-><init>()V

    iput-object p6, p0, Lj5m;->h:Ljava/util/ArrayList;

    iput p2, p0, Lj5m;->a:I

    iput-object p3, p0, Lj5m;->b:Ljava/lang/String;

    iput-object p4, p0, Lj5m;->c:Ljava/lang/String;

    iput-object p1, p0, Lj5m;->e:Lumi;

    long-to-int p1, p7

    iput-short p1, p0, Lj5m;->f:S

    new-instance p1, Lkze;

    invoke-direct {p1, v0}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lj5m;->d:Lkze;

    const/4 p1, -0x1

    if-eq p2, p1, :cond_3f

    invoke-virtual {p0, v0}, Lj5m;->b(Ld5m;)V

    :cond_3f
    new-instance p1, Lv6a;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lv6a;-><init>(Lj5m;B)V

    invoke-virtual {p6, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iput-object p5, p0, Lj5m;->i:Loji;

    new-instance p1, Lv6a;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p2}, Lv6a;-><init>(Lj5m;B)V

    invoke-virtual {p6, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Runnable;)Lhh4;
    .registers 6

    iput-object p1, p0, Lj5m;->j:Ljava/lang/Runnable;

    iget-object p1, p0, Lj5m;->k:Lvz5;

    iget-object p1, p1, Lvz5;->g:Ljava/lang/Object;

    check-cast p1, Leme;

    iget-object p1, p1, Leme;->a:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-wide v0, p1, Lcom/opera/android/browser/chromium/ChromiumContent;->n:J

    const-wide/16 v2, 0x0

    cmp-long p1, v0, v2

    if-eqz p1, :cond_19

    iget p1, p0, Lj5m;->a:I

    invoke-static {v0, v1, p1}, LJ/N;->M1mYb9xT(JI)V

    :cond_19
    new-instance p1, Lcrk;

    const/16 v0, 0x16

    invoke-direct {p1, p0, v0}, Lcrk;-><init>(Ljava/lang/Object;B)V

    return-object p1
.end method

.method public final b(Ld5m;)V
    .registers 10

    iget v0, p0, Lj5m;->a:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_6

    return-void

    :cond_6
    iget-object v0, p1, Ld5m;->a:Lc5m;

    iget-object p0, p0, Lj5m;->h:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :cond_f
    :goto_f
    :pswitch_f
    if-ge v2, v1, :cond_af

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lv6a;

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v4

    if-eqz v4, :cond_76

    const/4 v5, 0x1

    if-ne v4, v5, :cond_f

    move-object v4, p1

    check-cast v4, Lb5m;

    iget-byte v6, v3, Lv6a;->a:B

    packed-switch v6, :pswitch_data_b0

    iget-byte v4, v4, Lb5m;->b:B

    const/4 v5, 0x5

    if-ne v4, v5, :cond_f

    iget-object v3, v3, Lv6a;->b:Lj5m;

    iget-object v4, v3, Lj5m;->k:Lvz5;

    iget-object v4, v4, Lvz5;->e:Ljava/lang/Object;

    check-cast v4, Loji;

    iget-object v4, v4, Loji;->a:Ljava/lang/Object;

    check-cast v4, Lvz5;

    iget-object v4, v4, Lvz5;->i:Ljava/lang/Object;

    check-cast v4, Ld7h;

    if-eqz v4, :cond_f

    iget-object v5, v3, Lj5m;->b:Ljava/lang/String;

    iget-object v3, v3, Lj5m;->c:Ljava/lang/String;

    iget-object v6, v4, Ld7h;->c:Ljava/lang/Object;

    check-cast v6, Lv3m;

    invoke-virtual {v6, v5}, Lv3m;->b(Ljava/lang/String;)Lszb;

    move-result-object v5

    invoke-virtual {v6, v3}, Lv3m;->b(Ljava/lang/String;)Lszb;

    move-result-object v3

    if-eqz v5, :cond_f

    if-eqz v3, :cond_f

    sget-object v6, Lps0;->b:Lps0;

    invoke-virtual {v4, v5, v3, v6}, Ld7h;->d(Lszb;Lszb;Lps0;)V

    goto :goto_f

    :pswitch_5b
    iget-byte v4, v4, Lb5m;->b:B

    if-eqz v4, :cond_67

    if-eq v4, v5, :cond_67

    const/4 v5, 0x3

    if-eq v4, v5, :cond_67

    const/4 v5, 0x4

    if-ne v4, v5, :cond_f

    :cond_67
    iget-object v3, v3, Lv6a;->b:Lj5m;

    iget-object v4, v3, Lj5m;->g:Lq65;

    iget-object v5, v3, Lj5m;->e:Lumi;

    iget-short v3, v3, Lj5m;->f:S

    int-to-long v6, v3

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v4, v5, v6, v7, v3}, Ln1;->B0(Ltcl;JLjava/util/concurrent/TimeUnit;)V

    goto :goto_f

    :cond_76
    move-object v4, p1

    check-cast v4, La5m;

    iget-byte v5, v3, Lv6a;->a:B

    packed-switch v5, :pswitch_data_b6

    iget-object v3, v3, Lv6a;->b:Lj5m;

    iget-object v5, v3, Lj5m;->i:Loji;

    iget-byte v4, v4, La5m;->b:B

    iget-object v5, v5, Loji;->a:Ljava/lang/Object;

    check-cast v5, Lvz5;

    iget-object v5, v5, Lvz5;->i:Ljava/lang/Object;

    check-cast v5, Ld7h;

    if-eqz v5, :cond_f

    iget-object v6, v3, Lj5m;->b:Ljava/lang/String;

    iget-object v3, v3, Lj5m;->c:Ljava/lang/String;

    iget-object v7, v5, Ld7h;->c:Ljava/lang/Object;

    check-cast v7, Lv3m;

    invoke-virtual {v7, v6}, Lv3m;->b(Ljava/lang/String;)Lszb;

    move-result-object v6

    invoke-virtual {v7, v3}, Lv3m;->b(Ljava/lang/String;)Lszb;

    move-result-object v3

    if-eqz v6, :cond_f

    if-eqz v3, :cond_f

    const/4 v7, 0x6

    if-eq v4, v7, :cond_a8

    sget-object v4, Lps0;->k:Lps0;

    goto :goto_aa

    :cond_a8
    sget-object v4, Lps0;->e:Lps0;

    :goto_aa
    invoke-virtual {v5, v6, v3, v4}, Ld7h;->d(Lszb;Lszb;Lps0;)V

    goto/16 :goto_f

    :cond_af
    return-void

    :pswitch_data_b0
    .packed-switch 0x0
        :pswitch_5b
    .end packed-switch

    :pswitch_data_b6
    .packed-switch 0x0
        :pswitch_f
    .end packed-switch
.end method

.method public c()V
    .registers 5

    iget-object v0, p0, Lj5m;->k:Lvz5;

    iget v1, v0, Lvz5;->b:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_25

    iget-object p0, v0, Lvz5;->f:Ljava/lang/Object;

    check-cast p0, Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lj5m;

    iget-object v3, v1, Lj5m;->j:Ljava/lang/Runnable;

    if-eqz v3, :cond_1b

    invoke-interface {v3}, Ljava/lang/Runnable;->run()V

    const/4 v3, 0x0

    iput-object v3, v1, Lj5m;->j:Ljava/lang/Runnable;

    :cond_1b
    iget-object v1, v0, Lvz5;->d:Ljava/lang/Object;

    check-cast v1, Li5m;

    invoke-virtual {p0, v1}, Lekc;->r(Ljava/lang/Object;)V

    iput v2, v0, Lvz5;->b:I

    return-void

    :cond_25
    new-instance v1, Lb5m;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lb5m;-><init>(I)V

    invoke-virtual {p0, v1}, Lj5m;->d(Ld5m;)V

    iget-object v0, v0, Lvz5;->g:Ljava/lang/Object;

    check-cast v0, Leme;

    iget-object v0, v0, Leme;->a:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-wide v0, v0, Lcom/opera/android/browser/chromium/ChromiumContent;->n:J

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-nez v2, :cond_3f

    return-void

    :cond_3f
    iget p0, p0, Lj5m;->a:I

    invoke-static {v0, v1, p0}, LJ/N;->MK6hIkOd(JI)V

    return-void
.end method

.method public final d(Ld5m;)V
    .registers 6

    iget v0, p0, Lj5m;->a:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_6

    return-void

    :cond_6
    iget-object v2, p0, Lj5m;->g:Lq65;

    invoke-virtual {v2}, Ln1;->S()V

    iget-object v2, p0, Lj5m;->d:Lkze;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p1, v3}, Ld5m;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_18

    return-void

    :cond_18
    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ld5m;

    if-ne v0, v1, :cond_27

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ld5m;

    goto :goto_37

    :cond_27
    instance-of v0, p1, La5m;

    if-eqz v0, :cond_37

    invoke-virtual {v3}, Ld5m;->a()Z

    move-result v0

    if-eqz v0, :cond_37

    new-instance p1, Lb5m;

    const/4 v0, 0x2

    invoke-direct {p1, v0}, Lb5m;-><init>(I)V

    :cond_37
    :goto_37
    invoke-virtual {v2, p1}, Lekc;->r(Ljava/lang/Object;)V

    invoke-virtual {p0, p1}, Lj5m;->b(Ld5m;)V

    return-void
.end method
