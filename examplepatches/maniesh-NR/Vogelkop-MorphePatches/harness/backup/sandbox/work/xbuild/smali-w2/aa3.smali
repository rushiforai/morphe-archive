.class public final Laa3;
.super La7f;
.source "SourceFile"


# instance fields
.field public final synthetic c:B

.field public final synthetic d:Lba3;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Lba3;B)V
    .registers 4

    iput-byte p3, p0, Laa3;->c:B

    iput-object p2, p0, Laa3;->d:Lba3;

    invoke-direct {p0, p1}, La7f;-><init>(Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 6

    iget-byte v0, p0, Laa3;->c:B

    iget-object p0, p0, Laa3;->d:Lba3;

    packed-switch v0, :pswitch_data_7c

    check-cast p2, Ljava/lang/Number;

    invoke-virtual {p2}, Ljava/lang/Number;->floatValue()F

    move-result p2

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->floatValue()F

    move-result p1

    invoke-static {p1, p2}, Lc26;->C(FF)Z

    move-result v0

    if-nez v0, :cond_27

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p2

    const v0, 0x7f0a055a

    invoke-virtual {p0, v0, p1, p2}, Lfya;->c(ILjava/lang/Object;Ljava/lang/Object;)V

    :cond_27
    return-void

    :pswitch_28
    check-cast p2, Ljava/lang/Number;

    invoke-virtual {p2}, Ljava/lang/Number;->floatValue()F

    move-result p2

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->floatValue()F

    move-result p1

    invoke-static {p1, p2}, Lc26;->C(FF)Z

    move-result v0

    if-nez v0, :cond_48

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p2

    const v0, 0x7f0a055b

    invoke-virtual {p0, v0, p1, p2}, Lfya;->c(ILjava/lang/Object;Ljava/lang/Object;)V

    :cond_48
    return-void

    :pswitch_49
    check-cast p2, Landroid/graphics/PointF;

    check-cast p1, Landroid/graphics/PointF;

    iget v0, p1, Landroid/graphics/PointF;->x:F

    iget v1, p2, Landroid/graphics/PointF;->x:F

    sub-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    const v1, 0x3a83126f    # 0.001f

    cmpg-float v0, v0, v1

    if-gez v0, :cond_6a

    iget v0, p1, Landroid/graphics/PointF;->y:F

    iget v2, p2, Landroid/graphics/PointF;->y:F

    sub-float/2addr v0, v2

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    cmpg-float v0, v0, v1

    if-ltz v0, :cond_70

    :cond_6a
    const v0, 0x7f0a0559

    invoke-virtual {p0, v0, p1, p2}, Lfya;->c(ILjava/lang/Object;Ljava/lang/Object;)V

    :cond_70
    return-void

    :pswitch_71
    check-cast p2, Ljava/lang/String;

    check-cast p1, Ljava/lang/String;

    const v0, 0x7f0a055e

    invoke-virtual {p0, v0, p1, p2}, Lfya;->c(ILjava/lang/Object;Ljava/lang/Object;)V

    return-void

    :pswitch_data_7c
    .packed-switch 0x0
        :pswitch_71
        :pswitch_49
        :pswitch_28
    .end packed-switch
.end method
