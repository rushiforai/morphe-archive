.class public final synthetic Lomj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    .line 8
    iput-byte p1, p0, Lomj;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ll5b;)V
    .registers 2

    const/16 p1, 0xa

    iput-byte p1, p0, Lomj;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 11

    iget-byte p0, p0, Lomj;->a:B

    const/4 v0, 0x0

    const/4 v1, -0x1

    const/4 v2, 0x1

    const/4 v3, 0x0

    packed-switch p0, :pswitch_data_29c

    check-cast p1, Lwhp;

    check-cast p2, Lwhp;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget p0, p1, Lwhp;->a:I

    iget p1, p2, Lwhp;->a:I

    sub-int/2addr p0, p1

    return p0

    :pswitch_19
    check-cast p1, Ltxo;

    check-cast p2, Ltxo;

    iget-wide v1, p1, Ltxo;->b:J

    iget-wide v3, p2, Ltxo;->b:J

    invoke-static {v1, v2, v3, v4}, Lkotlin/jvm/internal/Intrinsics;->c(JJ)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    if-eqz p0, :cond_2c

    move-object v0, v1

    :cond_2c
    if-eqz v0, :cond_33

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    goto :goto_3b

    :cond_33
    iget-object p0, p1, Ltxo;->a:Ljava/lang/String;

    iget-object p1, p2, Ltxo;->a:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result p0

    :goto_3b
    return p0

    :pswitch_3c
    check-cast p1, Lvho;

    check-cast p2, Lvho;

    invoke-virtual {p2}, Lvho;->a()Llho;

    move-result-object p0

    iget-wide v0, p0, Llho;->h:D

    invoke-virtual {p1}, Lvho;->a()Llho;

    move-result-object p0

    iget-wide p0, p0, Llho;->h:D

    invoke-static {v0, v1, p0, p1}, Ljava/lang/Double;->compare(DD)I

    move-result p0

    return p0

    :pswitch_51
    check-cast p1, Lvho;

    check-cast p2, Lvho;

    iget-wide p0, p1, Lvho;->c:J

    iget-wide v0, p2, Lvho;->c:J

    sub-long/2addr p0, v0

    long-to-int p0, p0

    return p0

    :pswitch_5c
    check-cast p1, Lgzn;

    check-cast p2, Lgzn;

    iget-wide p0, p1, Lgzn;->b:J

    iget-wide v0, p2, Lgzn;->b:J

    invoke-static {p0, p1, v0, v1}, Ljava/lang/Long;->compare(JJ)I

    move-result p0

    return p0

    :pswitch_69
    check-cast p1, Lhzn;

    check-cast p2, Lhzn;

    iget-object p0, p1, Lhzn;->a:Lizn;

    iget p0, p0, Lizn;->b:I

    iget-object p1, p2, Lhzn;->a:Lizn;

    iget p1, p1, Lizn;->b:I

    invoke-static {p0, p1}, Ljava/lang/Integer;->compare(II)I

    move-result p0

    return p0

    :pswitch_7a
    check-cast p1, Ljnn;

    check-cast p2, Ljnn;

    iget-object p0, p1, Ljnn;->a:Laln;

    invoke-interface {p0}, Laln;->f()I

    move-result p0

    iget-object v0, p2, Ljnn;->a:Laln;

    invoke-interface {v0}, Laln;->f()I

    move-result v0

    if-ne p0, v0, :cond_95

    iget p0, p1, Ljnn;->b:I

    iget p1, p2, Ljnn;->b:I

    invoke-static {p0, p1}, Ljava/lang/Integer;->compare(II)I

    move-result p0

    goto :goto_ad

    :cond_95
    iget-object p0, p1, Ljnn;->a:Laln;

    invoke-interface {p0}, Laln;->f()I

    move-result p0

    invoke-static {p0}, Lvep;->A(I)I

    move-result p0

    iget-object p1, p2, Ljnn;->a:Laln;

    invoke-interface {p1}, Laln;->f()I

    move-result p1

    invoke-static {p1}, Lvep;->A(I)I

    move-result p1

    invoke-static {p0, p1}, Ljava/lang/Integer;->compare(II)I

    move-result p0

    :goto_ad
    return p0

    :pswitch_ae
    check-cast p1, Lhkn;

    check-cast p2, Lhkn;

    iget p0, p1, Lhkn;->b:F

    iget p1, p2, Lhkn;->b:F

    invoke-static {p0, p1}, Ljava/lang/Float;->compare(FF)I

    move-result p0

    return p0

    :pswitch_bb
    check-cast p1, Lxxc;

    check-cast p2, Lxxc;

    iget-object p0, p1, Lxxc;->b:Lrcd;

    iget-object v4, p1, Lxxc;->c:Lrcd;

    if-nez p0, :cond_c9

    if-nez v4, :cond_e1

    move-object p0, v0

    goto :goto_e2

    :cond_c9
    if-eqz v4, :cond_e2

    iget-object v5, p0, Lrcd;->a:Landroid/util/Pair;

    iget-object v5, v5, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    iget-object v6, v4, Lrcd;->a:Landroid/util/Pair;

    iget-object v6, v6, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-le v5, v6, :cond_e2

    :cond_e1
    move-object p0, v4

    :cond_e2
    :goto_e2
    iget-object v5, p2, Lxxc;->b:Lrcd;

    iget-object v6, p2, Lxxc;->c:Lrcd;

    if-nez v5, :cond_eb

    if-nez v6, :cond_105

    goto :goto_106

    :cond_eb
    if-eqz v6, :cond_103

    iget-object v0, v5, Lrcd;->a:Landroid/util/Pair;

    iget-object v0, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iget-object v7, v6, Lrcd;->a:Landroid/util/Pair;

    iget-object v7, v7, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    if-gt v0, v7, :cond_105

    :cond_103
    move-object v0, v5

    goto :goto_106

    :cond_105
    move-object v0, v6

    :goto_106
    invoke-static {p0, v0}, Lmfh;->l(Lrcd;Lrcd;)I

    move-result p0

    if-nez p0, :cond_147

    iget-object p0, p1, Lxxc;->b:Lrcd;

    iget-object v0, p2, Lxxc;->b:Lrcd;

    invoke-static {p0, v0}, Lmfh;->l(Lrcd;Lrcd;)I

    move-result p0

    if-nez p0, :cond_147

    invoke-static {v4, v6}, Lmfh;->l(Lrcd;Lrcd;)I

    move-result p0

    if-nez p0, :cond_147

    invoke-virtual {p1}, Lxxc;->f()Lfdn;

    move-result-object p0

    invoke-virtual {p2}, Lxxc;->f()Lfdn;

    move-result-object v0

    invoke-virtual {p0}, Lfdn;->b()Z

    move-result v4

    invoke-virtual {v0}, Lfdn;->b()Z

    move-result v0

    if-ne v4, v0, :cond_130

    move v1, v3

    goto :goto_137

    :cond_130
    invoke-virtual {p0}, Lfdn;->b()Z

    move-result p0

    if-nez p0, :cond_137

    move v1, v2

    :cond_137
    :goto_137
    if-eqz v1, :cond_13b

    move p0, v1

    goto :goto_147

    :cond_13b
    invoke-virtual {p1}, Lxxc;->e()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2}, Lxxc;->e()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result p0

    :cond_147
    :goto_147
    return p0

    :pswitch_148
    check-cast p1, Lfdn;

    check-cast p2, Lfdn;

    iget-object p0, p1, Lfdn;->c:Ljava/lang/String;

    iget-object p1, p2, Lfdn;->c:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result p0

    return p0

    :pswitch_155
    check-cast p1, Lyl2;

    check-cast p2, Lyl2;

    invoke-interface {p2}, Lyl2;->f()F

    move-result p0

    invoke-interface {p1}, Lyl2;->f()F

    move-result v0

    cmpl-float p0, p0, v0

    if-lez p0, :cond_167

    move v1, v2

    goto :goto_174

    :cond_167
    invoke-interface {p2}, Lyl2;->f()F

    move-result p0

    invoke-interface {p1}, Lyl2;->f()F

    move-result p1

    cmpg-float p0, p0, p1

    if-ltz p0, :cond_174

    move v1, v3

    :cond_174
    :goto_174
    return v1

    :pswitch_175
    check-cast p1, Ly3m;

    check-cast p2, Ly3m;

    iget-object p0, p1, Ly3m;->b:Ljava/lang/String;

    iget-object p1, p2, Ly3m;->b:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result p0

    return p0

    :pswitch_182
    check-cast p1, Lr3m;

    check-cast p2, Lr3m;

    iget-object p0, p2, Lr3m;->b:Ljava/lang/String;

    iget-object p1, p1, Lr3m;->b:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result p0

    return p0

    :pswitch_18f
    check-cast p1, Lr3m;

    check-cast p2, Lr3m;

    iget-object p0, p1, Lr3m;->b:Ljava/lang/String;

    iget-object p1, p2, Lr3m;->b:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result p0

    return p0

    :pswitch_19c
    check-cast p1, Larl;

    check-cast p2, Larl;

    iget-boolean p0, p1, Larl;->c:Z

    iget-boolean p1, p2, Larl;->c:Z

    sub-int/2addr p0, p1

    return p0

    :pswitch_1a6
    check-cast p1, Loe6;

    check-cast p2, Loe6;

    sget-object p0, Lxxk;->a:Lomj;

    iget-object p0, p1, Loe6;->a:Lne6;

    sget-object v0, Lxxk;->b:Ljava/util/HashMap;

    iget-object p0, p0, Lne6;->b:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lwxk;

    iget-object v4, p2, Loe6;->a:Lne6;

    iget-object v4, v4, Lne6;->b:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lwxk;

    if-eqz p0, :cond_1cf

    if-eqz v0, :cond_1cf

    iget p0, p0, Lwxk;->a:I

    iget p1, v0, Lwxk;->a:I

    if-lt p0, p1, :cond_1de

    if-ne p0, p1, :cond_1dd

    goto :goto_1db

    :cond_1cf
    iget-object p0, p1, Loe6;->a:Lne6;

    iget p0, p0, Lne6;->a:I

    iget-object p1, p2, Loe6;->a:Lne6;

    iget p1, p1, Lne6;->a:I

    if-lt p0, p1, :cond_1de

    if-ne p0, p1, :cond_1dd

    :goto_1db
    move v1, v3

    goto :goto_1de

    :cond_1dd
    move v1, v2

    :cond_1de
    :goto_1de
    return v1

    :pswitch_1df
    check-cast p1, Lpo2;

    check-cast p2, Lpo2;

    iget-object p0, p1, Lpo2;->a:Lg07;

    iget-object p0, p0, Lg07;->j:Ljava/lang/Class;

    const-class p1, Lfgk;

    const-class v0, Lswg;

    const/4 v1, 0x2

    const-class v4, Landroid/media/MediaCodec;

    if-ne p0, v4, :cond_1f2

    move p0, v1

    goto :goto_1f9

    :cond_1f2
    if-eq p0, v0, :cond_1f8

    if-eq p0, p1, :cond_1f8

    move p0, v2

    goto :goto_1f9

    :cond_1f8
    move p0, v3

    :goto_1f9
    iget-object p2, p2, Lpo2;->a:Lg07;

    iget-object p2, p2, Lg07;->j:Ljava/lang/Class;

    if-ne p2, v4, :cond_201

    move v2, v1

    goto :goto_206

    :cond_201
    if-eq p2, v0, :cond_205

    if-ne p2, p1, :cond_206

    :cond_205
    move v2, v3

    :cond_206
    :goto_206
    sub-int/2addr p0, v2

    return p0

    :pswitch_208
    check-cast p1, Lspk;

    check-cast p2, Lspk;

    iget-wide p0, p1, Lspk;->e:D

    iget-wide v0, p2, Lspk;->e:D

    invoke-static {p0, p1, v0, v1}, Ljava/lang/Double;->compare(DD)I

    move-result p0

    return p0

    :pswitch_215
    check-cast p1, Lgck;

    check-cast p2, Lgck;

    iget p0, p1, Lgck;->b:I

    iget p1, p2, Lgck;->b:I

    invoke-static {p0, p1}, Ljava/lang/Integer;->compare(II)I

    move-result p0

    return p0

    :pswitch_222
    check-cast p1, La6k;

    check-cast p2, La6k;

    iget-object p0, p1, La6k;->a:Lk6k;

    iget-object p0, p0, Lk6k;->a:Le6k;

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    iget-object p1, p2, La6k;->a:Lk6k;

    iget-object p1, p1, Lk6k;->a:Le6k;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->b(II)I

    move-result p0

    return p0

    :pswitch_23b
    check-cast p1, Ljzj;

    check-cast p2, Ljzj;

    iget-wide v0, p2, Ljzj;->c:D

    iget-wide p0, p1, Ljzj;->c:D

    invoke-static {v0, v1, p0, p1}, Ljava/lang/Double;->compare(DD)I

    move-result p0

    return p0

    :pswitch_248
    check-cast p1, Llyf;

    check-cast p2, Llyf;

    iget-object p0, p1, Llyf;->a:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    iget-object p1, p2, Llyf;->a:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-static {p0, p1}, Ljava/lang/Integer;->compare(II)I

    move-result p0

    return p0

    :pswitch_261
    check-cast p1, Lgqj;

    check-cast p2, Lgqj;

    iget p0, p1, Lgqj;->a:I

    iget p1, p2, Lgqj;->a:I

    invoke-static {p0, p1}, Ljava/lang/Integer;->compare(II)I

    move-result p0

    return p0

    :pswitch_26e
    check-cast p1, Lfqj;

    check-cast p2, Lfqj;

    iget p0, p1, Lfqj;->a:I

    iget p1, p2, Lfqj;->a:I

    invoke-static {p0, p1}, Ljava/lang/Integer;->compare(II)I

    move-result p0

    return p0

    :pswitch_27b
    check-cast p1, Lcqj;

    check-cast p2, Lcqj;

    iget p0, p1, Lcqj;->c:F

    iget p1, p2, Lcqj;->c:F

    invoke-static {p0, p1}, Ljava/lang/Float;->compare(FF)I

    move-result p0

    return p0

    :pswitch_288
    check-cast p1, Lcqj;

    check-cast p2, Lcqj;

    iget p0, p1, Lcqj;->a:I

    iget p1, p2, Lcqj;->a:I

    sub-int/2addr p0, p1

    return p0

    :pswitch_292
    check-cast p1, Ljava/lang/String;

    check-cast p2, Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result p0

    return p0

    nop

    :pswitch_data_29c
    .packed-switch 0x0
        :pswitch_292
        :pswitch_288
        :pswitch_27b
        :pswitch_26e
        :pswitch_261
        :pswitch_248
        :pswitch_23b
        :pswitch_222
        :pswitch_215
        :pswitch_208
        :pswitch_1df
        :pswitch_1a6
        :pswitch_19c
        :pswitch_18f
        :pswitch_182
        :pswitch_175
        :pswitch_155
        :pswitch_148
        :pswitch_bb
        :pswitch_ae
        :pswitch_7a
        :pswitch_69
        :pswitch_5c
        :pswitch_51
        :pswitch_3c
        :pswitch_19
    .end packed-switch
.end method
