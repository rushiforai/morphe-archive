.class public final synthetic Lntj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:F

.field public final synthetic c:Lmqh;

.field public final synthetic d:Lopi;

.field public final synthetic e:Lkotlin/jvm/functions/Function1;


# direct methods
.method public synthetic constructor <init>(FLmqh;Lopi;Lkotlin/jvm/functions/Function1;B)V
    .registers 6

    iput-byte p5, p0, Lntj;->a:B

    iput p1, p0, Lntj;->b:F

    iput-object p2, p0, Lntj;->c:Lmqh;

    iput-object p3, p0, Lntj;->d:Lopi;

    iput-object p4, p0, Lntj;->e:Lkotlin/jvm/functions/Function1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7

    iget-byte v0, p0, Lntj;->a:B

    iget-object v1, p0, Lntj;->e:Lkotlin/jvm/functions/Function1;

    iget-object v2, p0, Lntj;->d:Lopi;

    iget-object v3, p0, Lntj;->c:Lmqh;

    iget p0, p0, Lntj;->b:F

    packed-switch v0, :pswitch_data_b2

    check-cast p1, Lve1;

    iget-object v0, p1, Lve1;->e:Lt0g;

    invoke-virtual {v0}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    move-result v0

    invoke-static {v0, p0}, Lxvg;->m(FF)F

    move-result p0

    iget v0, v3, Lmqh;->a:F

    sub-float v0, p0, v0

    :try_start_23
    invoke-virtual {v2, v0}, Lopi;->a(F)F

    move-result v2
    :try_end_27
    .catch Ljava/util/concurrent/CancellationException; {:try_start_23 .. :try_end_27} :catch_28

    goto :goto_2c

    :catch_28
    invoke-virtual {p1}, Lve1;->a()V

    const/4 v2, 0x0

    :goto_2c
    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    invoke-interface {v1, v4}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sub-float/2addr v0, v2

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    const/high16 v1, 0x3f000000    # 0.5f

    cmpl-float v0, v0, v1

    if-gtz v0, :cond_4e

    iget-object v0, p1, Lve1;->e:Lt0g;

    invoke-virtual {v0}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    move-result v0

    cmpg-float p0, p0, v0

    if-eqz p0, :cond_51

    :cond_4e
    invoke-virtual {p1}, Lve1;->a()V

    :cond_51
    iget p0, v3, Lmqh;->a:F

    add-float/2addr p0, v2

    iput p0, v3, Lmqh;->a:F

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_59
    check-cast v1, Litj;

    check-cast p1, Lve1;

    iget-object v0, p1, Lve1;->e:Lt0g;

    invoke-virtual {v0}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    move-result v0

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    move-result v4

    cmpl-float v0, v0, v4

    iget-object v4, p1, Lve1;->e:Lt0g;

    if-ltz v0, :cond_92

    invoke-virtual {v4}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    move-result v0

    invoke-static {v0, p0}, Lxvg;->m(FF)F

    move-result p0

    iget v0, v3, Lmqh;->a:F

    sub-float v0, p0, v0

    invoke-static {p1, v2, v1, v0}, Lxvg;->i(Lve1;Lopi;Litj;F)V

    invoke-virtual {p1}, Lve1;->a()V

    iput p0, v3, Lmqh;->a:F

    goto :goto_ae

    :cond_92
    invoke-virtual {v4}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->floatValue()F

    move-result p0

    iget v0, v3, Lmqh;->a:F

    sub-float/2addr p0, v0

    invoke-static {p1, v2, v1, p0}, Lxvg;->i(Lve1;Lopi;Litj;F)V

    invoke-virtual {v4}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->floatValue()F

    move-result p0

    iput p0, v3, Lmqh;->a:F

    :goto_ae
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_b2
    .packed-switch 0x0
        :pswitch_59
    .end packed-switch
.end method
