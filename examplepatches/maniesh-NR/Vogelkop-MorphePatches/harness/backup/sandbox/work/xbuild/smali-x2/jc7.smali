.class public final synthetic Ljc7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:F

.field public final synthetic c:J


# direct methods
.method public synthetic constructor <init>(FJB)V
    .registers 5

    iput-byte p4, p0, Ljc7;->a:B

    iput p1, p0, Ljc7;->b:F

    iput-wide p2, p0, Ljc7;->c:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 18

    move-object/from16 v0, p0

    iget-byte v1, v0, Ljc7;->a:B

    const/16 v2, 0x20

    const-wide v3, 0xffffffffL

    const/high16 v5, 0x40000000    # 2.0f

    iget v6, v0, Ljc7;->b:F

    packed-switch v1, :pswitch_data_88

    move-object/from16 v7, p1

    check-cast v7, Lmk7;

    invoke-interface {v7, v6}, Ln27;->o0(F)F

    move-result v14

    invoke-interface {v7, v6}, Ln27;->o0(F)F

    move-result v1

    div-float/2addr v1, v5

    invoke-static {v1}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v1

    int-to-long v8, v1

    and-long v10, v8, v3

    invoke-interface {v7}, Lmk7;->e()J

    move-result-wide v8

    shr-long/2addr v8, v2

    long-to-int v1, v8

    invoke-static {v1}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v1

    invoke-interface {v7, v6}, Ln27;->o0(F)F

    move-result v6

    div-float/2addr v6, v5

    invoke-static {v1}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v1

    int-to-long v8, v1

    invoke-static {v6}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v1

    int-to-long v5, v1

    shl-long/2addr v8, v2

    and-long/2addr v5, v3

    or-long v12, v8, v5

    const/16 v15, 0x1f0

    iget-wide v8, v0, Ljc7;->c:J

    invoke-static/range {v7 .. v15}, Lmk7;->p0(Lmk7;JJJFI)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_4d
    move-object/from16 v1, p1

    check-cast v1, Lmk7;

    invoke-interface {v1, v6}, Ln27;->o0(F)F

    move-result v8

    invoke-interface {v1, v6}, Ln27;->o0(F)F

    move-result v7

    div-float/2addr v7, v5

    invoke-static {v7}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v7

    int-to-long v9, v7

    shl-long/2addr v9, v2

    invoke-interface {v1, v6}, Ln27;->o0(F)F

    move-result v6

    div-float/2addr v6, v5

    invoke-interface {v1}, Lmk7;->e()J

    move-result-wide v11

    and-long/2addr v11, v3

    long-to-int v5, v11

    invoke-static {v5}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v5

    invoke-static {v6}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v6

    int-to-long v6, v6

    invoke-static {v5}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v5

    int-to-long v11, v5

    shl-long/2addr v6, v2

    and-long/2addr v11, v3

    or-long/2addr v6, v11

    move-wide v4, v9

    const/16 v9, 0x1f0

    iget-wide v2, v0, Ljc7;->c:J

    invoke-static/range {v1 .. v9}, Lmk7;->p0(Lmk7;JJJFI)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    nop

    :pswitch_data_88
    .packed-switch 0x0
        :pswitch_4d
    .end packed-switch
.end method
