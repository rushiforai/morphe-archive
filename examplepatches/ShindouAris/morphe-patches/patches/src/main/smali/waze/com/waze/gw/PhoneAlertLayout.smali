.class public final Lcom/waze/gw/PhoneAlertLayout;
.super Ljava/lang/Object;
.implements Lg/h/a/q;

.field private final scale:F

.method public constructor <init>(F)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput p1, p0, Lcom/waze/gw/PhoneAlertLayout;->scale:F
    return-void
.end method

.method public static apply(Landroidx/compose/ui/Modifier;Lcom/waze/ui/k/ay;)Landroidx/compose/ui/Modifier;
    .locals 3
    invoke-virtual {p1}, Lcom/waze/ui/k/ay;->j()Lcom/waze/ui/k/ad;
    move-result-object v0
    invoke-virtual {p1}, Lcom/waze/ui/k/ay;->k()Lcom/waze/ui/k/ad;
    move-result-object v1
    invoke-static {p1, v0, v1}, Lcom/waze/gw/PhoneAlertBanner;->scale(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)F
    move-result v0
    const/high16 v1, 0x3f800000
    cmpl-float v1, v0, v1
    if-eqz v1, :stock
    new-instance v1, Lcom/waze/gw/PhoneAlertLayout;
    invoke-direct {v1, v0}, Lcom/waze/gw/PhoneAlertLayout;-><init>(F)V
    invoke-static {p0, v1}, Landroidx/compose/ui/layout/LayoutModifierKt;->layout(Landroidx/compose/ui/Modifier;Lg/h/a/q;)Landroidx/compose/ui/Modifier;
    move-result-object p0
    :stock
    return-object p0
.end method

.method public static measurementScale(Lcom/waze/ui/k/ay;Lcom/waze/ui/k/ak;)F
    .locals 2
    invoke-virtual {p1}, Lcom/waze/ui/k/ak;->b()Lcom/waze/ui/k/ad;
    move-result-object v0
    const/4 v1, 0x0
    invoke-static {p0, v0, v1}, Lcom/waze/gw/PhoneAlertBanner;->scale(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)F
    move-result v0
    return v0
.end method

.method public invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10
    check-cast p1, Landroidx/compose/ui/layout/MeasureScope;
    check-cast p2, Landroidx/compose/ui/layout/Measurable;
    check-cast p3, Landroidx/compose/ui/unit/Constraints;
    invoke-virtual {p3}, Landroidx/compose/ui/unit/Constraints;->unbox-impl()J
    move-result-wide v0
    # Animated bounds are already scaled. Restore child space, then draw once.
    iget v7, p0, Lcom/waze/gw/PhoneAlertLayout;->scale:F
    invoke-static {v0, v1}, Landroidx/compose/ui/unit/Constraints;->getMinWidth-impl(J)I
    move-result v3
    invoke-static {v3, v7}, Lcom/waze/gw/PhoneAlertBanner;->unscaleBound(IF)I
    move-result v3
    invoke-static {v0, v1}, Landroidx/compose/ui/unit/Constraints;->getMaxWidth-impl(J)I
    move-result v4
    invoke-static {v4, v7}, Lcom/waze/gw/PhoneAlertBanner;->unscaleBound(IF)I
    move-result v4
    invoke-static {v0, v1}, Landroidx/compose/ui/unit/Constraints;->getMinHeight-impl(J)I
    move-result v5
    invoke-static {v5, v7}, Lcom/waze/gw/PhoneAlertBanner;->unscaleBound(IF)I
    move-result v5
    invoke-static {v0, v1}, Landroidx/compose/ui/unit/Constraints;->getMaxHeight-impl(J)I
    move-result v6
    invoke-static {v6, v7}, Lcom/waze/gw/PhoneAlertBanner;->unscaleBound(IF)I
    move-result v6
    sget-object v2, Landroidx/compose/ui/unit/Constraints;->Companion:Landroidx/compose/ui/unit/Constraints$Companion;
    invoke-virtual {v2, v3, v4, v5, v6}, Landroidx/compose/ui/unit/Constraints$Companion;->fitPrioritizingWidth-Zbe2FdA(IIII)J
    move-result-wide v2
    invoke-interface {p2, v2, v3}, Landroidx/compose/ui/layout/Measurable;->measure-BRTryo0(J)Landroidx/compose/ui/layout/Placeable;
    move-result-object v2
    iget v3, p0, Lcom/waze/gw/PhoneAlertLayout;->scale:F
    invoke-virtual {v2}, Landroidx/compose/ui/layout/Placeable;->getWidth()I
    move-result v4
    int-to-float v4, v4
    mul-float/2addr v4, v3
    invoke-static {v4}, Ljava/lang/Math;->round(F)I
    move-result v4
    invoke-static {v0, v1, v4}, Landroidx/compose/ui/unit/ConstraintsKt;->constrainWidth-K40F9xA(JI)I
    move-result v4
    invoke-virtual {v2}, Landroidx/compose/ui/layout/Placeable;->getHeight()I
    move-result v5
    int-to-float v5, v5
    mul-float/2addr v5, v3
    invoke-static {v5}, Ljava/lang/Math;->round(F)I
    move-result v5
    invoke-static {v0, v1, v5}, Landroidx/compose/ui/unit/ConstraintsKt;->constrainHeight-K40F9xA(JI)I
    move-result v5
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;
    move-result-object v6
    new-instance v7, Lcom/waze/gw/PhoneAlertPlacement;
    invoke-direct {v7, v2, v3}, Lcom/waze/gw/PhoneAlertPlacement;-><init>(Landroidx/compose/ui/layout/Placeable;F)V
    invoke-interface {p1, v4, v5, v6, v7}, Landroidx/compose/ui/layout/MeasureScope;->layout(IILjava/util/Map;Lg/h/a/l;)Landroidx/compose/ui/layout/MeasureResult;
    move-result-object v0
    return-object v0
.end method
