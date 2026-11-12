.class public final synthetic Lonf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:J

.field public final synthetic b:Z

.field public final synthetic c:J

.field public final synthetic d:Liak;


# direct methods
.method public synthetic constructor <init>(JZJLiak;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lonf;->a:J

    iput-boolean p3, p0, Lonf;->b:Z

    iput-wide p4, p0, Lonf;->c:J

    iput-object p6, p0, Lonf;->d:Liak;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 15

    move-object v0, p1

    check-cast v0, Lmk7;

    invoke-interface {v0}, Lmk7;->e()J

    move-result-wide v1

    const-wide v11, 0xffffffffL

    and-long/2addr v1, v11

    long-to-int p1, v1

    invoke-static {p1}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result p1

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr p1, v1

    invoke-interface {v0}, Lmk7;->e()J

    move-result-wide v2

    and-long/2addr v2, v11

    long-to-int v2, v2

    invoke-static {v2}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v2

    div-float/2addr v2, v1

    invoke-static {p1}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result p1

    int-to-long v3, p1

    invoke-static {v2}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result p1

    int-to-long v1, p1

    const/16 p1, 0x20

    shl-long/2addr v3, p1

    and-long/2addr v1, v11

    or-long v7, v3, v1

    const/4 v9, 0x0

    const/16 v10, 0xf6

    iget-wide v1, p0, Lonf;->a:J

    const-wide/16 v3, 0x0

    const-wide/16 v5, 0x0

    invoke-static/range {v0 .. v10}, Lmk7;->O(Lmk7;JJJJLnk7;I)V

    invoke-interface {v0}, Lmk7;->e()J

    move-result-wide v1

    shr-long/2addr v1, p1

    long-to-int v1, v1

    invoke-static {v1}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v1

    iget-object v2, p0, Lonf;->d:Liak;

    invoke-interface {v2}, Liak;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->floatValue()F

    move-result v2

    mul-float/2addr v2, v1

    iget-boolean v1, p0, Lonf;->b:Z

    if-eqz v1, :cond_69

    invoke-interface {v0}, Lmk7;->e()J

    move-result-wide v3

    shr-long/2addr v3, p1

    long-to-int v1, v3

    invoke-static {v1}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v1

    sub-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v1

    int-to-long v3, v1

    shl-long/2addr v3, p1

    goto :goto_6b

    :cond_69
    const-wide/16 v3, 0x0

    :goto_6b
    invoke-interface {v0}, Lmk7;->e()J

    move-result-wide v5

    and-long/2addr v5, v11

    long-to-int v1, v5

    invoke-static {v1}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v1

    invoke-static {v2}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v2

    int-to-long v5, v2

    invoke-static {v1}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v1

    int-to-long v1, v1

    shl-long/2addr v5, p1

    and-long/2addr v1, v11

    or-long/2addr v5, v1

    const/4 v9, 0x0

    const/16 v10, 0xf0

    iget-wide v1, p0, Lonf;->c:J

    invoke-static/range {v0 .. v10}, Lmk7;->O(Lmk7;JJJJLnk7;I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
