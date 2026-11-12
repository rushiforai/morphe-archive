.class public final synthetic Lw5f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    .line 8
    iput-byte p1, p0, Lw5f;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lxbf;)V
    .registers 2

    const/16 p1, 0x1d

    iput-byte p1, p0, Lw5f;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    iget-byte p0, p0, Lw5f;->a:B

    const/4 v0, 0x2

    const/4 v1, 0x7

    const-wide/16 v2, 0x1

    const/4 v4, 0x1

    const/4 v5, 0x0

    packed-switch p0, :pswitch_data_180

    check-cast p1, Ljava/util/List;

    new-instance p0, Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_16
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_28

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ll2g;

    iget-object v1, v0, Ll2g;->c:Ljava/lang/String;

    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_16

    :cond_28
    return-object p0

    :pswitch_29
    check-cast p1, Lh1g;

    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "position "

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v0, p1, Lh1g;->a:I

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ": \'"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p1, Lh1g;->b:Lkotlin/jvm/functions/Function0;

    invoke-interface {p1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    const/16 v0, 0x27

    invoke-static {p0, p1, v0}, Lo18;->p(Ljava/lang/StringBuilder;Ljava/lang/String;C)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_4b
    check-cast p1, Lp1d;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_50
    check-cast p1, Livf;

    invoke-interface {p1}, Livf;->Z()Z

    move-result p0

    xor-int/2addr p0, v4

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_5c
    check-cast p1, Lm3c;

    invoke-virtual {p1}, Lm3c;->H()Z

    move-result p0

    if-eqz p0, :cond_67

    invoke-virtual {p1, v5}, Lm3c;->S(Z)V

    :cond_67
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_6a
    check-cast p1, Lm3c;

    invoke-virtual {p1}, Lm3c;->H()Z

    move-result p0

    if-eqz p0, :cond_75

    invoke-virtual {p1, v5}, Lm3c;->S(Z)V

    :cond_75
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_78
    check-cast p1, Lm3c;

    invoke-virtual {p1}, Lm3c;->H()Z

    move-result p0

    if-eqz p0, :cond_83

    invoke-virtual {p1, v5}, Lm3c;->U(Z)V

    :cond_83
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_86
    check-cast p1, Lm3c;

    invoke-virtual {p1}, Lm3c;->H()Z

    move-result p0

    if-eqz p0, :cond_91

    invoke-virtual {p1, v5}, Lm3c;->U(Z)V

    :cond_91
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_94
    check-cast p1, Lm3c;

    invoke-virtual {p1}, Lm3c;->H()Z

    move-result p0

    if-eqz p0, :cond_9f

    invoke-virtual {p1}, Lm3c;->F()V

    :cond_9f
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_a2
    check-cast p1, Lm3c;

    invoke-virtual {p1}, Lm3c;->H()Z

    move-result p0

    if-eqz p0, :cond_ad

    invoke-static {p1, v5, v1}, Lm3c;->V(Lm3c;ZI)V

    :cond_ad
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_b0
    check-cast p1, Lm3c;

    invoke-virtual {p1}, Lm3c;->H()Z

    move-result p0

    if-eqz p0, :cond_bb

    invoke-static {p1, v5, v1}, Lm3c;->T(Lm3c;ZI)V

    :cond_bb
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_be
    check-cast p1, Loag;

    sget p0, Lv81;->a:I

    sget-object p0, Lj41;->b:Lhp7;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p1, p0}, Lalo;->d0(Loag;Lg7h;)Ljava/lang/Object;

    move-result-object p0

    move-object v1, p0

    check-cast v1, Landroid/content/Context;

    sget-object p0, Lmi5;->h:Lhp7;

    invoke-static {p1, p0}, Lalo;->d0(Loag;Lg7h;)Ljava/lang/Object;

    move-result-object p0

    move-object v2, p0

    check-cast v2, Ln27;

    sget-object p0, Lavf;->a:Lhp7;

    invoke-static {p1, p0}, Lalo;->d0(Loag;Lg7h;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lzuf;

    if-nez p0, :cond_e3

    const/4 p0, 0x0

    goto :goto_ed

    :cond_e3
    new-instance v0, Lw51;

    iget-wide v3, p0, Lzuf;->a:J

    iget-object v5, p0, Lzuf;->b:Lzvf;

    invoke-direct/range {v0 .. v5}, Lw51;-><init>(Landroid/content/Context;Ln27;JLzvf;)V

    move-object p0, v0

    :goto_ed
    return-object p0

    :pswitch_ee
    check-cast p1, Lq0j;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_f3
    check-cast p1, Ljava/io/IOException;

    new-instance p0, Lq0i;

    invoke-direct {p0, p1}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    new-instance p1, Lt0i;

    invoke-direct {p1, p0}, Lt0i;-><init>(Ljava/lang/Object;)V

    return-object p1

    :pswitch_100
    check-cast p1, Lcq0;

    iget-object p0, p1, Lcq0;->b:Lbq0;

    invoke-virtual {p0, v5, v4, v2, v3}, Ljf0;->p(IIJ)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_10a
    check-cast p1, Lyj0;

    iget-object p0, p1, Lyj0;->e:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lhh0;

    iget-object p1, p0, Lhh0;->a:Leh0;

    const-string v0, ""

    invoke-virtual {p1, v5, v4, v0}, Ljf0;->q(IILjava/lang/Object;)V

    iget-object p0, p0, Lhh0;->a:Leh0;

    invoke-virtual {p0, v4, v4, v0}, Ljf0;->q(IILjava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_123
    check-cast p1, Ly8f;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_128
    check-cast p1, Lrjf;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_12d
    check-cast p1, Lm1i;

    iget p0, p1, Lm1i;->w:I

    const/16 v0, 0xf

    if-eq p0, v0, :cond_13e

    iget p0, p1, Lm1i;->a:I

    const/high16 v1, 0x80000

    or-int/2addr p0, v1

    iput p0, p1, Lm1i;->a:I

    iput v0, p1, Lm1i;->w:I

    :cond_13e
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_141
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    return-object p1

    :pswitch_147
    check-cast p1, Lt9f;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_14c
    check-cast p1, Ls9f;

    iput-boolean v5, p1, Ls9f;->i:Z

    iput-boolean v5, p1, Ls9f;->j:Z

    iput-boolean v4, p1, Ls9f;->f:Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_157
    invoke-static {p1}, Lsko;->g(Ljava/lang/Object;)Ljava/lang/ClassCastException;

    move-result-object p0

    throw p0

    :pswitch_15c
    check-cast p1, Lk7f;

    invoke-virtual {p1}, Lk7f;->Z()Z

    move-result p0

    if-eqz p0, :cond_169

    iget-object p0, p1, Lk7f;->a:Lj7f;

    invoke-interface {p0}, Lj7f;->J()V

    :cond_169
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_16c
    check-cast p1, Lzg0;

    iget-object p0, p1, Lzg0;->a:Lyg0;

    invoke-virtual {p0, v0, v4, v2, v3}, Ljf0;->p(IIJ)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_176
    check-cast p1, Lrt0;

    iget-object p0, p1, Lrt0;->a:Lqt0;

    invoke-virtual {p0, v0, v4, v2, v3}, Ljf0;->p(IIJ)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_180
    .packed-switch 0x0
        :pswitch_176
        :pswitch_16c
        :pswitch_15c
        :pswitch_157
        :pswitch_14c
        :pswitch_147
        :pswitch_141
        :pswitch_12d
        :pswitch_128
        :pswitch_123
        :pswitch_10a
        :pswitch_100
        :pswitch_f3
        :pswitch_ee
        :pswitch_be
        :pswitch_b0
        :pswitch_a2
        :pswitch_94
        :pswitch_86
        :pswitch_78
        :pswitch_6a
        :pswitch_5c
        :pswitch_50
        :pswitch_157
        :pswitch_157
        :pswitch_157
        :pswitch_157
        :pswitch_4b
        :pswitch_29
    .end packed-switch
.end method
